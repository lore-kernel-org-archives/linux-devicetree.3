Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623623;
	b=0GFi1/p7kCsngWKRQrTygibnKqK9OgB5CR7XFJLd5ckUwpLjl3flX6Ug+vTHyEP+nlhL
	 uvInx4lMukdUPjN/woNzAol5hoIfs92CEpDOLNhVGrcJwJyGExJbMMPnbzHsT5/JSwiCa
	 kDG1s743oyyuu2lcaT0o7iJGX9j6l3H6VfmhtoQhB/lcukoE9kxxwteo2NZfgWEXC+kg1
	 A/GBZN1vnWurPccM76jnTw2jBoFkJYmu3bogj5YwIYuhXPdjSdaXLU141aFkwmBouzMhL
	 C+2p6TTm+JWk4kKBqZM+BBsDPLoUyhVQtFNKdlBEDdgAsEBoO+51Z87nZ2qhcWtTYdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
	b=dKSDrWjejp+JRl1eqsjkr7dHCKJYvJCgGUC71T00Q6FRuvFAdbNNxLDySK7zXqy/cZ6Q
	 l4v98hbpHVv8t2oV7kB1pJwrdi4YRf6pkDPbKY0/5FVo3F4Y3lrtitGr7X5xY/EYafcQc
	 YAIo4gYAyYFlxfoB4oKGKtCq8LdT7MkG5lxv8MXG2+pD3yRRotFdYS6suPZsPGXCWcgYt
	 fLHYF31U7AJ9Q/m+k0Hf8qMD4hastNq2goyEYmTMiBtqMH2bbVv5rEasc3ojhQ7+z5SVC
	 3aE/EmqKWf08oNRuGAzk2yNCscZmSSfhrhNbRCaaycf6mLU3x+oH/rGAmbjaECylUQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnzmRqkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao0AYPIH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D38606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D38606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnzmRqkZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao0AYPIH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A4B1260600
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=; b=cnzmRqkZOtbkKeM/
	GYWcgwpVIqDdqsQp88AO8H61KrXRo08UJjICqFbhm/trFV+hgXGHkRWyeg/heM/u
	5omLInZrkBB7YGGnHVC48MmnlTtGUzI8UeRIqhtsrKuPd558WuUGOhumnXPN68Fu
	4YhF4kRjnpLKlPtHcHquSkGOdRppWlXXYrV/v7+rVGU3JF/d7avydvADMAqQlCJd
	siR7Nn4Z3Hj0odovVhMHC7qlBESugrHOkLF3XFVCjaSL/1b60reim3mKXWoQio8A
	N2IPEv/OI6Za9y7cvY1xiOki9zXqopPJeQhAgghsryaEsFlDusOq/BmIg+6Z6zTd
	DWFJcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrtst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:47:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350173dc7aso7953061cf.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623621; x=1794228421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
        b=ao0AYPIHgnPm801+52YtfreEZc8KcuKBrXdt8ArBI8AE0CoGPAkdKmMeqDs1nFkFyo
         XY2YtxiA5ByshLNWOkV3lKNVb+2x/s2S3svtZuT4G8dVLFtxIX5lQSibBrtPYGYqxbbh
         BDR0yO5gpwu6MbR+gN73f3VolaKUXdS1MLdBiMo6JOfvikQ6JC5+5L42lkKXr+zpcInz
         IVpJZDFXw1JzKypXZRuNEymcfNF1oI7QNot2+IN9cEmvoQvHAgwuUPQFPJAgc7WtnJ/v
         OCed/DNyIWu7AI/As0Q6aJbHz/ZMA1wSvuCD0v2opmvrCLoEQP9EjNV2CIcKUX/zLmqs
         exbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623621; x=1794228421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
        b=yvBR647U1BSx54z9aHkGLTiLor6LGW6cjYdmSRHRtolqZtxgNNmjXqRFMdx2L7uCNk
         cWExSxsboF6OIxVKX+pgSVJwK+Q5UmgbCIOMASjSgPSd66GqdhXoJNC/lDBVhN9DJsM0
         ONciE/SWo/Va4UAn1dsz48yWI/Bm74KfI6LpeOqSZw4Cd3Sd7ke0866MEZrZ7onUuNV4
         6D5ltYlyv+gTMxSkGpCt7+/3/hasbg3ZA/xP1CeEnP6vkGQsA0DYfkJcsyXnJoL4iNpN
         XSpLpSPByd70zzDnJh/cvh41mM3Zc8XMOCGAaqWWLliuww+8diDQ/VqBgfgJDUzMarML
         IW1A==
X-Forwarded-Encrypted: i=1; AKwUvBzr4WywaDnbNXacrZIteToIHX4L/2lvpeWHx9ycArZNyWDWOzNTbUL2978SqqKMxXjhK2iNsHrpSKd2@vger.kernel.org
X-Gm-Message-State: AFq9FYK0I96wqKntuK1zrnPSYDH7Q2Ky9VQ2bwhopmwGAMono5ancRFq
	8zltpEDzCVuPMXmPpyfz5IafWAD+Qf6yCOraFty8JtnKZtey6Wfipc9j+/GnbQyiNfYsZ/qjRQd
	4HsnWWWuiYPJprXrey/OGgC3yG//AG2xwvuWWenKaK6nlkcpZBg2DyIrKVgMFi5Mq8DWJoE30
X-Gm-Gg: AYBFou1X/4qRtNBX7+1t3BbFMUIyHQshfa/TqBrsT6LSHL42vfWXFOT41wZDf4IEtnE
	TPB7O52RfUo3P2LPZMyMvMdGxJb1Wwo7c6xCA/E/Xch0SlHF78prNFgWfX+d1J5fDvVZaQSLD6n
	SUQ7nfusOfQL/SGxuKMrWq7XISYdGmW0cWmNTmN1fp4/2iSWNnGYY7Yar0javoFwSCsLyhNCwmK
	P5J5cEbMORXt9G83EYysHx0UD0idbpWdnvs+rPNmF31E6DbHq5NIB8BkRDacK1LmaDjRPuEysti
	7s6g6CBF9T5uqRfppqRU7dwinu/OivRNcFiL5T6qdhPJqeC6ty0UMnD2yUOutT3Sgd/5XovztYN
	hwFzi9ArGBTqQ76tSybXBWrkbqPbgweDoO/448NOQI2pAqTwHoTRNJtPC0Jn1bVxOswJHXT4=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr1632534485a.1.1793623620871;
        Mon, 02 Nov 2026 04:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr1632529985a.1.1793623620444;
        Mon, 02 Nov 2026 04:47:00 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3452213a12.26.2026.11.02.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:46:59 -0800 (PST)
Message-ID: <30265695-c3a7-4440-a0ff-7fd80fc721e3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:46:55 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
References: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae88645 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rqUuZ-GaD-BuahIUHWQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ROU51YpZRrB1OGG8uDkR7nXgEQwJKX0M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX9qB/ufN8GczF
 8w84geuI6zg5JtiH/O3JB1ktWzyjuV28fYLi75BZVyEnY31sTC28m9paj6WLyiJrVSQleQSqcav
 W9Scdxbx03abDyVRV1C9Bu3bsU82x+0=
X-Proofpoint-ORIG-GUID: ROU51YpZRrB1OGG8uDkR7nXgEQwJKX0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX37qjLqp2TApq
 cpCXZq23GlrtzgR1PJJxhtadbqQGI2Yc43eZUncxHBwy8P55V7ivcKG2/w/x8r2FfgvYtlVPWgz
 x2j75R9YO227rSBFMsL/15A2tH0oPieZHNV4qXijUFtCb8n4dt22Qlgp5zrQFti4TBoDwNwxWd+
 YZ29XpZy/oVxff+NownvOUOGFg2WZoLLakkzES38SdSqZ7DkSRPfaDbwi5WV37VJCTP8JpiIaOr
 R74Thstql0HsZAgwHFgDNZxD/IOeNJxBBOekLYNL4xkgWDXlWhKglfWGELwQf3bl62OMb2sB5dz
 fwi7i9vG+uxBDOfNDg+17FIMhlD0+Zf6A90hQeM2OgVlRRoxdP0jPpjBEe6UzPC7juCZ5K5ut8g
 DjX8TC0mjeHXxqpZD09+mazued+HVqiP8tlMZf80W/nxZegr5CQuDdvsAbe6xLsCDwmOPf2B8Nc
 2040yUQvvr9ChetQ36g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 3:41 PM, Vinayak Katoch wrote:
> The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
> these two context banks fail to probe.
> 
> Fix the masks:
>  - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
>  - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40
> 
> Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
