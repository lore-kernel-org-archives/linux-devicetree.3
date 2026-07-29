Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705529E10B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288272; cv=none; b=nRC3JvxqRg2ZAi2G/q3NjHDkc08jI8PxbhTpRptnBsfGkmmANrw6uagkw1iiV0JNs8e0/Fray3sUdTppAIt9tI1nU0UcwGGUOlsslMFjBE9JDquIqsHzJTLIdxZ3IPasaNvGUBf38yOEQRIE8eo/I7CNritnxOfu41Rv97YIr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288272; c=relaxed/simple;
	bh=FijwwOL07zQKE2wPhWBm6Nh3wRruwgeJcnKYzc3Ngjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X4AfyhoQfkHuVVdGxzkUpX+KlAWLAErvvhJgJn5g2KuM13yzeWNycfPclmL2jq236Ivz8wqXZeN6baFtrtt+eyzJwSTuGlF050bMea8J+p/pt1gltHl5fk7wVSNAa0Xtgz3L/h6JLQE6GOQBdIw9X/woJzB8zRzM1nUHHfJjfB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3c0qrww; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3c0qrww"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487088510aso436712b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288270; x=1785893070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTUUYZoRzWnQSYsoa3RJtC9OCCoaKFk0bW+TVIF3cnM=;
        b=S3c0qrwwG07MRy2ULaA0OHw1hJfDM7ZPV1NbVzFjYpSyi8OjlZOq3Iqvlev2/1LJic
         LP3hkGWzD3Nk8QhoFVIXYCcgiafek6grU2D88w1CUqFP6RMnN2wYmqXkSFJC5pbQHuUp
         gYqNjUF+N/S5He6s4SNBn9Z+JqbidQtNLKIEEW0aamPls0DVf/cHTEJGpoq0YKAukoyp
         1XNco9E0adwi8IlpREdDJClOLE7M238XcRHm9sbxKF+weNO5emTOe3cVEvDWyxUFzHa3
         70UCJA/V0VAlqOpNUxDdNi2YQXM7urk7cJVBQ8WuqD2hD/D9Vi3z5V949SqnK4M8Amyu
         B6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288270; x=1785893070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTUUYZoRzWnQSYsoa3RJtC9OCCoaKFk0bW+TVIF3cnM=;
        b=bjM6SIprjFZfLu0VyDM2T0FhHPCFnvJ2UCWTEcVx5C2bAwIxcLB+TwoFTb6g1JWLz3
         O0EmUaiA4z+mpsQbld2SdKx13/OnDAn5bXOCFow8/Rf5uc++wwUnAIIfvvBRdiCag/yF
         UAmDBmbZyKzb+WCvylYD46mWbbyzlsqGThsPNLd2UtIbKfYq3sewGk/i3DlVWTb7cob3
         uWhN6JSRrxDHt4cIakeMnpOTJKVaAXXFeyOpiUDbIgt5Nrx+TM4FYzYVsl6uGfJmX/2u
         H7IZgRhmrz+Bz65ega1zJhDeU8NL2QAZrpxYHMGGPXaFyEp8/jsAZ5PnaDEU0KqEPzy3
         BRAw==
X-Forwarded-Encrypted: i=1; AHgh+RpOuqam6sgYD96TAB67HQlPIhykKCvZ4hUbcsuUnl3XmskNtlabpgJ7GVtcN5h5ZeZ3f60T+ddaAL7O@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQnNNWvyQCxavMyr672fkzlZ4GYFe/3P/DKlH5yI84zgiADhw
	1Rgt1fqabfbaRZqSZAdWHP6yqZzKzbbJOS1EKALUHJLyZmMYyTjkCXe5
X-Gm-Gg: AR+sD13eNmaRI3Vt8PFwGlgOKT65AdZGDfhYkQqqJB/XDmeKrertBubW3N8yDnpBihB
	FkOUhT1mZhgCt/9SwxIlPFkuPtYmc/LIigy5zL5qU6Utc/VUIGo/3rPir8oIAn6npxEpGDDqd0+
	YuWTKtkxMx/kLXDIdukG2P0MobnBXtB6Oq5XwWM4aXBU1wb4G2xbQ59icro60ZXX+WpOjWJiFG1
	IFGzMuR/Xg2Bzq7PX/jsY0VCLsBrR78GxTKp5VYhYHUikPSq3o5OlPyvAtvhcI7c3cl/w6LH2M4
	p2abII5c8Esc+Ii7vKpEZW1YYGFsJ6X8wJ+VGPB150fFotb2ZBSKlmFt14wZfkvRlnoxKUidd+u
	+jIjBjAw0V+v8hXbepDu4ZrWEMpf/dwL9pjJaWp4dbHUQAZ3W1YbwKfP8s9cIPt0ywefEe4hsPB
	I2YnWWbbhsrSkD67Ldx71L1LKx97NN7kiPi65K/qaw4ZdFLImRGCm97M7kG6w=
X-Received: by 2002:a05:6a00:1248:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84e9331b006mr4904021b3a.46.1785288270033;
        Tue, 28 Jul 2026 18:24:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm595509b3a.1.2026.07.28.18.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:24:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
Date: Wed, 29 Jul 2026 09:24:16 +0800
Message-ID: <20260729012418.154652-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the previous commit does not change the phy node name,
the dtschema can not recognize the type of the ethernet phy,
so the following error is produced:

/arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
/arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
set-deassert-us', 'reset-gpios' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

Change the nodename to make the dtschema can recognize the right
PHY type.

Fixes: 6d6536c880fe ("riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d78416f3118e..e91a4712f2db 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -195,7 +195,7 @@ &eth0 {
 	status = "okay";
 
 	mdio {
-		phy0: phy@1 {
+		phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
-- 
2.55.0

