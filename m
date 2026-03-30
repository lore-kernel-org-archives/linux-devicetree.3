Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543473D9DCE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880844; cv=none; b=C9HdUvHgKJ5Siv+TpoJUCRD+pLvQsjJIIwqGngYbQ2VjaNiMelkK8js9BWwNWppuf6JWZBbIQCGzPuX3s1Kr/RJzkpYjLkYhYXrI4HDIEK6CQDhAHnQlGvLBUi3KxNQ6GtRNGprWU6VwmB2AAmv8+J7HRYmr3YTGA+lY4+uQ8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880844; c=relaxed/simple;
	bh=9Y+yFJJexfP19jMN/Su+gP3NHoI3tkPOa2xag5BKfL4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QhEBE7+GJr/iNKfdOX29wxvlumKRmMCWf5Qm5R5JZ16h1venZpux3h4GRgw0+X1hgL++rpLvr/XInjedCwkUEcmH+mjz0EXCVZaByFTD+GH63Fl7Rq4gBORogkUAvosmB4ohCVP6iUGTXU83TNNPoYAUc5RUL/KN+zIaLmH3BAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5EMU2Zz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbNa491k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5EMU2Zz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbNa491k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDi9h32458373
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=; b=m5EMU2Zz+XeFpE7d
	P/6trP/hHs2jGhkVuRJ8Q7vW/NjI/1+0WA51UxXI7uRIyqmSK/8YYkL9N/SDVOMF
	EEuT7b9CK6yneZ0+ezCAYQW25rKxyU0h1RsTiPfYQuvcZZmS4Hyl6l7oRmyheimf
	JoOxRs+rDPB4JSWKqOOQLVdr5eDHm5mntk7hqsQEP4sfKzYA4FwJMrGM6aHgeqNm
	yT+0LmTFCw81Ji0P8IhX5WCW1orILnrupyB6WUsXyn11OHrVbvjo+5+zNF50It7M
	HtG8G5tGmJWhUXAA5QlWFyPvRFLLqM4527Tbe2YGX6kz8gtFkNVqZODq8Ogm8qhU
	XPhOSQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmsg5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:27:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffcb2bef48so1312488137.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774880841; x=1775485641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=;
        b=gbNa491kubeR2Jab1UnQvcKmrlm8JbXGVLjDqxHZZygMiJjicEi3+5mQBm5Y8FpRo7
         c7lykjB5e5nTE0kRn4BQLf7cW7Xe3k4Fd2vJHgtlihVBnoAlTPHPzGCoxAymF2otyIOc
         joB5QmMlJtsn8w0HYNl3gW8sj/7j5GfHzTKVip9LhT7BfV0yzYa1wNEG+G7vhaPMBJyD
         YAz0SBTngu2Wj47yyP03t+R7QkFsripZvxo1wDL2CqojySgNkXZa2vxJG8b1bHvhDe5O
         frkGK+Hw80J4CL4gs1S5UKcREL6tqHKWJ7WZq4mcNDS0lX5bDMSv20+BvUlPwhnixRjB
         Pk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880841; x=1775485641;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rds9SJnq9SG6ycLbiiJRTFHpUactXCCMN4gZ0ERDYj8=;
        b=BV/xIDInPKojDp7KcqjnuamnAi2SWN7QIKed0yFHVDkVyQdoaCb917o6CvIBV0ADck
         3R1AcDekdKKIW0Zn9XDHYd0VkvrutI97GaC1x8ahPx5kIBbcDRtGyt1CrFuX13AwnUcp
         OIIYonW2LrLz5+JR0Fq+MDXcmf1DANz/i/YDhfXqRNc0j31cZPKYXW7L2OWzn13z8yw3
         J9BGzRZu1xz7iemcqE96J9IAbjd2fk1+NGlw47St7pjAmkC/348/Tm1laQ12s5oKHF7I
         fg+WuKgLxzuvO6Tu0XCIY67dm2Fw0Mkj3XX2U8OoSXVN7lPmaj4iJQ1lAvFG8PRHhKNd
         DtEw==
X-Forwarded-Encrypted: i=1; AJvYcCUL20PBjA48jw9mXaDcEAQtJegt32KY4Cje+0mgW98YsBiDAFK6J0m67hROYScVjclGWV+BSgHPEgYm@vger.kernel.org
X-Gm-Message-State: AOJu0YzBVZCWmG9GRZB8Rol0B7V6Qn97TcGX9vXR6ICdKm/TvmM80q7p
	yUzZZphsb2RT8ObTIZbzOCgCRnO+GS3f6JytJYEts7zjgklkHP1GSqcmbgRYYMkAQVY2s3eLC2Q
	+zMnkkM32QaRN31NjL9r2ta0MO9XzzSoWTL9zS79hYOvRMT3aZvCSGMNj04FUZiqP
X-Gm-Gg: ATEYQzzePH3yZdpL3d9cUGu/lgYXEQHxBtpEXrM755a4jKZFM+Nwn1tRX/4VHKmLeF7
	ackzfVTa0w3wQoNjyXWZHi+nxa+GNrAp1SW8q4Xj4DvG+MtmLXXjNm5RXa6fl84BBQiFjaY+wHw
	Za+HksZNHPij/HfeHQMxuob+FKR0Sgh6FdGjT6AZKwFnEXnqgHCWCvIeVPf810T7BU76nBtONVV
	gj2oo1brPzxmEPndzyU0cV84upGcGY/mTqCJ2/nxY0M0f0h59hQqXjeQNNh8CHL1Njf/Rlfy5En
	G4IHeSnZYVp4x7dYcOvkZjhqiwASpvxzCk3CE3uvAxOfFPUEqDw3/FJzxAgW7ElonEtE+HLGJ4e
	99hP0Ln8VcgWrq8dVIUfXZJbPSR6wIhIAXO1wykhfOW87gbyRgMmFHL3ux2UBJmcEYjF5SqL2K8
	L1gjVQ4LliEhqaSgxR7VcjstiHT0KKoHUsnnMhV6oHyyjmVbfpPi2FN9gDo+wGx4ax8YpzaS7re
	xnYT0O/X1VET8A6
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-604f930a02dmr4164994137.32.1774880841463;
        Mon, 30 Mar 2026 07:27:21 -0700 (PDT)
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-604f930a02dmr4164980137.32.1774880840968;
        Mon, 30 Mar 2026 07:27:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff3esm2667651a12.3.2026.03.30.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:27:19 -0700 (PDT)
Message-ID: <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:27:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMyBTYWx0ZWRfX8ZPGuJW7hhVk
 n7qMfSoj8gMXxjhARU/Ta8Lb3zPL09jkA2zTKuV92OQlqtyM2l/l2/qV80V6MzDZU1PGVwn7J/T
 xgUYetC3rkg99T0KC7M2I2umLG4mEB2E0u2Z8LuqeXm6DFndsTdWunFD1K9BFooKX1QpqosvebU
 x0H+wH2mJt21UT7KU2sNrfL8TX2Q1vlUwJkPhttH6jSMTTPg1Hx0xr+uCapMXAvDWiIwdusHc59
 KHH+s/z+NPOZPszuOx6ZfbimUKppU+4PcIbM52vDGhZn56AWESCDcuHcbyO/K1lRgzy3PWE6yUf
 ZfDzxd2PYla+guUhWac/m3+5ercYOg7lWsXkGiE5e1yiyyHDqoqLGlc1CT0ZDokBP/EjUFVsv3U
 jhiQHx2F70o+qiwEwR8PJm0Ovi55ldIRH5UM63aWqoUsAXKLg6736ngue7dnvOVrVKdmvLaxmMl
 9fX5th+vJ03jFjacjXw==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca884a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0fAIJR1rb9fCs4FPyLUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ncZBTqQmA6UFQ_W0dKm4scQeOTQYbsg8
X-Proofpoint-ORIG-GUID: ncZBTqQmA6UFQ_W0dKm4scQeOTQYbsg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300113

Hi,

On 30-Mar-26 16:11, Bryan O'Donoghue wrote:
> On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
>>>> And then your CCMv1 or CCMv2 helper will get called with
>>>> the matching parameter-data.
>>> This leads to userspace having to know exact format for each hardware
>>> version, which is not nice. At the very least it should be possible to
>>> accept CCMv1 buffers and covert them to CCMv2 when required.
>> Yes, but a new ISP may also have a different pipeline altogether
>> with e.g. more then one preview/viewfinder output vs one viewfinder
>> output for current hw, etc.
> 
> My scoping on HFI shows that the IQ structures between Kona and later versions have pretty stable data-structures.
> 
> It might be worthwhile for the non-HFI version to implement those structures.

Maybe, it depends on if they are really 100% the same
various IQ parameters are in various different fixed-point
formats. I don't think we want to be converting from
one precision fixed-point to another precision fixed-point
in the kernel.

> I keep mentioning CDM. Its also possible to construct the buffer in the format the CDM would require and hand that from user-space into the kernel.

I believe the CDM take register addresses + values to setup
the OPE for the next stripe to process ?

Directly exporting a format which takes register addresses
+ values to userspace does not sound like a good idea.

If you look at the current structure of the OPE driver
it already keeps tracks if per stripe settings, only atm
it programs those directly on the stripe completion IRQ
rather then setting up the CDM. Generating the CDM settings
from that data should be straight forward.

I really do not believe that such low-level details belong
in the userspace API in any way.

If anything whether we are using the CDM or directly doing
the next stripe programming from the IRQ handler should
be completely transparent to userspace.

> 
> That would save alot of overhead translating from one format to another.
> 
> That's another reason I bring up CDM again and again. We probably don't want to fix to the wrong format for OPE, introduce the CDM and then find we have to map from one format to another for large and complex data over and over again for each frame or every N frames.

CDM is a much lower-level API then what is expected from
a media-controller centric V4L2 driver. Basically the OPE
driver will export:

* media-controller node
* bunch of subdevs + routing between them
* /dev/video# videobuffer queue for raw input frames
* /dev/video# parameter queue for extensible generic v4l2 ISP parameters buffers (with qcom specific contents)
* /dev/video# videobuffer "video" output queue for processed frames
* /dev/video# videobuffer "viewfinder" output queue for "extra" downscaled processed frames

No statistics since these come from the CSI2 bits (VFE PIX)
on Agetti.

This is is basically the current consensus what a modern
hardware camera ISP driver should look like to userspace.
Anything lower level then this should be abstracted by
the kernel.

Note both output nodes can probably downscale, but
the viewfinder one can do an extra downscaling step
on top in case userspace wants 2 streams one higher res
to record and a lower-res to show on screen.

Regards,

Hans


