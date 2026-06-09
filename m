Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969535F16B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780969864; cv=none; b=aUd1tMXB0bGnjF+RN80/8GaqDPXG30HKE9+At+JT142elIsohAaikYgJUgprxWZmuPu+j3+teFWMcgjkYpL7vrP2QGGolTCEL5GJJRRDRxan9eUlwLJ+dPttxGOIIpvFiZU5q9z68tLjmuAjdIsqh3A5HLlJfq7d2rflSAB+780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780969864; c=relaxed/simple;
	bh=HMNikjxdqPN2TXlEfpQhxwHVF5qcO9m6fUOUVZ9vYa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hioQY/XZA5YWYQG91gzOh3xeC309vkM6CSkYMjocfOsDn6/cBcPMyfz/SbuMNu/9G9CNOlnds4cUSTJY4shePiGap8AMqHafU9xwXLCjsp/l1OwkeFCI4zl2Knt8gZBcqTAALyai+Q0Cp5PdXTk2x3r7/sW4fvsVkrWyAOzZn2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXigwQRE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXigwQRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7E61F00893;
	Tue,  9 Jun 2026 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780969862;
	bh=6OqjibCz2LNp0leFUcM95iBaVXSDIbNHj26TQSBEekg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VXigwQREavvZ9UepWqQqn95i0wIo8+e+BkxqB6qRKBgM4DXqc8VtIJYRCMl+g8u9r
	 /P4lObnoCfVSalnt9eM8J6zuPhlXisukliCV1D555cwiVZ0NEYZy3wU4fU3B53eBLS
	 iWU0fyMwAj57Zo7ChI0zwn18+1qhOALRyR1k8W6Ls4JnUn5tS31a4yvnc0romp641W
	 QgKZNqAAB03sfUnyrT+ivkNuKz/EqfT2usCDvNt1TPN+Gmu6OsNx2+rjvdn7NFpxcW
	 yZvuMecGTpmGc80oyPilopoydrG3m6tc5omDDCQmKj4f6IMk6IKaWoDsbZpLjTBe38
	 eIZtkr0LqPoAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/11] ASoC: renesas: fsi: add
 fsi_clk_prepare/unprepare()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609013107.5995-11-phucduc.bui@gmail.com>
References: <20260609013107.5995-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 01:51:02 +0000
Message-Id: <20260609015102.9E7E61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The interrupt handler `fsi_interrupt` reads and writes hardware re=
gisters before verifying if any streams are active, risking system hangs.

Pre-existing issues:
- [High] `fsi_clk_enable()` incorrectly returns `-EINVAL` and improperly ma=
nages `clock->count` when a second concurrent stream is started, breaking f=
ull-duplex operation.
- [High] The driver calls `clk_set_rate` and `clk_set_parent` from the atom=
ic PCM trigger callback, causing a 'scheduling while atomic' bug.
- [High] Opening or closing a stream resets the shared clock rate via `fsi_=
clk_invalid()`, corrupting the state of an already running concurrent strea=
m and causing permanent clock reference leaks.
- [High] Lockless access to the shared `clock->count` variable leads to rac=
e conditions and unbalanced clock reference counts when playback and captur=
e are triggered concurrently.
--

commit f7c3ccc68e9715cc648ab7fe51a1667d7610390b
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown(). This ensures clk_prepare()
and clk_unprepare() are executed from sleepable contexts and keeps clocks
prepared only while audio streams are active.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 6c432c7235a41..80e87b815c1b6 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -730,6 +730,54 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
>  		fsi->clock.rate;
>  }
> =20
> +static int fsi_clk_prepare(struct fsi_priv *fsi)
[ ... ]
> +static void fsi_clk_unprepare(struct fsi_priv *fsi)
[ ... ]
> +}
> +
>  static int fsi_clk_enable(struct device *dev,
>  			  struct fsi_priv *fsi)
>  {

[Severity: High]
This is a pre-existing issue, but does fsi_clk_enable() break when a second
concurrent stream is started?

In fsi_clk_enable():

	int ret =3D -EINVAL;

	if (!fsi_clk_is_valid(fsi))
		return ret;

	if (0 =3D=3D clock->count) {
		...
	}

	return ret;

If clock->count > 0, such as when starting a capture stream while playback =
is
already active, the zero check is skipped entirely. The function then retur=
ns
the unassigned ret (-EINVAL), causing the ALSA trigger callback to fail.

[Severity: High]
This isn't a bug introduced by this patch, but does fsi_clk_enable() cause a
"scheduling while atomic" bug?

The ALSA fsi_dai_trigger() callback executes in an atomic context with the =
PCM
substream spinlock held and interrupts disabled. On a START trigger, it cal=
ls
fsi_hw_startup(), which invokes fsi_clk_enable():

	if (0 =3D=3D clock->count) {
		ret =3D clock->set_rate(dev, fsi);

The clock->set_rate() functions invoke clk_set_rate() and clk_set_parent(),
which acquire the clk_prepare_lock mutex and can sleep.

Calling them from an atomic context causes a BUG. While this patch moves
clk_prepare() to the sleepable startup callback, rate setting remains in the
atomic trigger path.

[Severity: High]
This is a pre-existing issue, but could lockless access to the shared
clock->count variable lead to race conditions?

The fsi_priv struct and its clock->count member are shared between playback
and capture substreams on the same DAI. ALSA PCM trigger callbacks are
serialized per-substream, not per-DAI, allowing playback and capture trigge=
rs
to execute concurrently.

fsi_clk_enable() checks if count is zero and increments it without any
locking. If both streams start concurrently, both CPUs can observe count =
=3D=3D 0,
execute the clk_enable logic simultaneously, and increment count to 2, but
clk_enable() was called twice for each clock.

When stopping, fsi_clk_disable() uses `if (1 =3D=3D clock->count--)`. The f=
irst
stop drops count from 2 to 1 and does not call clk_disable(). The second st=
op
drops count from 1 to 0 and calls clk_disable() once. This leaves the clock
enable counts permanently unbalanced by +1.

> @@ -1580,7 +1628,7 @@ static int fsi_dai_startup(struct snd_pcm_substream=
 *substream,
> =20
>  	fsi_clk_invalid(fsi);

[Severity: High]
This is a pre-existing issue, but does calling fsi_clk_invalid() here corru=
pt
the state of concurrent active streams?

Because fsi_priv is shared between playback and capture, opening a new stre=
am
while another is actively running overwrites the operating stream's clock r=
ate
to 0.

When the active stream is eventually stopped, fsi_hw_shutdown() calls
fsi_clk_disable(). Because fsi_clk_is_valid() relies on the now zeroed
clock->rate, it evaluates to false.

This causes fsi_clk_disable() to return -EINVAL immediately without
decrementing clock->count or disabling the hardware clocks, resulting in a
permanent clock enable leak.

> =20
> -	return 0;
> +	return fsi_clk_prepare(fsi);
>  }
> =20
>  static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
> @@ -1588,6 +1636,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substre=
am *substream,
>  {
>  	struct fsi_priv *fsi =3D fsi_get_priv(substream);
> =20
> +	fsi_clk_unprepare(fsi);

[Severity: High]
Could unpreparing the clock here risk a system hang in the interrupt handle=
r?

If an in-flight or spurious IRQ fires after streams are shut down, the
fsi_interrupt() handler executes. If the SPU clock is disabled, the handler
immediately accesses hardware registers before verifying if any streams are
active:

    u32 int_st =3D fsi_irq_get_status(master);

    /* clear irq status */
    fsi_master_mask_set(master, SOFT_RST, IR, 0);
    fsi_master_mask_set(master, SOFT_RST, IR, IR);

Accessing INT_ST and SOFT_RST registers with the SPU clock gated will cause
the system to hang.

>  	fsi_clk_invalid(fsi);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609013107.5995=
-1-phucduc.bui@gmail.com?part=3D10
