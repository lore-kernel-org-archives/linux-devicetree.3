Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDDB32A3DE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882589; cv=none; b=cnxfbKa3fqte/LSHnQaiZC/IxdFdsCeFNbrelOmMPhNIw2DNxwONt2NmsKjnZIB87/Q1mlJr3UkEjgzFbpRyeILY7OVjvqxBnhAfFKcEq3g/TTmo5z6XFVfJjzsHG8f41U+BQHe0Xt14MiMA2pOv7AVxL8XRnSQqAgGKRsaymOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882589; c=relaxed/simple;
	bh=srhtjV8OPQAa52pA6qgonit5rjCWp8J+Uu2JBmWEGk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tE6XNzaSW6JI1Rw3RXMHrdv5xKtA/FjTvUQBOp7dEd7O3Kf7HatZZVr77yynT4pXC+SStyI3Kkvn/vH3a2QRELjysyQQz4nl9PrMGZXglNrFH4pJzWwvidQ/G7aBCFOuw3h5V2OrTatd/XNTdjGUWSoUTC7HZKe2dFzvrbctaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nljEApm+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nljEApm+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a655cfab5so4288191b3a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774882586; x=1775487386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=;
        b=nljEApm+ujlyRcHjOxUKB1g7AZI0bxl+Ou85vKKeZ8XH+/njpsSgvxOZ5XSRuVetEh
         TWpGJzBp5ShdHD3AuPQ/6qsqaBzHCj6k3fnAoUixLthyvnIyRgOAjGR2bilJLU1wdeh1
         MXzhcBEUteQLRqk2zcj/Q6SGBcEBEz5RcTJ5d6GhxUOqIAY55RKAERjnFRa8S5r0XkG8
         DoyQHM5dcPAfN+7T0ThWfgJ9MSQmasAs8POIwz4muFiSv42K9RKW6i3lOHaGkEHMJ4FB
         FNYuZK4dYh6MOr2P4R3piDM37EIIfWuZs6Ni13a7iTxghJJQ9PxgcqPzUuOkoP9AymjQ
         jiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882586; x=1775487386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=;
        b=sNrqWboWExWKprLyTzS7IHZgfXSghZkiSwNjnjYGKsF6ci6Rlq2lb/3NXigv1Y56Rf
         kzUE5DaVtq4ImdPl5jowbOTsg8wA3ttoaFnGB98JCXqN8syZYFqeALc6iBmJh3ju5Xla
         gP5wSzvNb5YMFOko+5I9rliYMRk8r3SGV3fOrLENtuJIAE6CgAQ5agD8RpolAXvyANiM
         vhwO2eYr2XaoRVCmnlLp+yt3fpZ8fCG4U58HM/krKYtuSf6nON92ElYlMGuXGokjl/ka
         V2cGPJONdrp4BLedR3ZYltYCkNaJe/nEGq4Z6n0GWdgKklTkwoFMH5pH3psS3FWWHNZM
         X2og==
X-Forwarded-Encrypted: i=1; AJvYcCX+mTh5fj5LckYiOvhSn4eU+RcsSFhOpC0PZRrENVFiooN/qGISLmcIerdoYRfs8fPYQR0SH9+XN+SP@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPQWaQWpWd3iODfazJvx8zoJ1d1qjHiWQ2DmaeXxAt2DVlAvi
	2y3lV8BJkiBGSQaBmBHPi3D/QLMPrRskgR3km8iCugSIGSYQtbFKpWeRqQdjCMsLJTQ=
X-Gm-Gg: ATEYQzxEw89INMGVWoW58CJ1VRBKhjVEtCAcIIkHMShvF9b/tQDGfN++CK84J9iTM29
	wj1EdC+8CB0Cf8frNFWP2FVtL+xl5YduQR4gS4Gz5QpsFbG0BhsoO0JeewcdXqTCaWJ/SamgULG
	4XoVcUjI6yeEMwJ9Nq/AR5iT1Paw7wAERLiQIG0OZ+Uz62JW8bjeAm5PHey79b/1AVLfJbA/7Av
	nDN8SLuzNiicYzsIJm/ok37+FuQRv+kSWcsnMLONkltv9/0rdGcS/3HcRSjcBS9d4H0J0YL6fIK
	3kZfvV1ygNBkgVTXlO177U3CA7l8qy+CnSM7Kcfb9/6tF99XKPPbJWCvw0hovG7Bw9sR7mTyfjy
	IIdvPnoZyk3XgslDAaxp0FJ6rFWo3mPucqwTJvIQDxd951iS+kbpdgR/jGQJ3FyUfuXvDu3gsPT
	qOKUdgi2rPH9L1qsLlDVWlgvmnEok=
X-Received: by 2002:a05:6a00:ad03:b0:829:a590:6d0f with SMTP id d2e1a72fcca58-82c96087f4amr11583763b3a.58.1774882586297;
        Mon, 30 Mar 2026 07:56:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:51d0:8872:b109:d470])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8498779sm7540458b3a.25.2026.03.30.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:56:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 08:56:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Message-ID: <acqPFV005fH8qHpV@p14s>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>

On Wed, Mar 18, 2026 at 04:13:06PM +0100, Markus Schneider-Pargmann (TI) wrote:
> Hi,
> 
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
> 
> IO+DDR is a deep sleep state in which a few pins are set to be sensitive
> for wakeup while the DDR is kept in self refresh. Everything else is
> powered off.
> 
> The changes in this series were suggested as part of the IO+DDR u-boot series:
>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
> 
> There are currently no real users of the memory-region that is split in
> this series. The size of the memory-region in total stays the same.
> The new layout is derived from the software running on the r5f
> processor:
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459
> 
> Additionally the two important devicetree nodes for resuming from IO+DDR
> have the bootph-pre-ram flag added as this data needs to be read before
> the RAM is in use.
> 
> Best
> Markus
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
> Changes in v3:
> - Squash the enforcement of the memory-region-names requirement in the
>   patch adding the memory-region-names, as suggested.
> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com
> 
> Changes in v2:
> - Make memory-region-names required if memory-region is present
> - Fixup memory-region and memory-region-names conditions. Require either
>   2 or 6 regions for memory-region and memory-region-names
> - Reword and restructure the binding documentation for memory-region and
>   memory-region-names
> - Add memory-region-names to all uses of memory-region
> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com
> 
> ---
> Markus Schneider-Pargmann (TI) (7):
>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names

I have picked-up the above two.  The .dtsi files need to go through the TI
tree.

Thanks,
Mathieu

>       arm64: dts: ti: k3: Use memory-region-names for r5f
>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
> 
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 55 ++++++++++++++++++----
>  .../arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi |  1 +
>  .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |  2 +
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++-
>  .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |  2 +
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++-
>  .../arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi |  4 ++
>  .../arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi |  2 +
>  .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi      |  4 ++
>  .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi      |  6 +++
>  .../boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     |  6 +++
>  .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  3 ++
>  .../k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi   |  8 ++++
>  13 files changed, 163 insertions(+), 14 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
> 
> Best regards,
> -- 
> Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 
