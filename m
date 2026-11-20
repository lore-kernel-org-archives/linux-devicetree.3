Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215513;
	b=Hw3jANxOG/MPtXTkLjoGC4xIYycFFdTTv/fZA+iB5gNJxL5Z8zHcT9D+BKoaNgYMV1dx
	 FjGfQYSEKwAr5XEZMrfVd3BCBv2ugtc7RAVVFYsAAyKhnVxDzSWnnZ6pG8al30PNhepvW
	 GwLg0uLl3Sgls8jGbYceNYLLYIcxTZZJ5+rKTeMqRyEzLyTQ026QhDP7ZU1ZhsF1uoKZ9
	 IIqPT07ooFpjzcF8CkNHQnLB2fj883o23nPxeFFZuPAAM7DW/sUdBMoBNUU2AzlsLlesF
	 7dcAEq1C/ORbCslTJXCN+pp2lsr1pux5qswJWxdKqw9+U+cuTlMAJL3wDyDdybue1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215513;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jsdVeqgN7Vg2PScxaktSwPZtHrefaPurY/38fpOkiBA=;
	b=KdZPp3W28vl89FTTRP3ZZEe6ymiJ6mchCIHw/QBSf4b0/U/KsI+dsBFh44yAWCGBSUxF
	 zdKp2Sr76qO+CZR5MbjmHNvuTrH2KopCRUAlgr535wuw6d8FgA921dJiKZWBDpwK39n/q
	 WUcZls85HQXFrEm00wMZgrnynmT7o9Yli4KPwwpnGDZ4/LZstwrjpaMTkQjKz/wY92wp5
	 lIyjGEXGkM0IT3QmKr1XPHglHhcPPjCwZ8dUWKD9JddGyttUpLrEHM5iZpMjdboJT8f0E
	 ZT1d/qwEToPHpJZaWKUZ6S1i8+TQZNByaamJL46WEDAHoEuUPzuTa6nphnFRcwadDRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4y6EqfK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A145606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4y6EqfK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3511F000E0;
	Fri, 20 Nov 2026 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215513;
	bh=jsdVeqgN7Vg2PScxaktSwPZtHrefaPurY/38fpOkiBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F4y6EqfKMd2fI0uq3V/l/FkbY1BVYQuFNRIxfllm38C4AIjcAcXEE5xeBD+FqS4kr
	 ZCLM+9AE4FCNPCaOASb82yzN36Nu/yJbzrGO97EYdh94mJxmS7mzHYG9G084SFFjgd
	 S31NYrVEBtAF0IFsKd69wmoPmgRMgIRWjPeV+V7vvNRgkQMyuJQkknFekKADuG0Vuj
	 jIZ76NcbXVhE5ea77D5N+yS+pmUMitUqq0W609tgusclG5+tZo4kTLjVVzltjIGfiI
	 lzgojYHsg5jq7CEqxnzFXWh2LBhNGnQfaswGL3KDFn1aVNijrIZNnwHn+vLqAGggJ+
	 HFd307t1kki+Q==
Message-ID: <sashiko-outbox-226326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 10/13] dpll: sit9531x: implement output pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-11-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dpll: sit9531x: missing unmute rollback in
  sit9531x_output_hiz_write()
--

commit 0e3fab69e8ec41357c5e926188ccf70841ddc72f
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement output pin state on a DPLL

This commit implements the DPLL state get and set callbacks for SiT9531x
output pins by forcing or releasing the slot's Hi-Z pad overrides, and
enables output pin registration.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index d3f6955b3bbd0..eb1d10e1fde2e 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +static int sit9531x_output_hiz_write(struct sit9531x_dev *sitdev, u8 slo=
t,
> +				     bool mute, u8 keep)
>  {
> -	int rc, rc2 =3D 0, rc3;
> -	u8 attempt;
> +	u8 mask[SIT9531X_HIZ_PAIRS], state[SIT9531X_HIZ_PAIRS];
> +	struct sit9531x_hiz_pair p[SIT9531X_HIZ_PAIRS];
> +	int i, rc, undo_rc;
> =20
> -	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> -			       SIT9531X_UPDATE_NVM);
> +	sit9531x_output_get_hiz_regs(slot, p);
> =20
> -	for (attempt =3D 0; attempt < SIT9531X_LOOP_LOCK_TRIES; attempt++) {
> -		rc2 =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> -					SIT9531X_LOOP_LOCK);
> -		if (!rc2)
> -			break;
> -		usleep_range(1000, 2000);
> +	if (!mute) {
> +		for (i =3D 0; i < SIT9531X_HIZ_PAIRS; i++) {
> +			/* A pad the loaded configuration forces stays forced */
> +			if (keep & BIT(i))
> +				continue;
> +			rc =3D sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,
> +						  false);
> +			if (rc)
> +				return rc;
> +		}
> +		return 0;
>  	}

[Severity: Medium]
Should the !mute branch roll back the mask bits cleared in earlier
iterations when sit9531x_hiz_set_bit() fails, just as the mute branch
does?

On a muted CMOS output where clearing SIT9531X_HIZ_CMOS_P succeeds and
clearing SIT9531X_HIZ_CMOS_N fails, the hardware is left partially
unmuted with OutP driving and OutN still forced to Hi-Z.  The subsequent
readback in sit9531x_output_forced_hiz() computes muted =3D pad_p && pad_n
as false, so sit9531x_output_enable() sets out->enabled =3D true and
sit9531x_dpll_output_pin_state_on_dpll_set() fails the request while
sending a notification that reports the pin as DPLL_PIN_STATE_CONNECTED.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D10
