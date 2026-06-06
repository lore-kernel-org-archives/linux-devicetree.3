Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CEA3988E3
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747375; cv=none; b=mcTzUQHuN6jkPYHXSZ0S6bapuWoJAL6DDlMbY+FnaCmnppOiReMPiFx2EgR0Z28PFiJ0F7a6AlewChgJfysJQlntwv7Q8UX/Ix0zTxf/fZrkWYbUlNCDH8ChsvS737QHz3hHrJd2cgSQT0qXUnnpioTYfUDItcGGM3ujli8A/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747375; c=relaxed/simple;
	bh=oWWpN1zxiu5J8Y/bTtJzFgyjG5a1WOJRqB9bJO2rILw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8wgEWGtwGJyI6iOUmkak45N9f0chkNn8kPeJwf0uaDTu3IqQpkpy9Bvs+4zGYFWqxjbl/QObrgyexdHwFSoTnMK7bQ8wAC+IHNQzNW74G+M+UYMjcKk/e3N7n9Y9X1wDfoh2/6P6p/zln1gcG7BOE2L+AtVAFfyEEahUknw7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoOai+79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHzG57tC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoOai+79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHzG57tC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHJtu1250797
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HTLkryQUOY6UVfWCdPn3v73k
	EhjUV/6i8u7yum0ea7U=; b=YoOai+79/7ZSq6TWz/5Rd7v6nvjo4TWPR6UQZOaS
	oiXhuNUdPtgRA69dJY8H1rL+ESQPamWpIJVZe3g2ySq5RHcD6Wb87ZjoPW67vFdW
	Dc6who/MyzQgsxm5ys7/zdSjaNI+/nzUK6TQD7A7PSnG1JBP/4kksUX8Cu8Q4rdP
	tmIURpOtMz1203p2nKqNm5cVNTgYbSNdJeW4lHgbA+R+Oz50E8s6GaZ7a2TCUf2/
	kRjq9JoQtVaK6jOsHK2cdghLjEt+n5fCEI7hwF4BHdtJxr/PDkqUgx7kzmNcykSq
	ndNeZJDL8bbpNDOBPyr5mY+DTE8NKvHcH8rx5XjdooRRXw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf16ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:02:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c554284973so3415644137.2
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747372; x=1781352172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTLkryQUOY6UVfWCdPn3v73kEhjUV/6i8u7yum0ea7U=;
        b=MHzG57tCMGMZH6DKOvinuwvuejrWjK0DwKxN+pdOxRZC2HAnXoHidSRc4BevRp2a/v
         UKSMhWqPqj8vS2A4HamGykvzQNMiOLnvdebMZ4qEbXkLE2uvucMFvFVgKVU+M0o9OAdH
         2ez9O/tsOmbsO0hJ52MjN1mM32lU81IquhD/A6gXAWRKBmXR6S3dKebYVmDwG019E4cu
         f9fvQQGXjmtfD/VO06FVYBh8VLr4XA0RrBuxo59eAYK5VBHJt2Ox6hySSlqSQMLBG1ad
         XqRman8qIgFFX/rSw6FFeFzprwUmp+dv5bEdZcpynuY5cC5N5YLIYZvLDrvcOmfulAr/
         ktOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747372; x=1781352172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTLkryQUOY6UVfWCdPn3v73kEhjUV/6i8u7yum0ea7U=;
        b=QGFKfrcX6K4z/WZerjv9caLj84E/alZnjxSqV9Pvu+zmQRJmxZeAJeMq+zkrXY8+RQ
         Y6Q9aYa3qpEpvIGKCH4fBpaiFs0o/W5GCfU2pOzpvTLB2V7ELA7nOH4x+CZNcYmMVBAM
         hk3EUaE8YMvLnsHhg80ogRGPVZH7YO/OvCxpKXZdl9McvBEQdDt6F3L7cIaJlI/Rtger
         Ak8VAbq4lYKvljubWIFIfipvEHOFzW21PrFSpF8s8J4/dDZ26/sKI1ZgC7uJwIsVJU0u
         TC+Xn/Q24++aa/9AKpDewEWnceT1O/VVtVeke0Uaq9DdQJh16HCZnIAWiB+neu6Tq43z
         xFkA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZgGCignsKgeBmC1a+HWR6fCXC4XQzRgoOhbmGjLgw1r6XuMr6FaceWldWl4Ogo2rV485bBFKzFmNl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73h02Ris9k5u+qJhteWmRGe/cBRa8azR6yFut7TttG4/9Dgg9
	uQYUUNv2uy/r1+6oF0Go2269usunByoJrM0JH+n6ZvJ5F0nYCoh7o7ERUUy+Q8OsQPE4jzam1Hb
	PokH3m/uStrsBJQsl1ndEe1mRjq8KqQ7u8+BaEgGhNfSJ3APsU1VjQeX/yUeai+DJ
X-Gm-Gg: Acq92OGcwEYPynOhmUWR2YiJOxA0UIYaTz3WyJ9Io0L2Mcr7I1cov4sfR1ovwbFtR62
	W/VtJU29trbuBj30cM8wMhx3JSKdkUM9Qyyj2+UCMa9dyQKWUW8EFpmfzF6o8039K54UwyoRDgu
	dftyyxaC61EKgaxIezRrJJz3Mavbvct6Z8cuPs5zbiKSeCovPrS3fY9fOp9o8KWDkm+wyDCMk7g
	cMOZu4X//3fOxSOsG83w60cpKTAGLyrCGYUndANxHg5w1UGEgl0hvYupz9rFXQV2pHbOKVmC00T
	kfsRe3bkyNgMMK2W8RdHe1Ppl/5fy25wMiKxBA9Q2cXcJO+CrLtNvc6k55KGMVMjAGpxt+109wM
	rQw0JzoX6ygIhIPTeGQiEdzyluhv+eCuCs72QOGFbC9mARdDxwtMXy5p/YsGyX/mbUvtV4s6Rk/
	6Xdmt2ei6/fvp7oMLPNJDkUKN8i+2iZw7bHMJMDzTqFu2gRQ==
X-Received: by 2002:a05:6102:5cc2:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ff0a27a19cmr4452019137.21.1780747370806;
        Sat, 06 Jun 2026 05:02:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc2:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ff0a27a19cmr4451973137.21.1780747370417;
        Sat, 06 Jun 2026 05:02:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac302983sm31038251fa.42.2026.06.06.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:02:48 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:02:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>,
        devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
Message-ID: <q5asqrk64isjfoei7vyfg4esiibxws7x6gffsutqh7tcfqgwn6@6pv2zqx4ppse>
References: <20260605-device-motorola-titan-mainline-v4-2-08a7be31f05c@disroot.org>
 <20260605133245.BD3661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605133245.BD3661F00893@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a240c6c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=OQN141zOAAAA:20
 a=VwQbUJbxAAAA:8 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=tNN4VXHrT0xOU5zs9-sA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=LqOpv0_-CX5VL_7kjZO3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: JyKRvDjTJ5EdBWfYYjVJnY4MZSpMTrUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOSBTYWx0ZWRfX+XbysYockBgn
 xC1EKS2wqv9K9nYEmtxh6iGJeofraexNaUhJ1wwCZPP0jGSH1tTiWc7JlFNO5aMX3EQB49wZveK
 ci8jExt+Sd7Z50idNvHs0Z/KqpcNY9TvSPAY1gsNGXpUgE4gPnjLgxLRShdNIS1l6F2Y1qJIrVx
 gZdjUGrNSMG1oASHXz/ER0efdg1HVK1nspGsInEwbQWkpsCodgqwHvJcr007nfKj89qVxWriz5u
 IGjp6YBqYIDh/MSrWokNfQiwwns2d1OnAKVOqj/vOGS380TlSyvjmpxJHmPDDd9WqDAOxCuKSVh
 QIAjGqLXuCQlxSZxjNg5XVTu4DVP4sAQErAZ3yxmhEdyP5MByinX69OhyibeWLjBArUgFh65zLh
 4Fwy6bMEmT923oXK+jKjr9FhMIXIDPLKHmyJYH1ufPyrG8wihjZ6FsWSltCtObK9osVtnatOsF+
 bVU9yWgPRmXt0ZBbPkg==
X-Proofpoint-GUID: JyKRvDjTJ5EdBWfYYjVJnY4MZSpMTrUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060119

On Fri, Jun 05, 2026 at 01:32:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The fixed regulator `vddio_disp_vreg` is missing its `vin-supply` link to `pm8226_l8`, which will cause the display VDDIO to be unpowered after boot.
> --
> 
> commit 70499333aacadd0ef2c646a655f7350a4c0e3f57
> Author: David Wales <daviewales@disroot.org>
> ARM: dts: qcom: Support Motorola Moto G2 (2014)
> 
> This commit adds the initial device tree for the Motorola Moto G2 (2014)
> smartphone based on the Qualcomm MSM8226 SoC. It adds support for buttons,
> eMMC, a Hall Effect Sensor, simple framebuffer display, and a vibrator.
> 
> Link: https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/Documentation/devicetree/bindings/misc/hob_ram.txt
> 
> > diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
> > new file mode 100644
> > index 0000000000000..1609fb21c5448
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
> 
> [ ... ]
> 
> > +	vddio_disp_vreg: regulator-vddio-disp {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vddio_disp";
> > +
> > +		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> > +		startup-delay-us = <300>;
> > +		enable-active-high;
> > +		regulator-boot-on;
> > +	};
> 
> [Severity: High]
> Will this regulator fail to supply power if its upstream source is turned
> off?
> 
> This fixed regulator controls the display VDDIO power via a GPIO, but it
> seems to be missing its vin-supply link to pm8226_l8. Without the
> vin-supply property, the regulator core is unaware of the parent-child
> dependency, so enabling vddio_disp_vreg won't automatically enable
> pm8226_l8.

I guess Sashiko is too creative (or too susceptible to c&p errors). Only
two platforms use L8 as display input, so I assume there is no reason to
believe it's true for all of them.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
