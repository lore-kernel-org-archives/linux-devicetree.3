Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428815;
	b=T+TEqYd0tUjy9a92N9HzX7zNHMbC8Kqbcj3FAZ15hhIctFFEhxBAi8CYFQ39Wfb+xC72
	 4PY8BrxbvSAyUF7xJsfsOM8Vhfq7rWGU21i5Kw/DprMNZbq/7QP60YcPOa5pactZE0Qd5
	 YjTf6uiQhgRYiIUQdFRE6ZBx9TocZjtXkrCRRsLctmXplqZ8n2rtefIZQdKRVPVjWFt4C
	 QM2QL518o5VLtkfie90qLfqx2G8/8/KJSTR3K+nxnAIgOg45xM/gi9IuNkfb3mNDAHNTf
	 sJJSnRqjCqSXsia1kMctuNcM94dZod2la5NvEAPwtnkgB7HBWrjCvkBlJU6XgRjuhoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428815;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XzlyvTLkJi5a4FFxAbRwD4jlm0JupNYoiE69JDL8x3U=;
	b=eTZNh0USdvBO7NnktF6z9NLMEMwo/L/ewVao4gMi12V2PBZE9l1ZQ6jNeQx7Viaw8eCq
	 7NgMaBsBkABYZKyadfKuJpaNXqr1/KvZXVe5mfsySWxBoSJkPIM+x2JAiudfvoY16+GS/
	 gNuIBmv/sOnPLmWPu/kV9yq7hOeKszgAnGDPzZ1/NI81WHhG0T9RAm9jQ8vNlw1XV8aaG
	 9XHTwXwT5R2XQQGFsXdUQwelQMYfcVEANXM09LtR8KGib+yjYbH3e58BuZ6/LOgXVY6E3
	 VI2oITmACGK1yAyplsQm2hjpYRh+H2wnmWPzbZUtZOZ7KlN5xFP3LUV9g8bQN2q1HaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHjWkvgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A288606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHjWkvgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3E01F00A06;
	Wed, 11 Nov 2026 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428815;
	bh=XzlyvTLkJi5a4FFxAbRwD4jlm0JupNYoiE69JDL8x3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dHjWkvgQ96KVlkvJNkDXBWGb+7Gh9sRSxMZXtaAnMBQPSpM43+Fgb2SRpzP5O7XP3
	 bkNZco8DDhLe3XNhfKyxwDM0LtBAko4qYTG+rnpDs0UEOhKnxzRW8H1X2ZykhWLJA7
	 +ArAEJ5VH0bOXs2CnoXHFcKNcErO2rXD8wXy9F1toiuzwoNupIksi5O4KG9eYUak50
	 ZYip1+lKeTTaKQ29ojUQv4tx5hfX7gZARAf6hTXk/O/n+66K059uh0Dk+Rhl43IFuB
	 Il540LektZcAK8nLKb6jAR2SD75E4c7r3qZ4yDx2DyJelNiy2M0eNrraNpahwgJn5+
	 2P+FQFZIk6E6w==
Message-ID: <sashiko-outbox-209661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 10/13] dpll: sit9531x: implement output pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110202607.55744-11-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:26:54 +0000
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

commit 4e6433aa7f8c3d99e32f4350064261aad1b40ccd
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement output pin state on a DPLL

This commit implements state_on_dpll_get and state_on_dpll_set for output
pins by forcing or releasing the output slot's Hi-Z override registers and
registers routed output pins with the DPLL core.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index c7ab33993c288..458de502bc8f7 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +/*
> + * Mute or unmute every Hi-Z pair of a slot. Caller must already be in t=
he
> + * programming state.
> + */
> +static int sit9531x_output_hiz_write(struct sit9531x_dev *sitdev, u8 slo=
t,
> +				     bool mute)
> +{
> +	u8 mask[SIT9531X_HIZ_PAIRS], state[SIT9531X_HIZ_PAIRS];
> +	struct sit9531x_hiz_pair p[SIT9531X_HIZ_PAIRS];
> +	int i, rc, undo_rc;
> +
> +	sit9531x_output_get_hiz_regs(slot, p);
> +
> +	if (!mute) {
> +		for (i =3D 0; i < SIT9531X_HIZ_PAIRS; i++) {
> +			rc =3D sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,
> +						  false);
> +			if (rc)
> +				return rc;
> +		}
> +		return 0;
> +	}

[Severity: Medium]
Should the !mute loop roll back already-cleared p[i].mask bits if a later
sit9531x_hiz_set_bit() call fails, like the mute branch below does?

sit9531x_output_enable() still runs sit9531x_prg_commit() on error.  For a
CMOS output where clearing SIT9531X_HIZ_CMOS_P succeeds and clearing
SIT9531X_HIZ_CMOS_N fails, the commit leaves OutP driving and OutN forced to
Hi-Z, and sit9531x_output_forced_hiz() then marks the pin enabled because
only one pad is muted.  sit9531x_dpll_output_pin_state_on_dpll_set() fails
the request but sends a change notification reporting the half-unmuted pin
as DPLL_PIN_STATE_CONNECTED.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202607.5574=
4-1-arouhi@sitime.com?part=3D10
