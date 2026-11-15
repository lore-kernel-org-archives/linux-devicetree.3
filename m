Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755380;
	b=aK5LScm29xAQnk9V1XNRJmb3SvDiA9eQFNfqlL0ZeQeaiJ1Fnx68IZylCwL2a4AunS5t
	 Qi3VqFX4mp0b8692/65zlRSk5qYO33SOB/jjFYLqje8S6iUYSqROuHyAV7O7vuMHKiKgt
	 6YE30XW9xcXyjBmpBXfMSjn32jmYs+kZ05yLpdYa/t7Mii3SOsrgjGmEYinrCxpFL9z/z
	 3tARXt2tl85sKTTnt5I8Rt8q8WYaSzB9tGfgquBZY70cnTpQYgICv/B3KJ1bvByON1ljM
	 leepLSHhqXp8+mRHog9V8hIdJkW986GdaodChozvWEKwwsnn65nDnWNkHWyrw2NyPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755380;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	b=cQFwebeP9L5emul46YucPq/3iAXHE7fKj5effDvnvaHBBdW4YxhOs3RO5n6LMsG+3kZU
	 RlwODBs8dlXQFRxRtdFN2PLDVmJ0C9T7e/YsbG457/kXbg1Qd8kyoNnyFX9qB5x8MuLNw
	 ATo8Bm3deetJwvco0KsRAOOUDJZIKH5rCDpGcpCxTvEdY/1jYvkmdRMd5dqY1hzGq+kUJ
	 yGgBy/JOUFiimwcqoAuk6FwI4fh2KLmmXM7OYLCt6WrZTGLTYkelmG1P7RRZoz2lQqFsJ
	 ezt6ucgU4auwz63nVICJcs7XfJjQPrTeGazsdjVPUjKYYbLxH+DicpHZJ/bBGFo9ObQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35003606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cANDfa3J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD641F000C4
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755379;
	bh=Cq6yUQzukHtwhYuWtD3CdG/vzfG7TEB1pVADzBcWgFs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cANDfa3JG/1VLOyWOyMbLnYziGnzSsHDw0+p48eFEhwqjIqqzBMypnlKn2KIJbBGy
	 Hq4EETBr2jUy034admevuoevndcXik9C6uGtap6cIMzgHvPoML9laee3OpAmf4sBiB
	 V6Hi3F0/36Jj6przMu8+XPjSpjPzA85GybC1zU02FANO/I/3EaUryQjljgHh/wI44D
	 5RYySKRVJXo2SRloVa8du07x2AxdwjTDUjUTJXlLIsql7MWUyVb1o93lvq6ZjrRX/R
	 dB0ZlpwIe039A6elGxys/Fb3U05iYiO1bsBl4w+OQaWaOFfVK9uQspK5cbriu9IOZv
	 IE74MzMSJVX0w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so27593131fa.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGr7zzrm2R3onAQ88GZn2oqry/0MDQo7PNFJAe9tpwaRehNnJEUgVpBcGEosAg4fbgEEHTvLAu2CO1h@vger.kernel.org
X-Gm-Message-State: APuU4Z9XuyOWWFymH+gaewelZ/+02lgTYM56UWAwN5W7qycZbvroOC0Z
	iFiqAiOqjaDF91x87WlXqpXG8L75Pxwd1mSLwC4K+gSKzYdaZEKyIBw3pv5Ea6FcdiwVnW5rQ9p
	jy8Kz8LgfUWgwAW2Xsjxx0ulPB1eGSTg=
X-Received: by 2002:a05:651c:1986:b0:3ae:25c8:dc78 with SMTP id
 38308e7fff4ca-3ae2b69178cmr25726671fa.22.1794755378199; Sun, 15 Nov 2026
 07:09:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.289236-1-jernej.skrabec@gmail.com> <20261115132215.289236-4-jernej.skrabec@gmail.com>
In-Reply-To: <20261115132215.289236-4-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 23:09:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Gm-Features: AclHuK8SfNxnDatVmiI32N0fkX-YaXg08NGH8ia-Bx19MDfSYUZXv-OL_jNzao8
Message-ID: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU
 frequency scaling
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> OPPs above the regulator constraints stay unused.

My review agent noted that some of the other boards raised the constraints
when CPU DVFS was enabled. Do you think it's reasonable to do the same
for the OrangePi? Or do you want to be more conservative?

Note that I already applied this series.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 40c5c42b347e..a2a2e4cb0256 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>
>  #include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
>  #include "sun50i-h6-gpu-opp.dtsi"
>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
>         };
>  };
>
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdca>;
> +};
> +
>  &de {
>         status =3D "okay";
>  };
> --
> 2.43.0
>
