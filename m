Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658914;
	b=us0C4lo33hBtXG1oLA4Ba3tNtBnsh/OBwB2WxIwcY96mw7nf4wNOMLUiP/Zf9o5Kmzil
	 Gav4kXzxpFsNlOIfz8RXhOWg0qExoX4TzSOlikSd5SlpPdrdWtHcDu191hFMU9nMgymvV
	 XQ4kT89Qp4d02BO/gF6lC7pp2/rEONNGmNe7OEjb5kM8gy0a3jiNMwOy9BsL4uOlR03Sn
	 3Y4IJ+EeAB0kbbMQL6KNvkCLwPGguMIPLHUXZbrvDbIqHoV7NMGSNLqA7YoCeXQ6yUe29
	 epyX5G3dSowCf+CZAsBrsmNkOiwJsEdn2jI+1L7SVi0eFwJ+1tMVhcZlbKlgRgbav1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
	b=ONXGNvBYAupgrZLgqXdOkyzSOSZ3mHf0C8VbAj8IN/QcO0PWTymBb/l/sx9sjfVya2Ps
	 JdIcD3hEbMqz/c1c6VpJZDGbrOKcTaR+bEmfQVpniGRSJG3Vx1r+3pDyYsuykQw+hyB2i
	 WSc9DWPV+Je0XQhzePz4UXJHmnA8LESGg6vps38u4muDdO87QOO9WvM8QWW5iRvAAGdbv
	 13GW7D3W9mS5aKriroknTJ1YAmOj8iJlFTLg3ge6jF/crfEThPRB5usn7/cNq/qywSzWT
	 WZMjak2ugMzBMs5cj5mnUptHGYbnYrJ2y5/P3JhK7Ds8FsDrIwgR38c0Jbc7V3N959g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p6/nqHTy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/8wCf3b";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E23606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E23606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6/nqHTy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/8wCf3b
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701w72714204
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=; b=p6/nqHTyTSge8Dta
	ZRaXq8pxp3zcrMGT5X0QOnFUwKpm3biAb35EU1p4K9nnD8ZZ05tHDk+wPVtawE8N
	/raXYwJZ/fes3xVKZBitY+i+WgbQ1+zyBL3dbYKX59sj7J9ahCFuHW8pvOnWPR5Q
	9E1LEts4dL3ueW1dOWSs3vgDUm5k3s/0k+F+5XPfsWgqyE7Pc5JYzNHnMrP6hcI5
	5ldG/ndh5SGr05Ov6cpVe9f/GuZYnenDcR51EO0UBsy+QylwachadI4KFXQhSnwd
	6by8V6HYYjCLyC1EWivrhp1E0TDUqn9bQz25EnpI1XRWEDEwC9SY25M8UmrwshHA
	mE83iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsgx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:48:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so43349685a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658912; x=1793263712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
        b=Z/8wCf3bwruwQec6NVDnaT39u1qyAY3MybAijFbmGRMsJXfMKcP1uvtKyIs6EiPJOi
         D7Rd0U4T8A7nWlnshR/A0wAizoy7hwI9v5PXPGhqykqusB9iDdQNFKQ+MNiC9lWnXCqn
         6sZWERDEPsBMhyBX6EbwVcNbrUkILC/5gsyVWw9PGAyVdRjarhcdTRnk+Sp293yVpJze
         Hpjaa+MUbfmCGjTYlYDpN5GLH61gF1esBFL+mTbLFvz6iRrFSi2l5ff1DdWn4gJ/qJMf
         YeNdIOFjIU1B0QSRSLZCcVXP3GkrLNVzWTEYhhehfV6uodjvXU9gUduJDvei4LhL2D9c
         SYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658912; x=1793263712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
        b=hAgu32n9pbx8BvSUfM5aOm+999xSFKhF/DGbHfAp4p/972nuE39qaGvlLyafk+6LFn
         bCHbzNXZ4CXjVu5mikL+CVs388uhFexONEXTXVC41qGi7FNijhoZZM1B9g/vUDIZpvsX
         V+MCcgYUIdLGowdzUEEAqju3OSg97SXUn1PqzhaM5PhA1MvmKZTAxTpCsDsZxU7rO3Xa
         GhpC0U7TGAJlFR/H3HV+6nRUD4kCZxZBNGJkcf2+3EFpUsgIOwbXNyy2RYRqnXCVBrvy
         3sCrGaoGY5zr4T4nzX9iHLUGwFk53yYBsBRLq8ksxY5Dcln9Cpm2PZP9LAr+t/6yLT7O
         joLA==
X-Forwarded-Encrypted: i=1; AKwUvBw0f4e7ipH9agZlUahl9bOICJAhZ1AOLFW94FgQlmX4Siaie3QbrpgOiUdE8zeB7lJrdCDeljxbgGVM@vger.kernel.org
X-Gm-Message-State: AFq9FYKvTnyVhb4ku9dWmAZeo6Ss7KWWcw8lcAjXeRYEjFenjbEUNnM9
	D1k03lN9AzI9mnol3s7EDio5v22/H64PAYBQ//sOmLk5x0HjZ9hF9+bVXVYu3vpqx9THezpseDa
	kFabz2j8LWOWqIOf3PAIFSdzttEcjCtr7AMNapsuvZlPcsKOissKk3cSOknJPenth
X-Gm-Gg: AYBFou2hRfbGrujBOO++sXtBbyqU/tQ9yS7Bfd61qBcgIMPifPrWfrdZhMtLqdtxgvV
	Mb6pjxg2UP5D7ustyURCVMbEn2eQA0lZwQzMVHatOcNT08Y6xdiXCV0LG3JILYwrfm5lT3Wn1cR
	S7DXkdx1SS2Qch7k9YJgxAb1nTcGjGoCe9bUBA//3c7YO5Mh6j0u1ajdCSWea/1QjsOBVwsZ+0K
	72pFygpy9cHjQ4/RwZPKoRzEOTBAfM86/loKcOJFSuqp1+ClCc/I2bYWiQHl2051HoETxEyqlf4
	IFt2JadHElyFjCtbUr/lSvJkLl4edjPM6tAEBR8D158M9LIqNtwOGFB9/DVXEqdPKEzFz21KNf6
	xlxS39FWSmiPvDMqD0zZguQ==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1006939885a.6.1792658911816;
        Thu, 22 Oct 2026 01:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1006937785a.6.1792658911385;
        Thu, 22 Oct 2026 01:48:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1ef356sm83697866b.9.2026.10.22.01.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:48:30 -0700 (PDT)
Message-ID: <b27add9e-9398-422e-b7c8-de11afebca4d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:48:27 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
 <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
 <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BamGijQ58nZSlLXSeDr0hFu2aJBFR2Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX2w1CX+WztGZn
 du1v8tGgfqoruWtgByxe5HbUQqAY+7vw45ugQEIEFEW6sI6lZUKBVN0AXBKWFEF8SxMMYfxZbFp
 GqE/qWOvfMeym6ZruAaTLWYLHsgVVH3plY1ie3ffSsRrxH6woHn5tQzDFb8hJa2K9y7XXWDEr5k
 lFrYkmewkLkoFgJ6U5c77PEFEHw6dzZKBd7lWZ5aGV1XhARJvFPODORCUIb3owBHsaDvpB4OU4j
 29/5KItOHb7XcOHd50cAOcUUWg0wiEJ9S5tUSK2OGWemjwno9QyszYfTEAgRvNRxl0EsyOLm0zO
 1mYbLpNYZ3Yt3V48tt6Rn3CxeKpX/YmXWuRbXXXg+Q5PjEsb6TwUzQoRDYHAfvj7K0XT66oXQ18
 gprE+40uHWE77v6x5sTcFImh9eLx/JC9Rpb3Ep2b3Sxv328l8towMiWzDT9YN65Wti78ffznKrO
 U9OiArRpVPz7wTTGCKg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9cde0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=XdfhtzbLNWwZdSUk0-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXy3QsFV4h7khF
 oSeSX7nffGzNSGt4MDsKQ4mEfP7H4EHohsIWsKwu3Za00XVb3LQdTn7vEqsmSSACX4fVW8VDr2f
 s71JAGoc54IS5OD93PJcESzSjvuXYYE=
X-Proofpoint-ORIG-GUID: BamGijQ58nZSlLXSeDr0hFu2aJBFR2Mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

On 10/21/26 7:16 AM, Vishnu Santhosh wrote:
> 
> On 15-10-2026 02:52 pm, Konrad Dybcio wrote:
>> On 9/20/26 5:28 AM, Vishnu Santhosh wrote:
>>> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
>>> to provide modem data channels on Shikra.
>>>
>>> Reserve a 256 KiB restricted DMA pool and reference it from both the
>>> BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
>>> can grant the modem access to the complete pool before requesting the DMA
>>> channels.
>> [...]
>>
>>> +    smsm {
>>> +        compatible = "qcom,smsm";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        mboxes = <0>, <&apcs_glb 13>;
>> Why is there a "null" reference?
> 
> Each mboxes entry is the outgoing doorbell for the SMSM host with the
> same index. Index 0 is the apps processor itself (apps@0), which has no
> doorbell, so <0> keeps the modem doorbell at index 1. msm8916.dtsi uses
> the same layout.

Got it, thanks

Konrad
