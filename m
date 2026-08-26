Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ADE30F526
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785797; cv=none; b=SGKlXYhN74R5WzXACgKZZtazSJ222181vyPQitGTqcfxXW4HGaVIYr3zLY5aNjIY9phb/J/hAlmA1xDec0KlJNdrJsTGRjQMSpMraKV9h50F0UsXCgAgA7tmuN0YvR2n+/wiNQymMuVdQePd882cpbXNXuDB8YWh/pUGW5ILaWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785797; c=relaxed/simple;
	bh=ieQZ0ZJLMkaYypZKk4REVcl+38yii0go1+lUmv8JC94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBAEDQUzgwlUlKlRrJvaj0c1J/S0YXMj8aMUzAnxP9N0RWw+A/q7+kVCBH00RCx3Knwe2ySTOn6sATrJm9LG57gkRc4WeyFkPjvfvdtetsAw8SwrUoqIVrMW7SdbDAMhPDm8Mwr/SyMYtSuCLlFfRk0zrbvg16Irm/ZZ7Lb3gC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCJsIuCd; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCJsIuCd"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1275507e0c.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787785794; x=1788390594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=;
        b=bCJsIuCdgEd7IccecMhyaksieVMvXgvAOvVJm3AE3Pz/BNjUPY8yJmCrf+T7pCFmuy
         27SR8fqW7zArHoctnxTGL/RVaUBecJpA1A+NbTFjITJHbL/Bz10O7XNyAfFvkFv+gz/Q
         dOpb9/x8XeEFHnFGCJDB8qoK0fY2xTRGFaiQo2gA+/462zWHpH7vhMURX16KOLbh1aAH
         wM6z19tgZNeDtsnOZfasfnvRZx7t7TAIF/3i1Fos3538B6P6VXD9DXncSaAWhYB1pULh
         Y2XHZgNl01LWraktqZocsHXaXi2TWoyHrBP2NqOuwbwkJUmhtpVPBIlAceXY4hxRjFuw
         RBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785794; x=1788390594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=;
        b=bvYTvTx88B4V3JulDDrlCTQRt4d69h5fy7fKwZu2CPTrOJDy3iZsA/A+pfmvXR9ljl
         8u7/2Q4xqdoutBRteOZJW+68erRO4xNJrSIfqOPQ/eMBNjUNjTGEhQk/vngGhLcK5UND
         3fYh3Aa1NBuZmhiMNarW4gmVA8jmVNfHcfSbl/W7FaGC9Q1q8roueJ0MvMDS0GqDHwkM
         ZR48hvoOQBfH52hCW5mMVAGiQDDfVwrTeZydJvYKpngOJH46OkKmDeCt8vQiAmOtM/lf
         X7xaGYugVrX/UswR7Vd5H6I0Z2kYDDFi7Jgmi6hXO7X4EutmlA+3gAFGEZqQ9uYVaA9p
         ATMA==
X-Forwarded-Encrypted: i=1; AHgh+RoHcPaUiv0mvjdyvmFvuCorN8+1KN3u65rfhVp97+/oXwSVArQ3UPNjIl3juPQYns2Vleq8Z1ycOVYP@vger.kernel.org
X-Gm-Message-State: AFuF++ncs3tUjErtZCLPEEXohZRQQaDwkqksxdiv63vRrScqc0TdCmER
	PgtugfbtbKbl0p0oqwKH0APqEJUu7J8/yx2ZriapxK10hl4+9CLWfxhv
X-Gm-Gg: AR+sD13t3wxiztOPkdHuUy61q0u7ICfkcviPCdeKVBSlfJ1K4Qlar/QbbRBY3phmRas
	mlmQwXeyueNC2swMj90A1fGEAXJv3DqAlZe9jywdKp9ZsuIYL7mIgaWeRH9SYvE0s6g63N9VuIl
	+uqcNuCs3oaDWm7P8hFAi8AvQpE8MG5xV2xZfFeSzI7R4XodcVARjM1dwvyXchUzMg2hN3Spb1+
	9KPiWfgsChBhp8RJs/14iAeoRmQ6QX+A5/rRNcCOl6fwtlPFK3PrgNSmnjC0I/BUong7fsEKFOq
	mwPyqHbJpkPI5Xaxa5wRwmhXJGuxUsi4WGXZLjOE0v3Cls+vvw/cArGuqaNlUgKGfx6K3lUlsYd
	h00WNMNQFXOUz3BVNcRrUpriF4oYPq0yAOutOOivaDU66utsx7tnv4P1pB5M0FB7AJVPBEzbRDD
	z4GHea4AlnBU3xtFdW2L1rAZta8R3sanD5wkMnisaOTSPj5m5548rOP+qBrkj0xRdiaxgh/kZGa
	Y6Hiz5YlyLgT9jXyqFDp2k2UqaYliLaIgSz1f8K3Js2aZfIytkfvmOA3aggFTPQm+I2ppg=
X-Received: by 2002:a05:6122:1826:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c65b56d0c8mr4542431e0c.0.1787785794612;
        Wed, 26 Aug 2026 16:09:54 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c65fe7d777sm2727980e0c.6.2026.08.26.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:09:54 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: allwinner: add A733/Cubie A7S DTS support
Date: Wed, 26 Aug 2026 20:09:40 -0300
Message-ID: <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Enzo,

Two findings from building this series locally on top of the A733 CCU v2,
plus one note for the DTSI move you already agreed to with Jernej. Both
findings reproduce on your own Cubie A7S DTB. Junhui and Jerome on Cc.

1. Schema evidence for the clock list Jerome already questioned.

Jerome raised the xtal rate and the naming of the node feeding the CCU. A
full CHECK_DTBS=y run - the whole schema set, not a selected binding -
rejects that node outright:

  sun60i-a733-cubie-a7s.dtb: clock-controller@2002000
  (allwinner,sun60i-a733-ccu):
    clock-names: ['hosc', 'losc', 'iosc'] is too short
    clocks: [[3], [4], [5]] is too short
      from schema: allwinner,sun60i-a733-ccu.yaml

The posted binding wants more clock entries than the DTSI supplies. This
may be the same problem Jerome described rather than a second one, and
whatever resolves his point probably resolves this too. I am sending the
diagnostic because it gives you a check that either passes or does not.

2. /soc raises a W=1 warning.

  sun60i-a733.dtsi:116.6-197.4: Warning (unit_address_vs_reg): /soc: node
  has a reg or ranges property, but no unit name

It is the only diagnostic this series adds over an unmodified tree in my
W=1 comparison - 499 unique diagnostics before, 500 after.

3. When the UART0 pins move into the DTSI, they will need
allwinner,pinmux.

allwinner,sun55i-a523-pinctrl.yaml has listed allwinner,pinmux under
required since d626d248caae, and the A733 compatible joins that schema in
the pinctrl RFC. uart0_pb9_pb10_pins currently sets only pins and
function. Nothing catches it today, because the A733 compatible has no
schema yet - but it will fail validation once the pinctrl series lands,
which is likely around when you send v2.

Static evidence only - no A733 hardware here.

Vinicius
