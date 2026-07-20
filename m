Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597FD39902B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543866; cv=none; b=f1nomI2KLJaTTunFdrV/XzoV4EiRQGSE586CB8Di9jL4VqZAzU1Fxgnlu2U0Ay2bbrMKZ10ZyLKyb6CP/0SK05PXso6plpIq8Cl9ZPhbSCSNQW0VpW9COtGvnO9WhhwMNVtdaNA0ZaQ0kBqM4ImXOOqKeaYmCrLaArSyd5Lq/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543866; c=relaxed/simple;
	bh=5zXzbrMwUejUbMzW5JpHO5ucJIzu4vBKsITMaMIt9rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLhXakD1eBatMB5zYg4boc/UAz0SzelosetdeAuCiGhpIu5CAyi/c0eoHG+A1XayVSOUduuhBqCKFHZUWebnnrNZZzFjv5qFjzzGjbIK0NhrAJdhXGIoS/CLUP5tgw6t9Q+fOBweNKxfx/PTVd/WQK7XZ03K3vHmsm+BZgQCGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMWwmDeB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMWwmDeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DE21F000E9;
	Mon, 20 Jul 2026 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543864;
	bh=5zXzbrMwUejUbMzW5JpHO5ucJIzu4vBKsITMaMIt9rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMWwmDeBapJDjjr0gD89d322Z5Hg/A/xku0FPNHeflWr9wFlugzUHET7wa2RYRcAV
	 tNO+9TgsFBy4Zh2xYJIDOBPrLQKQZVwvgjrJa3j7B57d0RBuKgi1IPB/rilh6zGLmQ
	 LQi08aUbU/SaeVAhR6RH+F4P6ZAHW7LjoNJXBnqafHunobHMD2j55ZEFB4KkcmGrbB
	 DxMolyKKcc53E3aZsmxhm2b/HQy78y1HX+08J+pQzvUWCMIhySGUFTwJIu4BiDMjRB
	 lMtao9JCEbeMvcrkoy248a1SvT67b09WY0o1wt2HL33nluVza1sPuspPMiB7b2otQg
	 hVzQIJYYxdAQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260720102222.251179-4-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
 <20260720102222.251179-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:37:43 +0000
Message-Id: <20260720103744.71DE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver fails to clear the MISCFCR0_UHOVRCURH hardware bit when=
 the `nuvoton,oc-active-high` device tree property is absent, inheriting po=
tentially incorrect bootloader state.
- [Medium] The driver ignores the return value of regmap_read(), potentiall=
y evaluating uninitialized stack memory if the read fails.
--

--- Patch [3]: [PATCH v4 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual=
-port with OTG support ---
Note: The format of this review is altered due to strict recitation restric=
tions. Instead of inline patch quoting, a free-form summary of the findings=
 is provided below.

Commit: 678e65678c8fb5e2363eb1d51e7a9a2159ca8dd9
Author: Joey Lu <a0987203069@gmail.com>
Subject: phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

This commit extends the driver to manage both USB ports and updates the init
polling logic to handle host-mode and device-mode clock stability. It also
registers a read-only USB role switch and adds support for the rcalcode and
oc-active-high device tree properties.

[Severity: Medium]
In ma35_usb_phy_init() and ma35_role_sw_get(), the return value of
regmap_read() is not checked before evaluating the 'val' stack variable. If
the register read fails, might the driver evaluate uninitialized memory,
causing it to return an unpredictable USB role or falsely bypass the PHY
initialization?

[Severity: High]
In ma35_usb_phy_probe(), the driver sets the MISCFCR0_UHOVRCURH bit if the
"nuvoton,oc-active-high" property is present, but lacks an else path to cle=
ar
it if the property is absent. Does this allow the hardware to incorrectly
inherit an inverted over-current polarity from the bootloader or a prior
kernel instance?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720102222.2511=
79-1-a0987203069@gmail.com?part=3D3
