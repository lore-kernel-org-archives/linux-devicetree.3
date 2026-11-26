Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687999;
	b=tJj8UH3zORv5IElFbtgXN+me4c0tm3nd9L8lc2bw6q2kz/sxPnKmXxvu2yk6gmG4Ec4R
	 Q8H4PNmwkK7yoUia2GXfMBEVZjj95RQpqmh2eIgZJ7UHFekM3pVb0O1dFQxO6oXzal5Jq
	 U4oylIa15qObCBceIRl5VdnnEK1/XFBKYPFR3/mKnP/VpgD0dGr7MRNFpBLdkyxKSeV/K
	 bMDkr6q+W8UPuGMQhulVFPBdzD6s7IlU75qRS7Gp6xppPoaHVn38ls2xHRsz/ao6ulqEy
	 YonuTulhJ0yLci9J3mAcRTbQfdh4PAfJOJDvDU4gJJngPUw46Zgdr6lQWHQzWol8cDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bneDx9Sg7WlN2uwA7979T4ZH0hXnmTvPVXOqUK4/KdU=;
	b=5pmTqP4se4ky/cXG0gBQYoTdPosyTDp9xDly+6mFcWB1XH+KLPBaRIW2uWwh87/8Wsmf
	 N7qjJpQVyNkPZmPmxqMLyCxinLGIxPT9KZO5UN3k04/yDBq7eXEu8SCPDwDzkOB2ewPmU
	 8Nyyj3apYcL5MQh+uPgmM/ibxOM/hJaBEfIYp3i8t08h1iezUYQJYq+r0NGazqjdThg3f
	 2hggLBhC1kdwGVxKxnDZw3Jyi66ViUga4hqpTtPHdW8oq+mzSSkMDe5Nxitz1Slv/u3v2
	 4v7GhMI/mhp2VfyCZpbsvVcydPOhmxqCoweNttJrREpKSDFeFZLiRmYF4EEgsFEN6EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Gv/6rt+v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0E8606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gv/6rt+v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0481F000C0;
	Thu, 26 Nov 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687999;
	bh=bneDx9Sg7WlN2uwA7979T4ZH0hXnmTvPVXOqUK4/KdU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gv/6rt+v5XRoDGv3D0tnlwvp/onphf0y204wYljK5C51diPihDUd3+BmsoBRfCmBg
	 eDyiB7tpBynn6ubKP8kxG3xUB1s0CYAi6uqPAi2CLeqyn0B2QQkyb4MqIYnDToqwjk
	 UP5W1GUvukrNI6EKj0YPR4aln5RexDJO/ZG+xH+jySDsD5AxWix8g7Jp9V96T4b5KE
	 VB0OcUnt1Tu4ULOz3ZqmtT2K52E2ekv2dzb+rGwpwlvYWe0qqM9NM1l7qnC929m7Wu
	 XjiGza8MIzaCKSnTuMM82JWAuADEDf46N/pq2gdPrbq+n3qoh1RQwz/A9m4mqrDNwg
	 oabRVCJgzohGg==
Message-ID: <sashiko-outbox-235255@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/14] gtrace: Add RISC-V Trace ramsink driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4ea1823645f6841ddb551eb9a7bb81bd0879e57f.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <4ea1823645f6841ddb551eb9a7bb81bd0879e57f.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:13:18 +0000
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
- [High] gtrace: stale trace data copied on wrap in
  rvtrace_ramsink_copyto_auxbuf()
--

commit ed8acf419ff33b6e8c0e35b30a76e41399f3be04
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add RISC-V Trace ramsink driver

This commit adds the RISC-V E-Trace ramsink driver for the gtrace
framework, storing trace data into a system memory DMA buffer and copying
it to the perf AUX buffer.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtraci=
ng/gtrace/rvtrace-ramsink.c
> new file mode 100644
> index 0000000000000..24697e6096ec8
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c

[ ... ]

> +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *com=
p,
> +					    struct gtrace_perf_auxbuf *buf,
> +					    size_t size,
> +					    u64 *aux_flags)
> +{
> +	struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev);
> +	struct trace_buf src, dst;
> +	size_t bytes =3D 0;
> +	bool wrap;
> +	u64 wp;
> +
> +	dst.base =3D buf->base;
> +	dst.len =3D buf->length;
> +	dst.cur =3D buf->pos;
> +	src.base =3D priv->va;
> +	src.len =3D priv->size;
> +	*aux_flags =3D 0;
> +	wp =3D gtrace_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF,
> +			      RVTRACE_RAMSINK_WPHIGH_OFF);
> +	wrap =3D wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> +	wp &=3D ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +
> +	if (wp < priv->start || wp >=3D priv->end ||
> +	    (!wrap && wp < priv->prev_wp))
> +		return 0;
> +
> +	if (wrap) {
> +		gtrace_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF,
> +				  RVTRACE_RAMSINK_WPHIGH_OFF);
> +		src.cur =3D wp - priv->start;
> +		priv->prev_wp =3D priv->start;
> +		/*
> +		 * There is no way to tell if trRamWp wrapped around more than once. A=
s a
> +		 * result priv->prev_wp can't be used and the entire buffer must be co=
pied
> +		 * even though some data might be duplicated.
> +		 */
> +		bytes =3D priv->size;
> +	} else {
> +		src.cur =3D  priv->prev_wp - priv->start;
> +		bytes =3D wp - priv->prev_wp;
> +		priv->prev_wp =3D wp;
> +	}

[Severity: High]
As reported by Leo Yu-Chi Liang on v6 [1], can the wrap path copy stale
trace data from earlier captures into the perf AUX buffer?

When a capture finishes without wrapping, the non-wrap branch advances
priv->prev_wp to wp without resetting trRamWP to priv->start, and
rvtrace_ramsink_start() does not reset trRamWP or priv->prev_wp either.
The next capture therefore resumes writing at priv->prev_wp.  If it crosses
priv->end and stops at a wrapped wp < priv->prev_wp, the region
[wp, priv->prev_wp) was not written during that capture and still holds
data from previous captures or an earlier perf session, yet the wrap branch
copies the full priv->size bytes starting at wp.

Resetting trRamWP and priv->prev_wp to priv->start in
rvtrace_ramsink_start() (or after each copy in
rvtrace_ramsink_copyto_auxbuf()) would ensure each capture starts at the
beginning of the buffer.

[1] https://lore.kernel.org/r/20261126065537.705845-1-leo.liang@sifive.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D9
