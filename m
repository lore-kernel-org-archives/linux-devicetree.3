Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAE4A6CD6
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002779; cv=none; b=fisGHG6wXRV7juVBtldNMt9EqhlaiyASqVstl1sq7LuVnayyruCFgO1VVyBnQCOYGPS+E0YkweRYNqCriN5yzxRajwa5QzXspEpvpIhuZLUf2k9tIqo7m7/Y6/oah7iq2wyZZzldEQa2U1M18FwvVxt/ZYM/Z5NN3NWKuTG0NJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002779; c=relaxed/simple;
	bh=GnYG4orl1ZES5E043dzIOax6kGKv7qd1hnuSqy+3yNQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PngmiBdkKIcV/SYGkpxB/QQYLCCO6eFSRneEyR2m00IfEPygW4LL3KjjyDoPDrR3vMDit656kX6U3J7aCNcx/BIyNnX+M8uixZ70/Fn+6HdjSvYv+P5dOZRO2E3xXpc/oKsThVP2FHGCA+PIFZ8Vgj2nt5KLswZ11xCCZZw+FhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+Nux+TO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+Nux+TO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5D61F000FF;
	Mon, 21 Sep 2026 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002778;
	bh=GnYG4orl1ZES5E043dzIOax6kGKv7qd1hnuSqy+3yNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+Nux+TOq5/jC4clI0k0ePbiiNK+pSGe2ZmlzxEeo/06iVDbHIlrZz70moiDYfD1A
	 4ZqR4lbh1Ev12SKiWgWBKycETGEkM3urtLoJyTmqn1L36Bd8ykX1Y4LrTvn4TYX8pY
	 uWVZVlxm/CZcl8jkMLoT7DEbmqDAtGfH/VnGtUQrzMgcPmk4ZEWxpNz7veto6TXjZW
	 G6/2EtPfc5sdn61Yo8vpkuyXyHPhZ9XfnYjBCjCyLDbUSA6puBD6Kfnqm4DhJmHimg
	 5ethcU7qK4kJ76xRexBiYyJwZJEQKZlacQdERQPDA6y0ML2orYQXnifkolqYqd8F9t
	 mxBeS+Ryv/FWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: ti: k3-j742s2-ti-ipc-firmware:
 Reserve memory for LPM metadata
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UmljaGFyZCBHZW5vdWQgKFRJKQ==?= <richard.genoud@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921145325.300025-8-richard.genoud@bootlin.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
 <20260921145325.300025-8-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:59:37 +0000
Message-Id: <20260921145937.DD5D61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: typo in SoC name in header comment
--

commit 4a69ff2c69c45956aad19749ee19fa4b33a413cf
Author: Richard Genoud (TI) <richard.genoud@bootlin.com>

arm64: dts: ti: k3-j742s2-ti-ipc-firmware: Reserve memory for LPM metadata

This commit declares a carveout memory region to store LPM metadata on the
J742S2 platform. The reserved memory is used to save and restore ATF, OPTEE,
and DM image context during suspend and resume cycles.

> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi b/arch=
/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi
> new file mode 100644
> index 0000000000000..d66bcd2f4e194
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * Device Tree Source for enabling IPC using TI SDK firmware on J42S2 So=
Cs

[Severity: Low]
There appears to be a typo in the SoC name in the header comment of
arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi. Should J42S2 be
corrected to J742S2?

> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.co=
m/
> + * Copyright (C) 2026 Bootlin
> + */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921145325.3000=
25-1-richard.genoud@bootlin.com?part=3D7
