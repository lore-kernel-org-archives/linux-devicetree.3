Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274619;
	b=Xdn0NzpUTggdTphFAGgFvAwsPKaU1N0weZfo68h8U9LXdt/E8XExq/HujlRrtVo3BhOl
	 Koy0Ck/pbF3NZt+DyJJidvy8ujXMEc1hICufUwlQ9LWUF9pQ1coMSOKJyDKDkcWTtQqXm
	 Zaj+4RuS9fw8B3IginAY/Uujr0BnMOVqT3GTkdbS7nh3RiETWIpOQZFGBYwWmn94Q4/jZ
	 4EgrWSw0+pfoFtu4nzOiRshS64huO/czRL6Gqy6CLFjK6RqBX6TvKlqPh2SPRMEGYL+pa
	 vOC500hkbtmftKGFKkncTt+35nq5Lskw0/G0wPXhB8Bi4eMDNr2QFSlWl1+vHfzeUbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
	b=1RB1gbDAZcR+IYbfMeVrjoJRpvrPSpBfefQcppY6L1J0cbXTSAJDMCFIZlhm+Cx0DErM
	 AXXAaKE03tHFlorKBiJ5XoiBE07QveVzD5HpFApCBWSV0zKpMh8eQgQauzcwayUb1dOFw
	 HVQ6RoCujMITAC0cK9mqnScEp+0YgWMpcgvO63/9nrnSytFJUn6ghQ+ANLHwH0iXSck/m
	 QOHAguUP9lPatkFhg3gCOFKE2yQX1h3RTEAYk/jGWt3Bv9XPc1t/cDasG5VQe9PkTMadM
	 ktszKTU++x338vCl68G3Ub/L3lBXRe7crk/Z1CzDX4jBw5Iqed7RRbvpQo9a+IW43oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/Rw16cP";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58B60A2611
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE58B60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/Rw16cP
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso6217765ad.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274618; x=1794879418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=J/Rw16cPObp3yLW1VgpFIWKU4KeUmtm3z4y2VmDbBVazCBovIs2FM5JXnEVwLXyb2X
         9STnPdgpuFcYIdVM3DG8uWtyf4DXNvgRhjft5K91+pQhT7yhrFIrgtoXTAIJHEMp8BhT
         quYrdUTNAh8JM7KNW1t0MQ5OVtX9gvOFWrqA6oO8k4/zq/um962HANiY1NnnRKg/KrG9
         fOaVnSYKG8QsM2w6ProTIwSKcQr0Q655EEfVLg8h9CFjBGNo4xnQ6i8wD5wdGLBW7ZZg
         dH4UkYQ+JHj3usvF6fExn9sBCZq4T3AwLIH/QZsRXIBt+1CImw8EVTclYFU51Amf5gvS
         xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274618; x=1794879418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=1TKmJVsO4OfXeIZryhSfkZL1Jgn7C7XpGAZy7MiA0rZLhSRsEzXeDzGAEAsUaYqrYh
         SZwXXGraW8QlUK93EDLn/Y+AZ1h6miXfvjC0KmX+ceYtbunRyH1ACIexZFhEjNyUJqCN
         1g1nNK6oR7cWcWDoSE39Nauvz/8TTHncqfT03RHHEhYGHzNyCd2yw2SG3bMMBP/FDwON
         wDJPybDucYQEOLUG4T8gPFWydCboC0L65/xX8meHCThIsjYnrhhYFG2OJsziCltkQqBO
         s8+FLeSEebnkfIOWUt1xGb6sSrYuiT1Av92fE8En/kYDCiM7FyS89EE6+mr+sfOFL8vX
         F0lQ==
X-Forwarded-Encrypted: i=1; AL+hErGWaOwVkIbOzSS10vufkU/U3WP7P74c80so8dmUEcrFKtxqUYwXYtRRRT27ibDycGwm2+wwgvQdtBYw@vger.kernel.org
X-Gm-Message-State: APuU4Z/VTYlZpnxUX4eO5dI+O1ibKn1v9HmjCEpTSyFQBYepKVbTG/2t
	xr7bdooWX/YD7uKevxoPBrQRoQDp0l/jOwx5ubaSUyU5Ua2URDugeGfE
X-Gm-Gg: AYBFou2h6Wqu/3QW+6xxIC1M3cu3SHfsSE5fvCVaxZE+PFSiwdtUWX9d5jKCbujXP2t
	TWbAL5FbnNr7/UDBx+Em2CREg5uVuh0n2yJp96bx2ECr5Bn3tEa9ea7rlbchDHeYEfM+s5PKczB
	Zta088vv4FAFpcjo2bSCohhVB6yedYCn+qOIVBzZ05fvXCUZYke4HNSlTYiMgBlBTHrhNh7r+qd
	fFF9fLW9apMIRJIBJxz7qtfvhkqcYKiGB4sbyp37WBf50pAeAN1ptfP4HXg320Vh9k/w3j/RCmj
	5NZtwlFvokZeOF5APla1J3Nk8Qx8YwQhvuh9IoUSYcz9IRJZehOkul1PysX5BEnIcsoSJS4MDLw
	VnBf1TXas6fLlTL333pimekPkwsB23c+LQoybvxQdYuPkuOTZbgu9EZSWm4Y5px2Ylav7wVzbCf
	EROJ996r9y3BUhRRQ3MIRd2gP8YcHeD85u2iz/JWcorKo2Xh3uEX/6++fESqraBI2Ih0ZpfgvHS
	o6gEmc7L9WqCQaZEeY1R8WbxfkAeFv7e8Fvu40dg40N2LTgQnuKxbuV5pq3ewcHzgUkZT7xxCvA
	StAvxCuwo83P2bJJTwbXVI86CgqHsdv4QVyNvzAC76DzBWNyWQNastWQktms7WptnyUSBYpfCFI
	BO1ViqnALwvbvyzekbtyzb6x35OW5ELSPnnzdOOrJ3C4stYUvPlntWA9ThMmmyhJODe57CSi5E8
	54yQ==
X-Received: by 2002:a17:903:1252:b0:2e9:5c51:19d4 with SMTP id d9443c01a7336-2edb912cd82mr9735785ad.29.1794274618427;
        Mon, 09 Nov 2026 17:36:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: clock: ath79: add the PCIe PLL clock
Date: Mon,  9 Nov 2026 17:36:44 -0800
Message-ID: <20261110013646.1582970-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an ID for the PCIe PLL, which AR724x, AR934x, QCA953x, QCA955x and
QCA956x have, so the PCIe host controller nodes can reference it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index f8a98e4d206d..e4956afd151d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,7 +12,8 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 #define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
-#define ATH79_CLK_END		6
+#define ATH79_CLK_END		7
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

