Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF9231829
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672867; cv=none; b=qfQeJO3Ski92ogz3V9+0fQBngCyOZrshXRKR6uxPseGsyUJb9+VMwqpoRuI/8aJE75Pvbrr/PSxQWJ62gFDx1hrkCGsKEtKuI6oF7w2lWj4DIdTgrfV4TnfYmSuzbDKbsBLPKUSA0Zaa/v3whJag/caT/6jHnt9zM7SWwgVgXE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672867; c=relaxed/simple;
	bh=7JY7/FNWVdO8WNBTxEvbMKPvcpzT6h5rT9FLh1b+QjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5jQfSk+Zs13NcwzsKWvMhiQEbucBweYYzZsTbKfeWDdVycMvwbWkX0ymfOPDB25Al1Ga6Zd55Rd1rjVkkaiVLsfhPVZxt/qNU+42Zr4Ff8Cqjy4Qm26NP2BSptNEx8vLVB02NVejvCSsAFRoPtq+72hn33y4MzDKzvjPqnhf4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1uZhEUi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvDACdJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1uZhEUi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvDACdJU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlTer2580342
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkwJb2F4kWD451ILQAg38v+yqTZKdF3O95LJpL78APU=; b=A1uZhEUiNW3+n+k/
	7jJpNljDOy46ijhO302hfr6dIx4IHcTTeNq2cwOvr5BXO9yHwJD8sEdWYebMihLd
	yTZHRkFltZGjH8jajP70UJbT1gP6c2yf1XY84My39pzZIGqFgpQcjKH93wQwgkQE
	X8o38Avst9oUdT+y2/2nVOJzS80+G8pn4m/2rtTXYujHROniuQrGhqSsxIGCkQuF
	z6KNMacy+KhHTVZzboWRDz/2RchNPukJbanRehjP6CJ0w8vXbVsHXL+4t6lbTck7
	fyvi50mVNq9WzfX4Hbnkm3fzcZ+57liX8Mfh9Tar+4uqBuIQvcY6KhunHdZ07akx
	7f7M2w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e13xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:27:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso98197171cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672864; x=1785277664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkwJb2F4kWD451ILQAg38v+yqTZKdF3O95LJpL78APU=;
        b=LvDACdJUzWZFvlXWdeRWY3E/uBxtJ9WVfao4zJBJAStTkRvl/RrLcc5gc4vVMqp1Ja
         kJVROziinUdu5tjh8F6HhIF+lBosgfYWyTjePPlPL3PwR4N6/+Bnmt09hrfz0lGoayMd
         9r18ImOd4cSTsI25nGtTZObKMDGyAFAFGOIPaMSaxIXSoi9BXfmDE3F9rndBFrp9r9/i
         fPN2IfgYAZW+HQ9YVssqz6pa4Ar0zs8Suu1J6aPdxKy/OgP6j0XCN9u0F3uBeHHi/Wt/
         4l7jent2HbjHiAUC/xk1N/27XWiQk+K59wdLsgjnBbK6MLyLXanEj5iErSiRdwzx9s6X
         BxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672864; x=1785277664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PkwJb2F4kWD451ILQAg38v+yqTZKdF3O95LJpL78APU=;
        b=CN/2oDxaj7kPvRAR+iYw1eKVY62nbvUpdrcDrHVL4UxzFi7KsvVSsMgOiQOV8x5CE7
         Uju4k8/0hyfzBTSiMZf5/GfDt2yqkJ+ekpWEW7uXvqcwt9TdWbt3A8/uj8vh536szgcP
         xWwYJN9jZ/k9gvp/a23V550tyRrLGv52DzRgjEX+xPJI8PEReHTFU33psGbuy7dgkCZz
         2IrwisDlJ62fDtrXbpr+zyYfuFE9KXQUcaFlLBZkiBqnJ2vItBB8fnm1abGC+/4yi2Fv
         uQi0uet2WFiFINxzulnTH4tuqnKlKWZzIV6aZnPNIMOfeGl1/IkQBX1F53YIQcv0naNG
         TqPg==
X-Forwarded-Encrypted: i=1; AHgh+Romyg+C9nK0b9LKTjjabGAcCez+6xPhhEIweEaBtcn172UjBJaxAI7pvnNg9BcsjixoF5EoT+APBrxf@vger.kernel.org
X-Gm-Message-State: AOJu0YzVG+xx+QjjZvUF3VpooAsx7Y4SaBkqCbr0Ic5GJWTw58zGEVH5
	z0RZOPTSz5E3SR/UTz5IUujcWyfg5Z0mtJIAIUT3spxJRn1W1KkjlpMxYZ9xw8O+cpzAhxWDVPX
	FT9l7dTmvg8aTWcFyZuwKL7Wv3tWDubgvTmb475K1PuSytNP+AbqfFFr9cSd8el4j
X-Gm-Gg: AR+sD12/r3ocNMhcwDjtsT35jI1BoI0VxKEWalzeTSTeSWAL+pr/4NKwA4gtmcGFbNn
	yIeZAAcwyBUv1tuDVGTM+zLgGi++f/SaqfZof6y0+VnOh0STbsBVO56NBe/MmJwNipa9FGTnwvp
	TdIIt7/eL0VN6lJfge85FyePcm2vKxcicHSbuxoCIJVRjZlN/JYGQNB42Sz9IGNXxoPWhp//v2n
	jJinE85b0g6V6j0br+yNh2vUmUHk0OeM0VJQvERzyzpYgBs8vhB9G5ZRvgvraPjjcMvmkLt3IKU
	QroevfGX1X4P2Tx/QldaWys+R/hBHHzUIOOpuK3Em0fZ95Aytqs1BGZia9dpyz4cTRcxOPsJ+sN
	Vijr9BduyK8iaZVzJyjRm//E8wVo+c47YggTgi4kFnbICzjSxo7P+ZJX3DYrOgi1K9WW6cOh9ZD
	NT40FRFLfl7rQ4Wg==
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr19025441cf.11.1784672864195;
        Tue, 21 Jul 2026 15:27:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr19025181cf.11.1784672863755;
        Tue, 21 Jul 2026 15:27:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50f18sm142241e87.82.2026.07.21.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:27:42 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:27:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <vfj4efaef46cldwve4bk2rat27atpqtfyliewkbragm5wyrchj@ke5vcubecfui>
References: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
 <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
 <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
 <15957c47-f8bc-4d92-a6b4-88c9a546d807@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15957c47-f8bc-4d92-a6b4-88c9a546d807@oss.qualcomm.com>
X-Proofpoint-GUID: QSSc3esVPMW4T4olP-39tjUC9_xLDYNR
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5ff261 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=X76g8Aq0_Hu31Mvg_koA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: QSSc3esVPMW4T4olP-39tjUC9_xLDYNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfXyc9ytgy29o7j
 rzAHKJuol3E5E1RYOIDvZq2OmRfZT2AoRTuqDHDDYQ7UBCs3FkdbFzzuCyjWNxoCA+6g/29I5em
 VHtUnDpC35Gc9lmpo5p40NJs3c2QRVutdfT5UMLdyzHxYjZakM6VmKjCJHVRYb7qwn39nBgP74B
 jd9OrUmq5wWveczLw5wXDCFcYMNitm/BjTNeku1R79cN4H8Auyi/KeKJ7OVJFzvUcBm055DSsr8
 wGYthea/zpy8/c6OYI57elQQRrtWqfvynBpd2UEiDwOIb/enXKFORgd/xbr5AbI5TjyT0CDlnHl
 L0oHKgY2jNQ3tsBFd10FHxZyw2X82PL9WUDbGU6jXnGXAFiMVseOHhQjfum4NZEnsFSFjF0iYR0
 AKPuGJdqWR4S1PhWI63/4yFMwlsmORv0c20GhT8Hzz0rb9wM2xN9gyNMH+qNYvw44APRZpy7YyC
 u1UhD6NM29qV+G3lESA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX/+Zgf9Za6X5T
 o+Z9PrPJn09BvPT6cqX5p780W5oi1dWDBmDVVtoK3dCFNQiDCMHJEppIE0MH2X6sYnreXxf8gIs
 Wy9DPYFj93/oOiF6F10sU08zGA6FIJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210232

On Tue, Jul 21, 2026 at 02:35:42PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 7/20/2026 6:35 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 20, 2026 at 05:37:25PM +0530, Arpit Saini wrote:
> >> Hi Konrad,
> >>
> >> On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
> >>> On 7/14/26 9:21 AM, Arpit Saini wrote:
> >>>> Hi Dmitry,Konrad
> >>>>
> >>>> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
> >>>>>> Hi Konrad,
> >>>>>>
> >>>>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
> >>>
> >>> [...]
> >>>
> >>>>>> Normally the backlight EN pin is controlled by a backlight driver.
> >>>>>>
> >>>>>> However, this panel uses MIPI DCS based backlight control with no
> >>>>>>
> >>>>>> separate backlight driver. Since there is no driver to assert gpio91,
> >>>>>>
> >>>>>> we control it via the panel's pinctrl default state..
> >>>>>>
> >>>>>> So this is platform specific pin , we need this to enable/disable
> >>>>>>
> >>>>>> the backlight.
> >>>>>
> >>>>> Handle it from the panel driver. Also please fix your editor to prevent
> >>>>> it from inserting extra empty lines.
> >>>>>
> >>>>
> >>>> Earlier I handled it through panel driver, but this GPIO is specific to our
> >>>> Qualcomm Daughter Card, it is not going to the panel connector.
> >>>
> >>> So is it an enable pin of a voltage regulator maybe? I'm having trouble
> >>> understanding how this is all tied together, given the panel driver
> >>> uses DCS commands to control the backlight status
> >>>
> >>> Konrad
> >>
> >> No, it is not a voltage regulator enable.
> >> GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
> >> The WLED driver is a boost LED driver that powers the backlight LEDs.
> >> The backlight control works in two parts:
> > 
> > _that powers the backlight LEDs_.
> > 
> > So it is a power supply.
> > 
> >>
> >> 1. GPIO91 must be asserted to enable the WLED driver IC itself.
> >> 2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
> >> and controls the actual brightness.
> >> This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.
> >>
> >> So the DCS commands control brightness via the panel's PWM/CABC output,
> >> but the WLED driver IC needs to be enabled first via GPIO91.
> >>
> >> Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.
> >>
> >> Dmitry suggested , it is not appropriate to model it in the panel binding.
> >> The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.
> >>
> >> If you have a better suggestion for modelling this, I'm happy to follow your guidance.
> >>
> >> SoC (ITP Baseband Card)
> >>  ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
> >>  │                                                            │
> >>  └── DSI ──────────────────────────────────────────────────┐  │
> >>                                                            │  │
> >> ┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
> >> │ Qualcomm Display Daughter Card                           │  │                                  │
> >> │                                                          │  │                                  │
> >> │  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
> >> │  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
> >> │  │                                 │                        |   │                      │       │
> >> │  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
> >> │  │        │                        │                            │                      │       │
> >> │  │        ▼                        │                            │                      │       │
> >> │  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
> >> │  │                                 │                            │                      │       │
> >> │  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
> >> │  └─────────────────────────────────┘                            └──────────────────────┘       │
> >> │                                                                                                │
> >> └────────────────────────────────────────────────────────────────────────────────────────────────┘
> > 
> > This is a nice diagram, but it shows backlight LEDs as something
> > completely separate. Usually they are a part of the panel. Are they not
> > in this case?
> > 
> > I'd be more interested in a different representation of the information.
> > What are the _actual_ panel inputs? Decribe those (and only those) in
> > the panel bindings.
> > 
> 
> No , Backlight LEDs are part of the panel, I will correct the diagram for that,
> and regards panel bindings, I modeled only the actual panel inputs.
> 
> Hopefully, this diagram will clear this.
> 
> ┌─────────────────┐         ┌───────────────────────────────────────────────────────────────────────────────────────────┐
> │    SOC Card     │         │                                  Display DC                                               │
> │                 │         │                                                        ┌──────────────────────────────┐   │
> │  DSI0           │         │                                                        │      DLC Display CONN        │   │
> │  ├─ DSICLK_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSICLK_P/M                │   │
> │  ├─ DSILN0_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN0_P/M                │   │
> │  ├─ DSILN1_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN1_P/M                │   │
> │  ├─ DSILN2_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN2_P/M                │   │
> │  └─ DSILN3_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN3_P/M                │   │
> │                 │         │                                                        │                              │   │
> │  1.8V ──────────┼─────────┼──────────────────────────────────── vddi ──────────────┼──► vddi                      │   │
> │                 │         │                                                        │                              │   │
> │  VSYS_PWR ──────┼─────────┼──────┐                                                 │                              │   │
> │                 │         │      │                                                 │                              │   │
> │  LCD_BIAS_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
> │                 │         │      ├───►│  LCD BIAS DRIVER  ├──── VREG_DISP_P (+5.5V)┼──► VREG_DISP_P (+5.5V)       │   │
> │                 │         │      │    └──────────────────┘──── VREG_DISP_N (-5.5V)─┼──► VREG_DISP_N (-5.5V)       │   │
> │                 │         │      │                                                 │                              │   │
> │  LCD_BKLT_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
> │                 |         |      |    │   WLED DRIVER    ├──── VREG_WLED ──────────┼──► VREG_WLED                 │   │
> │                 │         │      └───►│                   ├──── WLED_SIN1 ─────────┼──► WLED_SIN1                 │   │
> │                 │         │           │                   ├──── WLED_SIN2 ─────────┼──► WLED_SIN2                 │   │
> │                 │         │           │             ◄─PWM─┤◄───────────────────────┼◄── CABC                      │   │
> │                 │         │           └──────────────────┘                         │                              │   │

Perfect. So this is LED device, it provides backlight to the panel.
Describe it correctly in the DT.

Think of somebody using PM8150's WLED with the panel.

For the panel bindings use only actual panel inputs. Think of it being
used on a completely different platform, without the DC card.


> │  MDP_VSYNC_P ───┼─────────┼────────────────────────────────────────────────────────┼──► MDP_VSYNC_P               │   │
> │                 │         │                                                        │                              │   │
> │  DISP_RST ──────┼─────────┼────────────────────────────────────────────────────────┼──► DISP_RST                  │   │
> │                 │         │                                                        │                              │   │
> │  Touch ─//──────┼─────────┼────────────────────────────────────────────────────────┼──► Touch signals             │   │
> │  signals        │         │                                                        └──────────────────────────────┘   │
> └─────────────────┘         └───────────────────────────────────────────────────────────────────────────────────────────┘
> 
> Thanks,
> Arpit

-- 
With best wishes
Dmitry
