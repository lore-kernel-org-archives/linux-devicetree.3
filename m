Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5B33C1B4
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589431; cv=none; b=bYsmy2bS4EZH2KPI+P6iiopUc2c8n3VQphCv7F4UM1V9WUPkmXNVh0xi4POObFzuiCvLiO7bWlsJat8tnC7OYtx2tQiuktPVxYpiL69G9Gz0kcTOr7tqjTc1YtIKHaMbRpfu/eT0HOeJVEIetUFJesoXFEr7pFghGIkgMPlzMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589431; c=relaxed/simple;
	bh=If0OESBCReNUYpJqn20IcHKO5ke2Vw7Nimz8q//Qmv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRaqfF4jL4V1fsd+tzV23HYeYuWbHKF/O3Yqf7AX8oRQ8Ug9fpf/QdFiVwrSB9cQ1JaLhBToaczCc2noBaNMmCk2PoGlOZr38wJuaTsq4mYqF7szNvlAsVfnPEvkMCn8HPmuGhmNNHMKxkJhLIWinBi2qd+piIf0v+duBBuGnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLUhXK30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr81UaSM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLUhXK30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr81UaSM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BJo4G944403
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 16:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeMRJDCQY83lNXXkwFNAye2a
	Lcac1O6JbkIjmAjjFKk=; b=OLUhXK30beS50RPLiM3dr/ppd4XXs1mcrm0qbFtp
	URKwTA5UCkyA+l5Qqcz4GTAuI7xvO06qsVyKfuM5rtf7m9QRk2N3rT2Zht2XP/aH
	FNX4pV9AksqQsqfATOyU/2D3+HscZiuNzZnhzdtWV4vB+Y1ZQdZbJPYiV5OQ06s7
	hMV96SnhDxEng4rNZwfOvm6dePsdhGoIAqRPXDx27PMz3gYM7l4UV0CdtS3c7yaC
	BHe5SFyx9SyMppYAqt0a4TID97erKNj5K+YS1CxD6IkTDGJfXY+7nI19CMEIbtJs
	lAbByvBLNh2m7HiIva7hWn/JXtrGgM5FxRQzmUea2AFKrg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d51ba4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 16:10:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so1179552137.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589429; x=1781194229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CeMRJDCQY83lNXXkwFNAye2aLcac1O6JbkIjmAjjFKk=;
        b=cr81UaSM+gLW0uwRw5WeHZxP2T8vDhLUZuw8cFo1blPwiFbcbe9M5UhqK3ZyuChB4X
         Yi74lGfPmaoL3ZxYvw20qYhiBXD1CYmlJBJE5wohp2ASZoKEX19rG7jxdLEnO1NDauYb
         ZOP7WZpYf3dmN4iEZ/4+Dxyt3urkEohcIDqdpp8lb9gl17tybYobgp8ubexfiuu36VEW
         Wl7gJ+0IPm5sriZMHLdJwHV9KHMj3WE19a2KbQpDem5pO/1dDdEh6UOAUQZX/sCDJ7jD
         Z6bjHbV4uby6dnxxpyjDPz6rhZR7nuIASWSj1a7SakszbWGaZ0QYSU65VOefgNL3lyhb
         JPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589429; x=1781194229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeMRJDCQY83lNXXkwFNAye2aLcac1O6JbkIjmAjjFKk=;
        b=Cosjanm0SKhCOcTvDXhij92YIWChGTTcw8PT5uCS1yJV2Efc1XDmYP50zq3Lnyt4BV
         7fBZolGJjbqutYjZfKN69f9w8s6cPCmdugW0I4Y8APqsQbvQIZZClwB6LYW8Tf1+2ZMD
         yS5VdYy3PmsZYsHSdKEaw6JnGRoZxVvgvwF2IKhtycz4zHnocSOXo26piJQJ8IbQGGTf
         n7cDoQi0IEI0Lzmw1UhUMVnU8EldPdGlyFmJOXs/Q/NZq7kUPoJFZR2ya3+5fTdBv7+G
         7AtoBC39llxwmCmEccwhalAzWQJUU/3D+raYam3mz0kBdaElHOnf27oSX5POxvGpZjoq
         geZg==
X-Forwarded-Encrypted: i=1; AFNElJ8W2U6fRrhtVtOPnOElAm/BJHJIB9WlUWK0csfrkH853zzFx7oPpjF5Ft50e5sQiRAp1uljjtRr77ke@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+P0GodN2G/6Ar8ltgZhfgZKJlHnLJHPOP+JX+eJu/llWZZqE
	ZpV5hqLxf3mpTJo++fYm6jb/wLZp1hoV/8uTYCm/4ARlqatqr8AP6X9W7K+n2HxsOchfTnnR1F2
	ZDHFLXx8py9GWlW8pzOkzf+dqsY0nZTAgC3VMtxAjeQDhGTD2shVHRx4Lc862cCw3
X-Gm-Gg: Acq92OHiwHTWwg58fhYk/b7IRrQzXM47tnf3LkM0vd/TmzJTpInsEVQLIjTMrkx/BH/
	uselppld5ThhCwu//EzSV3KhK1dekCwjch+FfTCDYSPXgK2XsA+ljQ3kUrVR6VeKH0RTegdBlGH
	gIaO4crIAWMutASUDp7iJCmPduIZOb1w6/PgYGeviih0o7RclMPv4VhZ3FkAhy5KKGWs4hX6Ogn
	+JLEx/Mg9027eL8UlmpovBwBw2TwU4EAhO3B7FNrIJKM1upxl1jAg/Spsoi7FBJrLicWEppsKDl
	2wiu4OP+CrjHV6nezLp5WKiNEBQ9AO7BjZKgHZ2ne9Lj937Bj/UDlJdQOLZmM+SKOq4UMPrbqVX
	E0eqVnG0yfOAx3A/bvAy6j+Sl9axVOlowTf1KZL66mZikhpfWR4eWlDBHj1r31s+RMStd6y7RtD
	QexrF6gFrn1jiTB5QwKSPsnmNbTwoKgGtaz5gJ7CjpRQ59wQ==
X-Received: by 2002:a05:6102:510f:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6ec53921cbemr5468261137.4.1780589428644;
        Thu, 04 Jun 2026 09:10:28 -0700 (PDT)
X-Received: by 2002:a05:6102:510f:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6ec53921cbemr5468225137.4.1780589428228;
        Thu, 04 Jun 2026 09:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm18215101fa.22.2026.06.04.09.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:10:26 -0700 (PDT)
Date: Thu, 4 Jun 2026 19:10:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <v5dbtuys3oojjmmpce4j46mgbegacs5ngtjrszvhz47fjjshbs@d4gotpult7p6>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
 <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
 <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
 <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
X-Proofpoint-ORIG-GUID: Oco3OgfJRFc4JOIusyLw2qinVQ9l4lPv
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a21a375 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dEnjAziRAYfcju0Vu8kA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1OCBTYWx0ZWRfX2KvcHfJWIbQN
 w2D7eBnKnEhurY0fBXZ1YFfsO9sfO7t+6tUItk/S6i9DkLYlRc4rupGXHvII1VcJNTl51QM6lXd
 5clIggS3ps+iA/NemFbHHOH6isWkA4fDCQlsa6SiJtgxFjHpKK9cQHSHuy3v5EtNVg6EsgoyfSa
 dJO+cFNj80i/+q7trWBplILN+vssjfS8cPRoOkf+J8T7diP7UG70ge/Kl3/kI7rjJOyS3AV8Gdd
 Nv+BB5Xbt3fh/Ox8C3PMoj9GyvnC/6xnkM2H+abzG8+7S+RNyDbVc1AXu6tVWUQ8VpYFsn9RNgJ
 4YOUdZd3jAm4NqP69jYneE2Y5msGi/d460rdpysyBTHI8gJpmsbx1W06Up5aTg0MEpmjMHtrUR7
 yCBYwiaAewl7RKoHyY5am/ympXlUsuiyMpj2NcVic6aquLtCbjqRh3aXWm8O6cSXaCw24giTZz3
 8Wkl6fL1Cr7yV/YuHkQ==
X-Proofpoint-GUID: Oco3OgfJRFc4JOIusyLw2qinVQ9l4lPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040158

On Thu, Jun 04, 2026 at 02:04:42PM +0000, Alexander Koskovich wrote:
> On Thursday, June 4th, 2026 at 8:16 AM, Vishnu Reddy <busanna.reddy@oss.qualcomm.com> wrote:
> 
> > 
> > On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> > > Add support for the Milos Iris codec. This only supports the variant
> > > found on the SM7635-AB that has half of it's pipes disabled via efuse.
> >
> > This patch appears to be based on an older codebase. There are changes already
> > merged in this file prior to your submission. Please work on latest code base.
> 
> I rebased on top of 7.1.0-rc5 before submitting, should I rebase on linux-next
> instead?

YEs, please. You are basically past one cycle of the changes.

-- 
With best wishes
Dmitry
