Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9407345CCE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785193776; cv=none; b=Y8skiyTEIrIwPTj+g6hqlzwNlso1iE09aBPr4FkEg5NYqmqrgk9OiSvQmzGKtRXkl4GUmT5n74zLHLPZhV0XsMu7/G9zYD4A/oI+ggtgjnJU3hVWAvbiGyuDLQfd/dgpkHhnoXjD1YB5OfU7LNhH4myxYY+G/rsp+AE1lQN47Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785193776; c=relaxed/simple;
	bh=k3SYYgKh7P2qFqQUcWJX1HsbmBX70qQGkMFca+BKA/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=REIMKq6VSasoDx7I94g0idxmQV/v0FZrhU3X0fJTfVrAfRiMaYhKHZrZGoERRehXtW4Ef4WSp6JXeQignmHVcfLH/plWsWY3ZkI/7TeuMMJpYgBfmy+ef/mdD7VczaXPQVxB5hJ2GpDCw1B+iYjxC8hs9cZiIwrLDMEAnlSQwCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laWZrt+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laWZrt+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6526A1F000E9;
	Mon, 27 Jul 2026 23:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785193775;
	bh=vJlZOkYK2yTTdfvbqCX+7QNDXgZZsbryLKWWg4690aQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=laWZrt+7y1/FKuJx4vKEyT0biP6nhsz6wZxbPtKsIPoMk/GH356fFNpdRCYlT6iVP
	 Tcok7SioQoeslJF5nkTlI3/mnAwxSmSa9T4cHjjm5oBHvmm7aiHTc8nlZq+8fs4Y3C
	 A4jipilAVoyto8Bf6TrxQGYUb11+VfjlG/Dqs11m95VtjBgZKZEGFRWpApi8qCZk3X
	 MsAucu+k9oDMtyF9AoGJQi8vq+QJRAI9BbgDV3Ej5FWSPbuKGXr9Ufyi2yWfBy7fH9
	 uQsqCGLKCqBOGN5gmZvaBFwpzoOfRT2JY08GkX56/CwYqiXX304D7zEzSe2EpE53HX
	 nWFM31cogtmWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727225954.268155-1-rosenp@gmail.com>
References: <20260727225954.268155-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 23:09:34 +0000
Message-Id: <20260727230935.6526A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect physical interface mode for external switch CPU port
--

--- Patch [1]: [PATCH] ARM: dts: BCM5301X: panamera: add phy-mode to switch=
 ---
commit 2598ed8af439b245eb41bd31bdc3a006d830e5ec
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: panamera: add phy-mode to switch

This commit adds the phy-mode property to the CPU port of the BCM53125 swit=
ch
to resolve a device tree schema validation warning.

> diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/a=
rch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
> index 74161b76008ad..bc497d59ea805 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
> @@ -184,6 +184,7 @@ port@4 {
>  					sw1_p8: port@8 {
>  						reg =3D <8>;
>  						ethernet =3D <&sw0_p0>;
> +						phy-mode =3D "internal";

[Severity: Medium]
Is "internal" the correct physical interface mode for this external switch =
CPU
port?

The b53 DSA driver evaluates phy_interface_mode_is_rgmii() to configure RGM=
II
delays via b53_adjust_531x5_rgmii(). Setting the mode to "internal" bypasses
this logic for what appears to be an external MAC-to-MAC connection.

Does this codify an incorrect hardware description that prevents the kernel=
 from
managing the connection timing correctly?

>  						label =3D "cpu";
> =20
>  						fixed-link {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727225954.2681=
55-1-rosenp@gmail.com?part=3D1
