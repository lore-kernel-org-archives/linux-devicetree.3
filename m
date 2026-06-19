Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8EA35B63B
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858619; cv=none; b=o4mIrdRIi6oi9EoGAOApdr0ua7mxSvStptRnSCXSWjQhnGLSecbCvKGFJbWxhflenHHx/XEhO8Uc2rSxzzUpi9+cTvWLEXiMJYDdoN5sX28+T8B65CuZ7o2L0VyYny9ORfdR/cgYum9yZdlo6r7a7WQXoTs8QqvwDaNTSQbhL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858619; c=relaxed/simple;
	bh=bc31Yr5ghRJg0f90YIfKarYrpbtyGTI2c0LzMXhtT/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llPpz9XFVoV7Tekgyq8Sp++6b7BesOYH0QCPsyfmFPKgUJGLZjJoHIswwQjshS+BlVgaSz5hOe1ew8w3nfGUa2hTzSjFA6hnKOqP+6R9U68hHCx4RF+0MSqE+kDSHmCWgkFhMDhh3cFB09k/deK2WVLb1iwhHT9W7239pqA3g10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g60Te3VQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6HoYynS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g60Te3VQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6HoYynS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7R8fY082229
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km4wby96Y6EXgbIfd/nWraW8VyrR6b3sietG3sRGZdw=; b=g60Te3VQVRD+d3SI
	eAg2m9qf8KMNl4XoscJ2nFhZ65TWJYcplYvixYInSKPiw7PMQV1pOiURi7/V9f0T
	beu6n7qHbl8oFqYO5PxG5WCHQpVbm+NctmRK1Weg0OUDGso5XJ8IeV+oefYi+X/4
	3GgYp1FlMzFr07r97Dh0Dlcf7vaVZavuPa98/FJ3U05JjFCri2Yt+KGOxniVo+Hb
	j1ifMUlmhob6KW/BzjxserpzFLUeOLEpKK393VOzDACYzva6wHosPtpitLz60Gep
	LrHPxyJIvAmtZ2/95j05LXJAbt1mcN0lXDx9l7UYvsAzExEBSUCYAhVMAxN2xAls
	ktzwxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjax5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:43:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c272e532so18551045ad.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781858616; x=1782463416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Km4wby96Y6EXgbIfd/nWraW8VyrR6b3sietG3sRGZdw=;
        b=Q6HoYynSfFYAuuxdwGNdohuoMvFE73cLjrimW9I+CJ0elGmwjG2+9n3HXmIZaTs7Zj
         cEU+pUWBru6XDQn4MtnzH9uWUmFr/DcRBSEGWsvc3XVryA7MGpnwuO4NvwqwszyBrMau
         X3boyZFBISLP+Q2frplavbaweruRg1PeChQKI/bEGRbHT1pqoPhopkRNmMNcbACsiH9A
         rf+VWU1PK83pvyeD6ZaXEwMXfqldadsfY4JvAKlKqOzhaoihuN99GWtrDOrfHkHGaBdS
         zppVOigpPDG7Ea2TkzojT8ExGG4qSGSX3CL46HT7e1kf2c6+0sdNGlsds8JiIKwAzCEw
         sh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858616; x=1782463416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km4wby96Y6EXgbIfd/nWraW8VyrR6b3sietG3sRGZdw=;
        b=GJzYEG27UZMy4cC7RlrOzDq6ixbPKzX6GDuXNku81BXo4rn/mDlgq0R75EtRqcK6N8
         EtvYRnD6wrCJuV68bh6LK4o5BiF5uKTbH4xHtbKsMFhm2xbJhXcc9zGy+YVt/fCbfy3u
         iye/rZTLDsFT5/8Y4CPkBuZVhofy2sC68FH/bK9L1oAETixC+VlmPUvkwRBtu6Wyo5mF
         USM2LxUQGwdIotOkajigICPHkny+ZtXPiw7cHoqpJFFLQMMY8dh9up/k3mHLlppid6gn
         7/E3uQt9wARrVXqGitXgJ35xbT2S99Ng0Q0PX0a5GzQBnsZDavVMvaUfMExmFt12n8+p
         Efwg==
X-Forwarded-Encrypted: i=1; AFNElJ+8RI7c6L71yQrLzOJs+nXUdxumdSD5Er5nCpr2lRiBT3HFemCxhBEEJrmN5nUO6ZUC/7Rw7W/AkLSO@vger.kernel.org
X-Gm-Message-State: AOJu0YwBR/rlB0eP47H3fLwP+mVlm6WZsUTfYE9TEqLhSE6mdX+oVqzW
	eN/Cun9Wq1jphSnVXcl1gIyI3WP+prXJMAd20r+7Oik8xz/11gihDONUF7k6gWZVCvHTyHSx3C+
	/KkEssm5H0/rYbjlIAIzilyVGg4HsG4WvqVJtjbrIQRB2mjB+qg5RhqCH3251R/bh
X-Gm-Gg: AfdE7cnTyS/r7TJHsbQ1hbEVCblFEN/2RR6hBMHxxdIxPJ/LE6KTO2N8soJyAKeKu47
	/mJ11cET2BRswiRH1s6WA58jy5iQFW1G6zzZZzNGsl2Nk1pnqZ0/xBFxYOzPJ39uKtvKiS0rh2D
	nk3esH94rorkansYGD6IMaMREK3NI2KjlqS+NnT6ezqb6wT98++nY0n37G8KM5mB9iW5KYPruP7
	OzFOec2rkATZNwKUy+CfBgVWyEGJLYAmco+UJbMLhJcwZw1GW1iqHRMe6LiT6V8PjL8cGF9eoyw
	fIPtCVH+9UmZofM7ZdM38cW4qED+MZauyVH+qYQVtENx5sFQiNtGE+b4rI+cI93A6WruQM2smcv
	2wA0ApNUmO7ga9OcAD/5AwFazXVIaKVUAvVCguIOzPKU=
X-Received: by 2002:a17:902:e947:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c71904bfdfmr30535715ad.33.1781858616324;
        Fri, 19 Jun 2026 01:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e947:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c71904bfdfmr30535395ad.33.1781858615850;
        Fri, 19 Jun 2026 01:43:35 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089c377sm15930615ad.15.2026.06.19.01.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 01:43:35 -0700 (PDT)
Message-ID: <53b1fa61-9692-42fd-a295-98bbeacbcd9a@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:13:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Shikra: Add DT support for ice, rng and qce
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA3OSBTYWx0ZWRfX7y+6+qGTGocC
 ptN3pLd31/ztqq87fIGJGUAzzGgwck7uXdydEN0jjJyp8+TDIZYKMHtvYUekPbvKA9t0cz4I6Ew
 aAuK4hSZ7ZAoKAt0f0gW5Ux4K6oLP5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA3OSBTYWx0ZWRfX5hTtlNU5Pq2c
 T+ax/NqitbWVdyeSDiLvHXSPQxWIUzLWUPNB8CSUHJHoImo+jaartzO9JPZgllKg1HIOJulQb3M
 SnlrBPKZ5F8GgHU8nnZL3DmkSggqgpP+5QfzhHWCOiw7Ft5/brS4xuWlY3Ekzd9C6idwL81YIhd
 ks7hwYYWKfBdi9epfVEV62PehRo7pg+dRICKi93ocm/bKG9012KPQdysg3ehLCGDuIIC/yHKDGu
 BdLSfPyi3LUH0Dzy//SH9JRk7a5TDFVEOojUDWiuF4NFRJ+I7u1DQm5ftwjn/ENdbuFCHIZ9xUZ
 O0YLXjlLxKqz2OtTvRDud9srYmv1a7HOaRhPR/W+C3oVPlb0I7hy4I8WUk2W2H1D6G9xESxnvdZ
 GRyqzeZwMszMZqIJYqsUHON87+bX02ZtQ6JBIfraxf2AeqhD2jkx1GIJEHPBD3KIlwE5rec15RW
 cHKzEbZnNjZ3IlDEcvw==
X-Proofpoint-GUID: h5TkKKf_IvFo9jgHpo2TkRzIdxpQ01Ms
X-Proofpoint-ORIG-GUID: h5TkKKf_IvFo9jgHpo2TkRzIdxpQ01Ms
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a350139 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DP-1hcgwhx0q92eQ_pIA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190079

On 21-05-2026 18:47, Kuldeep Singh wrote:
> This patchseries attempt to enable sdhc-ice, rng and qce on shikra
> platform similar to other platforms.
> 
> Previously, the 3 dt-bindigs/DT changes were sent as individual series
> and with feedback received, clubbed them together as all belong to same
> crypto subsystem.
> 
> Here's link to old patchsets.
> QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/

Hi Eric,

As selftests issues for QCE are now fixed[1], so shikra series should be
good to proceed? as your concerns[2] are now addressed.
I am waiting for merge window to end and will send next rev post that.

[1]
https://lore.kernel.org/linux-arm-msm/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com/
[2] https://lore.kernel.org/lkml/20260522024912.GC5937@quark/

-- 
Regards
Kuldeep

