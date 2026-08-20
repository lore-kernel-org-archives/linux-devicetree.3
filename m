Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BCA208D0
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212031; cv=none; b=iCcFaZULmFD+UbLjKu2C5K4MLx6VAwcG8ZO/qxN7OvrWd0917+CHjfljBO5KEEerT4uTibIlWhUKlY2ynSs15bFQf9TlX3Yl7EPcTvwSLO0/dLy1CC7SAa2IrtOM1uHjP8mi5TtnUuNa7OZBZLR4s5vnJLl4d7z6/bhqtCwHL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212031; c=relaxed/simple;
	bh=iR4tB0fiVZKGoE4zYBYm9nHM8yujg8vehtjMdIX+LeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL2Z7DwvcbgUJUhgKCtGH+kdjKUJDKdkKo3nYKRoNWKW2Q640boqPBDjTlVeFPTfQBFe9Z/dqvOfeoIv8HQEBdFoTPkjl7D/VcOc2fwlm8M9asqxVn6qoPG/85ffGjS/s9DEF/CgcRaRkDLGq8QYoTSdzRGIjR1LcNgCcZC880I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agAReysm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IL6U10LX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agAReysm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IL6U10LX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6n9kN3732257
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=; b=agAReysmKjIortik
	PpCcf6FrLsBAFvE0L36aRTnWYqI+2R+0kYuY77jU6VmYzah32kclW2u3mzNnW8OX
	M4+9abOckXZ1aVh+cheNvogAjrVtl5op3ScbA0oxs18pLFQwmFZE6u51IDK3nA0V
	AG+BpfPw/uMiNl8Yigark5SmCr0wq6OIJNBtOFYchSOdgDrWOYtfRm0wgHhG8P0F
	Nd7f2l8UBeQtWDILlHMdk5SsvsbCe5cdm/C7McjEZwwhXr74nCvTNoZUMehQUS8C
	CGb+yjf1tzdvKdaGaJCxvSQ0UEV5ECe7kaMsaZgJrhH0B1p1NOSSnOcAR84qe4Wt
	87Yieg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn886rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:47:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4e6517e9so36066926d6.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787212026; x=1787816826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=;
        b=IL6U10LXfNFvUKNjV2RF2Q0g3L3nptPNwKdC7ihMyTu53QGoqziJEL65t6tvO2YZPM
         kVTwMhJHBQMyDgavB5+meIYwZ+Zwg1F3pckDsN5Tdm5WtMa8z2AGzNdRtVMG0WZivsSv
         kPYeOzXKD+0ZBkrdhbDq5T87VnDkeNMFvjJKTAnFsgJJAdQQ8mB/AfwaOq5g5GpOi/jC
         feaAW3M+vHSDbB2b4KXOzcovTDgdXYBcKjyN5nTM93rPMtL9g/Xl4PB8vU0EAIahpmEr
         aN3Hq3SSBA0S0YrW85L1/ghu4/g2ur2bqHaafqR1DFZ0nYrNGESaujfkExqM9ulmtpp7
         PTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212026; x=1787816826;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWemyG4N4ylx8AJN2NYbSRutWHMPkhp+MiTGTIekUm4=;
        b=JilES00LHyEojxgUpzsF5DDk8z8GBmKQEkvEGdXXHSqShSYBkPcs9x0ns37ZAEg1or
         eK26AC5PGbUYIDK5G1tgcFU1En/1EILqmHB3si+Qv6WrulXb/HFYIs9kstViffbHGET2
         avRAT54JhFYY3JDuf0B3imsxsT8l4X3OYPRJ1FSap3A+2+vdhbsoeqHpHJTvXf7huPuS
         1kqjsooiZ6vFP+6q3d/deTZvW8hyRdfse6GDlFb+wA/0N0kjcUn6wPz5BcQEJWjb/fMe
         FiuW1Luw5eUjqJm4h1gvy7Z8XIQyrtSmzmB7o2p+y/JrjuPObspeQ7vVOKmMyOFUykvi
         YO1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpPqd9LGQvl/ubh4yxTsnqIWle28axiTSUJ4Gv+dT7M2qf8uWUT7LWgmmXJACmiYefjO5eaRlhFoaJv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05EjjcL9v/sqr/ZMbkcqFMlISAYdUGcBQemsXTFtf/wnEXkK5
	9abkCD5wIfvpx7VI6WmIUrhwJg8JdEoyUWPgwiIuZkVfLNjRG1FtQ4owoAKkmBIsI8B4RXEdMiT
	/6AQOIB9ytYCYnAxKSzCwgKKZKhjFc6DE4kto6+CZ8I6Fw5jrv+Cb2Bvf6rByWifC
X-Gm-Gg: AR+sD11Rrxxtpb6H5loypRpFvIZf/YVYadVN0SdolzfkVCPNKJRpV7ISE0O3IizI9iA
	bydxHMPc5jXB/rdcXNIOKL/7KoSDQ+MevkwQBzGB5pEU+3KawQUoTbDjGk9UEqHDFbpRAeUBG97
	vj9j0VyPSw4Ruhkd+HKUGwIjAqK229kTJ/lNVNLtc/kJuNiAJBwKYlGuo/zyA1nKLNvv1VsFEs/
	pDI+FeY/aQK2Arbw/E6JvGDXRTm4BPhz/y+zye0JCFt20jRHkCoDg74Fafff6EVEcKOkUc7bdzD
	VIGa2oj+KXuE/uZ87qwUfX8cVmGiiBpd1o8miF+P7oABfnFN9o3jh2ymV9+aUIQ3uFEbESfTOiF
	EA2uU58ebna/a0JPBWiiH14g2ESxe
X-Received: by 2002:a05:622a:2b4b:b0:51c:a70:5ed with SMTP id d75a77b69052e-52dd5c9313dmr98105221cf.30.1787212026517;
        Thu, 20 Aug 2026 00:47:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2b4b:b0:51c:a70:5ed with SMTP id d75a77b69052e-52dd5c9313dmr98104821cf.30.1787212026125;
        Thu, 20 Aug 2026 00:47:06 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0dd5fcsm133844445e9.14.2026.08.20.00.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:47:05 -0700 (PDT)
Message-ID: <0f8f3d24-41ec-4878-8182-c805c7db7c23@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:47:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
To: "Rob Herring (Arm)" <robh@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>
Cc: linux-kernel@vger.kernel.org, tomeu@tomeuvizoso.net,
        p.zabel@pengutronix.de, ulfh@kernel.org, will@kernel.org,
        conor+dt@kernel.org, chaoyi.chen@rock-chips.com,
        dri-devel@lists.freedesktop.org, zhangqing@rock-chips.com,
        linux-arm-kernel@lists.infradead.org, joro@8bytes.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        krzk+dt@kernel.org, alchark@flipper.net, ogabbay@kernel.org,
        royalnet026@gmail.com, diederik@cknow-tech.com, robin.murphy@arm.com,
        heiko@sntech.de
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
 <20260817113603.1436067-5-gahing@gahingwoo.com>
 <178709455518.1014304.1443906758035976924.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178709455518.1014304.1443906758035976924.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1NSBTYWx0ZWRfX7upZnWSy4yVJ
 qvlJxxvRXtTAggCHvbcHKWCSXQB4DDZ/QZKnPQfaXJx814hHLnkhMMYM3IHEJ6Ddid0ch7bS181
 yQU73iyxUMqJgiwrMXmsoiHX/49xwCRt0RN06GvXPA+vL9T1QdYujZPkHkWmorycBfuWLHigTIn
 Vn9strzmFgXPqq7PVrmXUjT+nCaTF+NcAYsx68+zCuGIwprMwcCbYatiVuqa3bgS95zXlQ5jLZR
 JnPTdN6alFI7GFxMJr5GTvpBTnItZRi9fw+NGHBOBrW7QdLZfbagMraHv4pC8c9ss9162eBHOtU
 uu3qLx25lA4AdHDtQVVR1+lS+XDXPMEDo6RFIGDPDehSebl7FFKmvrlh2HMMmRKg1UHd953CulR
 LPpL+JdiXk76Ig1L8nIff8/Xmy/xuG/RvQdEF0C9gfu125Rs0d0b2MKG5yF9W7Ii0D//YfTvJO4
 J3TrZWgKuuiwpV7+EwA==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86b0fb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1NSBTYWx0ZWRfXzHVRqm+I46zi
 5hGRap2//xUXNjRJFWBxMJl1aUxE1RLDbSeZs1wfJrSkW6mYEasql8k2UaWO8chLv1kVBhvld15
 zwMipvjnHd4cDdcsUJyZ+4CKkK5ZjxE=
X-Proofpoint-ORIG-GUID: wqCrFv1j3RrjAQ4dpZKQwwUL1y--6zMk
X-Proofpoint-GUID: wqCrFv1j3RrjAQ4dpZKQwwUL1y--6zMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200055

On 19/08/2026 01:09, Rob Herring (Arm) wrote:
> 
> On Mon, 17 Aug 2026 23:35:55 +1200, Jiaxing Hu wrote:
>> The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
>> already describes, but it wires them up differently: two extra CBUF
>> clocks, two power domains per core, and a single reset instead of two.
>> It also has no NPU SRAM supply.
>>
>> Widen the property ranges to cover both, then pin each SoC back to its
>> own shape in allOf so nothing loosens for RK3588, and keep sram-supply
>> required for rockchip,rk3588-rknn-core only.
>>
>> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml: Unresolvable reference: /schemas/input/qcom,spmi-haptics.yaml#
> 
> doc reference errors (make refcheckdocs):
> Documentation/translations/pt_BR/process/security-bugs.rst: :doc:`regular path submission </../../../process/submitting-patches>`
> Documentation/translations/zh_CN/how-to.rst: Documentation/translations/zh_CN/xxx.rst
> arch/arm/xen/enlighten.c: Documentation/devicetree/bindings/arm/xen.txt

Most likely false positive due to other things in the kernel broken.

But just in case - be sure you tested the bindings.

Best regards,
Krzysztof
