Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB260361DCA
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543060; cv=none; b=oGnJVyTba4cR3a8PBQJX/DBEJjgv0cWTM0aXUZIcsfn0+dNUjypgPADTj0gS7IX2MNttmRlhxXaDGtjofxUyZrf7zpMYzf/honxCyYzXdSTZREHgO69v+Mtw70rRuJukScLPsbzKGqDnIsNg65NbJju7udPzbf+6mhoh93gygoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543060; c=relaxed/simple;
	bh=F7lH1Hcpcng63H/FeseuO4Ce0a0fTHjCv5Rbr/zhfXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KqATcLztH1waUqtXC09N9diDCdpEg1JnOOjX8/uo8l2MSYTckSIloRf4HM6hYhNymzxPYTmZaog+9dBK8nwqI8Lrat6xdsSyrTDqHnz6vLuAlHq9CO1pevSjfzMehpVIo61AzVHQJHgeBeH8lN19AFS+qDAHZg/5YVyKWjqZaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdLhb7+I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdLhb7+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294FFC2BCFA;
	Mon, 11 May 2026 23:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543060;
	bh=F7lH1Hcpcng63H/FeseuO4Ce0a0fTHjCv5Rbr/zhfXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EdLhb7+IwKpFd1bi5Jq3QU7mqLpFJ6Yz2IXcOo30TRg6nABkNOBxdLbnpVXX0SS9q
	 y9Ymz/9A0QnpPIpNgTvNE3viCsFWz3i0Us9tC4zYGriix5JwZ7SDQrID9J8lR8mUW5
	 kmCirzWiaQ0SB/nebtgMR60umtGQv+gO03etD/D4M4OSotBJXXsoMyVmt7oi8vT0WS
	 Jx2YtQogq7Mhj/gW4E4i9tG0McPkqc/QBRd/XbVKsXBjJnJATZ/6d5ZtoZq/J8VHOI
	 o6zkQJf4IbKzp6Sn3U/SKC3De5ldjVpnWAhLTANjvxA3h37nCQKXbHwYAEM42wt1mA
	 18pYWBC5nDZdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] ASoC: renesas: fsi: add
 fsi_clk_prepare/unprepare()
Reply-To: sashiko@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510084303.122426-9-phucduc.bui@gmail.com>
References: <20260510084303.122426-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:44:19 +0000
Message-Id: <20260511234420.294FFC2BCFA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced clk_unprepare() for the shared SPU clock in the error p=
ath of fsi_clk_prepare().
--

commit a95cff00ba1897eee23bb95b073c56ffd1820e0e
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()

This commit introduces fsi_clk_prepare() and fsi_clk_unprepare() helper
functions for managing FSI clocks. These centralize the prepare and unprepa=
re
logic to facilitate moving clock management into sleepable contexts in futu=
re
patches.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 8c46d68069581..b93809b5da15e 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c

[ ... ]

> @@ -732,6 +732,72 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
>  		fsi->clock.rate;
>  }
> =20
> +static int fsi_clk_prepare(struct fsi_priv *fsi)
> +{
> +	struct fsi_clk *clock =3D &fsi->clock;
> +	struct clk *spu =3D fsi->master->clk_spu;
> +	struct clk *xck =3D clock->xck;
> +	struct clk *ick =3D clock->ick;
> +	struct clk *div =3D clock->div;
> +	int ret;
> +
> +	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count =3D=3D 0) {
> +		ret =3D clk_prepare(spu);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!IS_ERR_OR_NULL(xck)) {
> +		ret =3D clk_prepare(xck);
> +		if (ret)
> +			goto err_spu;
> +	}

[ ... ]

> +	return 0;
> +
> +err_ick:
> +	clk_unprepare(ick);
> +err_xck:
> +	clk_unprepare(xck);
> +err_spu:
> +	clk_unprepare(spu);

Will this result in an unbalanced clk_unprepare() for the spu clock?

When fsi->master->spu_count is greater than 0, clk_prepare(spu) is skipped
at the beginning of the function. If a subsequent clock preparation like
clk_prepare(xck) fails, the error path jumps to err_spu and unconditionally
calls clk_unprepare(spu).

Since clk_prepare(spu) was bypassed, does the err_spu label need to mirror
the preparation logic and check if spu_count is 0 to avoid decrementing the
clock framework's internal prepare count prematurely?

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.1224=
26-1-phucduc.bui@gmail.com?part=3D8
