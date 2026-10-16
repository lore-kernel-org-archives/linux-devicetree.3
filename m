Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575724DDB57
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161696; cv=none; b=RmTZmtOEtxvma/YxS5lA0GfD1C0B3+FJHyQjwivc2W3JjCULKXQUnP0kOc1h9e0x7jF0BzNIHWf5Tlut7z0eouOY/0qCQjJSjYzsg2oQtpGVgVgBrswBz7q9XmFi7iWmR+riSZIYKqfnprR5+uZC9wdggTukAHaipcecSMMjvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161696; c=relaxed/simple;
	bh=SaXqgEOyKdwDlxokS4s2yK08mPWXLB9VVoYMmSePtWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tu06JiNktt0heJjJMoeLbOVufLSmn1UHQPW1KwGzNPQx+zcUU5Wsg9JupyUyoyJhI7A7Kp+ASJJ1F+qHybXoCbWzbXI78rzHFequWFsfxogyjnCH5QV0v2wuaLF1vS9XeouwIo6v497uOOXiWFRHY+5M6o19Lh/aNs9XVrX4Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHyx+4yN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHyx+4yN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso216395e9.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161692; x=1792766492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=xHyx+4yN8MS5TGIYlBVOaod+EUvwDnocBkmYqPCIbdfJ2Yf83Hl5Inx5ahomuqmSnL
         8dtwNzu20NWl7pFtsrQDhBn7u34nz2dNt1LJFn/m0uJrWkoV+TyEZq+/SW494QFwXIef
         SyWvuF/nCkULFVxBmD/bE2UegSZCqeQJzXvnxJwTlNJ/YuW/jk30b87AX4LW+JfZuDGh
         1HHg4oyolC2BPMpby32liLBN9f1iRyCm6Qvht7UhYOALQRasqnU7p13UXRVt2a6Xh8oN
         fbxDhhbD1Eb5OQP0AMCDjdrcN4j++w++PfyiL+WU83H+zhKpAJ9T3jDX0DOtz1yHivl+
         hCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161692; x=1792766492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=Ni1uqZwiFda3EzTmXTUQAQ/I/29LYKNMK+PhTzHjm1AXVjRwE46J3uenUI0JEhzhnS
         F75mcGFABxYCWlgwN5OXKzAjoyiE0Fv3teD+80QAqAYxAdpfh6sUD0hqJRUA5qNGSd5x
         +wJHm4ALpiBzpaNLSSQ69z2q6jCN0UOi93KsdC+B66pFw8GX+JCNiNi94yvW9EZZyWp+
         S4A42AWc2AZcJIPqSO3vZW1KdqJqcj40iASDnQ0fNHdKIa3oq90de/7+Qkd2oS0iS96f
         7cQGh3FgNhODHQSTQHwuLWvtGN3/lL8dHY8V8Pyb3jTxqUHgtJc5ZEspl9dwU/lsLf+0
         op8A==
X-Forwarded-Encrypted: i=1; AKwUvBwGknJWlaTFaoZCuhOg9Lv2ctap8oWuTksgS0n17C7qIBnTw4QvAiiIvvQ2pOGdVOCQ3GCKUNEUo54O@vger.kernel.org
X-Gm-Message-State: AFq9FYLc2fw5RLZLCnQOb3Du9nhsz+iIu0IEozLOjoPLa8jxyufpmI61
	VGbI0pV98q11N05b0nKeT7HlO4gGGijdqM5fgIyozQpbQE1B/b767KmZnltY5vw1GiI=
X-Gm-Gg: AYBFou2jswBisMb6I0DqWxEkHeisnkAXawz/20C0yJniL5B9AOh7U0b9lZt7UQzMD80
	cgscQFU0SuygEFdf+Cs07y6IcVIr8XDXhLCoi7MoEzNMJFRBoJs7uOlzohWachGoXxTOO3bNovr
	NDZoXfhJFveOLVyeOuJp0FmxaisfulTcBrFF7SXEAgaI17X4f+bjoVARUz1YZPGgKB2+EHZnMpx
	c4kSpkISe2Y733RrY3H2h37wduq8ax8JeTPZKP5TVHPqVsaWKSnuDaKgZK25O7UKa8scPOZH9vY
	BUgNoFwZGfWyn0ud7HtSiKimArHcdZNidELYF1iamcK6iioUvdtFEU6h8PTM5qZuZMBp36PdDsz
	4nqdRqKQ6hISaI9hRt7HSFzn+Mm7yKeKrjJFwi0Pw2kR8apnHsV4UTI0brP2SZ+TBsOFYyJSmWh
	yd/ZrfhiFEKc4No3e83j9ysLfN99FDAlYHrlnLx6YqIuj0JmsdFP6alNzJ09cT2S5etwERQJkL8
	XuCVPCVGx9FE40WuUUXh3RodfXil9K4khCxsYk7mKbUSclw3NVClhdctrNuNgbj+jlXpg==
X-Received: by 2002:a05:600c:1d11:b0:4a1:d307:b52a with SMTP id 5b1f17b1804b1-4a1d307b62fmr25383325e9.19.1792161692388;
        Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:23 +0200
Subject: [PATCH 08/10] ARM: dts: omap: dm816x: Correct speed for sysclk5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-8-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=905;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=PhDr6kpoBVqdoNYvmZIO1sO7TmGrj5fxqBZLDfq+g74=;
 b=YKJqXfJGsRC6h2W9mfs7+8pUluzq08OblX/xnpGffG9iXzk1/OGVF4+5i7Vufvm6VIO8qJ/T1
 gCQZ6eud/OwDFLxETFckzoUsSrtJEOZrnbegit/K746Fvy0zP3XUpeC
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The default code for setting up the clocks results in sysclk5 running at
1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
divider to be /2 to achieve the 813MHz speed.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
index 76ebc6c3c3e5..cb990773b098 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
@@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&sysclk4_ck>;
-		ti,max-div = <1>;
+		ti,dividers = <2>;
 		reg = <0x0310>;
 	};
 

-- 
2.56.0

