Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A93B4CF477
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303475; cv=none; b=ffb/hZ4cwkD3Xs4DeXS2njc/pEnn1mEM02GlPcT20ZfG3l3U/Q6sVvRiXQz7NuOCpv1rAqIPtGSpsXJy1XXNbmqu5PlUB6b08WJZVI1YXwc3G3fiRpyVOba9/amn06tTN6NOCT0D0NoPtKuUJYbCbAaqX5r0Lc5iWbt12289ays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303475; c=relaxed/simple;
	bh=u8y3seedtLQT+02s9yLBgJJ4zNwlJpG8nvq+FXm23qo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=raBjNyYq7kWD3PF7CzDh2PfTYFW0NnFyTv6GNHHvNdozSgvlWlnpy5LLsibcD/EtPXqxL+sEL/w2DAOJAQqa47UfqxckFUvStKw07MGweFPAFe2folIwZrN0kCNDSJucisn7hjgi1tW41ONDJHIz8O8CYFJze4GOzPpTEP8UX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeZ4Ovzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeZ4Ovzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFD41F000C4;
	Sun, 18 Oct 2026 06:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792303473;
	bh=SFxIbrzUUB7PIRylfjOydJj7+mO3dPHDDNtodX6kDFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WeZ4OvzolQ6Z5z3Bdax26zmo8okXegGHw4z9hvOT0Sx0px4rgKqkXGTyGClfpa4zw
	 LaCqeh190xSQ27JKEP2eVdK/QSMu3QV/stY48ENy0ZjJCEXrPKJUVgytDx1xYXkEiQ
	 YNLHe+i7+l8ec4lHL7HC2buz2H7MUmok6gWWYm7PO0bsykaLLUDrhvtIE8eug2NB1c
	 JW6N/TSm9WrxwjA5/iod46TwgEPmPnvfIOGHydS9fbfukrIL8If/XT0JVvv8qEJzla
	 X0NYLqsFnZsxtJUTK7Hc89xEh2St6iV7Z8GmvRAGb43vu+kQpKnIhK8tuAO9dh2QZY
	 4WiHEBPTqh6qQ==
Message-ID: <sashiko-outbox-175976@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/21] arm64: dts: apple: t8103-jxxx: Add regulators
 for CS42L83 power supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:04:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: apple: duplicate node names in t8103-jxxx.dtsi merge=
 regulators
--

commit d0005942339444378649a8aca2fe8ee2e51f9a6a
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-jxxx: Add regulators for CS42L83 power supply

This commit adds five fixed-regulator nodes to the Apple T8103 template
devicetree to serve as stand-in power supplies for the CS42L83 codec.

> diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/=
dts/apple/t8103-jxxx.dtsi
> index 686fb1dd215d2..7483fc5cbd204 100644
> --- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> @@ -38,6 +38,38 @@ memory@800000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x8 0 0x2 0>; /* To be filled by loader */
>  	};
> +
> +	/*
> +	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
> +	 * VL, VD and VP regulators. We don't (officially) know how power
> +	 * gets to the codec, so these fixed regulators are stand-ins.
> +	 */
> +	jack_va_reg: regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "jack-va";
> +	};
> +
> +	/* CS42L83 VCP and VCP_FILT */
> +	jack_vcp_reg: regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "jack-vcp";
> +	};
> +
> +	jack_vl_reg: regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "jack-vl";
> +	};
> +
> +	/* VD_FILT */
> +	jack_vd_reg: regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "jack-vd";
> +	};
> +
> +	jack_vp_reg: regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "jack-vp";
> +	};

[Severity: Medium]
Won't giving all five sibling nodes under / the identical node name
"regulator" cause dtc to merge them into a single /regulator node?

When a T8103 board DTS includes t8103.dtsi (which defines /) followed by
t8103-jxxx.dtsi (which re-opens /), dtc merges the two root nodes via
merge_nodes() in scripts/dtc/livetree.c:

    for_each_child_withdel(old_node, old_child) {
        if (streq(old_child->name, new_child->name)) {
            merge_nodes(old_child, new_child);
            new_child =3D NULL;
            break;
        }
    }

    if (new_child)
        add_child(old_node, new_child);

The first child named "regulator" (jack_va_reg) is added to /, and the
remaining four sibling nodes named "regulator" (jack_vcp_reg, jack_vl_reg,
jack_vd_reg, and jack_vp_reg) match streq(old_child->name, new_child->name)
and are merged into that single /regulator node. As a result, all five
labels resolve to the same node and each definition overwrites
regulator-name until only "jack-vp" remains.

Should each node be given a distinct name matching
Documentation/devicetree/bindings/regulator/fixed-regulator.yaml, such as
regulator-jack-va, regulator-jack-vcp, regulator-jack-vl,
regulator-jack-vd, and regulator-jack-vp?

>  };
> =20
>  &serial0 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-macaudio-v=
3-0-abdff7741dea@gmail.com?part=3D9
