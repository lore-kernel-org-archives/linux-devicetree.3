Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B783D813D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542288; cv=none; b=WPod3A62QuoTdbrP4VLZXWRCa5AoTc9ekM+yjs0ZlTznmnVMiKrzEaMBQrcBYbAhGdpSqH1KdH3chiMyuYeNlN/NZq2dw28TWdjcVmFlYYhe8IK98lSORLQvDDxBCU0/RuT9ejCuEHkwF4esJV3WKCY2GJ8H51HaAOv4f5aljlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542288; c=relaxed/simple;
	bh=18Ghkmy+BOJC2fUbdsN2jseCYa9TUukxXuqe6XZwfiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hDPnC49GxY39gJWVVR4KQREyt8BKpwuZaW1T43t8EdFE1NNhNXL2aV+ETgstJmoBsR0nILTSMMuLdCdqm3U6b4cKHDgR5Xiqzjo8kZuXBSs+NTz1U4xgBMU7DZCiyaAaDDXRcT7bQThdIMow7CSGJZ+kK+4gUp4HjzFEXWnpKp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+W84w/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+W84w/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AA21F000E9;
	Mon, 20 Jul 2026 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542279;
	bh=3eGIYXU0tVJWbs0DPB3AUXGEoMoYSbqoy/sDzaPWelQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q+W84w/8RST43dLGAWhmeL4lc9iC2zrKOTprK8J69CKUsEQAGZsjxxJ8FJe2XBwda
	 vroViKxrOB618npnNFLqmsR+N7ytaQRdokXCUn1HJPaa8uXw5/P2U6aW2M/aZfdYWO
	 d+P287kfjVkaH+4BHZD/6k3fbYWJnL3oo9/f+PLgKXP4UWMtIWQYjnorjqlrT1SgeO
	 6GuXg9gOufgu2eO0VF+OWouJicZpaspOaLa/2/ur8l6pXBtTVbbCdkeu5oCe0YsP5a
	 se7G+/bZkF+P8shHLy60D5DXGrlOn1GK8WjqmqVP4wg3GB8YG6qdAx52MH57+e26oF
	 HzihaJEGAkkSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: rk3399-rock-4c-plus: Use device tree
 bindings constants for SYR828 regulator initial mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720100336.62004-3-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
 <20260720100336.62004-3-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:11:18 +0000
Message-Id: <20260720101119.65AA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The fan53555 regulator driver lacks an `of_map_mode` callback, cau=
sing the `regulator-initial-mode` device tree property to be ignored.
--

--- Patch [2]: [PATCH v2 2/4] arm64: dts: rk3399-rock-4c-plus: Use device t=
ree bindings constants for SYR828 regulator initial mode ---
commit bd8e5b9ed62ff2e741725d000597a403df903434
Author: Victor Krawiec <victor.krawiec@arturia.com>

arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants for SYR=
828 regulator initial mode

This patch updates the device tree to prefer using a bindings constant
over a hardcoded value for the regulator initial mode.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/=
arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
> @@ -448,7 +449,7 @@ vdd_gpu: regulator@41 {
>  		regulator-always-on;
>  		regulator-boot-on;
>  		vin-supply =3D <&vcc5v0_sys>;
> -		regulator-initial-mode =3D <1>; /* 1:force PWM 2:auto */
> +		regulator-initial-mode =3D <FAN53555_REGULATOR_MODE_FORCE_PWM>;

[Severity: High]
This is a pre-existing issue, but does the underlying fan53555 regulator
driver actually support mapping this property?

Looking at the driver initialization in fan53555_regulator_register(), the
regulator_desc lacks an of_map_mode callback:

drivers/regulator/fan53555.c:fan53555_regulator_register() {
    ...
	rdesc->ops =3D &fan53555_regulator_ops;
	rdesc->type =3D REGULATOR_VOLTAGE;
    ...
}

When the regulator core parses this device tree property, it requires that
callback to translate the value:

drivers/regulator/of_regulator.c:of_get_regulation_constraints() {
    ...
		if (desc && desc->of_map_mode) {
			mode =3D desc->of_map_mode(pval);
			if (mode =3D=3D REGULATOR_MODE_INVALID)
				pr_err("%pOFn: invalid mode %u\n", np, pval);
			else
				constraints->initial_mode =3D mode;
		} else {
			pr_warn("%pOFn: mapping for mode %d not defined\n",
				np, pval);
		}
    ...
}

Without the callback, constraints->initial_mode is never populated, a warni=
ng
is printed, and the hardware defaults to its reset mode (Auto-PFM) instead =
of
the requested Forced PWM mode. Could failing to apply the Forced PWM mode l=
ead
to hardware instability or crashes under light load conditions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720100336.6200=
4-1-victor.krawiec@arturia.com?part=3D2
