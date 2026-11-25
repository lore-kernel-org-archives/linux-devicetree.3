Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629923;
	b=wSfRfv9PHzRmHuru/gC7UvjfwekBjrkyzWg0Ma4licSGzx0EdVa1Ax8jkH4iPJNv8ZWF
	 mY2ttr4ObR1xKMwtW48JpL0VhTevqdOvPo8wcZB1Nd19gStX45E41q2lSoMKT+rXmdaNT
	 z4KKNJTTaV9XaOgG+6F/NpC9pkYeubEc3V58G/Q2lUQdpJ52nlp5RlBK1OTd6AU4cgVgM
	 cMR785YzvZbJwmfAgyCH4ze0Hg7SLX3MjvQuGq5JlnH41r0RwUx/MIkMGH2fFNKYTgygd
	 AO9DHEGiNkPDmifPCxoymU8qkU3k/PwQ4mRojaJY6X6UqNj0ALQmIbJc8JcmKCAr1VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629923;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=0anl0ccCCCZoc0bFfoM8ANcczII5sgMZtQxxCyWtzo8=;
	b=jx6FEYo/eh6Ro4g8fVhGAUpdDzFEnvZgqTL9o32gXgU8sLYSNgJW5Nxi39+H+bx6ZSZH
	 D2mVILUosVvAiLfal9RY8E3K75WlrX2JyIoxbnsQ+Z06cxHfq9GyD7Nq3zaMs6ol+AqHN
	 wreFm32uf/AG8egD5KMShoviWaGDsByBo802c213F6TJk3d7NoVbNTXofhNJWym607clZ
	 I+e1/xygU7dBZsOlcXDWDWBTvFp7/svGqKd5rQENeDdCr7NPdDZb0TPqR8EUGQ4GZBZhM
	 e8laIkGn0ZvN+xBkbnS/j2ro0NcVwfS3kX+i5C4H59Xmpb46zFlu1mbIVxp6SrVuTDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="mfUz/1l2";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBE606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7FBE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mfUz/1l2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 243234E4177F;
	Wed, 25 Nov 2026 18:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3B3E60480;
	Wed, 25 Nov 2026 18:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 047B911E6B0E0;
	Wed, 25 Nov 2026 19:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0anl0ccCCCZoc0bFfoM8ANcczII5sgMZtQxxCyWtzo8=;
	b=mfUz/1l2y9B5Q6PYTyl08Q0MPGeJPFMZpJfKF9f2H85BLYXnVbJYV0sNQ22zUAufCKepkb
	Io2t55gOPfDO9liSeZnvG1Zys75fC1wGTQP4yBD/ORz31SyTAedq/74Q/EhMxOEzdBmpGB
	U6Lk1CEjUx7XJxAc9NPu+MsghaHtJVDTaRnL63mHusx5uf6jnKvNpkrXIouXBa5xzPbrz7
	/dxrCjLyC4O5LF90xXlF7CquGb858SGCsEHjZ6Rp18lypoOzkZV2+mVVWqfrwYJ8FRZKbX
	DouSvjBzu3hp3KbICuKu7eJUO/IvZY+zqXc4eE+nL0NgzdPeGME/WefmWEkC8g==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v13 2/5] drm/imx: Add support for i.MX94 DCIF
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261120-dcif-upstreaming-v13-2-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-2-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990451.846133.506244474972901657.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:37 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

