Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179199;
	b=f6/Gz/32fqW/wgWd8EMciH43dCdg5li3yOzAOHnEKtX87L5C92K9YdikdGFe3uHhVBeL
	 xo2eY+G/IzGStXD3n4AtHgKset6Mkpgha6NHvHAADycTs090d9X5D9ca4kHlSEMhpxTs8
	 6Xm4DjZ4y7xsqip49dtVhJ9HwAsiK32oTjlPjnxNxkhws0jLX6DC8LbP7TrlBRIeYxXc9
	 TkBIWFjR38AK8qkwEZyN4mLeQL2vBXblnI9+wSqwwlsvqcwawAy1KPPvzGrHp2sJZBpTl
	 G/DWHQ5Yu9tTWdqpa6gHqME8GMJUpAH51l52NWf/2CV4Eir0ZqOnoSuRpq1RtO5ZDXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
	b=KqFJc8q5xcbLzpPmipCt4dVdTZIu6naGucg1qBB5YJSQNh8LzPMBXo1y8Xk5aU8TE/tM
	 49vgNseja7gendvRLSBT6qsP7bkjWj80RjGr3N+YSZbq9x3IlPrUBHSqfvPzL29Mr4WVT
	 4d3Ag1agKEEGsiXhmQP41zfpr3NJflHAT4tUqNsg5ECUTBuMUaicQg+aWyHQQ0nLc7n13
	 EN+JMwvN7ZH3gGIVSxEwSiPPmV6+MV9J7BXiQai7NeFDu9AxsZDSl7jUMro5O1O8uAwgJ
	 hEgW3Vs9EGoizLgdGTrG0JDoFXjXMCuH77gWbKOgGu94lVORUBNZ9RoVBGXqP/heCEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=p+nwIxD+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65F606A33C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D65F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=p+nwIxD+
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b10d24345dso7965047b3.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179197; cv=none;
        d=google.com; s=arc-20260327;
        b=mYCh6TF1nTKgEWlXgFmZ3/QXvf4+mel4XATjX2Be3IcVX/JWy5AahTf0KmMRoW8JsE
         GuyeRlDx1OJ8+IsE9lRHCnIwLN7EF2WEjalDQzaGqXkRZBFJHek2OHOwJIXPq3N0+9bs
         jlZDDNK13cCeqBYr/Vs168zdpVpLqzUty/RuXI9S+OOlNrOePgZhvVRbGUsBHnhBY1K6
         SPCDi6+b2fKj2Yzjgr+9Tx+Qf2JTDx9IAduylsPL3bntuXIO9UAay3gna1FHscTB9dQz
         hMWoz5XOmyHSCGlVjAyjZUHS5s6BKo+jvs8tD/2LvLtXn1ilb3ViY6IbBeo2J0SakWeD
         LuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        fh=KbaNBTGonSxuoChDNU6JRTOU9Sy/ZrtFwa0YeA3ik4o=;
        b=TWgv1fLwgHhXeqdnnycPQm4TElU+tStcSP195EA8RhP/g9JOp8skXmpY3BPDSkZ//Y
         Yv+RzTv8upK4BNWvpsDyxz8BpGdwbhWZWl7Zh9RFa4au2j0sNk+ftQyBjgOgm1emqbTD
         XyAiOs+jvgCMVnynE/PQYrxubxvdo0Uidffh55kr8AOZhdrbvE1b9ciriNXi0Hvvheks
         9EQLzWp1+GqMet5Q+H5dfMz7HAU7XuafmwFl3COFdhAWGY/NTlOKnd1QzMjW3zGz5FO/
         N2U0m+nJHS1kXESTxiHeX5IuOVZ3bM+rh7BM68khzshj3bKAm+JBEt5Y7SDBSqdAtNwd
         B70Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795179197; x=1795783997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=p+nwIxD+6yjLv1XlsJns5B4Ag+p0R2HUx9b44padqWJLRazJNgxsCKlVLlFVEP6dHS
         A6CyQLQvWj9Hxefmj+Z19165TNUbh1OBDvBpFGrFNdKP1EfQD2udDxQuIQrS1kWHpCZX
         Wu1hkW3yYg9WWYC9lZSc/VjK364nRomo1VAWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179197; x=1795783997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=SOKxc0IPBpMzpltqDnLLj4j8AG5O8w/ZKt72Hg/ojsjhif/d59g6IxdKKmPqa4PxGd
         FMLv5pEMfQ0jznC/FzZGBTSrMI7+bnkZL1NPOvMzk8MiyY/TwbaVS1GMNnk9rEWcz5pR
         CfBSnQYaT/oLGf8COto/BIPEpM9PDJ1k73S5ZUjRqCgEyeO9W0ThsxoNy2o4zvj3d4a1
         /fo5J32j7gt1gLo1h/DZkP5o3Z4WrU+qKX500Ji3M38VJ5b/b3Q3exjnacIwIsl8/u7I
         0tjq4d7NPS0IvBHT9gY1bFqSn38XYCsi+DLzbzEjpQgfdRcth+Fzb6KCWT7BbxjzdQlf
         jF2w==
X-Forwarded-Encrypted: i=1; AL+hErHtNlldooUXU7FEG7EyTFIznxnLVXTVkoVKQsKDtXLnN146g7RKQojomw5iCQhFyg/nEEFYilexKib9@vger.kernel.org
X-Gm-Message-State: APuU4Z+0pd8lrL4VyjvuO/GDFpUGrVxmU7oB49yqK1uDO5P0YJbbs2Xq
	5sRyL07FrRws8J9GcH1pfj9whFtlWkqT9sksspUNBGuc6sSqCkCTAWt0FUENqYkAzSjQ8BFTcY8
	1kHRZ64UcetT2Yibsv6WpwBftWqGqWdt54+HcRbEkpg==
X-Gm-Gg: AZFdTZdxe/Hq0Jg0TCo0zSzzfEfpvzeaw7yXN99pDIuOkPIc/4CBDy1gjlobo3ecB1i
	I5J3HXPFSGBctDl1R12VLVFHIb14SVRHSZBgi9mNx5i+OY9J2zf0q98w8lHGrk9jaSd/au28ONm
	0Qigx2xwzLys1Ol2trPYM4aU9I5EzLEPYxxx7yzTN9EZWlcd3qiK3teMjH60eGZyAjKrN4UGMwc
	KKMu/L8VyQHlhpILVtgXEZZ6fT3iwgxaiimjAiHOAH118Dob4W6LtZKkqHy4gq9hCdGRpiSsRiw
	iCT0UFnpGJQS9b1e5n7WXIswFEYvJE6ovDJNfoB24zZ25U0QvUz1m3MrdmjL4GhrJ/q6ondVE0z
	sUjQQ2wkqUmSc2K/TTJHN/9FXQibS71FaLKg2EvRrrftIupB7E8Qn+myU7LRW3KirMQ8=
X-Received: by 2002:a05:690c:e3d2:b0:8b2:e0c3:1f4d with SMTP id
 00721157ae682-8b5204ab2a6mr13766787b3.37.1795179197354; Fri, 20 Nov 2026
 04:53:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 13:53:06 +0100
X-Gm-Features: AclHuK9f8_4hj4WZI7U8R_PPW4mheeI6fjAZW22lb_dsLGyAMF1kCmKW69Uy0Cc
Message-ID: <CABGWkvoKQksL0vKOi2bLY5o3j998SzkAhdkkP4_ftySjbgqBrA@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH
 2.0 board
To: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Fabio Estevam <festevam@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefano Radaelli <stefano.r@variscite.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Gentle ping on this series. Patch 2/5 has Krzysztof's Acked-by, and
the series still applies cleanly on next-20261119.

Thanks and regards,
Dario

On Fri, Oct 30, 2026 at 5:35=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> This series adds initial support for the Engicam i.Core MX8M Plus Fast
> Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
> SoM.
>
> The support includes device tree descriptions for the SoM and for the
> C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
> LVDS display (C.TOUCH 2.0 10.1" Open Frame).
>
>
> Dario Binacchi (5):
>   arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
>   dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
>
>  .../devicetree/bindings/arm/fsl.yaml          |   7 +
>  arch/arm64/boot/dts/freescale/Makefile        |   8 +
>  ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
>  .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
>  .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
>  .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
>  .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
>  7 files changed, 326 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2-overlay-am-1280800w8tzqw-t00h.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-c=
touch2.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.d=
tsi
>
> ---
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> branch: engicam-imx8mp-icore-fe-ctouch2
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
