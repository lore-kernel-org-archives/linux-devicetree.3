Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174636A01D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189607; cv=none; b=mjJ3gZPTOPdGONZa68Uy3jDrUQgQMKB7W5mh6AXpzrUTOwwSd7SdBMtNm7AehlNvcnqbckXGmRrTnbFcFnriY4euWBJFfRBqkvIfUpc7O54LdVhR8fz6NJtyVw7xPdPfqqicfc/SQ4YLnJlq24dwKUsHsiLZNaTEQvnaFOwjhuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189607; c=relaxed/simple;
	bh=BHGXzZt1d8W8ecIZ1QwyHNFQkiYMz+073p25eXAQcz8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=DL/xzusdKsmf2zUwHWNnVgy/MOsg4Zdnykm5zN4fH2CEdahWfVykBUiClIWXvrergNQlsARLPxHBGjPlpmnkatdQi+n3QHHdS9Kks9eAr3j6dYOuSsz7IqB2vAj6YKB07jpdpl1cVWTGctZgM0UDjlTo6/G+LKAGLTpAHSQ3vLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GiCIbKKf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GiCIbKKf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1677c91969so205828866b.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784189602; x=1784794402; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeCiWXObqZMn+CXaMwaIUj0LKi01F1mPNxBE7Xp9sFM=;
        b=GiCIbKKfH1g/0PW3SwLqwBJftZrRKlH/J+yXbaV5gbzNkIHdJK+Fpx/Ty0keVU5IJy
         W4lgrg6qw9wv08GZoCakp/pRhvfKVdyWjyrYClrx6UAo9QhPwdAlgSN95sPWv1bhF1Qb
         lmKalNUi4vJY20bGREFx44Wgkj3UDu4fW562LvAzS15TDSBH0Bw4Uq+Gme0iBnyi6lVo
         yaMe8bexFwHJD3xR5bnnQ4uX3IICh/TeVDDo5IM7tx6GTnA8CrwPRSUldeJlxMHMwd3X
         tcJZg93Ueq5JQ3UFms48G3sKp7m1QX66ZwE6ATo8UbBcHiKYGhp2AzLILeDSaYDQFHbl
         dsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189602; x=1784794402;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeCiWXObqZMn+CXaMwaIUj0LKi01F1mPNxBE7Xp9sFM=;
        b=hxDHvLpQprytOinz+4hCUktTIR3i8ysEir6xwN6puowKV8k0QKpiorc0dVJtvSu9gs
         FlYDbP1JXalrF6GvjncRxTn8xq5PrMvMPW66U9cuPWtix41NIP/oMN9Pbq7DlhxpNkSM
         FFjJMyc1THwwejntGs1RcGw3JFyv+isiTdN8xHv1BD+hLIhpRjhF340a26eO/4/3Uhl3
         95w2bJr+3nu62FUXhNkP69vQ39XnGBbhixJqWdpJ9Sm1hWM2Ff2ukz7HN4xPD6nJyBVb
         RQI16sixH32wV7+G/GDNGW7ijhh50c4NwwHMs9S0CJTbXnJ6HvNxd4Jsm6oPUaLAccPS
         9++g==
X-Forwarded-Encrypted: i=1; AHgh+RorCL+K/o23S0oI98Sn5M1oJmRmEpO5A4VcbAz1DUlWy2gogxLRnnmotVczBdiHRg7LKBYFubhJbtdv@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVJyQaTdbakUeCHN1LnsroGNc9kNu6qBF+b/nGL3X100HQlAa
	8raGYTJScG81PKuKvfyj5MGj/ZL4vijU4zjy+XBhzRHyLiHsvVo3EQu1sFeb4u/87+A=
X-Gm-Gg: AfdE7cnCelBvvJ2CpOm+8juF+3RswrpdCkOxKlKIfbpn8rpOa96nFOldWtBAp1nJksA
	MIxhrvi1nEvIErRv6pTuU9rdPtPaaO53YCXcvAu3zlPXTZc45wvMg7Q69B33B8yPviN0Dh/5R6/
	thpN3z+JrElBqy6e89IskM4MATMp849HU8YQ3UOjIuE9hPbSZJD/Q0alCWGDJn/X/KKI318dbzU
	Sx8Ea79sixr/UdXpeGmXw89j2bf6EsUBuYWGL4R+oME0bPbH8n/ujY/of7oI0HmyqfrWSd6La5X
	InRQRJ8jGvkIQS2mwEQYNI73MY8kG9vM4lC3JG8MoAruO0axFBS2/EJZ307RK0TeOcTWzaz155t
	dke6eRbQ9orXO8eP0iYlh0bxWei6ihFl2NtUGKFn/wpmwgq6N0artytt9DIoDd9jCRdrKX2o8CW
	E8UBwUoX90R3c39iElX0IZASdWG7csi3nn+K2vqIA7WZ3rIP4=
X-Received: by 2002:a17:906:ef0c:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c167921baa3mr388583566b.6.1784189601892;
        Thu, 16 Jul 2026 01:13:21 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm156110066b.17.2026.07.16.01.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:13:21 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 10:13:21 +0200
Message-Id: <DJZUFFHFXZBK.3S5A9OPE7XYEZ@fairphone.com>
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>, "Mark Brown"
 <broonie@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Mohammad Rafi Shaik"
 <mohammad.rafi.shaik@oss.qualcomm.com>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: add the Qualcomm WCD9378 audio codec
From: "Luca Weiss" <luca.weiss@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>

Hi Jorijn,

On Mon Jul 6, 2026 at 9:22 PM CEST, Jorijn van der Graaf wrote:
> This series adds bindings and a codec driver for the Qualcomm WCD9378,
> found on SM7635 boards such as the Fairphone 6. The chip pairs a
> WCD937x-compatible analog core with SDCA-style function blocks whose
> built-in sequencers handle the analog power-up/down; all control
> registers, analog core included, sit in a 32-bit paged SDCA control
> address space behind the TX SoundWire slave.
>
> The driver implements the TX/capture paths (three ADCs fed from four
> analog microphone inputs, three mic bias supplies) and is modeled on
> wcd937x, reusing the wcd-common helpers. RX/playback, MBHC and the
> SmartAMP function are follow-up work. Register sequences come from the
> GPL downstream wcd9378 driver in Qualcomm's audio-kernel-ar tree; the
> chip has no public datasheet.
>
> One dependency outside this series: the paged register map needs the
> Qualcomm SoundWire controller to implement SCP address paging, posted
> separately to the soundwire tree as
> "soundwire: qcom: add SCP address paging support". Without it the
> codec enumerates but every paged register access silently reads zero.
> There is no compile-time dependency, so the two can go through their
> respective trees in any order; capture just needs both to land.
>
> Patch 1 moves the qcom,micbias4-microvolt requirement out of
> qcom,wcd93xx-common.yaml into the codecs that have four mic bias
> supplies, so the three-bias WCD9378 binding in patch 2 can reference
> the common schema. Patch 3 is the driver itself.
>
> Tested on the Fairphone 6 (SM7635): handset mic capture through the
> LPASS TX macro at 48 kHz across reboots, including UCM-driven use by
> PipeWire in a Plasma Mobile session. The board DTS follows once these
> bindings are accepted.

Many thanks for all your work on the Fairphone (Gen. 6)!

If possible, can you share also dts patches with me, so I can try out
your patches, and provide at least Tested-by?

Also for audio, UCM and AudioReach topology if it differs from
https://github.com/z3ntu/audioreach-topology/commits/fp6/ or what you've
used to test the changes.

So for NFC, speaker, microphone and magnetometer would be great.

A git branch with your changes also works of course if you have that
pushed somewhere.

Regards
Luca

>
> Jorijn van der Graaf (3):
>   ASoC: dt-bindings: qcom,wcd93xx-common: don't require micbias4
>   ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
>   ASoC: codecs: wcd9378: add TX/capture codec driver
>
>  .../bindings/sound/qcom,wcd9378-codec.yaml    |   76 +
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      |  122 ++
>  .../bindings/sound/qcom,wcd937x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd938x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd939x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd93xx-common.yaml   |    1 -
>  sound/soc/codecs/Kconfig                      |   19 +
>  sound/soc/codecs/Makefile                     |    7 +
>  sound/soc/codecs/wcd9378-sdw.c                |  495 ++++++
>  sound/soc/codecs/wcd9378.c                    | 1382 +++++++++++++++++
>  sound/soc/codecs/wcd9378.h                    |  246 +++
>  11 files changed, 2350 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-=
codec.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-=
sdw.yaml
>  create mode 100644 sound/soc/codecs/wcd9378-sdw.c
>  create mode 100644 sound/soc/codecs/wcd9378.c
>  create mode 100644 sound/soc/codecs/wcd9378.h

