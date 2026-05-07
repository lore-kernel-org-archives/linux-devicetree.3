Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8244396B96
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145053; cv=none; b=m0pDeBw8mFvE4ZhRJADFtHctjqgOftlyyUsoHgqdrAfrDdqTT58DcLBjKYaMcqIFRoHoHZ8fhibQO8+niNFm8K88vtYvyzzagp+fZdLKp4XwQ8khTddaZYPUYjSj2lOgUOu8KhSdSkzdVnrp0CJjcCppevF9uUjhW1thnn27boA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145053; c=relaxed/simple;
	bh=cSbnmKIeK5PiH7jDW+BQqyiKxH8RY05vb4L396PVn/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5BXyKq0dIXedGN/Mk/yhiYR7vgAhdB2ZZairO/2gj/tSVj2+g52eGek6ZMd+6Lt09Ft+awjngfzcYlktz4LHPvsfHm4YbdT2L68MEr7LPz+dfotOTZGhmzsUlcadAyQrhRO9851VXysHpWKkC+xrA60P2gkl+30KdiBEFQGKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaj2kPf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaayxXqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaj2kPf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaayxXqs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6478mElD259747
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 09:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiLRyqVWGS0Ix+7Et8ZETjKI
	EZ4pzdPJfw5gz/TlT3w=; b=aaj2kPf7Vt70KA2i3+8H5rqr4GaTBRUxUXfFCAIX
	1wdBO8jPUfsMqMrznswtbQ2P2Sc+PW6u3Lv/QSqcGF6r0+iMf3u3kaQtK6o9hdEQ
	CbqLEGnxg2KU0oLYXWLl4EXauJIGscXmUQ7FkaJ5ATmeVNCi9CPdyPreNdMhujls
	lo2BJ7dWx4/ULLNGvksEnomZ1gSIjLo9AVuTUsGBgxibOK+a9ikaCy7nV2o1vnKy
	+7+q98leDPrDHpE1aow5LsCT1+nLVzy8Pwfnb6CvPbz7NcYllukprl0QwQL2LNMG
	cMQ0cNd/S3qW7IY5fCfePp5fy9uOvRNQhHlP8BRedEPrmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8sda9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 09:10:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d5b5d607d1so118746085a.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778145043; x=1778749843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=eaayxXqsFRTvarNydVcHFRARBFPSw+J57YxMg9pETfh8Dga987mHzV4BWW/Np7q1u6
         g3MtwRlgZ4/rQksxVHQQC8hyu5qCqtpMHtKyd/wNSMP8q0I6bp86lycopKq+FeOBuKPo
         NpLT19srU4rmTZH1UMu+19x9fCIuFl9TIfS1sdKzQMGIv97rsHnoH7SWVVHEjjqsZywM
         Sxpft5Hd5cGHKWV3zLyFrAyDiFaSJiq/qQhN3Or2GP0TXk2ZJ93X7KCxnZnPEaxGHYwv
         kf7u6M0+fxHKa3WueAMgXYneJGNfFvv1cPPfyy1cFfYmezT+GzBajtZi47wIu8toiRii
         68ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145043; x=1778749843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=DdKez5+pYePr6vyFQGTtufQ6V3F+MJ5nH0MytRebHaNWu0FLlQyuIlRQm81ENBszQk
         VDcWWOE860GKtjOHQggw/WQBuCNblWZ8uY1RnYFYn3Lxagws/DqYNNyRdrPxkSSLXKxZ
         GNrY+BHISnKg6w9pmKtBq0fch/NYjLTWZmKUJtTyOnLgzhkK4MEQtdzFUd6I3ddG5sbm
         m/lLshNsZrWQRR/WHh6FOZF9NcavP39G0o3TYJkGKS32ipjTlMOrUb6jw6lI8lj7JoTS
         3gnNl2QmAZj1wbky4l1iAGr2oHonT3uq1VzhQEMtCEpXsPg9Lnk8zAwSr0cbbjW1vrGK
         82rw==
X-Forwarded-Encrypted: i=1; AFNElJ9e4adS0NMsyuDaCJSJ00PIALmZoUm6Al6rOHbOOMGueOuCQ4vCbD+fAirZjoa1jvfPRN+z7HvZLDnd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+iAkSKehis2RVinOKovx7eD7jNyo7dknT1CLens7TC1zehMrr
	VFyPnq4RIcSfl6TW5OXElBDWz/KVvHEtJLRi5+aVKpLJCfUfJeT5KnYaEDYZJJ3L11pBgxhXTLC
	BgjbzzKM9ff1Id+cC1BZkTk3cTE2Ca3pqPN7YpIA+ewjLVd4vjeb/vPUs+pzDfJM42616JeEx
X-Gm-Gg: AeBDiev6kYvWbu7c5P8wqqEHdaXbtkwffEOfTwpnLT4skOspupwCw6na+thnknzSm0p
	7dwfFmTIFwUoewhT/JCtEd6rCC74B1MBeZ+XvmX9KwrevdH8lk6M4H1b8TMFahcYv4KHpoxhK2z
	uylE+rHhMDX/jWYQh8lH9CEJbj+Vz6CQxmqlcF99Nfji2+pNzXpCb3XAblw8liFIxl3NTZ1ukiG
	Kps1wE6legiFwi6OAMWUHRkUkoe3/NWOrDKW9p5NlRLwHhT/MsB4P07cj3DrYMu14Pvrdu7TIz2
	hgcBPNUx+8313KMwQVxOVej9srTz95qmG439pAc+dU5H6rY8Yjr72qzOLVMLG78xlZjY4ZOqDQl
	CCrU51Wb/jOv9cor8fvTF1VSpAx28xuGHlqOgymJwuklfqNCmfK3HGAXsd0h/WrWatfnPcLM3hY
	r7IRLBS2r9gSyda0ArPKbM21NsQs3iHQIZKDtqsFSdXvWLBrpk6E9IkU+5
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989744185a.44.1778145043097;
        Thu, 07 May 2026 02:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989741085a.44.1778145042666;
        Thu, 07 May 2026 02:10:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86e65fdf6sm3822632e87.78.2026.05.07.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:10:40 -0700 (PDT)
Date: Thu, 7 May 2026 12:10:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fmOAlvyCnjfIX85ZBG5GB_Utsn8-vve4
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc5714 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=RJIkCpciCD5dGSa3Y80A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fmOAlvyCnjfIX85ZBG5GB_Utsn8-vve4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5MSBTYWx0ZWRfX7py6V3q8U1d8
 ePISr9T+xWznoHDreWdvuJoM9kiWWhV5cIf6E6ZgjqJwto2k73vYZbV5fOOis+mQFGdzoAe8kqZ
 HYU18uhodQkvDk29Q6dG1oqv9sA/CylorbDiPMIIvczYS9gsJ2D7An3LKjhgJuxPN2w5mWWIZJe
 uK+Mek/dxwI7uJyXIUaHTgMsCihtaM7vRt3ffRMdNyHOGu+t3mEbcsw94TZLTIh/MoZVvjN7A2W
 P+YQuHt8vM4dWHljmDYb+YwnkPgq7cHoKNy2BP/GfwGKMwz0A31GUkOG6Z4CZivPxXcPgunPg80
 Y5qhGYL3a41I+aCPvgCi4/Z0pW7BFl+JzoQm/81sokJxD9pdTrUFiUIKLGCpsn7DTRSjhO7BSH1
 3gloNF9PJjZKavvrsdl8eUe3vOIIbsUwPOF9KDXTVNzfLVH8D2nS7QneDSovj6n4cdkz3TZZBQt
 SK8Q4JEfpBKvFeNrtlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070091

On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> pre-determined algorithm strings and param_id pairs hosted on the SCMI
> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> mechanism to control the various caches and ram is hosted on the CPU Control
> Processor (CPUCP) and the method to tweak and start the governor is exposed
> through the QCOM SCMI Generic Extension Protocol.


Could you please clarify, does this apply to the common commercial
Glymur and Hamoa laptops?

-- 
With best wishes
Dmitry
