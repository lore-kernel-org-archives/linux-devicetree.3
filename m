Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E923D8134
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781288; cv=none; b=gCHp7qt/XQ02LS5pZdR34WTYpeDXwA6JrgjVQ86LiQRNFHlhs8AL9lOqWuTTfUWzV9UO/Kh+Lk8xGRvj1rvHvlnwWNeCp4uNyx4kIKNX+sEYmBipdF94SjxmgXSQWFAxqS+d+3JCJQkdAv9gbQUNWuuMbNZq0FH+CFogrP9o0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781288; c=relaxed/simple;
	bh=z8PzaU6bY7TH/c0wyyo//4ybwJ/DxeyN/fS1XeL04yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5cuPt/fsxQ6WabYvIEtqSg6wEpjfsxMMJaf578wN//iCzj02QUa4gxqotKT91gnxDg4ntPYiL7bc8r3emV9LhCvoN1F9C+m2xe/EI0+/lnOCoKGhdznPUzCpnHsjQ1TBTeczu65NA92oz1B4n4j/jhekprFXqLaOy2KZWs7k2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9da4ljZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vnbvudwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9da4ljZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vnbvudwq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LAMj8s1510703
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s0NMdQ2DrLhseriLRz9nQIWn
	rOasVL8N+B6zKaatBKc=; b=k9da4ljZcjJ46lc4QS7K3H9LOjJpVdyFJEmYC9pv
	0mkHCbeGO6WHgJzjTcPDUTW9k030PkYa9xLk4f2csW7i4MhHIJjmCZaz6hO0joWR
	HXdg7166mtutIRt0D1KmmgudLt2AWgTJTDwJtV9D9tHtYdGHNEhVLbgQ8GgF5JLN
	QC3aTB2toQLIhOEtfjF1HMvRg0ITeNR3vbgwYijykRdlmkJJk2e+D0lj4umIXP9X
	BH/gMYQZxvfm5CXUmPVSAQkSvRVe9r2UQS9Veot0A7t4HO1OExE4yGRoPbyCfa4B
	ACDuVSjzPjLKLsSsfRIr/xp0geVOIXhzmKHmq1FZS9XB+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak22t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 14:21:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so5662832eec.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776781284; x=1777386084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0NMdQ2DrLhseriLRz9nQIWnrOasVL8N+B6zKaatBKc=;
        b=VnbvudwqbVdmKarc81puB1sZ/YEKUauSeVbWSACL5pGdcGSLzD4q3hM+aWVuPEL1p5
         2zkYTGRYdP/ItUgsK5YubUnHX+2lBNC0Xo7tsTky2wAeYuqfTfDIgM++EbShvmZuv1fx
         yaJt4YOqPRrSCRrGe60YQzyHl5oQeXvyXuIIalMKwcYLabxDcG2HxkmvEbtJif8b962p
         EiFcPmkx9UkWsHsN89yp9GiS74yz71/16KKwx/YzCBcL0wOGyve4LgYAWRvAjALtFpS3
         pJiOL0VnZQTvRSRo5iNxtlupmGycirJN7ePfeAHWEz//0Y/57XA0WEDb88DvZ5xaWJAx
         2PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781284; x=1777386084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0NMdQ2DrLhseriLRz9nQIWnrOasVL8N+B6zKaatBKc=;
        b=syg08kkPDckvcinHYSt5rZuIoKnbSMojvV4qCT1cg8eb9VVOEs0YmKTxWkZhb6A8c9
         485RZUKu5maXvBAE/j7cLXWCPeKlu2awaarZlIdDXdnGvS0Xm0NqEnA70P5fkuIkXOH8
         bbs3Sw3c2feKspR373kwLgwt0bQXB/2ag8qRw1t9cfjOs3tD7+7Hz7mBC2JB+TRJ7P2P
         723Ggp1VleSlUUD2QTSGJnaJ/ri7qc5AO0RWP1V92zRoWkvcD5p+pyTCeCto0jfA8OFA
         GMPXOs0CLjzGfhz+ivLwzqwjgxxdkeBO2+5dEP4vmioviNo6YLQ7fhi1QlyQn0AcaR93
         WqSw==
X-Forwarded-Encrypted: i=1; AFNElJ95L1IVQflbMU+z8xkYVZOSmhbkewysnqVMe3w9eyim4kitNWud4htwTpet12VOLt1qXULrYmgbheGV@vger.kernel.org
X-Gm-Message-State: AOJu0YxoC5wonbPtvj5ByElBqjBd8hyUrBAYsEuVf4StAahYgDBqI7pm
	UBoGJhC5dQVvGchsjm282r2GGCdTzrTpvGwS6soEOgIgW86SI4/P1lWN1vvzE6FnrnUf31ALW8U
	Cshhxx9zpM0GjHO7x+oudieVYpYFdG3FB897eme6ex9Iqvl0JowJmhJduMqgC0N+r
X-Gm-Gg: AeBDiesEtV+hTK8ycKGmsATpYBjOAA5l2R0NEzi1IJ3IAuhvbiuDETdWllfVu6+5QVo
	R1tfF57AvtnizwnNMcWy1XeCS/NOSW5MqK1aBoiBJjcaLRxGVbKennZSaBAfFmBy92OmmfrCsEE
	T7TaorpT7aPQP7BRMwltWqpGR/19gZoUSb10qJV10gMt0I7vklkILl2GCbI2tB7XoHSnUzdG8sN
	P/D6bHEcQf0Skv+5IG9pEFy9CUIgDVzxjfCAh4mbLHD9VDX8J9cAvGBckXFNRnjfM0NLkby2LJ3
	imRoGzYG9AqmtPlInDO0lACHRhNqLNE77YX42v9g9Q4okL916uZ4SWXIhlEsamfrfLd0QgeGarJ
	qqlbcCULUlfhice/gvcbYhGSyoRpAyAFLR/Y8w9KbjKD9nfxshoPIMxU/kwIR36dJ0Wvo09kyX2
	g=
X-Received: by 2002:a05:693c:2b12:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2e478a3370fmr8908014eec.23.1776781284079;
        Tue, 21 Apr 2026 07:21:24 -0700 (PDT)
X-Received: by 2002:a05:693c:2b12:b0:2d9:cfa6:3d34 with SMTP id 5a478bee46e88-2e478a3370fmr8907987eec.23.1776781283528;
        Tue, 21 Apr 2026 07:21:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm18953991eec.21.2026.04.21.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:21:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:21:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord
 SA8797P
Message-ID: <aeeH3SzQif2c1pM-@QCOM-aGQu4IUr3Y>
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
 <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
 <6810ee8b-8a75-4acf-8bcb-2d503d4a77c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6810ee8b-8a75-4acf-8bcb-2d503d4a77c8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e787e5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UVN0y-JDDWVLCD1R_84A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cuI3QkRVqVSEyWOvotJ2vDEPWgjXCull
X-Proofpoint-ORIG-GUID: cuI3QkRVqVSEyWOvotJ2vDEPWgjXCull
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0MyBTYWx0ZWRfX5ZMDmkvtT3mL
 XzesZiCYofmPGcUCd/lHSiVYUmW1Gq4w56y422/cGqMfGohcS8TFMcCIiDVE0wfPzOPTI9xtX0h
 hMD7HYFsu6Zy9SKuYqCSoH2F4V+dF9F2wn2p523ZgGrH0df2HNjJ1V++0l3vr/hXUb46D5txp3U
 P5fNEkJobpRKZLoq8rGiEqnAtmrmuiAWvFG/fvRTnLgHm3+FPccedbIzie0uEwmyLyXRdi6wcuD
 HIydxeM3Ylm510OxetotNk8fSe/4HILNghL/c9cy7XKXCq1trEZoVQyeMSf/N6tnPp0MzCC5QaW
 TYrVaUUTBm3bhMYD3UenOSLvzdU6ONO4eiq7NtP7JJ7ppMJtzfXLaGoG7HngmrAo3HM8ZpBL5ah
 vEf77lDIw6t/wmc7TtkoCce54VTbwRjqoR2NtncNTaJ7+mbHyXKwjdesE2I4v6Egr6x1YVRV72l
 2nIi3B93zdyywtUv9Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210143

On Tue, Apr 21, 2026 at 12:19:39PM +0800, Jingyi Wang wrote:
> 
> 
> On 4/21/2026 12:02 PM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Nord is a SoC family from Qualcomm designed as the next generation of
> > Lemans series.  SA8797P is the automotive variant of Nord, where
> 
> Nitpick: extra space. Ditto for patch2

Hi Jingyi,

Thanks for looking at the patches!

I have been doing "double space" (after a period/sentence) for decades.
I do not want to start a debate on this, so will start changing my typing
habit. But I'm not going to send a new version just for this. Hope that's
okay for you.

Shawn
