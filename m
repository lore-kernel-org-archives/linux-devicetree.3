Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D42F7F01
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868362; cv=none; b=lyfCrMqnsO+JcBFxvJM5i0GNeMFtOwgq14Ll4+Y3xMBFv/Utemo6uw/99Uj+I75zpMduNegX70QAZUEy9OrWLiQjjZwww3d//Y/WWS+NY1yCGnXeh4i+poFW8bS/UyPNZdeV/ETx/gWC1stEdxy0j6gR8qOrk2dsQQTQpIzkmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868362; c=relaxed/simple;
	bh=sXyzQOism6s0iMWTs6y8t96TK1C2Rb+t0dl5WHR/bpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQqT0QP3hAYyZ8wSL1Xk/wySememuZIYzkg5xoj68YFZ6WeVRRnIBfx3ZmnX1pcIhbXJtGZagAj1XBGK8hUWVd6urlFtfr30Tv5rH9GvszK/kzxLaxT8ScwEWrV+AYoTrGf63HP6ZG5LlFYAdIWCOPzi3PqInp0XvmrhuoBwDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACVh28eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjJFaSx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACVh28eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjJFaSx+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ek0IZ440376
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27Zx13bOX1sLVHA2pgAGb40i
	Z5XaOQdOLc8g1jx0NY0=; b=ACVh28ehbEBp3l5AAnzU44Cao9/pJ+gg1EcWgAvk
	BxlbVWAvvciNFfw0ko3vyyhv0grSB+fwIGBBubeDuu3fffk5bM8ESWflWZLJYQaM
	ONWhIVRSonngg6reY/4OXmPwrQT7SJSV2TOS6Z+fvYRKJdJL6CQOsT6LWq60bpMx
	5csvHicf6p/XcLUBQrHrD/Cj0O9MWNLpKzm3/cGJKNn5VBs5Uu9bKUM+t5njtN2R
	794eDLObi152XVTnopJ3QbU66SOcvo8f/yzGaaqPhIFd9U4ys+XRXk0lP+Y0PTAj
	g1wwbYxFHGqhAn60PUEJfPsYR95OzXMsaihA0E97oWYBxQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwb1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:39:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb3f8969aso2596793e0c.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868360; x=1781473160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27Zx13bOX1sLVHA2pgAGb40iZ5XaOQdOLc8g1jx0NY0=;
        b=CjJFaSx+ZiKKWJOYlnoMd4RSrjOq7grsTCzwVXPxALXdLYRPOdVS+VSQscAHd8cKUO
         Lj6Yu0ovf1Llyqk7wPHFkoSgnm84oqTi4ekOTqNIL+d0u+S4sea004NOdvqhELjmdJtK
         2EZEOm+4RwymcG+Qip78+51gy+hMGFnhyK6BylL3Y4CZOsJ70L2jd7agI2I7dbM+5PRj
         NCMknfmw8glz1g9N3/W2+EDjPADY0hULwX+SqsWSOZNL75IBk6unpS39n2UuP67RDqEh
         SuZTUd1ADafGUpKkOazBhoXPUnTCpgkjYMPrE2J+CfLyvESK54e3Nm4nHOGvzd5ZcA3W
         viJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868360; x=1781473160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27Zx13bOX1sLVHA2pgAGb40iZ5XaOQdOLc8g1jx0NY0=;
        b=GCxfU1NO2FD9a6LnmN9m/B16SBGjk/VaOTgYCvm2+trF6AXpr/et4IW+i2zHX2bNcK
         aEyB1fh1WQGuU52eWTDPAL51QneaYYx2bISn5L1B+T5PgY57GEEltuJGMwhfL43E3P7T
         WhJvqMF9GGD31+z31C6wZixkqLvNl469y49eVMPubc4ou0RC9/K4PRonEQwfQNp1zAeg
         FMGHq9QzKkWHvhZYWvFmnvuiaGjcx3XCu11kgh4+VFKiAB/r/1XjasehFnMjndTtROFs
         1bpR3muDz8xNU9cH6iHUamep0wJEyKMRTnX1Sv1SsDeuXyduj8StvEYhfNCZIpUQOhIn
         jtaA==
X-Forwarded-Encrypted: i=1; AFNElJ9owW8v5bE8XauFXroCgborAAkBBkTZV1i5nEzBn30tYOGhL8KVzvCKyg6c+3uWRW4ymshnY2YQ5aSH@vger.kernel.org
X-Gm-Message-State: AOJu0YzFVqNYbSSi6Y9NB8GZ1JvCLbldOs4ASFsFOTt5AQmBIE3BFcxM
	65WQHW5dOugDg8o5IosEvTSZM7/4OChCiNDLVSa9ScPBWIUNk3lB720dyz7FhGVR3u8c1nFnr/s
	WBZMQ15QSR866XMIxuvR/w6wc7tGTJMgSLHCIe0S3KwCYqLKTiXEuAF6z3vHr+AZH
X-Gm-Gg: Acq92OFiDLWGnacaS3uY/4Rz4vtsYAdmYLp99F55gaxp+9FBf3z1O4hG7/K1dC+Mvqy
	iXV5ZxVJ1183gfAYBdk4vWRsAbFwtwNGnW1PUN0x1AvagGdR4sMo3OzT7njjii/aYiUy12IzOVU
	oTguNb6Iv8BbjOau3+Q46NoXhoDPscpukPAjeDzd4JrEvy09lIb+XTKk9dKH/gRocejGclVhdAv
	Xc9xtlvtFDc/YF7CqrJHyTyArS5pfp/iakPyJeqNmTHSni12/eV8sKG28ntsmCYp/jNicuyDbO7
	zDohzhCh9ZPL3ih3bh1lFKjP+KOR0jcNRzxGCNATmmUv+3dOevBfZ/cSMc0kXU6vrLq1g87J2iR
	DphJosh2Zc9RD+DX/6uqJumGvvtJFqx4nUSFEvW648fz++OquqnkrE3g6ABOqyETrHSfFPRHWEE
	KDwCAPYL4Ckh3ejZqOYXg8V6XsfMXJJotk+Jm6pkjVyc1F9w==
X-Received: by 2002:a05:6102:5f08:b0:631:26f6:7016 with SMTP id ada2fe7eead31-6ff14ff2034mr5977365137.28.1780868359864;
        Sun, 07 Jun 2026 14:39:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5f08:b0:631:26f6:7016 with SMTP id ada2fe7eead31-6ff14ff2034mr5977356137.28.1780868359529;
        Sun, 07 Jun 2026 14:39:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac1esm3319815e87.54.2026.06.07.14.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:39:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:39:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603143923.58E1E1F00893@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX504kM0KnOK2+
 /1cXesqQDv9YFbPeDw7iiRipIIHmA8vZaJkbT5vi+8lIohG+O8p5M2WE2iGiMsulspqK2FcfZQ4
 Ogo1JkVOulS4QP4nFXKOG3kHLNvh/Ksz2JU2Mia44dY0+3eNybwIixwhHIFNXY6pR+IPIWWw8Y1
 IDZx6lpwKF+07wzU4IE/s3ViTnTwlQPaNrp4653Eox+DdE3Bh/UQQaJrsMr1KFVUXQJkls2mBK2
 9EMWRoQA+7HxOlS8ZnnP3pkfgvI0IBMyhLefy0Br+phQguMa9NFsUWcHbsY4qnPnPMpZc9QTC+c
 7KefveMnSA5kdgwcYm8BYVGJQaasCCs79HeMtYFiGpvQ44MWiBFq+e4niqAvrd+q2ZQCxJTOPRc
 Vvd+M+ENMMe2MFmtSXZkTo98dTPQd4gIRyfFSlPI5LS/4bp4eUGuR8LwwQrxV5hZHnmZ6e1sNl5
 2ZGHvB6FwyqaGIZI7Uw==
X-Proofpoint-ORIG-GUID: r1qm-54DBeUK-tZC8w79xlkJzQceU474
X-Proofpoint-GUID: r1qm-54DBeUK-tZC8w79xlkJzQceU474
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e508 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=s3xQa8otug5672-2qowA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217

On Wed, Jun 03, 2026 at 02:39:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> - [High] PAS metadata memory is permanently leaked upon every firmware load.
> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.

Hmm, please check Sashiko comments.


-- 
With best wishes
Dmitry
