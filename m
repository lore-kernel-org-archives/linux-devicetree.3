Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E342F6F8
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108738; cv=none; b=DskhA8F5ztBEwX0D+gdjFiGlf70NQkNEnuKgkkM4pyMhmonGg8tQdT+ITheAE/2mu6PXvACizs1Ws7rYhsoS8PvEvbvwA3hgI4DDosdnQu4T2vB6PBlMhFvZjgmKTN9PICSCS5GvKcynVLMw3u79PHMVZcLBX8MFEJLjxAboA1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108738; c=relaxed/simple;
	bh=boItcdYNRLaSDuwJMrKPnlUGr8rAib5wS1PhfwnS8Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtAmoevKIM4rBPr6Maw8oOxLvwoAwfm3mUQxeIasVM+ymBiZhPOcHUELFBv2P6pu/YRyqN66mPS3I3bMYaaNl+h9mE94lb19WoNLIbdHe4M3LuBMyXwyCqN+MIdr78MCuKvkSELk3R01R/qSxtiJBj/E/IVVYNG99PZuPu+ZX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnDl+VIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/j8LAIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnDl+VIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/j8LAIl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vG2s2422197
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ob8ae5B5IDk8sQgR+LZlULkW
	3J30ZZBC9EfolVLI+LE=; b=VnDl+VIVtzAQ4bhwY9DN+xH1ZvS9blAeL5TWt84b
	M6ZE8am+zOFdLdyb0OBeS3hgJGIi9s9aWP/ZR43pGGiHSenOCkdH5856efFJRVkW
	eVKCbyxyVhOZrGGZe4T4fbANn0l5GP4OadHTcOPRGWs41ypj1qcdJuJIxhmI1PYN
	4ifY/7RPiM5NL3Cp0sxIZXKhczAoWvVyjuSJ4y3yII7K/U/VPpe3Sa3ZyK3RNdc2
	6Jo+PfUowgJ1S8jIS6E1BmqFfUx7Iipn4HNXH3tQ9MSKMilorEzPgz/yS/8nfvDk
	sFDwNgosuEBbKIPW+4xHQpMdh3GqbqX3e5xKsbVknBD0Lw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729h7bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:38:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db050d469fso26750315ad.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789108724; x=1789713524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ob8ae5B5IDk8sQgR+LZlULkW3J30ZZBC9EfolVLI+LE=;
        b=Y/j8LAIl0ulYZ4m5SXTEYW0FQsSj0zbczzUnXE5Bnh/6UTMahoeCJrcRh6ml3JGfEk
         Fl0CnFb1opzhgYVh7xnbyL0QrxBK6uZ7IlNrl1h0paLX4lNO3CK8Lx5RHxHNBNdf1vmQ
         HXO0uCjI610+DyiYGgzLFwoWBlYq67JFbHECFp66Bg/SLBNCGcGk/+b8XfQLES5pn981
         JEolgYJ0YvDxxgkLc4Pj3pNGNIWhDhsXP7hXKW5q71PRcK51XrZQKOHQEKeaXLUrIDii
         0ObdAuKd/7q7mGBAyG3cPYBAYVNp/ILxpA1hm0Pmte7hBJW+MQQEJbopTmgF84ybSwrr
         0PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108724; x=1789713524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ob8ae5B5IDk8sQgR+LZlULkW3J30ZZBC9EfolVLI+LE=;
        b=NebGs7dv7R92DQEnlEtadzAM+dMwTG5CttMtykE2FPf+M51U1cGmHVeXSNgp4CV3cF
         BibHznQXTyet60qKD8sA3Gj6c/4J5yHlwCRtK21FQO1ak2+d7GHD2x4UbF/zuCwLZBrQ
         EqD05Ib+TXRjsQID20liWGo2BGtKDd6S3qHeYihUDrsqptDX6c9R6Be1U7Q2lR388a+u
         5RY8xdtthpoChfyjaH/YEVbF5zhmQOf4ODG6nQZCoVpNs4fpEDkrtTMQa5rPUhkZy4ff
         v8EaBC4wiP6c4AhUH0q2t1kgYsHgD07UT6iHT05hJGIT4gEes42OTfsZFPGDHiGxaVip
         nYZw==
X-Forwarded-Encrypted: i=1; AKwUvBzpm24hw0yb3SSZURMqIacbBx+BxmrukG6SEBQxFvFP7VxuafzFKLdIOV8feifz3DbXs1p45OADvLUn@vger.kernel.org
X-Gm-Message-State: AFuF++l51RJ/UV1CUkPWAt6hZbqtu8zS+4uP+bPChAHCiwsQ9dAiDK9P
	1MmR9KJXzne+yYhRaWZEYGFrsbr/3C9uZvhBXT0V4/7Fdq4heUFcj5nxRMNQOEUdgVG7ds7OUzX
	RM1KpAfbXfLnkkzG1nqiH+vo0RweT6lYPMs3EHwQc0aXnVP/h2HjKXtLSBYlGG8cW
X-Gm-Gg: AYBFou05+cdmmddeSU1abRbPdO77XFEGWGhDovGV4HIvtcwrS2Za+xpjfpxV35ImbV0
	0+yAqWch3Y45/rrKSr3Q3SyhYVoblB3oExa2LuyCRAF41uT4SmnYTMlXcIwZTeb8b7USRm7o7UV
	ncoi9R/h6i7MUSGH2iZwAYPY5XAGtnzvZ7ESLrTMAgAmxmymZ3Gi3M8QyCBifL5cOqkm9FdQX0b
	zkT/uMV8fwDZxHoshYh2d/gRgo4//u/wQvM10IzoHAoIDPX52dORVZmo6GEzdmLjuYaR+H9LKxB
	Zu31gqd9fN04YyWAHLU8PpN7kv4hCiWPz21VczmM+xmugMbuK0q3irtqvwG9H1jTmw3CP5om6OO
	ObzTe5xYRJivu4giaH4WluYrgTRx2tt4yG7KDkvU8KNY=
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr11591574a91.23.1789108723658;
        Thu, 10 Sep 2026 23:38:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr11591525a91.23.1789108723200;
        Thu, 10 Sep 2026 23:38:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm3835825eec.29.2026.09.10.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:38:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:38:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Message-ID: <aqOh7Wgoj7VnM9X1@QCOM-aGQu4IUr3Y>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MCBTYWx0ZWRfXwoPwhKh6s2aJ
 YauEt9wL6yWlYlo03XVQFtOJN3iRKFwkItOBcvkbIh6aG7ws8wjJxfKsf0+kAMYhl+42iGvc7QA
 yL4I5UVP4iNmnCN/7I7O0bxDhZMPO/s=
X-Proofpoint-GUID: aNFE480VzvobrwcHMhvyvYIf9Uy27Zts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MCBTYWx0ZWRfX3ERgPVrn3SUh
 GCHv1Lq7Bh6RVXvD0YDZ3JI7qWgM60JYHMC4Tv3CiN+BNLX2Yft9obkC414Bd08+1lsH0+AVnYH
 NYgJp3k9thZvCWZWxWeJ14sToHgzsIHGeoIBH3ufp0p2A9jExlYRYunQjDy9cnzl+0Zlg9ZEVpy
 3GWKPoYcC853RBp8lhSeCijCjue6gnR3pTlx7QyaPPR+URFAV2dR83i7YFckTlnAx1p1seFtazx
 So71ktywevjqLYNhfl8A8LoPNukjXzVuKXWdYrfNa4FnrJXW7WQNdWl/GeTYCxD5MFApDoovM4l
 4I7C5ogMuc8GYI07DMEftYpDj8MBR2u1bf3Ow/EEYQdBn3Ec4KF6DMCa/I+wDVdmVG4cKXIuLem
 rfYr9Ct9XJs0JZFXrjA0tbEmvw3HXMstEAvW01Rs7n4ZaIKhh1UeZE2UMvZsQCk0SkY0FsSbB1i
 uJN9Xya9KOxhGqCz1YA==
X-Proofpoint-ORIG-GUID: aNFE480VzvobrwcHMhvyvYIf9Uy27Zts
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3a1f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110090

On Thu, Sep 10, 2026 at 06:30:44PM +0530, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
