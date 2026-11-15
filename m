Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794757322;
	b=iwvDV19nem3m6q53c6XHdCEwj4t8/xiYl1vVCx+WqHkzzlJOSfmUprPxWNIxYtSq1vhW
	 ba3Xtyp5mUAxhhGq5fP+HBs5vAPCX4SZ7YmddggiLLrTYrlqJmTwG5EpvZ9Jwdd2blKiR
	 q2aQyN9UjeONq9+dNNOd7HuxKTvXk6W1erdPfP6icr7CE1244z9mrdiUiiQEQ7erNsFOo
	 6+ih9uKjAFLGiTZ1GVjrRC8KN0EstLGhn6cUtFiTnFHoM7bhZRA1q6JPgfhUwivtiuQw7
	 Q5N3UsFPLk9dMOPBTZPtDkfY1Kgy0Hol4YHW75Kg+ITgHNszGKWJlU1dJxzN3rotcew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
	b=zT1YOtqj2K7ScD/Cn3AFQAFO8e6dcCwepI4chh/mB6TnXmZZQBi8ts4RoGy3tzA06cPz
	 N6josla6gGa1jtjM4Ig51l2hs2a7mgfqoXDCpZJ1pSJVnB1MhymiiYYeAYiPrRDKQUYM+
	 rDnlW/xRBpqq95NnwHXWJexKNjL0cAMmd6XGc34m75COrG/JFffweNLq4tysF5fOHnjIE
	 43ORfQHO4x8oHHxG+tAKQuF47t0TXk/q1N7X5sRnJIAO4tDpPdNUQZVr6Yp/kD737QVcp
	 1Xvc1Qq/u/AQLDiCjVn2un7g8chGHJJ11sTWdguL1BpmvWEpih3kwFj4Qxdso3og5GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+Lw0+fG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EBD606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36EBD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+Lw0+fG
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso2730544d50.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794757320; cv=none;
        d=google.com; s=arc-20260327;
        b=SXHMrdSnyf+TAueUDSvnBuOQEVQIHuOBuuPGVscNQ1H/4gtXxjaTsgL0jQIYVCk0+5
         iLEckGo+lzSsfTDhJEUKDfpIW21Oq47XiKGbc5CDoEggjRZ5umy7jrVuZavYebjoewEB
         5SZK8Rdq/2eRrqG6hxaqKJ8Wn4Lt32x86PSNTXuCD2M+ExLD5VeEVI5GRl1UdMreQfmv
         RUB5BU2UXbDobhYcZl5fVeFPHRZQwSgpIBYfKBJtRkSGlqdBXZMyKKtZF2H9PzVzOM63
         znou/DzxiawkNMrJyaHN0OmJaDDfFW454SOYeGZhCsY3ObGrJAyXMaKVijl5bI2Ebybd
         ZjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        fh=fQLxtVWRnRl3k1YqdEwL6utV3qizfVWFuwVTPN4TXZI=;
        b=JqZhYs9My+QLuKHINKDjuKl7L6nDsc62DBNxV72SQKoQyS8ydA0oOa5qwcXAp1diRx
         yUdar5D/Xrg1i8RlAu/yDR4mOLXGrDx1jkzYtqhwDMXZkstubbOr6Brg8DAu1fKL0Xkj
         ja6zs+mh6QFs3GF136ByOVuPEpNQwsMLGJj/yF54cvLW0Y5M9meHyyNjRGK57kCcJfqm
         lUl9RI6IrXI/WsT9gQMwh8mkuIEetKmHjzrMv7u0AH9frMtKvYSDNvNYxWbiH7THcavf
         vwqSN+ilql2zrUJfU68rt1zuQRDx+hKNnTZq8iJgsEJbKav3r2K9yt7bFrqDKG+DTsoz
         6qzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757320; x=1795362120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        b=u+Lw0+fGEwnsMts5plO615IBT8mWkOZSG19nR+eOkB1ARvLDkFzNhwCHkTIk1uaLYN
         NxBVG223K6iHF5QqFD1WRsXx/u/f3GXhApT+6SIApEwIW/N/HI8o2RxWC/Eh5ByEaeQz
         oHzDBBcQaXmpug2I9j6SR5oFS2IU2WVQGT7/o0p1nVgtfTaI8oNYxJRzVZjLMcGx5saL
         o1y7TFOryoG4Z/zPF7xcXhxhJwUlle51sRjt4ohFJim3lGD0cWFGE4a/9Qa0VNwGfSi3
         sIaM2vyeso0PJSx5g8oGO10tsLpv4Apmf5i6arpUjnsOoFIbdkfw+mdWUjQ6o+nZMRyy
         XHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757320; x=1795362120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        b=EUx8dSl+SQOUXFhyxM8V5jIguFHRw3nqzZ+kitzl1lrhbEdSBykvGdVRrGIK9rGGSP
         ghxdsAyAFXJt1yfVg8TI+WtZk3e9dREv/K1AUaVsOfGLCQK9W7R7OMJbWXUYGPkDNCYt
         KwCpOq8Mw1TEhlSTc1Eo/wWKfJXypUjTdY1I5oPcYWeVxfnXtQz+2vWCPXhhXHYKpTQN
         0lW8e+kT0H/ixd4zViGUqQjndfsAdqFBFQEB+m+j/OIWt71wfBB1cbdnBnbTkrO1A8jS
         fpzcpBbRm8kRJTBxKwfGsCVBUnBbPVz48jDar7dM/CuFttJUdOmrSZKfEoHKHskXX361
         W08w==
X-Forwarded-Encrypted: i=1; AL+hErEGTJ5SJEK28zzLobiCqRqMGHddUFbszmfcj8uTOXNuheBtntSvI1ty6bnB2El7N0OYFDpx1GD6gsqA@vger.kernel.org
X-Gm-Message-State: APuU4Z/W8FVoMfmQp1qPccKzNasFe7RI/otxIle0TzFXzQ8MbLBMZnWV
	jQ7tujRazw4xc9zImLSYVXMjs6+j0cjIRTRCTXD4v2rT+TUbyo3SEYiw+DtBSsM3zR9tlOZZbli
	ml9Ne/lgV0+5/8EUUOphyY9WudR7U+MU=
X-Gm-Gg: AYBFou2/5Eh6SH6AUvWJoqfIi4egD/6NXnjxYTU0HcaDcHdfOb0+jKGF0rafPSgXfJT
	6+dXVsV/XrEqMNo1+f+mkggYThKQz/xW5LdFEKn17dsaqNg3R7fZ6oZHFqOW+Dcr2uOZytNA0rF
	eB96Of15zrnz09U+1vpVn2V9ZjOs9rgyOZLiY4dsXXh+mq0OgSgdmrldd0FvqpFxzJBiUvRM/qz
	UkoLkVerXOWkhQeiJhS/wH5vWIY7nihLjh1tOeUhPkEgeQHtrnYH1j9gnGsuUp2dNUXowP0e2En
	MAS6+xumFWnR0jIKmWQjdthIUgo5dguqAsqf0o8+ZKbnzutMCVrYYDFpStoXraOEqAuEWkyJskR
	T1NvgR6GK+0lSbzjCPFrlRi5kYkQJ+GQlCKU4uJVVfu50/76lcBV0CmSn80cNpkYd7tdUhr0=
X-Received: by 2002:a05:690e:419c:b0:67c:443b:7437 with SMTP id
 956f58d0204a3-67d8972f769mr4176218d50.81.1794757320129; Sun, 15 Nov 2026
 07:42:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
In-Reply-To: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Sun, 15 Nov 2026 15:41:49 +0000
X-Gm-Features: AclHuK9XI2phd4ElF0I4ZWo1qXh6X3hb82lItzI21-3DRYQCtspJfYTGO2-pD7I
Message-ID: <CAN1s30rP9jkTp8rmyFBjp9FtmZO9QTXNXqawpJ1nZbusFw59bw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: nyan: Enable the 32 kHz clock for the Wi-Fi module
To: volodymyrchapman@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

In the interest of transparency, (and to meet the kernel AI policy
outlined in Documentation/process/generated-content.rst), I was
assisted by Claude Code (Anthropic) in creating the patch described.

It inspected the device tree and clock state of the device (HP
chromebook 14 G3: nyan-blaze), identified the missing 32 kHz PMC blink
clock and drafted the change and commit message. Warm reboots were
scripted by Claude over SSH and cold boots were performed by me. I
have reviewed the change, understand it and take full responsibility,
acknowledged through my sign-off.

My best wishes,
Volodymyr

On Sat, Nov 14, 2026 at 2:13=E2=80=AFPM Volodymyr Chapman via B4 Relay
<devnull+volodymyrchapman.gmail.com@kernel.org> wrote:
>
> From: Volodymyr Chapman <volodymyrchapman@gmail.com>
>
> The Marvell SD8897 Wi-Fi/Bluetooth module on the Nyan Chromebooks needs
> a 32.768 kHz sleep clock, which these boards take from the PMC blink
> output (CLK_32K_OUT_PA0). Nothing in the device tree requests that
> clock, so whether it is running when the SDIO card is brought up
> depends on the state the firmware left it in. On warm reboots it is
> usually off, and every attempt to bring up the card fails with:
>
>   mmc2: error -110 whilst initialising SDIO card
>
> leaving the system without Wi-Fi. Toggling the reset GPIO on each retry
> does not help.
>
> Describe the clock in the SDIO power sequence, as the Tegra30 Asus
> Transformer and Nexus 7 device trees already do for their Wi-Fi
> modules, so that mmc-pwrseq-simple enables it before releasing the
> module from reset.
>
> Tested on an HP Chromebook 14 G3 (nyan-blaze) running v6.6.144: with
> this change Wi-Fi came up on 8 out of 8 warm reboots, against 1 out of
> 22 before, and on 5 out of 5 cold boots (4 of them on battery), and
> the clock summary shows pmc_blink enabled by pwrseq-sdhci0 (ext_clock).
> nyan-big shares this file but was not tested.
>
> Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/=
dts/nvidia/tegra124-nyan.dtsi
> index 89a749c..c98de0d 100644
> --- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
> @@ -645,6 +645,9 @@
>         sdhci0_pwrseq: pwrseq-sdhci0 {
>                 compatible =3D "mmc-pwrseq-simple";
>
> +               clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> +               clock-names =3D "ext_clock";
> +
>                 reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
>         };
>
>
> ---
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> change-id: 20261114-nyan-wifi-32k-9964d3513b7e
>
> Best regards,
> --
> Volodymyr Chapman <volodymyrchapman@gmail.com>
>
>
