Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F703859EE
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720839; cv=none; b=tuxuH3B54AtvLlUbUt1gvBLznTUnlqKzPg3SmdCFSflCQm/foPVrv+XOX0rfxTOJErpGWEdCcWYXFT1MR67JX9FgKoLsMyMhlrOydTguukftFDzjaTJFXltLhzwDvjI+haZD1s7IoDBOZKOijJNnDcusSLRvF+t6Kjmgen5Jr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720839; c=relaxed/simple;
	bh=s5wo7ef78OoecXmRcVrHKxExgSIu8oMm6vDpw/5wOmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b8FxTeEaKLINiPe2GZCJWpkmEg73fwCqSE3ToyPw1cek8VhF0usCWLvEVvZmBpeE8S8xAJDHl54Y6d7GuGn588MSbNsb23U8AyjgE6f2DVx9YvqPaPJA6CrHg6Y6ebdyPw/smcPQV1A6ftVyigD+L2jVzTJDSL+31f0w/LZgqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBaRUP+a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBaRUP+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321D91F00A3A;
	Sun,  6 Sep 2026 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720836;
	bh=k6342S0LzAVFPi2E38q3eRa213DATTULgYIeBStzGeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LBaRUP+aiMrep9GbRypfCYPYAKMINklh+/gza9MhyM5nogUezbMLmvvEk5ZU5tsDR
	 RcSsz78EK8rxCz95JOJKUvYsfJfRSmzS/riJshHubky/KvhXaOo+BwB3fVKb1jYPz/
	 wMpzjFGgFmEqobLRzWjjeUXyPYzdfjSyYhNXnJ0DSgZmAyRYTA2NAEOOS96EeBbaun
	 61WNnztKOpKyObuKsoCKKIigun4VQu8HgKEJKZi1SBz7AJr22D4PwZ4E0MC0dakpMz
	 rMB/trrRic7RsrELnxN8t2bDULAgrdgxxcmxmjoPsnxulC9AFgrjtO6TbxvzC/kstd
	 mIkpYCcWfhS8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/22] thunderbolt: Add ring_configure to tb_nhi_ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-15-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-15-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:53:55 +0000
Message-Id: <20260906185356.321D91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Combining the ring enable and E2E flow control writes into a sin=
gle register write overrides a documented 2-step hardware initialization se=
quence, risking breakage on standard Intel Thunderbolt controllers.
--

commit 418152855ed5299104cb0cb1980002eff8f62254
Author: Sven Peter <sven@kernel.org>

    thunderbolt: Add ring_configure to tb_nhi_ops
   =20
    The Apple NHI also uses a separate register range for the receive ring
    PDF masks. Add an optional tb_nhi_ops hook for it which falls back to
    the standard USB4 NHI method when it is not set.
   =20
    For the standard method also just write E2E flow control at the same
    time the rest of the configuration is written.

> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 4ef86e7c02851..2d622b365c4f9 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -244,6 +244,24 @@ static void ring_iowrite32options(struct tb_ring *ri=
ng, u32 value, u32 offset)
>  	iowrite32(value, nhi_ring_options_base(ring) + offset);
>  }
> =20
> +static void ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flag=
s)
> +{
> +	if (ring->is_tx)
> +		ring_iowrite32options(ring, 0, 4);
> +	else
> +		ring_iowrite32options(ring, ring->sof_mask << 16 | ring->eof_mask, 4);
> +
> +	ring_iowrite32options(ring, flags | e2e_flags, 0);
> +}

[Severity: Medium]
Does combining the ring valid bit and E2E configuration into this single
write in ring_configure() cause a regression by overriding the required
hardware initialization sequence?

By writing flags and e2e_flags at the same time, this could cause standard
Intel controllers to silently ignore the E2E configuration if they expect
the valid bit to be set first. Any time an RX ring with RING_FLAG_E2E is
started via tb_ring_start() on a standard Intel controller, this path is
triggered.

[ ... ]

> @@ -722,30 +741,13 @@ void tb_ring_start(struct tb_ring *ring)
>  		flags =3D RING_FLAG_ENABLE | RING_FLAG_RAW;
>  	}
> =20
> -	ring_iowrite64desc(ring, ring->descriptors_dma, 0);
> -	if (ring->is_tx) {
> -		ring_iowrite32desc(ring, ring->size, 12);
> -		ring_iowrite32options(ring, 0, 4);
> -		ring_iowrite32options(ring, flags, 0);
> -	} else {
> -		u32 sof_eof_mask =3D ring->sof_mask << 16 | ring->eof_mask;
> -
> -		ring_iowrite32desc(ring, (frame_size << 16) | ring->size, 12);
> -		ring_iowrite32options(ring, sof_eof_mask, 4);
> -		ring_iowrite32options(ring, flags, 0);
> -	}
> -
> -	/*
> -	 * Now that the ring valid bit is set we can configure E2E if
> -	 * enabled for the ring.
> -	 */

[Severity: Medium]
Could replacing this explicit two-stage initialization sequence in
tb_ring_start() break E2E flow control on existing hardware?

The removed comment implies the hardware specifically requires the valid bit
to be set before it will accept E2E flow control configuration. If this is
done in a single step via nhi_ring_configure(), it might lead to RX ring
overflows and packet loss in subsystems that rely on it, such as Thunderbolt
networking.

>  	if (ring->flags & RING_FLAG_E2E) {
>  		if (!ring->is_tx) {
>  			u32 hop;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D15
