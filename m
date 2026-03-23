Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1393B776E
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279204; cv=pass; b=JGQKnZ+50rd+86EOaiPh7DoYAA551FBMeFuttvRBBoJkfG2ig6FL2UaH8/cF5W4UH8AA2wbDqPjPNURke4Sc16EViJIHSIb3LDQnMHKC6YEmXkeP4e6HhDi0fzP8hLxVbZWGpdP8ZM5Tq+zsCP0dT3nUUpD7uF79tbYeCR5QXiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279204; c=relaxed/simple;
	bh=Q3KPzKgZ9Grk59sKH1CK1xnfLjbkJABEjK8piuj/nrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT6FGnbA68ipAuO2c4agLNYp3ZIpTjgYQWf57tUdezHFg+9mCFWJzBkdDeOFro7/S1n9xf6ru8hZ1A6tW/Qjn4cDQB80y1dGOekTUvdOg6V2Xbab6z7kJVhydYAOOjxSs4sXQtgrKbGm686RwZ8WhXC3LrzUkrdKMJLwFa2FZNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKp4tV5D; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKp4tV5D"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so362311e87.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279200; cv=none;
        d=google.com; s=arc-20240605;
        b=CFMe3sbWl/rPGhXxFNbcnMZIxwp/TmkUzQGW4hPj+ImJFmy/HCC5Z6x3xht4AtKYBs
         sAMxgoFN/aGjD84cxW7YQq/fc1C2bKMJcpbVrr+mupIqyyIZYLdmHyj+KFErWCZvGOoS
         eoLWk6rXAShnRP+04NJi3AE7af0D/xQOqNQDpC+XWYzgRLTlJNQvNeKi1TOwSWJ+KCjH
         NJUcYHBdXadY+mOpHh/0gSCSJUGCxiw9Bwl0hAFDW46rwwnkP5JBc59+Jv2zD8cyUawa
         RM0URKaOPUHrhmLvW4QPm9MjbdMZCeqb6Qw8D559wuu+/C69vtanH2KYLecPhyo6R+lb
         GOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kXHNCd3mq7JHVp9hqKQG0KlxehC/Az8dh/4A8PeABAs=;
        fh=bCGvFauF3FHYuvJWwR6zT6BhVA/M9WXW+n7dQ3dJxi0=;
        b=bDs6T1M2r9rAM9iuthwNLobBTm7vZdgp7sEahz7UTx6QfomsGV10sxHl/n/55Cmi65
         kMkfZX4tuzg+g3uc8Maq3caOPhgjHT/BxZ1Fj+dzkZDQqOyG9OnRy/smSfJTPe0+NPF2
         CQBagqL2N1jxWmPlL1YIY3ULd/7x4H9CzReVc2dfYQS9jNTyPLVYV3my+jfgDD18oJoA
         aDBv/W2gdQbuU3hynNuRplsU8urhpnHG1H8fwaUAST1yIRuS0fzKFkygEwIhfuzawuA9
         E3g1my/UKUcq+NiUeRzvR0dEBq8eHi5TVp7Xx+f5alWkgczKLA1h+RX8C+Zi1vL83v70
         +Ing==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774279200; x=1774884000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kXHNCd3mq7JHVp9hqKQG0KlxehC/Az8dh/4A8PeABAs=;
        b=bKp4tV5D/OhsUUU5nTEQsU3lb0UPg5KABe9AfDc6qEIXakLNzAB3O33l03aN4/iyIp
         DUfB1krkbdVkq4Zi6BKe1eOYkdWPf9QBQoxSPGL6mi8K5C9P4xxSm2VnKxoEHgbmMCjM
         0JZx8yvoNfLeQpIdfqS37L1OaS7K82tztS7UUwaZ2TV59mXkfpaDWAich1a2QIM50vzq
         YUGsBhjhYz8W8alVKcTEYrB7a7KUerSTleFPiaxUlWfhzI4GBvqmYkMX6zF7UJm4M/dU
         cdNYvSqmhqFuzd0OCADdAuYovPKfKirQKu7DrofiDpLAq3NUAJ3K7CsViABi2BfXEOxX
         cLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279200; x=1774884000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXHNCd3mq7JHVp9hqKQG0KlxehC/Az8dh/4A8PeABAs=;
        b=pDAix+/cSAPwWLyhctmzL8v9uiRTrM/DxEa1AybXqoDil0DQOTWnoCzNFGq+bPaw7U
         uGK2BDpLPv5ZkwRNcue42qoxFHqLBQ6s4YiVwnDjTrd8G3/SIxBeLinB4fdUZnoxN8rc
         URED/jMEVBWTPKoy6+fLuozg2KfL9JQ3iBWfGct3LRLK2FzTKyz3Tbdcv1if12wKP7I2
         hZuvEYZ4opzYfeBROzYq6YhFDZRWxJGnp1+4Xj6+MjGx0u4JGIxIMWdm/YT7xYIvcVX8
         jWyMPTzjoKWVS67h7lJOLjer8aXoGc/jscLPi6ACPQh0UH6QNp0YcN2NQECDGPCEdExy
         EldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLl1GPWfzKiBITHT47Yac2RvncGKUdLuzp9jND23LFgxTGoVzSiozQBUUsO8Nt/g1kHELWV3E5+gvz@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1NZfkn9peaXtahmZkiLMAyYFySbgL3/vjam9oak6tMiYkJc8
	b7IzSOYTibeDKoJuVlLwTaiyBXvv56WqIjoA7Pte72+PUzdtEkBwAG6I/g1PxqO5l/yGpJQON5E
	XAFPr+PNW83RwEK8h0b2qWCHni74hLMGT2Q31egbzSw==
X-Gm-Gg: ATEYQzz0K81YqL19skvQv2AVp4MQ0kn0gT0KfiznFUEJRARXlxqva/h21b8Fbwgymhl
	rsc03bJbehVKWMmMX2Nf8OOjWU2yaBEgfcveW3BUB4mM5VAWU7iQVsm1LemBc+Aw3tvs1bVaN8+
	msB8kxI/ZSVecLEQ9PzhUpz8ovgPG6ZjlpEMDAIJzvUUeYqzOOiJsEyyaPmLBi2c/2vy0+f/7mQ
	iecKZuC/xB43VmzAdEhL0l23CV5K0JmQPOKHt5rB/vv8zTofH4PGsRk9394EuGruG23q9fzZ8bK
	nJoOEZFh
X-Received: by 2002:a05:6512:138a:b0:5a2:7a31:9193 with SMTP id
 2adb3069b0e04-5a285af99aamr4357366e87.18.1774279200004; Mon, 23 Mar 2026
 08:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316150115.2616827-1-nick.hawkins@hpe.com>
In-Reply-To: <20260316150115.2616827-1-nick.hawkins@hpe.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 16:19:23 +0100
X-Gm-Features: AQROBzDM94t1dRDg1HXz3MnrFynSOVSeJFZTzd-JR0yHAFKYOA0-zc43Q_VAvxs
Message-ID: <CAPDyKFqqjL7PhzvGsBLXTUrTmQuEiPZCPd+LYhE2uy9zyoSPEQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] mmc: sdhci-of-dwcmshc: Add HPE GSC eMMC support
To: nick.hawkins@hpe.com
Cc: adrian.hunter@intel.com, jszhang@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawn.lin@rock-chips.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Mar 2026 at 16:01, <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The HPE GSC is an ARM64 (Cortex-A53) BMC SoC used on HPE ProLiant
> servers.  Its eMMC controller is based on the DesignWare Cores MSHC IP
> (snps,dwcmshc) but requires a small set of platform-specific quirks
> that cannot be expressed through the existing generic dwcmshc code
> paths.
>
> This series adds support for the 'hpe,gsc-dwcmshc' compatible:
>
> Patch 1 extends the snps,dwcmshc-sdhci.yaml binding to document the
> new compatible and the mandatory 'hpe,gxp-sysreg' syscon phandle
> (with register offset argument) for MSHCCS register access.  The HPE
> GSC exposes only a single 'core' clock, so the clocks/clock-names
> properties are constrained to a single item for this compatible.
>
> Patch 2 adds the HPE-specific driver code in sdhci-of-dwcmshc.c:
>
>   * dwcmshc_hpe_set_clock(): SDHCI_CLOCK_CONTROL.freq_sel is wired to
>     a clock mux on the GSC SoC, not a divider.  When running at
>     200 MHz (HS200) freq_sel must be forced to 1 to select the correct
>     high-frequency source.
>
>   * dwcmshc_hpe_vendor_specific(): disables the command-conflict check
>     and programs ATCTRL using existing AT_CTRL_* macros for reliable
>     HS200 signal integrity on the GSC board topology.
>
>   * dwcmshc_hpe_set_emmc(): helper that unconditionally sets
>     DWCMSHC_CARD_IS_EMMC.  Called from both the reset and
>     UHS-signaling paths.
>
>   * dwcmshc_hpe_reset(): calls dwcmshc_reset(), re-applies vendor
>     config, and calls dwcmshc_hpe_set_emmc().  The controller clears
>     this bit on every reset; leaving it clear causes card-detect
>     misidentification on the eMMC-only slot.
>
>   * dwcmshc_hpe_set_uhs_signaling(): wraps dwcmshc_set_uhs_signaling()
>     and calls dwcmshc_hpe_set_emmc() for all timing modes.
>
>   * dwcmshc_hpe_gsc_init(): obtains the SoC register block and MSHCCS
>     offset via the 'hpe,gxp-sysreg' syscon phandle argument and sets
>     SCGSyncDis (BIT(18)) in MSHCCS to allow the HS200 RX delay lines
>     to settle while the card clock is stopped.  Enables SDHCI v4 mode.
>
>   * sdhci_dwcmshc_hpe_gsc_pdata sets SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN
>     (base clock not in capabilities) and SDHCI_QUIRK2_PRESET_VALUE_BROKEN
>     (preset-value registers not populated in GSC ROM).
>
> All new symbols are exclusively selected by the 'hpe,gsc-dwcmshc' OF
> match entry.  No existing platform (Rockchip, T-Head, sg2042, Sophgo,
> etc.) has any code path change.
>
> Note: the DTS node for 'hpe,gsc-dwcmshc' will be submitted separately
> as part of the HPE GSC base platform series (arch/arm64/boot/dts/hpe/).
>
> Changes since v3:
>   - dt-binding: Changed 'hpe,gxp-sysreg' from a bare phandle to a
>     phandle-array with register offset argument, as suggested by
>     Krzysztof Kozlowski.
>   - dt-binding: Added else clause to disallow 'hpe,gxp-sysreg' for
>     non-HPE compatibles, as suggested by Krzysztof Kozlowski.
>   - dt-binding: Dropped the third example node; two are sufficient,
>     as noted by Krzysztof Kozlowski.
>   - Driver: Fixed multi-line comment to use the standard block comment
>     style used in this file (opening '/*' on its own line), as noted
>     by Adrian Hunter.
>   - Driver: Added DWCMSHC_HOST_CTRL3_CMD_CONFLICT define for the
>     previously bare BIT(0), as suggested by Adrian Hunter.
>   - Driver: Extracted the CARD_IS_EMMC read-modify-write into a
>     dwcmshc_hpe_set_emmc() helper, called from both
>     dwcmshc_hpe_reset() and dwcmshc_hpe_set_uhs_signaling(), as
>     suggested by Adrian Hunter.
>   - Driver: Fixed regmap_update_bits() argument alignment, as noted
>     by Adrian Hunter.
>   - Driver: Moved HPE_GSC_MSHCCS_SCGSYNCDIS macro to the top-level
>     defines section, as suggested by Shawn Lin.
>   - Driver: Switched from syscon_regmap_lookup_by_phandle() with
>     hardcoded offset to syscon_regmap_lookup_by_phandle_args() to
>     read the MSHCCS offset from the DT phandle argument.
>
> Changes since v2:
>   - Replaced raw ATCTRL magic value 0x021f0005 with existing AT_CTRL_*
>     macros and FIELD_PREP(), as suggested by Shawn Lin.
>   - Refactored dwcmshc_hpe_set_uhs_signaling() to wrap
>     dwcmshc_set_uhs_signaling() instead of duplicating the body,
>     as suggested by Shawn Lin.
>   - Dropped redundant 'maxItems: 1' from clocks and clock-names in the
>     dt-binding conditional block; the items list already implies the
>     count (reported by dt-review-ci / dtschema).
>
> Changes since v1:
>   - Replaced the second reg entry for MSHCCS with an 'hpe,gxp-sysreg'
>     syscon phandle + regmap access, as suggested by Conor Dooley.
>   - Driver now uses syscon_regmap_lookup_by_phandle() and
>     regmap_update_bits() instead of devm_platform_ioremap_resource().
>
> Nick Hawkins (2):
>   dt-bindings: mmc: snps,dwcmshc-sdhci: add HPE GSC dwcmshc compatible
>   mmc: sdhci-of-dwcmshc: Add HPE GSC eMMC support
>
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  32 ++++
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 147 ++++++++++++++++++
>  2 files changed, 179 insertions(+)
>
> --
> 2.34.1
>

The series applied for next, thanks!

Note that, I amended patch2 according to Adrian's comment.

Kind regards
Uffe
