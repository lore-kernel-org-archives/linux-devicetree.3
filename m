Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA836655C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035296; cv=none; b=K8LumR57gPfn5N7k+tH5VDyHNNIipxeE1pvvZZy8bbG1fBzxVNxZM5jOtD3qEzFRiIgEgDndalHJi4g99dyLAtFnev9LElp3Sr59lA/2MGe5ZZL59sxbi3ClXbt2GEGP0YVr0oXv5DVS4ws6/fdFyudZRqJVdQRCVFao7DjuhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035296; c=relaxed/simple;
	bh=TrhAhYX3g/EwDd9n6VGbQK8QfK5R9C3wniokQZ/e6yQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RDB+F/TxZK8D9TKtXr9ONzPotvi+fs63qNrycqV6QpGfaV6yrikOqrxAQ/kwOb3N/o4nNCp1Y5d1VgZle/821LNQnH3mVvTMOITPgjGYJQZhimGfLcIhsPx3ce1gOwM5xZCFwE+ObMg99S1kV18IhrNZzqBbVnBw2P0VtLGrWCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQ1Gl5jE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQ1Gl5jE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59C71F000E9;
	Thu,  6 Aug 2026 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035295;
	bh=qcPuB3+U+8AWfKthkJMV3tynaqUfeFkqymO6xGvL/6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQ1Gl5jEhvQWWxgwg2LPUGARZFHrGnpEkcjxcQWcyNL5tj9XQPaCOgbr/TbV6qvpG
	 rBtaMyh4C7wf+nrXwk/2F4jXZ+BYgxS5PnfayXnQov9h5AZcALeWhzxiZl5qdwiyJZ
	 j3s2SgprdSD/9qX/cuDp+tO6wp4MC+qm2Z6EFFfsWojfZlyN4Gmu0ehmSFkVOLY+JA
	 Q6BBl/wsyv7D8v+8ocs9kA2HFgiRwmiIsxDH279GAMnPXsxJN+j5muDs5NCh+lv4WS
	 /70b9AZEYjMpotpK1bWxLOaroaiTftWH9s+Qd5VIdXc4LafPxyZ+T9eqrf0fqI54Kz
	 3dsVEFkTShZ2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Tiwari" <anand.tiwari@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-edp_overlay_for-next-v1-2-c3aebbc81f38@oss.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-2-c3aebbc81f38@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 16:54:53 +0000
Message-Id: <20260806165454.D59C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `/delete-property/ #sound-dai-cells;` directive moved into t=
he `.dtso` overlay is a silent no-op, falsely exposing an audio DAI.
- [Low] The `pmk8550_pwm` node is left enabled in the base DTS after its on=
ly consumer was moved to the overlay.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display=
 overlay ---
commit 28cbb74b5accd1eed8eb8f23fae1e5b1e310ff55
Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay
   =20
Move the eDP panel configuration and related power, backlight, and pinctrl
nodes into a separate overlay. Keep the base DTB suitable for headless
variants and provide a composite DTB for headed variants.

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64=
/boot/dts/qcom/purwa-iot-evk-edp.dtso
> new file mode 100644
> index 0000000000000..759d05342627f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso

[ ... ]

> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;

[Severity: Medium]
Is this property deletion effective in an overlay?

The Device Tree Overlay standard and fdtoverlay mechanism do not natively
support property deletions at merge-time. When compiled with dtc, the
/delete-property/ directive is discarded because it has no target within the
local fragment scope.

Will this result in the mdss_dp3 node continuing to inherit the
#sound-dai-cells =3D <0> property from hamoa.dtsi, falsely exposing an audio
DAI to the audio framework when probed?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3d..6dde925025dd8 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts

[ ... ]

> @@ -1169,13 +1076,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>  	};
>  };
> =20
> -&pmk8550_gpios {
> -	edp_bl_pwm: edp-bl-pwm-state {
> -		pins =3D "gpio5";
> -		function =3D "func3";
> -	};
> -};
> -
>  &pmk8550_pwm {
>  	status =3D "okay";
>  };

[Severity: Low]
Should the pmk8550_pwm node's status be removed or set to "disabled" in the
base device tree now that its consumer is moved?

Since the only consumer of this PWM (the eDP backlight) was moved to the
overlay, leaving it with status =3D "okay" here unnecessarily probes the
controller on headless variants of the EVK.=20

The overlay also redundantly re-enables it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-edp_overla=
y_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com?part=3D2
