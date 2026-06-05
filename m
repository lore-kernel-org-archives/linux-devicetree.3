Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA50380FF9
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669267; cv=none; b=cahA0rvJJyL4kowfaESHJLtc4xJqzw4yxe7MRP/jWDBHAGzW2SxhZrkU2oHnQh6huR2HXexxwuGUFptys4+L98jJv8dPdyWQ4oRuUzgqGe1Xs2Bq04v1RVZkc59ZEH5g9y02U7EDArXS3mGFg2XNc2kjU9pWwP5B1r4Ew0acDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669267; c=relaxed/simple;
	bh=H1Prb1bgOg3WKPFIWNClGBQhJfoA3SPsGhsYV4nvtsY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NYxgGr7QCEyT4S7ZMu4nUdRaB7ktLdOPLkgN1fC7han297MT1LFeLjLXSZ88KfVjw8cW+7a/U4/YORfowvA6kxZ+QtnVGrmHPb4DABfidRRem4RHvAU6MSISZdNIPDe2VokhDiskOj/PSucLdqkPTRuBHPF+iDWyaZiyGa1Ol0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPeMvzO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPeMvzO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B0F1F00893;
	Fri,  5 Jun 2026 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780669264;
	bh=83ILjfmY/Eq/wTBY0Zk4CcAxMc8bC51phyMS3u4RcZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UPeMvzO8QfX0gvIzxXad9pVYgRUbpU2dGR+EOJ3EM+EwSQT2/ijro6BWMD8DJTWAq
	 nqJy6Asqh5ElmYOYAUjVKhPqnt2JOoXazLgbDzxWJLPFIH3NRoFjTg+o+ymsEQlY3x
	 5U8Cm519o4SfDaicFwzk8jj8P1gNt0+3ayPlprpsyyI4AfuaFZl+iDg5c8CMnv3Om7
	 noYtsq/ynZtUnjiMA/tGEe0qMvlwD8xc7qo0xXRs7rDfARgHWPWsmvH83x3SbyvsBI
	 RyBksayQ6cGrzdOKfk3otYuR3EiGZSgph/OmL3Npq6k7GpIT7PHF3h2zmDIkeJc/Cm
	 RZAcHkflAnByg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] ASoC: renesas: fsi: add
 fsi_clk_prepare/unprepare()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260605121955.105661-10-phucduc.bui@gmail.com>
References: <20260605121955.105661-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 14:21:02 +0000
Message-Id: <20260605142103.47B0F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] fsi_clk_prepare() and fsi_clk_unprepare() incorrectly use clock->c=
ount to skip operations, leading to leaked clock prepares and underflows.
- [High] The error rollback path in fsi_clk_prepare() unconditionally unpre=
pares the shared SPU clock, and the conditional prepare relies on spu_count=
 which tracks the incorrect state.

Pre-existing issues:
- [High] fsi_clk_enable() breaks full-duplex operation by returning -EINVAL=
 for the second stream.
--

commit 4aab60e129c589df9d885da5f08b55e2f1002c6c
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown(). This ensures clk_prepare()
and clk_unprepare() are executed from sleepable contexts and keeps clocks
prepared only while audio streams are active.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 3f303e15e8351..6537321242c04 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -730,6 +731,78 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
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
> +	if (clock->count !=3D 0)
> +		return 0;

[Severity: High]
Since clock->count tracks the hardware enablement state (modified during AL=
SA
trigger START/STOP via fsi_clk_enable/disable), could using it here during
the ALSA startup/shutdown (open/close) phase lead to unbalanced clock
prepares?

If Stream A opens, clock->count is 0, and the clocks are prepared.
If Stream A then starts, clock->count becomes 1.

If Stream B opens while Stream A is running, clock->count is 1, so we return
early and skip clk_prepare().

When Stream A stops, clock->count becomes 0.
When Stream A closes, clock->count is 0, so the clocks are unprepared.
When Stream B closes, clock->count is 0, so the clocks are unprepared again,
potentially causing a CCF prepare count underflow.

> +
> +	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count =3D=3D 0) {
> +		ret =3D clk_prepare(spu);
> +		if (ret)
> +			return ret;
> +	}

[ ... ]

> +err_ick:
> +	clk_unprepare(ick);
> +err_xck:
> +	clk_unprepare(xck);
> +err_spu:
> +	clk_unprepare(spu);
> +
> +	return ret;
> +}

[Severity: High]
If fsi->master->spu_count > 0, we skip preparing the spu clock above.
However, if a subsequent clock (like xck) fails to prepare, we jump to
err_spu and unconditionally call clk_unprepare(spu).

Will this forcefully unprepare the shared spu clock that the first active
stream is currently relying on?

Also, since spu_count tracks START/STOP instead of OPEN/CLOSE, does it
suffer from the same unbalanced prepare/unprepare regression as clock->coun=
t?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while looking at clock->count
usage, I noticed fsi_clk_enable() appears to prevent full-duplex operation
by returning -EINVAL for the second stream:

sound/soc/renesas/fsi.c:fsi_clk_enable() {
        int ret =3D -EINVAL;

        if (!fsi_clk_is_valid(fsi))
                return ret;

        if (0 =3D=3D clock->count) {
                ret =3D clock->set_rate(dev, fsi);
                ...
                clock->count++;
        }

        return ret;
}

If a second stream attempts to start while the first is active
(clock->count =3D=3D 1), the function skips the block and returns the
initialized -EINVAL. Does this cause the ALSA trigger to fail and prevent
simultaneous playback and capture?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121955.1056=
61-1-phucduc.bui@gmail.com?part=3D9
