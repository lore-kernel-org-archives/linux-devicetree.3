Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249F3C870E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147880; cv=pass; b=FeCQjhFwHwBewE8rgrNVnGhrlzEbHbT24cjF4ZBSgnnbAx+AIZhOHPKbOl/LfwoqTVIqeYAHxd27WB9xUosDg7sQCDrAu1wPrw4cuFwuuWxnorcHJgmEep4+Pq2Q983H24n71+kJJl41IT07ABuNLqmfq7E0yMLm6dJh/IaD0rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147880; c=relaxed/simple;
	bh=lG/WFeH87vqtjnptzvJW446/nEgEoeKoQkm/5Djazz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZwZsTb+FuVntsYY2RUfzTmjN+w4dE4IqpgwE6dyNs1RGkoxCCxRzjdCIERKKvBLIDQR7oZVybCP9z3AeHSRraQYYRDLetYfr3gdve2/2iOXQLujf45prxkOtah+7PAb4Rg+/1nSE8VUyStweLOZt0qGd3Rn0CgVwkI1N8wwweo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnXdmD2M; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnXdmD2M"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bf02533706so5896597b3.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778147878; cv=none;
        d=google.com; s=arc-20240605;
        b=MSpa+vGVQgZEV1MPjLCmel5jQzlYAxDHMu2MhS3sRkbO2ec0ui4pxf18hODRU8wKPJ
         AiUIW38FCdhI1FkxJRusFBbL83yq3Wnexm/ih9I2gtRqpGeZKOOudEf7PvQM0CtpkwYD
         tl1DT5VFnQC6HajB9u1+mqIxvak6O8lS9hVL0WsiXGeR/5OCIHDd91+PyGoJzDugT5VH
         TY/194VXydXNLeNf8Rmp1Fj551e0FeU3IUlzSXGGa12anhXBgPo+4ZElKb1aMqycAtVp
         HKza0yVrMC+VX4z+yIJjT1lZzyHVmt/nbVq+LkuXQa4NqFBVtu6bipfNMOSvPbpgHU6X
         Ze9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=teeg7B/cv6Maulsok9TtnxjcrBZjPFk85S/kl2WpsR8=;
        fh=Jg99uLvE8tDW44S3fvHy6ihSWbh56NWV00NFtkHW6Gg=;
        b=HX8XbNWFtAJCmS1I+eXpYjp5R922Isv9E1bmYhjMfKoIiiugu4yobt+l1f15ITGA9C
         asHh1UkLEwg6hhfQYXop7OJN6J9SV9vN7bQ9de56O65PcQFOCUm+9Rj+R3S17BufRKKR
         xk+IFKf439LcvUF5PnLwUS6lWY7XNjJ9vgJIakj8KVoBxwxBYeHbLc5VoVv/s1Vmc3T7
         YZk6vmPckZN5wvuwc/YhE8cQdHPRQttwETwnYu6Ee3cLYe1SXoaGQIRCF9zcIwcRsNii
         /AruqnVgtl+J7TCJl25rD/P+aGYPiHFSIXWRX3wn44BxVtUYTS8P/oby9+gpA+9uBkXx
         uwbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147878; x=1778752678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teeg7B/cv6Maulsok9TtnxjcrBZjPFk85S/kl2WpsR8=;
        b=AnXdmD2MhnZFICLpZZWh/BHUIGRiW7GAm5IwQPTyjaqBv+Zw8vgpF7N2SpRTFGSCrx
         iI7dDRuNFcPpqJSseZQ3hjYFQcEtO6JC/i/IfljN93sS8CoAbnGTxn8lNVHQVpki7FOo
         BAzuE5NQdoRMwaSKy0VCKWn2goeU34CMr7ShJRSS3R6CTjGukXZSnbzFmW7XQ8EwS79O
         Kt9nZrTorTTG6sA4eX6Cx/UPBeLHDq6e/zztthlP/xmkh9hpapA04XSFcxRU7jF2mCn6
         T+wyHMgRsegb5Odbk8S5VLWarMZMIyxOfJlWyIhADEHSOrQNhnIlDNuTq74MJEDQIEOy
         ZvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147878; x=1778752678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=teeg7B/cv6Maulsok9TtnxjcrBZjPFk85S/kl2WpsR8=;
        b=O5bRBql5oYX/cLDj0DxXtYzrrwU6Qf27onkQWEIJ+dc43/S5Stj1qZNrGxI/7mSkmB
         nJqbCr3U2x6Sp5a4emFQAbDEYQZK2DJZ7CFYgEKjtr7EwxFIp+OMLVveS1IRqYMF7PWf
         +nLVAze1jeRIYv0DHBJuG59oB7geOwz0bvOCIrHix1DvySX3pnTE903DzY/ELzoKdhXd
         H+Y3gTP/9ROj1jQGEo+A2269jEZIphcvB9RdorTxllyWtPXuESP9s1M2GTIKTFeFSnLC
         THr8V5hyw2Q31auwrOSBF+lVtyRdXQbrQkfcIBIZyIvpD0fGQ3mf9ww85nMfc0IgCUIx
         DbQw==
X-Forwarded-Encrypted: i=1; AFNElJ91o3KWT9JiKPDGVuiMvcu0Q4S55TCgxfGdm8E9B4pQ30SjlMMVY7WIABTwBt6dIPSVjQIo8ceR/qw+@vger.kernel.org
X-Gm-Message-State: AOJu0YyUAWTwFqhYWSkwPTPj/x45yZwNRxlR2BEVdlu9fb/dLECtznYv
	FyDSNOPzXB4vnc4esH0eHar87OAEs8DJBvhVknBB+Hrwsl9LSg8/Aff7ddSxiFwVdkMw1+JwgKV
	X3MUXn5wCopmgCw2nE16vu6AEtoE6ovw=
X-Gm-Gg: AeBDietPoeSR5fFKYyZMGtJewTVkgiTFzLJ8tJNHgNN7u5jUTeT0std2Nr4dhUYuprS
	ik4Kgqldgxacrn9/unpjLx3fFf1TcCVRb6/N3vZLlnifBtseqEqVU/pvNFUiCqWXNdhs2tCwJ3u
	bu3uvcWgWaNjk5HpYQts4PkktYhi92ne09VRGXDO+Gw+q1bVyI7rvJ3zneRssuMbRHLNGeyM8D8
	HP2kea0klGAOClhujt7y1dU4slxUrF76IO931uv6bvEqjyGAMcAfFSc8dgLAlURnBnkTWkxQPWl
	MDiyvmrC7CQUNxdRKFg=
X-Received: by 2002:a05:690c:c509:b0:7a0:4a34:16d6 with SMTP id
 00721157ae682-7bdf5f205a6mr74538287b3.44.1778147878025; Thu, 07 May 2026
 02:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <CANAwSgRNrs4C4B2o5KBpr29QWowTzpqVcQktAbFigiagxaFZAA@mail.gmail.com>
In-Reply-To: <CANAwSgRNrs4C4B2o5KBpr29QWowTzpqVcQktAbFigiagxaFZAA@mail.gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 7 May 2026 11:57:47 +0200
X-Gm-Features: AVHnY4IwLcYKNF0aQ66jlkAuqkfaQcbCBgeiWc7FTgCbiHIV5r1xsERI_gMwI6s
Message-ID: <CABdCQ=N5VHPeGvKYrYeAGCsCP5-wQ_50FsuW+hRY=9JK5WjQqQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Anand Moon <linux.amoon@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Now that the merge window has settled, I=E2=80=99d like to bring this serie=
s
back to your attention.

The series has been stable and tested across the OrangePi RV2, Banana
Pi F3, and Muse Pi Pro. Is there anything else needed on my end to get
this ready?

El jue, 23 abr 2026 a las 14:42, Anand Moon (<linux.amoon@gmail.com>) escri=
bi=C3=B3:
>
> Hi All,
>
> On Mon, 13 Apr 2026 at 13:32, Iker Pedrosa <ikerpedrosam@gmail.com> wrote=
:
> >
> > This series enables complete SD card support for the Spacemit K1-based
> > OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> > high-performance SD card operation.
> >
> > Background
> >
> > The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> > SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> > currently lacks basic SD controller configuration, SDHCI driver
> > enhancements for voltage switching and tuning, and power management
> > infrastructure.
> >
> > Implementation
> >
> > The series enables SD card support through coordinated layers:
> >
> > - Hardware infrastructure (patches 1-2): Device tree bindings for volta=
ge
> > switching hardware and essential clock infrastructure.
> > - SDHCI driver enhancements (patches 3-7): Regulator framework
> > integration, pinctrl state switching for voltage domains, AIB register
> > programming, and comprehensive SDR tuning support for reliable UHS
> > operation.
> > - SoC and board integration (patches 8-10): Complete K1 SoC controller
> > definitions, PMIC power infrastructure, and OrangePi RV2 board enableme=
nt
> > with full UHS support.
> >
> > This transforms the OrangePi RV2 from having no SD card support to full
> > UHS-I capability, enabling high-performance storage up to 208MHz.
> >
> > Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
>
> I'm just checking the status of this series. Since it hasn't been
> applied to linux-next,
> Will it be included in the next kernel release cycle?
>
> Thanks
> -Anand
> > ---
> > Changes in v8:
> > - Resending the series as v8. The v7 submission failed due to an SMTP
> >   error during transit, which resulted in a broken thread on the mailin=
g
> >   list.
> > - No functional changes from v7.
> > - Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v=
7-1-16650f49c022@gmail.com
> >
> > Changes in v7:
> > - Remove sdhci-common.yaml reference from DT binding.
> > - Link to v6: https://lore.kernel.org/r/20260407-orangepi-sd-card-uhs-v=
6-0-b5b8a1b2bfc8@gmail.com
> >
> > Changes in v6:
> > - Add pinctrl support for voltage switching. Document optional
> >   pinctrl-names property supporting "default" and "uhs" pinctrl states
> >   for coordinating pin configuration changes during UHS-I voltage
> >   switching.
> > - Update pinctrl state naming from "state_uhs" to "uhs" to match DT
> >   binding naming convention.
> > - Fix MMC drive strength values based on vendor kernel investigation.
> >   Correct 3.3V operation from 7mA to 19mA and 1.8V UHS operation from
> >   13mA to 42mA to match proven vendor implementation.
> > - Link to v5: https://lore.kernel.org/r/20260330-orangepi-sd-card-uhs-v=
5-0-bd853604322d@gmail.com
> >
> > Changes in v5:
> > - Document optional pinctrl-names property supporting "default" and
> >   "state_uhs" pinctrl states for coordinating pin configuration changes
> >   during UHS-I voltage switching.
> > - Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v=
4-0-567c9775fd0e@gmail.com
> >
> > Changes in v4:
> > - Revert to start_signal_voltage_switch() approach for bidirectional
> >   voltage switching: replace voltage_switch() callback with
> >   start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
> >   signal voltage directions.
> > - Fix DC input voltage specification: corrected the main power supply
> >   from 12V to 5V to match the OrangePi RV2 board specifications. The
> >   board uses a 5V USB-C input connector, not a 12V rail as previously
> >   specified in the device tree.
> > - k1-bananapi-f3.dts: add `broken-cd` property to work around card
> >   detection. Using `broken-cd` disables hotplug detection but keeps SD
> >   card functionality working without additional dependencies.
> > - Add SD card support for Muse Pi Pro board (contributed by Trevor
> >   Gamblin): enable SD card support with UHS-I capabilities following th=
e
> >   same pattern as OrangePi RV2, including dual pinctrl states, PMIC
> >   power supplies, and card detection.
> > - Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v=
3-0-aefd3b7832df@gmail.com
> >
> > Changes in v3:
> > - Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
> >   add reset support" patch.
> > - Squash tuning infrastructure and implementation patches (3 and 4)
> >   together to form complete functionality and avoid unused function
> >   warnings.
> > - Reduce code nesting: implemented an early return sanity check in
> >   spacemit_sdhci_voltage_switch() to reduce indentation and improve
> >   logic flow.
> > - Refactor pinctrl initialization: moved pinctrl resource acquisition
> >   and state lookup into a dedicated helper function,
> >   spacemit_sdhci_get_pins().
> > - Use generic regulator node names (buck4, aldo1) instead of
> >   device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that
> >   these PMIC outputs serve multiple devices.
> > - Remove dead code handling 3.3V voltage switching from
> >   spacemit_sdhci_voltage_switch().
> > - Optimize tuning algorithm to use single-pass window detection instead
> >   of storing results in array, reducing memory usage and complexity.
> > - Remove unnecessary card detect check in execute_tuning() - rely on MM=
C
> >   core.
> > - Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
> >   tuning support.
> > - Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilitie=
s
> >   following the same pattern as OrangePi RV2.
> > - Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v=
2-0-5bb2b574df5d@gmail.com
> >
> > Changes in v2:
> > - Removed custom AIB voltage switching code per maintainer feedback. Th=
e
> >   existing pinctrl driver already handles AIB voltage switching
> >   automatically via power-source property changes during UHS mode
> >   transitions. This eliminates code duplication.
> > - Squashed regulator and pinctrl commits into single voltage switching
> >   implementation.
> > - Moved voltage switching callback from dynamic probe assignment to
> >   static sdhci_ops declaration. Removed redundant SDHCI core call since
> >   the framework handles standard voltage switching automatically.
> > - Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
> >   conditional for SD/SDIO cards only. This follows vendor driver patter=
n
> >   of differentiating SD and eMMC card handling.
> > - Include no-mmc property for SD card.
> > - Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v=
1-0-89c219973c0c@gmail.com
> >
> > ---
> > Iker Pedrosa (8):
> >       dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage=
 switching
> >       mmc: sdhci-of-k1: enable essential clock infrastructure for SD op=
eration
> >       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching sup=
port
> >       mmc: sdhci-of-k1: add comprehensive SDR tuning support
> >       riscv: dts: spacemit: k1: add SD card controller and pinctrl supp=
ort
> >       riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrast=
ructure
> >       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with U=
HS modes
> >       riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UH=
S modes
> >
> > Trevor Gamblin (1):
> >       riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS=
 modes
> >
> >  .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  24 +-
> >  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
> >  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  67 ++++++
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
> >  drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++=
++++++++
> >  7 files changed, 480 insertions(+), 2 deletions(-)
> > ---
> > base-commit: 4c3b07bf68391122266dfb01126484daf352cf70
> > change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
> >
> > Best regards,
> > --
> > Iker Pedrosa <ikerpedrosam@gmail.com>
> >
