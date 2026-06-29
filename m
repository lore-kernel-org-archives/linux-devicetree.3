Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125D33B961
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729260; cv=none; b=X/jjw2yMLcH4OvUQAMTBePh2Rfigyq2aEAD9I+/RVHYrXqSUdtVYeb9k/T8uut4TLOH8x8hDlaHZRBi0mi8DJc2l6FwkrOEcOW+zGXZLagbTQC/IS3EdeE4c+dOOxe3z0cY4xJv515rzmG3G/eRrfVp5RqdNORglIAMwE5FtG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729260; c=relaxed/simple;
	bh=O7k+YKlCUgne8sQca2M+WCEzkz5Cqo5yJXcu0TM/sGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B057ie/8BUMmpewLJB2GNtnU/ALq6C0jLY1b1RrJ0TpI15O5VZgvhglGZ70GVbsgXLn7DbOJZP7BlhqhvhBCAkKYhPiYo8GP3A3YZi0vQ9ixqapjZsF1XW/7bU6dDLq4DjOJOf97PiyonUSAJ1OL1v2jN+i/Z9e5ZGurKVyeRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9DISo9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/qlPO38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9DISo9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/qlPO38"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3BD2618796
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	We8IfLXw172gbAFTQlf72mWB2mC4Z1ZwwihA6fagoqk=; b=T9DISo9J7j6psLNv
	9DiNxp8vZleQfl3RhHDR60iFKwo45IIdPImrtT4bK9GpYfGsZ8u2EsybeHTD/GvE
	bHDoD5g8hHCwUDhu98o7J5vh86Ge45FPbJY0+p9vwJH7SuY+yOm3krw1O4ncgoJ4
	/og6Gj6WJ3cLm2Mc7SBCyA7wqtDxX72X9iUZ8Qxs9jyjFywBID2v47xNfnO4TNd3
	75hCcxyqd3mkICakMK/kpM28A3j2FgTctGuh+RMQjoeK+Mstkl5x6EfL6R0eVGvB
	T4vNXIJaWigJ86LWKBRUUKMejzVvXlfx1UeupSLAR+XYfhDZfh4dKNrTB1xMiItB
	ERyEyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr5bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:34:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso101295137.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729256; x=1783334056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=We8IfLXw172gbAFTQlf72mWB2mC4Z1ZwwihA6fagoqk=;
        b=h/qlPO38fVN7pZGU12/Z8pH6nbt8pWthZfyWeijTwt6cw3xywYJ1SahGCYr1aAuKpm
         BsJhlHCp/n4ZT38TW3P1XFocvuPvPzoU566cEzOuoKHMDjv6nMailUOG6hslIOpWafW1
         RSqNxBqvCd56tRVbbg/00JvEMCBNnt64ebtmqvySoABCokMFzvHvUGnoCa2nRJG5tigg
         II15I8rTY3Zfm6SVDJ/aWypeoSH87YRKSP+A3XDwg6/z3sOLJ0sfPMAKL61ksFlL3K5o
         tnXq2ePWuGPczDv6kXIqu9Cx3QNwC2Vf/IJow5zPQeK1jEx26rbwfZ8ppxEPgIYvVemE
         iF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729256; x=1783334056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=We8IfLXw172gbAFTQlf72mWB2mC4Z1ZwwihA6fagoqk=;
        b=G2TOKWjFiAKl+kPBCKIpYFkNvOCFv6bBfzKo+T2TAZ57g6IX8XJ7jixAJUXosk8wKB
         icgCMBryNN3FeCRK4pQ9pcetBcfpcBgx2/zVhJpfd1F8UBTKDUL9F30scrBnjVe92OSr
         j7gBaG/vae/EOgcaEizgZLI/E7trQOy7phEOvyS7cR7YPHX177jkMbRAfZqq/JTRjZQL
         TCQNHblccEH5rV1i8AdCmJ1mqcv4lqRaAiY1EYsTSUZooyuGsGQ+5qAcjeApJNBeXTHD
         B1MtotxvUq5Psr3OcI9VbAIrOVLaiZ2zQW2Zl+KvGd4EvMI1eW5T+Uj3/I1DZzfpTIwz
         ThNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Yg3604o6auu306WfCJUzbNBe9F9GdsX9lQCe6u3TAT/5qIZdN0hfRY+nnSMqFkSMDDHCSr1wczPs@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhFnqVUzpu3l7DQ0wCtx9A/4AHEHDSGxTj3MQ84DO1HlZQR93
	TId4RH1fpkga9puZPHQp5Y0S9I6PnqsjgckA4yPTY0YyZpDYO2u7LPl3wwzLoJn+yGndF/bvLCT
	dz6FSmn8tWc7iyDvlTEXCkD1s3F7eyinPZz2mMmOSRNaPTule815NBH2qK7XMaoo4
X-Gm-Gg: AfdE7clxZzn62gq0P5xOv1hKHSbhVBt/qVvMXKW0o33Y4iMb74RONEPsIy4MWre5X35
	0aaE7Boz4PNLphpVfk+Mw9/uq6bmPs+4A66bWDI/bDUtIjzDuHOlZKLZAuXAiBGV5U4aap71/Uk
	nf/iiVt8VFIqiANIW8wYR66BAaITS01CDqV/5aJd1nYBTM0qU+6SyAZRHtZDnpR8kJYoJNYV6zc
	p2zDr2l2n2d+N1VI8yoPiFXoQj5qUHMCHn7UEa6/3gjh83dEv81ycG8Nxg4lfGStZyUwZv/Kc37
	wt33A6JEN1h3fE2Alo3zbgmp4Xri/alJaAX1j+Jmi4fIl8KJvYyXa3Tvgo5qjC2+ZP2iKqQowkA
	YP6h9g5O6TNhPllMI8V5zXL+qCzsQG/gKJmM=
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr2311958137.5.1782729255776;
        Mon, 29 Jun 2026 03:34:15 -0700 (PDT)
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr2311943137.5.1782729255151;
        Mon, 29 Jun 2026 03:34:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aeb509sm6698546a12.10.2026.06.29.03.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:34:14 -0700 (PDT)
Message-ID: <8e4ea76e-f1c0-4dfd-8477-35e01ac0ba0d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:34:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
 <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a424a28 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h4iy993FS52baA_BjO4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: wgnsknFQiS5BDd438ZPHwCt4KtjWsQ34
X-Proofpoint-ORIG-GUID: wgnsknFQiS5BDd438ZPHwCt4KtjWsQ34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX6ksRaQmJNAWq
 OM3/67PEAEWWVAYMB9uX4SYZPYMfTXMnTzf1npLX1AcJ3uJcg/4/Vn9EW0GzSYzdUXfCTEJUkao
 5jyPCGm5XeAmmiN2kCFZcM+nImsCAu58z8i+fVMgH0AGUl4HcXq1pCSZ4KsaRzmS2pPaVq3YXWZ
 jttCDnY1hlGr+8XhirHdy/jqZsWNhT+0FBcwjnbILkzXk2c4LTl5B3x4v0ZTLg2VCtJirTmxIVw
 1tV7fDcKb8OkUwJX+LIKrD3MgegxNChksWL42OzweXJIVXQMfkHkk9Gtc0TwgGhI+ODat4cSgZL
 gWKrIB+KfxtNLG1WQ0V8teNZ/CN1pSSr4jx+ntSNkOLI+D4jOJLRL0nGQoP3CsgjNL3AMd7e61n
 D+HnSWkEMx56FgzRwR55v3ITBef9mgNExvGlRivuYUPTu2rEbMRt1G4UGwxEzoYck1iDaD1Zjen
 gWYB4SJY8M0gYz8UO6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX7UepUD9EHvtK
 ug2n1+OyjowZoB1cbpZNPGIdG/1IerYE9r/oU9A/2X60DOeHB1dtNmN8DHKImnSHlFY4045qNUZ
 C2du2eU58xc9aB8mXswFYrphcCGto68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290085

On 6/22/26 3:31 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
>>> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
>>> LDO supplies for the PCIe clkref paths on the CRD board.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
>>>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
>>>  2 files changed, 19 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>> index 9c8244e892dd..8b42f5174b31 100644
>>> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
>>> @@ -19,3 +19,18 @@ / {
>>>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
>>>  	compatible = "qcom,mahua-crd", "qcom,mahua";
>>>  };
>>> +
>>> +&tcsr {
>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
>>> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
>>> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
>>> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
>>> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
>>
>> The supplies are correct, but QREF uses refgen4 on Mahua
>>
> 
> The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
> think rename the supplies as vdda-refgen4-0p9-supply is better?

Ah, I overlooked this. Maybe 4 could be better here, since the supplies
that end up being assigned there match what we call refgen4 on Glymur.

But there's no good answer, both options are terrible. Let's add a
comment somewhere (in bindings?) describing this mess, perhaps like:

# On Mahua, the REFGEN4 block is supplied through pads named REFGEN3

Konrad
