Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188251;
	b=qWScGZtQpG7huyxL1xvJcabLmhqxJW73aRMh7KB01L6ec9BPpGz+Qs3La+KHK8QJjnjc
	 NB+PYUEFe5DUd7+HxS6DkrZ99M04WZ0tHF0NqQObojRmJjX2VDcvwSkB1czq8sL/SYH+Z
	 SXbh/bTWVziAZn6s8viLJPnrnD3qHqbwFEmq75mrAdWLDObpASi8qEVuAXt+jGkBsSXry
	 yzxKzzNC5vps76Z2U75LRCWFTcpx6YTTbXcnJz0qY7Gzi/EPXi1KD5JWTr1LyyTuF0VDr
	 A3pIPViO+LThd0aYIQsVHlMeUIWOy1uWzlY6GiKZFkvvCS9ozGlnK2e82nbFuY1PKDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188251;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mm+qHNraHAaYmCtZVnhp9nAQRT/K0rmVdDUtGtzHsiA=;
	b=ryl1+nNTY8l61RVVPxa69UviigOmf1EtwR89P/ipnCTMWuMAj3xb+r9QT6GCDQId4n+j
	 3ep/AMZ500LgUItVURwcUMfZveTpt5KfGUC9Zd7MTwmeRnJArSVaGXtBaE9Qs8U4GgSpN
	 1ximeKOSPtsFzaaBAu4BGfnZ4J+0cgQO+2Bp3rJjSjzYzbw72A3X6WD3mFfbfrJV1JKkm
	 GzzVCJXqC2vLYhMFDrl8vLmtNIQy4DmRAw0qwFAMDqZRClgNFjHev69OcyF5eVNdu1t9S
	 8fcqCli4jzumsNOHVT0MDOtQW94VDaw2bD5KoZG4VQcxHPsFKKyYFvZ43deVuH3rgZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxZ5pY6h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B5606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxZ5pY6h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96DC1F000CA
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188251;
	bh=mm+qHNraHAaYmCtZVnhp9nAQRT/K0rmVdDUtGtzHsiA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dxZ5pY6hpvvkugXfXEAfNhOGp8uNhqCP+hzd3pa6YdiWXx2uk/+rtfuTJLBdk6cs+
	 qS1tr490X6WIEnmwcsfRt733uAq29wTnKlsisPj0RY/GSLNWL6r8Fb6JAbNpFVSzdL
	 dedzCJpv9yEv6A52shcqzq97G0JWkgRZg231ydYXOenvX1Ap+S2Zo0CSpD0HKT+jSE
	 YXTSq0BKySABVNKPNZNb0Q41ZHY7yjygeGfwGQMaC6RkjcYgTwVbQGQq83+KojNaC0
	 Cqa6V70ZwsDW45g0oaJBA++Q7E1xzHWiu9VtUXzhLC397/JbS7rDDx1N1GZ+lYacQU
	 OsE4YJtLubXLQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae417eb235so8425621fa.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:24:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGxcj4yXqD66mVDipekIqPwnWCeeRn8gft0b04PlFUme9jbqt+5ED0Ny11IvhZJT3+suorNcwQx3u4T@vger.kernel.org
X-Gm-Message-State: APuU4Z8+j2b3u1bdBn/X1rrHfN9YnPj5+ppGgCcujhy7h2659lIGsKWa
	7eNew2o9EqdH/rKHHNLcHoQPiwKN08y5MsrTvddRZNMUMSw5iYJfPsZY68SLPbTsWaCmC4PTHIC
	VQHhYP4yVeCxDL3Uf6kz3i4HrzlvtxqQ=
X-Received: by 2002:a2e:ac01:0:b0:3ac:f350:cd66 with SMTP id
 38308e7fff4ca-3ae7fa81427mr10056821fa.20.1795188250182; Fri, 20 Nov 2026
 07:24:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:23:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
X-Gm-Features: Aa3M54p7k_v0KG9p7QbnfhbCu32b9QTmLjHC5sxgzpf1CLcce99IzZXup6e1Tq0
Message-ID: <CAGb2v66=Wy1TEy5KrQt+TmYPowryx19tUN14QTREn9z0dOaJgw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> clock, which on this board comes from the RTC clock output (osc32k-out).
> Nothing in the device tree references that clock, so it is disabled as
> unused during late boot.
>
> WiFi keeps working without it, but the Bluetooth core does not: with the
> LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> Read Local Version, no firmware download), so the controller can never
> be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
> makes the controller answer normally.
>
> Reference the clock from the WiFi power sequence, as other boards using
> the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: osc32k-out stays enabled and the Bluetooth controller
> answers HCI commands. Build-tested only against current mainline.

It stays enabled only if the mmc stuff is working. So besides the changes
in this patch (which technically only covers the WiFi side), you should
add a proper bluetooth node under uart1 with all the resource references.

> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a Wi=
Fi/BT combo")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 3eb986c35..34d6c1468 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -5,6 +5,7 @@
>
>  #include "sun50i-h5.dtsi"
>
> +#include <dt-bindings/clock/sun6i-rtc.h>
>  #include <dt-bindings/gpio/gpio.h>
>
>  / {
> @@ -54,6 +55,8 @@
>
>         wifi_pwrseq: pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +               clock-names =3D "ext_clock";
>                 reset-gpios =3D <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
>                 post-power-on-delay-ms =3D <200>;
>         };
>
> --
> 2.43.0
>
>
