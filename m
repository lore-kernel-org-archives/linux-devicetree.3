Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983D371D1D
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991193; cv=none; b=XkCbWcDqRob89IaP+hPjF6y9zjVUIbyUCQl/qsKV0HPM4zUlWO5BK//frKC8hlVdfL+ho1iud8rxEySOvwUkhlAeYYqEj5+Qyp9D3U99kAHczQsWtF/P3Dxj7GRu6qaM4q6U/JWZtI+g+7xifMf8GyE9f6W5bCwe2uST9f3wQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991193; c=relaxed/simple;
	bh=tjCz4LWp8vovmdv7YdmVt9mRL1LNNiLylm6NpXlr7h8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G3SHkhWl5wwH3Up/h2mZ5oqtj3uXl6++WiCd1doGTM6rQNE1u4u92TIy8fFqAB3eJzEX3R6NodvP8TXZyorMsSxsX131wg5dkd3r77pBcQK+rv8SOnhshHkcfuueg95W0CH2VnGAMgG6iU9rr82nEUMmgGUTfGBl+ON4XoH5KEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wju8vLNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wju8vLNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C246A1F00893;
	Sat,  3 Oct 2026 01:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991192;
	bh=Lv8irvIxzMKK/Fh2hPWFH9Erd4pU5NF+knD+dWuGCU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wju8vLNYrSIEZbgwizKrGMOZj3DoAMPw23PIOAQCCIQit6XiCI+/L4o64VbL+mWMA
	 DsW8Pbr9duchtMkNkLhEGRCvHJkKcW+Mp13QjidqE+MLw73gjCX2VRW19opVS/UAc4
	 GOS+rxNMiOE5YHqX8qnNx6e7pNdVTtcwrpE/K2qRqToVeaO0fELlouvCRcaK+aYIH1
	 xixIN9SkUhkk6KM1zU88lWIQ8dKa+ZYjnr6A/Wsj28Brs+0nuYbZwMLvM4IU/Y0ZJG
	 hd7FGGYf57ccM/BbIu/WfigiuwDv/HBpOj1+g6GF5RIV+l7E8UMg+SOpr5ofrEyLbB
	 iTzELqDoBC6uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 10/12] net: dsa: rzn1-a5psw: Add fixed frame
 length workaround for management port
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20261001154326.754314-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001154326.754314-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:11 +0000
Message-Id: <20261003013311.C246A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: -Wdiscarded-qualifiers on of_data assignment
--

commit c1982503d53e92d2bb0e481c0cef9b75fe397c5c
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port

This commit adds a workaround for an ETHSW IP issue in SoCs like RZ/T2H whe=
re
the internal mgmt_tag_vld signal is asserted as a level instead of a pulse.
It provides a way to set a fixed maximum frame length on the management port
to prevent valid frames from being dropped.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 0b0b4055e6155..ce931442d49fd 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -209,8 +209,13 @@ static int a5psw_port_enable(struct dsa_switch *ds, =
int port,
>  static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int ne=
w_mtu)
>  {
>  	struct a5psw *a5psw =3D ds->priv;
> +	struct a5psw_of_data *of_data =3D a5psw->of_data;

[Severity: Low]
Does this assignment cause a compiler warning for discarding qualifiers?

In struct a5psw, of_data is defined as const:

struct a5psw {
    ...
    const struct a5psw_of_data *of_data;
    ...
};

Assigning it to a non-const local pointer here causes a -Wdiscarded-qualifi=
ers
warning, which might break builds that treat warnings as errors. Should this
local pointer be declared as const?

> +
> +	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_l=
en)
> +		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001154326.7543=
14-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D10
