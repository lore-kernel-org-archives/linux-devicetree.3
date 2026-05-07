Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49037881D
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152260; cv=none; b=DqgkGsE4mLKmPxcOoXlC7OoB9vf9SXG81OhllcWIIHm22JqyrHqvmMnIAaNLX668FNMZQ89o5d3AZM++UFFEk4OnzSHiIx4iCI+djtAejA7mJprcDor+M9ZfP3WXxUjiSs770GET3DIr9DBbdDaCXveO5nVfVtHc9xVw44tiETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152260; c=relaxed/simple;
	bh=iwBZ7AtMlhelEvLw+tye8c1q7oBAuTMT4QG11XTcpvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9HwfUQJX46tA1KNBwL3GWj3v5J+p6kAEmVxiAPz7HO7XIgp+6cLfVohQyw4kodLVe37TAChtV7FK8Ze5OEyL2e9mA0JJO5QQzTlViCGS6+xHJVyf4rJHw7PpjcR5mHlmdIAY0Xmf/QD7nh/8TlmUhD6OO+T90WiHCD3KrM+aQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8jZkoVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g20X+xxt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8jZkoVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g20X+xxt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pYP81424508
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Y1kuY6AIGy+U4i/Y7pzL/6z
	K08GGDx+3n+4jmLdQvU=; b=O8jZkoVAqt+2HLCrU2eOD6YB3L6iTXF67LpCaRSu
	QAseQv6SNf3eYEndOf+rlKeYTn5xvcmLoniRiabHTBNmoqEMId5tALIdR3xOYLal
	M80isMChprYO83Hs+kwz+mL4ar0l+0LD04kBgpK1seap2XZ0v0VI+meYkfLPzgo3
	KBDG4EMuoWNq5Zso9HhvywmqbfipwOrbHtnNVXWsHQgvlbg5GkRkX0VlgFlAuOP/
	XMvHY5T8+aYuRcvjrt7euN2/KcH6wo7D/lvgSKY71ochyglzsfOMjdPS2CMXeRpC
	XLTzyjYCysKfoMAX/LiT99/jDAE5AaN5C03ulU4NuObiYA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfrrh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 11:10:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575597e1259so795491e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778152252; x=1778757052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=g20X+xxtK858QKAdfgknvaE5wdXkNyjSMvfJhZsM6umA6INVGTekjmpmviDynIAbE7
         GY0wLAqURl7qTs0JYq3mapcEpWu2Fci6AnGvHS5lWqGGtjLs8omBvAOxFfDObaMfibhF
         PwM+jNftyf3QhpHC0hygrhI/driWYyGigVa1n8vhZcm/pYz6q4ceKZF/BPx4K6ckm0B3
         bAxuqhXMrUvK3olSICpxo3v0TDsKXKGpClj5VB/Wav5BaxT0xWZo1kQXQiPQXF/jGCcO
         UYnUyrkyA2H1y6I7DVw4YAOVH60PjlPH+ZYzE3cyu2qYSL2llSduqNx9xD4WpT/d+f2Z
         DikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152252; x=1778757052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=F5CNCbIR2ieoTTbD5ByGDx3meSND4YRhIPYXqaxmhV8tTQDh1uQerI72+0Pr8IUPGW
         QqMSZiGpjjvXywZIbqKdTC0D6KXZOYV7+NI/ZtWq5QSmY5eXr8cn1Dw/slRYPTNwFYo9
         o9idh7AQD7I20jdvXh6jXUuXcMAc40/UHLgTkJQYFFN+Lrgm8eGQ/yHomAO24FC6yQre
         VI3VgojIrXIKH8dy/OuYY43cy4av3ok7pGyyPLV2eX0FkhmJrbUj3Fggk/B9QYpKvUSk
         9T5w6SLRKdsk0DICng21I1IrSonOXWcAS66nwOHDsui+OLU8cWb3i/uGEjYDUminO+M6
         5gVg==
X-Forwarded-Encrypted: i=1; AFNElJ/3ZjNvmE8/RDPsDSKstw+3pU10a6ZhVHqNrrVDKaPHjjgB3SBz0ZiEtWfxjVjz++4Bzeby81KglBvX@vger.kernel.org
X-Gm-Message-State: AOJu0YxynlW6gOQPFr36W/NVKZD/3b+w2uDEZLAlwQP749jHqs1STSPO
	A88ZhBDNo+DItoKHqMyCYxq3K2i7ar+30Yz8Nppno7YwoJNZSiJtPazIWdgBImFa6WViy2rSrp/
	i8l93+fguEDNo7dBhdhqc7e+XEW1iZ7QfU/ARAgPijB2dAu8PlAL+FQYSJ1wRIT0W
X-Gm-Gg: AeBDievCbquWiZbxjgPbqUSD61h8ueZHjDAmeHwqTMcLLv1glvMsGplFvreG+AhPh9f
	c74I/Vek5trV1SFPW9RRdORLjCgmgcjESOdiiY6P81jtKB4tMFeJgS4tLDbfhHMXxdlS2whifXC
	2DE353hMWH/Rx76AAi31t5fiJN+6GpzXVvg7E5c+Py0jXMVUcpcH3NST7rQEBpCVn7oihXd8V1X
	F2nNdaSS05foz+cR6V98hu5IuN1zqjKvafSw0e++grVaQOgopdVA/qTEZ9XiiKlLksHd6owCtwN
	BpCR7cxXF9KUu9O+Rqhv1RcmjdWYaqmMMEW1dEJnpJW781EhGD24LruIu5nFPLHkZB3ZpPo8fsC
	LcGAIRVMjj7MXq02ZgjMM3RlGaoN6PE9OSBoUS7qZUOZA3IF4MQQJtpZN8ltstwufHaeIiSdYWT
	01IhY5bkVv/DtU4NXEa/39kodquIswU3kw7I5gf7cKL+jTJdvE5hEJmmdZ
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284826137.26.1778152251754;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284814137.26.1778152251228;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22de94sm5528582e87.7.2026.05.07.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:10:50 -0700 (PDT)
Date: Thu, 7 May 2026 14:10:48 +0300
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
Message-ID: <nfh7duwh3o6hayhxz4pxwfwng6fi6q4l5rlzlgjjk3atakw4h6@6xbyk3nppdrt>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
 <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc733c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=kzQ9Fxln275sraQuM_AA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMSBTYWx0ZWRfXx4n4d4lelMz+
 9VU6hKS0uMfDaR2X+oR06wUy8x9sma1fewq9J63eAWDz6CPq/TqwwaJlxiuk8Ntnyk1EkQOm9+m
 e312jy+radzPfNnWu2S+lVjBUIJMqQ0ioWinY6mjM5fB+HxhBqGjPvJDejIEMORQ52CemLrDO2i
 h6cVh7p71Frq2/yqeRdO8JwrzwXMsVkYhT8jetbYsnFqXfwHiEXG+wUMaxTaLveTBhXaVubkwrh
 lVmGgpDIxmdBicI1OsB48kUcbIuoEmEGDSeAqb4wkf2K04FO21hOJPIxaZ9Qu0zGmSaG59jLGHS
 e4PQyjKgDSpv0swi8D1iumC9HTzzJm+HxDB1wYouBMPycCwDxr1S8ZnfllZABxAJm+OP/kn137G
 PmX1AY/E2dQUa6tgu0lOflqDzUtcK4fhlXSDSZfqjSURzb+oRTz0v0t5omtrlaazDzr59sstnM3
 l3L3v7ylkRB9lGQpi8Q==
X-Proofpoint-GUID: FBiD3am488iNwZebCx-ALzxfO3GlFDpX
X-Proofpoint-ORIG-GUID: FBiD3am488iNwZebCx-ALzxfO3GlFDpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070111

On Thu, May 07, 2026 at 03:28:21PM +0530, Sibi Sankar wrote:
> 
> On 5/7/2026 2:40 PM, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> > > The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> > > Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> > > pre-determined algorithm strings and param_id pairs hosted on the SCMI
> > > controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> > > mechanism to control the various caches and ram is hosted on the CPU Control
> > > Processor (CPUCP) and the method to tweak and start the governor is exposed
> > > through the QCOM SCMI Generic Extension Protocol.
> > 
> > Could you please clarify, does this apply to the common commercial
> > Glymur and Hamoa laptops?
> 
> Yes, they do apply to common commercial Glymur/Hamoa Laptops
> as is. This is the same solution used on the windows side of things
> as well. There can be certain cases like Johan has reported earlier
> where certain oems are stuck with on older version of CPUCP
> which requires a the memlat string to be sent out in lower case
> we should be able to handle those as well with overriding those
> by using driver data and specific compatibles.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry
