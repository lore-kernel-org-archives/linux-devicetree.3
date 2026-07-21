Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F8492502
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636036; cv=none; b=nHnJEtTPsYCLxzP7h+rXQ7nO0gqbMyXScrM12udsFe/jErnMcmzzFwiYKTqc3UoFCtfKpdf9X3jgqiinufbE/ZBanLQ4ugljU+gJdvJggS+HJ1oMxf6ZiMBoQoFH3Q/AG1Qe75gqK0xoNoxfYEnke+USyP4SVDyXRW4QgVkWwuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636036; c=relaxed/simple;
	bh=Zv+22myXf63RdfXfVQr2PZFXaQzgGkHb4qWcgvxU+OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBVYtZkb942mk725CYl66Kpu0HmvpBviKCnWwJwmlXR7vHMQGqGyN+y+HqGEKqdHW89cqBHvNQvGvcPmKR+yRVhOPbxNRBCc4eRH8r7erF6eSb1OI2ENUD2GdGrKw1LX7mgbv7SQ16/hPGSBjzrt8kq7l2MVl7RoZ18iAtOTekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmyBkSdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxciCizQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmyBkSdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QxciCizQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR4YM1349313
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEVVNDrYzu3iXWuovNWf0ih/Ik+7p0RKVKTCKu1foa8=; b=QmyBkSdGo7e5dKvR
	F2C4nSGD5CHdkxnA/wRJVfLNcct34WkyucfU35UCe276kts/tkQ1IeywQAGcrAHm
	j5j3XdBM8wOtZNL8EsOA1CiHJcRHKpSWuHM7K2DJSHbFe0jU22EoY7N/0YiIVIuO
	m2meMrscnIPrcXWJydmnVFBAnT11F7cA6OxWympr1YpSTrlB3u/Xu65zNgpAz3io
	MZFnUPjes9Lky/sOyX5TN5/DV4XRtyt/yc7mjLblpDVHtFYihKjsR+16qnabEqID
	hQmtRddro8kTbqF4xbqguyWMaWDknwwT3Iv9jecsmJ7RHpjFYqNGS29ESUSyQuBT
	5a5PzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa8jm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:13:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so212361525ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784636033; x=1785240833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEVVNDrYzu3iXWuovNWf0ih/Ik+7p0RKVKTCKu1foa8=;
        b=QxciCizQky5EevAg5A7Ifx9ht5zet70+ZlRT5jTlOju0I52BFXWITt5nypvnkP1UWl
         bDRV2lC0mRH5bnKIxYhPTHYbbuJdXDveYAT3LDOo2ofXJc7rI58QCdPX4XeHg0137xMs
         k+lChY4+LVkU92OAsHlKqn6lcf1WDBXHhuAcNGbAEOLcJLbX6wHeH4x18cZgPtY0Fe+X
         lgmHeomqMvrlqT9sIHAeGiU1VHxYKMN72+le86P/YzzZT6TRTLpYr6A63OLBeFNbTcZ6
         iBA43Hl7b7tPrmiLTkP1LZue2T5kOM6G6oKhSGf6hDTXJVhRwfM4ECZ+GZbunI0pd5Hk
         m3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784636033; x=1785240833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEVVNDrYzu3iXWuovNWf0ih/Ik+7p0RKVKTCKu1foa8=;
        b=NnYx5a6P0OM+6ylZmQYrZlyISoHUuXZLBejxWvFPJVMt59myF7/w92FPudxks1rrEh
         PDzOqlPdQgYMfgUVwwUaUABvr/62lNtRRqbLzaSqby7P/nacNAD0XTq6ZMBORU0XXrfi
         nvE72dQiPQFO/pTy8U3xbATAgxMvPe6OR2jfc5cGS7CVkX8rSp9RRQFXmufAH0GIR8Cc
         P5e0gZSnO70Dcqg73JplIa+O5pV7LCFtEhjnugQAlynx5NQx+bEglnm7rssGJ16wHc4P
         bsR7G1GZcPtk/1/aHVtYHxZLg2x/LXueUYpMbDgAfTKfzMy4ZE7EM/hLsrG/OxfqkwRA
         TExw==
X-Gm-Message-State: AOJu0YwBuxW488JDEb+QYnG2cG5n5EJW7/D0VnAJtJqyjD/tDdXxQPR4
	RPDh5NhPc32GLCU53J5tLMO9JQhnC+PjTTa0htuX7rgmXaZlH6OQALg34Tz6oBlUNfGPS2wfXKQ
	vcq80E31U2aKc51KNpQs0IctTFQSbS4TRqCwzI6ttFa3GYBThybiDzStru+J3M77U
X-Gm-Gg: AR+sD13kGh7hbFSWVYiJ6y1Cp0AI2QShPLK6qdC3DRDNeYXX15SToBLGh+icOqLCtse
	EIKFBStcNEeHLYq7wGgG8RgBrDW6jNbLCb8ap7ilRSkltJed7lbW+xMjbWlNtncBvo8zqG7gxt9
	NFTvPm7wzahDHbmPR8BtKzNzIXkWYfRgA32etMVF/HdhLZVM+Earzd+17bXvlLuJZvSd5xHB9MC
	/F2QyxNj8n2VmDOGleyjCX0AmT4wayHUawElisrtZBRiaaxQHAsSobjsPy0UK+IZmdVzzkpzwvS
	SRKI1XsDi2rpIAvpgg93qM2acYdYprXs7qEc1khCQm7qWJ7S9HTACYMhJhD5DG73uVJjQYEZRtk
	LhBSLH5jYh25/zowd6vqv+y4RnD7yu5JiIw==
X-Received: by 2002:a17:903:26c4:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2cf34821a56mr194587005ad.2.1784636033362;
        Tue, 21 Jul 2026 05:13:53 -0700 (PDT)
X-Received: by 2002:a17:903:26c4:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2cf34821a56mr194586695ad.2.1784636032889;
        Tue, 21 Jul 2026 05:13:52 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1f04sm75694805ad.22.2026.07.21.05.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:13:52 -0700 (PDT)
Message-ID: <1d15aeaf-452f-48d1-9943-5e522f808b7c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:43:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-4-monish.chunara@oss.qualcomm.com>
 <20260716143554.3AD711F000E9@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260716143554.3AD711F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6voEwxoiuynBOL47WeH6f0ClO0-8vJe4
X-Proofpoint-ORIG-GUID: 6voEwxoiuynBOL47WeH6f0ClO0-8vJe4
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f6282 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Xn4vB__Uc2y1v2IptAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyOSBTYWx0ZWRfX3FKalzN6VP6v
 DRcsUHIuCHgt/iqCVrcx0TZCkNZ0B7x6QhudgyJfgBTxd8sKwdylLaITxPlKEgPD45f7JDfcXjX
 kSnMm9RUOmEMl/leugHU9RrJVwAiwSNsBtcoiIEWjz8O4DhsKkGUgcp8lIevSLS5IadwZny3Kfq
 dxlgTxMtiyo7YMdjmYjGxL/xldtC4KNPB2wXxd9ELiDIP2n/jskVEqXanT7tFF/cX4nwX52JB+j
 PWAqT7RgZlYoZgX1pQ3z5/IfJBJ2k3luw2RNA7Sw7uCMat+fTkTQdZPVoRR0/6t182Dg62/R3Ly
 o1wjSPXLhwq+MOyNFGabQeF1enQogd/R7rn7LuTGdp9o4Xh+Fru5KRZm1imTKOKG4lCkjOw5hVa
 HJ1Znio93cRa6og9JGoMWDF5kLCB8EXMNeGCmKfMbfrnWstdx6kSN3/gAZUiBxpevoeYTaNE6Ex
 yG+VS4ZNFg39iXpb/1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyOSBTYWx0ZWRfX31SasAItbbPR
 AECi+JLc/kpqGN9P0PymN+33nTi8lChyznmaNSqBsGGJ2B6U8mTvEAtWNY8amWH1fE9mFnv4mIj
 751wHygVhT4XSw+zsjdGJ6pS6YYepn0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210129



On 7/16/2026 8:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Alphabetical sorting violation in the Makefile.
> --
> 
> --- Patch [3]: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay ---
> Note: The format of this report has been altered to use a free-form summary
> instead of inline diff quoting due to strict recitation restrictions.
> 
> commit 9c47ebd2f8bd209fc994d382b210d2c4b6160e02
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> 
> This commit enables the SDHCI controller for eMMC functionality on the
> Monaco EVK by adding a device tree overlay.
> 
> [Severity: Low]
> This isn't a bug, but does the placement of the new monaco-evk-emmc targets
> in arch/arm64/boot/dts/qcom/Makefile break the alphabetical sorting?
> 
> The Makefile generally maintains DTB targets in strict alphabetical order.
> The new monaco-evk-emmc targets were appended after the monaco-evk-sd-card
> entries. Since 'e' comes before 'i' and 's', shouldn't the new entries be
> placed before monaco-evk-ifp-mezzanine? Keeping the list sorted helps avoid
> merge conflicts in the future.
> 

ACK

Regards,
Monish
