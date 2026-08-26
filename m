Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E221D391E5F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725036; cv=none; b=DADyFN+CF4xB5GbKG0eEAO9CRMnGxMOu9F5r8TObhFAERwggnz4eP5YLpUX8FIWPNc+pJJcp8ei6YzCgxMtRrO1znnm16oxAnUnaktGwGPsibhj/DcyX38OUCIFX0WVx5VK9CgQSXYNuppCFV0INH1UjfMzrfFmEW9bN39d2Qug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725036; c=relaxed/simple;
	bh=y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDF7FtrCuid8RJlIgwlOXBWQPEHLX5YslBkSh2i2FoChwk92iSk/5eycwa/N0zHtPDOA6UEPXWy+SlXdspSyMIvdN2uCy0P11S3FKT20qxAOzal3o0FFKs+5yycz3QtIJ9JDQ2txhMwxHdS9Kfl1ZJZ8j1F4uAoBjShr+wlC6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUAMBa7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJyoSgHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUAMBa7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJyoSgHN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3H94Q3275571
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=; b=dUAMBa7Eplid8Yhr
	yP2ByFV1eRhrp5NOEm3x7MZdLUiguOs6mSTmBttmORTdFieRjpjSiYGOKSXetCGQ
	1BpzMDzHb323Z0oIJmKfIqasVWFSUokkgTa9kcbL1cm+fbrqGW5TpbGErT2I8Rr3
	u6F58coNeqy4JK44f9fvK5VTQggIrCWjKrOql55y0LtKnl8ytGGPDFVKpg0mr2aR
	DAan5L9CZ2b/3sVsCcxWg/kX6ZZAj42IfrEKYuzl4rpTlnSNZRK72hlQcRsOEgUc
	mUHx23ftd1OFH09t2MA05Gd42tfvyB2/wSd6KVjMzQJpHbbLDjjJwflYDfBpc6IF
	Zi2Lfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2b0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:17:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso5838221cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787725033; x=1788329833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=;
        b=LJyoSgHNRzJbiCGEGgAA8Tj5Ghq7vtIEdRKIipmjJjJDKHr8HdVDjklKZtg/mg7ZoG
         FHcOOKO1CbqvfXgJKvIlXtVyL4VM5jV45QuQni+Jm/BgQnGGDHvYE//0DR7xmC/mIxSW
         GhVXatWfEXmb4QHb/+bMfdAMFcd3YQ5fAXoKAq+WANnzErVwOi1pc90Z2CDYrKdX6FvP
         1sWwEAcz/sU33nsu/62iJmz1IrGJgtqWMJB5cPsIHvp5fGxNNitk7DaUhO/DwDJNFJce
         8rCBEFfwzcvIR9jphkrs/ANPxP9oVFHlfV0Ym5/tS2BGcT/bjSDYlEyLPqyN2WlkiZhD
         GuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787725033; x=1788329833;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=;
        b=ly0BYAScGQE3nJTxU+liXyOYFNWMNgCwoUFBl8iVN85aaKvYFIfS50A0ILlYSqB+S1
         G65mm/ruDps+MXpzMIw7yvP8IaRvVfxHqtLGc9yL4XlajXIa2g2uyXgURgPJtSwgo54r
         qh0+MfxGZxtolEXOitaktmeKyLjFxBEeWB4fkdq4Kkx36AQjPvs22KpuJu9Z4Bp6ak6q
         JSmVZ0IlBCh5ogWxToYf1bQ426U5zCTNI4LFTHvZysisg/jvLLFDlFY/LHkOv1lrTs6Q
         QfNWK9Mo5DgMTaWYk6/0w3bZ4UpW5rnOe50eVL8gFucOSHeaz9c0ntAOJ9Rh19rVFv1Q
         UcCg==
X-Gm-Message-State: AFuF++mzEbnJi0uk8t0sZu4g82A/XQt6ZnoaRT+F0QCIbUDPEEJlHnyw
	VRh2GDHeS8H1r0Ff0rSZdwNe6DnBLz5GL0TFOYZCvnDmYM5p2QJKw+UqtXNH+VvLnhsrtdN4FxY
	8fNhG+hHc/yF/lXEndZqkcCcAdQMec95JPIT2wABEMEZkocwBs+kxPaCldcjR5zYO
X-Gm-Gg: AR+sD110437w2B3jxOVv2dMW6bnHnE3z9ku03agKqDAHDwq3bJOGcgMGg9VQX113Wiv
	KIs9+DwtYpP3wCklLgkpC69djuEnYIHKQkrJcfCuVB99vL+u6yhuQt2SEnt+VtKFJ7RugWkzcHA
	iSdgcpGr8FESjDa4eG1kl1fDyTRpXNkkNRPLwJ2neyOFhxv9wgJA/PQeRuCQiHt09ftzZs1AVWf
	RUkVIJUJd/KGECxZ7CdUs39oBqNcX5f4dUIZtTL1HJZ90Qpv0JOPjwxwQnzdscBjcrKZPt7/irG
	2UqKh2m/kBvdwuQkg2h67Z/RJwZTqwtCD8XdBoFkRJsqnWFLVMmnoMfLKKjbvRRgcFoPV1/aeQJ
	PQBBPP7534SYGqZtSY5Y6Kup8Sywf
X-Received: by 2002:ac8:6906:0:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e423a7f3amr45500821cf.33.1787725033055;
        Tue, 25 Aug 2026 23:17:13 -0700 (PDT)
X-Received: by 2002:ac8:6906:0:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e423a7f3amr45500561cf.33.1787725032612;
        Tue, 25 Aug 2026 23:17:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88aa0asm365083866b.35.2026.08.25.23.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 23:17:11 -0700 (PDT)
Message-ID: <504a072a-b856-4145-b6fb-54d43cb99fa0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 08:17:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] dtc: dt-check-style: Introduce 'stricter' mode
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-8-6c9776928cea@oss.qualcomm.com>
 <20260803091619.827961F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803091619.827961F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ySezmAnz7MyFf5Ae9N3WJLaNtHEYIG6E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1MCBTYWx0ZWRfX6WITKfkyK3s5
 kf+b5yIi4Na/GMUu0ZVY8MjUnSDCFCKnrWH3yWfT8+B49C2nOBb281iIDdfCdYtsYg3DO86vGSd
 cXXv4bSfPRS/4JxcZiabbCNCPkPHl/8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1MCBTYWx0ZWRfX5P2SzuH8pNCs
 w0n6jFzuqmvi+0rcDvIbbRkJigpvE0zrbJcEmZHjYV36L2GCuV4a6BnxlhJhlXYtxTF2GlZxQXq
 fPONA12vdm164z9Z673nXUbtkywZqGM7030Msx8eubWn6TmC6xX1Rbf+qrSi+S4Eb2r+AJlpHYe
 kpLswVV1HU9nzk95VEtBQeZABACdKENelP88xPTaPxm6fIaVeFLQwIWmlRtdqx6O6HgpElHnBzI
 fW3BNNvYcJRU5AzpIozc7qvfZtC78Md+LhmgJ/LuoUkinK1GR2t47Qyz5A2aaj67+qRTWWl++bg
 C91JpR8ZhSH6dz7YrJeVHXQVFkBwq6FdBgh/CPzJAIjWl6lSpachblvaP7SbEPHNuaYzEKR4xAT
 iTB6iWrToG/Ff+QMaZF47QqME6KG8godUDDLTim5IjE2Vcv1ZFPjUmT/ymQxYVoOyY2Du5WlMt/
 DAQ0yIz4Xmx4MJ5f78Q==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e84ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=6wWpjI-6l4EqYhd0jiQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ySezmAnz7MyFf5Ae9N3WJLaNtHEYIG6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260050

On 03/08/2026 11:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Top-level nodes with the same name but different unit addresses are no longer validated for correct ordering.

"No longer" is incorrect. Top-level nodes were never correctly sorted,
so commit does not make it worse.

Best regards,
Krzysztof
