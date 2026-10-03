Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBB37EFFF
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017213; cv=none; b=JzAD3KeVjmu3gH3ylh1gostnREB4toq7oZDRluYBc1YFfIzcwRaTC6Y17kHl2qskySfF5xEApITvy65KbgO+pX4DCNUWYEddjEVm1waI99hYGcg+XBCqgK64dLJpSNBzASPaHTizAA84frvXTUajMzvU6+nld/hRas6RHWtxHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017213; c=relaxed/simple;
	bh=X8Qa47CYVA3jb3xwrWDiCUnyO5eG5JwR6h7Z7o49DH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IacSeGZ4i1L9XpSKEugxjMumf0n6djTUkAPM6tztrsRWvN+jzvQ6u2SRgJyGaVyYz+lziio9gGeRXxFh8rWKjZ0r26yPgieasOUCkjM/YBnjmg9keYBijw4zim82NoehaXb7sCv6YvlRbBB55BR71bQuamAEd4pr0t0LR5afwlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq+A7Gcs; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq+A7Gcs"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc792ffdfc7so62936a12.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017209; x=1791622009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxxheazlFCgAiD+d31s/AiAJsZYYLo8W1wj/LuSYOIM=;
        b=Sq+A7Gcs1ADXDeZIeJjPirv/Nx9jgzNCj1Cgpqde5sBLr+UMjdB4UkuhMEQ5XYtqhC
         /kSxeGgxsokl91lyPAwK2Zgof7enlG4WXmW2UE/L0leNBsm1to1bmsm6xqMwG7YgTORE
         apF81lOI+zBmlOEGXQxNXEmcGe5sgQbAz98y26+vLGqFn1mv9r/I2hQ4IHLXwhAdFSJk
         d5msYlp8GmcyVNEAtdBjpxQyz5mOBML0bcUINxYWIc+itlIL892Iwz5BmeXQsEHVihUV
         87pcSqj8hQ+LVOGMLuLgAoDynaYyNGAYK6K9/tPMuG2jUu23vpwvKVvtaBDMR4Pc5PV0
         JzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017209; x=1791622009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxxheazlFCgAiD+d31s/AiAJsZYYLo8W1wj/LuSYOIM=;
        b=zaqWirMFxdZR1xJzi5vJ+ndZfET14qXtHaX0tWEDfLgzaxGk5YRWwSPMHVhdtQl/R5
         L94weWudKfrQtqGL4fxO/OHcZuhK474xYQ3BEpJQvZBkH7KPj0vd25gHOmXPMjP9fFxj
         d/jKMvbxnMJox8r0jmNHt771xpc7uFXWsrJRzD/8uEYo5E1nTl3C8lXPyS5MqhZYCFH/
         4t2NCaLfAsvrlNVjlGnNU6fwGHdEj29v1tQbTLVedA+7bliAKVF/QIzTQTXn7CYyazC/
         YqI8mNnreEbxOQMU85DHM37+cd7O9WzsE8gMmJvjWPM6xoGGm6G3bZKsMBHUtVLB+JJu
         atRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfTCoUEk2X5HIu4H51k3a3dLff5H0PRMPpLwau+oqAZ5aec4wST7kzvkcdJyPfutQsR9OaxwTAtvBL@vger.kernel.org
X-Gm-Message-State: AFq9FYL9I/WmuSJ3fSCrRI/fVXE4884EtkGgS6BwdG8kZfca6HM16fqC
	HhshtN6/YJ0B9IhNO/kfBLd2UElNwL5+KNlxhSuBwoz0wNa27ohjwnob
X-Gm-Gg: AYBFou3LmjNBz66wVYuAyayXbgxPv97wvUtnj1o4TIC6tu5bNT2S49pqm5uIY2ZpFq9
	Or4+6dwquX0hDJ+HwBYXKGYmtJTBaJpAChpVC2vTb/TP0n+KKKqBaxa3r6cfC9waCznjmp8Wn2c
	DnFUO3Sxm3ugDZp/6oHQLsbDbM9UT5qV1gn52uj2pfSWamnY31n8ugqmI8SBn+bGIxPSbkfK/ZK
	SNJ3FBdP9j+5VDOF1tH2J4LOJanNEEr/ZdsHvGVQoB8nPrCx9AbP+HSOqmQQdwE2vcaEu78xP2v
	n6S/wR4NRIG7o9yfa/5Lyddgq3m6XBxlSwB8juwixJM0getP9FW9XCzv5tWoxpXQhP7dRASIC6f
	GTBx5Rcrj3tdxXqFo/t1XX5G5P0/gJkmB+nAP2sLVRwlzxbrjPUDog/hub+08WeSLLSraxxYlQH
	CqIasThm7mlZsOu6E2kbblKJ4rlqBbhgLO4Jz5sw8cOOxiWtkDn4uC6lWXVUvl4ijrBYmGE8Ao4
	kRhbbidsnPRawWX4HC0AQDcJWT8cOlmGHbGYzzf0eUGKcyPED+Ydrz/N8XMl2GapuvJDMe8
X-Received: by 2002:a17:90b:4b83:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3a6e1d201ddmr6386816a91.4.1791017209449;
        Sat, 03 Oct 2026 01:46:49 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:48 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Sat,  3 Oct 2026 16:46:26 +0800
Message-ID: <20261003084627.353899-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..cf672cc6b935 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

