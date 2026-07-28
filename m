Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41763B992C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785277313; cv=none; b=YUKs5RpPk44I9NuvxcWWCF/XtovHdxP9wS0uHS4djolgM72GvoNSMzDq0S0xlRN1c3pLUjWlJs/dR7Ibn/IVKyia/nkAHJJMPBunccKLtdBmEIMyytKNVJhmKBNH+3T8+wG2uL6OrSoDLnhLNI/XwOrxX9foSZfHs2wVCzJ2ZWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785277313; c=relaxed/simple;
	bh=ovsL/FcZTaRA7kE4cOav/t0xoU68EwIIXP676cOSvHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=We9e/3BZ/VTY/gUpes+VVJq/OASHgfvBmiPjBC4Tz9/uV8fVsB7EeuK5cN7AkdLupJbBnjzSaEzuX75Rqgjq4dz9V98FIrNjR/F38a7en0vZpNDe0rDRIULkTwCuyaJpmCEQK1lUCBnedtdosJ3xuu+MV4CGJ4x2ioegeMPQsgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE711F000E9;
	Tue, 28 Jul 2026 22:21:52 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 85777181F68; Wed, 29 Jul 2026 00:15:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-rockchip@lists.infradead.org, 
 Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, xsf@rock-chips.com, sre@kernel.org, 
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20260728203832.166402-1-macroalpha82@gmail.com>
References: <20260728203832.166402-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V10 0/4] Add Anbernic RG Vita-Pro
Message-Id: <178527692151.79336.909222279024554544.b4-ty@b4>
Date: Wed, 29 Jul 2026 00:15:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 28 Jul 2026 15:38:28 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 SoC.
> 
> Changes Since V1:
>  - Updated documentation filename to matche compatible string.
>  - Corrected order of allocating IRQ in charger driver and switched
>    to using devm managed function to allocate work queue.
> Changes Since V2:
>  - Corrected issue with naming of panel binding document and added
>    fallback compatible string.
>  - Switched to devm helpers in panel driver. Note that
>    devm_drm_panel_add() is currently only in the drm-next branch.
>  - Optimized setting GPIOs for panel driver.
> Changes Since V3:
>  - Fixed numerous issues identifed by Sashiko bot, mainly relating
>    to unclamped or improperly clamped values from within the
>    charger driver.
>  - Corrected hard-coded values in the panel driver unprepare routine
>    as well as correcting an improperly checked return condition.
> Changes Since V4:
>  - Fixed errors identified by Sashiko bot on charger driver that could
>    result in an improper value being written to the registers.
>  - Corrected some error handling in the panel driver.
> Changes Since V5:
>  - Corrected minor errors in documentation and added default values.
>  - Further corrected clamping behavior in charger driver.
> Changes Since V6:
>  - Additional corrections as suggested by Sashiko bot to fix potential
>    edge cases during probe for sgm41542.
>  - Corrected an improperly shifted value being written to register for
>    sgm41542.
>  - Changed a MV value to UV in sgm41542 driver to simplify function.
> Changes Since V7:
>  - Added PM functions to sgm41542 driver per request from Sashiko,
>    which stops the hardware watchdog during suspend.
>  - Switched from device_init_wakeup() to devm_device_init_wakeup().
>  - Confirmed a state change in IRQ handler for sgm41542 to ensure we
>    don't update input current limit except when the vbus goes from
>    not okay to okay.
>  - Removed panel patches, which have already been accepted upstream.
>    Please note that this *may* cause an error about missing bindings.
>    See commit 0fd6ead8270270d859a28d0196a4b47e7d6845b8 in linux-next.
> Changes Since V8:
>  - Added linux/bitfield.h header to prevent compile errors on certain
>    platforms.
>  - Added regulator to Kconfig as a dependency.
>  - Added mutex to IRQ handling function.
>  - Added update to watchdog enable field in suspend routine to ensure
>    watchdog status "goes back to the way it was" after resume.
>  - Sashiko complains of an issue if userspace updates values after
>    devm_power_supply_register() is called but before the hardware
>    limits are set from the device tree. While this is possible the
>    threat of a problem should be very low given that the hardware
>    limits are set immediately afterward and would overwrite any
>    wrong values from userspace (should happen within a few
>    milliseconds). Unfortunately, given that the function to get these
>    limits requires the power supply be registered in order to read
>    the battery node, it's not something that can be easily fixed at
>    this time. Since it's an *extremely* unlikely edge case, I think
>    that's acceptable.
> Changes Since V9:
>  - Made a few minor tweaks as suggested by sashiko.dev.
>  - Adopted new init function for __power_supply_register() so that I
>    can have the proper min and max values from the firmware prior to
>    exposing the charger to userspace. New init function is part of
>    this series here: https://lore.kernel.org/all/20260720011144.1280219-2-vincent.cloutier@icloud.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: power: supply: sgm41542: document sgm41542
      commit: 15c53209e67ad450fb791aff5e0bd3dcc4349e36
[2/4] power: supply: sgm41542: Add SG Micro sgm41542 charger
      commit: 5584ad5706e594c7648655171785aa4fffdd3db5

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

