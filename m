Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3B3A6EF7
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386046; cv=none; b=PVPpEYCFUMXkSxsZIvt2U6NAehjbcVlLg6+SFVuAHbgBL6IS574mrYecack3XByUIKYvnYghWlI0w9mtOkEyvpX6rzuoUBvqYV5nZ3EheTxhBdpAovNtSf2Q6dYZTDiBtAS0Zbctjise1HKebD64yOHvVF8JPhMXrKpAMLiYEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386046; c=relaxed/simple;
	bh=BvAeSXFcaEHMYDX/aHwX+oC//m2Whag4iOOItU+Ua5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsRBSWMk3Skh5yWrb79okTDXa8ny3Rhk9Sw0OGS6fNR+p7UAXg3P3dfyM6K/D+atG8A9C+yngvZMdrFmytHMw3lA0OvYVKsRh2biTSAd3HgioEwKHn5NYaB3gHlx3crdm2ybrPakgg0/lcUxwEPRqjONRiEkUG9NC3rbkEKQ6Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2r2GSFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBTXPJvs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2r2GSFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBTXPJvs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xrHn3666697
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixgFaWMtTepO4gLbmMMX38vNztEM0kATGrTcu9nPZVM=; b=c2r2GSFVGGMzmj30
	PmvPuhHwEiXt+HcTHPEgUYurPsG2/3X9EAJSeQN5kVp+IBaQ7r/FwhG1T1JwGpuF
	Tb5zPTorio1D583PW8LAbgBQV5+gMWrywMNbAM8VocmB9pf/4ufyOmUmwPah7Kza
	wWk6D7ysTnYjpmsHa7Q0Smlq5SIUr+pdgMGicWSgaA05Dmc8AG4cZVAtqtuIr3hU
	gw7hksaZp2zcF13HgvGGHE6jnfP30KGsYxA7oBSLnkFHa/mazlAo8DsSNjltju7P
	r4bSjU6S96QdKUnHUqAY/8FuWOzGhufRByD7SLjdRtXAtOrtsn9svMcBXztYeWRR
	/1Sbfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qrgu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:07:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so19704581cf.1
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787386042; x=1787990842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixgFaWMtTepO4gLbmMMX38vNztEM0kATGrTcu9nPZVM=;
        b=CBTXPJvs0NLHuoT1lNCcaJ8+FkagNxTyYhxEgIc2PkaGXLepMqe/0uKqFrhRyNTQyU
         SOVmGsDZP79knND92t0R4Lr9DfqUo9oieSr/BVLYUfg4alzCXsypjnoAz8svsV+Dtwi9
         SSgmH7sTnAdE0t+scbS9Umtydtkxt5QXxDvg7DG9gM5zDt6d8Ma4b8grnFejl8LC2PP/
         GxFfo2or5+KJNQa8AXk/3UWPAq3diw8L8vI6oOHv3DLvxWWlqKNssNzO0BqMLTuwtbaV
         oYlvcNFLGN3t2BfmX7NOuLKFty9URG0+I56wiuM4X9/ubBC/NX8cPr6Qv2sMwgJ2TPLk
         BDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386042; x=1787990842;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixgFaWMtTepO4gLbmMMX38vNztEM0kATGrTcu9nPZVM=;
        b=r07jfhtbeqoAM8I4K0BfYzWJlAh998oIs/3QqI3GTkIpPXsPfjhLurD9B63BfFIH/W
         7ErPx4aAP2jrMK6x7a5CyK56z64UhMY3gHvpPcdy7rTrZTJ37mW4EnSFs5VVHZr5z7FX
         6wNIo71bl+ED1MAp4QQF5HvuzLDCCJJgYT7uhT/+MyBgJLy8ZsWEzJfmiadzvWGPX4P4
         fvC9A5JKmcxYesS6XwkD3HMZEq/iiB2KFj2iVgpkFGrSdMBcG5T1HQzOxAUK3RHK6zsC
         6tCcKD92/hcprZxmoID5lZ7Hlem7jA3aDtDOHiE49jV8GmvUlXD1KNjXxE2ZySSdRORh
         BOjA==
X-Forwarded-Encrypted: i=1; AHgh+Rrlh69Q/KUxVkjnksDfpnjNXgryA2fQMyKE0Fh9qg8xdTi+lZhyiE94lYK4/RLJOhp2Ru9AnKMCx9UA@vger.kernel.org
X-Gm-Message-State: AFuF++lHZn/RNc1coVnYNeIvP6JeWhDCMeEGS0rFq7EMFij8Mq49pbR1
	+pih2vhi8nN64wi9PPgO9JjfDHBlsUF9n2cycim4tkC8Ynb0+pjtKGGEO2Ewcnv3lMHFcq2WUjw
	9/Xtp5Fwcd4gDVNG7twnFYbzeYNtLFfnav5WgwLCZM9G98eUnzDFx8E7XrOs4raxI
X-Gm-Gg: AR+sD13sBcUoDYU/AHPai8LqiywdDElWxKVl/xo1Rsb8/wkXCYfqQ5+RfHwoY+bl1ZL
	UDd0b7IzYUxNugB1jg7hSwZGgeMdfvrL1VVs2nnZ/51p8qFoVY+FS1okqpB9j7qEOnqG3bIR+99
	XAYgGfosJTgvLYmct4DBHb9rUbIfeVzpHHvgMrWqJyK7qi39yJhbIsfkqetBKsLTJ7awd9bWvYJ
	AhoXjD47FP2Tk/ASl4xIz7nCRkKlFAsoP41QeDLIGiKhxXJ7Rk/oKpUKhPDgkiDP483fgsONJtr
	eFoE42hDhLCsjEXNuzP9F5PM835+wbykUbZN8qAAyvz26oUrDdlMntCfyprK+9aSS50/FYIlqmO
	rQBa30QmVo3JURggpEL4IWvtNm5zM
X-Received: by 2002:ac8:5cd3:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-52df574715cmr114738561cf.17.1787386041977;
        Sat, 22 Aug 2026 01:07:21 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-52df574715cmr114738221cf.17.1787386041474;
        Sat, 22 Aug 2026 01:07:21 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496866c4csm234826466b.54.2026.08.22.01.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 01:07:20 -0700 (PDT)
Message-ID: <8b61c2d8-054e-4bf6-9e71-d222104a1af4@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 10:07:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] arm64: dts: qcom: Add 3 new devices
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5YwqkzFvpFnaS0y6sRRzjuS_G2gDaYjE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA2NSBTYWx0ZWRfX6UGoAJ30zICb
 aYQSAG/aV2MCyR53jLgexfaMKs1cGf3tBVNwerVxeoQGc5Wy3GA2tMWzrozSk6tTYbAC+xH/9MU
 fqC53JHT+qV1bxHe7StNWnEUDm+huSb03/kh7Wp15MZ6Lgbm/y8oinMatea159nZH4ISVIgRtP9
 dl3RDh4HxUJbdiGZORjHuSn3YyrRLiqVPJqvsQo5KJRucFagFEiLrb47umnEwxmYNUMpa8RaiKA
 CpB1V221dX6g4bJawKBrwyJfSFwrKFeOobCCs2i8m3dfke/fs7XA9vHrcckzgY9I8e1cUrsWPvV
 sqEAN/FciXdS5zyzzc9oxL56iUBfoJgR4czJ+ICQ0CDBKkkejMd5xRJiLGrdgGtvFDCr6R1bLUd
 KJ//FdcGJZXMw0gGbh6QtvJytDJSOckfZ8xFnYk5PDmSaWV/4I3225bsNmoI3ljA9Hwm5m2Jugg
 UG4bjqi0RMUJ8Vj6AvQ==
X-Proofpoint-GUID: 5YwqkzFvpFnaS0y6sRRzjuS_G2gDaYjE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA2NSBTYWx0ZWRfX17usRmSzkpl6
 c9SBjyNHYKI5yojFc378xtRhomoR1Z4L/qF+cNEZLXiOyQdfAU/wCxad7WdvljsiVwP6z2tKEvB
 RHRCu81BPL3y15KhMHp3HVVOJEbTdJM=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8958ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=78WjNs6xVlDubrzIrP4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220065

On 21/08/2026 14:26, Adam Skladowski wrote:
> Introduce support for 3 new devices:
> - Motorola Moto One based on MSM8953
> - LeEco Le2 based on MSM8976
> - Xiaomi Redmi 9T based on SM6115
> 
> Device trees besides enabling most of supported hardware also wires power to
> subsystems like MDSS even if those are not enabled to lower maintenance burden
> on out of tree forks.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

Three patchsets within one hour. Slow down.

It is one per 24h during normal cycle and some maintainers prefer even
rarer during the merge window.

Best regards,
Krzysztof
