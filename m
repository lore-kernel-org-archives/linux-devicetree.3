Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778151;
	b=FolGD0odIxO59PWym6o3PMExjFG7vw8RN3qvdOFqJ0pOTWBhl/fB+fX1PmoSDumD59Wp
	 dYPm/byV/RgP5rkbcHeWhMGiyogXiaoUgfTQavJVObQEtUqkYVkWzuheWsMcpEWpVARVV
	 kiXGVm5MiRd4l46sauAAS986ag/7Twa851hzS0fEiQKJOWbY4leptIh7xnj8q6J+K6kJP
	 xLL2vEBanDKZXREC5hBm57ZgLbSGyszYd4FeI+fnqRmdtBi9A4h30V9Tdn/p0wBM1OAmY
	 5j60n1f+kEGJkB/WnEQWgaVPlPx+zaLu7zw+JzzhtbRqDsOevIupsXlOgqXSS9lrG9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
	b=d9KgZCE1Yn4hM6vh4feXU8DDFJ7ruRvPGmUv4cIPFlvIXP/t4hFS3uUrtxmKQ1wom3+M
	 Duyg9q3E+UZuEEBkSXDKScrpId2qnJSXtrdTRVinj+qOMCh32MGxEDrZMzMpTv9kCUQQR
	 Dd9fLZeSdWy8KAA2m2TXxK83BE59dXIAv6uI/mTQkZi87zXcEFRjZNIja+8NfHMEDLt82
	 vPO1B9LGK4NqD0Vcs9uuZvdaLC/VyozkGmPXp4plrhEyFdcAEd4muzUtqjBQKsQjIuvwu
	 Di2E3teBD5/CBttmor/JBwnR+nX3rHwpwoGKXDIsS1P0zm0+qohaaXd8awktk+GhxDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=rV5+gU+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802F606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C802F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=rV5+gU+N
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67da7d18f2fso978974d50.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778150; cv=none;
        d=google.com; s=arc-20260327;
        b=KqBapZtpLnpWQVF7Cuo+1XIJQmEDP0umFJD/B+gmtMmuun3xMYL7z7K9w9kVn6UYun
         sC+3rDGHgcbeSIJ4Hi0pJHJhvzmsdGVciTIqzAdT9Us75bp2NDBHQonPTmTeAwveEMb9
         DHlQcVy2XAND4/YidDXMssOgLOYzJxUCwpNzqRomNe3toUOBttb3xAuc5SzSx5hYR7xV
         0uYUWWPSUc6HpImI5gedjl6FywFV0SKUmKUAFsS+PGmeKl+jQ2Kq2GuvtQQlR5iatu7s
         Rzmdu93At889mP6YXRh0Oac9E0ea/0X3scnC36bBbfuA7KJUlzFgs3kK0Qm+3FSWgdpy
         Nt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        fh=hU6IwjAh4Mr0NKIlEO4jfboxalm/ZPULgIxHaf6kiW0=;
        b=efdQcQZb0RLK6j8n4tGqZooRwdxtbFyOwWgKTwWwFskqfhJNQHztVVGXY/bmY1dTgb
         jRZGqtNVF0aRnypnS6N7/QGqSuTaRWjk3bzd2XJN1qx/559M+kX2ZDANMak4iPpu19/q
         4EECsjCNwJH4/WqI4aeePz1UT1aTtUmM9BxrZBjUaoLxu3vEo+xYVxHGjAIFMkrKdBFB
         rHhWfacrdbmmiUjEOUHVOlh4VTi3hm/NkHYPhUhXotz29GF5qQIgTxrvvKS1QrpGJzok
         Mffpsb+MZJgjuQpPtam8bYbYp1DRrvoNK0f3U2sKFxpZe7mL7KV+2z9aHXOMzBE6NvBU
         wPkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778150; x=1795382950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=rV5+gU+NHij2v89bHwlyKY5Noir/2v24z3w0oIAEvARkSvIG7vd/YfqLUzMP3cmaSz
         PzFU2lykEHbheQDsK2BYl9l6VKCgo+IPgPrlACsHsPnzpircwB7z66RcO+XSwDhtaY3z
         MFTJUjF4CAJNRHves/bvOhHnzbyjw3EEc+Vvgnq6Hz7qcZtjZBBHAvwAJIp+uFsJIF83
         CM4IQwPYCq88iOcwLOA1AH+yprNaPnJsRhjVEWeC+oRWid4DKMiIJ6g5EGBx7Lrqd3dB
         uhQF/ypFr1l+xUXc2mErccQhwwC3ejk8Gv7Bn3/FCqlQVwXKMf41TDdqc6KjtqWlcFAV
         mRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778150; x=1795382950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=z1PdrpmveAOQxtInurzcnJpDtrVBew9xFDmXIy0qD2PTN41Dj4ySLBebx6igC23aoE
         MCcuxmzeA0NAiZcno3iN9sTFyQAxu2BL6PYwc+yaaiIwjM6/jvDOn1qqXOC3qy/65Gj4
         YiILjGeFFptA8W+/d05AEbu0q88ITwCdMi0TiDKB1rmqor9oeVtstYuiQpNM9yNgeCYN
         4faW6ORhfz9PoMoA0ASZVYt6DEtYYbFUft27IXs2XU9g4n0bS73lXXAVAVmdXHXqmMw2
         pMQMgdQ0CpcZrOqX1pVlOH6sgZeZyPLTYJJ5tCt8sHRs4mmyxMfSvayO8Zc71q7wXFPD
         VcjA==
X-Forwarded-Encrypted: i=1; AL+hErG+cFzst48joKcHV2Y2VCJlevRecp9l8m7GIl2stQidC4Mc+4nsOEK/X1gYoW1lghSxSDiRzfsQTUwq@vger.kernel.org
X-Gm-Message-State: APuU4Z8yuQWJV3KvN0+lf/htpQyhEQVZ24a29xCuZErF4KftpfqQ/4E2
	ji2VD910W+2BIAsATOb9CQnac1YtqQ1gtAnoof/jNkw5YUbwSMxspJSuplCb7H577uKp0jZjTZF
	g8D/mvW5nwUygGHNM167KAYZNWkKYp/o=
X-Gm-Gg: AYBFou3lz2cyMOhV4+A9MLqh0ZdxkHeIDTmMDkGPSPQ/rWBiIjQ0WUCveAqBGjBfsgD
	2N6NynioJ/ORYjcq9T5mUEMYQeTQfN4Qv628xldzhn9ItPBL73pk8a04qfvh8chbIyKGvu/sTAA
	Kla3I5o0gEa8BRJcUcXgmjDXotemFzva+mc9bLWLMj6e5gPwY72g/arfeGeiLtB15Di4OQw8Vwi
	H4hI2ZFlh7vpd9Hm78b2rwZeTFgHiJE+lLXg74AK3bv0niy+qzYpm5bwH6rS/wPztAZ2n7aeSs4
	42eoKWd48qVxEbgkGRv9EDuZt6SF/5Ax1bo9yJ4YWPRbULcpFbacZWle0Wy0wadsmpfooSgOsC6
	rFbynMrWyVTVvO2L89UpjGyFO7ZuEc2MtDod3PrgvUsbAA6YazVh45xkMUbt3CVxDYk9tfA==
X-Received: by 2002:a05:690e:1c0f:b0:67d:b0a1:c9c3 with SMTP id
 956f58d0204a3-67db0a1d2ebmr1094277d50.32.1794778149875; Sun, 15 Nov 2026
 13:29:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:28:59 +0100
X-Gm-Features: AclHuK_mrwYOs88jQPUihYmd8k-bNvXzF9c0J2wcB0Lmj_2uDGdqbd4QCFY5NB0
Message-ID: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", =
"FIFO"))
> +               return meson_card_set_fe_link(card, dai_link, np, false);
I suggest using the "audin" prefix. AIU / audin seem close enough on
all supported SoCs that we don't need a SoC generation prefix  in
there to handle this differently.
