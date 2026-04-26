Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC8835F163
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777206275; cv=none; b=jBtdEd1Jh4NcwC1Po2qZUt8r8vdp3T72sb/J2T9fDnqTX58ektjgfscV+da5B1jSF4LcuNF92p2MqFlpC4vQ+j8Z7g5NfPUVuih3iUFKVao8O6Xv4Sc1PAS1kV21YpOr9tVBfXNMH4GS9dyQuvPwPK7c+1Mq3PkfwtQ7Oc4B43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777206275; c=relaxed/simple;
	bh=M8+16Tj1x6WZs0f2AbNxWFKqP3GGmOYuJQcsOgQ1kHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajEZg4O6AnmsH9JPFS5URe5FGa7UNA4e3T8eXVZvGFyqngVREkud/foh3hekT1/CUkHigHrqOP6os4ukMf41jAf7441DPVBWOANiy5mAPC1D7+S31XSvLWzvFl7oJrt5NvnsMtMt1G59+pMuseB71l4FterReDTQMT752zq/BVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBdSkHvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYcNYrws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBdSkHvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYcNYrws"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q4dHsp2240194
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 12:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbAF95i14HhsfSGXuY/tMJx2
	G1OOoMWvPHHUcpNBgbM=; b=UBdSkHvT9cBi2Jo8+qaSxIm3tFuFv4IjHRt4Defp
	J1pcgUKQsRlyAI6J6Y71om7S8eqnhHQVTuFCkx7ptJ7QA27qU7S/VyQUp9UcWtnT
	Y2IgVf4CRsOsO2xc391JW3oeaeZ3NhFzKUZ3gYWSh8cI67CjqLoauKwTlSZzSf18
	2m0BOY5JtPHm6EupG3ecLOWTCkKtN3KB0P/tBimb3QzkU11Zsc3ALX+aPIo4cRcx
	nGQvgRP5s1+nh7TQd8F/p5FV+C+eWZm32aB7u1/uuve1j2Awgs0FBtC1Oh7DGAME
	Tr11On8xNfWYgPnHwc7pgX7y17VyheojbE6BvrM+zyD9QA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrjsg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 12:24:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so101234091cf.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777206270; x=1777811070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbAF95i14HhsfSGXuY/tMJx2G1OOoMWvPHHUcpNBgbM=;
        b=eYcNYrwspCh0fuhbjGM5byEs1FMSjMtVVMNuYl6Wcg2BsOSkHHlBwM5cyPYc2V7zVE
         xuvjfwz7K2evYX8Aw4QioCVE6fRdj83KVFzdZ5IySUYBpzVK+5IiVQk7qKkRz4L4cFni
         igKCAgDHYF39gCIafEL1fA7LxGo3KE2WBTiXlZpOV6KQKdW6KKI2wWW+LTZnfrXt6Lvk
         wjVtM5j5/xspjttWxvASgiF4gewbv5Wk1RfC1lt2lXJ59z9PipKRC+zZNJn7lsU+Vjzj
         dhStSOsTeZQXXlO8bg2hxSzrHr7oABDuZ7QnaCd8jrsPBlktfQwDFjScJ4diE7jR6xBW
         M6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777206270; x=1777811070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbAF95i14HhsfSGXuY/tMJx2G1OOoMWvPHHUcpNBgbM=;
        b=In4ynkvsSg5TL7jk2q9pemdO6Gigye3FGtncoQCTWOAhC626PPTvLPdD+7HvPuA8qm
         6ZDV6Kbll4gy04wzwePvV/YKZNOHMqxqu+ruV4CNlGlbpEIvDPIDmRgwRyNZb9Kn7+Bd
         r1QvqAwtJF1czDXVh8vwZz6a6VT+o+QOaXbNe4aspGs4N2olROpTSFGSNZgdUnOF27LV
         jLum4hL0JrzOJmRlkCZeVnSvUy5flxyAe7LW1umaY9PtLxGMYbEehTHiZO8PhAEudAxm
         sxf5t3lyJ2jDwxnI8PmVj6bQyG4L4bMRjRnqbPpGiXTedwN/A2RWqrNPUJwSURWQoRbA
         TQ5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+LfWMZlewCU2mnZ6wdH0PnyYUmyWhxHjPL9vjNuAxHsx1+c1J5RVe0SE/nN0Gyn6m/R3v1c4VmMBia@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2IknWVXN5z7D5dwVzHdRo2pITvJ3FOsvkRqpWxM8/n65rHff
	PO9bRJbohcb+D+R1InATvjrwV73LcCDmtEpZvlCf2IYpJ7CHIBnYceBSpE7vkSDdDPSQSbldgVp
	2VpPeOYfSxycgplMdw5qd1kCJYXgf0D1bRpb/wCcv12zJDr1BtaeIQ2foteeOKoE7
X-Gm-Gg: AeBDiev0rV/FHtDD/cxjOg5wlKMXB95x4JX7ovI4J2FdLpBPazShQcPvUh825n4OgP/
	KVBiekXn3kn/8C+oPcj4V/8ss8HgS6ln2MgFcXlB5Yr+2jMPJwP+LEpfSD1w6Mvy9qk2bCxYkNt
	EDDNAVA/yeKBF/4lrTAs2euq94b+VGgjqU1n2Xz+87jcdi6a69cH66pnzgy7h9jk0/0PBeI1N6D
	/7MBqoKx5sNRW7NM8V6AhkxHz5GM6Cs/BUbhdUZUGCGoY/ETD3scFNrwAqnK5uE7LXB6N8QVRRJ
	q9PQ86t5i56DzLKIqepXFh39PmsM97k3N7evke7NDyJ27/GnKZXvhhkuBq6Ya5Lrr8UoYvsBLhh
	jIy22IwbjHGTn0o3E1HxRlv1esw1QspamP+KWbwm2M66CK3sWdEA5DSO+O6KjoP+vTcMM4zTJ4t
	pDdpqefQT+5nMhZXICuExnl52LkZeLoYZi4OpYeIT4Q+9TdQ==
X-Received: by 2002:a05:622a:5a05:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50e36c7395emr549145251cf.50.1777206270015;
        Sun, 26 Apr 2026 05:24:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5a05:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50e36c7395emr549144771cf.50.1777206269618;
        Sun, 26 Apr 2026 05:24:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm7396347e87.59.2026.04.26.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:24:28 -0700 (PDT)
Date: Sun, 26 Apr 2026 15:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 12/13] media: iris: Add platform data for glymur
Message-ID: <x5kuf3n4z4jn6qxkqshzzwofitz2wsh5ayjlpz24cm5weo4nqg@smtwh755sc3z>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-12-0296bccb9f4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-glymur-v2-12-0296bccb9f4e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEzNCBTYWx0ZWRfX6tMS9JQn+F0G
 tggHEK4+m9r4WTO5HYYlCSLZrcUSsJ48AJpTJLyNxSjXyMmaZV9FtlhD9tTOQJcGHtdaqvLm2o/
 TDwNGUoV1xfozM4/Plt80KXd2IAZPN/lUOEFaznqrtTqwdkEeZ4lwhDgS0t5g4CxH/0VIFuDrhW
 f9v6tQCsniOn8YbarWM1vTCsd4qvT1TcgMbKdCrq20KIrNq8/cNcllnupHzhMJ5SZuj4fNpnid6
 d4rQHU8V5wdJde6Kc0dTusBZASaTsPlS/612YeYlpCX4G4bTx/VsEQ1aGmM1J1i4XMmDhqdR4+T
 l8byv7ZVp7Gdl+WS3VdzN60aFK+bVlQvCI66IT7ICOsKDOM1uhd5MgdGpgDzmCoWSl7j8wKPi1g
 UN7uuAASy4ucKLPTFi1Q+ttqHPxdhODPGEl2X5mryEJt5SD+z1LFh4cXbFOa1CxuqDLNejhnKKE
 x2doyx97WuoZmTCT9xA==
X-Proofpoint-ORIG-GUID: 2m70DHaPz1BIsJKFgl3DMLK6wPwrGaps
X-Proofpoint-GUID: 2m70DHaPz1BIsJKFgl3DMLK6wPwrGaps
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ee03fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=54w5cVOzKzMHq45Zt3UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260134

On Thu, Apr 23, 2026 at 06:59:41PM +0530, Vishnu Reddy wrote:
> Add glymur platform data by reusing most of the SM8550 definitions.
> Move configuration that differs in a per-SoC platform specific data.

As a continuation to the previous patch. Compare your commit message to:

On the Glymur platform Iris core shares most of the properties with the
Iris core on the SM8550 platform. The major differences come from Glymur
using two cores, wile SM8550 had only one codec core inside Iris.  Add
glymur-specific platform data, reusing SM8550 definitions where it makes
sense.

Even for such small change it is much easier to first describe why you
are going to perform your changes in a certain way.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

-- 
With best wishes
Dmitry
