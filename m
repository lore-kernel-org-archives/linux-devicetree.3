Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC5E41735E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349851; cv=none; b=QY8dIhknfXoSMYIOxVJyViRvcEj41R6NPPbRu18uRNO8zTR+dc0HUkcUxlCuTyLckInqYNMY/1taEYAIETFoS8yKS3GtpXpk7LnZn7uk7DQGY0FtTbjMyReCCmiQbZV+oeD/TWzA0SqdnfzTv41RSym8gCO1yCZf+nnV7C/42Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349851; c=relaxed/simple;
	bh=euY+KmOhlsqbzFJHjgYGwPowl25OoEPkxAZqHFyBFRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkGSceATAlwXcmk3IgrbatxK1SkYA34E/HZECKC5aP4fl45ZvnJYhh/09UQp+1+sDqs4cQbvPxtr7O+RsXdAskwHioQ2+tvvF6kxyaLqvqtYc3MTPyn4so4dNqxwhU2pjDCjkOdg1ubekv/v+x0W+6LxpFmZkq83pbJRZBFsbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lw7Z7xvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmpSrLay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lw7Z7xvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmpSrLay"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEHLB803566
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYCsnJxlsCoVEAci2Y2tWdW2
	BwZ2uRLCnXO1hko98pw=; b=lw7Z7xvmkSruIL2Cbny55zDYJFedy2/3xwd50Z5j
	L9GVNUAAUXgvKpTtHKCzGZ2z6mQbVIVdMycWmLXXoy4PX3/mPfdI4dOQcSrboFLu
	CSDXJdlrzr8N6R0OSwp64XRjG3TsvlhXIo9A9TnwE/xPhhLC/4NP+q7PB5713PL0
	4vlh+NlzOYN48uRJK6ogNfxfsKVIvQ4fHbxsWVfeaxlrJT5LQr0BT0nE/wldH8sl
	Ahc9qq3hv2RZLemwEYWfHqlA/MqimVnqJljhJUcmiXTMUSScyr5aWROWsY7I7aRm
	O+lo05VSAJ+nZjUlCWJC3kKv0srswoDukX8rmZpB3hXr0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51r4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:57:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so305287785a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783349848; x=1783954648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=;
        b=RmpSrLayzqWH1ecxK41+E3pHq7/0Hr/sFiGaHrhoZ/J1v1nqHLo5G47eZJfMCnQjOQ
         qleE5jG/TbAOlq2vmgFWjvsoprCgnOp8NskbPT+WQoUIsD+G4kyw9uDoMnk0yDx6Gm6J
         fWsSdxqbOFINAKUdVCXeKVzluwJG+HfU9+eSlSK8oN9eaRT7OuvGR6nXzqnXAE2MT0z5
         j2oF7QbBwA+NReMH4puvwPEVLgwGm0tvisfeZngpF0QDKJpUZM7+KOrIfbWnCXHFoCe7
         wVUn/OtyvH8soAfxzGkncmf8ZXXnxlNqazpzFVzQFu+e05J8eatoisLW1atkHLbHik7k
         cFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349848; x=1783954648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=;
        b=gwBdLM8gISDM1z7RaSJWDWvVjetCPIp2s7DmAIbbJZ4CSJZfJVowN4fdc0bqD/Sg8u
         tiBr574p2kovPFGbwroeowboyJfDd675wzXIQFha8d5NQ0J0HNh6abl+62Rcb3zYy7hc
         ST20vARQvbkn/VjZmwzWy1QMyVUnOfRmOVeg514v14OYLuwGTRTnmO0ih9PhEDumLW5a
         qd0xnl+PDo2xHJGHTDHBOF60O7ko2jNTQUuPOSFZaL78J2P6up4A2fowFtLcPVkgUPr1
         q1q9qYaOVlR+8kTizKhT07FDOjbcymGgHRRob8/JgT9GI7BF2G7qTHRxmaUVtg833ePJ
         y++A==
X-Forwarded-Encrypted: i=1; AHgh+RoTPP3nUaDmCpJDaXnwK3/69Fu2HCxfh09XrpiN2imn5GLWpadlpKDxKheI/Gq8vbf130qfgwU/qaOF@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9e2VOGYgJB6W1y5v2WP06Ynbi6T0Oqx/pd2Tt7GrZe0ntmq9
	SWayEtf9yY47g/w2aqf+/z5S1exOYXeWNnCSD1F4sG8bTAlenqK5mr/5KR+fjDbeEoR9YK6aqXE
	H+Dinny+z/FQsZi+z6hhg7600TOIRuwV+pQcjfriYIir2t/HQmooOCfyogY43fLtD
X-Gm-Gg: AfdE7cnd1a1r1c78XF6XRmKZlztEkDLogIY3R1QWHjD4+9cyLc7xJm38HlPWvmQRC9z
	IFXFooSBVYmGoD4pXvrbK0HsdicMQjnFsSu3bHT2twzQL128E7zLiAJOPYqpRejp3HAFPUwKxTv
	LsTb03HiMpJp6YVFwFvpgwLYDEYm/bW2b0aPN2OSN9asIlupvQrpZH15ws1g2a9lQksqL2SHCRW
	ZD6qpnxfdW547qFZn4RdOG8PM9U36TBlsJIzNVgc1Kr3E/6SGgLy3hYi9bMZNaB+2kNbe/9UfH+
	R8vaa7ggBAFkm57KHspomDF7hVcSP6777kt9YH2URc3gieL2Myhg47SzOSZeHLyy18bW8/1gIlI
	VLTjATLljzaUPgQ63v4HLTmrQrAkIiWEjuzAzVseJpEIC47bwVtbdjkLHywawYnYwl237voKJS4
	7jNVGMoDiI05oClk4N/E8Nwqgx
X-Received: by 2002:a05:620a:4101:b0:92e:8256:8226 with SMTP id af79cd13be357-92ebb56a788mr122718085a.44.1783349848297;
        Mon, 06 Jul 2026 07:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:92e:8256:8226 with SMTP id af79cd13be357-92ebb56a788mr122711185a.44.1783349847690;
        Mon, 06 Jul 2026 07:57:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad35edfsm23456681fa.13.2026.07.06.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:57:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 00/13] Enable LPAC on a7xx series GPUs
Message-ID: <mn7dmfbyt2hnvlb7u2vnxurqef3w45rrjanhkd5ei65sgasfnl@l73s4c6yqxbe>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
X-Proofpoint-GUID: GbyRbSJnZdYFE0xBbgDrM2JNyTrgatO4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX5wHhfPnTYNo6
 Ijw+RPbmW29jhkn6b6pphCI4vWYKGNheMHf6/CbInFYXWzlc5+CM9QXwfN4D3bnJGCkW9sqGVpJ
 RQKXBCuzLE7MePItToQXlkOsWI0ipwE=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bc258 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=5ytNcvzt7bZj-gOGiacA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX+YYsfXb2wBJk
 yMs65/7ql7up2+fYZ/R3HqSsvD7xEjzpI+aNlcoDRZq3++r6z8Z59GyxJfssmfxwgGmro3ImH12
 /ga29iDc76fuvkvzcDfGIsMM22o3D+I9R7RaXJky2vMm1J9lFesoC+o2RLVYn5f0lz0Mq5kDFGN
 lqx9AWuzm2eohbbb4ne9xgunf6mS9vCajPOYEqJoW72+goaCBZEc5n3oDZIW5/JRFLFLqs0rAoL
 J9QRyuGByqBp5ByzuDaZJzNUHkHo0AQzHf3tuf6V/sh9+y+VoTV6MBYeygEiE5IlpwBr/gCMa5v
 YVnEy2pohYd+SXQ8EJsjjjrlkT6NVZWS7wMXkpEN7Jg+UwXeW2gb252a/PQ1gbm+AW8+XxZt2lO
 3zVKY7bJcxcqiyVUe+wA1pu4wmkzV71mO6Eg80jbEpqCmxuYw8PhwLZ/iyB2Qpq/Af2sdZQINvw
 ggRtg6uC8TNjBmVLDJw==
X-Proofpoint-ORIG-GUID: GbyRbSJnZdYFE0xBbgDrM2JNyTrgatO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060152

On Sun, Jul 05, 2026 at 09:13:34PM +0200, Anna Maniscalco wrote:
> This series enables LPAC on a7xx GPUs

What is LPAC? Please explain (or at least expand it once) it here and in
the first commit goes to each subsystem

> 
> Currently hangcheck and recovery are broken as the patches to make them
> work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/
> 
> The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
> to work correctly.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

-- 
With best wishes
Dmitry
