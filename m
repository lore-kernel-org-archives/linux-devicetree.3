Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33A443AAB
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185629; cv=none; b=lX4P5vG70Le/Mh9OTOe3vXbWBUpKUXrVxkOVJw6Xjcwly8x3l/D+EdrSY1C29jeK6btWHd3bBvaZjZJDzxOJJXdA+OyaNxPFUuN1shMVbdEWH/SwC3JHMSnSWHMbjnMdA5FPs/VjtBrRazfY4cJ18stLbEEGdRDglNG+k/x5YVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185629; c=relaxed/simple;
	bh=E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkGXgdG++jYSB1HNa1UfVTBmAw4ltfuzXDivRoOn2pBRuSqNlsSeCAmrX3m6uskVd1Sincc/vpvMpoKBwNoj2WQAOMCiKfbVfc+o+8LGPPqlmSKuua+BXc7G/uDn6QcwqQX01hMGIfgkAClNKnFpGn9gA5mBxOaHSDKHYTJYxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K269S8Jb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDwNOvKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K269S8Jb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDwNOvKN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBADGN4099248
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=; b=K269S8Jbbty1RrDC
	4bAQ8DH1K9WJrF3+VFDrmx0T/+EPPDFh49Fsz3D1vSDqe2u6IWgtJFUrJTwatCnW
	zGJmDxJ7ao+wCdxmgZjmwKkcDwgrx6VRZ0D30k1QuepZV1SwL+lkUUdcT3al15BB
	0gGSFPLLWl50TydZHbzAZuLf0Ax2IEXyyVmoXPOHukJySl2x94FqsQrKVlHGghye
	JEeWmX5e8Z5gpIM+aAwEf0ZCGiNVuGgNVOm9qMZdDfF43UeBQaNdyBwlUHHSpQf9
	oDc3RNfqIZE9L2qxfHLnhkjlq+hsI/asJjWPlYrneLCp3JX7hsQzSzdaReY+AsCp
	QYkdTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x09s1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:13:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so592525785a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788185627; x=1788790427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=;
        b=XDwNOvKNZZLzsWc0fFuhwg40uugxvLF4uBAcl9zeiEgDbM3Ns53VNPtraSJZMaCDCL
         pHhM9tNWsgKg7LYeCUajkJSaPmDV7nDGXPmUiyzt45fVqmibyisui+71k6zOkNqMaypw
         o2z68gHANpbzj02l4WkGogueJ924tQ/q4w4bjdeB4QCJ5/vattx+Myz2B5hMhOZ1YM4r
         HsNib8H84varosM/44BDOsGdNJZOgsWWtFW+4eLNsBpkz7UK8xmwBIll36OBHivMtEAS
         O+ljDClXrdMj92X0XGdPuCLTE1Eu1ZNFHWGIG+jsVn8jZTmYpiBJrGcgLvrdy//tcB3Y
         NTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185627; x=1788790427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=;
        b=svgg3y9MB7S+jQXid3t9C2BYO3to5wyLqDEOCPnLxxwZXrfZjJAbdHSI8OdZOvOciN
         P/INCv7C2AS0ZV66VDPDjF6tSl6tzt+pN5hwqqccuvAQYlY5EEPvH/+gvNb+zKt5cnlV
         Zxj/Rt7N7caCvCPEsY1Ex88lmcmzV00QVCKGXVNdSXh8Vke4Dh+lru550790bAo+aWg3
         NHWXsCxgVjFqTG755ObjqAuetIS54NX/eRc4UD61O3Q+Dbp3LWGsG0XK/ldTLF/BoGmy
         B4ugtfDtUzhymsK0HvCoXS1d9bXVWzS3yNO+9bVLl013GP3TKKqQP+xz9FA693uAvRmk
         HMGw==
X-Forwarded-Encrypted: i=1; AHgh+RoQtl1hoPEt9VSty341xReGo6xB4U27jQBHpfTO0diS9ROk2SdR1tVdnmyFqzRZ7gVTuud0n8pitvQk@vger.kernel.org
X-Gm-Message-State: AFuF++mFrKQ5fsG+2/MKr2efB46A8BMPJ9WDQTGwR2BSdPrHm6HkjRKh
	uRLhNQg8n6MT3jW6QV/odd9iS1zG2oV3+7NuA0oH+kU0OuqbdEcCfRwqVCJjSJMXAnhsZXO6DTn
	4/+eGEkKx5eR1s9t9fFajDjhn+EgPqEARGzeDTPgP/b+k0Zu2yo95z5/4c4hKUCfo
X-Gm-Gg: AR+sD12oTYd09KIL/C6PSEP5YUwW2P5qAfy+QD9bkG/As0zrTJ6ml/DssDtXpGFjbZH
	UvZWRH1DNhY3x2Tn9wEp/Lfs31pxjtOizN3D+2vylROe+NcerwO/IzSZtx89RYHGlB6iVvXc1ls
	cxuGDRWPl6llaJoGklZ2dyCbMyHdsvv6d7gB5YC77MWWkxjuy03p420MksLmwibarKugQamYhku
	YT9mg4SgSoEFsjquh+eGLRjMhIJzxff37r/yUOCFY2kcDHz+TPbVdQ3EmjUoEhyciKuI/K9JHOd
	jU75sKRVlzTRe3THcV6U3EM6We6RmeADmpLlvKSparIEp6q9jUPKEb5Ar5IhAYa7ZARiVb19wa1
	Yal4zOux/RwRg2C//PKBFapplpPUj
X-Received: by 2002:a05:620a:469f:b0:939:319f:d6e3 with SMTP id af79cd13be357-93936bcaa24mr843605485a.5.1788185626830;
        Mon, 31 Aug 2026 07:13:46 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:939:319f:d6e3 with SMTP id af79cd13be357-93936bcaa24mr843597385a.5.1788185626367;
        Mon, 31 Aug 2026 07:13:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee7335asm429888266b.27.2026.08.31.07.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:13:45 -0700 (PDT)
Message-ID: <d95ff41c-dd13-46af-8836-e93ab0926288@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:13:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 06/12] dt-bindings: display/msm:
 eliza-hdmi-phy: Add Eliza HDMI PHY
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, olteanv@gmail.com,
        dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-6-67843277de17@oss.qualcomm.com>
 <20260828141031.CF3071F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141031.CF3071F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX++NweTDgUfmX
 NzujNkj5xSfqQmFP8dgvpjE5/m6AbGA/T8F3OvzHTuMWmCppLPFnFAh2Hw8tqewmQIx7v+bsuUM
 9A3OsfGx1XLWZaYCnJ64VKGgQhDd9oA=
X-Proofpoint-ORIG-GUID: eQeSrUZbgnAudaFGnYusb1Umgk6viB-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX4ejInKFSS1n9
 SZjsDWYVqqibXgT23E31Sbwo7yPTpj5pi3ycSG5mGQyy9+JnT/fO3Ba3VwbhkafoIsJa0Uzc4PZ
 Z8fp6RaWefR4Ax8KjZPDmpH3un1Dzv2SA6fdpBeAJ5p1pEjt6v2F6Ze9/V4hjGQ86Uz2GvUehoR
 y5nu15Lx5tJBFCH5GYajuu5AgpsU1f5IhhCkhARrMQ54sg767GR6A5edrUEngyryQD3vX22diV8
 ZKUaXVd1jLXz0MngjM0Ebq1tccCZ7FKTM/jcp7SE5qEdQtzPI+refPhMDyPmLs6IzgBd3NgFLkW
 N85hDKwuhdeTJFHfPrvgBgKU3SU6Xu5l2oSb/Zwd43MRUgCVgar3+54VuyNWuM87uNXP6auypNz
 k7WDvb3JiFpRkIBa/73CR4Blj/KAgUUiubDDld0rlisOJUcq957C5AIis3FC+Ec8jPAZb4aYvGH
 o/O+abdag17caeOUDKQ==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a958c1b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=AWiUa7ILvgJRdtSgjkkA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eQeSrUZbgnAudaFGnYusb1Umgk6viB-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122

On 28/08/2026 16:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Devicetree unit address mismatch in schema example.

copy-pasta, ack

Best regards,
Krzysztof
