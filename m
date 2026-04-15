Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83B13D6685
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264583; cv=none; b=HhqDOvRJ95sMYj1PNhQ6PfZaHQbuLhaRpUN9AyHXIQCrwXj1qlOqkpLQW9Rwp+pSLZQeYx2ik6Jrej2i5x7kkOKN8sEByCAWBtt4SCnz9EHUltJw/jXsW9+K5Ev6Fe5O7pvCCH8gfmNKS/Ffe8aXWDZYEEHlsmaOi3USczp3s3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264583; c=relaxed/simple;
	bh=juEBlh4abpw62zfX/0WhXbjRrcDhD2/fDZaQEtW+Qqw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PAYkQ/xwBO2JU7APtAL6oA8irxrSxscKrUE8+Io0RDi742vk/0oUnrOYPQx2vWNAHc5dwijVFvrOhAPGRanzHB5UbzObvPpGC1Mbxbs6XgzMqgSPmt+wpiMuOJMhL1r0X8I1XVAmxuLl1ko1PP2mi2q2GFJ1jCjgwSowTmmwCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=BcwuYLGQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="BcwuYLGQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488971db0fdso68465515e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776264578; x=1776869378; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=;
        b=BcwuYLGQBfvhFXGJAW1ReziY+adpGVehGRg5N8OLNEDgGnM87TwEn1f+oWsqfMSa1K
         BKBz0N55z9PiObaScmwNPu4K0g1v+jqyUGbpVIBzpcQTFDhAaE+V3NARmQr9/MIFym4G
         u4wnJH7e2FBxmV828dXxm8IYw7me15uC3t7mD1l6EEKb1vxxuVU9MBpFo0csxyOIlimU
         dzMQvS1AyjlQi6kdAWG5xglkoQcu9dH0giUDeJraQmpyUltEo4Vk+sVC98+iELvZJU5u
         tigSwYOsBWpsJpfiU/49bswl4Hn7+jgr5duva/TaJKT//h3Z7YHpxgYAyOhTS/XBeTST
         0m/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776264578; x=1776869378;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=;
        b=sFMs77VNfhRDCynLfRLv8vV8F9A8dUitVU+pvPLdvPrk3HGDxrdma0JDrG6duSizHq
         Ay5NmKaMMh6OidbboobjE9D3cn0EzbnhJiduRimenfcfYCX67wzFbaBZxsPzmUgbg2XY
         +BBbDh9GHe/nFZ17Pzn7kpVHL9hT3+5xzAJvb5hHCSVSCYntoUoBHPpkrN8s8Y2T0DNI
         yYLgfBatlc4p9hjkKpUJARQRvukyCcnB0gzX1OCEDZax75r2waUg0EjwOWaCPI27y4IM
         kPS3TwFHxKqdyYjEYT8t20Crcqgs3YvNtCpenBSky5rAxomKz7mgyGgOyh9qMdMTf8i7
         u4MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3O9x+WDq3gsVJOPPaWLJ6LLEKKmjkK8UZi1GtaY6X6vsU5b11AdR9NFMVaUJ+rwDYcI3SI+VeheH4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe34V073cDYhDxOAfbXvtWyrWgdyPUMHBeGMdt8bKZFGHvUEuT
	eqCglgQQek+yVxeWWRy3L9nI8o5hPTPjFFzyXftIVKjfP942HALHGBgOFzJ1zAFnn/k=
X-Gm-Gg: AeBDietGgnIjLgrxRsg1nvJPCQJp+xL24qzDaBjEwdBjU6kNdle93p+i00ynfiWIQCY
	vAOvRMgfujetUB8SR6kcqSrCS+L7eDd0uDRenNqB19XWbLcKPMaRn00motMoXgu7n2hPoJmUOJA
	KzeWiET9gzBK4isuA3FciSuLjnpZlRwd1+p9jI1bNIGbiqJgb5m0t34UIF8kiGx/8TXI7UrHWc1
	FtaqTJ65lox1zOb5skRDiwwXwLwEu2qXxsvgoQk6hnY81C2OE/pLT5ZhgFbrfqTEosOcH9Zfq3O
	00+k7+DbhN4BAWfbyZpJ69ySq3oApqCA6rSvRb5VH3zk+gP132XYiN/DOfc5jgzu286Em6orZnC
	MsLGoyeKMbmEB3d67KgavbOAPLnt3DV68lJModKdvQwGI2tnK0SV4hlT1rBQzTTo8gXyCsxKUeQ
	tKdkgswrO2+1OIMFhG5fR0OXKSTc6N4+sj
X-Received: by 2002:a05:600c:871a:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488d67f0b8fmr318861465e9.9.1776264578172;
        Wed, 15 Apr 2026 07:49:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e64b:985d:5292:5ef5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488f095e68dsm38307595e9.2.2026.04.15.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:49:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 00/11] Add support for AUDIN driver in Amlogic GXBB
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com> (Valerio
	Setti's message of "Sat, 11 Apr 2026 16:57:25 +0200")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 15 Apr 2026 16:49:35 +0200
Message-ID: <1jh5pcs2gw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 11 avril 2026 at 16:57, Valerio Setti <vsetti@baylibre.com> wrote:

> This series adds support for I2S audio input (AUDIN) on the Amlogic GXBB
> platform.
>
> It has been largely reshaped compared to what proposed in v1. Instead of
> adding an HACK commit to allow AIU to export its clock so that also
> AUDIN can control it, now the design closely follows what was implemented
> in the Meson AXG platform. "aiu-encoder-i2s" becomes the shared interface
> for playback/capture and it controls pins and clocks; data formatting
> is implemented in formatters which are named "aiu-formatter-i2s" and
> "audin-decoder-i2s" [1].
> Formatters are DAPM widgets which are dynamically attached/detached to
> the streams when the latters starts/stop, respectively.
>
> As of now only I2S input is supported, because it's the only one
> I could physically test in my setup, but other input sources (ex: SPDIF)
> are also allowed according to the SOC's manual and can be added in the
> future.
> This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
> NXP SGTL5000 codec connected to its I2S input port.
>
> Since this work brings GX platform very close to the AXG one, once this
> series is accepted, follow up work will be done in order to unify
> GX and AXG formatters so as to minimize the number of implementations.
>
> The series a bit long and it includes changes to drivers, dt-bindings and
> device-tree. Of course this only happens because this is an RFC and I
> wanted to give a full overview of what will be the final design. If no
> objection is raised, this patch series will be split into 3: one for
> reshaping AIU and introducing formatters, one to add AUDIN driver and its
> dt-bindings, one for the device-tree changes.
>
> [1]: Different naming for the aiu part is related to the fact that
> "aiu-encoder-i2s" is already used for the interface and the goal
> of this series was to introduce the minimum amount of changes that allow
> I2S capture to work. Renaming can be implemented in the future as follow up
> activity.

Thanks a lot for this awesome work Valerio. I know this was a lot of
effort. With Mark and Krzysztof comments addressed

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

For the next revision, I think you can drop the RFC tag and split the
series.

You have spent a lot of time studying the existing amlogic audio driver
support. If you feel like it, you could add yourself as a reviewer or
maintainer of the Amlogic audio drivers. :)

>
> v1 -> v2:
> - Reshaped design so that GX platforms will use the same design
>   pattern of AXG ones. This helped removing the need for an HACK commit.
>
> --
> 2.39.5
>
> ---
> Valerio Setti (11):
>       ASoC: meson: gx: add gx-formatter and gx-interface
>       ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
>       ASoC: meson: aiu: introduce I2S output formatter
>       ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
>       ASoC: dt-bindings: amlogic: add schema for audin-formatter and audin-toddr
>       ASoC: meson: gx: add AUDIN I2S Decoder driver
>       ASoC: meson: gx: add AUDIN FIFO driver
>       ASoC: meson: aiu: add I2S Capture DAI
>       ASoC: meson: gx-card: add support for AUDIN FIFO
>       arm64: dts: amlogic: gx: add nodes for AUDIN decoder and FIFO
>       arm64: dts: amlogic: odroid-c2: add support for I2S audio input
>
>  .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  |  49 +++
>  .../sound/amlogic,meson-gx-audin-fifo.yaml         |  63 +++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  32 ++
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  34 ++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  26 ++
>  sound/soc/meson/Kconfig                            |  17 +
>  sound/soc/meson/Makefile                           |   6 +
>  sound/soc/meson/aiu-encoder-i2s.c                  | 219 +++++++----
>  sound/soc/meson/aiu-formatter-i2s.c                | 106 +++++
>  sound/soc/meson/aiu.c                              |  37 +-
>  sound/soc/meson/aiu.h                              |   4 +
>  sound/soc/meson/audin-decoder-i2s.c                | 218 +++++++++++
>  sound/soc/meson/audin-fifo.c                       | 432 +++++++++++++++++++++
>  sound/soc/meson/gx-card.c                          |  14 +-
>  sound/soc/meson/gx-formatter.c                     | 304 +++++++++++++++
>  sound/soc/meson/gx-formatter.h                     |  47 +++
>  sound/soc/meson/gx-interface.h                     |  50 +++
>  17 files changed, 1567 insertions(+), 91 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260410-audin-rfc-243bcbf95e43
>
> Best regards,

-- 
Jerome
