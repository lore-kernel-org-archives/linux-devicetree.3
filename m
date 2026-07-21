Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7B3BED74
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624296; cv=pass; b=taS+Bdk38DpGtrovG5MHeMrfHtlW81cT2j6xsgbbSr5MDTR52CjhYF+KhDb/j3ZiCJWg2zVuZXqBk6TCTeRgGQm1NfbkEi3PHjIN5tvu+Z1D9RqxmDO/cztGSvZmc8cCR1GNRKM3pF+wrRPRNiKoHQDQ0wSlbEuWwkgQ1d8/03g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624296; c=relaxed/simple;
	bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5bZCqDPi0DVz/oh3Sw6nZBwKfPW6g+YmgXxfHLfkx2RJCjNc/YliHei2eLE7d8jAhQLWFFBrR39jnyj9dd7mP3OErq6KiWrejyHj0KjmmPYpMYU6mL9Wj7Kk/eHufTiPbsc2Z88TH3rzJ44uhzhavJhNKzEunxAxTVmo3Im7KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxL0a9/D; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxL0a9/D"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so8090240a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784624294; cv=none;
        d=google.com; s=arc-20260327;
        b=elIOQgKQDfj7wU/Nk1KKueuPvxVOSU3YD0DLMmmBLgRrUP8kf2td7G0hqHGywz5Lfg
         KabA2PWtA3q3pVnwMMLXNTOcAzXxgpjPcY3qv1nLQ2N242qG50JUz3BKTHbRZA7SazYk
         f6oGyz3Je1vRV0eW3xPZLZCdkFxKPNd3kAAfOZjZ3LWylIFe+9EMvaAIRg7ezJ5Hc47d
         UGUu4ty0kEBtekB4nhCD2oLWt44TScAxAk5Rr5lke4igATMtZRUuy3wtnJ3JPoCrz5rs
         zpuFpkX9as+6xsvAD4ukYHXL//t7Jx9eVOTBw4J4H52QqM0Nrs4qGwjYcfFnmGtdn6qe
         ZjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        fh=i5BXG2qF+0JLb6qw/7RYDxh70DFGoYBt4RCY4Tt8Ipo=;
        b=Cq3qe4Perwau2I+++7hgQ6BGA5OawmMEKVcuKy/IV02uBHT7sc5gK5pXS/HAoB9olb
         vvYtIMQ+fCmxIjMj4rL043A0JPTzBJ00t0eqmmodf/48/ruzT0OCGRitI62zOO46j3VR
         WqjaBJdnbKltFiIdrkD6jbFycNtCYQKCkcxAQLEIsCRTJwrv/2OSTMKTrjXUky7e4v6f
         jrwMOzU7jVTzLjPevbp6/PI/Cv8icU/KudUwMho9caId+BJa2vhnlijRlupUH3s5EWV9
         Op8mZeX8KmaFunyD4aMjVBzc7TKaTm5rQ+C2IgUXFYfTpjuhaXb08poKHGaV6BGoiljB
         Jx7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624294; x=1785229094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=LxL0a9/DFlIrk72VVKtWZfnFf97H9o+9GsVmwWk4vcDneFP7p9kl3GPNVDd6H+u/zD
         F+C53FJpDkJzez5gk/awiXkvEbHkND4khZNVndSsBu20+O+o56wRIkIeDejphwaFUJvf
         9WvA2gqKh5eFjMou0S5s7SvfmnI++Sk00al4XgfBQNG3xsLx5zgmpdrLOp0YU04Gnll4
         nRgGAhoAvexgcWq7faoFbUsHnCllKSqGCEO+XvZO7zjymWAw/GGlnsbs6qWNDc4NasLo
         0G5tMprhCVfut1/DcqHZrgGkK0dCzw8aSH6C4BOqAEP+/ldmS0mXfxbzd33kEB3g2woA
         qnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624294; x=1785229094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=hjZKea5iL+p2bf1U5EVeYjKVWtyPig8gf/y2XsFBvYUI13wmsgdqb6wQkpiQLvxgGj
         J5cPY22ylkzXOGVagwQ16yoLfL0tJkvOeBABuIc9CiQJnOOHbqBOsWte133NUYAuZQoQ
         Fb1hHdU8Y0LLkkvUTSMQSy36IRlfjQwoQ5f+qt56CkEBG2ygZhZgvJYlGiJCTrIduudr
         5K62Y0FR6LR55dWipU6UnxObB/3LrgV8ISWh231tspnspieTIYfVBnRnK76M7rI4/mya
         eAyt6sXNPDawC37ksXK0cYF8CnFGwS5wag9TGg1dyUMVuUu/9KQid2MIYv5Ipl9JngR2
         n83g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0xUz6z2lNiRnMAg2DvYUnspuNt/2FIWrW6nkLKI7GTLcgiD3whiSWw1uq/Ry/0MT3n+cwuNj4ppRU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4jhBqGslrv5EkTee1NOpsniC5hJfUz0H4C0WUsdtX5+7HSBG
	6PX87Tk2RyvIP1Gy/Iht3Br1eZYsx3USnBYcVsuCI8j5xKCcGl39WRYfiyrERAVIiC41rCK2YKs
	A1wrEZEwHqrbdD/KqWtRP5oXpWRoW6RI=
X-Gm-Gg: AfdE7clTjz70KnXVZxRJ5avJB73ODCUwjWGAE+BpHKy0dgssEWlaGAVGEA7t2OnLyZl
	QWKzP8fj1Kl8iAABGwoH0veCJxOXm6QdTPJfqV4rdfnoBFdh735Jy1p+PoBGUkjRZbS6HVVzOvZ
	/1Aa2ahZpoC7PpKGzOK0oN9gwU1VKUB9oANi9kniWlxDPGg7seIs9sa1JNrAqmhfVumrX/tv6Qe
	nXwa+f61XUjvlVIc7lL0SevGyA4a+Y6JEUM/t713nfp5TDPfbaFFrqj4JOqwu/8Q+bcV+H+
X-Received: by 2002:a05:6a20:734f:b0:3c3:6af8:ab24 with SMTP id
 adf61e73a8af0-3c3ad9d5fe8mr19173494637.56.1784624294467; Tue, 21 Jul 2026
 01:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
In-Reply-To: <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Jul 2026 16:58:02 +0800
X-Gm-Features: AUfX_mxyjKglcWDGiHlL7pHojtmA7GYBRqbKLhdnlf4NA0C5KwDC9Zvpc1PZDyM
Message-ID: <CAA+D8ANTBSgzhEQ-fsj9jpKnOBKCQiJeY5pv2-zck0O4DTM04Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 10:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for pointing this out. There are also some comments from sashiko.dev
I will try to address in the next version.

Best regards
Shengjiu Wang
