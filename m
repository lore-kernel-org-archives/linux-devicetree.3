Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983734;
	b=2GncwdgTqCtFtQJQdN4Xuukf5qshpD1DvBrwGHJTMCkzhpXw7FdjuwhPGiE4LN2G6rLj
	 CAKcuP9uHP7GP9gw+GglMQ9ZYOMyxBjDPbfj0mcN3wKgt1jlwm6DY+AKZvtVXyL8dP7J+
	 +Qewhk5P604cleWnEx3km/uLFPhAIZWEZS7w7JI09cckPoIiwmZRNOz67MuKftlG/6rH2
	 gq3WL7JUgEdbQljA0SaH1vkhbCLyCSc5IcrkxuJtnzXmItUGtKc2TNiGaq7wQFOq1iRJ1
	 S1QtGLt/+q6n7mmUvEjiMu9bn4CaQ/rf5gWFnx6SOJKpeWfqnSDPO06jZvXyIZot5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uCa6Gm+aVTjjeSXdCFW/9La1Y9bWAMfhA+sFGEc77F0=;
	b=LdwxdlaMnnVLQYbRQyL791/nn089ZnXUy1659AJoCvDgKoAXR8ibrKXc10Kxa08eiVAC
	 gj0TauStFhJ9SVXRj86uFhhSwyQOWKLcrH/fbr5OlCQ6qghIAJz8djbRKQfQ+Scwxwqd7
	 A/UydbtA8zwrJ+z+eLBAqCZ+I+T3NnpHNwpzjoWxNorNhdJiI/fTHH2VJxM6UrJQ8Pl4b
	 BFJq4oKLokV8RY+JiyB0iA8GefoBH1bmYGU6RYX50j4HLZNBp57xDhyk5XWs20RryFwiO
	 5WgzCto102XeQcV8tWoM54xEfO8tTmMzwIEC8/2eEqtq+J5VcCdt7NygPSFmOFzMHwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0QQcqUu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4859606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0QQcqUu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459201F000C4;
	Wed, 18 Nov 2026 06:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983734;
	bh=uCa6Gm+aVTjjeSXdCFW/9La1Y9bWAMfhA+sFGEc77F0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F0QQcqUuJaHAnJIhaeRjNbHIaVhTkSKrqGtncTSez1nrZsffPpcvWpaHpriIzjq0j
	 L49mQinoNAUw7VY3JGb/zheUnXNDzuMhqKcYJcFzCyb1JigXJKTj1KJcZb/MIPaO9n
	 EfhFQvNn/F4P2MAek8dXKeXEwzM2emjXDlmQYkbGIJAiXwCYqrPvLC1FYlCH/xoMTL
	 Mu2c0V8wfKA5XGIAksZhXDLKb2biG3yQhSGjdoov0yk8mGI2sQaH5z/nE10+QD8T4c
	 8txprybDR4D3FYkWWWXnoLjm4bg+IuGZuC10GMhC0CkB74jaK+KmCcJmOj/95J7O78
	 bDZUDGYcF9q5Q==
Message-ID: <sashiko-outbox-220260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/17] ARM: dts: BCM5301X: enable GMACs in boards that
 use them
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118054758.132233-18-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
 <20261118054758.132233-18-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:35:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ARM: dts: BCM5301X: broken Ethernet and MAC lookup when
  switching to gmac2
--

commit 0269312535e53f643019e5fdace65a094482074d
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: enable GMACs in boards that use them

This commit disables all four GMACs by default in bcm-ns.dtsi and enables
only the GMACs used by each board in the board device trees.

> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm-ns.dtsi
> index 707c8693b2829..850b74a0fe6af 100644
> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> @@ -335,6 +335,8 @@ gmac0: ethernet@24000 {
>  			reg =3D <0x24000 0x800>;
>  			phy-mode =3D "internal";
> =20
> +			status =3D "disabled";
> +
>  			fixed-link {
>  				speed =3D <1000>;
>  				full-duplex;

[ ... ]

> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-commo=
n.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
> index 2f1d49733f092..6347ff72a334e 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
> @@ -191,3 +191,7 @@ port@8 {
>  		};
>  	};
>  };
> +
> +&gmac2 {
> +	status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b=
/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
> index 95ef6ca7210b3..99f1c8ebf3ae9 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
> @@ -149,3 +149,7 @@ &spi_nor {
>  &usb3_phy {
>  	status =3D "okay";
>  };
> +
> +&gmac2 {
> +	status =3D "okay";
> +};

[Severity: High]
Does disabling gmac0 and enabling only gmac2 break Ethernet connectivity
and factory MAC address lookup on boards that do not enable srab or define
nvmem-cells on gmac2?

In bcm-ns.dtsi, srab has status =3D "disabled" by default.  On boards that
do not enable srab (such as bcm4708-buffalo-wzr-1750dhp,
bcm4708-linksys-ea6500-v2, bcm4708-netgear-r6300-v2, and others),
b53_srab_probe() never runs to configure switch port 8, leaving the
internal switch in the state set by CFE, which configures et0 (gmac0 /
port 5).  Disabling gmac0 and enabling only gmac2 leaves the sole active
GMAC connected to an unconfigured switch port.

In addition, on boards that do not specify nvmem-cells on gmac2 (including
switch-enabled boards like bcm4708-buffalo-wzr-1166dhp-common.dtsi,
bcm47081-buffalo-wzr-600dhp2.dts, bcm4708-netgear-r6250.dts, and
bcm953012er.dts), bgmac_probe() falls back to SPROM when
of_get_ethdev_address() fails:

drivers/net/ethernet/broadcom/bgmac-bcma.c:bgmac_probe() {
    ...
		switch (core->core_unit) {
		case 0:
			mac =3D sprom->et0mac;
			break;
		case 1:
			mac =3D sprom->et1mac;
			break;
		case 2:
			mac =3D sprom->et2mac;
			break;
    ...
}

Because gmac2 is core_unit 2, bgmac_probe() reads sprom->et2mac instead of
sprom->et0mac.  On boards whose NVRAM only provides et0macaddr,
sprom->et2mac is all-zeroes, so bgmac_enet_probe() rejects it and assigns
a random MAC address on every boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118054758.1322=
33-1-rosenp@gmail.com?part=3D17
