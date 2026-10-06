Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10148382F08
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277661; cv=none; b=caECrepOF0QH6dPWg70EGp9nm6k6KKclw2dlg7TYPNQALwecNahPUm1RQB2Hp1NW27HClrSQ94f3NouR8TfOwKRXZU2+zYCW4EUBYtXPbLwhlGw2+6OPQRjPlKo/W4bhLL0s3uMRQ7f9YUcnExiUJ6kYZ3GSHRN5l/RM8tVlfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277661; c=relaxed/simple;
	bh=y/e+lO0obywv3RopIchCEdwOFh7XbUzMGYca4bJmIxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tFLhzvkbviHHH98MTOFV82ntfBiOcdsdqipbOjCNGmW8E/mpgLVUSujAK3mwW+iybCu8kAPN0GCNDAnCNZEm7J3QvkXKDl3xaDFxI8lyi0jYMbms9pFZ8IQRj832zebC4dwOjvz0553VXNDycfkvzq6eWRcTXGWRTeedsLfejdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT/v2Qsi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT/v2Qsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EFE1F000FF;
	Tue,  6 Oct 2026 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791277659;
	bh=Lm2jbG+MGyRJ8dvjYiIYuP/Z5j4S2+gu3NEgtoeMuRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TT/v2QsiCcv/WEV0MSoZYNoEHVrgeUVeEaGukUMn4bSoebwPUCht9dak96tyDrEb9
	 WEyht2tnO0nN9msj6yNoLKpypAjo9CtmkqctclFyv7uQWPFsdFYuCtzKxItrspGYLJ
	 Awv7CLhFzNJwrkjyz1Sm7xo35MAIYJ4k/+Ly2zbqhgXj9nbCRizFz/ZPC46XrSH2Dq
	 iSyLvU/tOhrDnIPT0lxAzPgkHDprMMWahJJFtQ7XKxsNWOKsi+JbN66rwN4Wb1k0wo
	 A9xr0G16qE8fYWATHrGSs26ZdOlQrmLsUvQAbclcT34LGAwTGn4q+u0P+4vTXRWXi5
	 vPOq/XEGLrKLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaipeng Zeng" <kaipeng94@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261006085425.40450-3-kaipeng94@gmail.com>
References: <20261006085425.40450-1-kaipeng94@gmail.com>
 <20261006085425.40450-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 09:07:38 +0000
Message-Id: <20261006090739.71EFE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: incorrect audio routing for Right Woofer to WSA_SPK2 =
OUT
--

commit 3b512df8c5cf84f3c49842cc54b1c1d65850a946
Author: Kaipeng Zeng <kaipeng94@gmail.com>

arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
This device tree implementation references nodes from the x1-crd.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch/a=
rm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> new file mode 100644
> index 0000000000000..dafe7f08fa958
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E78100-ACER-Swift-Go-SFA14-11";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",

[Severity: Medium]
Does this code incorrectly map both the Right Woofer and Right Tweeter to t=
he
same macro output (WSA2 WSA_SPK2 OUT)?

Since the Right Woofer expects audio data on SoundWire ports 1, 2, and 3
(corresponding to INT0/SPK1), routing it to INT1/SPK2 could mean it will be
starved of audio data and remain silent.

Should "WooferRight IN" be routed to "WSA2 WSA_SPK1 OUT" instead?

> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006085425.4045=
0-1-kaipeng94@gmail.com?part=3D2
