Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496285;
	b=clPD5mEysA47s4qie5or+4aNq3TICsl6tFECXjYf9B+nacoinFXo1B5rLsMQJRyM3gEL
	 2IzltBVgL2Os0RfI8Vmh+ycfOOFt0n+wQBuLmzLSPVDAC8l6MXDyksu86H0rWinSGUa7L
	 PbLm67w5LVtPbYwszRztrcg9DeoCrbl4BmsGUQG4dKWx93U9uZpq/HG3IuLe5Z7WVeFCp
	 6xg9st7lDHqP4eE5s4S/D/Ck4iiqrZuEX7TIRXRABQVo8E04gt3ZqjW8ymthe/S1N90lr
	 eTQbbB8l8TLN7RdQ9JBCSWLr2vtP9D9FCOCq7rquv7MS0Ru2BzfB8cGkavfrmBV/j3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rtFWxEL5l4gt1QqpB8tv7EMAYo01wp+6U1uDsFvBX1Q=;
	b=cSFroytkcWF+fugUsXIPxCpbhKkaHS73SHQ+836WwCJ4+LbLqAxHSqZqxieM3qUxNso2
	 3DXk6nWnSEqIcg1FuXov2zcH+ZevENfhYOiKKuKT8lcn63gD8q53h81t+7Y9Opu1PqNHr
	 eip7n8sLD2GPh2c0oUaa513/F//jVvk4cO+v9MjMc6p8WKEVfxTTwQ6xZ6D6ug7UT7Se6
	 fDEVbPqr1D5/Zc13/isQr+JrKOohTLhxNETygV3GL3IeZvew4Si48pEQC3N006KQ7z2UA
	 uxFjogD1TTGxHOvjrZge2/+yU8dXPiPhPoKVo1FKdUi772mv15T1xu8OBHRqnxcQN3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HF8F0JDs;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2C606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58A2C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HF8F0JDs
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso1945562f8f.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792496284; x=1793101084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtFWxEL5l4gt1QqpB8tv7EMAYo01wp+6U1uDsFvBX1Q=;
        b=HF8F0JDsgnNGcadjC61xkmbzIvbbleuDk1xWrYpvMW7v741nl70Q+BwoIFSTvODLR5
         tvd5VfGNVzq9I0n3P+WjHjkZfQaOWdF35FxJyUHa8Ql52uq/Ev0kmdKDRmONuwNVGL5X
         iGAkO+Du/5/6QSrCi46o4s0dBOgJjhwFAkqs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496284; x=1793101084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtFWxEL5l4gt1QqpB8tv7EMAYo01wp+6U1uDsFvBX1Q=;
        b=s7T/VfY7mlSxgSJEEriL08bjnuLO+8jS4CB+/VVcv7AEW1Vl9Lvy787ikxoqid+4Wb
         Z08caVQhjcSl+f5B3DtXLZE4z97RlE7GMxWv0cXbcNIOz2XxYcYtTO+NRYuTY2MMfMPF
         lsZ+zBlNzE6FJkTre+IgBPfSNVMMnwKm07Ww5q2uFzOS/5t6rfxlTy8DR0mN68YWNMb2
         hMgaCwYLCLV+zkgvklbQ1J3sl4NPVXTudrRfYsZS1V0UJfDYNpyGRposzoV0ZcwKj9OQ
         5HTuXn11FgZw1qjXlBb5roLLiwuOk2rR01oGrfCydqZRtQUFLOpWogtMkxPuivTFdL5v
         cSAg==
X-Gm-Message-State: AFq9FYI5lE2P89G5YjkcneEN7m6mIYPYPQfg/7Sm3j+9nOnodl9fVwh7
	WChGgLVad7XNCFBhls9gawiyIYL97liXEN5YiHDMLJNt7PvPmxgwVNfPocpkQh3J96Eq3+LH8PP
	9PI/5Ozw=
X-Gm-Gg: AYBFou2tUClg4kE1gyJvxZBj9mGkthxAfkiftHXKjrpupTUI7kK7hwnw/ku7yuYLijx
	q6Ry52WZ83gcPbWfNDWpJeDmyuTO478f9ICEO8CW0YmqIrINDaufSPc8ItdtYkTjRZLnLtrtK1a
	B2wZERYYG9ghm64W2qdv1mblWLPyt8Cf4HSDMX4IL/4bkCOP4Sad5fhoEMYFqhm/Fs6c9ge65Nk
	YbpgZ4fiCZ/gEW8umUPCZnmgyO+0fDHzwpCvFW87Z23ByEqKE4dTDHIe8wdMP9cdbc8YGczG6E8
	jAeqyjK61pHdK7YLruQZuBdYNMSDuzVCkoB1zI2wL5iDSPOQaLeH6LX2YehNkwAvATOJjCayFWQ
	yDzur0bng5Pd2J4H0h1ettqKHxRLj7YQGWJn+pMDaOSrUSCByDA87f+4Y9mWc8HtCzX/Apc3lHJ
	Urm+kqZY8oKC84KW0xT8IQIFfQ0N+XadWaqiEiiwJsyH+ChkRTUSPgHCoAd54aeRx8/XiaabLwS
	FwkE05lEJg7UtUCbuAZc0edkMLuOf62ERmUFLf8WtGReDhZsxon3nz0DbA48r4FJKfd/QhqkrWj
	kOeDAvE6
X-Received: by 2002:a05:600c:621b:b0:4a1:dfd4:9429 with SMTP id 5b1f17b1804b1-4a1dfd49552mr178412195e9.31.1792496283635;
        Tue, 20 Oct 2026 04:38:03 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com (host139-112-32-195.dimensionesrl.eu. [195.32.112.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a099sm4709728f8f.57.2026.10.20.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:37:58 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Axelera Embedded 111c
Date: Tue, 20 Oct 2026 13:37:16 +0200
Message-ID: <20261020113717.189082-3-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
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

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC.

Specification:
- Rockchip RK3588
- 16GB LPDDR4
- Axelera AI Metis AIPU, 4GB/16GB LPDDR4X
- 64GB eMMC
- uSD slot
- 2x SATA ports
- 2x Gigabit LAN
- 1x M.2 E key
- 1x M.2 B key
- 1x HDMI2.0
- 1x USB-C with DP
- 4x USB3.1

Link: https://axelera.ai/axelera-products/embedded/111c
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

---

Changes in v2:
- Rename the board and its compatible following the name change from
  "metis-sbc" to "embedded-111c"
- Drop Conor's Acked-by since the compatible has changed

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..1f2627c53c33 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -120,6 +120,11 @@ properties:
               - asus,rk3566-tinker-board-3s
           - const: rockchip,rk3566
 
+      - description: Axelera Embedded 111c
+        items:
+          - const: axelera,embedded-111c
+          - const: rockchip,rk3588
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1
-- 
2.53.0

