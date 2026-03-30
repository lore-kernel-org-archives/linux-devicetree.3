Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3250A3E0C73
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897421; cv=none; b=cbBZE6oJ+mAgGLkjgTgfCT7D9qGesOXTj4A3Lwea4puL9a7a+kGm6nYpYjwnJI6+GNjQzX7wszbPaY6TSzZ3kB4DHXFS4Si/FKkJqj1VsDamzfAk/rc2VFYDXZGljZIpiVeF3XxhiPnGKbezaj4GMuaiASLD0nuiJAh13Olhy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897421; c=relaxed/simple;
	bh=MQdfNe0iWrkeE7odJSzoRgjqdWdXch7HoJrElAiYXOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNB7nk34szzEUXM2VB5bN/RM8w41FvRraIvJST15YN3Fp1bSwP3wLLKJuxHH/6TsUzuaBsXvzspxHElaWoxZCc8gP4imarWhH6/Zjk+usdvVis/g5rBiUdT/KA+3f6TTbh0XSgMI3oKY5sWuixQxq3mi8zaol0tzoredEOdiTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvTu5zeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbrwsFUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvTu5zeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbrwsFUi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGWIsJ1402784
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=; b=CvTu5zeTqot+M/t2
	XZndndwcEcFl/MjZVz7ykGFy2qSz6PeyyIVVlYrUWATz52el4T8kk51j0stGS2Za
	g7lZHJL6ZyVSLIsLZNcvQKXv0gTA1D7wJJ6DmoOHV6ZHDUtrBh3fEhGI0oFZfFdL
	0G+SSp6kkWCPLFCzaYv2SCJhOIqWvznwoT57vgmybsCmf+fSlyQGYmmb+kOKYdwz
	kYnGy/XDd/XRCguXYnEzNph/cUjXg0jYbygDaIPdq6B3WVXDqePIz9epRZ3Uz2lG
	jRroIwe1lGR8c6A093ttZpc1sSsv8QqMtW7KaBV6zTI/+sKP4YVZYni6l7XZ1JKj
	05E9tg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4ha0b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56b67e8c2f5so1825172e0c.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897418; x=1775502218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=;
        b=GbrwsFUiC96UrpQgguNaFumxlFxLfkpM7k/dUDrFO9ZBRcX6WWj6dOvSAxWyQKszPy
         HjyuCetbAz6vE6W85b63/wuhYVZfqWJhBGg5sQtDHLMzroJXbODdVzeveJCunfYZdJK7
         fWdwRp7vj7cCUxo52ykf3IFXwnripgvHiZVl2GqHTsyG5IGTV/YGcd4JmgtdEKEELLKV
         D+Y8bMm9JEiM2s2MdhM9WWTE2T/LZGkaVrOVVm3dHnPNHzApK2KW9oHTgSbzSkekp355
         ziO9jWdsb9z20ZoDNNH2V5L8RCMbYHPaJnivj7uBx8hrKoJO/S+GRLk1QA4ne/ZhfmAm
         Kccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897418; x=1775502218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=;
        b=bHFznv7kpnSpqVMdaB2b6+3mlFzO76R7XwqZUEJfIH+YKYa9u3JlrZnGO99HsQNfWA
         PMcoRh1dnFiN+DoSVJWuXcwtz2IPwvAzDoxDOwSGz8z72M7LPHbUCVlrMOHhn4JgEqcb
         JdUniSdHPoP9nYyk19rU/sKHb8PJeWt1+p49QzYZLZEcjrTbjAuCKC6TgcGf6IhtHnEx
         cwWaxgpmtckQDO4fAWorQiRi+rbAxbaYNdsQDAWN2MWhjHRvzAO040L2btabeYIi1X2g
         HVA3rfh0sy+RieRu9PrIBrgMPYw84SwRROSCAlxPCRPamUG6AIOdKYqj3ZC0BvMz/Q2u
         KtKw==
X-Forwarded-Encrypted: i=1; AJvYcCU8kOM2wWBrNg1bcLH9a/hmOe4pMD+2jMARO5llDGsowZJCPP9l9ZlpzsW7HwdIKONAdrjiHJF/py8O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw89NbwnpMb1W30v2W8NHTBXR7Xr9Kfnn3c7O++CIJaTWzLUlCQ
	bxTuSL0RG+qfE4QDfAoboxjJGIzIfrbKHCBe+OrdjysyabarGDP6z0R7yUsWtoQIebRqpqcTKpL
	G9Fwf56WJYIyhdCgZTmSvfp/oPrFi+R3kQElP7Qj8ZrN4XrHZyGRJKoOq5QZzmrDi1ctxzT6e
X-Gm-Gg: ATEYQzwxyUAwhtb+Z7hgmHH4lABSacyUVaUNBz3UTc/xhezHxRP2S3hWcKJeEBiUMw7
	iVCJYGwd35mfrEK12CvIDdoV28QCV1mE7JJNkCUdrLihg069ynTQ/++OYlEfKzOM1bLkRLxkHzN
	zne6rN03K55i8S6BDtL6F4C5lrQK6/PcTlse1H4YSqaizccCMkBsviSuTvsg4kRr40dbVcyxUzz
	b2JkgdVRryBtJqICAMFTuniPC6leh6/Q7NZberekxJJEA2tvTdUX2CtfQCoKuRuwp63xreEHOxS
	cmrxUM3+3w+Z1aXO7EtwZyW1mnf2LJ4TceLsdQOVKr83R6Ks0uTzql9AI1RL3sIRViUgTJutcoD
	gOB5sPfAtemX2lUH4ycd035uFcTLz5WGeNH5YAmdgvysRenYb0SrEcl8nse6YHAhkzCllTbmMlg
	Q2aP3/NuomSonxUGlwAkS0S8qcqaXYZ03rTKw=
X-Received: by 2002:a05:6122:f89:b0:56c:c88d:e8c0 with SMTP id 71dfb90a1353d-56d4a4d60demr6241992e0c.6.1774897418239;
        Mon, 30 Mar 2026 12:03:38 -0700 (PDT)
X-Received: by 2002:a05:6122:f89:b0:56c:c88d:e8c0 with SMTP id 71dfb90a1353d-56d4a4d60demr6241941e0c.6.1774897417788;
        Mon, 30 Mar 2026 12:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm1845663e87.2.2026.03.30.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:03:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
Message-ID: <apuctb5nyxpkljwttvb74gcxcv3pe2tvu3yut3xpeze7l5xkzc@ej3msenxdrx2>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
 <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
 <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfX7/aYNCor6UXS
 31Rf5sNUU1VcHXKXwYly+1pOhyGxAbheyogVWgmgIGkHN2Uzi9RthmuF4yi2IkdSjbmmrp2Sn3o
 BEjoGl1JEf6/0QGyMjpsfnc3HNpLSXbpYCrP0FLa0vz0aX3CtE4gg1B2HrGpTauy7VMdXxdFMLr
 NB90uSPA/bKec5ECkzuewDYoRsHrCE8PL9f+QGAuA772WJFkSXOmCn3D6Vph3nRguykthS1pjJ+
 8Pm9s9kxU3BpkVcWsV4cvav6ER4ChM+0x9p/vF5KNg14eK/aTaS7xmH2vZMkqgubf88J6HiGMxp
 UH1a8WXhMXWVveCFfh5k92ki4A9SAFU7ydn7QntlexWqFETNb2HnXPPHJmmYad7wyF5j0PwdTQ/
 YbSDftdvUG558ZIAp72sK3tZv7l5yYAQ6/ubgmvHVIYRZod10SNhov9ahbuAUF6nkZYdCIuPWd1
 3sjTMP79k01bYha5V9w==
X-Proofpoint-ORIG-GUID: lH8EPcwGl8TYVRAkxpAsQmq1BHZYGmGs
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cac90b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8RI0V0Q6YUoWoVOrNxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: lH8EPcwGl8TYVRAkxpAsQmq1BHZYGmGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158

On Mon, Mar 30, 2026 at 07:08:45AM -0700, Rob Clark wrote:
> On Sun, Mar 29, 2026 at 11:57 PM Anvesh Jain P
> <anvesh.p@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> > > On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> > >> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > >>
> > >> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> > >> reference boards. It handles fan control, temperature sensors, access
> > >> to EC state changes and supports reporting suspend entry/exit to the EC.
> > >
> > > Just a question, is it possible to force fan to run at full speed
> > > constantly? That would be helpful to keep the passive cooling minimal
> > > and get a more consistent results while doing performance profiling.
> > >
> > > I see that you are registering a cooling device in this series. So I
> > > suppose we just need to update the cooling sysfs nodes.
> > >
> > > -Akhil
> > >
> >
> > Hi Akhil,
> >
> > Yes, that is possible. The cooling device registered by this driver
> > exposes the standard thermal sysfs interface. You can force the fan
> > to full speed by writing the maximum cooling state directly:
> >
> >   # Find the max state
> >   cat /sys/class/thermal/cooling_deviceX/max_state
> >
> >   # Set to max state (force full speed)
> >   echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state
> >
> > Where X is the index of the cooling device corresponding to the EC fan.
> 
> Getting a bit off topic, but is there a good way to associated cooling
> devices and thermal sensors to the GPU device?  I could see that being
> useful for nvtop (which currently supports shows GPU load and memory
> metrics, but thermal metrics are missing for us)

I had a dirty patch, providing temp readings in NVMem. Probably I need
to clean it up and submit upstream.

> 
> BR,
> -R
> 
> > --
> > Best Regards,
> > Anvesh
> >
> >

-- 
With best wishes
Dmitry
