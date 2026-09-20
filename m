Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC381CFA2
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881412; cv=none; b=EhJ455pAWFtGqcMb5c66ntHr2LhuukkzbhEvoEXD19V2SoIbNHIatZfYb5DXu6EtrGkJC+5QgxZdC4XoFHJzXqRHV7RnMJVZJTD3nBDQdET4K4jNeFFXcSbNv5g+RQNeLjrp66tWSt+d4eeNBrkM68AZqSJZ1MtvaKaacvaTlqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881412; c=relaxed/simple;
	bh=A1N8/RdjJedQ/Ipuoj7EwG3AIJjU3mDl0ti4hy3TpIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b1jFBGMDhQzAyBxAw7QO7r2NwOhglsDW1wSPafunNI3WfZi9p38fLeVpcxuuF6hnb3FVGPG94y93IicVT52KI9+v1KTFGY4THKhsq3f0dnPFrj2Hntu9iRPn4V+I6/VK9aipfO1R1SQKJnVwewEkTZbFMS3KLTP4LiV/7Uu1Pzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXdRjgmW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXdRjgmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95BC1F000FF;
	Sun, 20 Sep 2026 05:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881410;
	bh=RLJRXwhjMH3f9vYeCZ9UIUANimt1lAbhMEAZTbn7cUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXdRjgmW00o0zUMurrMN2HFTHb/rjlvhUAj1JmNyfsiGssvZJHnBceaeEz4IFt12I
	 s9jz+7Ew2bh6rT7mVLfP3oqG7MKg3zj6jPqQaAgkDkLB2czS+Go9+M9kMsHiltRydr
	 wRShWJ7lOzPRdqfb2Ft9BthdS02c3RBU7JHX5gDO+XQgeexoQqfGi+tc9YUA2qU/XW
	 xjpYapUXRIMkXjsgpw5B8sJgVe2bE/CVFnllcR4+nsToJhxhSPaU70t3C+xZ7wWHY7
	 BS3zadAA3o7285bUak+nNBMmITgc+iq16Ng6Zjt9kdWOWFbrfqJADrTdGIhkqpj8tM
	 1H7VN/4JaKvAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 26/28] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-26-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-26-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:16:50 +0000
Message-Id: <20260920051650.A95BC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unit address used without a reg property in dai-link nodes
--

commit 5d066ef5cb7fca6289258dc59c130ce74143e4c4
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t600x-j375: Add speaker/headset jack nodes

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. This commit adds these nodes and
advertises them to the machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/=
dts/apple/t600x-j375.dtsi
> index 8a1494949e4c5..60aa9a870bd9e 100644
> --- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
[ ... ]
> +/ {
> +	sound: sound {
> +		/* Compatible is set for each machine */
> +
> +		dai-link@0 {

[Severity: Low]
Does this node need a reg property, or should the unit address be removed?

The Device Tree specification (section 2.2.1) strictly requires that any
node with a unit address (e.g., dai-link@0) must include a corresponding reg
property. Omitting the reg property triggers unit_address_vs_reg warnings
during make dtbs_check.

> +			link-name =3D "Speaker";
> +
> +			codec {
> +				sound-dai =3D <&speaker>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 0>;
> +			};
> +		};
> +
> +		dai-link@1 {

[Severity: Low]
Similarly, does this node need a reg property?

Like the node above, using dai-link@1 without a reg property will introduce
a new unit_address_vs_reg dtbs_check warning.

> +			link-name =3D "Headphone Jack";
> +
> +			codec {
> +				sound-dai =3D <&jack_codec>;
> +			};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D26
