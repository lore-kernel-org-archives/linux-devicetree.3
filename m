Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F9403AFD
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211587; cv=pass; b=YOEp2GlhXKcCcoSlalR/aHBwX1/me8iNZOWmu4kiW5RWNx5trv/jWgY621G2eYvUYO+91ZVL7DQzZS8aXkdhIaIM7Sr0/nXpXSSg9PSerfCZ7a0RlmZar9TQ0EhUkV0mU71HFYuIuc8reGJ/Fwj29Xqd+CRQYj8ikGLspKLZ9OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211587; c=relaxed/simple;
	bh=CM/oWCISbj8feCmQItFg76YhWpc0RyoLE1NSoHhH0i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQjKgd+U00nkKoYSvaZfFv3j0F30AXvrllIeM6bLPL7AqpjFmYSMFvxC01W4okBY094wIIS0P4R8gGrFjs+78h/xIPp19+Mep6M4ouPS2UlQZZzWd6wN0JEGg0i+uGpNqP3DNuuBX9HDKteN46RbbuPI9nPB5tMXRrUJEYqdHlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=XALxpG6f; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="XALxpG6f"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e512a9a6bso348953185a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784211584; cv=none;
        d=google.com; s=arc-20260327;
        b=Mdxx1K1izlcoTYgM5MG1h6pSSQNbcijQJAtkHm45uG1GYveP9rUd85Tm0GxLGDDyXi
         6vGrj08iFEJMErBZnrJyJh4TdaPJP4eFfDjxPapYTxliJEVDt6afZOeUj3iWQev+AXev
         IehMor84HEThHpFzaK28GifwU34h6FYAqcnYlTULB5PfjmCG/TTAbxQ02ZX/xrC/djPf
         Dj5SFzCTPM/8Ag34LVIYoCUnQtKybdQlsFTFbkuvhaZJsjS3d75yKI2Wv55COFWcfAle
         skkoB3DPYhQWZ0Y6LCTa4umSVf9e/OvCuZRVs3ljon5v/0i8NgfZcNfQvHbxGCd1e98l
         yzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=;
        fh=RMIVbbRYkHF5/0IPzwA+dL73pvg5iyORQkEC6krNrg4=;
        b=Qjh5o/WXWROU1Jur+XVmjrMYqyzSzzGnxW6/tbQIsZ8RTci7lkKxoCNH1DYTu/qAOE
         i9rgRpGzryRqBwxm6JgqMZxDxzf9EGILaIRffcmEVnM3l0sShzMxXSlA7MKTPigZU67Y
         vmUQunTt+hrEsqqD9BXvCXj7jTVzYC0+G9Kg2yzzkxWoheBYBkAoz3kpXNJzx8iM97uL
         yyUfDGsEUtgxyDq0d/GSlEpIy71yS4FDHtJKZ0atYxorFr1NLN/ggL7PKJ2tYxkG/WHi
         AxcgYysQ7JY2i9g/M/3+0oOb0O03JfKj8i5Z2B36Epuwt2R89jdpDrY6frVzo/H3RpOn
         r8lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1784211584; x=1784816384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=;
        b=XALxpG6fPe+QvcCE2W5V32FRYhzUDqUuFOdrHdu0auWsnit3COGcEQ3NgLRu3NXPCp
         oXcGGc4/yDLdVoEASkvmrUczx5IUIqCYsWelbZXpBDllbld+crz/z/9+Zd69hBXyDMNC
         hVF7IrXkEcnEyh1ChZe5gaTKO+gyni7pSoCWuFDdUCsOLh12WnY3IypT/eTFQ/X8MEBJ
         DK+0iifH5b2CvxW0kmhkT9GvqqQqgUKR1S32MLiuOkU99Wvbg2aNZbPMEWHszI2h3UqX
         jNCSkyPbeuboBxILFRvO7DDi0JNjd9J3BnK13OI8n3OOPploGZC5XtQIkf9tW0WKtGXF
         lsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211584; x=1784816384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kS+alGnsif5zPcgusNl6KrEfFeDFZl8IkaD1XdPSRXw=;
        b=a1XzvwTFf0jq0Nb15rhLEMeYK7qfCUrYs15ftQQhGp3P9+BJHEqd1L+AlpDHtQlUnK
         BAEnchB5npPBcZOdw9lliYnYA1VdBkB4md1Bn4K07NfwjqDwtKHc7+CSpvlChEr0TouB
         eEyRxNVWxqBqmsdD43WVYzz+zMcyTPT4jxEqEk4SnN+vZLJsVxk0TNPm3aoUPg9olNnu
         dDbL/TktGny+fAYesmI3FKI7FXnvWkkzayvUlsQin7U0ZgBNzZCvssv/jCzXbjYVO5w7
         lfX0VRTuwy2DQH8mXJqBKaIuiMZFj+ZfkDftAVQKiX46HseJT26lFERoY53MNFgmxfJs
         NYmw==
X-Forwarded-Encrypted: i=1; AHgh+RqF9DHq++M5XGb9ud2kjRWUTcmbJM8vBoNxoCqzcQ5b8ln2Wx2G6VqDrpLYzivD4aDHDRvZc9aokpny@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3N+/7Gs7rkFhmdZOxJUJt2H17WGJBGmsCUCQQBLusP+wfhAyW
	FwiiVYoG/sgt09aNPqacrOuldN6Ul4yg2ZdRDZuz4uzFwAxz69923oWmwZc/tevhjnPUDbZEXbx
	BHZPGF1bWIQnCND5+w80qijeyDjVnkr9q4OTBdQtYOA==
X-Gm-Gg: AfdE7ckkPdB6kLbdFAoqZevTZo+10kFms1Eftw57yiCcsDQ68xG3C0eSBfiWv63rpnG
	GdjvZtWEkktC6ig7zbmyrZtMGbbOhmW8uk4rV5k3WrmwwL2re4nLSVuKHbBtnUCAffUw41YE3Dg
	zob94R512aPL4KQ/Rs+8ZpMS/h4dgX71856931Ksaj7iHNJ8Nja1A+aMumCTyMeUV63r6BRtj4Z
	F3mLkeRZzfhlHw5Y0ds+3umS/cTOHlpYPK/5CDtah1PklYt1qE5+ih8zMRE53BDqawkJ4KeKZPX
	T7us2/oFF/Ceyoh2Iq0NxnItonQvWTXuYnzgh0nRl78e8g98SHD+P5tgqLqcvMcWhIxYlCsJFrm
	9XdsJJA==
X-Received: by 2002:a05:620a:6982:b0:92e:5c0b:a6a0 with SMTP id
 af79cd13be357-93086a54171mr1198167185a.26.1784211584260; Thu, 16 Jul 2026
 07:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511025352.106126-1-dennis@ausil.us> <CAABkxwvWNvZbGNRYGQVnrORr0ycXFY=SdUTD9Oe9tkPcdPSUEA@mail.gmail.com>
In-Reply-To: <CAABkxwvWNvZbGNRYGQVnrORr0ycXFY=SdUTD9Oe9tkPcdPSUEA@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Thu, 16 Jul 2026 09:19:32 -0500
X-Gm-Features: AUfX_myQKtrnP7-Wv8qJa1bMcngAWvoeQ8OxtsztRgnJdHO4XZo93xGlFfZgBk4
Message-ID: <CAABkxwuHdNUDvLbDhVTcDeBB4mzAE6XYq+TD47iHzcEpXH6yDA@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Alexey Charkov <alchark@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just pinging again to see if anything more is needed?

Dennis

On Wed, Jun 3, 2026 at 9:49=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> wro=
te:
>
> Hi,
>
> Just checking if anything else is needed.
>
> Dennis
>
> On Sun, May 10, 2026 at 9:53=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> =
wrote:
> >
> > This series adds initial support for the Xunlong Orange Pi 5 Pro, based=
 on
> > the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe)=
,
> > a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to So=
C
> > (Second port is disabled in this patch), and a 40-pin expansion header.
> >
> > The series was tested against Linux 7.0
> >
> > Please take a look.
> >
> > Thank you,
> >
> > Dennis Gilmore
> >
> > Changes in v10:
> > - rename rk806_single to rk806
> > - link to v9: https://lore.kernel.org/linux-devicetree/20260429024737.5=
44813-5-dennis@ausil.us/
> >
> > Changes in v9:
> > - removed support for the dp-to-HDMI bridge, will send in a second patc=
h
> >   set to enable discusion to finish on how to handle its two operating
> >   modes
> > - link to v8: https://lore.kernel.org/linux-devicetree/20260425031011.2=
529364-1-dennis@ausil.us/
> >
> > Changes in v8:
> > - Bridge node: renamed label from lt8711uxd to hdmi-bridge
> > - Bridge node: added vdd-supply =3D <&vcc3v3_dp>. The vcc3v3_dp regulat=
or
> >   gates power to the LT8711UXD. regulator-always-on is kept because
> >   drm_simple_bridge only enables vdd-supply with HPD which does not
> >   happen without power on
> > - GPIO output pinctrl groups (bt_wake_gpio, dp_bridge_en, ethernet_en,
> >   vcc5v0_otg_en, wifi_enable_h) changed from pcfg_pull_none to
> >   pcfg_pull_down to match the RK3588S power-on-reset default state
> > - pcie2x1l1 (NVMe): switched from GPIO-mode reset to hardware sideband =
pins
> >   using pinctrl-0 =3D <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
> >   <&pcie30x1m1_1_waken>. Note: despite the "pcie30" prefix in the DTSI
> >   group names, the SoC pin-mux table confirms these alt-function 4 pads
> >   physically route to pcie2x1l1's native PERST#/CLKREQ#/WAKE# inputs.
> >   reset-gpios is retained alongside the pinctrl entry for U-Boot
> >   compatibility (pcie_dw_rockchip in U-Boot requires reset-gpios).
> > - pcie2x1l2 (NIC): added &pcie20x1m0_clkreqn and &pcie20x1m0_waken to
> >   pinctrl-0
> > - Renamed pinctrl group vcc3v3_phy1_en to ethernet_en to match the
> >   schematic signal name (Ethernet_EN)
> > - link to v7: https://lore.kernel.org/linux-devicetree/20260414214104.1=
363987-1-dennis@ausil.us/
> >
> > Changes in v7:
> > - Fix up whitespace issues identified by checkpatch.pl --strict in
> >   rk3588s-orangepi-5-5b.dtsi
> > - checkpatch gave a warning for WARNING: phy-mode "rgmii-rxid" without
> >   comment, as this was moved over I left it untouched
> > - Added lontium,lt8711uxd to the compatible enum in the simple-bridge
> >   binding
> > - Added lontium,lt8711uxd match entry with DRM_MODE_CONNECTOR_HDMIA to
> >   the simple-bridge driver
> > - New patch to rename the regulator labels for the es8388 supplies to
> >   match the schematics and they all use vcca_*
> > - Fixed ES8388 PVDD-supply =E2=80=94 vcca_3v3_s0 =E2=86=92 vcca_1v8_s0,=
 5 Pro is
> >   different to 5 and 5b.
> > - analog-sound: use CPU-as-clock-master on the Pro. The ES8388 is wired=
 to
> >   i2s2_2ch (the only I2S block physically routed to the codec pins on t=
his
> >   board), which uses the legacy rockchip_i2s driver. That driver's
> >   slave-mode trigger path hangs for 200 =C2=B5s polling I2S_CLR and bai=
ls with
> >   -ETIMEDOUT ("lrclk update failed"). The TDM-capable i2s0/i2s1/i2s5
> >   blocks served by rockchip_i2s_tdm don't have this issue, which is why
> >   other mainline ES8388 boards get away with bitclock-master =3D master=
dai.
> >   Drop bitclock-master/frame-master and the masterdai label to let the =
I2S
> >   block generate BCLK/LRCK itself
> > - Removed regulator-always-on/regulator-boot-on from vcc3v3_dp
> > - Added pinctrl entries for all GPIO pins (dp_bridge_en, vcc3v3_phy1_en=
,
> >   wifi_enable_h, pcie2x1l1_rst, pcie2x1l2_rst)
> > - DP bridge rework =E2=80=94 replaced dp-connector node with proper cha=
in:
> >     - lt8711uxd bridge node (compatible lontium,lt8711uxd, with port@0/=
port@1
> >       endpoints). Bridge power is gated by the vcc3v3_dp regulator, who=
se
> >       enable GPIO (GPIO3_PC2) is driven via the dp_bridge_en pinctrl gr=
oup;
> >       no enable-gpios/vdd-supply on the bridge node itself.
> >     - hdmi1-con connector node (compatible hdmi-connector, type a)
> >     - dp0_out endpoint now points to bridge input instead of old connec=
tor
> > - remove accidentally included unnecessary changes
> > - link to v6: https://lore.kernel.org/linux-devicetree/20260411024743.1=
95385-1-dennis@ausil.us/
> >
> > Changes in v6:
> > - Move the shared configs for the Orange Pi 5 and Orange Pi 5b from eac=
h
> >   devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplicati=
on
> > - Remove empty ports subnodeis from typea_con
> > - Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
> > - Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regula=
tor
> >   in order to get the second HDMI port working via its transparent
> >   LT8711UXD DP to HDMI bridge
> > - link to v5: https://lore.kernel.org/linux-devicetree/20260401010707.2=
584962-1-dennis@ausil.us/
> >
> > Changes in v5:
> > - define a connector node for Type-A port, and list the regulator as it=
s VBUS supply explicitly.
> > - Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e5=
5a4c2@flipper.net/
> > - link to v4: https://lore.kernel.org/linux-devicetree/20260310031002.3=
921234-1-dennis@ausil.us/
> >
> > Changes in v4:
> > - rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy=
1 to match the schematic
> > - use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
> > - remove the definition for vcc3v3_pcie_m2 as it does not really exist
> >   as a regulator
> > - link to v3: https://lore.kernel.org/linux-devicetree/20260306024634.2=
39614-1-dennis@ausil.us/
> >
> > Changes in v3:
> > - moved leds from gpio-leds to pwm-leds
> > - remove disable-wp from sdio
> > - rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
> >   purpose
> > - actually clean up the delete lines and comments missed in v2
> > - link to v2: https://lore.kernel.org/linux-devicetree/20260304025521.2=
10377-1-dennis@ausil.us/
> >
> > Changes in v2:
> > - moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
> >   dts files
> > - removed all the comments and deleted properties from 5 Pro dts
> > - link to v1: https://lore.kernel.org/linux-devicetree/20260228205418.2=
944620-1-dennis@ausil.us/
> >
> > Dennis Gilmore (4):
> >   dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
> >   arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator label=
s
> >     to match schematic
> >   arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
> >     Pro
> >   arm64: dts: rockchip: Add Orange Pi 5 Pro board support
> >
> >  .../devicetree/bindings/arm/rockchip.yaml     |   1 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 +++++++++++++
> >  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 358 ++++++++++++++++++
> >  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
> >  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +------------
> >  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
> >  7 files changed, 637 insertions(+), 250 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.=
dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts
> >
> > --
> > 2.54.0
> >
