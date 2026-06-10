Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBA23392A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054448; cv=none; b=Lh36HQCrQymgRtiukWv5rqWZzZdu4kNLzwqYLoUCOlV317qJ3F9zFX6GFzUwPztTcEhOB914VmXYmhVJakuteCJvtCyibP+TqNpDUCkTKW4CHJ3qiKnQYRpvEPKeiBzxM77eR5NwLLNmm5tMP8SS2rhU7HT1QdMPTM9EDsAm+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054448; c=relaxed/simple;
	bh=8Jq4+7GVcOBKAyUmh61mLdl1eJHUvEKS8qVvLj4xWJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YNqpzVoOKGSyOspTzXOiCOMx5WHKX3onuxe82Og/q01MwGryFsTdb0UTVyiA7v3yQyFHdI6QghjpC9uE8zf6TN16KdTqDgSvuXrCwYJVmE8slPMTnfa5boYvAXnnfmOZaDpPOGINteasn6EQmlBl1Prh+xqIJ/UQSE//FnzWTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzs/RZpr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzs/RZpr"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c858014845aso2540766a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 18:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781054447; x=1781659247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUH4vpTTcuqb8I5puK3jULXEG1NkGmpFTMLsVnbq6C8=;
        b=Tzs/RZproe9smGIn44QdevaLocZz1xTV9ExwLgbg2tKZBa1517uSHP7ZhMUspwNiOG
         vlnAzqBhSyBRO1DIDJVib++erh+rUm/NyIpdQqQXuaP3hq8EDJYEUaarZ8gRSLlXLNnT
         v4rAdWs8jiIwhillqNMnRJF6zt9AkhH0dn/hyM+hF/aI8HvedY1NfYVqfEWs2oZJA+jo
         +8E4w7P7dNVnGpUUh+wB4cFd07Scoe0Pm0J4Yj3ZfEasI/MRX/9p0LDi2I0Ve6dtHhtY
         EtyHALPJtUZ4H7/rfmqH1AjNd5yW3FfMecuWyeJy2tjCx8mRahrdo+6RJDdmettWqzYX
         ZPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054447; x=1781659247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUH4vpTTcuqb8I5puK3jULXEG1NkGmpFTMLsVnbq6C8=;
        b=rE9lts22lM3x0e85JO3agNfEynp3LpfogDN4Mu2nBr6MeYmHGEypVHZxHBh3DeqA+v
         PHOoJOzvMUgzA/gauyRKaMSrlWioC+C9k38+YzWRauhr7qkGXyERMG+Rkh0eKBowJqnO
         tLuWGl003+t1pYuNCVB0hBu81V80m3ZEmMEZ81p7V9zUun5u98QYMAFnV0LCZSDLZHFP
         xOgdB25eitU1aBMgc2CZ12PnRuWBnqxGSJ10+OFIYjg44kP7FnMgAPKgFM1vD0j/Q74K
         puazKwhWcpNiYe9wv1D3vLKH529Ii2D13eRYJz9SOJE0Jt6mhc/q91C+grzMBnHDtJbj
         +1kQ==
X-Gm-Message-State: AOJu0YzSohxPmSgfTUMLwNlZ35DfmfL82QYYwT5bj6fDtiTGHz9bM2ZS
	ca1nHUGvGR6slW8pMAWQfnpSqOY3HU1adRkFA7vrTmpWEIyJWBFTWHpx
X-Gm-Gg: Acq92OHo+g2TIdVLe2tJlmjgSZRsYBoIGbbRz/bJ0e73s1OiWoemRK+nknZxp4WKXfz
	/kzgbjVYThprNrsOTW21yEH28qBWiUTtoC9WqbMgCJAMGpukmNrXSRdFWx4owRmVnd3S+l2t0Ai
	IGsthsKnekeDsFx4RepMMUm7UzctYmCMZfS5yvfEa/NGlnhJpn6iU5Ua724ppOO7ygkbg+qKTt/
	aGblHT7vY9rtzVxsPPI1xd3sH+i4agibyD9o3qwaCSZGbXaVR1+HUjs+f1PV68Of1dLx2nL6pDh
	CX0MgyAmHaTY1EdJAGmKX6Q7tFR7pDLwXWWOsY6JuePSa9LWVGX2tqzN2Ydg2Kjf9khnqE+l8yq
	B0UUyS33TvyTTP2LrUVcQkkGicrp5V229f7ED/eSuaqvOHyZEz6hP1DmjEszwmNIwCeZ2dWjQ8y
	cofKCfRK+JHBgSJ3005aqQdmTvrkt82BahcLZOCWArzMxEGZcrUDvCncMxNugDXb5MRrnJQHcxq
	Q==
X-Received: by 2002:a05:6a20:244c:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3b4d3d5e346mr19126727637.30.1781054446615;
        Tue, 09 Jun 2026 18:20:46 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b2ddbsm18858370a12.24.2026.06.09.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:20:45 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v6 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Wed, 10 Jun 2026 09:22:21 +0800
Message-Id: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE28KGoC/4XOwWoDIRCA4VcJnmvRUcfdnvoeJQRdNRlIdotup
 CXsu9cESkLK0uM/MN/MhZWYKRb2trmwHCsVmsYW+LJhw8GN+8gptGYgwEgA4DWO8zk72NFIM7n
 jLsyF96L3CqwNiIa11c8cE33d2I9t6wOVecrftytVXqf/gFVywWUSKBEH2zn1vj85Or4O04ldw
 QqPiF5BoCFJ9so7E7SwfxD1i6CQUq0gqiEQfAoOnfHaPiP6jujVT3RDOoFeiOi0kvoZMXcERbe
 CmIYoG6PxQzKdx0dkWZYfJ2EQ1swBAAA=
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3264;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=8Jq4+7GVcOBKAyUmh61mLdl1eJHUvEKS8qVvLj4xWJU=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqKLxQz5qAfvzO4jxu9b6YJUKWGKm/aRg5aCp8u
 B24zB0LZ3iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaii8UAAKCRClg0K3CVbE
 gXYOCADIiQLAI8zfQcQ9SBWy51b1ync2ztOKHBSaZME7sVhPCmByKYs8LY3CDzTSVlLjgf4+07P
 0dejRle1qw/DTXvsWMNy1XKmjAK8RxF6OvS7xY8nKJpefUv25ljPLNhIxo/tbDBMlC1Lgk3eoyV
 9+TL/dpe1mYVCLQ+gSy7tav9nxr9lorGts1jZ7fQHN5l/qDIwQlO9+LyEVTE5y7TYdR2c5gDLg0
 mlyfNzrGq71+yok6pbaJUrvLxoOiioP9NoXCLhlsXx1bxR0ftMQUTmotM7p0+04DPevQ1D4c3gn
 AiJGC9aObJLixyOcBY1unRxYKQzQDGNaFD5VZF0Nf3sGsQ0h
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v6:
- Addressed automated feedback from Sashiko bot:
  * Clarified comments that io_expander0 and io_expander8 physically share the same interrupt line (Wired-OR) by hardware design.
  * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e, dac@f).
  * Removed unused properties from the adc@48 node.
- Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com

Changes in v5:
- Addressed review comments:
  * Added comments explaining the necessity of 'legacy_' prefixes (hardware label collision), pre-allocated I2C aliases (future expansions), and the 'ledd1' naming convention (schematic alignment).
  * Removed the empty `&mdio0` node to comply with upstream networking subsystem guidelines.
  * Removed the redundant `&peci0` node.
  * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
- Hardware/DT alignment updates:
  * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina230, ti,ina238) to accurately reflect the current board population.
  * Added the secondary flash node (flash@1 labeled "e810") under the &spi2 bus.
- Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com

Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2891 ++++++++++++++++++++
 3 files changed, 2893 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

