Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C413DC4B3
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723144; cv=none; b=AqARjPGA5XQaja6btYwlNLu86as+w8GSoBrTMwBo4UjOanbNyqL9kmF1GtRu+TWxd7oYgv+LYTPbmLTmtw8nma0JS/Ki8b6+0HIgN8o5ileEdAyD8uznHIMLtij4JiBXQSnwAebVHMn7g4I2u3/J6X6EQaOFrU0y1QVlibn1s3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723144; c=relaxed/simple;
	bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilxT0783tlpBKdrowOO4l0tdiD8QVwrr6gxdmSDrcAScGr0660kzT7Wqy8je/7+sMTI2J9g6pyS5pTbYYMISRUWyfDUVPgoYqvOMbI2yRl6aONs3CA8aMkxijmXtiw3sZ4L6fmfaOuigeCr4Kuvg0HsJD/6u1AzZv6lNTjUtYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ATgf9iT5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ATgf9iT5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so2484035e9.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723141; x=1790327941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=ATgf9iT5y91AKxA68wePvWKLuquWw+GvMKN6wUcnmh/YRhDy60FSNNNb5SbkECIwWR
         jQQvi4ztZYNO/kK31TJbvXIbycR3vVzw2iEOVj98SuiiWt9sucs7CnY4na3aTXTfI5us
         5V40HwWGJVISz9BA3RPjyzeLh/CRCgH1GzgWHCno8c1YIjtCwKXdO/+PgD0Uyj3U6egp
         16mQYVWB3tCJLwi5c5WBUZcXNBQ1+gqO7495dV5xaTR807uiFuiwZAJM5jadNJUGZCs7
         HnvIYOC/5kvIHiPMXVVFcVw5OSpPzR9Py9XP4up/lF8WCeTfAdvpwg6qLZw62k/9B8Pt
         4fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723141; x=1790327941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=dA1sqeSBx8wKPbo18qDMWIiXU299T0E1vOn4STVNlaI4a8+1mguZLh55R4E57mkR7W
         aIS5+zijV/H8t4mZIERbwCUF+SBgxNDtCdBOUj0BcpIvNhAoEFFkCxt0ZkG99M8caCt2
         /962Sxva/JjNFLS5CzghleNnvrJAVyJ0fBQn5HlbzDHc6Aek5a4Jf0ntpBRZZS0RaWFR
         bGRIyOQNZjnKCe4qZpABPRODvnmG56WKA4UFm1nscgZ7pSJwD3O73mxma4kcuLd3em7G
         BRoeF0rue6iGPj0N9JogoSOXIeWd0Moj4YUlCk9gk7KWL9SBoPhfFVL11aWiBGEhdZwo
         gQow==
X-Forwarded-Encrypted: i=1; AKwUvBzSQ6OQo8tZsVr8U2EuIVxF86Bcv2HiuD+xiwJXmtnrudOTCz704ILn5ES4yUMosfYQ+/QZox/XUkxN@vger.kernel.org
X-Gm-Message-State: AFuF++n2QrtSVjCljEbQtJeumv0R6As8Q6zXF64t9Ru0OWBSNnNfpNJ+
	lkfiZ3BI2VHkNNFo1PauwFm3WsUNjH3J5b7CPJkBlGOMqh9JNOypI040a1OXxk7kbUY=
X-Gm-Gg: AYBFou04Ij+N5tRD3K2gOfiSG6mHpk0T1Awo3idl0RU7khT3i+HWTnjw0a6N99lVN57
	hPCeY+ONg3phW4l+HtI17eX6eM6s1wW3XAkR0piPofqpvaYj/XrUOILh8KFgUDQLqrG9WcrCK+Q
	dos6sNPn1FPR2P1Da6j05SXEOI7Inm48+zgOvESYFZcbi/0yIDxPKlhMmmWOTUp05CaVSjesuD6
	cvUU1mbyiKqCVecbK/R62oYgwmo8kfoZGQ9wYCJjWikdcthxa2yrWuQ5bKI3Q+sZqN0udPPUjpC
	lYeE4lusv8Pu17ZZckgxlSIr9fJNDYLwRiACN3GDX7G0WdePvtASLdBjBbl+Nk3zc5tCXtHdNR9
	q/3oJnJEqVrRmSIALB1lu+7/ZO8Jm1FcBEKD+LZewmMtfiq9D6XRSD0iBowgIfmvdWY/+Dykuar
	Gh+BI8RIwkshLktFAaJz/tYdxb+m13W54lqDUtKnehwQf52wd7LMZA/Od5eYLaYcAQBoA=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr19681525e9.23.1789723141196;
        Fri, 18 Sep 2026 02:19:01 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm25502155e9.1.2026.09.18.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:46 +0200
Subject: [PATCH v9 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-2-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jCeOn7obHnw1gNGifKrQxqei1jUut4QKDn02OHdju
 2fjVY1HHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9RcY/vAqT7E8mCMnqOon
 6pknWNIaVq5RoGoYoRy1TKp0ZYlZOsN/f1m1A2FaU87eWTuFS8S8T/Z3Zpcwi+qRFfE2cwv6k36
 yAAA=
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

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..a8c794d07343 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.55.0

