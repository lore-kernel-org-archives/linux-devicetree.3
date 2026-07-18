Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A75D279DCC
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373160; cv=pass; b=ValK1Tn793aUYwFatbgFpXHmT0kjuowFpSK61UQY7cMhF6FKS/kxTSX4KLnpDVMbBdmcnzUlrIdiR4dO1o1NKMGZi5/iZBowx7SQ5v3IYMxdAMs24FmXCkFUWb481iHBNfU8WhEF4F+RNrCUG7N0+HjXh2LsecQZbETK+2p31ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373160; c=relaxed/simple;
	bh=42EScjtq6o/oAWzBz1Fwn/meWWn2fcAqwFTx8DgQZ1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAtarCIv33NSzL+yblG/Oz8g1HxQNam9LuuRC8T0QCOHyS+/gamBrbtnniyXPgerCzDRd8klqCsvewdrqfmSDw87kN5cOmrRCrns2Bf6H+eKV2BGOnN9IfKMdp8E8ydrtCas2zvZUoIuB4U+JL8Vky428/4NR1NSupnHD1kWb2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/tqm1YL; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/tqm1YL"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664a5193741so1082411d50.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 04:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784373157; cv=none;
        d=google.com; s=arc-20260327;
        b=r4MaJG8Oj+SK1obNfDfX8UZNZzRir68SxWTsImFms9OxJvQuRq2rdMFZiT4r+AxRts
         LevDWvuDLGQuSJuRlsmtFWNDyvuTY5GCrkkp81MevqGjsjE0N0bCvP0tyeGoDPyukIvj
         xxaOAla2TvbOvmPPo1LewFtIyXTdQslmHk2GKs7soYXKOwyIQUEJY0xOt8dS7PRmmzvu
         JzqQkHfhZ7kNJ97p+HJAGtFkrkDv88I2Zeg0zgiZBDoie7hMa9Y9dEMHmeuAbsgVMGUf
         gGcn1EIpmzG47jxatqTxoRBwNztiI9iSJTyfd9H/8Y36E0XuVkNVXHyrzU85yDzbMZPY
         mxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        fh=k0EPpfKKs3XcPOeBk9g3/7vQ0xzGjyhOfu587hkl0Bg=;
        b=gPsd5Ml8eHYg4WCHQ9pRgZ68zUq4G4mnetBke3kfkjoak3R9W96PRwVsN9Vl5gLuah
         WCCTS1KK6QQCtw9yxxzvbG1hHXDNLn3a87evkbsD6394LSuXcRQY7quCQLXewH++vhKY
         EwYrwsyck07nj20F8Mio8Z9Bt9mQf4jRUZ6Vc1AE3ZoCNyqJnmESIf55ePMWL443dcag
         X8++iYuQZ14JrEohNrDu/qePPCG0pMenzOTS13fUuyYkoGb1uQqKkw2gWjuQ/pkQTEOy
         Zo13nd4upsA1N+9dtjUhXIbV8JEOFiGLAjGdCW9CopdvL8aa+oTGfit0YXo5tE68yYs+
         0yCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784373157; x=1784977957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        b=C/tqm1YLT1/YSklSnnLyodcfgsHy6RJAMRyzxLkIU5Bdj8KtfLRcvjCA/F0VGnI7Cf
         Wpx/bda4arGhWeaV8uaJokcCAe259g0xGXkJ0hoSghU+BVSKRjmV72MS5b/SwirIxlHE
         smCFLdeNU06ExwlOQzaGlueJ5pIwOK2/wUXyK8xR+HdPn12Wh0ZzhX8RUwY/yhrLhQY+
         bBj8jMv9f9+HHry56JlE+iAj0S4Y+5a+bv25m88QTwNQPw0BLsS/x8FVr4j+L0IPc1JX
         2AcM5uYbEl/83hACqr7BHTdTGOwl/FxaFK6E8mnh/1JAhqKExKGpMoPtO9rftWxG8OfV
         cAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373157; x=1784977957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        b=KAq3bz6Ch6HNMIIWBDOCSsM/qVPkLxb3vewr/adWsIMNWgBl6Cb1qiui07lViN4qOv
         /Wnzv67dDqFSmJrycucaLWmfM0GPrtPGRdHNjxZYoKqTKyDwP7Vt4MaRPNJqRgLuCtcb
         QxL487lRDgUC/Pa+BqqJCBnssLZewEwwTKMyS/Jl18Gql/aEMRdZkuD4Rfr1NnawJCWv
         XzC6C/BsP0F6s9KRpwdhjEp3oRdIkvjmqUDeuLxtbzPql4nCfGX6sc/SlsqF1YDFSaDY
         s7B3YBqlI60fzUsaDZBawNv99hx2ekzqg/mbg6PZv7R9fW3gVBpfNKxTt5sixymfwVIt
         ELmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCwJLJK3wHS1cMvJdyfvvMbQzzpg2wYQez72Rfy7GubVYRjcd2Tv0X0evFkrXWy3h2wdNZooDDoY2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzkrAFatL77pkQyl8BTPiNJ5eewQMgR3JiOx9qx4om9ZtCfebm8
	iN+Kohq2Thb8vMcP1wAhrbvxC7xhofa8ne3f8Z0BkyRzW1Ybdk6WNEdh7EiGVbJpml0CV0NrLed
	ZFsDLmWqeJ2mB7ZOsbboTD/ScnpQXpU4=
X-Gm-Gg: AfdE7ckKTp3iKmWccGdt4xD3Vic4wxDjE+hVyoTey73TzT53MJc1jZGdAtfrSihRr8p
	9LyVpbLo6kSMaUkMDuby65Qvcnn1xZxi4m8Yuq3pryjNFkM/i3fsbl8HwoVHm9v4ASfeO/32EDG
	PUKGJPsvWI2IQPLQbnyyRUx1OFHjHYtuBhScsxGdlqqcYd9u/7QmiQLMagb8Am7oLdIYn7+UtCN
	QLNZB65eLMWEdnqLdboxWqkOmdNdohjSUlzU0SOorgQvvFiYYgNjH6UKpwZZf1S2cUY4WNBbFzA
	iZfAiRnsGol9kqIC0cQ=
X-Received: by 2002:a05:690e:4009:b0:668:3d3e:17ce with SMTP id
 956f58d0204a3-6683d3e1caamr1668547d50.4.1784373157564; Sat, 18 Jul 2026
 04:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-4-royalnet026@gmail.com>
In-Reply-To: <20260718085728.6797-4-royalnet026@gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 13:12:26 +0200
X-Gm-Features: AUfX_mwGRLq_cQ_8jKTIfqRv7vemDXFXO-Pu9-yMhP9fEm6AWXK5YDte3V2WYyo
Message-ID: <CAEWPSH7b=KaVhz_Vhyrbj4mM2KANYSEzXPPqNSj1bW0xPLLRGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: add #sound-dai-cells to the
 RK3588 HDMI receiver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A testing note for anyone trying this out, found while exercising
the series today:

after (re)connecting a source, audio capture currently requires the
video capture path to have been started once -- a cold
`arecord -D hw:...` right after plug-in fails with EIO (the I2S
interface gets no bit clock), while the same command succeeds after
one video STREAMON/STREAMOFF cycle, and keeps working from then on
until the source is re-plugged.

Setting DV timings alone is not sufficient; it does take a real
streaming cycle. So for testing audio, either run a video pipeline
first (e.g. v4l2src ! fakesink for a second) or capture both, which
is the normal use case anyway.

I'm investigating which part of the streaming path opens the audio
packet flow, and will either fix it in v4 (if it turns out to be a
missing enable in the audio path) or send it as a follow-up with a
proper analysis.

Igor

On Sat, Jul 18, 2026 at 10:57=E2=80=AFAM Igor Paunovic <royalnet026@gmail.c=
om> wrote:
>
> The Synopsys HDMI RX controller exposes two digital audio interfaces,
> one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
> property so audio cards can reference them as a codec, as documented
> by the snps,dw-hdmi-rx binding.
>
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> New in v3.
>
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index a264001..fa100e3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -338,6 +338,7 @@
>                 reset-names =3D "axi", "apb", "ref", "biu";
>                 rockchip,grf =3D <&sys_grf>;
>                 rockchip,vo1-grf =3D <&vo1_grf>;
> +               #sound-dai-cells =3D <1>;
>                 status =3D "disabled";
>         };
>
> --
> 2.53.0
>
