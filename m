Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8790E40B6F1
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514057; cv=pass; b=NUXJEe3VBiurkQnXPKkuYYQ5p4kzCaQuA6Two7e2XPq8lAjh+4o2OsjH9S7hL8p5vjU5lECJhiF2T3EetZ6OmLEOrQkWgITEpegSuEKIDblG3OlUF1hiyd1WcL2lVoyaphZVOLY1RZ7SzqEzeQXyJ28EqI/eALXrx1vpApfx760=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514057; c=relaxed/simple;
	bh=4pIi1AHFoV7bGajpZ/64rcrmUHojGu4W93E9mmQQP98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opXiAWU9VKcYQj/VJWQHe0eK+tM0gB1thnKHZhHRaWr8OzkEAPsQrLRUVDgRmlfVipFhFUNiFUQ9e6eAWlbJZnNhEJ6fleV2B3LWY2ZU1AZMp9yU5BnrcXf1nIPZYFl/Mn0A9QNjmiQIAMEUeZqAiu9bNZ+7W2F0YV47CNAq2wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STsc5pCE; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STsc5pCE"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dea72099eso4491307e87.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514054; cv=none;
        d=google.com; s=arc-20240605;
        b=ITD5YrjDcrbV/U1k21yJKLrw2C8i6GNRUNbR5zdlBshJbuaZr1o/MkOe/B6VtdNslK
         Y0YKFckmefI02aX8Et9HEWsDpWhYZmAC4ocd2BXE32mIDw4ad3zQh0yi5GmMxPaqbGsm
         H5LWlEqjLZ1z27RhNubmrDsjAiFoDLhqFAWNk1+vhVI8A6Os2RUkUsOh5p3UQK8fKC6I
         UVF7euK/AmFydP/O67jESMbjCd6Xkov+Ij0W8sy4MTCbyLaebiNKHOyLFXQFDuUzQKnQ
         6MW7XprKBhp+uXRTgTsQJgqRbMWoOjNWxNwFzbQd54iy3ugHKvNvM6w3evPkB+jQOD2F
         YyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        fh=zqZPBn4gHWwNXNmE6wAPREEcO2SSApINDKFKO3ghWMg=;
        b=Q/ilLkQliUa0dvP/ilEBqrlQMQ2y5LPDs3isBRwSmV+OlMsz2fHjsmox+s4VxYd7y7
         XoAxZBqjLmh2+zDWef+R0Xy7fV5PrxUEgklxcesITa4r2mX+IQPRWaq7mCywe3WPQKFl
         7VQGHkBMPg23M9vwhIrwcEt1kk+ngyaVOIGkD6enY82aFwt9JkAMtIcQMdaMp0TR7Hc5
         6Prv88Qe2WJvRgHfxks8PeogJrEqVtt8NP67hG47ObzocVNsSIvFfalDhTUnkbw3SFJo
         XplVoUy2qTZ3IPMcZ9EDTBA+I+apJD5qBhRFobfLk1caEfcfCBeWkDxGZ2wqhcRSPlfO
         UdLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514054; x=1779118854; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        b=STsc5pCEj2u6AXKU4ZgZLCTl8SBoQdmzCzKN1zRQGYjPVuCmbRdYstvryCqA1ORzK6
         bEIdGaWRscFm2GdmefCJOQ2FK9HG0RSB1vhwUn/NTaD0XBBIIyBhxEAeMtlvYYKXiRil
         YoDK7wwaO46KRa9XkL7XAI2faVYf9MywjA4UfzotvC8PiyKGfgX3vCmCkit48fVGbPk1
         8yCDJhjBRafrVoymobUnudTXJ1iFKjHvnYehwbIZFpnSqdlCh9b9ZQKoRhSKtJ3gZOmQ
         hH1AKQbuRHRzv+7ZecyE0wpzWD1pnAQGJTtBYnNAILMPstKkajhfEce1CRCUbQf5NOXd
         p7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514054; x=1779118854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfNDGrLKAbOadiJhwqdumLos0Y85vald79tk/V4cH8c=;
        b=XBFcO7xMXPQ0/YwkYn0aPpK9N2EfppSY5nTFT4JgCelPEpw4FxSGY2MA67csC7xeuT
         Q3MaZhsg4MEwy9EfQMLJTJMH9wEnvtET1q2ePxBrTIgO5XMq3RD3j6YEQVpW88PvwRpv
         8+huegOEDlOT+NZVa5xmaW9vewXSDqYxRWraq4nP07LDzfwtpw8Cv//YNnvK0EjEk+Em
         /qTKw5rEbsTkbbS8oAW5+7O23UCJtwcMKboi2e5pQLYT8dwmHZsyq27aUsBSb3zPF8B7
         r6bpOqcGS+hm7I6sXNZF5HGEnU+u4UUhQJtX823vAhgDpGPoDHuufglRiZtVKuKS0/5P
         9bDA==
X-Forwarded-Encrypted: i=1; AFNElJ/p8rF4Z6hNhF5uJDIXRvFSNR6yGhS9xNhvDIR3hB9eWKN9sL1lY56OTCB+kHVyPEiPu6387SHwbvWS@vger.kernel.org
X-Gm-Message-State: AOJu0YxKsRe8XaTk2DZxfSyVLyfQCOLkQuGDgm8f67a56kZ4KhvYeAGT
	Aj3LRn96UY1xJ7aR1DezHqBS/GsfOc2gOvgwAcU39p3t2FVrVJoB/3yiwPOKi98NCsZn/ev1+Lr
	WcuZyAxgRW6hRVk+B7gxH0sdKwdbMvKfZJDHPhHeBVg==
X-Gm-Gg: Acq92OGGHDGFki38REoG0U71drtsFVIM37H3bMm7NfVkDEfQ6MduevfX65GmtxMpQtD
	jjnCys6qI7sxFjcyNoDfUYppvCYa2yp5v1bZhVn7687urIdMUJ2k7zGou/jJVhjiR20//AaawjJ
	70OvsF8KOfCmBgiLFLw5VqOctOiVrkoqplOwbbYFMz8ARjlprr8EwPegKBJUa2Jg3OHk9kBDN/X
	5VU4t6osXjRqE84GDJKq4VfDeiHlTkzhEsqM158egGGkJOCN1K3DcqEa8Attb6DHi50dtFPgakd
	gmEyDFqm
X-Received: by 2002:a05:6512:3f23:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a887adaa88mr8185426e87.6.1778514053531; Mon, 11 May 2026
 08:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:40:08 +0200
X-Gm-Features: AVHnY4JG6GcAfGL3v7qotS87Q75eVy2s5uXmoBdyZ6OB2U_NOcV2oCmKoBt3Rb8
Message-ID: <CAPDyKFruD93LdDp3yuttXgzSjJKSrswRxMOqD6KP0UO3VzvZBQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Anand Moon <linux.amoon@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vincent Legoll <legoll@online.fr>, 
	Margherita Milani <margherita.milani@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 10:54, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> This series enables complete SD card support for the Spacemit K1-based
> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> high-performance SD card operation.
>
> Background
>
> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> currently lacks basic SD controller configuration, SDHCI driver
> enhancements for voltage switching and tuning, and power management
> infrastructure.
>
> Implementation
>
> The series enables SD card support through coordinated layers:
>
> - Hardware infrastructure (patches 1-2): Device tree bindings for voltage
> switching hardware and essential clock infrastructure.
> - SDHCI driver enhancements (patches 3-7): Regulator framework
> integration, pinctrl state switching for voltage domains, AIB register
> programming, and comprehensive SDR tuning support for reliable UHS
> operation.
> - SoC and board integration (patches 8-10): Complete K1 SoC controller
> definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
> with full UHS support.
>
> This transforms the OrangePi RV2 from having no SD card support to full
> UHS-I capability, enabling high-performance storage up to 208MHz.
>
> Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v9:
> - Rebased on top of "for-next" to include required infrastructure:
>   * P1 PMIC regulator definitions (commit c02c047b925c).
>   * GPIO pull-up/pull-down configuration support.
> - Updated BananaPi F3 SD card detect configuration to use GPIO pull-up
>   instead of "broken-cd" workaround:
>   * cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> - Link to v8: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com

Patch 1 to 4 applied for next, thanks!

Kind regards
Uffe


>
> Changes in v8:
> - Resending the series as v8. The v7 submission failed due to an SMTP
>   error during transit, which resulted in a broken thread on the mailing
>   list.
> - No functional changes from v7.
> - Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com
>
> Changes in v7:
> - Remove sdhci-common.yaml reference from DT binding.
> - Link to v6: https://lore.kernel.org/r/20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com
>
> Changes in v6:
> - Add pinctrl support for voltage switching. Document optional
>   pinctrl-names property supporting "default" and "uhs" pinctrl states
>   for coordinating pin configuration changes during UHS-I voltage
>   switching.
> - Update pinctrl state naming from "state_uhs" to "uhs" to match DT
>   binding naming convention.
> - Fix MMC drive strength values based on vendor kernel investigation.
>   Correct 3.3V operation from 7mA to 19mA and 1.8V UHS operation from
>   13mA to 42mA to match proven vendor implementation.
> - Link to v5: https://lore.kernel.org/r/20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com
>
> Changes in v5:
> - Document optional pinctrl-names property supporting "default" and
>   "state_uhs" pinctrl states for coordinating pin configuration changes
>   during UHS-I voltage switching.
> - Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com
>
> Changes in v4:
> - Revert to start_signal_voltage_switch() approach for bidirectional
>   voltage switching: replace voltage_switch() callback with
>   start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
>   signal voltage directions.
> - Fix DC input voltage specification: corrected the main power supply
>   from 12V to 5V to match the OrangePi RV2 board specifications. The
>   board uses a 5V USB-C input connector, not a 12V rail as previously
>   specified in the device tree.
> - k1-bananapi-f3.dts: add `broken-cd` property to work around card
>   detection. Using `broken-cd` disables hotplug detection but keeps SD
>   card functionality working without additional dependencies.
> - Add SD card support for Muse Pi Pro board (contributed by Trevor
>   Gamblin): enable SD card support with UHS-I capabilities following the
>   same pattern as OrangePi RV2, including dual pinctrl states, PMIC
>   power supplies, and card detection.
> - Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com
>
> Changes in v3:
> - Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
>   add reset support" patch.
> - Squash tuning infrastructure and implementation patches (3 and 4)
>   together to form complete functionality and avoid unused function
>   warnings.
> - Reduce code nesting: implemented an early return sanity check in
>   spacemit_sdhci_voltage_switch() to reduce indentation and improve
>   logic flow.
> - Refactor pinctrl initialization: moved pinctrl resource acquisition
>   and state lookup into a dedicated helper function,
>   spacemit_sdhci_get_pins().
> - Use generic regulator node names (buck4, aldo1) instead of
>   device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that
>   these PMIC outputs serve multiple devices.
> - Remove dead code handling 3.3V voltage switching from
>   spacemit_sdhci_voltage_switch().
> - Optimize tuning algorithm to use single-pass window detection instead
>   of storing results in array, reducing memory usage and complexity.
> - Remove unnecessary card detect check in execute_tuning() - rely on MMC
>   core.
> - Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
>   tuning support.
> - Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
>   following the same pattern as OrangePi RV2.
> - Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com
>
> Changes in v2:
> - Removed custom AIB voltage switching code per maintainer feedback. The
>   existing pinctrl driver already handles AIB voltage switching
>   automatically via power-source property changes during UHS mode
>   transitions. This eliminates code duplication.
> - Squashed regulator and pinctrl commits into single voltage switching
>   implementation.
> - Moved voltage switching callback from dynamic probe assignment to
>   static sdhci_ops declaration. Removed redundant SDHCI core call since
>   the framework handles standard voltage switching automatically.
> - Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
>   conditional for SD/SDIO cards only. This follows vendor driver pattern
>   of differentiating SD and eMMC card handling.
> - Include no-mmc property for SD card.
> - Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com
>
> ---
> Iker Pedrosa (7):
>       dt-bindings: mmc: spacemit,sdhci: add pinctrl support for voltage switching
>       mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>       mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
>       mmc: sdhci-of-k1: add comprehensive SDR tuning support
>       riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>       riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>       riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>
> Trevor Gamblin (1):
>       riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 ++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  22 +-
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  66 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  21 +-
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 ++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 ++
>  drivers/mmc/host/sdhci-of-k1.c                     | 257 +++++++++++++++++++++
>  7 files changed, 431 insertions(+), 3 deletions(-)
> ---
> base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,
> --
> Iker Pedrosa <ikerpedrosam@gmail.com>
>
