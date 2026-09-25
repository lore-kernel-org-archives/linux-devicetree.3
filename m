Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3DF48E0FF
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331593; cv=none; b=b9Kn+bZbnlx6riXn3uFbTwLJyr35y4eTOTVWFfBoFjM/HXG5o2bbRe94lMZ0W2MPyswBk1AfCzslKyEY7mhcPt9ylNlCm4xQ9h6Xmx4FVZLbOoiVgmD1DIMrZc43L047hiFlkUafOXWXuCrJ9gdynGzcdxsOqr9P9cmvjABrlyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331593; c=relaxed/simple;
	bh=T9LPW9sKWJNoad54fQzJ0IRRrWXS67ixVlhkccyL/fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFvJmPtCyRKmnt/B7F0WtBrlM4aWdiMmYeXZEAI3SiK8Qzvop3oH1f6GUkGBCETMBx42gQTIJyzfRVAkavmQzXEKYT/c12Spu6hWPpVxOkwIY+sF/XIKzgj1EqqEpWKr1AommA9em7vw++bm+0bEspJSSbyfTumaDR+KVDPRvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PY6bP1Zz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4aKDGRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PY6bP1Zz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4aKDGRy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ya7Y3532114
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xf2vfOTw6OghVgtOTKpyAIz/SPmCktUBeB9H5JkyO5o=; b=PY6bP1Zzy2OI54b0
	eWYPEApLj86npiYiybzhCFTCpCb9qWv9ruDWWfe1R1XKtQ7Mb9VfsN+xNrDPEy56
	IpcSD7+WfwSBKyFCDFTfASl6nmJ2o9TBj2wNqSvyamFgiKaIicX1qxZqbG43QlBd
	8azz0qVVLYKgXKkeED6fiV9lnaxyxqAhCgVZFvamdU1EEfgwlFslctY4Vo09gN2z
	YSMxo2KMMS42jmOLP/C3E1gPzciBCELZitxg5/3V0ZT9Iob0ScCtPsuZz3oMgHhQ
	iE4UYlZ7shWxLlLkXs7J9e81MCLuSPlTwuLB6tbJoRKbA3Y3oZUEM2ZHEEpKndiD
	UGHcdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94karas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938fd633df7so15478685a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331590; x=1790936390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf2vfOTw6OghVgtOTKpyAIz/SPmCktUBeB9H5JkyO5o=;
        b=h4aKDGRyhIMTPGYhTNTgXRoS8ccQ32fbsaZMX3Ez6D/CPkvSNI6AmtwYgPKpZicGXa
         HMr1t4/d0tt0uDC9/Qb0kfaHQdUdRyva08CsnMYnG64ad8PeY5xRRYWjO3lLlCOFzn2W
         8tZI2fZO4MDqcgYnWsPacTfoHd0ptpEJjRiUG8yGQn/1cYTPu3xzsrsbUculwJqoLBV5
         1mAHz+T0ma5cXGwpn7dlfRJGmUEag25JYzEScqWXkUdlH8Z8aTtxqmmeRxeCaK6NdLHs
         eOThRC0VywHYaAv8tUOZ8gV3CnkGbg7zKEkIwSAjjeyyrRAjAqz+JlCPXpeljRGVz7YJ
         WR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331590; x=1790936390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf2vfOTw6OghVgtOTKpyAIz/SPmCktUBeB9H5JkyO5o=;
        b=GvP1lUo5X532qUvAGXEnHyMuhFxFlQEJ1yXeRJsSJATrXIxSPjW87mhLa4hBqOvrOK
         VmW9D9uYPWT1iiWH8ughs2l7FBQJopISJijjESqZ70Sr5sV7BCCUIYroYRRM1oAkTIJJ
         R69QtZm8PPKNw+2lmqJ6fUWleLo6YEb2qEE7X5Q0Brsk7Fisxm8+tmMR27XnHiXkLq6X
         H4k4JuZO78MkYqt8WiqLBt7AC1ZzUbuZ+Msb9qWenRjDg1lys2fpaqe+9jSFKuHlkqIM
         BBwfFV1cNkaYUH8T6czhxp/X4kPT0u8FcMWH/jfwH8ia4h3quISb0qpyGIB/luUeXWDM
         3++A==
X-Forwarded-Encrypted: i=1; AKwUvBzL9MRolQ9Xfz1+ioa0ov5B6eIXXYHrh40snpSp6mk73Ehibi9LS4HrZgRai814uxEIPKv7BXFPqS0f@vger.kernel.org
X-Gm-Message-State: AFuF++muJgNJQWV16R2L4UuTBFX9HEyQhYYN+zxby1Dngq5cwPylUWri
	5ZpgrCEdJGfZQ3QCZNtjHiNl+YM1x11Cx21kbfyngvnHuZqntXomwQmgR+m4f+cV/7fZwD8hpnf
	roCJz+UyU54lbIHt4Q5gpwqYXqzXZjnC9BBVV21vi1S9SZif4jfBkuYAk/vq5B1xC
X-Gm-Gg: AYBFou3zEVhzl3Deges08drNsav3I9MMS8liySnaepWYTVkegOLoQxwuQaFjEA82JEX
	GkrVr987elK0IzdwMlycyXfk9E6OwkJ80TordmqxDhBBPvj+LrqzsOrab0ST05AEDvnOOpI3XVs
	4ZFmvZILlmusajf3KAdm3CusNPKBE84XNwIjOIet2ostAVOb5UQeP54wYmzv85u0x9+JtvROWPV
	y6Nu2Ww3ROQ1O5nP+EE7yquTOpdFR90pda5UTGUx+s82B5qxM7HX2xRUpDzjSFDgz6WKIhDQs1D
	Mng4qHWIbe27TjUOCjNxc4V0YQi+dCOJjDzjJA1sgFWGRZs3iFJxN5r+M0a78HDyf/o/rn7a6dx
	CacpuypDsQ4CIpyrbmOcYfA==
X-Received: by 2002:a05:620a:838d:b0:93b:e9b2:3f97 with SMTP id af79cd13be357-93c43ebbefbmr309668185a.4.1790331590038;
        Fri, 25 Sep 2026 03:19:50 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93b:e9b2:3f97 with SMTP id af79cd13be357-93c43ebbefbmr309664785a.4.1790331589559;
        Fri, 25 Sep 2026 03:19:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:48 -0700 (PDT)
Message-ID: <a5c84bc4-8848-44cc-bfbd-97878c3fb088@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab64ac7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JzmEAxJ8X9escz20nJas-VcrECuEunw2
X-Proofpoint-ORIG-GUID: JzmEAxJ8X9escz20nJas-VcrECuEunw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXwYguZo0l0JAJ
 H8hwKGK6eQwtQZgh8+fhF0DkN2CBTf+kC6fGNIdBMQBObY3dHxEXN9pXANC0ldXVywjqOjf27Dg
 +Olw5cDdVnsiIWg2VZRlJYl6Yt1BzBoE0qlBefpBigIzvZCUMnhZ4GxvAGxRxYFbAXgksehvEvU
 fKwQ2sbpAh2C80jvebIpT3c8eKipuz9aahEldXdp7OIPpRFyuJjfXB9+diaDyRrvpYRdi6MayVT
 JoLWoYMke3ImpcKH5KpY6yxNrsy89fM3/NXULozCnYp8kRZEXQ3bCpCpDQhXrpfrDmxx9KmIUYj
 qNF0zBuWoW4AkyKxhNf4G8v+YpNclwVqlFbTsHvt1+rlETLfRUtob7lmz/wSdNEN2mUL0jNcjeL
 rGQX/YXmB+jqNgv1fCFTmo26L36CG1xVl1AAq5DeBMrq74zDLXhBNZltNLFJPqkyhjxOpQnibRZ
 vVxsaNrVHehKPk2ZCXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXymMYr8mH/Itq
 5ewV4ALU+sxjEhnZGn/1prvAvgJFoqsq5rnmZbKKaO0cS2TULZCK9G4cX+flJyjyeDzDNQiySYM
 8ejzVuMu53MJX9AfIRYlpdoqutb9Lw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
