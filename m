Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF638DC6C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340754; cv=none; b=GCEU7eG2O/fxIGm7NQelT/aJ/wA+2Fp8ww5FYMUeqcD4GWElQI9MkSvgdWBXpil5jLbHA3FrlOaIVyhMy0c1n1GakxzkV57RLhw5p9+yZGnQIkRjT4z+FhfsrC7tyVJ+b9tyrHCeRITyEukoY7/MSLqLaRbZ0UpSQb9rn3gQHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340754; c=relaxed/simple;
	bh=zPAy3PZzjiQN8NEkSWuTeaLM3XmVdwxykF3sypYxrl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1baHA5KgcsN1i6Ji3Lh+/nT03IZ93E5kTcqDx3pn0XN3+e/CYEUwizcIcLDSUMTmApzioQnaxE1tqUvhAoDExGK19C8HzMoYLzCYLpyY7NooVVh7/wDCHoZNS5qWl9GJZM5dTBiNWWoCqs71bQBFmnFo/3jBxyqXa1BMChkokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=w+lyqyzK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="w+lyqyzK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=s49YJnP9lIyfeh8+sVIwMzyzQ8yPHBn53FpQ4mjBhdA=; b=w+lyqyzKY2Uf8zR4igTWQUaUZX
	fr2F9mZszOA9w8aqSXA7osl5sI/JJno5QwkZw7Ea7deqH3+2BbaR6gV01D8XDT1R6T8Z8D3SNe62+
	whLHlSrfh7K5kyuOFI4RMd3IuCOEnp38NugRhzwzs6zGQgREIF4c8fsJPvik0JeV92jNHJX9jch8+
	hQLHAbzreXHD34Y3Uj8Sdf4fhfcEKqbH6qRHK+g8qnH43n6iUKn7S2PpeQbSkSeKkruFRhYXt8dKQ
	GeYvTv9BeAsdMoDgMfY75JKrkdCnc4YtBcoQHZRvYIEsmfe3UYD3nGhbkDDTy05yGBdMfavjq/h8X
	Eme5uyoQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: (subset) [PATCH V10 0/4] Add Anbernic RG Vita-Pro
Date: Wed, 29 Jul 2026 17:59:04 +0200
Message-ID: <178534073338.533990.3074787273203851372.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728203832.166402-1-macroalpha82@gmail.com>
References: <20260728203832.166402-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Jul 2026 15:38:28 -0500, Chris Morgan wrote:
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

[3/4] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
      commit: 74aab5a3042e56681eb8170bad84789fb42eae60
[4/4] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
      commit: aaed846aa94076aa670c60089a7143a0f43327b4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
