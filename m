Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981348;
	b=tmP5/0zVMdalAJsZrFnfB7zFtlbfFl/t9AC/ybMH8HfajedWTW+i8ljR7vZXF6dcRVsr
	 8j3osvalghmSxqZtCPU3o0wpJyzC7AD7a3mg3TT350yejo1FOKA8pOaoL36BmsQZqr2pv
	 cw1PgVgSXjsQTjPEQf5KBs4Oo+AakOwt/bXoazSqolz/kXsiRmhu4aomzQA5rAkWREV6h
	 V4rVXMsdF9mP97DsiLyyLFfX/+YRwZ+WNhHZTRmFjx70u4U2mwRXzrgpRPITodgc3OY4o
	 9sLbsB+QvjlfYw1Zcdbx7H3Fq4SOE+kdFqjyjLJP7aiU2sKo2TSYWCZ2vD3HET6q8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
	b=Ae3fcm0goZdfWh2yAclM88WUjLvFuqIBZ+M6DleB0j2KrIn816ah43KAAZGxi5REburK
	 sShwh7ASRLqwp2rsKn7j+UFjMEth0y0R+XT0w3IuYuCJGvVV4fGpY5kZ/Y/04YNb6AYTt
	 LRe2c6+dTCVmiYQVQb02xFm54fWw1E2iAThIz2JlJugctZzinENb2GCcLhwWCOn0kg81y
	 a6gNvxYD13BkBM5s7ggJhayIR1f279aDXPjOn09SgW3hVnmbP/JHDZ7U/gdfczO+eIgiS
	 Jn8F2JKyci8EzK/t9Wk/mIVoKx8qWLbGCSwMRQMjXApi0IPUc57gMKa9BqVRwfVH7kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zI+KiSws;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81C606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E81C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zI+KiSws
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2fcaafb7so5132a12.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981348; x=1795586148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
        b=zI+KiSwsA4PQIkGo7owkdUDnN1TPNh8a3xf1LTOkrKVgZ4G8n2qVOo699FBdqB1D1E
         Or4XU3NxYij6VvZwmsu+UTmLtTmSO9Myt4ctnji1Ooc6UjaSrQfprqaLq+Ll148jfnkH
         I/MI34gSLdaKiAOXPL/wZT2ILp9w1uxwuh3R+jAP6o7n1a+HqW72axEyVYQ67dCdMfp9
         oNRNVu4H/WwzCqC46I4DSiek0KBsE8t+e/umq3v9VWF2MhIVTmkOcKeMETB/NnkLRKIU
         QhJk+Tx8IYITYPAdkRc3AFXXjH5z6BjvYbINfwSQ2KKZG5Pf1oZ0Au8wv/kGPefatKle
         NwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981348; x=1795586148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpSIJOUQjOP0Sdyl3LIT9vfFufPLepKEgm5OjTXs6D4=;
        b=IIhZ1jUB5W81lh+RhJwsPKg3wayZoHnBVBDKv2Vc8TaO4ZzJm5ViX4kGFQKFIv6Uam
         J5Euy65EHFBI20ynjczq0UnUEeiCTcYy9YLF34DxbVYzYGXsb8vUY2XKk33HQRFvcppi
         zl2Lfz59kmYpGwdtl+iuiwHF7IpnTx2Fj2l2RzHtaGBltg4gRmlaqsAu1GBPeNhzRG3A
         G3h5Y8Vqf22RAPJ209aqvGybuKa6K2tfBkIMsuMZllUF/IhUc+zfKGojua++IMaZKPJ6
         eZ4kRRWukHGTBLSh9D2GhFq6zF1gjwzwMoFWpj+ryRl0HT7luoa7/ssKlAp1O2poigoa
         zMMQ==
X-Forwarded-Encrypted: i=1; AL+hErEz7tVNVdBGHxLxjohXRgE5QBzu1wvwyNIdvLqOA8Wy4CwzkTd41hHGCkrBo1owhjCLddgJhVjYJ8wu@vger.kernel.org
X-Gm-Message-State: APuU4Z9weXBW3cPuuOPbHhyJ1k8Sa0syHHOzxfKZ4ZMgt54w49OZEKR4
	fRczipfhHKcsBQbS3GAFCMEZWCUwRDBhg1A1UC3l4U2lf62eLIWzoCma
X-Gm-Gg: AYBFou2dskz14QWwiK08BmPGcPhbQT+OKgc0deKUsfTt2e+lYoQ1dWngjGeRZvT83xY
	0I5syTnxMGYhBXjf5/8rsdlOe56e6VFFPLdNQWI5s9wAVVWy5UucjboE5vd2ucD/ynw1bdff9W4
	6qGEuAPkTiu3gHb1CIphF3iRu57Eahk/eoT6w7/7o9vGjmkdiQQfP9WV91Rc2L03YaY+yHVZ3EH
	PbzVbndsbq3lJ7hDD2zUTUOieI/rKdgsY/wvNYZPCyPdr+HalSEEjDjFgXk59v9dnbWvHc0Q9nW
	gfCkb7AOZRGC87sXXj0nBbYkwgEiqt6Wpr43ka1rAj4naPRdatOryZW5NooJFScVOiBZLxIyRlS
	cGVPEoWjBALW5PfRbxgqaRhOljMx/cdOLCfitEVg+NURpbb8HurHDmYplbxB5GATJPqOLkRZ6vL
	3Cpu/W9YfRavQDW9JFGVcocsoElDa47nm2DJ4IAWDVmyr5vxMpcmz4DglWdgxGYhuH/WbYexbl1
	MKJvYFosj/KgYZ3BkBLJMqXn7Dt4cvRsmO3A1+Uekd/Khams4cTewPwhf1y+a/bEiOo1bprTAfI
	VAiiIJLQ9nNC0TWrMA9LbNE1AiOIAeOyONz7dWO1gnPLseovkDZBRPNGw+y3Dyu3gz1DsaADvTK
	Od6IBNdFiktqcbyFwhXYs
X-Received: by 2002:a05:6a20:8c24:b0:3e2:3392:540e with SMTP id adf61e73a8af0-3fe83bf23fcmr1761880637.0.1794981347492;
        Tue, 17 Nov 2026 21:55:47 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:47 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:14 +0800
Subject: [PATCH v7 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dcphy-rx-v1-v7-1-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=1462;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=7sQblceXUwwCxWuG4J0+9R8T6ZbfrV3Py9uIEDjHBZ4=;
 b=IISL7MaqFphE9FGykkbqCzIkGXZYfy271E+jKBfZ7rU0dt4KAzfvgE/OuNoSaciPzWsAGmK4E
 OSqwrJ3fqQGAyD5ybTFE/M9BPzMkGPkV3z/56WMpIf/GGjEDLoB2TfW
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

