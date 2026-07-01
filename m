Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8680481FC8
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910817; cv=none; b=ntyJZ3aENROb07e5xIWzEmgF6A6t7jsB6oOLu0lh1QBzIaUAuqq4v6RMCgN1Wrr5kx1ffMaMTd8z1MVEPHIgPfvDbfPB2ATRWqMHEQN91r8BGRLPFBWCZps1GSgbYojgweTPxjA4FVFmTv7TnmkQ+maVnV7cg6+XtvhSbRXG33o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910817; c=relaxed/simple;
	bh=X6iD74VUvsj4IONu64EzM3TfY4cTmcDv2T9y/kFxTYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DKj+T0E9r1QIidnYP2eTIWvmJmzuqXhtq5lHZa64LYGvAeUFXlQzC8hmpm4ga/Gz3IdR1Wg54HW3A18XxcHXgVeM4Qaa+EyNhmw8r7KQsDPZcmnwGMoNwcWqfW9cIPPfNKx03MKkl3THpvFBdaDFusee5se7HdYKT9cVP320ek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvBMxGV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvBMxGV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D4E1F000E9;
	Wed,  1 Jul 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910816;
	bh=tgkoD0gKON73jcKq1tznnlLf3njobBCqO3F70i1xEjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvBMxGV7U5IXA5oPMVN4a/zsRCbjyfQq4uk6ccU8UQGCQ/ASrZl6pUXT3Z+mcH1/d
	 ubAMjBGVmoWnhuTEc8dUTcPePXcZL+PGqWnN4vWqCY90vN5D1cdLlV89PdXb12XeaI
	 vC2KEMw/Cx0NKmmRa78xt+T/fWisVaI7SVPlvA5EQ4ZTpPN6bncwKNDzw5Pe82Qaa/
	 1JSwicOIKI1H5HxXjr3XlDy5W9VxCs3d6D7UWxqpGCvanXE6X8HcdJlDdupDivRZHS
	 4x3env2ahexF+EAXXUY03lJBkrJ+vUgNe4s0O9qQOJ8uqu++wLQxuouBVoghVwJzRd
	 1/lpwO0MOoEoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] pmdomain: mediatek: Add support for MT8196 HFRP
 DirectCTL domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701121920.19347-5-angelogioacchino.delregno@collabora.com>
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:00:15 +0000
Message-Id: <20260701130016.19D4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MT8196 `edp-tx` and `dp-tx` power domains are missing the `M=
TK_SCPD_KEEP_DEFAULT_OFF` capability flag, which incorrectly forces them ON=
 during boot.
--

commit eb4f187de58f0a2cc70a0933e40d0337d20d3ddb
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

This commit adds support for the power domains provided by the HFRPSYS Power
Controller of the MT8196 SoC. These domains control power to the eDP and DP
Transmitter IPs.

> diff --git a/drivers/pmdomain/mediatek/mt8196-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8196-pm-domains.h
> --- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> @@ -602,6 +602,27 @@ static const struct scpsys_hwv_domain_data hfrpsys_h=
wv_domain_data_mt8196[] =3D {
[ ... ]
> +static const struct scpsys_domain_data hfrpsys_domain_data_mt8196[] =3D {
> +	[MT8196_POWER_DOMAIN_EDPTX] =3D {
> +		.name =3D "edp-tx",
> +		.sta_mask =3D MT8196_PWR_ACK,
> +		.sta2nd_mask =3D MT8196_PWR_ACK_2ND,
> +		.ctl_offs =3D 0x74,
> +		.pwr_sta_offs =3D 0x74,
> +		.pwr_sta2nd_offs =3D 0x74,
> +		.caps =3D MTK_SCPD_SIMPLE_PWRSEQ,
> +	},
> +	[MT8196_POWER_DOMAIN_DPTX] =3D {
> +		.name =3D "dp-tx",
> +		.sta_mask =3D MT8196_PWR_ACK,
> +		.sta2nd_mask =3D MT8196_PWR_ACK_2ND,
> +		.ctl_offs =3D 0x78,
> +		.pwr_sta_offs =3D 0x78,
> +		.pwr_sta2nd_offs =3D 0x78,
> +		.caps =3D MTK_SCPD_SIMPLE_PWRSEQ,

[Severity: Medium]
Should these domains also include the MTK_SCPD_KEEP_DEFAULT_OFF capability?

Without it, the domains are initialized with is_off=3Dfalse, which sets
stay_on=3Dtrue in the genpd core. If the eDP or DP consumers never probe,
sync_state will never fire, and the domains will stay powered on indefinite=
ly.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701121920.1934=
7-1-angelogioacchino.delregno@collabora.com?part=3D4
