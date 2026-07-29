Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5934C6EFF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334643; cv=none; b=AEtbXIIPiuV+eom3a8PIUeVfpwVPPhCVeTyT3p21WfYjUUS7jVRBPyv+SdFKPUVPjsykmzjKouZv6NbGciOrbkzaUsN6x5gslok0ANa1IMBB95qpN2FZXVdCvb13xbmO0stUxPcy9xyH/RguiQF5vWdACu8GFEeEIBSC9W6JeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334643; c=relaxed/simple;
	bh=vmlDegKgKkpc3PXfAf4Ln0sDNY1p4H7a6KL0xMsvQGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkB30laN0NM0/aLXEanrMmqOtg0OHChxk9aT5En820NMDyyrJvjAaYmxKRnbpoi1N0Nhed2Hf0MmJhxFX7kO2QvP6EeaYnG4g55RpmkwYzWRhiFFJ7MfCdV/0HI3Anh76CHEcR9baNhIXlA2UFXg6wH9l3q9BCMUL3/eycrtl6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKyXkJ6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNi1/bRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKyXkJ6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNi1/bRB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8GKO1432671
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PSpzryMuSFeBi8aoRJVMuXsihsBhsMHAYk26rynGYo=; b=iKyXkJ6+yySa6EZY
	7CjQWJzjzxbuKTVDNZfP55ctaJOReP+4jMbR2tSfNpBa6Gb/la4NUe/fqAp5k1bk
	cZx0B2CI73i9QVpRYwoFWE9rrl9BedOpf5F/hNd76tCL5gHZhflza7yZCq2aft8B
	2sT/zPTZhUChpYLekN86aAcrcBRGFTVLziyM4BFB/XbTVCNsU2FniRsC4WyQr7N5
	yWy0l0tpqXPnOgxObpq0W2G82FRpWyiw7F5E0W0/qA3Z4nZklRKAITQ7V50CyvXO
	iTzNf2lA2XHquT6oHjB23LHc11lgau4fhU+U8xFMSvsv8fm/tG3mBoI+Sc9WuISx
	atrH4Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj0ppa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:17:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6ab004a0c15so38453eaf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334640; x=1785939440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PSpzryMuSFeBi8aoRJVMuXsihsBhsMHAYk26rynGYo=;
        b=PNi1/bRBdnWvVTIp2odB6uED2ccV0WFYRM/NTJDd5DJJnAs1QiolY2uxrNl4x0H+8z
         oRi+41P3Frs5tPsdE1np57JZyUpLOTvjUZCfQYnhKU+fhwXpb/3SGdJ8E+M7wP1/OxsO
         BcIsHmhyBcS/NGZ1UKBh1yBynEkzq+YAS8NUym4sT7mvrNzZqPp7YedseY2uVaXa7FjB
         X6elw3D08nGJH18IOr3no6adI60miee6KpXzvi3n83spZseMjsfvapr4mPhxeCu6Le+Y
         tkwfT8lM2j4CoBiIFQCxazLBid06hSRau74dyPNc07nnTT9zEQA/ExVckXp4OCHGZ2do
         YyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334640; x=1785939440;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PSpzryMuSFeBi8aoRJVMuXsihsBhsMHAYk26rynGYo=;
        b=BN9UT8Z0K8qYtnnv2DCmgO+9TRV3KSZDlpOweCcddhyYOE2OXBxa9/AJNSD4H/fUco
         ZqgON2EKtthRfGueIO7PipMcOyFuQOvtQ4SvmLuWthGg3MTqbdRpJC7GTc9r+GfxBIHL
         Ma22/fIIpkG6aI+lMhLPnq28MoOH2LsP7DTsEu/mnbgO7CwNUgYIrDQPk2WVeTJ9qmh9
         5z0yJrH5r0MwSHtljbJKaE9E9st4oA0cgCUDVINhCVH5P9IJgtUZMlr4rzJhBxzbGiNq
         sCUsSXHEfy1o/P61TcO1R6Z66jH5IHo82eWDWjDqaQGGY9U1EmQHjSHS4EsLXT7dQ09W
         QVxg==
X-Forwarded-Encrypted: i=1; AHgh+RpG9YCbLGT+6mktKybDHZ4YQ9d94QqDLsHIFInW74qrBkmeCztGd5eMiE2z5aw9NRO0E0863uTCdXl3@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuhHSQ55hO5EUSzGI3QdrTAPOwusF0nDmHVaelnwj8tgZMsvY
	CkBtwcjHu5cg6eS9FzLI4kkLZaCQHLqLy6W2XHE32KAADHeF9JD08IO4sWDF3lBuzz6vdegkF1r
	rnfC7MHG3DBs0GTPTvK0HWfRllKyRjGyqCXS5YCu6gfYiCHpontF1tZ/3At8UDd/z
X-Gm-Gg: AR+sD13s5vOIscJ3AfTe4aAE5ffvv6tfsjazWdaIQ+pUDTOehxHxXVJLbhILNBhgFwq
	8thIFRYrgmDQz9jyoEsjy8/bmohasgW6F9/lrY/Y/sTO5QEzmNJE3gqWX9B+Y2cNqixF0FzwU/k
	jwzPIm65uWYzeAt80CAY4HP2ZPWnuwtoBn5TsHFktRygKdDx67dQt2UNzgaXa9IXic7iYHNCyZv
	YDQaReYsY+fMsYXM7zeD0IfiJ3CLygycOrC5Yeq9e5Xq8Y4ob77Z4pTXOnTD+E0gWpaWmRSYma8
	5Rn5b40XPueaM4FJLzNLhKOxX4uBRNYOaUXEuVj7EwBEmiycPp+raICQ9nlmCpRCEek6XUhLFiO
	Gonf1YF2KQOYdgaad1X5BhNFe
X-Received: by 2002:a05:6830:6c0e:b0:7e9:d593:896f with SMTP id 46e09a7af769-7effef79b2fmr3212333a34.1.1785334640295;
        Wed, 29 Jul 2026 07:17:20 -0700 (PDT)
X-Received: by 2002:a05:6830:6c0e:b0:7e9:d593:896f with SMTP id 46e09a7af769-7effef79b2fmr3212267a34.1.1785334639815;
        Wed, 29 Jul 2026 07:17:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d78f36ecsm426481e87.60.2026.07.29.07.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:17:18 -0700 (PDT)
Message-ID: <8af3d998-c908-40b1-bd19-9321592b5b03@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:17:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
 <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a0b71 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: hW3PzI24l7MRIr_RyyFfqU5zKWG_eW4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfXzWMo6XUoCwHQ
 fU51vGTXOP2b9bIJKWs9mlbr5Uh7K5aRMpG8oADEbsyOxF1rRpDKJN1uoEKZ624EB2x138inFjH
 ylv/0lDK0Ym76ZowFkXv2FhyI3qhBI1rQrd41azzd0oAPt1rXd1WZrzB0/SoKVmJJeuMDA/cMoP
 LcXeT5dUd65e7dhiuC8+TljY6HxdOGgzdrreUoNg8pgi9/ND/iNYxkS3hnHqMQrmXCEl+0o9VsJ
 r+KaWoQzQv/5tl7VX1wMObJ7sT3cyLs/0CxO+kk0BBx72O7PVLelxi0D/+BjPrTEeIpa2SSOlUN
 DSAfMCDg6mp5isrVbSbxw2w+SoPstIj9JudNMU3Uz+KKpCXkR9FSdUC8HOVIEmrrMW1Xq8qJx4Z
 w7elsZ3DT7WpalEZMTVpqVx4Dc5AC7+9wyyJPqnZUWNS7sNB4MONuGNfMBFWLv3PIZ+DLjGKqQY
 FaPXhmNVZN1VwD8bqRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX/kfwzGBVa2OR
 fPqJo8CLWTvjOfBc4Bsax0lgujK5G8IK6vqMP/S7UshgM7kpfHvSgDH44NCHOjgNUDycW+EliD5
 RFu1uPWgKTzkDEnF2k+fI5QYyVPHbE0=
X-Proofpoint-GUID: hW3PzI24l7MRIr_RyyFfqU5zKWG_eW4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290116

On 7/28/26 11:53 AM, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
