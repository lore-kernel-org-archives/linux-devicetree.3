Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A613F9A1E
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505517; cv=none; b=G+qmHVp7+0aUutRmVIg4knUel4P637tpSKqq1IzzYxzRmxR9zYhdVFhl9TplKx5NQ+8ZHhuwfZszwzgI0oo0hZhPD7zJ52JoWCqlz8so60PR1R31ghfsmRRgJvmoy9u2RvZu34SiiC+u5EWWY6x+oPq8tdIpj2b8s+5NH2Ejxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505517; c=relaxed/simple;
	bh=dlVUl7bzR8j4uxgKwkmLFvf4+0M2KU8ullpBi92dtio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISOao0mC36kIF5agwjXel2Cg8TxzuYFkDqgIamb+dgLMP/Goiu/eEKk7svOTdwAJKszZnMUcPCve7cUbBHD4XeNwXXvJyT7sL60o2OmEyOIyPVm4dUjzvb8iCyWu+oyneHhPTkk/ONYLik987PK4wV8sGuIUpaO7iw+8kXaVVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p/3+iy6R; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p/3+iy6R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=jy41rL2C99WwqbzsGdokIDAJtd++SsNXJlNToXkn2/E=; b=p/3+iy6RKWR4fabVY+veX2qDX5
	3M6Mi0mDKUOLqJpVxavXxhT5TUBzoqRyOBfPQSvY9OdS4qwKr81ni24bLEnwzYXfgYygDKrEGxJct
	25nzHXBtAe13aaGZhgGt5jgwgS7x90RNlwXd/UpsHT1dIQLgP/wC2cUGVU53dCEEPhxaF1KqyqXLX
	u2BmjNKSXeEIUK6BqBQzN0mReXSRbLFLqkHhV0/r29t1bb9OyT7mOQNC4pec9leyev8TTRi6zDXWj
	X/N9ocs9CoBcGaoE7mgLkJby8uxt66PizPofzNZ6JU07/9Lan+z1NGmfX3bKwLh1cA9885wBBviaY
	wqxBE33Q==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6a89-002dV8-2I; Tue, 15 Sep 2026 22:51:53 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 15 Sep 2026 17:51:27 -0300
Subject: [PATCH v2 4/4] ARM: dts: bcm2835: Add the V3D reset line
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260915-vc4-reset-control-v2-4-cb3a25b07822@igalia.com>
References: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
In-Reply-To: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=dlVUl7bzR8j4uxgKwkmLFvf4+0M2KU8ullpBi92dtio=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqqa/Q000cUx/ZW8mpeb8DDfkPFYfpnTN4W9XSh
 LhU6EWLAtqJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaqmv0AAKCRA/8w6Kdoj6
 qqJeB/oCNt+zDr+CHDkq0/Srg7hMhDTiOysPGHI+za99lJDZgxABoGypT7fK8AxOghIgr6pqnTr
 Xa0OH1TzG5NWGyhNo2/h4SS0ExyFkj/y8nzmx5lLGRvEfrQVDZGJp2SeRBFa2if/ie7H/3MupzD
 g2Cbb8ryaLzl3gsNJcC6cACX+bIpSXjXlHrNxhj+n1GEREMQij5jBbLBeprKPXQIIYNFsoyicMa
 ao/wfPVPBR3aX5oGL1ZbnD3pIZacL7PBzO4f/u5Hs1gairAfoz5/W+VC91PQybMuSjwMs/clFI4
 JltT9I2ZkdYQCyfOUgl9Jf5Gk5P10y8zlQGGC6jMrE7wlCk6
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The PM block exposes a reset line for the V3D block, which the vc4 driver
uses to reset the GPU when recovering from a hang instead of forcing its
power domain down. Wire it up in the shared V3D node, covering BCM2835,
BCM2836 and BCM2837.

BCM2711 already describes the same reset line for its V3D node.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 1e76b290510d..39eea8ce1058 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			resets = <&pm BCM2835_RESET_V3D>;
 		};
 
 	};

-- 
2.55.0

