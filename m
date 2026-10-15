Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B34CE689
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070377; cv=none; b=fzvdlGxDNlhTFSi6T9sVBwlH+1h0IkC9L/1OLiELUGQ3a3pZa20kYRKqn4+QP3GLiUcqjtY7BavPg90rLjZkRPDoSK/EbKLNIVjqVLJzQZgJKgpxR7YVlIRo3TDCWGSViP0OUekUqFCuScXb5Cam5ZStlvr5MzgHYO7NaCAyrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070377; c=relaxed/simple;
	bh=FQB8vXMAdTTCcxxq9Hv/6xEjX8Q819uWXwTrVt1s5HU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=P0Ygikr43AMI4nA59bSqtzWlCAT4qB5h80gKUTaMkgVHzvA5aLi7Go+h4Yf8cl8oMInbYypzlsQ85Ev8X7ypFQd9FcxYYQw2ZmbRRG/z5Xfs6hY2y+HzGwO83rUFaI0RHV0dafwpCkV8oQGUtsjxHZV1lvAFBeCWPGi/6cCH+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VM/tosDW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VM/tosDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56721F000C7;
	Thu, 15 Oct 2026 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070375;
	bh=vtcMbnS/youjFAUv4eSePSNcnWxipPXx8uOkLiyObxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VM/tosDWU7VyI69KL2pW1H/+RxQdb9R43vEJfOYXp/CIyhrwlsD4N+pDQcEovFg7+
	 UfifDgTmq01NgD9HPlpfAJPT3fDoZruiXUPh4aH8XPcr2H8TAv5vBvOc6rUgiqJWp1
	 PQLzlDopIQFRp6sUWPE/EVKnCmCe6bS7q6B0TSE1T1CiANijivmtj5oCudACcRuFf0
	 8uBqw9orFFYIMPhh7LG/ZVY/VPXWsYNrppUBPbffMr7iH0o6q8+fuFQeIrJ0LCNspJ
	 AVyc7vPqWcpdOIlTuNypbOwAqi3r2S7iC+EFi+JQkJAhHTdQpqTCqF3GHGKqE1l9fn
	 j4JbLueroDSgQ==
Message-ID: <sashiko-outbox-172922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 12/13] net: dsa: rzn1-a5psw: Add support for
 RZ/T2H Ethernet switch
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014131906.990077-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261014131906.990077-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:19:34 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: dsa: mismatch between commit message and frame length adjus=
tment
--

commit c8c80059b5db71015db86eaff104015c66bd88b0
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch

This commit adds device tree match data and configuration for the Renesas
RZ/T2H SoC Ethernet switch. It configures the switch for four ports and
specifies the DSA tagging protocol along with management port frame length
settings.

>     Add device tree match data and configuration for the Renesas RZ/T2H
>     SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
>     but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ET=
HSW`,
>     and an additional 8-byte management port frame length adjustment.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 30eca64fb2183..933589084eea3 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1334,6 +1334,14 @@ static void a5psw_shutdown(struct platform_device =
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

[Severity: Medium]
Is the description in the commit message accurate?

The commit message mentions an "additional 8-byte management port frame len=
gth
adjustment", but the code here assigns a fixed maximum frame length of 0x3f=
ff
(16383 bytes) to management_port_fixed_frame_len and contains no 8-byte
adjustment logic.

Could the commit message be updated to match the 0x3fff fixed assignment, or
is the 8-byte adjustment logic missing from the implementation?

> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014131906.9900=
77-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D12
