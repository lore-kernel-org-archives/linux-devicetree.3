Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFFF471CE1
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383953; cv=pass; b=dX/zmJrlYNzqHrQ7B7Qz1QA5SZKnlO2nOWzpzh0afATo50SXE3axDQBdXhf4pY1zq02Iw3DyFtk+TxAr0Ytxa5zoF8oyD1dPWYGGVMqGqpURLsimXdCr+ztZoNoX8A42sU/upRTVgtwPdoPKWUVCSzXmln79BX5zE3063oR68ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383953; c=relaxed/simple;
	bh=kRDX5d4Fxp6lom54Gexo11aTEyNvY7I7wqMeKyzSVVE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QjQ7V68/Jx9q2xbgnf/uHbLc+f0VAC9HqnLrnMxsgi/qm3sExy79GqP2AWNBMoIdrKQgOXmfTOncFnH2a5IZcVSoTmN3wBmEnz29mZh9hrUdQDwMv5cB+rVxLHC8lx+oZsqBoKh+VMI9PCXCbHjdSiQZ17YcIKDNhcsiKzIIoNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=of8+yMho; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="of8+yMho"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba7ed32ccdso4792780e87.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 07:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791383946; cv=none;
        d=google.com; s=arc-20260327;
        b=EjWtqX1r0Z5yNUJq3COLf3ShtEYiA5xvrQIeV4gy6r43aoPGWcuYjVe540YpJ7PX+K
         WQoUSVeaGMzis+Za776SkkgrILLKRIG2y532IXD0I3kmhwZ6l4VFryEw0nO2o67anIH5
         DFTWx7ewnv259/T2yx8oMTpHcTFfGgt33EKwCj7icK8PkP4wSppaXDEig+FYWoN6wj7D
         BNSkqCitQv7EVmb00ZLBKoMi6p+xPaVerw/VGIOZJsiHyP50mhKNx5/qaAw8AICj+yIL
         vcjKLheSeDvfeKfReTk7pqsqqwETp8HqclAvva6GWkSXUhL4N+Fs+bnmAqPxYw3Zh87H
         eVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        fh=96Q4yk+YDa0KF9jjfhX5IeAoxKbOLwcYRPbcV/CZTFs=;
        b=XyI+OtQnEja4Oc3NTQcvAPvuymk1x7vm5W0RNSCvNt1aHiBuiX/GRmOTO6zHbLZjdc
         D33FdgIeRbsHsUBWViRa6JfUuxVqGyUNNOzftpr6xJjRS3W6Y8ocaL0hEAmoY8e+cWbn
         FSUxLns7BMpiql9Ha/epy0shKRTwhWQ1H/4VuZHM4QbZZdJUgvn0EJeSYJTY/oEwsubi
         eXihPDrtrTbEKTrLrGh0FPvke63OkmtlTfBhIfvvUdvBAn6dmSDKdqzifeandV53K0tW
         5ZembCpnQ4dXohP8Kelnz+SHjrkHiYpMmWUsSg03yUodOoQbbdtW9UD6Pnx4Ovrtr0QZ
         mmRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791383946; x=1791988746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        b=of8+yMhoUczew89GXFWQqf1qdPVn70afHaFRCUI2xoKuTcmEsTWLrdNCHTh4TV1Fkp
         FvfVuyZPAweEq3O8ar2vBLskBXNgmxb7XVxZcXZLR1rxf/cAABPjp52z7Hx3D3AaHzu5
         F6WwpchiGaLgcu5n0fawAljxgdTkMKUlcWGC4XNM3+ymHMZ/80YtG7x/bpbGpSdQdlea
         /HaDiS2rQU1E7Kv4CS+id6XDk56RaOYmARBmXhpziFN98djzc6B4bZ1EVDZKP34U3pXY
         6ubBcexar99VE00YLqZjJ692N6BgGSo5H4SYu7q0A4UV1c+3rMi2lulu/ZUGlOMewlq+
         Bdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383946; x=1791988746;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pb/ni9yGHnr9WxRdlwyNVusDKwS3wvu2r4D0LWS3qt4=;
        b=oGs2VKkRb8Xc+TxXRyzEDAxZQnPRzry4ZbLgmEhA/iYTzIxPEayoD0d5hyE+a8HYRZ
         gSZnLrA+QIw2VIAs9FqbmyRDDgZPdVuLkBoUbNgnyOeNObFA1HG2i5BkROmbjnWT3ha9
         0UJLFcGD1K3m9QcYc0OQu0qVmeJ7o1TyA6ao4OQ/pe+AqTPlnnPhBaxlNHgj6KIhURId
         XDWwFPtG2z5s6YLaG0NTBAAiI8Qor8mHnBaCjf+7yyULBdrpAv9OptMBidJo2a2MBMh3
         lHTcB2fN0KQpKos99tj+dHXJs0afHmLoWBVycjNE4Vp0nJDleSEqRDVxVkLJG+zdwc3X
         xwKg==
X-Forwarded-Encrypted: i=1; AKwUvByc5QEDhlSOVmeOJh2q5zsgvYpAhCDPihsGN8hb1o/AkYrEhqk1z/Q8JW2+a8Aa547xGpe2IpyDBEEi@vger.kernel.org
X-Gm-Message-State: AFq9FYI7gGdiYtndTJbRFzN8QTr/spFBXazyyI9KL6EUABAABElLQuJ4
	1vJTkhHfI7isRlqcrEvXN6UEcgLAkNVJgzU368WGbxgI7lp+ZZW4WhDAxd6qL0ZYsrV7BLHrztV
	wG/qYpX7mZ1sf/cVwFoVQ9B8+4vTMW5ZkrNbO1yBz4Q==
X-Gm-Gg: AYBFou1hJymrnVHWzdTE9v7qR+jk8t5XSh1A43Bui+hfJvtcEe6qNUOyllJsLXxSSmO
	oPMqwAFSDXSlnJA99vFqeECETX0smkFrHKnUZfzgLbT4zcQ1NQBH3GufNNN/qqIQvpIS0MWHNDi
	wYUvPfjjB5/MiNh8FrvKbOQvuXJn+qp7OrUtf3d4ztZU1tdVQZGdWfppAcqR/J44Rhy/6hqr4yb
	B9rbs4NTnqdu+XSxg4/flGiJ2WYG+k511+nEI+HH5pUIfKq17Z+KjNtTF/aFS+F5YucFd0Fw76y
	SOo9M2VOF48lwoDruGOIm4i5whF+LfXwr7Igf02x0bqPMXkUPtfLU29qWCnN6SgaqX0EvEdnqu6
	IlGOcIEI2
X-Received: by 2002:a05:651c:b08:b0:3a7:72ec:81a3 with SMTP id
 38308e7fff4ca-3a9a2c34ecdmr6211391fa.8.1791383945851; Wed, 07 Oct 2026
 07:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 7 Oct 2026 16:38:53 +0200
X-Gm-Features: AclHuK9LjOZDikj3APsjlF2mTduppp_g_q38pi3ZhWs0i5yvsBiQNsj3lRGM9E8
Message-ID: <CAFERDQ3gUav1E7sw7FxsPmmt9GW=tP_Jh=7ufABs9CSaMYK6kQ@mail.gmail.com>
Subject: [RFC] bcm2837 RPi 3B: sdhci-iproc Wi-Fi probe fails without sdhost
 (GPIO48-53 left in alt3 by firmware)
To: florian.fainelli@broadcom.com, robh@kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
When building a minimal kernel for the Raspberry Pi 3B which doesn't need
sdcard access at all (root filesystem fully lives in RAM), I noticed that the
Wi-Fi doesn't work (kernel 7.2.6 with bcm2837-rpi-3-b.dts).

With:
> CONFIG_MMC_SDHCI_IPROC=y
> CONFIG_MMC_BCM2835=n
Wi-Fi doesn't work with following messages:

> sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
> mmc0: SDHCI controller on 3f300000.mmc [3f300000.mmc] using PIO
> mmc0: Failed to initialize a non-removable card

With:
> CONFIG_MMC_SDHCI_IPROC=y
> CONFIG_MMC_BCM2835=y
Wi-Fi works:

> sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
> mmc1: SDHCI controller on 3f300000.mmc [3f300000.mmc] using PIO
> sdhost-bcm2835 3f202000.mmc: loaded - DMA enabled (>1)
> mmc1: new high speed SDIO card at address 0001
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43430-sdio for chip BCM43430/1
> mmc0: host does not support reading read-only switch, assuming write-enable
> mmc0: new high speed SDXC card at address d555
> brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1 wl0: Mar 30 2021 01:12:21 version 7.45.98.118 (7d96287 CY) FWID 01-32059766

So, just adding CONFIG_MMC_BCM2835 makes Wi-Fi start working.
In my understanding, CONFIG_MMC_BCM2835 should not be needed to use the Wi-Fi.

After analysis, I noticed that the Raspberry Pi firmware leaves GPIO48-53 pins
in the alt3 state when Linux takes over (sdcard pins routed to sdhci-iproc).
When CONFIG_MMC_BCM2835 is not compiled in, the states of those GPIOs won't be
changed by Linux. And we end up with the sdhci-iproc controller electrically
bound to the Wi-Fi chip and the sdcard at the same time, resulting in a probe
error for the Wi-Fi chip.

Here are the states of GPFSEL3 GPFSEL4 and GPFSEL5 tested with devmem:

Register  Address     GPIOs    MMC_BCM2835=y  MMC_BCM2835=n
--------  ----------  -------  -------------  -------------
GPFSEL3   0x3f20000c  30-39    0x3FFFF000     0x3FFFF000
GPFSEL4   0x3f200010  40-49    0x24200924     0x3F200924
GPFSEL5   0x3f200014  50-59    0x00000924     0x00000FFF

3 bits per pin: 4 = ALT0 (sdhost), 7 = ALT3 (sdhci-iproc)

In the MMC_BCM2835=n case, we can see that GPIOs 48-53 are left on alt3.

I would like to be able to compile Linux with CONFIG_MMC_SDHCI_IPROC and
without CONFIG_MMC_BCM2835.
What is the best approach here? Is the kernel expected to rely on the GPIO
state left by the firmware? Or should it configure these pins itself?

I tried to have both sdhost and sdhci-iproc claim GPIO48-53 in the same state
to avoid the double routing, but it's not possible because pins can only be
claimed by 1 owner:
> pinctrl-bcm2835 3f200000.gpio: pin gpio48 already requested by 3f202000.mmc; cannot claim for 3f300000.mmc
> pinctrl-bcm2835 3f200000.gpio: error -22: pin-48 (3f300000.mmc)
> pinctrl-bcm2835 3f200000.gpio: error -22: could not request pin 48 (gpio48) from group gpio48 on device pinctrl-bcm2835
> sdhci-iproc 3f300000.mmc: error -22: Error applying setting, reverse things back

1) A solution could be to let the gpio-controller itself own those pins. I can
propose a patch removing:
> pinctrl-names = "default";
> pinctrl-0 = <&sdhost_gpio48>;

from the node &sdhost in the top level DTSes and make the gpio-controller
itself change those pin states, so that no matter which SD controllers are
compiled in, it will work.
I tested this on a 3B in all four combinations (sdhost and sdhci-iproc each
enabled or not), and it works. It adds one message to the dmesg:
> /soc/gpio@7e200000: Fixed dependency cycle(s) with /soc/gpio@7e200000/sdhost-gpio48

2) Or, if we can't support RPi kernels with CONFIG_MMC_SDHCI_IPROC=y and
CONFIG_MMC_BCM2835=n, we could perhaps add a Kconfig restriction selecting
CONFIG_MMC_BCM2835 automatically if that's really required.

3) Another solution could be to ask for a firmware change, so that the states
are cleaned before booting.

What do you think of those proposals?
Martin
