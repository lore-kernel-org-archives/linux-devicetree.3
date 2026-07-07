Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1F414A3B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430637; cv=none; b=hVG+HFlB2RLZ0w+BU3g4DUzpuP0H7AcbEVn+pLYRNp6IXBmjtkwYNNssVzrFHaqArfvTiBCNsQ7f0SRVhhKWXkS2h6WHgfaJXFI9RU2+6n1+skIJ2e6S1ZYF2xhs/xZpjd0MCQrtldl4RtVzJ3vTC1vLnrKiFkxVBWPW4tBdSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430637; c=relaxed/simple;
	bh=/CzW4y4xLjEPhP9wVONfumAXuS2ptZjJRj7gEdzwUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ0Ynfr436SOqn90iwW5MmFtNaLJT5ZxaTfP5QZoO8Nw4W13LtZSDOaE/4TAHI0kCYbMuCwxCuve+3zXiOX8150+wbEbqdrwQeTK9zcA3yK0eJPimJI1fQzGqxmmLDnm5rr1VndbAjb3REJzDoyiU7BLGEeopTlZ55rH/6eZAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYBbUyfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwvDZ0VV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYBbUyfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwvDZ0VV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8rcA3541993
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkIjxZMrAHcsaaGSniPtOPxgv3iCKSb8ywfyTMLuMtM=; b=kYBbUyfQE6cdZ9jr
	GCXKGLQKE43RgIWqp8viDxqPSM5i94aHW4zXZa6aZnayqBJE1uetce1dWpQER+7N
	xqryPuxKqKCyUt/a0K5vGZJJoN2MZfh04gBvtuT26JAVD9bwAHPAws9dzvm6+QYD
	/03LGxTd4sgwdoT2QtIn1gqn3MBYx3oMQwA6LY2u6h0o1vnjo+nUO9bxkuUNJkmf
	3XAdJM+aQqoXUE8Qm1ZWB+bkVfdPaFG1tafrvfeAIaThTDybKvuqxjcJHUMH+SjX
	B0TVgba7g2f1Jxff+eLBEOmAqim3uTA7RW4kF4ZAV6C08la3hWxKe8VqhSY7dAoC
	29Y7vA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su724v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:23:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9692df7e2feso748089241.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430634; x=1784035434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JkIjxZMrAHcsaaGSniPtOPxgv3iCKSb8ywfyTMLuMtM=;
        b=YwvDZ0VV7uzsQmVDxQcn7/PjuPo0lCNGG1NBlr2vJqULuAlUXdtLH9a30GGBDkROiz
         qh5Dvs7K263PaOYfvf6Un0dLgtcMCh4LHEpCkdAMi7nitKAjPg+Twfjo9vP62cx4sn66
         avfwXAlqmNqN6855ceB2WRErCWtWTSKfwQJbKiyGCxwxI3wV4R6iAnyWnrRxufZSOoGM
         FkRZfC4Drr/hN4QnDMh3wfyNoncRha9Tz8UOfSJmCMpPrAMqptCM6bH1IBRbe5+Z3N1D
         luc/m4CbyPyJ8VDy674wt2z/gcDz60gkTZr6s2ulyOIEA7wXcT9lg8hpSX2ZBRsBsVpS
         Y7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430634; x=1784035434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkIjxZMrAHcsaaGSniPtOPxgv3iCKSb8ywfyTMLuMtM=;
        b=tPOKq67ubzIhM8SksDozbWxVCH0gF6EVsmSDWQgcAU9b0mPeRQt66oCHnQdxw3qJWE
         boonhY8MF47wnB4TFYOtSqAoCDASudYZfgWzHR7pIDpG1MpEozKww+oSvmrLJPtM5yu2
         waFdVf/NCSqiSSpKYAXVV2gmTvSLoSS0Ow0VqHOBMay6OrNcV9+ED2NLO/B081lN/m/s
         cYzbg6C5SPNBODi5Gj8EtkFlq6dC92ZSw6wTZIhr0WOjYMLq55wT+HDHfaiAiZXmInp/
         9wC+rnuNYWYmZbFp4jy0f3v99Kku8pD+IyO07FIipibqPpT9S5o0BkektTGPsFDZ6u2P
         dUQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpp6aUU3kYS7meaWet9Y0qIP2ShggDS/DphHH1ZY6OoZf409r5xwhFfimY8v9RX4LPnj6eW9+yk1Zzl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyskkz8mHtIl6PrXsZuWveRVpUkZGT47Mwo3s6f1ys2LJ34tu2z
	0W/Cbvo0ufnGMSrtEOQ+eeC5wuoJGlgli2e8cyge7jMsfjonoXMTW1Xoi8LHT+RUDMJz7RnzPkg
	gWYgAy3LbxEhWqkHBzUZcLWtm/4vOqgR3uam5zaZgxZoFn7zLYeXeW7g9FuAsHwP/
X-Gm-Gg: AfdE7ckd7riogUCRlx3+j/bcUyhuBpBUlGxEv1yHr0DxqNOIM9bHlZxAGyUNuYZaF0T
	DGz0tTcCKcIZeXdN0PjYGipNhDqAZpJoOqx4V77c2Ma/JJOHFReV0eujWzdGkREx5RaBZtJfIWT
	4i97YG0g36f92KLfcCW0zedrGCR9ESMbDWupY2M1nKfj5r1aO97ccLJhmjubHDtRGCz8asRO4TT
	2vyZp9S8O8fQZk9IxPMMIxwpKo9syxr4FV7d+2bKtJAvB9GK1PkNNGUCn60uLHirDWVzeZtehUL
	wKOC0bmKfi4QfOZDCX5HT8kr7fL+rYxuiYIJeKPyL2eQD8gEtW7OS39NMZkNjKmXqpwtMUrAgUn
	F4l5fpJpb6fKQNLs7NtZxjYalUQ8a8+5mx0AZx1px7NDWCQuHof9/S2dIYlfK0snlzU3E1eE/KH
	lW+nStDTSOBepxhaw0sSVk9FPm
X-Received: by 2002:a05:6102:1611:b0:73e:605c:4078 with SMTP id ada2fe7eead31-744b7c34148mr2407954137.15.1783430633910;
        Tue, 07 Jul 2026 06:23:53 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:73e:605c:4078 with SMTP id ada2fe7eead31-744b7c34148mr2407928137.15.1783430633319;
        Tue, 07 Jul 2026 06:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad357aesm26931281fa.10.2026.07.07.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:23:52 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:23:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
Message-ID: <itv5ekiokhce6eomzymtspp2pt6wucdfat5pjnb2smmpeqo4cq@to7n7cndmw4o>
References: <20260707-purwa_high_tj-v2-1-b66f10ebf1cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-purwa_high_tj-v2-1-b66f10ebf1cb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfXzujGu+ICI4XE
 S6G0SPVDuo5HstpPmN+G7Ov+p8BALtIuDQNTQxyLIH90Jcf3prfZjRLJsGMu7vlSd+p3Uf+M33L
 BjzBKC/CQRImiY+F4l1YS1Jevw3yUE/5/rAy4xBCwMvW5gS/q8HbYeUFGm0/SfaNhXoqAuxMrWo
 +Zkc9aV0Ti6HdELSmyQA//8HIoGQJF/75VqyMRonHuDydAnHHxixZ/Ea9N/YvWXDlLkMoPxDDc6
 zKUmc/u57X5FiDBWHV2rLH0kkQe/bJ6tlzCJQXIdbqHBiZxySVTdJ8VDF4+w0i/ZdF/6/nbrBxN
 a0l4wBvOzfPCI19M9etMbm+k0lnLFoURwXCe9GsFeH1OTGOkAVfO7d7v13Zc6WbPQXr43Kciocu
 zmVu4wP7MY5bOGTepJKhfKiKrQ3fVpy1dSM6SSp2NdAa+yHSf6J8vCoZdx3RCQzBJuu86OhmDmR
 dATjByuDu976eMG4COw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX2yqWVQpKxySy
 6mBGoCQ/xC3SdwmJ8LDMXwkmAZp7yiBYbUXXqt0zoFNhhEBNkpI46jVxACgmj0lLSIDIPnG5g99
 NFyCf0eZx3BzEtn123UeETkYHJzFXAo=
X-Proofpoint-GUID: z1Pru-i3rMOamHG95CW7l2c5gpJCi8NT
X-Proofpoint-ORIG-GUID: z1Pru-i3rMOamHG95CW7l2c5gpJCi8NT
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cfdeb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=irIo0gwFZieol5Rq1NEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131

On Tue, Jul 07, 2026 at 04:16:16PM +0530, Gaurav Kohli wrote:
> Purwa IOT boards support a different thermal junction temperature
> specification compared to the base Purwa platform due to package
> level differences.
> 
> Update the passive trip thresholds to 105°C to align with the higher
> temperature specification.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased patch to latest linux-next tip.
> - Link to v1: https://lore.kernel.org/r/20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
