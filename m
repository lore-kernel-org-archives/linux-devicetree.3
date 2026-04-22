Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C34C3F0AA0
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888128; cv=none; b=eFbZwEod8Fwoeg7Qw8WRXVU/kxdBs/bxr/eX6Qk9pyZ8d0Xch7C4s7cr7juJs3Deh5zYb+ubcb+t99NKaB3BZotCIJeOGRppiT0jMbreliOY3ePvQWZQ089Y+DDX1bNG6VAZnwm7qbVx/fk3aHlumGqX3au+nyJGtC21X0+FVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888128; c=relaxed/simple;
	bh=Q4pwvI0KRwdRWq767+fFiz9GrBlPylpoplyaIZLTJhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iz9XkxuxvxkJnfYC84lmVv1QQjHISTxAZs0bLj/DrrnOwPfZrwpiZDwzEMtwFsKzdoAxbzuYDma4Om+ZJ6rYCzc1P0SlGhEpVp7vIeIko/ynpi7czTz0y8mbi3N12vzRvU3xqWcK60A93vH3y3izb+TSL5awA1mx2weYb2x+KrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BG/r+/Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+vcbXS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BG/r+/Ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+vcbXS+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfLdR2956103
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flGJcdIDIQbWdmekaKBUj1NUx7N5shdwh7EfzrIz2ow=; b=BG/r+/Msh1Lj3jCB
	49Q2Zy9NtdU03frorgIroMEWGWlP1wefISYQ3D/j0A4q2UDyiZXfFwnCnuA4VpuZ
	7mw7pBTxXwW+d4R3oyui0TjuABoxPcGhdfeoGgXxOG4ZOgQKSiawIdi8enw+Njvw
	DV85p5qsoJvBK21ZciVB9+g6GrP9PxsiTP/cARkMShQqvtbwMDlwuIeTceuYHXAm
	IuS6ioA4Iinkbmh2pMh2pFuOq5+zpJKgbUf8IRn7DB6uhNidyHAgXjdl4BpvtUYd
	sek+U0f31PmcjlSEQW6LmrQO5Gr0WwxBKojyD90bOK0OI1322RJZN4xpiv3BnlGm
	MR9tYA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q0xfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:03 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-467e8aaa943so4236404b6e.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888123; x=1777492923; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flGJcdIDIQbWdmekaKBUj1NUx7N5shdwh7EfzrIz2ow=;
        b=D+vcbXS+f9ANoyCn3oGna/eZTbHriRLJ4qUEcNb57cIBA3m6oO8zKKm0QG0kIcAvq2
         Mq90FOQjOPh9Y2u3wQj4btnuAy6asmWjlbwhCo5sWbxHvpfGzImCu3QYaeHkRXaZ9Ht9
         w6aXKE/j7xtYfyLD+eUmqKKOo1nIxWYpQsp47nISq8XmWHaHYzDAGQBFRLAFztH66tiM
         WfK82DHGuBdKc8ItIpgaByddUp7btqLOhi3y1GR3H6j3XZamxqXA5moQn7ODFaLPJez2
         KaS+OruEg+ut7PFHHZjX5mAyC+rD2qBkrw75blg6mI395zQsPUgGCr4HOpmkedn9i5xS
         uxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888123; x=1777492923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flGJcdIDIQbWdmekaKBUj1NUx7N5shdwh7EfzrIz2ow=;
        b=sckiLaCWfpvkh//11snaf67J5VEO0CLvjQoci3JIiWhpadrsOnL0eUq6Z+s0zhcKiX
         hODtax9plikJP7Ix+2CbGgoXBnipwL1pnOqiliNeL6EdK2PJKfKLNRPa41yEGZpNerHz
         3zCrRXnDl1VZngPsAESjBAG22At/RYxHMfU1X8C/QivJgMqkhuoKSfC13ZzoW5X1ZmqE
         CTGqdyPAS2RKaZns8aM93l/i9oKY0N4VWy8GbA36y2WH2V/CDoSXrb12HoWHGwwNh3XS
         ABiMBB9aTmRka/Wj6Or/MLdHNFP29wlaSzL0S/2M1be7Iojvgfn3otrVTkj3czxPM2E+
         ncvw==
X-Forwarded-Encrypted: i=1; AFNElJ9SuoSjRlaTuun710mlwO9Lq7pyY0w7Eq3vsH+/o74Ugx1luNuxk/Hv3aG/t2M8qfJGa3omF4jRtST9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bLixXUweeYijDxKqggd0i/QPFFoIkvBub4llYDJFo+nix1DU
	sflkcrs/B326KvqUSqD2omQj6ClucaZ1CNLGtWCNiSfC8xCI68sVV/77d5IK2KKe+30sQkVMCKa
	L2/TQaNqUSXqUEVjpdHiqh+IL4ieVp5Y8Bo+cdqCTiEV9GBN768zf8tYdy7O0pzoM
X-Gm-Gg: AeBDievbYoFOtuz2pcrBf+oK/o83HRyJA5vtjPOFa+LsyQierZZOfgK77a+up1itRV5
	rSoZfYddopEYKBH6F6XKMB91R8cq6LcwdRlfNfJ/X2KfP87YTgcgPOFOaiocbCuQ5KeKRhNCtpk
	u6HTRx3zZMiJNPMIxMiCA1QgnmFH0o58gM+ldPK85Y3n5726bMGj28KZSPdzu39UcTBMZmN42aO
	n5GU5t3jkUHQslydmujCfxl9sfV4JXvqZn2nhhHmoxol/4ShrZ4QWtgIhGeKzvuIw9LQeB0jyoy
	rCwfd6col73OsEfSSSMueDLzMg1/MrUMHKFB4pwaPjgan9dLHdEsrziEiYDA6bb7J1Iq9OhN65k
	XoTKV2OBK0Ph/MTJQkft1x+o7bSa19KKZwD9NdDf8LJdemwZNYr0ZCB7oeSae2bjafjUruDsrb9
	KrIXAzVvptTWkHGw8T4FbLQc8+vHe5q2+fOoVvtbQM18kmQA==
X-Received: by 2002:a05:6808:1190:b0:479:f7e7:4a81 with SMTP id 5614622812f47-479f7e75c2cmr3946542b6e.0.1776888122831;
        Wed, 22 Apr 2026 13:02:02 -0700 (PDT)
X-Received: by 2002:a05:6808:1190:b0:479:f7e7:4a81 with SMTP id 5614622812f47-479f7e75c2cmr3946458b6e.0.1776888122003;
        Wed, 22 Apr 2026 13:02:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41974167fsm4641810e87.60.2026.04.22.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:02:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:01:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
Message-ID: <6ijpvrd7mm5c6zsvogzm6uwsxpwqugur7oles5i55cqyage2hd@rig24poqt27g>
References: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
 <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
 <CAHz4bYv_gyCU0sPi1RCrB7=x1noW6+QCFuuCXgAXymbTsWgwQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYv_gyCU0sPi1RCrB7=x1noW6+QCFuuCXgAXymbTsWgwQA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9293b cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=EPEYJcUAfpNgXvpEDeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: IViCAG8oVKpipJ8ya9yKs8LEdGXTBWs8
X-Proofpoint-ORIG-GUID: IViCAG8oVKpipJ8ya9yKs8LEdGXTBWs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX5VPX3iIayogT
 qw//E3rN2hMLjhsL7rb91MC7q6auL+1sc1S6SY5c7djkdxMMDu4/l8GtZYlps4+mIFUh+/hTmbZ
 tGBDuujaTg5uhY2dT4X9y5XlfIQGn49rt9Jp6PZBkI+IJr2zE8MhyOO5oCBcX1CD30MyCmwE2Bq
 uAeXQnEFwKSd1eRCZ3Dg6fPjjQdwOD6JbzGU58IvscxPzqDTJBPzbt/n0RjjtR7AcQ9/ONTiT1p
 GGx4YtDuRMYSaKGObZcmBTQJ5huFIyC40OZWM6Jal81+QV5rMU+g2KLOand0EzUiFojbz7NAfwK
 lUS+NRXZl1ZylEzE28pO+AXAN0AL7KbBWYhLh/kB1WPcEShsdmg6OVjtXXpeuVqV8PDt+acDrqS
 Nz3xVt3T5CnlfWW1UaD2xjtjxAtnN2XCh/tOvIzfDcGe1zu2u5G2UVq7n/5yTPkqZEYGShdPk/D
 rxXuncMz3oHHQfrKpHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220194

On Wed, Apr 22, 2026 at 12:45:22PM +0530, Swati Agarwal wrote:
> On Sat, Apr 18, 2026 at 4:10 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Apr 17, 2026 at 08:50:14PM +0530, Swati Agarwal wrote:
> > > Enable primary USB controller in host mode on monaco EVK Platform.
> > >
> > > Primary USB controller is connected to a Genesys Logic USB HUB GL3590
> > > having 4 ports. The ports of hub that are present on lemans EVK standalone
> > > board are used as follows:-
> > > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > > 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> > > for Bluetooth. This port is to be used only if user optionally replaces the
> > > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> > >
> > > Remaining 2 ports will become functional when the interface plus mezzanine
> > > board is stacked on top of corekit:
> > >
> > > 3) port-2 is connected to another hub which is present on the mezz through
> > > which 4 type-A ports are connected.
> > > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > > connected.
> > >
> > > Primary USB Controller
> > >           ↓
> > > GL3590 USB Hub (4 ports)
> > >     |
> > >     |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
> > >     |
> > >     |-- Port 2 → Mezzanine USB Hub (when mezz attached)
> > >     |
> > >     |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
> > >     |
> > >     |-- Port 4 → M.2 E‑Key Slot
> > >                          (Default: BT via UART;
> > >                           USB only if NFA765 module is installed)
> > >
> > > Mark the primary USB controller as host only capable and add the HD3SS3220
> > > Type-C port controller along with Type-c connector for controlling vbus
> > > supply.
> > >
> > > In hardware, there are dip switches provided to operate between USB1 port 0
> > > and port 1 for primary Type-C USB controller. By default, switches will be
> > > off operating at USB0 port. After bootup to HLOS, it will be operated in
> > > USB1 port.
> >
> > Why did you choose this configuration?
> Hi Dmitry,
> 
> Thanks for the review.
> 
> This configuration follows the Monaco RB4 hardware design and intended
> usage model:
> 
> The primary USB controller (USB1) exposes two Type‑C ports: USB0 and USB1.
> 
> USB0 is intended exclusively for software download and recovery use
> cases (EDL, ramdump, fastboot).
> USB1 is intended for normal runtime operation after booting into HLOS.
> 
> The hardware provides DIP switches to select between USB0 and USB1 for
> the primary controller. These switches default to the USB0 position to
> support software download mode.
> 
> To avoid manual intervention, the board also provides GPIO‑controlled
> equivalents of these DIP switches. After booting into HLOS, software
> switches the configuration to USB1, which is the intended runtime
> port.

I assume this behaviour is documented in the board documentation?

My main concern is that with this approach it is not possible to enforce
any other mode of operation, even if the user wants to keep USB0 to
continue to function even after booting.

> 
> The external USB hub (Genesys Logic GL3590) connected to USB1 is held
> in reset during download mode and is enabled only after the system
> transitions to runtime mode via software‑controlled GPIOs.
> 
> In normal operation:
> 
> The secondary USB controller (Micro‑USB / USB2) is used for ADB.
> USB0 of the primary controller is reserved for recovery and debug use cases.
> USB1 of the primary controller operates in host‑only mode to support
> downstream devices via the USB hub.

Is the USB0 suitable for OTG? Is it possible to connect USB devices to
that port or is it peripheral-only?

> 
> This setup ensures reliable access to download and recovery paths
> while allowing the runtime USB topology to be switched automatically
> by software in accordance with the board design.
> 
> >
> > > @@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
> > >               bias-pull-up;
> > >       };
> > >
> > > +     usb1_hub_reset: usb1-hub-reset-state {
> > > +             pins = "gpio7";
> > > +             function = "gpio";
> > > +             output-enable;
> > > +             output-high;
> > > +             bias-disable;
> > > +     };
> > > +
> > > +     usb1_id: usb1-id-state {
> > > +             pins = "gpio13";
> > > +             function = "gpio";
> > > +             bias-pull-up;
> > > +     };
> > > +
> > > +     usb1_hs_sel_switch: usb1-hs-sel-switch-state {
> > > +             pins = "gpio14";
> > > +             function = "gpio";
> > > +             output-enable;
> > > +             output-high;
> > > +             bias-disable;
> > > +     };
> >
> > Why do you use gpio-hog for SS switch, but then you use pinctrl for HS
> > switch?
> Initially, I attempted to model both HS and SS select signals (as well
> as the USB hub reset) uniformly using gpio-hog.
> 
> gpio7_hog: gpio7-hog {
> gpio-hog;
> gpios = <7 GPIO_ACTIVE_HIGH>;
> output-high;
> line-name = "bootup-high-gpio7";
> };
> 
> gpio14_hog: gpio14-hog {
> gpio-hog;
> gpios = <14 GPIO_ACTIVE_HIGH>;
> output-high;
> line-name = "usb1-hs-high-gpio14";
> };
> 
> However, placing gpio-hog nodes for HS select and hub reset under the
> TLMM node caused dtbs_check failures, This resulted in schema errors
> such as:
> 
> make LLVM=-15 ARCH=arm64 -j99 CHECK_DTBS=1 qcom/monaco-evk.dtb
>   DTC [C] arch/arm64/boot/dts/qcom/monaco-evk.dtb
> /local/mnt/workspace/swatagar/upstream/linux-next/arch/arm64/boot/dts/qcom/monaco-evk.dtb:
> pinctrl@f100000 (qcom,qcs8300-tlmm): Unevaluated properties are not
> allowed ('gpio14-hog', 'gpio7-hog' were unexpected)
>         from schema $id:
> http://devicetree.org/schemas/pinctrl/qcom,qcs8300-tlmm.yaml

See how it's handled in the qcom,sdm845-tlmm.yaml and patch the bindings
accordingly (ideally move it to qcom,tlmm-common.yaml).

> 
> To resolve this in a binding‑compliant way:
> 
> HS select and USB hub reset GPIOs, which are TLMM‑controlled SoC pins,
> are configured using pinctrl, which is the supported and
> schema‑compliant mechanism for TLMM.
> The SS select GPIO resides on a TCA9538 GPIO expander, which does not
> support pinctrl. For this signal, gpio-hog is a binding‑compliant
> mechanism.
> 
> 
> Regards,
> Swati
> >
> > > +
> > >       expander1_int: expander1-int-state {
> > >               pins = "gpio16";
> > >               function = "gpio";
> > > @@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
> > >               bias-pull-up;
> > >       };
> > >
> > > +     usb1_intr: usb1-intr-state {
> > > +             pins = "gpio45";
> > > +             function = "gpio";
> > > +             bias-pull-up;
> > > +     };
> > > +
> > >       expander6_int:  expander6-int-state {
> > >               pins = "gpio52";
> > >               function = "gpio";
> > > @@ -863,9 +971,72 @@ &ufs_mem_phy {
> > >  };
> > >
> > >  &usb_1 {
> > > -     dr_mode = "peripheral";
> > > +     dr_mode = "host";
> > > +
> > > +     #address-cells = <1>;
> > > +     #size-cells = <0>;
> > > +
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&usb1_hub_reset &usb1_hs_sel_switch>;
> > >
> > >       status = "okay";
> > > +
> > > +     usb_hub_2_x: hub@1 {
> > > +             compatible = "usb5e3,610";
> > > +             reg = <1>;
> > > +
> > > +             peer-hub = <&usb_hub_3_x>;
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             usb_hub_2_1: endpoint {
> > > +                                     remote-endpoint = <&usb1_con_hs_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     /*
> > > +                      * Port-4 is connected to M.2 E key connector on corekit.
> > > +                      */
> > > +                     port@4 {
> > > +                             reg = <4>;
> > > +
> > > +                             usb_hub_2_4: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     usb_hub_3_x: hub@2 {
> > > +             compatible = "usb5e3,625";
> > > +             reg = <2>;
> > > +
> > > +             peer-hub = <&usb_hub_2_x>;
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             usb_hub_3_1: endpoint {
> > > +                                     remote-endpoint = <&hd3ss3220_1_out_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@4 {
> > > +                             reg = <4>;
> > > +
> > > +                             usb_hub_3_4: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > >  };
> > >
> > >  &usb_1_hsphy {
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
