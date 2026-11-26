Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684758;
	b=zmT4Fzx2en1Uevd2yuE7qVIi3UiegFsrStkiV4yNxJup63LiJ7SPv9NzLWPlSA6PT88W
	 69CLnRVHYL3JqBkFkeiO5TC0jk4Hb85+M9bVn4VTfsMWN57pyb9fU1lt2fCHtsSaAJI9z
	 38QNJXqzQCCu7sS2wbC/LIcCjSsHyrdxtJEYsLats9mV1835QEm+no9iID1pNVOXd7Ss4
	 s9y5LA6L9mtSiv99KKeW4xd8DfoL5iE5dcaq+qlVFd4wwz3YA1312c9gc8m3FSAwfTKP8
	 BfUsglsLkkh73+LWPtPTK6VAi6KiIpBk3WJiFtu58OZ7YitslOomA1ikWdWQE6+nURg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m8GOLTTa8N7SX2uwV3WfZ0IqKa/ZmpeILfiLx4edJ4c=;
	b=U0nB0F9Gy6HW+U0NS/FUtN5nQxH3bfbrQm7y8O8NoyagIS8LdH4+xMmS1aiUurGVzy4V
	 jonXY7sWtf0WHgdfibg8yWX8zOMp92htUK4p/dqIjooDEpzyBESSh2cbUhRnCJMpBZqA8
	 ManUBTbYoUJMHWFSSPv/z12E/AkmKdPpq8U0PQHX/4k2xDTW7yCq7aZlOy1mp4ew4MSgl
	 U59LDC+cWF7zyu/d+98+mfmsXa12fkJRh4iIlpBqRsg+2jon/DqBHwIum4ciSLaNDJEX0
	 K2qJq437k53Nw9P8HwbrtpTAb0/szK/dhl/bwmTOd5VJTVslus6WanqiFWFr7a6wBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWBKDPEJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7F606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWBKDPEJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4151F000EB;
	Thu, 26 Nov 2026 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684758;
	bh=m8GOLTTa8N7SX2uwV3WfZ0IqKa/ZmpeILfiLx4edJ4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hWBKDPEJf9DwQzc2K0IovIJYXQ9TEuw+MtTXI2C9dTlN8zI0WtaacMkDjAHd+egpg
	 spKzgPRDa+Ic4rTvIHNY9z/KAnFNHM5x3pB4AfheqBpOFH26dr5EcLJxQkeGjRu66/
	 79stcc7P40+INfMk7ObbXExmo7vvQPBwFULiERp8iyldcruXXlIQW7HOII3cdIp+S3
	 qf/jPmoB/WBKowFnAac1VOv3Y2gkEBusQzjf+xc/QfhFtIpC20+IcOKIeMtJWrBXLT
	 2if6V47G6Y06sjgqaJUAr72ALPeexSRYeRPRZJdpjGOjn4Im39PgbpPJqjrbQ1bJdh
	 NLysZgbsbsRoA==
Message-ID: <sashiko-outbox-235113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] gtrace: rvtrace: Add pre-ratified ramsink setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leo Yu-Chi Liang" <leo.liang@sifive.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-send-preratified-trace-v1-9-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
 <20261126-send-preratified-trace-v1-9-1e686fd75be7@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:19:17 +0000
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
- [High] gtrace: rvtrace: type confusion and NULL deref in
  rvtrace_v0_ramsink_release()
--

commit 270a89ab261cf1fa742d02dd08528a93ecc64e28
Author: Eric Lin <eric.lin@sifive.com>

gtrace: rvtrace: Add pre-ratified ramsink setup

This commit adds setup and release helpers for the system memory ramsink
embedded in pre-ratified RISC-V trace encoders and funnels, and wires them
into the encoder and funnel probe and remove paths.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtraci=
ng/gtrace/rvtrace-ramsink.c
> index a164db57167f8..f183dcd71c7c0 100644
> --- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
[ ... ]
> @@ -348,6 +352,104 @@ static void rvtrace_ramsink_cleanup(struct gtrace_c=
omponent *comp)
>  	dma_free_coherent(comp->pdata->dev, priv->alloc_size, priv->alloc_va, p=
riv->alloc_start);
>  }
> =20
> +#ifdef CONFIG_RVTRACE_V0
[ ... ]
> +void rvtrace_v0_ramsink_release(struct gtrace_component *comp,
> +				struct rvtrace_ramsink_priv *priv)
> +{
> +	if (!priv)
> +		return;
> +
> +	rvtrace_ramsink_cleanup(comp);
> +	of_reserved_mem_device_release(comp->pdata->dev);
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_release);
> +#endif /* CONFIG_RVTRACE_V0 */

[Severity: High]
Does rvtrace_v0_ramsink_release() pass the wrong private data to
dma_free_coherent() by calling rvtrace_ramsink_cleanup(comp) instead of
using priv?

rvtrace_ramsink_cleanup() retrieves priv via dev_get_drvdata(&comp->dev),
which for a pre-ratified encoder or funnel is struct rvtrace_encoder_priv
or struct rvtrace_funnel_priv rather than the embedded sink's struct
rvtrace_ramsink_priv.  In rvtrace_encoder_remove() and
rvtrace_funnel_remove(), this reads alloc_size, alloc_va and alloc_start
out-of-bounds from the smaller encoder/funnel private struct and leaks the
sink's DMA buffer; on the gtrace_enable_component() failure path in
rvtrace_funnel_probe(), dev_set_drvdata() has not run yet, causing a NULL
pointer dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-send-prera=
tified-trace-v1-0-1e686fd75be7@sifive.com?part=3D9
