Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3D3DE441
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419835; cv=none; b=q2KHnKoE64GormmpL+HjGQI/sYre2O0s82ba6fUyl/hpnzs4tCGstV9XaSJAiDZcGW+F37tGzFQtqwGA/U8LVnr4zhIwx0MoIt+/uHRYAhQGC/MkopNCYSLEyfHnrBji7NMYApoHpmlzDDnzmWS/QV8xKOB3zErRUK2za7keNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419835; c=relaxed/simple;
	bh=4ql2aTLdhYhZ6orCH6CMUqpfN4KwBk6Tludnd5w6p4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlxlBOol0AA073gq6BYXKOMeVxyZnMCtEvj7UelbcWbpGw4KQzTjqIlKT4CwdSkHj5BaaVoHdzDYz72kuD9O4FQv5Bcs7WgSJRY2nQER6+wYClf1QgvV0r8pBdvNf5jvAjAWMDPaHk2Z9dftMaAfEJsUAb9bTtwYEHrNwP1YzXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDYQnoVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAeorjhH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDYQnoVY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAeorjhH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E7VB3184227
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4dfETx7wy6dus264yK6oxX9SFN/B4VI6pXBXwK5j9A=; b=kDYQnoVYJCYORkLD
	oOr9oWCBUhxhXctLUKSFd4wJcPASPUehnrDi+eoAkArR6lcErMEQO3vOAsvOpoBL
	GeGYB0P9YOc58EHCvfM0En/EfJxd2b59pJ5e83eYUIH3IOhovvUWBF5Lt3wWO70l
	V0OX6ADD46av2Q0AFmPMZSL+IATsyaiYKImemLniSCeCCeabRBhtWDw9jNgIltlR
	cjXWFFJj/F5CsR3dZbZiIOWjxQtXLAJEMbsLdQ5TaeEEMI82dcMJO5J7bARbLmzh
	H1SdZwl6erbiMm/2LI5BsUWLFXVM853drP0XG6jEoM+Z/vM2DqffAq3E5sXuIgMT
	V2eU2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8ywb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:23:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5110c89eso25536985a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419832; x=1784024632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4dfETx7wy6dus264yK6oxX9SFN/B4VI6pXBXwK5j9A=;
        b=LAeorjhHpcZos78+5tpsanY84YjdsMvlMCuKqPkS5gRgl1oqYAQRCJxSBgqiJr7HNs
         Mn+bn2XQr/0LQKan1zQdFgV6WJKM8/1Fsle2VpBojNPAAy7J59eTPYWNKgUi0SqoFKp+
         psTRjx2ftqxrgF2Qpz7ECHx3sfoEAczMR9yBtnlSwMGF8/bgJ+7SOO/xMzPJ/jf1UVZz
         +4mXFBJ014KjggiXVfpmnTmZLhwDs3Sn+aPuHN8PdsmrfPHS2/vySda0GpiGbEGB5GJz
         oGNs1QtaG0zBxNBgDzZyQiUBVrzOIi/zfp2aK062AtVYL0r0+fB4kF2+E+v3olkYRdlY
         t3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419832; x=1784024632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4dfETx7wy6dus264yK6oxX9SFN/B4VI6pXBXwK5j9A=;
        b=Sa7KwpXmN+91/mCrug6WJn7OsFSPlkCwh9yXvKC48h0fkPA8/KgS0puNrw4TsdInTw
         Q2MnQNohSxw7A1NdjUVGrAv5bc4HdMw2FflKqT6aNmsecqUwF2YXgNbJDsb45LWjDZUT
         WHnFPndi6Yk6iMuhyDqDrslYqV8HX0elSlaCajYZ+aAjPKn/JQCax5pF6hQ34QySyeRQ
         AFuFuTUmcGufkBo+u+YCBJJWe6Q4K7lab6LhS+7mn1c1qWOPUD+bqbx8Ux0kLF1fDsCr
         VUTBJJKWhUgJOQuyO9NfnOrTQtJCNmBJLiRhaqvNISUBpV9NFVzFN9gE6oGv2NCWErXF
         4g+w==
X-Forwarded-Encrypted: i=1; AHgh+RodeP3RTgneTsbcqJ6wqwdwAR/TWdRwlu/2FD4CgI0VmeP3rBJMgZQFSB4eP1iU5M7vuxwPh/2PGoI5@vger.kernel.org
X-Gm-Message-State: AOJu0YyFRr8ChDFLBqx+ORs/F8VsoOTFsaU/XWOOJwk15d3ZanyYcE7n
	ymOfTEEqTWZIewoctS24Wfv9h2jF8q+Zy9QWKUcLp9mSNzCSNlG4iz0AJ/NnE9iqmsSeSkxYkL+
	TRGUUYO4yFHnrvLQnSGaPfnSeAInYia7BzBFE0VK0NjaiaMp/zInHWWGnfqFbL7IX
X-Gm-Gg: AfdE7clZ25Cj4s92o9IYs9VGsOqCHTL4e9e6U6Wi9IibunFaWEvu+D1lv8fTUwQcgsk
	G9RiMICL359gfLFXup0rSbOs30RvZFLKniHlDFTxgxxxZcbQtCk8u9JQgsbgUl5Id8hkibYNX70
	pHoclKdv76oxAPpBQI/Vn294miDoG/Fc7Z1BSe5Cxp8lqfpe0/yFWm1bNGh/z0UM0CmR8SQEw3C
	WyX3RngBlyyzn+vt7oPGe7S8I7MnUHE6bRezXGLhtQyn5Nmd6K+XzcSX64HCp8NLtEqKiHK9xAc
	xEAsgLEwm/nauyn8FqJjeWy03OUkfKb89YbDKW54Logj6Hxhd0iqKoWftUZSnMexWtQGeqrKLFN
	TKNPrQIhCql2mRiV/mPii5Wvu5J5AuAcpQuY=
X-Received: by 2002:a05:620a:6486:b0:920:798b:e28e with SMTP id af79cd13be357-92ec052b554mr164194285a.3.1783419832462;
        Tue, 07 Jul 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6486:b0:920:798b:e28e with SMTP id af79cd13be357-92ec052b554mr164193085a.3.1783419832032;
        Tue, 07 Jul 2026 03:23:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9be41esm101778966b.39.2026.07.07.03.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:23:51 -0700 (PDT)
Message-ID: <605e256d-711a-4b47-a8ab-002ae8cda1bd@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:23:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-evk: Add support for USB and SD
 card
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jvXeHnbb1hOcPjcmGVvAm76Vkt3UO5nC
X-Proofpoint-ORIG-GUID: jvXeHnbb1hOcPjcmGVvAm76Vkt3UO5nC
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd3b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3552hqOxyuVABoCTLpMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX0nM+qXMYjXii
 s2NcOwfGQw/9IsXBh79bM9mYoZBmsCoovYUby5lx5B8Ig/rYOuM5qG6pYHfAXW7AYoSAuQhBcYl
 3rcASOlCIiXXV18gW0b9Pdhs+EUfM8sNxcxQ6kKvugtO/Bk6lZPpwK3WwwjglVxdbMXKUYtIqGP
 0KL5ttXRmOGsP0f4GlcRYqScdFofFovZC81c1rjozmLl3HYUA63tVg+jDySzaEv5tP55/MK6Wsv
 ZaM6BGbI4Bbbg8Hc5MtCDqEA9aVAPN5kdoBRTz6GlxacbArSIw8hnkz1Kr7W74DlO0djL5ZeQRq
 Zs3oAE5FeO84xi9FudaPbRFoOR4PEt2rGN6DXsP/KtcmB5iuNv1JEqJx+x6QxSFko+HRtZshLyw
 i4Os3au00EzGp+dvT1+J+WwQmDa+Ly+1phR/RL6KvfLDPtuDC/uoSbm0KeXB/qgJjAvzvoOPZnp
 m6R8Mpx+ABgo23WVN7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX3fVq5e9FeJwy
 4Nexe+tq5a5lCb0eXEntqJ4cMoQ5uK7f7xhREAXzOvCjg2EcMGZs9KvDpxgaxj21A0bRKTbGylt
 X1BQHLEpUeZF3H/9vJp3QN+LvkPWoXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100

On 6/30/26 1:04 PM, Abel Vesa wrote:
> Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
> one USB controller and a single set of PHYs, which are connected to
> the port marked as JUSB.
> 
> Also, the EVK comes with an SD card slot.
> 
> So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
> supplies and enable the USB controller.
> 
> Also enable the second SD host controller, describe the card detect GPIO
> and the board specific supplies.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
