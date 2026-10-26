Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008660;
	b=DjEP71i+jNPaJmhQsO+opKnejATzsU47rnhvxbpLYU3xEkziELj35Wcv9r6CNrjU8zdd
	 qHgwLTDA2nWtWBG0ZeEXRKKjDs7iw9XyOmYnB495KJsm3nSg6U3VkIFywJoXX9NVFvduN
	 7RCsksCH/CyZbmwP2E/S5x2bwh4aV/BEyKbBVpwyfgIOIG+++udE7/NDGVe+lwfwhUd8G
	 uRt4vc02lhU/tuLnS0cDktSBQZIkGnisTrHEwsLmQSUcLHQA4PWjuHiLRTqN3ooB9rTKp
	 Pte43mVWEAGtvTPcCHhejCgHP6+zRB1jeeUPZYgScB1fp6aDLVDrdlr6DmrrDdIonEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
	b=PH4z1Wh4z3+GNsU09Z7A224FJZGnTLlCKYVW8ZIQnEh78+Ec6kwUfwJDLdi5CN4OnUss
	 NxwV3minxhJpTPT1t/tiNMyeJpXUJt8r2wi1VZy8v/3jeKuloscFJi5xVf3/PgtUxAHeP
	 PdxwIYv+FhGrqn0ylF64T0NX3sjm+fk2acCI8j/Y9U2HPM1fObPpcZnh/8yvO2dXNtXjF
	 JTeu3/dCq+PITRuMNsEoeRji2dnk4HuxPXo4CA4B3SaHfdNoSsU3DU2wNEyNHHr4/TVs4
	 WjxaakrCRa7IxxAs2HpPSjc79uJ/BZTxkSU1TB32ji20Qq1+CLeRQkf0XKDe1YSpR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ndry3W6r;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A360A381F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495A360A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ndry3W6r
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso28501905e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008659; x=1793613459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=Ndry3W6rJwlQkm0OpM5a/QSIBufZvzAVg356DA5dT3bB3SDog3rU27rIi79dUswBYY
         ZOHDw1qGFiEjsuZtXrWeJzv0VmP8p7+SJ5GKVWy/2IM5UdKgrnrsZONBk3D63P0CWraf
         FBWyQ6dM2I6wQM2VKd5Kq5eZlqaz5FyEot882pyNigZqekG8ZmoaPEEaUvxDgBMKI1IW
         BzOcQaazPgjxhWeIk7Uyy7OmnNnnhM27DelsQjKL+e8NgA6vrxdJxV7apENKr3Af8Gsx
         l3usrq/aU0sjTD/FGCrfICrm92C63XFL5C/mbSjtybRNxSLvakDqkLdxixxvYa/Lk5th
         nG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008659; x=1793613459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=nOkvGs2acVUyArqZxOqskMv6Jl7DagYVIFYD0ze8hvXls/0JjeAT/2OS0HZr6MKh/W
         qwVizQWanXgjyQqwFJZa4i6ybeqXFLeKbMemFwjWH3ghNSjjYa8K0IBA3tMW3RzyaMx+
         HClah5PfY8USPml5kYTAX7cpivuB1zAiBvD9kIFoPKlf0V4vjfU2H7jOn2YvkxvStiFr
         Eyqylin8u/GSEy/OmG8XEsJtyQgFblXtRAuqGL6rK7giZ4L6VJguEH0tsn9DeejInzRm
         SIQ5tADSXgTIDT2GWC6x/ngxpZypJnw/mVg+DFXgJvkaXyi6ZJJDH/ZRINGYBlDvEjAj
         wXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyJely/7U6h3ggU/5yp03Eoh4gd//TrTt0bNseffG3W4fWLRDEZvPOT0UrAmaxZRRSc9BAiSvPqIB/@vger.kernel.org
X-Gm-Message-State: AFq9FYKeJDqtf769sZMK7zVbuvH4/pEKX4nK1uWLmGbAdS0Qwp2rrhKv
	e9QHf6oIVlICiFMTVI76kaVAe0vNiW6+IxUnZH+Tq8X89TwUTsqHmtKd
X-Gm-Gg: AYBFou0ClUb+5iULaPDgefSBW+QYUEZwK7G0mA5RM2TqleVGNuTJurOk9uppAFooPVX
	sYboAR/6eu2fKiTlq3xkzd7Xlo3xD3ov3wLC13h0/D6C6tmq+a5YW9ROuXveKvobN0kCaNPqKBD
	FO7YyQ2sJLRJJgoLx4PgpXQMNarW2HQHbBAMK75cGzEtS5JFHTsuKUqDwVzJI1Mj4BHFxTt3S3k
	tlXp72RLTv0yyL3unIJc8GuViOxgyPvK4/ceRMzgU9Ug9m47HDxby4p2Dd3eLBa01/tgxiVhCYu
	nKPJ8Ab4EJYsC5bkiZQACT61HIJg8NcYJAHj7QsKRK5xmN9mC/gS6SaJveK6EQdUqjTsdVVv2Fj
	kvwVJXancMwmv/+jLieLcpNYh7QbDjzKHE0pYjRTKxsTIhwrgm6QwqRiY4fWkU0oJEYgKXZ/cV+
	Q7cQXjPreCjQZ7V1KtcFI+wYWJad8xlqauQm+QMcD/1lffbuY6QpvAX7C13c/EsgTgjbvUA4x6j
	3dBOU8JI5n9ffMF6Q1MAYLIlvjhCXll9yAKHCV0oe9U1slnc0pXYX+eko07sFBHvlIRiw3h8yEV
	OfE7PT+X9jSa2kqXRSVIogx84fXJl5MAGFvDwAmtn8CVxpnOyTUDg8BWu2Hjuo+yoYkagTA8qiS
	EPuzpyQ==
X-Received: by 2002:a05:600c:8184:b0:4a2:9cda:57b6 with SMTP id 5b1f17b1804b1-4a35aca71c3mr100497405e9.22.1793008658493;
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: airoha: en7581: add Chip-SCU accessor node
Date: Mon, 26 Oct 2026 10:57:09 +0100
Message-ID: <20261026095727.31708-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add Chip-SCU accessor node as a companion of the SCU node to permit
additional configuration for clock, MUX and thermal related registers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index c5a335086741..fbc5ee47523c 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -342,6 +342,11 @@ spi_nand: nand@0 {
 			};
 		};
 
+		chip_scu: syscon@1fa20000 {
+			compatible = "airoha,en7581-chip-scu", "syscon";
+			reg = <0x0 0x1fa20000 0x0 0x388>;
+		};
+
 		pciephy: phy@1fa5a000 {
 			compatible = "airoha,en7581-pcie-phy";
 			reg = <0x0 0x1fa5a000 0x0 0xfff>,
-- 
2.55.0

