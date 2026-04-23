Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E02366561
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947615; cv=pass; b=HP1Sub6cUuTQL/EyHgKJr3nm2bWmiKl6D97OB/YCiZmAKKbdONAvEYR8NsjxOLxgyAgLlNV45Jv/OfOrHXNSrKA9mPmH27A2nYPJf74E45AQGS/JC1FvH2Z1YlftMqWPWWxcCup4r7kacHh8ROKyA2CgMAYVnEAC6h3i+/9dD08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947615; c=relaxed/simple;
	bh=Zq1dBcLlC/BPF1qTWAUngzNC28ZXbvegTKbk7iOKDUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjCEiIyCgyeGUCeY5XIh4knQpNv9r7aw8mLnFQuWRsyRm7aO4uYfDdrqSFGnhTP3FGPmdjWUmhyqvuAjbV5HqW1KWJbOj8RPvhpHZEQfLxo077p6NBFS62MvWtCIl92PnSPyYfNQQ8N5+HchIY05tCfCNPYCNNZ3v56I5WMRiyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxiwEAdX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuDzU7H1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxiwEAdX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuDzU7H1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8trdi028821
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9yhHTik6+YYXDB6sgNYl9ejb
	E8BXg1+1GNN5kDTieNM=; b=NxiwEAdXy4FBw15uLotHzVnoyHT8vzjzV1LTdJ4E
	H87ecaF2BTTtGLGiGJyiekNsU0sTXec6eIY4OAcSyiLtUhQxE0QdQXTUnKLp/QHA
	tK/RJadSF1ZSSgzmvbiusS2EUHjSuYizACJsJzNl/t8/gyo0sx+noaM06kyPpzLw
	IQxnj0TNUI98PrjVtBUV3a1lURwI7lfzCzb+VpprrMDYUs7BBxX2EqSWVIuHapEi
	agPIxgkxYJ305GG52TUUtR6EZp9/SuOzeNgsTLXZOsIPnlEpZQx3JC4USbxOyEbR
	3kerizFvi1skn8ncIS00NdDyAZ/MnjkVhqiPE+EdUg1nmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm1h6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 12:33:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso12473883a91.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 05:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776947613; cv=none;
        d=google.com; s=arc-20240605;
        b=XGc3RC5J1dTXuSfHGAouhvWOCWC/EU4e+NHvYwnGq4YFu86X+6kLcqtXrNrgUwGJhQ
         XIhFZy4si/OWZX7E22FTAt8BxOQXc/RCYvJ5oC6ufwVzurAhUfullMuL2XeoDS6jK1oo
         BkYC80+eP6x9CSxX9BcAdHG7K/yITW4DYodN35uiM7M9N6ez5oLWA2RbcqquhQ8RUNev
         Jz1up0mPAsVGuovO4PQB+yu8vl903JKydBZj0NljrUM1qrF7KKTw23KEr9vSE/PncdEg
         Oq+zrSE4wSsEoDXmABUxURnQIuOX8lrgXg5XethMZAQNvtpgUD/Xt/FdtkYE6/ZQTSdP
         aLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9yhHTik6+YYXDB6sgNYl9ejbE8BXg1+1GNN5kDTieNM=;
        fh=i7piJqf/z+Agp5meOmWuAdWoRCUU+Tx0vTlpZeGn/i0=;
        b=JYBY/2U3fbcaFL/2wLzBHJITnOTecdb/cipSMTokgLTkmMQkXe0tBSxFeNTl5O0Vy8
         K5dSSwMa110QpY86Sb0PmXlPplKI+6frt56V1nW7ii2YqfRg4IJa3XZS69zHlvYeH7mF
         djXIA8fE1e04lXBaYCUtMPijGy1Rp3ktdqJahn8Wj+pb8mrLR7ik6yKC+kdVCv0yQmEx
         bDYeGg+dDSFw9WKx4dXFuF4kYljFA2OOVBEZZh/3wQEbmbdN9l8AH/LoqvP1zwb4FC+U
         hN9GeUBQIGWyIUc3wlaLTD92D8o1pZxJl++y+LTi4/w1lT5C2HM/Tdv4HxPUi3TwEiVq
         zjPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776947613; x=1777552413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9yhHTik6+YYXDB6sgNYl9ejbE8BXg1+1GNN5kDTieNM=;
        b=CuDzU7H1SpLhv6Fc2NpMnQycOS9FWcmeTqlQ4bem2fQSKo2rz0QlrwlyqB1U/VESM1
         QLlIjHszm/i40jwrcdS1TwCnAOmzLZ2UrkRflIlGsVHm2gUp0PhlmFFz93vSXz/Rkhza
         klRYr/IYGlS1F7aJ72fQ+AcC8JR5dXIcchQLA5K8NGj02VgvYCRnqvFTZfuvp075oVaU
         PRNMHWU8uFIt+wlOoQ+yAU9Wmb4LsOSVBegT03UavUiN1H+RqA3BmKqOpodntkGEcm2G
         E/IALJA/HVffHXL+1xON+7wEduCY1n3C73wgTO4osOiSX0yyhnmxeUWyA9gL1VC90Y78
         eAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947613; x=1777552413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yhHTik6+YYXDB6sgNYl9ejbE8BXg1+1GNN5kDTieNM=;
        b=XCseKLgYermRNQYEZ+5lC76oBXLhvanEapzlG7VXgwZ7GAuOO8Puq6mWFv4/OUjysB
         grZ2IYjQcVJkFYNEhDoqow/Kc/93OlNxNx0QV+P3mlZehJaa4hcm431pMXWhWvD3HIFC
         uzXSbR36etwQ9HlugsSUPUWJHWjblcLwQ5BPsNktdaKXNsZVkrfhdllO8Uz3FUthSjp9
         YLqKxfejkpFRiyKtYrrd+z7vUEfnJ738EBs+NXb6GjhbDPEsR3uk+/zfcRwJ09H3MR+8
         H1IHntbdu6vQ39H82bedDh/v7ueqPiD6WGbZw/8hUxWBA6JxPzn16XjndKROJgfJIGVX
         RbBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9U8SBS3C4Ny4zwwx5rM1abEQ3SyU1mol0MfTGlv2c+fwM4uFCmtlZ9AbxEnNZLCFPDgKw8iF9BSDKp@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/jwruInVNl9EBTMcx8c5Lfjf3vPITzftp6V9xlQp45MTmaIu
	cZO6KBqyv2jUaH/D5DAQPrw8FfTUmg0Lg9O59qlK4lYylYxj4bPMtCenZGH/jly2WmJ7OzUft3Z
	pjDL6utvtlPhlPPWfTvZkhLycGmyfY3uIToQxOpK/7UqlNuQNVDqEhjNS5TEElv+m7RrLCOm0NJ
	CqcrZsuGfcWUBBfh69n2vBBjXGKYPJfVGxyR/LpTifIazxRN4B6Q==
X-Gm-Gg: AeBDietoui3zOmGEStrp0zShAjygPZQM6rS3s664si/+9VQsKusQlJAlxjl1IgSm65h
	pk7kLaBlri4uYB9Lsgo3Wn7qFM1JgYE6ToGum7m5IcS9Au2x64gYP+TOQlFCTMWlRwfje8RCDul
	NntEW2/BR67I95ycZS5U41hSFDaz/XJubv355RfAwNMs/qeLWc4jl0fLLjy8BIlWEmiAlJUXv+N
	SVYbyUu4+cktC+dSA==
X-Received: by 2002:a17:90b:3c48:b0:35f:9ab2:a5c2 with SMTP id 98e67ed59e1d1-361403af9b9mr27480067a91.6.1776947612618;
        Thu, 23 Apr 2026 05:33:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:35f:9ab2:a5c2 with SMTP id
 98e67ed59e1d1-361403af9b9mr27480023a91.6.1776947612081; Thu, 23 Apr 2026
 05:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
 <20260420-rpi-7inch-v1-2-e68d5c9c44bc@ideasonboard.com> <3z3u5mbngmbzsch3mzs3twlh3aec6r7jokstzv3ghxyusrzt6b@jqvdnuiapx6e>
 <af71183d-70b8-4a41-8466-67123e7aab02@ideasonboard.com> <20260423-kickass-fat-boa-209f68@houat>
 <72c2cd94-0a8b-46c8-981b-4ad4a3222e59@ideasonboard.com>
In-Reply-To: <72c2cd94-0a8b-46c8-981b-4ad4a3222e59@ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:33:19 +0300
X-Gm-Features: AQROBzA9yKElJlZSZfMBUf0k2tDmMegns4UIL-mhm0IaKhZ3T9zYgupeAQGkFWw
Message-ID: <CAO9ioeVX6OChRTgUrUdgrPF+3s2_7vme7m0yb85pjYtH1MFskw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add timings for Raspberry Pi 7" panel
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69ea119d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=RF00TdSWAAAA:8 a=P1BnusSwAAAA:8
 a=m3ymF6_MsKiAG3528zsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=_nx8FpPT0le-2JWwMI5O:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: RiD5EWLco4i3raRb2kFqg5hcn1LqC-xo
X-Proofpoint-ORIG-GUID: RiD5EWLco4i3raRb2kFqg5hcn1LqC-xo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNCBTYWx0ZWRfXy+eO4JuRmkCf
 5CnxHRMPHK9Vd2cpp/GxIO73EPM0zjZl85KoPDXQP+9vrTerEhoQ6+Lrn7iYxgDZIzT1v0V6HhW
 TS9qCrbWFL/AEFuMWG/7uipBCBO6SO2VbqDHkL5v2A/UgMeobRDqQw/ktT9R4hDyYJXopcbIU0L
 suT3BGyix8V10FPLeGQpQ/9GwMWI5jzgMePnr0G99AtsRq9GnXQ/BRLUa6E2N4sy0wODOMspG3O
 dgu2RnHRLySLEG0Ofxg7TPHv26H861U7StpzGKK8AKNN4fcQ1g/TuldMsK4nlZH5MdWZS5bEDPh
 62Ih65oX7d8Lfn427Ay67m2/fk1EM0+g6xM3xVoT7Fb/O6OTdOFBwWym+kPbjHE31YLuicKzvnO
 FHLGuT18OwKYXQAIZZ1Fp2HA50GMBh2nK5iroGCWCpcpLxYEVQXHtHjcGh3E6OT73gNLRmO3/ih
 b6CnDDzYfuBTgR57Tfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230124

On Thu, 23 Apr 2026 at 15:28, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 23/04/2026 15:14, Maxime Ripard wrote:
> > Hi,
> >
> > On Thu, Apr 23, 2026 at 03:01:51PM +0300, Tomi Valkeinen wrote:
> >> On 22/04/2026 22:22, Dmitry Baryshkov wrote:
> >>> On Mon, Apr 20, 2026 at 04:13:36PM +0300, Tomi Valkeinen wrote:
> >>>> Add timings for the panel used in Raspberry Pi 7" DSI Display module:
> >>>> https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> >>>>
> >>>> This has been tested with version v1.1 of the display module.
> >>>>
> >>>> The panel is very strict about the back-porch values, they must be
> >>>> exactly 46 for hbp and 23 for vbp. Other timings can be defined quite
> >>>> freely.
> >>>>
> >>>> The panel is exclusive to Raspberry Pi, and different versions of the
> >>>> display module can have panels from different vendors which are fully
> >>>> compatible. Also, as the panel vendors are not public, the compatible
> >>>> string used is "raspberrypi,7inch-dsi".
> >>>>
> >>>> Note that while the display module has a DSI connector, and the
> >>>> compatible has "dsi" in it, we use DRM_MODE_CONNECTOR_DPI as the panel
> >>>> itself is a parallel video panel. The display module (as of v1.1) uses
> >>>> TC358762 DSI-to-DPI bridge to do the conversion.
> >>>>
> >>>> We could use DRM_MODE_CONNECTOR_DSI here, which would have the benefit
> >>>> of showing a "DSI-1" connector to the userspace. However, the panel IS a
> >>>> DPI panel, and gets its input from a DSI-to-DPI bridge, and the
> >>>> panel-simple.c behaves differently depending on the connector type used,
> >>>> so, DRM_MODE_CONNECTOR_DPI it is.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>> ---
> >>>>    drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
> >>>>    1 file changed, 32 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> >>>> index 91ab280869ba..e75eb20301f2 100644
> >>>> --- a/drivers/gpu/drm/panel/panel-simple.c
> >>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >>>> @@ -4208,6 +4208,35 @@ static const struct panel_desc rocktech_rk043fn48h = {
> >>>>            .connector_type = DRM_MODE_CONNECTOR_DPI,
> >>>>    };
> >>>> +static const struct display_timing raspberrypi_7inch_timing = {
> >>>> +  .pixelclock = { 10000000, 30000000, 50000000 },
> >>>> +  .hactive = { 800, 800, 800 },
> >>>> +  .hfront_porch = { 16, 72, 354 },
> >>>> +  .hsync_len = { 1, 32, 40 },
> >>>> +  .hback_porch = { 46, 46, 46 },
> >>>> +  .vactive = { 480, 480, 480 },
> >>>> +  .vfront_porch = { 7, 21, 147 },
> >>>> +  .vsync_len = { 1, 2, 20 },
> >>>> +  .vback_porch = { 23, 23, 23 },
> >>>> +  .flags = DISPLAY_FLAGS_VSYNC_HIGH | DISPLAY_FLAGS_HSYNC_HIGH,
> >>>> +  /* Note: the rest of the flags are defined below in bus_flags */
> >>>> +};
> >>>
> >>> This looks pretty close to powertip panels that have been used before
> >>> hand in those modules. Are you sure that powertip,ph800480t013-idf02
> >>> or powertip,ph800480t032-zhc19 don't work for you?
> >>
> >> I haven't tested those, but the hbp and vbp do not seem to be the same. For
> >> me, they had to be exactly as they are here. This was also confirmed from
> >> Raspberry Pi, the panel datasheet had min/typ/max values (i.e. not ranges)
> >> of 46 and 23 for back porches.
> >>
> >> Where did the information come from that powertip,ph800480t013-idf02 or
> >> powertip,ph800480t032-zhc19 are used in the display modules? Or did you mean
> >> that while those models are not used in the Raspberry display module, people
> >> have used them successfully?

For the zhc19 it's a wild guess, but for the idf02 it more of a certainity:

commit d69de69f2be105b2474c05a5ca4827aac3e80ad3
Author: Marek Vasut <marex@denx.de>
Date:   Tue Jul 28 14:12:46 2020 +0200

    drm/panel: simple: Add Powertip PH800480T013 panel

    Add support for Powertip PH800480T013 800x480 parallel LCD, this
    one is used in the Raspberry Pi 7" touchscreen display unit.

In the past I used this panel compat instead of the
panel-raspberrypi-touchscreen.c and it worked.
IIRC Marek splitted the multi-function module into a regulator and the
panel description.

> > It also looks like we have panel-raspberrypi-touchscreen.c and raspberrypi,dsi-7inch in
> > panel-ilitek-ili9881c.c.
> >
> > There's clearly more than one "7-inch rpi panel" so clarifying how it
> > compares to the other two drivers would help.
> Indeed, it's confusing. I'm a bit new to this so I don't know all the
> details. From Dave's mail to me about panel-ilitek-ili9881c.c:

-- 
With best wishes
Dmitry
