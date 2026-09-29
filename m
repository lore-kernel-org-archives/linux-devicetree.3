Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41523DCDA4
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696890; cv=none; b=Bi8FjTDkZh/VGfxRSDWwRa+rdr19l1nYK55z8YpxKA+aIDSfv9CKCpRE7gPiHYdj4VALgDhK/8PFu0aWb9CE2iYpnqNP6w2i6OeL+odM0Ygl2NG9Nil2R8aVVvm9cwgZf59uTY6NnCtPq3MBdJIIOGJj0sMRUhEJM0nDmIhqtRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696890; c=relaxed/simple;
	bh=vzU0w8F+HlGmZx4KQqQBaCbBovkeO3I44GgdCcYCp6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0baKffpb9daICQz+XT2Tz6tQzbIb9ly4h7vqsJDur0dj4SGesI2IbJkszc1BycWrVmHtk+izQH28tIPWgYrFf21gsC3vtFo1jHTyde1sz/q/w1KIQVqcC07n2WIAT+9T4rl5ghBg6+dmPwg8HFfCUrZ7VGg5L+4UpnGauY/xR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T7t/1Vfi; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T7t/1Vfi"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so5444027a12.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790696887; x=1791301687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=T7t/1Vfi527yjm8fwcntOJ4OBlnez5AQFLbijEyfv+P9SVGUgYF1Q7ioJNh+fiNrcN
         2ILlUJakEn7D0S02HMFntFSFOzi7x8SolIMFDvUZR2K5tmQRjiDtEFvuHVgFrf3nzO3+
         zSQBHFDBikbCH92HS6Kp59ntZ7Q/kr1FFl6Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696887; x=1791301687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dZbuYFRWaYPbHqq2vBKMBfGE1dD5iM+GHzPgRrdI6c=;
        b=LRl0WpisM/9ZA0VLBinDIamXB26Vdt4QJzronUa57YgZDZuVWvtnlmhyfiEZLxJSio
         Te+uVvneO5Z+AKqmJJYnfdXJvVSpnhj1hLTAqPLFmgz5/nolWsqeR7Jz+GYDW/vndVv2
         PvNFkE86jsOqQf6CSjXskaMmXOcnZl8VqiWM7hQ05a6wL6hK80Tq4IZC4nzbZIJGRVcK
         rGKeuLH0aTPzdxJ14Nma9Q5TG2U7wuTDstatiaxAjDLNtuVusBDr0MYe6OPlWQpgyI8M
         sHV7ggLgbdyV1VmuqJhAv94ehjNAABsWEfB60US5YHRfzuU280xnrTn6GHVsiDrSvemG
         A3oQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuAD4N/zidF9rlFgcFyWa5wCPri1grwWP0CUovXdwUgFUmCgdHFlAMelFlofZG/r32PcNFFWNJzKR9@vger.kernel.org
X-Gm-Message-State: AFq9FYLnTaPHp0xnfwiDI238e4FfakOimB7Pn9RbZON5rDAHEFrVreKP
	1m1bxhvQ7yAV8RxDlUyr8yHjyEa6sR/kWUCZoKMI68ZAkbUVkYTiWzXqJszNSdMJU+rNuW0y+c6
	xX2NweNU5
X-Gm-Gg: AYBFou0zniVbha3cXOnU0yYYKZAEoeglAfiA1Y6vu/rp6dfzwvKb9R7D6hiPBez3ceT
	DCc96/0fEgzwM86No5IkxhidPftX79kXqt3Qfs12Z/JtiPNcOSdrMTq6Iglu3w52jizHKk4vPYt
	UkGjPRcToYqu64MsXWGZMtaxrg5myMTTqJI/exANg+GVMhRxXhc33S4eWR41WrFj6k3pJ4q9WMW
	sPphMPDoSMsuJ53wcCk5MKxcwmVy3pWucklRh9p20bxzsZGvi38veAtheqTXh+VjF3OoEWTQQ7m
	OHQAiLa4FDBbsNSggNpTk2U9EqPGtRF6IPuoUuC5zgcv4IQqH1jjeDsRiZEqRUptitoPXya8PLk
	1g8ccEaRzAYXsY3/fNB+STTZmVinzS+xEVQwrcY1DSNcxDA7HPFXJH3tQRq3svOexmf3S4td4K6
	TyHa76m3vLsmyZOdEOlJcOlf/RkxFKBkUXiiTGIEvnAZADdh+ahmxznWWeHzOMGzCA2/Gvn3OO8
	RVCn2yhR7VedAboVR/YVlWJMExZC8zSFoccg+8=
X-Received: by 2002:a05:6402:52c3:b0:6ac:c1fc:8a86 with SMTP id 4fb4d7f45d1cf-6acc1fc8d1amr601370a12.24.1790696886622;
        Tue, 29 Sep 2026 08:48:06 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9037302sm1110792a12.28.2026.09.29.08.48.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:48:02 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so32607485e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3z4RgXNkdw8xJ1d5wF+q5yUDgOsfl6v6goyfoNAYcMU/mBO6LuDoIbzUcUdG7NwD5AU2ZgG6h5K0N@vger.kernel.org
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id
 5b1f17b1804b1-49fe66f4c72mr292995155e9.19.1790696879396; Tue, 29 Sep 2026
 08:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
In-Reply-To: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Sep 2026 08:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
X-Gm-Features: AclHuK_dL-VTDHnUEUTR3x2HZaC9uQoYf0vNl-UJk1UZAv-h2C9KslcOuDr2aQQ
Message-ID: <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Fix newly introduced DT warnings:
> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588000=
0:
> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
> child "reg" or "ranges" property
>
> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for frankel/b=
lazer/mustang")

Is the above git hash correct? In linuxnext, I see:

54edd8698bb1 arm64: dts: google: Add initial dts for frankel/blazer/mustang

Other than that, this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/lga.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/go=
ogle/lga.dtsi
> index 26a14b3a1b190a..919ee6619d9ee8 100644
> --- a/arch/arm64/boot/dts/google/lga.dtsi
> +++ b/arch/arm64/boot/dts/google/lga.dtsi
> @@ -370,8 +370,7 @@ gic: interrupt-controller@5880000 {
>                         reg =3D <0x0 0x05880000 0x0 0x10000>,
>                               <0x0 0x05900000 0x0 0x200000>;
>
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       #address-cells =3D <0>;
>
>                         #interrupt-cells =3D <4>;
>                         interrupt-controller;

nit: Leaving "#address-cells =3D <0>;" alone in a section, with blank
lines before and after, looks a little weird, but it's not a major
issue...

-Doug
