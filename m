Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778030;
	b=eoQcm4GIITBS/RYg2sC52xsd9W8+UOIymcTMh7kQ8RZS4WD/TEnR1qu8n/Fsshi7S2HK
	 6IXjkdfabow3i15LXPBP1SNmCqKR68TJ8y0lNxJ2TZxUpqo1uZIY3d5IgfB7ygGpZbmhf
	 lqPLyIOpt/lzqZt6PJY8fF21eY8XyFrk0U8ySwTTyOs1JkPaEQy5HeFym4ll7T+HsGFPB
	 m8xCLHGLwM+8hYI9q5CUK3j/BXhN145e1JMFUnMxS389aD4akAXQJ4xAS22RvUHx8PADq
	 qLYP7lBy7HqzKKXlL9YTA4p5OuWFC4ldrdfTXrqIIlKv18JdkHqhCfGYAFQnxjuzTCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
	b=XzFTUde7pig4hEdSgZqKUjRZBwfkrKJD1QL23++7oVPUuUuMWCiNf9FL9H1zvZ5e9eJq
	 yccEMKkOEF4c6AQQOll2bsg9IQdobJ3YhnvBDb89HBjBAeZ7wkpMgOtbjYjvocibMlyhc
	 I39jRBZ5S4Hin+fdUVz3J89nDwzpAn1IcH24g4NUXMmLK96rl5ypPX/UDbXCtpLBqEwv4
	 xz93UfYqNGAiXiPiB+cCwYy6tsIaG9i+EMu6t/YVR1I+HpINdvD6LD0Wcg9DiQwErnsY5
	 3u98HpU4O+Vfx9esApi2cj04idIzj1z48tzLCb0KWdwOsIjun3BN5y97RkByDdvL8Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mwSj3gru;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5E606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C5E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mwSj3gru
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b31261e8a9so16186307b3.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778028; cv=none;
        d=google.com; s=arc-20260327;
        b=AitqaYGZg+wjkxnJz3JPLL/d45u5ePVNcghwM2kOwJzQxwLCvfu2hN9dzWwFiQrlT9
         7zjNhicoDHT8Hh8/szzl3Z/vSaC+BFcfG8LFVirqwMvZIKw9wJqBfbr40MjUL3Wuqhqf
         dRZATMnsihsqy5AtPo8FuWhHmh8iKF+39ITwlLTsUc2djNywLl0aYFUuGxlHPrV0MKfO
         v2rjsw9+rXceXmyaMhz4QJFZuioFbo4XIh3tXGbVA76XT5AHgJzqsF5S0gGmx7epml3H
         B83+VOk/KErKJbQWeq9I3FFfgCf3YAuHkXL/MGY/xln5kxC3JW6ez+uepHBRff/r4Rgg
         ZJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        fh=qmVz2khXqhdt0AEBEdLRjUcKBQUMG0t2uy7bjItUAqI=;
        b=bcUTvmJHuCknwgMMH0h09S2nps6ZCIilDMsGChxv2zsnhv3QZDu6rtnUKgHxttl/rD
         qe3WcW6eGoX5RZCc7hZBhLvEOo3ZfX+xnQg2IDcESpVuipAmVbqCmX6sTMYGFJLtwAtO
         CJV5JDp/znP44Rc1GzSa5iOAwcEba/KiqnCelSmjennNpdlMia+5K6HoCkkapT6AOUt2
         IfYy0sn/4txgOpGojbHxy71JAnvlz/XySOmtAADrhbRYNsZTK3oFTWeS8jXU+93Jz4jV
         zt6Q19FgUsgIFssS6RAEy/LlEadq4+LmvDSTOQ55vuTAXWPPcBENs7EN/90py0A7eGWC
         DwCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778028; x=1795382828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=mwSj3gru6GVQtVK1B72XWkcBo6dlJyZWzdgxG91om6bDIjcOITIyDOSFQ+/zd5koD3
         2rStRnpCvYiSlxPqntKz/pJ5aMuZwpctbmiw5FavSk8jWq3yHM6+JGyrT9TfGFMPdJf/
         V4Neo+Q1X7wRZeSYG/sfy555gUgQrmyqSj3V9HFPYMeF78JD06cLamLjImg/upse27uw
         MVZpA5wfkowHSpJMxKiUYnWLt1H1IV55G6zbdispT0pcsUPmikc4mZTH/k3svCydvnc6
         wPeNTu/joJVKOLhSLFqShwsg22Y3E9sqXzZQneDZHqFpjvcsRlkGy2XX8jNKIWz47Tmw
         Amwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778028; x=1795382828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=r3Xw8vNjGcCJmOoENAjbtg8HtSgcInU6rKwvwt6egu6/vHlouoz1+oGFbdLqMrjoi3
         oWjfrZxWelLwsPkwrppyRMwv/Hu9BI/8RdmWkwUdpQUn2BQfixIC/oZJ05EliElwH90f
         Ufxtqlsj0TG8L9G4gjxMDcg0w1i8zW5lX37obhRljkcXBT0M63ECm05ZguwhaXkaJvib
         BKDEZnU288NRlLE1eoDXrFY1U66KGG77K2YdIEWEBkqoN7xlnfd4vqb+U0umbtocox/i
         4WJLF7HBzZeTV+7Py8oWZCT03DvS0/cZ61v/ucMzodVcH57iZKWVsnzDJbHlDsMRYzGl
         mM4Q==
X-Forwarded-Encrypted: i=1; AL+hErFvefjGs/lJwXY5pDQbjuKmBOdokh7rEDgyDd2QiJ8dlF/W17kQ7+THvFIJ1B9M5HG+pu7QtuB/KIrx@vger.kernel.org
X-Gm-Message-State: APuU4Z/C7x7ZFtBG/Og9+Blw/fi3NdEMKaE8rZ7y4VntG8+9DL3iOxcT
	ja8Bh8SQFm2SNTZbEeTyfCU46NaoEjsJNzarxQE7hzveFpieLQPHMtPyAykeke85kFkNOaG7w6R
	Tcd5dT5CUPhNCjGf9BsKG+EmDfpiYMko=
X-Gm-Gg: AZFdTZcmNG1PoxYO84ATgDD7qcIads2/hHmun8x8Y41PXTgWqpOeq17U2eCK1aXarKr
	BLdgyDAl0mtu5jUEbcT+cLa53AMA2DE7ee23lJrrx+mRrdUwGe6gEGqKc5MZdmKBjjRaD6V/9OZ
	BtEQ+ASBxxcIIs1yGZ5VMsUlqPF3pLNC9etDEF/yRB4TRrxJzJ+rMlHzJLtbMgbnfSwIQkH7SPS
	Mif36h/eRY7WF9vIqHjDH1YXB4/1oVmzXNaUKn7wtTdUuXP0WCyky232lkB/PxT1cPoczS7G3jW
	T1a/rl+vOrkyrfe1NjYII/et+ub2n9mtFY9TPo9JyB1sj9qu7Pb5MKuICBZkqrdZsIukopvv8cx
	i26PvkeQY8TZ7hviUmR5UmBsosI4tN1YB2miqIXZqU1qLNG4t2AjxOsGzd3tD9LpSxcDTFw==
X-Received: by 2002:a05:690c:6e85:b0:8b4:c2c4:bda1 with SMTP id
 00721157ae682-8b4c2c4c026mr25492897b3.67.1794778028118; Sun, 15 Nov 2026
 13:27:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:26:57 +0100
X-Gm-Features: AclHuK-_NZa3qMznm_nhucaqssqDCKZOwFULWjo8j1EdkFI26I-pZrQxJB4Pk5w
Message-ID: <CAFBinCC6C7QD2-eYhOR6FjQ+1a1sH6E0ioUMapFkTWe6626hfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
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
> +static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
> +                                 struct snd_soc_dai *dai)
> +{
> +       struct audin_fifo_dai_data *data =3D snd_soc_dai_dma_data_get_cap=
ture(dai);
> +       struct snd_soc_component *component =3D dai->component;
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
> +       dma_addr_t dma_end =3D runtime->dma_addr + runtime->dma_bytes - A=
UDIN_FIFO_LANE_SIZE;
> +       unsigned int val;
> +
> +       data->last_pos =3D 0;
> +
> +       /*
> +        * Setup memory boundaries.
> +        * Note: DMA has a 32-bit mask, so it's OK to take lower 32 bits.
> +        */
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_START,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_PTR,
> +                               lower_32_bits(runtime->dma_addr));
> +       snd_soc_component_write(component, dai->driver->base + AUDIN_FIFO=
_END,
> +                               lower_32_bits(dma_end));
> +
> +       /* Load new addresses (both LOAD and UG are self-clearing). */
> +       val =3D AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL, val, val);
> +
> +       /* Reset (RST is self-clearing). */
> +       snd_soc_component_update_bits(component, dai->driver->base + AUDI=
N_FIFO_CTRL,
> +                                     AUDIN_FIFO_CTRL_RST,
> +                                     AUDIN_FIFO_CTRL_RST);
not a problem but a hint in case you experienced some weirdness during test=
ing:
older vendor kernels have a different register write order and also do
a retry-reset dance when _PTR and _START don't match: [0]


[0] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/sound/soc/aml/m8/aml_audio_hw.c#L348-L357
