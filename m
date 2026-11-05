Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902892;
	b=ioBTk5fniVVHCzWCgW4NpSx8/sNMIYCKkKbuJnwxXcZIV2rr1vDqiRctDUCCMHlBL8pH
	 deK14vVbqPVg60Su3lzmyYR/jeB13h155mKS9gQOy+8SZzoC7AxNmLac8pE4OdsrA1rPq
	 1WuwIDxL30/RoK9y7MTOZUXJDx7MtZzkNF46amdmjpe/dnN1TIi2M+2Iq6KMZtRNE4p+J
	 A4pMLnxvgaFMYoqhrXmXGfMAkV4SEL2pQ/8hzungcys59LVNeEk1Up9hIMZbQ8NzAKz3q
	 Yzjk9VC89FquNZ6iDHSDQlsPsCAhUtozFb37T/L4cpCfAQZ1Lur16J4rTTOnHR1UNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y1KJc6H2caWqFYM4wdBZM8SQXm5ov/412Wz7OYEsN/I=;
	b=Dc6xctPoe6KJ0ohFJfRLsEI9eFbFl2/jsWQKS2tpKfxEMJidz2mSintCXJqrTamVMyh8
	 PUO3fVLU0R3tWoqglxxRN84a4Y6j9PBRpx6McrnKUcEyA807iforsB2bGoydG2DoBgP2B
	 ry86aM1DlqGxGA+NP7YaKt2RQ8gUvAN/SyJudEXKacmlo8tXSR4ALDOSoOj2MyQnmslFv
	 FfVjFx3oO2Z1vQILUio6dY3mTow5l/VVDeBGNPtnRKJ7f6Cl00w3pJmyqgi4Gdh/9fCZu
	 AXRAxdfl5daE7V9JH0xlUAEGbMJ4SG8dBDZsHNsepbDLeYrBOuF+l3ZBkljpodcG+LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbtGp0OF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A5606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbtGp0OF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B58C1F00919;
	Thu,  5 Nov 2026 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902892;
	bh=Y1KJc6H2caWqFYM4wdBZM8SQXm5ov/412Wz7OYEsN/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbtGp0OFtw2v1Vl+BEjn/A5kzFrtMbh9a/DNaHJmzaD6SnWR/fck+2npBqRW1GQcx
	 7yPML5RgdjAwGO8sE440rBRhiN2Pw2hS04lzIUrb8B5MPA+DNnn+6NYqBPoVklMsCo
	 zNx9OVY7j/r7J5XRXfyWqu9bceCHbdmQt7syKhvgToVylJpJ5ZDaFwpy2OzucKx5mO
	 hhV+m9LYYV3Q6dsDoDlJIW++tPxLEuBkekx2YDQDixIvU1TLBXKVVfKQT5OZZ3oqOY
	 VNeunDggHQ0Rzj5QbVdlFV8COtErlMqtOnK/xR2GZgqilu1NGDXzV4/ZmGZhdWAYPX
	 DWzlGmO/VZy4A==
Message-ID: <sashiko-outbox-199738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 13/14] net: dsa: rzn1-a5psw: Add support for
 RZ/T2H Ethernet switch
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261104182105.1102555-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261104182105.1102555-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 18:21:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: dsa: rzn1-a5psw: commit message mismatch on management port=
 frame length
--

commit 0cd79c8af56dc7e73238cc6afe8332ba3c3c215a
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch

This commit adds device tree match data and switch configuration for the
Renesas RZ/T2H Ethernet switch in the rzn1-a5psw DSA driver.

>     net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
>    =20
>     Add device tree match data and configuration for the Renesas RZ/T2H
>     SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
>     but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ET=
HSW`,
>     and an additional 8-byte management port frame length adjustment.
>    =20
>     This prepares the driver to handle RZ/T2H and compatible RZ/N2H
>     Ethernet switch instances.
>    =20
>     Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index f3eb8646dea5b..66b1556864743 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1338,6 +1338,14 @@ static void a5psw_shutdown(struct platform_device =
*pdev)
>  	platform_set_drvdata(pdev, NULL);
>  }
> =20
> +static const struct a5psw_of_data rzt2h_of_data =3D {
> +	.nports =3D 4,
> +	.npcs =3D 3,
> +	.cpu_port =3D 3,
> +	.tag_proto =3D DSA_TAG_PROTO_RZT2H_ETHSW,
> +	.management_port_fixed_frame_len =3D 0x3fff,
> +};

[Severity: Medium]
As reported by Sashiko on v3 [1], is the commit message description of an
"additional 8-byte management port frame length adjustment" still accurate?

In drivers/net/dsa/rzn1_a5psw.c, rzt2h_of_data sets
management_port_fixed_frame_len to 0x3fff (16383 bytes), which programs
A5PSW_FRM_LENGTH(port) on the CPU port to a fixed maximum value in
a5psw_setup() and skips MTU-based updates on the CPU port in
a5psw_port_change_mtu(), rather than applying an 8-byte adjustment.

Should the commit message be updated to match the fixed frame length
configuration in rzt2h_of_data?

[1] https://lore.kernel.org/r/20261014131906.990077-13-prabhakar.mahadev-la=
d.rj@bp.renesas.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104182105.1102=
555-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D13
