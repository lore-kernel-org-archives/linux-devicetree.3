Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0438F65B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988556; cv=none; b=MOkeOwtTI4ukiEhokktZiOKNKV34FXjlrmkvIJGSWvwFMK4cwcs1ra2imxJkB8O4iVHRzUiOyvgEkrVV5t8vl35N/8bd1ncCUuiiB88wlTbQqXx+ntl2Cgl0/VdVM1bXXk6YHaqaIy2W2UrnnkvSyZ6aDkSeTC7gkRvCL2ODS2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988556; c=relaxed/simple;
	bh=ExAya0N1MUhKoTzDL9IeLLik2BT8QpYoK1MwF8KUj10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZKAmW+Gy+ZWfHN4dNy0KB4M7W1gGyIH4eF78l+rjAyWpx5t2lgj6VlBX2DfJPh7/y8/wOJIMavizXLafHzU1NqxFRcFEyDGwdGU2XKpDRSZdkB6T6cBjTBx5TvC/3Eb0tVTjrprSfzg1ntj1Ki/taGHxWkuExBA1Vns8Dor8Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oo0JY87/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oo0JY87/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59601F000E9;
	Thu,  2 Jul 2026 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782988553;
	bh=ExAya0N1MUhKoTzDL9IeLLik2BT8QpYoK1MwF8KUj10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oo0JY87/bz0l98QDLyrTZBOPogDo01vZ2i5/8JtnSwrJ5KgtcDfBpk/ebsFyEi3sP
	 IewSn6Ha1hSdahjO5ZP8WA1f4By13ukdQLOb5UtnC6sYAzCHAfUYCvHjLhAqICLXcc
	 Vt9q9nxvoH+BNafmbLs29qGwq0UkIWHKM6DeX6k3X/+a/wB5pXTmsqYtB7wXz6RQLs
	 sj/K48s8UiZC21/xku660huT5cf8e8q+UPrPHUApFB2E6XXQ03kCbmG2078u9d6wwk
	 euCHCTB0Wp+BHTrnWeJcLiB7Mt26sXroM/LBG19xRYL6CbLTgndYEPltrAyg5eM2Pz
	 ct0NRGB4n/cLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] thermal/drivers: airoha: Generalize probe
 function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702094846.17325-5-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
 <20260702094846.17325-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:35:52 +0000
Message-Id: <20260702103552.E59601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check for the result of `device_get_match_data()` lea=
ds to a NULL pointer dereference.

Pre-existing issues:
- [High] Interrupt handler silently drops thermal events if both High and L=
ow threshold interrupts fire simultaneously.
- [High] Incorrect devres initialization order for IRQ causes race conditio=
ns (early NULL pointer dereference) and Use-After-Free.
- [High] Missing return value check for `of_address_to_resource()` allows u=
sage of an uninitialized resource address.
--

(Note: The standard inline diff quoting format has been altered to a free-f=
orm
summary due to automated recitation restrictions. The original patch code is
not quoted below.)

Commit: a66125bc561d9323e2561d461f2be68491469827
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: thermal/drivers: airoha: Generalize probe function

This commit generalizes the probe function in preparation for supporting
the Airoha AN7583 SoC. It introduces a match_data struct to define specific
probe and post_probe functions, thermal ops, and pllrg protect values.

[Severity: High]
Could device_get_match_data() return NULL in airoha_thermal_probe()?=20
If the driver is bound manually via sysfs by matching the driver name
without an underlying Device Tree node, the match data would be NULL.
Dereferencing soc_data->pllrg_protect immediately after without validation
would cause a NULL pointer dereference. Is there a need to check if
soc_data is valid before accessing it?

[Severity: High]
This is a pre-existing issue, but I noticed a potential flaw in how the
interrupt status is handled in en7581_thermal_irq(). If the temperature
fluctuates rapidly and both EN7581_HOFSINTSTS0 and EN7581_LOFSINTSTS0
are set simultaneously in the status register before the IRQ is serviced,
the bitwise AND yields the combination of both bits.

The switch statement fails to match this combined value and falls through to
the default case, dropping the event entirely. Would it be safer to process
these bits individually rather than using a switch statement?

[Severity: High]
This isn't a bug introduced by this patch, but does the devres initializati=
on
order leave a window for a race condition? devm_request_threaded_irq() is
called in en7581_thermal_probe() before priv->tz is initialized via
devm_thermal_of_zone_register() in airoha_thermal_probe().

If an interrupt is already pending from the bootloader, it can fire
immediately, passing a NULL priv->tz to thermal_zone_device_update().
Furthermore, on driver unbind, devres frees the thermal zone before disabli=
ng
the IRQ, potentially leading to a use-after-free if an interrupt fires.
Could moving the IRQ request after the thermal zone registration resolve th=
is?

[Severity: High]
This is a pre-existing issue, but what happens if of_address_to_resource()
fails in en7581_thermal_probe()? The return value is currently ignored.

If it fails, for example due to a malformed device tree,
priv->scu_adc_res.start would remain 0. Later, en7581_thermal_setup_monitor=
()
unconditionally uses this value to configure EN7581_TEMPADCVALIDADDR,
instructing the ADC controller to read from an invalid physical address
instead of the SCU block. Should the return value of
of_address_to_resource() be validated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702094846.1732=
5-1-ansuelsmth@gmail.com?part=3D4
