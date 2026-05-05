Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34224279FC
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985970; cv=none; b=VHttJWzHYNtZDeUyzqHmDPKz/AtQic2C2ERunjCXfxSEUNq5cgWVH3S6cv4jSEVTTsT+woD6G2m3QXhT3plh/u01q8K0gcygipo9JE3BOXCSvxzboMGgKFIS2dCYYrwNIqbmHl/d91N7s9dQPb5x5fyKiSWEtbAqUggVdonbHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985970; c=relaxed/simple;
	bh=paYmnNnEQoIC5Za9FvreAtakDaY7vbGO93A2aCAcVqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/IIRAxchDLskENtFSJmGzSBleM1nAnFHJ03z+sdYyTz5ct2b22LwVHsgyojWESuQ7MuekGObsk+3dLSd4I0OK7D1dzAwlE5ChNtOCDcNuTs3mpRQnVtrRzx7CD4tnul3UKSDWMkzeu8e0Qai6cyu0TPbVwrYie/DNQff2N+eGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvkjwnAk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvkjwnAk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso55349905e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985967; x=1778590767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhJSSysfaSzLRYBW+yvJB/wrLFSyZVcO3hf6VGLmUpo=;
        b=WvkjwnAkOINF68yqpkD11byxnALH4Igu1uv/7sDAVXTVuVYsscjPbm7MvJcGdSV2si
         uPd3jhxfw8Ru3a2UcVAF+OsVWd6eBXkR4mIZw/kf3m2RKBbdVKFkYv+OG+SVzNP5cvJA
         gNwZEUuT67ldkkTkYbKI5MVfseD1HCgIeB/AbcaligiVKTMRq7kAHQibkqZUswMmfwi+
         uX2bCKtbUCQi901nAszihhYg01R9Y1XzN7/CbUd+aMLlQ1N3johUwE4QMCWnS0yCwGHw
         38o3xBT0wfHrHvQyulerbkmUwHAZIKfRFQeQjIng+7WE64FRryHPwwGszvjJ64bddXIW
         91pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985967; x=1778590767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RhJSSysfaSzLRYBW+yvJB/wrLFSyZVcO3hf6VGLmUpo=;
        b=EKcE6BwcYW8XUuT6enRXJTPSFRaGZaA4QXdPtqtiQp0fyG38+butSUSHfEWrhKiXAW
         zJc85eduCiXPIwSGRUfifLDLDx6QBtnaC/EDMZ7qzHlX8PfnG9x0nUcNlgVjUi1D65Nc
         Bdr9tzjK9r6S/jNSL1cxRY+tGkMFgWMJ8VnRcpcGqXAHEjNNL5A3gIagHcfv4gyvvhMT
         XinwhnrkFJFAnNkb3OBJo0PpqtrAuXGyysDgXWPNnP1Me40PL7EAsw8y54dGaG8ZF8tk
         CeamK33PBE4O7ny5phihlw14z/2XP2GwICMtC8G0AeN2Ep58LnfWiTUvQ0f/SYCBcZB9
         O57w==
X-Forwarded-Encrypted: i=1; AFNElJ9R7dEJuCogeIbvVy/CfG4CElN6/tn6COm4SORvkFsM14wut/kUUlTIzwf702IfH0XCqE85NBINJTPz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx696r6zriw2QN/c3iPCMmumP6Lu8XXbBjKK+BCNOKEzI7Xr7Ug
	r8Qzi74OwSHSHU7F96b5BmhlKFuLpLuPRW9X5BpcqolUbGL31BZSmI6bILVZTw==
X-Gm-Gg: AeBDietx6JlrOc2QmmHHkhTb24HqqXq8hHKUSKN93Vd4ZRp5z9bs8NRRS842BQFyHWV
	zZDGRdVlEsW+xuw8RxTmd8GoTgljg7rJXi5CswUGiKIDyiUrUJH3mH15tCbloIWGCfrUliNu3W6
	2D6F/q1g0TluI0kVyiq/xAxbdLhX1uu9Xh/mpB7Mjt+wokWkheH2uB7OtyJ9g5mXVQACMcM1Enh
	7CivTSGkmeD9t5uCJrdTAiMt8Dey5fSJKuaSYZtEwU91EbUPx98igq6r4cmPkERinA1DFteFwse
	wj3cipwz+PntXT6My7z3OIVGAPGRKDtggoq5uxsg7szdOa5Ycac4YqT5ckMQbgh8b0Avv3GeKr4
	DLu0bgdFfBjomLp/RxuHY8St4GRtJ6XliAh4Ms0NIVPkeneD+AfbvW3U/IVTQZr005dOxMVXN7+
	cyT/oXOmP3cGdbE6Zuz8mc0d0JSoRa7J0QUnb4Q+SEsaLqx/MenUMboGbaJ3z6JGuZ0QY8Rg==
X-Received: by 2002:a05:600c:2e56:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-48d046a6fd1mr99728485e9.7.1777985966809;
        Tue, 05 May 2026 05:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm625634745e9.9.2026.05.05.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:59:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog
Date: Tue,  5 May 2026 13:59:17 +0100
Message-ID: <20260505125921.149682-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable watchdog timer channel0 on RZ/G3L SoM DTSI

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 0c5b195ec57e..f4ae7b7d7749 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -219,3 +219,8 @@ i2c0_pins: i2c0 {
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.43.0

