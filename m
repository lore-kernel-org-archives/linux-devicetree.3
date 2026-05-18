Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68F155757
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138947; cv=none; b=XcO6MvAXCIasS4XI7ZYCCoQHGoHGu0VHYulV+H6jKGgUIyzMg4//tz2LZbQr3tsM5Jr5/pJLcvEJn5LEcmE/cuR5L+zeIEvqeoRtJo4BzOR+RvIR8YyuIpaDGFFOerxb7opVgm7X0TmYiofE7MjBrDqdQPqynccTl4WVbFgTIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138947; c=relaxed/simple;
	bh=tpUvYQdxVgpSQFijdItNQqOKtJl51qzD+ihmeSIprpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OAeOfo1mIufUUovvhFBmmlOayW5MYJ3xL7ovPQnHVfT2hx0ZWfeY0E7BRvqkcfn7FgAw1K/TJtLV0Olf2/wBApH4VA5VH1bwjlBN4dFzNcfaGTY9i0NOmybdHJQxx9hKw+Rnqf6tW6DVbLkCTkXqFS7aRHfiQgxREb+ZrxE9mIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/GziSzM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/GziSzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52A3C2BCB7;
	Mon, 18 May 2026 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779138947;
	bh=tpUvYQdxVgpSQFijdItNQqOKtJl51qzD+ihmeSIprpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=J/GziSzMRJy4/IKBIpsMQHUtQp9H4t8xe974FsrKWbzKWDfXLLqjpyDmH/XPDgpvX
	 b38mLgnPbDfKWGWNJDoeVCTcanJJX1wTxcQPgEN+I1C87DMffL3nqMXK1gmsDqffAl
	 YcrzuZF80z5ww/dVJycb0ZJGEeUKf4y/k1Z0q2gkChgJDQyg9RmECPKk3/KUC7gt05
	 CiErex7RgmHBkBlw/ZBjYRu7kb9Tq4AwqzGlhD3jhr4J5s3wKLealV/7O3MOdyTmeU
	 PKYtKCMWzfkwAsAd/SIMw1lc0HqjQg3xRDRss5qwiVet57Vw8UaZ5/ZULBxMqnapyw
	 BS+5d0g4ZmEBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
References: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 21:15:45 +0000
Message-Id: <20260518211546.A52A3C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `spacemit,apbc` DT property triggers a spurious =
boot warning and relies on a fragile probe deferral dependency, because the=
 target `syscon_apbc` node lacks the `"syscon"` compatible string.
--

commit 89bb8c89cecf7c32a2e825a2b8f604c5c45762bd
Author: Yixun Lan <dlan@kernel.org>

dts: riscv: spacemit: k3: Fix I/O power settings
   =20
SpacemiT K3 SoC support dual-voltage I/O power domain, while initially
configure to 3.3v, and need to access register from APBC space to switch
to 1.8v domain.
   =20
Fix the GMAC0's I/O pins 1.8v switch failure that will result a broken
ethernet driver.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index 815debd16409b..2b0bf9cd755bd 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -803,6 +803,7 @@ pinctrl: pinctrl@d401e000 {
>  			clocks =3D <&syscon_apbc CLK_APBC_AIB>,
>  				 <&syscon_apbc CLK_APBC_AIB_BUS>;
>  			clock-names =3D "func", "bus";
> +			spacemit,apbc =3D <&syscon_apbc>;

Does this newly added spacemit,apbc property trigger a spurious boot warning
and rely on a fragile probe deferral dependency?

Looking at the referenced syscon_apbc node, it lacks the "syscon" compatible
string.

This prevents syscon_node_to_regmap() from instantiating the regmap
on-the-fly, causing it to return -EPROBE_DEFER if the pinctrl driver probes
before the clock driver registers the regmap.

The pinctrl driver catches this with a blanket IS_ERR() check and prints a
now-spurious "no syscon found" warning during boot while discarding the
regmap pointer:

drivers/pinctrl/spacemit/pinctrl-k1.c:spacemit_pinctrl_probe() {
	...
	pctrl->regmap_apbc =3D syscon_regmap_lookup_by_phandle(np, "spacemit,apbc"=
);
	if (IS_ERR(pctrl->regmap_apbc)) {
		dev_warn(dev, "no syscon found, disable power voltage switch functionalit=
y\n");
		pctrl->regmap_apbc =3D NULL;
	}
	...
}

The voltage switch functionality only ultimately succeeds because the
subsequent devm_clk_get_enabled() call against the same node also returns
-EPROBE_DEFER.

This gives the clock driver time to probe and register the regmap before the
pinctrl driver retries.

Would adding "syscon" to the syscon_apbc node's compatible string, or
explicitly handling -EPROBE_DEFER in the pinctrl driver, resolve this issue
and prevent the spurious warning?

>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-07-dts-pin=
ctrl-io-power-v1-1-abe19c14a726@kernel.org?part=3D1
