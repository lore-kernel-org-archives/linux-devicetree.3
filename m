Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED0481A98
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909653; cv=none; b=gawDCYWWsd+IGTvku1NF5tB6D22UHujd9qCSHDDd5Tz7M1z1mjhVePYJpMoUBcRfC0ZL6Y7/6M84pnY/FK3dZkchQZMaT9z0YYrnbF8I2iTRyolZWmXjGuE3yPVu1SI53fBJAX9ByoCczEypldg9ojWpLyAFJSQqf03AQW0VHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909653; c=relaxed/simple;
	bh=UdYuVybQFPSsAf2RKB3eRhJbIK1t6vhvF1XRjODHB+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWbSCe2JJsBWY3aLvcW8MwCBG3uoGVoDCp3T6vD+ONw3XR8dPGCN4c1pwPkmcD+axzHnHAQjcowKWSJfkV3Z6Mkyql81k3huNldXYkxqgTX+c/9RxMow31B4J8j80jOcZsEs1UZU8Bnr1Fi3CUdZWSeVjKwrlmlOi6yvn+s8tdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jG3bvZF5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jG3bvZF5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so3255195e9.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909651; x=1783514451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=;
        b=jG3bvZF5xvZUIKLz50JR1PSPvt/sGzNQP5nq3aWZKhD6bvVGaBFavGKV4fPqt7bauJ
         0+U0+Q8EVSmk1nxoSStS5OuEWcAwctCGxJpvulQNVtcSeWL0crfr7xUmrXKTb71D2zWr
         D+gpvzaSk/ndKRu9xxhChnyf3wateyCtLtBnVJclNXF28hU6CfCM0+uhn35mRldrEz4I
         E1UuP5zvlVNarZgxWp8Ag+UeOMrUwN8rkTHbMnONe1QwAn7lMrg12m4q7A/N89bBqR30
         sAL3SrPozNUYikWzT2ireUjhjUXGU52TpgrQm/8iyL7NYJcYq0qV08/V2cSUqtaKXWxm
         1d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909651; x=1783514451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0l2hO7jjnBbgc4FxNyXYuaniEG5v8NsDWwg8qmCQlzE=;
        b=CEq2AxGNC5D8Vf29ndD//zjThKIfjFdQM7DpJ85GkF3CnGXTWgGiYU/rzg+oybQX9N
         82Ac4HI3LDSQuu6+qgpfORmfrV43qcyIYYo3vh976lFZaeePUq/0+U/5KIAQS3PO5X3A
         BU9Q9iIjEqpKvVE/oX15dOZC015573F+Uy2TuUcxQzEhnj7eAjWaIxzlelytoKxyIP7Q
         G+F2XCqpE+/tsHG4/+uyaST4p/ESW6z7kIj5h4oIwn0HG4jRO1Z9FqNlsaYwhYrp3FKl
         2BKMP75GGoVPs+068tm1HK/UosNL0DhHk9ivYd3s0RyVFYi1oYEn+ix9sf02eLPD7YC4
         Ca0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8t+RoplnsLO+WCS4uw6ZN1qjW00J+9lFzjL2pJxN9aljUJfZFYoFYbS2c+DHU/KAMv58R0VEGu0Jka@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ahy5S2IGRMCEiqVZnVJIk4+C6gp6DZn/j9F6G+MsSWzGvX1p
	UFJcJ7EYoc7y8yJPv4ildfpukCcrsxBHD9nlvX24pON/3C4VJkojStPJSN4K3YaxDyA=
X-Gm-Gg: AfdE7clpZo+111HPfY73PA0OEFNOHkmEnDGgYkZuqiGJUzxcGLKeRCr04Qrw+hAJeHP
	VwHcA0uToIfw907c+WSYfEaP/iKRMbpZ0rP73krHHVPs1dHeulG9xU/5TgiPq9GYtcXedrlEBKF
	+o7x0U1vGX/sy99BP7S3Pm/HFpCa8z3GekiUdgrVp03+hrkrVgzIuwdZ3Yl0LHSo8mMu49n5Ob2
	xMmEnKWqfJ4UuNCsAmymQmuLsSsL0TiHgpal9OSzLT12oFra7XFtaw3cWKxz9e/C2u30O5Zanzn
	l96IGEJ3fOuxRXOEmXhilU+DCdHdjHmIhVGSN2NnPAtWg4WitHs+eVUF2ZnkiOSWBCOIREPVEM5
	dqVfM4KJr1Ia6p83zvvUj87MdmvWLk1s/mFW9OlE/njlOVrj2Gn8kPDDf/glWkOq36jaFGzfm6S
	J/pPYRTDZUVg==
X-Received: by 2002:a05:600d:15a:10b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-493c3dfc883mr5371895e9.37.1782909650717;
        Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4bfd47sm101422335e9.2.2026.07.01.05.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:15 +0200
Subject: [PATCH v7 03/11] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-3-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UdYuVybQFPSsAf2RKB3eRhJbIK1t6vhvF1XRjODHB+U=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXru7duROEp2t5R1p8Wr4nxuTpxLDWRlPmwv/Rh6R6U
 pvefprfUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABN5ZMbwz9Jn6QGWbx4yFV8u
 Zu1pcPYVEXuiHLA5UO+fZfU6jn8REQz/jGskusKMXsTVVzwOm14a3nSXzSK79/avqprbT5feF09
 nBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d42091d4ad0e68d8769b49c115bcd..08c73cae26c73993a613372110bfd5611c403846 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0

