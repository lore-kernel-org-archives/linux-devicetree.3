Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A941F03DE
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786904964; cv=pass; b=egPeeOe6WFKHPV70w1c6x0CAdrFjGJBaKiSdZ73lpF7BZ9Mjp1Wq7vs2HC+w1SZVKh0HjLcCCtIpVYS3R7nndUdi6N81kjZ5x5BUPAh2b8aA25Jc/XRbxTK/eDkmmc5S+yOWHMOwW3U63soKTJBzyp/2+0ECsJeaJrZ/GrvKzRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786904964; c=relaxed/simple;
	bh=JIgsHpmeVrWUJzHwn5aVOY6Rf8BzYES61c+7vOrxCw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ge3j24oa26nlU7AbTI3jjYVEaa1z/e6VgCbZA2ui6vD1n1mAJHn/DtttW7RpMqtWIeiohCuR6j7mIyGoQpGdFmTy4HeOvYQoec0TgJ1yEUB+uDVsyX4ZbHGCIdfnEvmwcOljrIDI/ceFxtHE8TU5Z3rARJe+ouFLlu9w7X7Lo9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nF6Fpq3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCYMbSuc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nF6Fpq3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCYMbSuc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GI3AmR3279929
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 18:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWVhDljw30VY/J9QKlCO7smp08AV2WTi4VXNhq5mKw8=; b=nF6Fpq3yDKVtrpNO
	ahpwnEZJXtyTUIAY1tNo6vQWmSjoogXYPROrNPtjh32Y2U57bCe6sxNBpYEkv4Bs
	3tX9MSqVkKCB7HUt6mwmqcuNxjrwvDnzLj6WnRpZUXLxOgWHR1mn6rFiSeWREogT
	JFg6CIM7G1xrSzI3NNlgAGbQ6ZUy3tBb5WsXBjbd6BRnVjXWGNegvXFn4rMvLGOd
	AI9/GqLz9ktOmYBpeWasPJMHhuAgkzvrntlthFeHIePKVydf/WJXjgneetRFbWNM
	7ATdU6Z599cXWUZ/69447XB5r34qfrssTf9yl3tsyoQEkF+/w30JxqI3Hx6bJ4rz
	AW7yEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2h9gkx24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 18:29:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso40045065ad.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 11:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786904961; cv=none;
        d=google.com; s=arc-20260327;
        b=TPo9CzhXtK/KytZFA3hQC5iGRW6Ouebn7+UZskmCqOg42RFbPyNz01ePVyultQjVLb
         9ypnfm/vNM5GC9fiQn/HMrb9PHIfACWF4W/ifsayhHQVJoNpRyN+2smKNMfcd9ajZye2
         aiGue8WSOPHyHyhMYGG8Po2mYfCshzglnwEuferC+TCHxZBcKwO9/3JelUMS5qqOrRHw
         806uQh8B8O8nfWOBCUf2GeqDE+DIKus8oA3nj1F7mBcnHMvrbU7Wdy2WcgWDb3LbTWAH
         F2oNcn4ZlLssw1FqdGzrbk4Q7C5fVnFJS4IKKzi+v0AwvsIsVJYw78452N8ikOq/2QXt
         I+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWVhDljw30VY/J9QKlCO7smp08AV2WTi4VXNhq5mKw8=;
        fh=4hPgEIl/9yEv8/G3980HwJnrU1iDG0ySiMCvPa7KuDI=;
        b=ppbvBSq4JqW35Fq+aZPCAqQs2ORw4yxAG+hY8rCTORfRWqUiFBjtiiyTnX0bZYQwv2
         CExNJb4Dq8omxfuGDIbvXzX7Va0dXi/Mnqi7VqoeoYJat6CFvbFY2cFT5LE6CIyLNvlt
         8ddtUxYrt6IX4AL/OxuTZqFP4E/2R4jzzHLm228m2vFw2uHAt6GcYAohBFw7t/uhJ73Z
         fkbTGLe16ktr8mJnzXbBR8deJSzQCG++nc77v4kYUkqUxtNDbKJ8AEToNE4t1gPldhrj
         Vjs1Po872gEBltjfY03e+ueGWokj28ACig/S9VESFpxlKIQRAZT392EwLEJBNeBqOM2m
         XQLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786904961; x=1787509761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWVhDljw30VY/J9QKlCO7smp08AV2WTi4VXNhq5mKw8=;
        b=fCYMbSucC0jvouZCJTTeOkMKu28Cs621CaJBwPb34IoMJndDcaSXCY1f4HtHpAkQr7
         roGKb80ko+WN8xkcAxCVgt0myzCPNCTnqazR3HgTJCWXosmoCJOXRPRRED69X403yPx4
         sEaNCV98amCudCEsUWJ15NKzYgfORXYdO/lWbNfBBy/q2b+bMNw3Z4XbpXd8xX4UdZ/u
         IeMbTy1y9J60/OiZ7jCcPyriBMsdfrV5KJlUavdOa0pn9MScVKTD1Nk2C3PZbXEVqjse
         mWbBtY7K/mFopB22j66/xhnAC1Pjihg/AAUC96v+z4a5N2nQOfWJSMDridlsTwuErRUO
         ipwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786904961; x=1787509761;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWVhDljw30VY/J9QKlCO7smp08AV2WTi4VXNhq5mKw8=;
        b=aR2JZ2v3wUyI0+iW1kzicvCcPRkd1XkWv1fTdrXpjCVnRA7MAx3o5xlZITb6O1qijQ
         /B7/shsR3dPB8GNH9ikbXPzIi+v6D8NWbP1T/p5iUm+eoWBaDm2TFHcJ3dUojHAJu72x
         HxtAL5YNPjJrdvL6RXqa4Mann3BFza/zjeDToZ2RXelG3pc65zljlf6LMDWXas1W4swv
         qccrAGYOInFgwIDf4XPXvMT42mNsD6gVSlK7p0CAwJ92gjtc3Xezn0LmIuTerHdM5oHm
         qLT1lRpjjL9nF79epKVzDIDpwbe0T0JL/vFODyeSz63FvBdTyDxAz6UtMBF4cvDB6Bn8
         LEwg==
X-Forwarded-Encrypted: i=1; AHgh+RqJkRl17qXX9WeYILfcWyy6VzYcHOXVRxYhPiC2gg3JqUptmDvH+ftZuUctOn/Yrr3g0V7WR+cIdeQO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+r2uQfvneazwLvLNv/A4hniOI5MqLLafC9NWWroVyi1/eV8aU
	zGsLFR9Zleh/mdP8v/BozZClB2Tj5yRCLGlg6kdL1Qc6BquQshq1Ff9k2TynrrY9rctPGSaTVjN
	vb+T0xjTUw1YT4ocuO8HNCc+FxHMDYb50GLu8fAyUKjv9YR8gD9ohp58KTS+QYjDTObfUIU7M6a
	rsEb081t+UDN9l46M32PLC6/mwmGI5AgB9UU+NLpI=
X-Gm-Gg: AR+sD12+jG41rgrIrz33QTMtGpfDLlqx2sjy/ut6qMFNMNd1viWgpLwm/pQyHZ9P7pR
	DbMIdwCmptPDICy9XA2v5T4szUP53Id9o5+5bmxBp8suZ3Ry9vYFFBUeca7O5FeWaqm3ddEIP/o
	4ej10FI+/i28BIntXnAgbEKFaPXjzcTF9emLWxAaTVx4GfkzkMYj5qRKHSlA==
X-Received: by 2002:a17:902:ce04:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d3b0d5e658mr232966235ad.12.1786904960533;
        Sun, 16 Aug 2026 11:29:20 -0700 (PDT)
X-Received: by 2002:a17:902:ce04:b0:2c8:2808:3ec9 with SMTP id
 d9443c01a7336-2d3b0d5e658mr232965765ad.12.1786904959930; Sun, 16 Aug 2026
 11:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
 <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com> <anxt-erf4ZVi_zff@shodan.l0w.de>
 <CAG9dZevX1cLzfzRkiL08vLG+USzKiuNNaNTmvXG2vM-dt+wXYQ@mail.gmail.com>
In-Reply-To: <CAG9dZevX1cLzfzRkiL08vLG+USzKiuNNaNTmvXG2vM-dt+wXYQ@mail.gmail.com>
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:29:08 -0700
X-Gm-Features: AcwNN1VrqI7oEJTtKm1gh9T23klLHnpujpyd7rzBSFaqHdxwM-tytildDeXmTUI
Message-ID: <CAG9dZes12TWHUjTTggbm8j38Aqk1zuz33bd8uikhkJVyUq9Z0Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: y08SbaJnV75Ap5XOO2aUInwJIwQjBGhJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE1MCBTYWx0ZWRfX1DGuu6UUoeJy
 lelK6ban9jY5jWcV0iIWbkaluT8NCLicavFfg7wlQZ2Kw7wvlVrgwGjyH3bmrjZ5pzwc+D0FoLw
 r+GFDYmhsSFyLgFsGje6BMyNIejQHVM=
X-Proofpoint-GUID: y08SbaJnV75Ap5XOO2aUInwJIwQjBGhJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE1MCBTYWx0ZWRfXxzyxQYSi9Png
 kQDOdkvjQne4EqQrsxKr5RoUKHwxk+SOh14LAgB2nwM+76U5lPPc2r8HufsH8F6AYk8aQxsLNvo
 UFiCp8bIABC1ztGmAwFI1vTbTzl7w/TvfsNQbqpBEQPS1eyrx7CYomw0NqKvuhdhgBmzDdDuHGb
 btt/ZbEYQVz1Q8xP6X0wIFKWrLFnTXpBmBLDN3GuQ9QKAxBE9do3IHnPp/C8EXv1w3Ocpvqd0q8
 6tprQO1xiQaM8etLSQPiiuQcw3YhdLIhjgxN3IExWq5GVLojVbnUjUiNPJ5yFfQDybZwUr+MYzb
 Uo+7IcFJB76QjC/hJ9Vo+qWKulNzng2iF5uBcXVa/88kNQ2tcKjdpDriMJ+jewVSGD/s6vxl7ix
 sp0JBYWB2E+j51ntrOqsEP0V4LB8iNOy6zSD9FRbgVumw5kMK7LAGm/gMaLVLQhl5QpsHl69cs1
 XjWZjDLtCAveWW2DnZw==
X-Authority-Analysis: v=2.4 cv=XM4AjwhE c=1 sm=1 tr=0 ts=6a820181 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DfNHnWVPAAAA:8
 a=R_Zh9SAXYzCrTfLd-A8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160150

> On Wed, Aug 12, 2026 at 6:04=E2=80=AFAM Tobias Heider <tobias.heider@cano=
nical.com> wrote:
>>
>> On Sun, Aug 09, 2026 at 02:29:22PM -0700, Jason Pettit wrote:
>> > Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
>> > (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
>> > laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
>> >
>> > Enabled by this device tree:
>> >
>> >   - internal eDP panel (samsung,atna33xc20)
>> >   - 2x USB Type-C with DisplayPort alt-mode and USB
>> >   - chassis HDMI output
>> >   - chassis USB-A host port (usb_mp multiport controller)
>> >   - internal eUSB2 host with the Elan fingerprint reader
>> >   - NVMe SSD on PCIe5
>> >   - Wi-Fi and Bluetooth
>> >   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>> >   - Adreno GPU and GMU (Freedreno GL on Mesa)
>> >   - audio playback and capture
>> >   - real-time clock
>> >   - compute DSP (cDSP)
>> >
>> > The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
>> > the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
>> > is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX contr=
ol
>> > path, so it is modelled with the generic simple-bridge "parade,ps185hd=
m"
>> > compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
>> > bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
>> >
>> > The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
>> > glymur.dtsi SoC nodes that are still in-flight; those series are
>> > declared as prerequisites in the cover letter.
>> >
>> > Assisted-by: Claude:claude-opus-4-8
>> > Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
>> > ---
>> >  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>> >  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1039 +++++++++++=
+++++++++
>> >  2 files changed, 1040 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/q=
com/Makefile
>> > index 1c86e7e98f55..146955de4606 100644
>> > --- a/arch/arm64/boot/dts/qcom/Makefile
>> > +++ b/arch/arm64/boot/dts/qcom/Makefile
>> > @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D eliza-cqs-evk.dtb
>> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D eliza-mtp.dtb
>> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D glymur-asus-zenbook-a16-ux3607oa.dt=
b
>> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D glymur-crd.dtb
>> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D glymur-hp-elitebook-x-g2q.dtb
>> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D hamoa-iot-evk.dtb
>> >
>> >  hamoa-iot-evk-el2-dtbs       :=3D hamoa-iot-evk.dtb x1-el2.dtbo
>> > diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/=
arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
>> > new file mode 100644
>> > index 000000000000..8d0fe276bf83
>> > --- /dev/null
>> > +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
>> > @@ -0,0 +1,1039 @@
>> > +// SPDX-License-Identifier: BSD-3-Clause
>> > +/*
>> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> > + */
>> > +/dts-v1/;
>> > +
>> > +#include "glymur.dtsi"
>> > +
>> > +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
>> > +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
>> > +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
>> > +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
>> > +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
>> > +#include "smb2370.dtsi"         /* SPMI2: SID-9/10               */
>> > +
>> > +#include <dt-bindings/gpio/gpio.h>
>> > +#include <dt-bindings/input/gpio-keys.h>
>> > +#include <dt-bindings/input/input.h>
>> > +#include <dt-bindings/interrupt-controller/irq.h>
>> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> > +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> > +
>> > +/ {
>> > +     model =3D "HP EliteBook X G2q 14 AI";
>> > +     compatible =3D "hp,elitebook-x-g2q", "qcom,glymur";
>> > +
>> > +     aliases {
>> > +             serial1 =3D &uart14;
>> > +     };
>> > +
>> > +     clocks {
>> > +             xo_board: xo-board {
>> > +                     compatible =3D "fixed-clock";
>> > +                     clock-frequency =3D <38400000>;
>> > +                     #clock-cells =3D <0>;
>> > +             };
>> > +
>> > +             sleep_clk: sleep-clk {
>> > +                     compatible =3D "fixed-clock";
>> > +                     clock-frequency =3D <32000>;
>> > +                     #clock-cells =3D <0>;
>> > +             };
>> > +     };
>> > +
>> > +     gpio-keys {
>> > +             compatible =3D "gpio-keys";
>> > +
>> > +             pinctrl-0 =3D <&lid_default>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             switch-lid {
>> > +                     label =3D "lid";
>> > +                     gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
>> > +                     linux,input-type =3D <EV_SW>;
>> > +                     linux,code =3D <SW_LID>;
>> > +                     wakeup-source;
>> > +                     wakeup-event-action =3D <EV_ACT_DEASSERTED>;
>> > +             };
>> > +     };
>> > +
>> > +     hdmi-bridge {
>> > +             compatible =3D "parade,ps185hdm";
>> > +
>> > +             pinctrl-0 =3D <&usb2_dp_hot_plug_detect>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             ports {
>> > +                     #address-cells =3D <1>;
>> > +                     #size-cells =3D <0>;
>> > +
>> > +                     port@0 {
>> > +                             reg =3D <0>;
>> > +
>> > +                             hdmi_bridge_in: endpoint {
>> > +                                     remote-endpoint =3D <&usb_2_qmpp=
hy_out_dp>;
>> > +                             };
>> > +                     };
>> > +
>> > +                     port@1 {
>> > +                             reg =3D <1>;
>> > +
>> > +                             hdmi_bridge_out: endpoint {
>> > +                                     remote-endpoint =3D <&hdmi_con>;
>> > +                             };
>> > +                     };
>> > +             };
>> > +     };
>> > +
>> > +     hdmi-connector {
>> > +             compatible =3D "hdmi-connector";
>> > +             type =3D "a";
>> > +
>> > +             port {
>> > +                     hdmi_con: endpoint {
>> > +                             remote-endpoint =3D <&hdmi_bridge_out>;
>> > +                     };
>> > +             };
>> > +     };
>> > +
>> > +     pmic-glink {
>> > +             compatible =3D "qcom,glymur-pmic-glink",
>> > +                          "qcom,pmic-glink";
>> > +             #address-cells =3D <1>;
>> > +             #size-cells =3D <0>;
>> > +
>> > +             /* Left side port */
>> > +             connector@0 {
>> > +                     compatible =3D "usb-c-connector";
>> > +                     reg =3D <0>;
>> > +                     power-role =3D "dual";
>> > +                     data-role =3D "dual";
>> > +
>> > +                     ports {
>> > +                             #address-cells =3D <1>;
>> > +                             #size-cells =3D <0>;
>> > +
>> > +                             port@0 {
>> > +                                     reg =3D <0>;
>> > +
>> > +                                     pmic_glink_hs_in: endpoint {
>> > +                                             remote-endpoint =3D <&us=
b_0_dwc3_hs>;
>> > +                                     };
>> > +                             };
>> > +
>> > +                             port@1 {
>> > +                                     reg =3D <1>;
>> > +
>> > +                                     pmic_glink_ss_in: endpoint {
>> > +                                             remote-endpoint =3D <&us=
b_0_qmpphy_out>;
>> > +                                     };
>> > +                             };
>> > +                     };
>> > +             };
>> > +
>> > +             /* Right side port */
>> > +             connector@1 {
>> > +                     compatible =3D "usb-c-connector";
>> > +                     reg =3D <1>;
>> > +                     power-role =3D "dual";
>> > +                     data-role =3D "dual";
>> > +
>> > +                     ports {
>> > +                             #address-cells =3D <1>;
>> > +                             #size-cells =3D <0>;
>> > +
>> > +                             port@0 {
>> > +                                     reg =3D <0>;
>> > +
>> > +                                     pmic_glink_hs_in1: endpoint {
>> > +                                             remote-endpoint =3D <&us=
b_1_dwc3_hs>;
>> > +                                     };
>> > +                             };
>> > +
>> > +                             port@1 {
>> > +                                     reg =3D <1>;
>> > +
>> > +                                     pmic_glink_ss_in1: endpoint {
>> > +                                             remote-endpoint =3D <&us=
b_1_qmpphy_out>;
>> > +                                     };
>> > +                             };
>> > +                     };
>> > +             };
>> > +     };
>> > +
>> > +     vreg_edp_3p3: regulator-edp-3p3 {
>> > +             compatible =3D "regulator-fixed";
>> > +
>> > +             regulator-name =3D "VREG_EDP_3P3";
>> > +             regulator-min-microvolt =3D <3300000>;
>> > +             regulator-max-microvolt =3D <3300000>;
>> > +
>> > +             gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
>> > +             enable-active-high;
>> > +
>> > +             pinctrl-0 =3D <&edp_reg_en>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             regulator-boot-on;
>> > +     };
>> > +
>> > +     vreg_nvme: regulator-nvme {
>> > +             compatible =3D "regulator-fixed";
>> > +
>> > +             regulator-name =3D "VREG_NVME_3P3";
>> > +             regulator-min-microvolt =3D <3300000>;
>> > +             regulator-max-microvolt =3D <3300000>;
>> > +
>> > +             gpio =3D <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
>> > +             enable-active-high;
>> > +
>> > +             pinctrl-0 =3D <&nvme_reg_en>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             regulator-boot-on;
>> > +     };
>> > +
>> > +     vreg_wcn_0p95: regulator-wcn-0p95 {
>> > +             compatible =3D "regulator-fixed";
>> > +
>> > +             regulator-name =3D "VREG_WCN_0P95";
>> > +             regulator-min-microvolt =3D <950000>;
>> > +             regulator-max-microvolt =3D <950000>;
>> > +
>> > +             vin-supply =3D <&vreg_wcn_3p3>;
>> > +     };
>> > +
>> > +     vreg_wcn_3p3: regulator-wcn-3p3 {
>> > +             compatible =3D "regulator-fixed";
>> > +
>> > +             regulator-name =3D "VREG_WCN_3P3";
>> > +             regulator-min-microvolt =3D <3300000>;
>> > +             regulator-max-microvolt =3D <3300000>;
>> > +
>> > +             gpio =3D <&tlmm 94 GPIO_ACTIVE_HIGH>;
>> > +             enable-active-high;
>> > +
>> > +             pinctrl-0 =3D <&wcn_sw_en>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             regulator-boot-on;
>> > +     };
>> > +
>> > +     sound {
>> > +             compatible =3D "qcom,glymur-sndcard";
>> > +             model =3D "GLYMUR-HP-EliteBook-X-G2q";
>> > +
>> > +             audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
>> > +                             "TweeterLeft IN", "WSA WSA_SPK2 OUT",
>> > +                             "WooferRight IN", "WSA2 WSA_SPK1 OUT",
>> > +                             "TweeterRight IN", "WSA2 WSA_SPK2 OUT",
>> > +                             "VA DMIC0", "vdd-micb",
>> > +                             "VA DMIC1", "vdd-micb",
>> > +                             "VA DMIC2", "vdd-micb",
>> > +                             "VA DMIC3", "vdd-micb";
>> > +
>> > +             va-dai-link {
>> > +                     link-name =3D "VA Capture";
>> > +
>> > +                     codec {
>> > +                             sound-dai =3D <&lpass_vamacro 0>;
>> > +                     };
>> > +
>> > +                     cpu {
>> > +                             sound-dai =3D <&q6apmbedai VA_CODEC_DMA_=
TX_0>;
>> > +                     };
>> > +
>> > +                     platform {
>> > +                             sound-dai =3D <&q6apm>;
>> > +                     };
>> > +             };
>> > +
>> > +             wsa-dai-link {
>> > +                     link-name =3D "WSA Playback";
>> > +
>> > +                     codec {
>> > +                             sound-dai =3D <&left_woofer>, <&left_twe=
eter>,
>> > +                                         <&swr0 0>, <&lpass_wsamacro =
0>,
>> > +                                         <&right_woofer>, <&right_twe=
eter>,
>> > +                                         <&swr3 0>, <&lpass_wsa2macro=
 0>;
>> > +                     };
>> > +
>> > +                     cpu {
>> > +                             sound-dai =3D <&q6apmbedai WSA_CODEC_DMA=
_RX_0>;
>> > +                     };
>> > +
>> > +                     platform {
>> > +                             sound-dai =3D <&q6apm>;
>> > +                     };
>> > +             };
>> > +     };
>> > +
>> > +     wcn7850-pmu {
>> > +             compatible =3D "qcom,wcn7850-pmu";
>> > +
>> > +             vdd-supply =3D <&vreg_wcn_0p95>;
>> > +             vddio-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vddaon-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vdddig-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vddrfa1p2-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vddrfa1p8-supply =3D <&vreg_l15b_e0_1p8>;
>> > +
>> > +             wlan-enable-gpios =3D <&tlmm 117 GPIO_ACTIVE_HIGH>;
>> > +             bt-enable-gpios =3D <&tlmm 116 GPIO_ACTIVE_HIGH>;
>> > +
>> > +             pinctrl-0 =3D <&wcn_wlan_bt_en>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             regulators {
>> > +                     vreg_pmu_rfa_cmn: ldo0 {
>> > +                             regulator-name =3D "vreg_pmu_rfa_cmn";
>> > +                     };
>> > +
>> > +                     vreg_pmu_aon_0p59: ldo1 {
>> > +                             regulator-name =3D "vreg_pmu_aon_0p59";
>> > +                     };
>> > +
>> > +                     vreg_pmu_wlcx_0p8: ldo2 {
>> > +                             regulator-name =3D "vreg_pmu_wlcx_0p8";
>> > +                     };
>> > +
>> > +                     vreg_pmu_wlmx_0p85: ldo3 {
>> > +                             regulator-name =3D "vreg_pmu_wlmx_0p85";
>> > +                     };
>> > +
>> > +                     vreg_pmu_btcmx_0p85: ldo4 {
>> > +                             regulator-name =3D "vreg_pmu_btcmx_0p85"=
;
>> > +                     };
>> > +
>> > +                     vreg_pmu_rfa_0p8: ldo5 {
>> > +                             regulator-name =3D "vreg_pmu_rfa_0p8";
>> > +                     };
>> > +
>> > +                     vreg_pmu_rfa_1p2: ldo6 {
>> > +                             regulator-name =3D "vreg_pmu_rfa_1p2";
>> > +                     };
>> > +
>> > +                     vreg_pmu_rfa_1p8: ldo7 {
>> > +                             regulator-name =3D "vreg_pmu_rfa_1p8";
>> > +                     };
>> > +
>> > +                     vreg_pmu_pcie_0p9: ldo8 {
>> > +                             regulator-name =3D "vreg_pmu_pcie_0p9";
>> > +                     };
>> > +
>> > +                     vreg_pmu_pcie_1p8: ldo9 {
>> > +                             regulator-name =3D "vreg_pmu_pcie_1p8";
>> > +                     };
>> > +             };
>> > +     };
>> > +};
>> > +
>> > +&apps_rsc {
>> > +     regulators-0 {
>> > +             compatible =3D "qcom,pmh0101-rpmh-regulators";
>> > +             qcom,pmic-id =3D "B_E0";
>> > +
>> > +             vreg_l1b_e0_1p8: ldo1 {
>> > +                     regulator-name =3D "vreg_l1b_e0_1p8";
>> > +                     regulator-min-microvolt =3D <1800000>;
>> > +                     regulator-max-microvolt =3D <1800000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l7b_e0_3p1: ldo7 {
>> > +                     regulator-name =3D "vreg_l7b_e0_3p1";
>> > +                     regulator-min-microvolt =3D <3072000>;
>> > +                     regulator-max-microvolt =3D <3072000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l15b_e0_1p8: ldo15 {
>> > +                     regulator-name =3D "vreg_l15b_e0_1p8";
>> > +                     regulator-min-microvolt =3D <1800000>;
>> > +                     regulator-max-microvolt =3D <1800000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l18b_e0_1p2: ldo18 {
>> > +                     regulator-name =3D "vreg_l18b_e0_1p2";
>> > +                     regulator-min-microvolt =3D <1200000>;
>> > +                     regulator-max-microvolt =3D <1200000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +     };
>> > +
>> > +     regulators-1 {
>> > +             compatible =3D "qcom,pmcx0102-rpmh-regulators";
>> > +             qcom,pmic-id =3D "C_E1";
>> > +
>> > +             vreg_l1c_e1_0p91: ldo1 {
>> > +                     regulator-name =3D "vreg_l1c_e1_0p91";
>> > +                     regulator-min-microvolt =3D <912000>;
>> > +                     regulator-max-microvolt =3D <912000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +     };
>> > +
>> > +     regulators-2 {
>> > +             compatible =3D "qcom,pmh0110-rpmh-regulators";
>> > +             qcom,pmic-id =3D "F_E0";
>> > +
>> > +             vreg_l2f_e0_0p94: ldo2 {
>> > +                     regulator-name =3D "vreg_l2f_e0_0p94";
>> > +                     regulator-min-microvolt =3D <936000>;
>> > +                     regulator-max-microvolt =3D <936000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l3f_e0_0p91: ldo3 {
>> > +                     regulator-name =3D "vreg_l3f_e0_0p91";
>> > +                     regulator-min-microvolt =3D <912000>;
>> > +                     regulator-max-microvolt =3D <912000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +     };
>> > +
>> > +     regulators-3 {
>> > +             compatible =3D "qcom,pmh0110-rpmh-regulators";
>> > +             qcom,pmic-id =3D "F_E1";
>> > +
>> > +             vreg_l1f_e1_0p88: ldo1 {
>> > +                     regulator-name =3D "vreg_l1f_e1_0p88";
>> > +                     regulator-min-microvolt =3D <880000>;
>> > +                     regulator-max-microvolt =3D <880000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l2f_e1_0p88: ldo2 {
>> > +                     regulator-name =3D "vreg_l2f_e1_0p88";
>> > +                     regulator-min-microvolt =3D <880000>;
>> > +                     regulator-max-microvolt =3D <880000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l4f_e1_1p2: ldo4 {
>> > +                     regulator-name =3D "vreg_l4f_e1_1p2";
>> > +                     regulator-min-microvolt =3D <1200000>;
>> > +                     regulator-max-microvolt =3D <1200000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +     };
>> > +
>> > +     regulators-4 {
>> > +             compatible =3D "qcom,pmh0110-rpmh-regulators";
>> > +             qcom,pmic-id =3D "H_E0";
>> > +
>> > +             vreg_l1h_e0_0p94: ldo1 {
>> > +                     regulator-name =3D "vreg_l1h_e0_0p94";
>> > +                     regulator-min-microvolt =3D <936000>;
>> > +                     regulator-max-microvolt =3D <936000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l2h_e0_0p88: ldo2 {
>> > +                     regulator-name =3D "vreg_l2h_e0_0p88";
>> > +                     regulator-min-microvolt =3D <880000>;
>> > +                     regulator-max-microvolt =3D <880000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +
>> > +             vreg_l4h_e0_1p2: ldo4 {
>> > +                     regulator-name =3D "vreg_l4h_e0_1p2";
>> > +                     regulator-min-microvolt =3D <1200000>;
>> > +                     regulator-max-microvolt =3D <1200000>;
>> > +                     regulator-initial-mode =3D <RPMH_REGULATOR_MODE_=
HPM>;
>> > +             };
>> > +     };
>> > +};
>> > +
>> > +&gmu {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&gpu {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&i2c0 {
>> > +     clock-frequency =3D <400000>;
>> > +
>> > +     status =3D "okay";
>> > +
>> > +     touchpad@2c {
>> > +             compatible =3D "hid-over-i2c";
>> > +             reg =3D <0x2c>;
>> > +
>> > +             hid-descr-addr =3D <0x20>;
>> > +             interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
>> > +
>> > +             pinctrl-0 =3D <&tpad_default>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             wakeup-source;
>> > +     };
>> > +
>> > +     keyboard@3a {
>> > +             compatible =3D "hid-over-i2c";
>> > +             reg =3D <0x3a>;
>> > +
>> > +             hid-descr-addr =3D <0x1>;
>> > +             interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>> > +
>> > +             pinctrl-0 =3D <&kybd_default>;
>> > +             pinctrl-names =3D "default";
>> > +
>> > +             wakeup-source;
>> > +     };
>> > +};
>> > +
>> > +&i2c8 {
>> > +     clock-frequency =3D <400000>;
>> > +
>> > +     status =3D "okay";
>> > +
>> > +     touchscreen@10 {
>> > +             compatible =3D "hid-over-i2c";
>> > +             reg =3D <0x10>;
>> > +
>> > +             hid-descr-addr =3D <0x1>;
>> > +             interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
>> > +
>> > +             post-power-on-delay-ms =3D <200>;
>> > +
>> > +             pinctrl-0 =3D <&ts0_default>;
>> > +             pinctrl-names =3D "default";
>> > +     };
>> > +};
>> > +
>> > +&lpass_vamacro {
>> > +     vdd-micb-supply =3D <&vreg_l1b_e0_1p8>;
>> > +
>> > +     pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
>> > +     pinctrl-names =3D "default";
>> > +
>> > +     qcom,dmic-sample-rate =3D <4800000>;
>> > +};
>> > +
>> > +&mdss {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&mdss_dp0 {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&mdss_dp0_out {
>> > +     link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000=
 8100000000>;
>> > +};
>> > +
>> > +&mdss_dp1 {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&mdss_dp1_out {
>> > +     link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000=
 8100000000>;
>> > +};
>> > +
>> > +&mdss_dp2 {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&mdss_dp2_out {
>> > +     link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000=
 8100000000>;
>> > +};
>> > +
>> > +&mdss_dp3 {
>> > +     /delete-property/ #sound-dai-cells;
>> > +
>> > +     status =3D "okay";
>> > +
>> > +     aux-bus {
>> > +             panel {
>> > +                     compatible =3D "samsung,atna33xc20";
>> > +                     enable-gpios =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
>> > +                     power-supply =3D <&vreg_edp_3p3>;
>> > +
>> > +                     pinctrl-0 =3D <&edp_bl_en>;
>> > +                     pinctrl-names =3D "default";
>> > +
>> > +                     port {
>> > +                             edp_panel_in: endpoint {
>> > +                                     remote-endpoint =3D <&mdss_dp3_o=
ut>;
>> > +                             };
>> > +                     };
>> > +             };
>> > +     };
>> > +};
>> > +
>> > +&mdss_dp3_out {
>> > +     data-lanes =3D <0 1 2 3>;
>> > +     link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000=
 8100000000>;
>> > +
>> > +     remote-endpoint =3D <&edp_panel_in>;
>> > +};
>> > +
>> > +&mdss_dp3_phy {
>> > +     vdda-phy-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-pll-supply =3D <&vreg_l4f_e1_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&pcie4 {
>> > +     pinctrl-0 =3D <&pcie4_default>;
>> > +     pinctrl-names =3D "default";
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&pcie4_phy {
>> > +     vdda-phy-supply =3D <&vreg_l1c_e1_0p91>;
>> > +     vdda-pll-supply =3D <&vreg_l4f_e1_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&pcie4_port0 {
>> > +     reset-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
>> > +     wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
>> > +
>> > +     wifi@0 {
>> > +             compatible =3D "pci17cb,1107";
>> > +             reg =3D <0x10000 0x0 0x0 0x0 0x0>;
>> > +
>> > +             vddaon-supply =3D <&vreg_pmu_aon_0p59>;
>> > +             vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
>> > +             vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
>> > +             vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
>> > +             vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
>> > +             vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
>> > +             vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
>> > +             vddpcie0p9-supply =3D <&vreg_pmu_pcie_0p9>;
>> > +             vddpcie1p8-supply =3D <&vreg_pmu_pcie_1p8>;
>> > +     };
>> > +};
>> > +
>> > +&pcie5 {
>> > +     vddpe-3v3-supply =3D <&vreg_nvme>;
>> > +
>> > +     pinctrl-0 =3D <&pcie5_default>;
>> > +     pinctrl-names =3D "default";
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&pcie5_phy {
>> > +     vdda-phy-supply =3D <&vreg_l2f_e0_0p94>;
>> > +     vdda-pll-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&pcie5_port0 {
>> > +     reset-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
>> > +     wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&pmh0101_gpios {
>> > +     nvme_reg_en: nvme-reg-en-state {
>> > +             pins =3D "gpio14";
>> > +             function =3D "normal";
>> > +             bias-disable;
>> > +     };
>> > +};
>> > +
>> > +&pmk8850_rtc {
>> > +     qcom,no-alarm;
>> > +     qcom,uefi-rtc-info;
>> > +};
>> > +
>> > +&remoteproc_adsp {
>> > +     firmware-name =3D "qcom/glymur/hp/elitebook-x-g2q/adsp.mbn",
>> > +                     "qcom/glymur/hp/elitebook-x-g2q/adsp_dtb.mbn";
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&remoteproc_cdsp {
>> > +     firmware-name =3D "qcom/glymur/hp/elitebook-x-g2q/cdsp.mbn",
>> > +                     "qcom/glymur/hp/elitebook-x-g2q/cdsp_dtb.mbn";
>>
>> Those firwmare names seem to diverge from the earlier Lenovo Yoga Slim 7=
x Gen11 patch
>> and the X1E laptops currently in the tree.
>>
>> Generally it seems for consumer devices we have been sticking to the Win=
dows firmware
>> names in the past which would be:
>>
>>   adsp.mbn -> qcadsp8480.mbn
>>   adsp_dtb.mbn -> adsp_dtbs.elf
>>   cdsp.mbn -> qccdsp8480.mbn
>>   cdsp_dtb.mbn -> cdsp_dtbs.elf
>>
>> See https://lore.kernel.org/all/20260731-topic-yoga_submission-v2-2-f188=
7031da4f@oss.qualcomm.com/
>>

Thank you.  I will adopt this in v4.
Jason


>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&remoteproc_soccp {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&smb2370_j_e2_eusb2_repeater {
>> > +     vdd18-supply =3D <&vreg_l15b_e0_1p8>;
>> > +     vdd3-supply =3D <&vreg_l7b_e0_3p1>;
>> > +};
>> > +
>> > +&smb2370_k_e2_eusb2_repeater {
>> > +     vdd18-supply =3D <&vreg_l15b_e0_1p8>;
>> > +     vdd3-supply =3D <&vreg_l7b_e0_3p1>;
>> > +};
>> > +
>> > +/* SID-11 (smb2370_l) does not enumerate on this board; keep it disab=
led. */
>> > +&smb2370_l_e2 {
>> > +     status =3D "disabled";
>> > +};
>> > +
>> > +&swr0 {
>> > +     status =3D "okay";
>> > +
>> > +     /* WSA8845, left woofer */
>> > +     left_woofer: speaker@0,0 {
>> > +             compatible =3D "sdw20217020400";
>> > +             reg =3D <0 0>;
>> > +             reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> > +             #sound-dai-cells =3D <0>;
>> > +             sound-name-prefix =3D "WooferLeft";
>> > +             vdd-1p8-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vdd-io-supply =3D <&vreg_l18b_e0_1p2>;
>> > +             qcom,port-mapping =3D <1 2 3 7 12 14>;
>> > +     };
>> > +
>> > +     /* WSA8845, left tweeter */
>> > +     left_tweeter: speaker@0,1 {
>> > +             compatible =3D "sdw20217020400";
>> > +             reg =3D <0 1>;
>> > +             reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>> > +             #sound-dai-cells =3D <0>;
>> > +             sound-name-prefix =3D "TweeterLeft";
>> > +             vdd-1p8-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vdd-io-supply =3D <&vreg_l18b_e0_1p2>;
>> > +             qcom,port-mapping =3D <4 5 6 7 13 15>;
>> > +     };
>> > +};
>> > +
>> > +&swr3 {
>> > +     status =3D "okay";
>> > +
>> > +     /* WSA8845, right woofer */
>> > +     right_woofer: speaker@0,0 {
>> > +             compatible =3D "sdw20217020400";
>> > +             reg =3D <0 0>;
>> > +             reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
>> > +             #sound-dai-cells =3D <0>;
>> > +             sound-name-prefix =3D "WooferRight";
>> > +             vdd-1p8-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vdd-io-supply =3D <&vreg_l18b_e0_1p2>;
>> > +             qcom,port-mapping =3D <1 2 3 7 12 14>;
>> > +     };
>> > +
>> > +     /* WSA8845, right tweeter */
>> > +     right_tweeter: speaker@0,1 {
>> > +             compatible =3D "sdw20217020400";
>> > +             reg =3D <0 1>;
>> > +             reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
>> > +             #sound-dai-cells =3D <0>;
>> > +             sound-name-prefix =3D "TweeterRight";
>> > +             vdd-1p8-supply =3D <&vreg_l15b_e0_1p8>;
>> > +             vdd-io-supply =3D <&vreg_l18b_e0_1p2>;
>> > +             qcom,port-mapping =3D <4 5 6 7 13 15>;
>> > +     };
>> > +};
>> > +
>> > +&tcsr {
>> > +     vdda-qrefrpt0-0p9-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-qrefrpt1-0p9-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-qrefrpt2-0p9-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-qrefrpt3-0p9-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     vdda-qrefrpt4-0p9-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     vdda-qrefrx0-0p9-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-qrefrx1-0p9-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-qrefrx2-0p9-supply =3D <&vreg_l2f_e1_0p88>;
>> > +     vdda-qrefrx4-0p9-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     vdda-qrefrx5-0p9-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     vdda-qreftx0-0p9-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     vdda-qreftx0-1p2-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-qreftx1-0p9-supply =3D <&vreg_l1f_e1_0p88>;
>> > +     vdda-refgen3-0p9-supply =3D <&vreg_l2f_e0_0p94>;
>> > +     vdda-refgen3-1p2-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-refgen4-0p9-supply =3D <&vreg_l1f_e1_0p88>;
>> > +     vdda-refgen4-1p2-supply =3D <&vreg_l4f_e1_1p2>;
>> > +};
>> > +
>> > +&tlmm {
>> > +     gpio-reserved-ranges =3D <4 4>, /* EC TZ Secure I3C */
>> > +                            <10 2>, /* OOB UART */
>> > +                            <44 4>, /* Security SPI (TPM) */
>> > +                            <65 1>; /* EC reset */
>> > +
>> > +     edp_bl_en: edp-bl-en-state {
>> > +             pins =3D "gpio18";
>> > +             function =3D "gpio";
>> > +             drive-strength =3D <16>;
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     ts0_default: ts0-default-state {
>> > +             pins =3D "gpio51";
>> > +             function =3D "gpio";
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     tpad_default: tpad-default-state {
>> > +             pins =3D "gpio66";
>> > +             function =3D "gpio";
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     kybd_default: kybd-default-state {
>> > +             pins =3D "gpio67";
>> > +             function =3D "gpio";
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     edp_reg_en: edp-reg-en-state {
>> > +             pins =3D "gpio70";
>> > +             function =3D "gpio";
>> > +             drive-strength =3D <16>;
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     lid_default: lid-default-state {
>> > +             pins =3D "gpio92";
>> > +             function =3D "gpio";
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     wcn_sw_en: wcn-sw-en-state {
>> > +             pins =3D "gpio94";
>> > +             function =3D "gpio";
>> > +             drive-strength =3D <2>;
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     wcn_wlan_bt_en: wcn-wlan-bt-en-state {
>> > +             pins =3D "gpio116", "gpio117";
>> > +             function =3D "gpio";
>> > +             drive-strength =3D <2>;
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
>> > +             pins =3D "gpio126";
>> > +             function =3D "usb2_dp";
>> > +             bias-disable;
>> > +     };
>> > +
>> > +     pcie4_default: pcie4-default-state {
>> > +             clkreq-n-pins {
>> > +                     pins =3D "gpio147";
>> > +                     function =3D "pcie4_clk_req_n";
>> > +                     drive-strength =3D <2>;
>> > +                     bias-pull-up;
>> > +             };
>> > +
>> > +             perst-n-pins {
>> > +                     pins =3D "gpio146";
>> > +                     function =3D "gpio";
>> > +                     drive-strength =3D <2>;
>> > +                     bias-disable;
>> > +             };
>> > +
>> > +             wake-n-pins {
>> > +                     pins =3D "gpio148";
>> > +                     function =3D "gpio";
>> > +                     drive-strength =3D <2>;
>> > +                     bias-pull-up;
>> > +             };
>> > +     };
>> > +
>> > +     pcie5_default: pcie5-default-state {
>> > +             clkreq-n-pins {
>> > +                     pins =3D "gpio153";
>> > +                     function =3D "pcie5_clk_req_n";
>> > +                     drive-strength =3D <2>;
>> > +                     bias-pull-up;
>> > +             };
>> > +
>> > +             perst-n-pins {
>> > +                     pins =3D "gpio152";
>> > +                     function =3D "gpio";
>> > +                     drive-strength =3D <2>;
>> > +                     bias-disable;
>> > +             };
>> > +
>> > +             wake-n-pins {
>> > +                     pins =3D "gpio154";
>> > +                     function =3D "gpio";
>> > +                     drive-strength =3D <2>;
>> > +                     bias-pull-up;
>> > +             };
>> > +     };
>> > +};
>> > +
>> > +&uart14 {
>> > +     status =3D "okay";
>> > +
>> > +     bluetooth {
>> > +             compatible =3D "qcom,wcn7850-bt";
>> > +             max-speed =3D <3200000>;
>> > +
>> > +             vddaon-supply =3D <&vreg_pmu_aon_0p59>;
>> > +             vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
>> > +             vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
>> > +             vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
>> > +             vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
>> > +             vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
>> > +             vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p8>;
>> > +     };
>> > +};
>> > +
>> > +&usb_0 {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_0_dwc3_hs {
>> > +     remote-endpoint =3D <&pmic_glink_hs_in>;
>> > +};
>> > +
>> > +&usb_0_hsphy {
>> > +     vdd-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     vdda12-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     phys =3D <&smb2370_j_e2_eusb2_repeater>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_0_qmpphy {
>> > +     vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-pll-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     refgen-supply =3D <&vreg_l2f_e0_0p94>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_0_qmpphy_out {
>> > +     remote-endpoint =3D <&pmic_glink_ss_in>;
>> > +};
>> > +
>> > +&usb_1 {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_1_dwc3_hs {
>> > +     remote-endpoint =3D <&pmic_glink_hs_in1>;
>> > +};
>> > +
>> > +&usb_1_hsphy {
>> > +     vdd-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     vdda12-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     phys =3D <&smb2370_k_e2_eusb2_repeater>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_1_qmpphy {
>> > +     vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-pll-supply =3D <&vreg_l1h_e0_0p94>;
>> > +     refgen-supply =3D <&vreg_l2f_e0_0p94>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_1_qmpphy_out {
>> > +     remote-endpoint =3D <&pmic_glink_ss_in1>;
>> > +};
>> > +
>> > +/* usb_2's combo PHY drives the HDMI bridge over DP; keep the dwc3 en=
abled. */
>> > +&usb_2 {
>> > +     maximum-speed =3D "high-speed";
>> > +
>> > +     phys =3D <&usb_2_hsphy>;
>> > +     phy-names =3D "usb2-phy";
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_2_hsphy {
>> > +     vdd-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     vdda12-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_2_qmpphy {
>> > +     vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-pll-supply =3D <&vreg_l3f_e0_0p91>;
>> > +     refgen-supply =3D <&vreg_l2f_e0_0p94>;
>> > +
>> > +     /delete-property/ mode-switch;
>> > +     /delete-property/ orientation-switch;
>> > +
>> > +     status =3D "okay";
>> > +
>> > +     ports {
>> > +             port@0 {
>> > +                     #address-cells =3D <1>;
>> > +                     #size-cells =3D <0>;
>> > +
>> > +                     /delete-node/ endpoint;
>> > +
>> > +                     usb_2_qmpphy_out_dp: endpoint@0 {
>> > +                             reg =3D <0>;
>> > +
>> > +                             data-lanes =3D <3 2 1 0>;
>> > +                             remote-endpoint =3D <&hdmi_bridge_in>;
>> > +                     };
>> > +             };
>> > +     };
>> > +};
>> > +
>> > +/* Internal USB2 host for the Elan fingerprint reader (usb 04f3:0ca8)=
. */
>> > +&usb_hs {
>> > +     dr_mode =3D "host";
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_hs_phy {
>> > +     vdd-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     vdda12-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +/* Multiport host: port 0 =3D chassis USB-A, port 1 =3D internal USB =
HID. */
>> > +&usb_mp {
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_mp_hsphy0 {
>> > +     vdd-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     vdda12-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_mp_hsphy1 {
>> > +     vdd-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     vdda12-supply =3D <&vreg_l4h_e0_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_mp_qmpphy0 {
>> > +     vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-pll-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     refgen-supply =3D <&vreg_l4f_e1_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> > +
>> > +&usb_mp_qmpphy1 {
>> > +     vdda-phy-supply =3D <&vreg_l4h_e0_1p2>;
>> > +     vdda-pll-supply =3D <&vreg_l2h_e0_0p88>;
>> > +     refgen-supply =3D <&vreg_l4f_e1_1p2>;
>> > +
>> > +     status =3D "okay";
>> > +};
>> >
>> > --
>> > 2.50.1
>> >
>> >
