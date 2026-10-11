Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B44361953
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 20:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752400; cv=none; b=Kgv9+5usknLi+z13Kba7qZoGarkpG568wZgj/AU1idRFb85LRysERvbXioEZdh3cc4cBIWZ46gjraCeH2Ibin5NB3q+KkAXmi7okrgmCslFRrL3908VPagDXIq6Jor4Kh8p50h3P0KNBFoEPnYxuHxRGjffhxbyvkXalcwnc7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752400; c=relaxed/simple;
	bh=sj+OvNlkXhrrUwea5bnSo/dmUEu7N0+X6ExgI8Kx360=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VLoz0GR/LXwq37I1K8JLnWqoWzznwm/xnDWMjlJyAonP6EjRlynO7BB6cfgaP6yTJDzmBI7HJL3lMdKyBVZXqI4KLWLFl2FA+KqM4cadqad6RxGMMCTRwJlYevm96igkTKCFiNglgl7Pg+dmke/XEEJhv0+NNRVeigpbAGbVThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA8Sqvpa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA8Sqvpa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so12998655e9.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791752397; x=1792357197; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=;
        b=YA8SqvpaQXTRaix/I0+x5IEHN+JfzOdo+eQWnoso3srahpA9I2SVnsdZ+Op6W4Qwjw
         BPR5iAJbT8tn2lcOgsQgOhcV6eWb0iYSbGBYS3uEmfQdXggpaxSiwZh8YMKElsLj6PUq
         wdaW7IkyxApFe6+upUppBt71yvDlj4s0m9cKkxqIBSlAYclwCgaEf0HNi0vktD0LG/a/
         eCJZuVAajm6utZYCMcA7fr4I+iZoNUB2gv90SVOD1XUmWfsmV1xVmW3VMH+SrQ9bCuGm
         4EHt4uYS7xwyNKIFLp5PUeHl3rXE8VEjlt7fcPUHkhMLix/SAZvBte+umVh9XGGfuG8c
         H7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791752397; x=1792357197;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=;
        b=m92w1vroHXLueoe+6Xjo36vDBQVsNEf7QBZ2D5PABEugf0maQaZkDH2NfI1cJlFTZ1
         C3AcY2Sz7fnWFPdypvDwsI6DSbHpZq5gW9qUgi84hfVWjJB1VFDvZBlJN5SV/ZqiIsND
         D4M62e6/a9luIdBMHkij3B8JOACd3j3fdgo/YU79i/twHtSNwF48+Wh2ADSi2MBD5Wqe
         HdV+NyO97vXUVeCTrrmFDqeSJ5PkZLwOFiUH1nzZ4v6SjpVWZ2DQ0lPq40Kr25uPv3DO
         d7EnSDfLHvjQe5zKDftM+wV9bst05wcM3idJ7uGkDnzXMY+X+5AsaZCG6THkNArFH1uA
         862Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnZAzZ4RJhDu6BdWA/QafgVbn37da9op/v5afynmCeVvtbH/QnNCT/rA8Uhpv5jsuC+uQDgz67Xv92@vger.kernel.org
X-Gm-Message-State: AFq9FYJtdl+5N1NCAcom0gq17uf7JZFSC5knHE0PdRKbJqhXQZ3GZHXb
	o7GRmPpvGDllqOFhrPKW3SLFn5Ix962qHijW52yb1AXoWzqwherZcWCH
X-Gm-Gg: AYBFou1PHBKt1F7sGvLApajRsZzEi4In0qsMkATweD5s/E6i5pCBr8OCd+AJQp2M7Ea
	u/AKDLLIGhLFLLBI9l2XLtkeLItlHyeTZPAAFNUTnHo7TyiJNxdbaJ1VwCNB3Sbt/TptTpCy9f9
	xbFDyfHfeLTXvD+8C1rfxKmNdkGBrZimuMuYMZZmlZmORgFLkhH+7n7QLXg9O2wUP9yI6f/k8Uc
	JzzVqjTmXjKxE+69vdNlbrDXSSv6O/a78gasU5GyfDGbaDmo/+cxM0PH4FoVMarRcnXNfc5cE1+
	BzdVlCtSWn5wVvu74QhcjED26/YFnI2/ScJHJXEF6yYwU4U9lw/ABm40ltD+M6F/EWdrJUXOm1L
	hIozhTpe5z4P99T3A+ddACLwmxJqQg74vXYHyuEcNlRMz88Lrrt34Mjxu9My47X3vbCPOxAAsZS
	Qr1R3BUghJnO8uXqfjwvP9GCOksoxAdfsB9vsP4zKuCIKBeScKcIkB/oYbhjVTA/5hWksOAi1iE
	Ou5x0Elcsti7k/6Z6kC7VakrtMSRX2ELa3s5+Pk7rYGmG6WT8d6BgD1+g==
X-Received: by 2002:a05:600c:3f0f:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a18e4cd231mr144688665e9.22.1791752397395;
        Sun, 11 Oct 2026 13:59:57 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm67465395e9.2.2026.10.11.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:59:56 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
In-Reply-To:
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Date: Sun, 11 Oct 2026 23:59:39 +0300
Message-ID: <179175237937.1513478.8957286812154054574@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Martin,

On Sun, Oct 11, 2026 at 10:49 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
> to meson-gxbb-odroidc2.dts?
> Odroid-C2 would be the only board using it and u-boot seems to derive
> MAC from SoC chip ID/serial number instead of reading it from eFuse
> (so I'm not sure about the status of MAC address in eFuse on most
> boards).

Some data points in case they help Neil decide:

- Mainline U-Boot does read the eFuse first on the GX reference board
  files: board/amlogic/p200 (used by odroid-c2_defconfig), p201, p212
  and q200 all call meson_sm_read_efuse(EFUSE_MAC_OFFSET = 52, 6 bytes)
  and only fall back to meson_generate_serial_ethaddr() when that does
  not give a valid address.

- On my ODROID-C2 the eFuse at 0x34 holds 00:1e:06:37:d9:37, i.e.
  Hardkernel's OUI, and that is what U-Boot passes on today.

I can't say how many other GX boards have the eFuse programmed, so I
have no strong opinion on where the node should live. Happy to respin
with the cell moved into the board file if that is preferred.

Thanks for the review,
Fil

