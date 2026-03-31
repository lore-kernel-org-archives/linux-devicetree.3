Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2943DA7CB
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966689; cv=none; b=edfnk3drSvgd/t4CAtXK+Dkk297E6V8gV9pB0oB+fvNJZaCEukqqlmlyROasIX+TX/wJg0EsEmNO8JeanCzw1bc5n+UfoamUBdcTqHHCCJM84SH3PCHqOBJnFWbm8ZPXCDrt5mDstM9HCuHIOCZlYv9ypJfA+dgc2tddOu5E9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966689; c=relaxed/simple;
	bh=AbQyCSLZM68+qiJbFWcZMQNt3O38jdMkprUgpfFdxno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Monq+HBTxZKsAd/j1jOdGyMBlcgpFBVLhtReerRtscOynIiepBCS0ae/bG4EfuMZZ+2WyxfP2Jfl+dzDbLZnV/BRxomnLUDFKEqdF2zV+jINwcEtQ6OMFxOtgt5FKK5YlYF3sY62HgDPQxPXu0bdg0YzOP6TD3kW00OK+tH/aGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8vOmUPO; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8vOmUPO"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65003f40a22so7480413d50.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774966685; x=1775571485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmozg0m3DQsYpGD8orkO2ipP4TyyaAJHZKLp0sbHtfk=;
        b=q8vOmUPO10hIybZ86rx2LL7VDbCUYtxPuiOhDe4vc8VtTS2b3ZeiUgUyBEzPT/RUIm
         leSJWbbKIP6IrdGWzKs4bo86S+3f4KsMBV1JI6JJ26LwCfhb9cEZJmWVqtIkRlFeJSkh
         +DKs4QI0+/bf/1n35Zh3MCQYxiTIDBWdqh4xX9jRoqLdkzOoVkuWQsSMdiyxmJKFyRYo
         0Hz1aobOkWglQ3Gti5N2hF/RgsPZPiomkW8jBN5a3fakzreYh04scKqp2a6HDg7MBBnQ
         juoishfIywZuYyDof2Jkafk8J2mAXu421YtVgLtPxrt04E5+umNFm36sS6+eeRQtquys
         SNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966685; x=1775571485;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmozg0m3DQsYpGD8orkO2ipP4TyyaAJHZKLp0sbHtfk=;
        b=h1I8DOIgEz2s7FkO/SSQgrFoxVb701rudtFCp1VBpBlHtk5HvOTkVpyx7OEoBkLHHY
         iigv6x+0jNTEJps+msRFx4FK5K9bSCtg2wieujQOxXd6PqTkBamfokVmMmwDB/LjB5L6
         uUKKQcHkFiR2X7lEgD8e8gASWr3x111avEFPaec81VC1nOI7/lqtNDltYuvW00axnbmP
         Vq272qE5cuIJ1ChM+/WhGCzx2rugxoiua6R/bxy6nezmSYFzSqeQEta8B2H1pc3vJhJF
         rZ6AtykH3kQeFQJPMs5yV3DQGT2XWO0nhHGjgQY0bWvYcOz/2wAYeh42NYJn7skKmCV4
         w/kg==
X-Forwarded-Encrypted: i=1; AJvYcCXFPC8nF+CD/+yPvt8nlSWQfpXxOT7kCGyYp+gtV5B/EQnH5pgOYWfzh7z6dlcMwgNfKWCpUM7pBF4n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxfcp6JnCXPb1L8tlFGm/E4nJlODxGgwjXEWfXnmyIJaVe/gKV
	/Wfg1fID0cpUYl2C9uX6gpjm7R6ZBJco7dQLD42Y2BKdZiNOgiZ7uu4G
X-Gm-Gg: ATEYQzxfMVOY9xmf4HYpVB5BqovtHlxXgxRP5C+x/nRhOHk1p3w6Fh+6Y+eH4SFRZfn
	o9ww7ycGKpgryafWaRrOIaPe3IFageAo6LSNolhaR5QAe4cvnmhoQavWrlwUhvTwRfNnuHiMU3J
	SHFzF+eWHCnuHRwSMe7e2CgsasQP9HaVZvX07fePCHQOogpSVtoRURuPpxANS5ZgR/nMauC0pTH
	o9tlkTurGaYAYY6HIN0vrXmHEAs1dAw9WLcNs/0QTAtXwHddysLTzkQKZEbczgOSVOjR+JaxrDH
	nkGLgNn3FNXkSLbkHcEhgstGJV9bkIR3jP/WwNgfHxfcXHHcU+7nCDAYIj5HVFQiq6cDLmp0Y3Q
	hcz3IHZXXA+shCgJYz2GWv7q+G646tRoXC+I31lYdl9x5nmgCz+dWJAOGPrjOCUmd4fPVrPvm9o
	VE8KwqJ2JLqZzYAlDp
X-Received: by 2002:a05:690e:4408:10b0:64d:6cf8:f8c with SMTP id 956f58d0204a3-64ff73d4236mr13831172d50.40.1774966685293;
        Tue, 31 Mar 2026 07:18:05 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-65009326eddsm5590599d50.13.2026.03.31.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:18:04 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Tue, 31 Mar 2026 09:18:00 -0500
Subject: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTU7DMBBGrxJ5jZF/iD3qinugLsb2JB2V2GCnA
 VTl7pj0ACzfSPO+dxeNKlMTp+EuKm3cuOQO5mkQ8YJ5JsmpszDKOGUNSGy3Jq9lWTCnIjOtX6V
 eOc9yjMppg+gCRNHfPypN/H2o384PrvR56wvr4ygCNpKxq3g9Dd6FF4pAU4oWwMcUJm9VQkPjC
 KCnqFGD90r8uS7c1lJ/jupNH7L/AzcttXQuWQUBYLTudV6Q3597gTjv+/4LK7ziOQwBAAA=
X-Change-ID: 20260328-asus-kommando-networking-5c0612aa6b8c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2

Adds the DT nodes needed for ethernet support for Asus Kommando, with
phy mode set to rgmii-id.

When this DT was originally added, the phy mode was set to rgmii (which
was incorrect). It was suggested to remove networking support from the
DT till the Aspeed networking driver was patched so that the correct phy
mode could be used.

The discussion in [1] mentions that u-boot was inserting clk delays that
weren't needed, which resulted in needing to set the phy mode in linux
to rgmii incorrectly. The solution suggested there was to patch u-boot to
no longer insert these clk delays and use rgmii-id as the phy mode for
any future DTs added to linux.

This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
modified to insert clk delays of 0 (instead of patching u-boot itself).
[3] adds a u-boot DT for this device (without networking) and describes
how to patch it to add networking support. If this patched DT is used,
then networking works with rgmii-id phy mode in both u-boot and linux.

[1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
[2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
[3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
This patch is based off aspeed/arm/dt from bmc tree
---
Changes in v2:
- Commit message now mentions that the u-boot tested against is the
  openbmc u-boot fork
- Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com
---
 .../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c336236c3b9d01b7de1bba 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
@@ -107,6 +107,24 @@ &gpio1 {
 	/*18E0 32*/ "","","","","","","","";
 };
 
+&mac2 {
+	status = "okay";
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mdio2 {
+	status = "okay";
+
+	ethphy2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
 &vhub {
 	status = "okay";
 };

---
base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
change-id: 20260328-asus-kommando-networking-5c0612aa6b8c

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>

