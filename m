Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704474;
	b=OBe3ODh+wPVO8DwSAGD7jgfcoXcY64kMdeOo4Jj6ZYfozScK0oK4E0+F2OeZS57nPkAR
	 kNuk4m+pjHLWL7w/Ip0VkMgtjDTdsT4jrweXGKWtbr676f66yNOztCnAESK59XlIGVpu3
	 BN5eOfHPfh+84ude+9EmZR6VQz6B2CrzrRmzcyq6i/nBXxbKtA6+o+Sr7vlzP2n7LuiuV
	 1MAbvRX8xvnNULtLeBYcrz3SPXSQUiPQBhSK0/9gDEMx7y1wO+Lz0IhNinO+A1/ERjheN
	 J/7yq+wPCubsU3hbWKx/BpbEwLiGBNICqoeLMgLa4b875nucHTE34DehkHvfE/uyP8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
	b=N0WH+KK602oLFat5QGNw3nc4CFSxWyIbY3yU+bCUb/0nHAXwkR0WRzsOBae6y6iWNd5p
	 TBpQICmhadbKTVyQYncznEaVi5ldz7RAxDOHzwpjgEQU/iIl+LEXnsTxNCjU0bOd6JKfC
	 Sd88mdkjnSvupSVD72THk3YpQk4voNkiHpTqo6fZVMM6EBsre1yMiM8UmrM/u+2FY+jIT
	 U1Wdqlz4jazJ3Yy2o+85O202NB26XX2NXhXaAW7dbM+areNKkprk2jfmIrOvKR2yBtt3X
	 iWRXTUD+GAJPg/7/dLkZmwN2C3/axuMk13lP4RkhHip5Igiq6m2rn2teeiYjxjaJZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fel4mEEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+tGsvsU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A2A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fel4mEEB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+tGsvsU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV3f33170999
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=; b=fel4mEEBzuPxWI/Q
	FGaSuwN1amKxr7mb6Uqomci/2589jz2JZTO9djkwS0SgTG0ZifkeXngRrAEPBRP5
	g7V1MDzMFfBsa9rNfDx/RS+VEZoTNhEpO16hkCqRcFVLXQ7m7Jy3YwT9HPRqWjZu
	7rNrKoGnG62YilLD5dsv04FxAUlDjlgbBQvGhJbTx8ReqIxHqf18GLTkCv2wuk52
	TEkrwaOAMEnwBv39Jn759OLHCpqTmDeaN+gIRYxcZXucprGeiQE4sEPleTFJzkx3
	MVn3DsuZfD+A+90gmjYtNf+oaHrXON6vrcr6Wy8SjuifYsDbBRtH5FqcFTmegNhT
	tUTQOA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbc2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:47:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso317481e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704472; x=1796309272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
        b=f+tGsvsUrrrqGMJf6NdrLJjK6GvQNnh2hUoi/AIzlpk1JkMJvOYPvRaq5wCcjQp5nq
         eq5JEhzrb/OHqzHcBHuOZn3QHWdmS/4+P3YSltL9AxiuTMMvVAse5avVLkWcRwpo8FcL
         ikr2CeKmsqJdxlHTyr9thpHCPrUimxSFCOmHkdxvNGD4acfaqrdrEZKEQlEr3U2kaNjt
         BJm0fPXHR4UYi0OiRDcNmAl1OPxHNP+llnka8IiFd1ieCsSTKAtzYc2SDMlVT99lE/XI
         AWv/+/pn0rFWhP3UaXTqYcrscXjxcwfR4wSX5JlOjs1nZ6e/qP+e8+O/WBeA5yY7EaH6
         rNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704472; x=1796309272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
        b=K8tSBDnu11za1Fo+2ePtGKQ/FjYQfHIzHRJMxLCwGlPagW41ZKBw0FtlhRj+QSgjJG
         etGyQgb51nzg24K9AusIUlZo9OQYIQ6kGlUrHWDmpydNGFCKXcKrcTMujZ5K3KbyuN0O
         tkXHF8ybdlmnq85h0Qa751TWGWAqtGqrZv5By4kZ9t8aoVEAG8oYh1FhhD9EmhcPYFhQ
         XFPNHV7BAbKaf8oXPlMe/bXvWmBphEse7uJyxTL3GElMrK2Co1l2O5/WOKW10Rkk0g31
         z/yal85Mwla71L2z4WHj6tajm/9BW/T3J7EaSXtAtPrZgF5VibVt+BA0gqC8kx/GviM1
         bmrA==
X-Forwarded-Encrypted: i=1; AL+hErE6ZYNBz1VJ4z5JQOsPf0lKT1pHGgzX70ly04PyXRgtJ5M9jI2xisSh+8MEvm64HMIJXeIZDFeCqpAJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9s1cXeX9x00rNxsbPijuJliVDDVtZRmzsJ4XGUHfF+Bs8G6v9r
	vsGTInhfaCNhedXPwqXUL1JfZqVpU22aK2RdaotLXE299AjiNtMJYvotyF1y3JRwb+xGzNO6H4T
	smW6FDjtZ+1ry9PwRm/i63ka6RYMlVi36G2X29qb0cjxvSsUAmyvET6Yhx+CNGdBQQLcgFSs8
X-Gm-Gg: AZFdTZcyBRrO54OkjxjDGsJkODmx/BC5S2ZGCV7ExmG4OYTCiSNSX8LM7c1RG4EaNj5
	5Pf2M/TfrerYEwkMT6aozedDC9GtaetVDZA6Y2pYnzgNfRVdI2Qsj/VYEKpcHpmC1SOTTPcMdHj
	+gJpuly5G+hZp+B+ruyfyfmpr6U+4mmq9n/k/ws2uMJVbphWc3VHQbpVfPiRTHgDjaePsIMWyWJ
	VorQwExuJtGRwk2E44fhnB+lF0og3gbAaZWJmma+u9n/eHqKFzG/WEpOKH6UMEIdceWE6OoqdIJ
	WpFg2S8pNBfZHTKYv28MKFuSt0S0c0ooi4/BXaj4574+hCXWIQiqb7WgC/im2Q0LxbRFhz0wMZw
	1OfYQPJ/Bd3zw8ULnCWPLdEj2TBEOub8ZqMTKjk6PXDpnaJovpeoUj7XoLAv+KweGUyHN8pA=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13495183e0c.0.1795704471726;
        Thu, 26 Nov 2026 06:47:51 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13495130e0c.0.1795704471268;
        Thu, 26 Nov 2026 06:47:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm8301224a12.37.2026.11.26.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:47:50 -0800 (PST)
Message-ID: <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:47:47 +0100
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vVsij2FnJ3qQPbJyAGiVt0LmfG1kB6T-
X-Proofpoint-GUID: vVsij2FnJ3qQPbJyAGiVt0LmfG1kB6T-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX1Z+ld+oU2//f
 lEXZkns0n+2H0uUdnR6md+ugWljqVBxai8VxV1k2Mz2Yc0sx4GG8kOzoT8qmuQtOV9/PZnASbTL
 zDagLC+Or6Ok7wHEClFzovvdrq/a1/I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX8df+0dP/g/XX
 bd13RnMfc/ST98wpUJ0RXDgKwSTsltT55ZzsIc4fv6KBxO71C31xl4rE0/OgCkO0vt4DvevwIew
 ZjgsD4Xv6bnUKemeDtsbjpP5NH4FlIDWSUTcda684FiDud8WkJ1Nx5ww/dSJ9Od0t7tY/HZJ3lH
 4sJmPawVnSN6yMCdbERAMZdpS/jKCMd7jQ81x+QZQ6I9uiw6klQSRfM7xmBAwmHODI15LkXrlTM
 4415Dc+bsE20kCX6fez83ryYrdRYtV9WP2f15JTQWUJzSFR+EpW/opu/40rC/xAndxpe26/1389
 ttxAT1ffmcMMDAwTy2Cv4EPf3iWQMvew1aFbpA+ymwUMCkaxISGnRFZ6NpMndCduTTXl+tv6P81
 837tkZReoCpbZBJPzyuUOGhYrpM7kkysOz56lgpeiWCfYIuVSUq1hhxEcwJyWPh4MMLMmpIjhxa
 fPIM6NzTzLxJKm4bRNw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b084698 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GS9hGxBgXBVpQNT4ZgUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/18/26 12:00 AM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>  		return;
>  
> +	if (adreno_is_a753(adreno_gpu))
> +		state = false;

Is that intended?

Konrad
