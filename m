Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083176;
	b=uUk9HFlbkC48kxhEw5HER70klx6F2I1nMozskGdGMCe1L82UjH87LPtATKMpS/lEC+3y
	 I312Vr1f7EbcMvEBYh3OrIJo4Fnyg1bWkr3GYoNViH03cl5Lt5lwZxEJCGgTJBACUv2t+
	 on2y1z4jwW/e/yhovgT8+UHxxaAK5kY/WaWhMt9SNb2I7l0JY93BAOXA7AVHqI98ni1l1
	 sokgs+bbAL9fxvuCak/JxdiyYuNkN/E3eny/MO6hb6dq0x3Zky3M5gUHLwnPEgheoPkw9
	 wzcf/gmC+CduZj8FNb5RJgxjVIXs9AX05PY6D3iQM60XJDQZXLoXikccg/vNwejbY3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083176;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K03F2f4Ft9K50wqvLnOpW9292yJSmRuD1JS5YqElWiA=;
	b=bhRSd59DA5PN6cEKXoX1hyiF1PNNtbEMdgvVH7s4YCPA5BYz9f/noEoFynO+G21rCW6/
	 Y13nffaca4AsSvsimd2MwK6HDOobuYGfB+SYh+sY0TjexiH6+/7r3h16gQhA8BsnIw8Gj
	 fgPJG94Nz9WDh6jwTuWSDjWTbpqgMKpNLtk1DJmjqK9HQyry+6kE81b12SFU30TqYK8JE
	 7bhLmG1WjGTGZOhBKjNAEkTggQL/yZfbii0hVvc0zfUqiCxK6jkgS7i6pOXkYTdbA6SAK
	 sOdhdjCySAGicEiWvqd2UcD6Mqg0QtwOR76L38gEJe4HasBtq57bVtY5nJ9PgvJOcSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jt7Crehm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D19606A331
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jt7Crehm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083176;
	b=zz7ubXUdGlR+MQvsWe4TgMMT9w22qynndfy0YQdzHPjJo2kM2CkDpWZBOeWO1IEoxvBn
	 A49wbqFQq1kZ30VfVzVA5lVx19SVKzJr7YT0m9zU3pX2NVTtW70dGXFoKjHHizbwgE1Te
	 bzDjV3TqdRkAX1osO1pmwnkH9jjDnJsji5+Z+sj08MxB46HpJVn83EqosR9mq5EGuzZDt
	 tXkELr7cJt1b3X23mJUhxcsqKL+s0vazqP9uFB6YjqxMs3mgZfKrgZEiM1SeDFe6VS+H6
	 b+bfWh8nucjhi5E41uW2FbXIpjgdfsPyXZ4ewR0wZTELaGJybB2MFmNLEPl3hvoTkww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083176;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K03F2f4Ft9K50wqvLnOpW9292yJSmRuD1JS5YqElWiA=;
	b=CVakwcCbm6QfUjnpNCfBzny8q21+YNxCnKVBM+kb9P8nhtDeypeN0I6LUlIL5N2bA5mR
	 Xppc1OSBrTDeFAcokaMjVjw59pcUPcJO5lZJBRob1SpSdftwoBi1QiHk27QVH62inp5jB
	 dhWjRSiuPXiocdff7AZPmbPtGWAMpFx++mVQ0Y3bXB8rVduBa+fzIhYwWIo9WoJTkc5ej
	 v44g8NnEjYgr1tUHMHzRBTQK0Lb1iHrpoPy5b96xlW2dsPTgyrkfDf6edv6ZTFLKOD8SC
	 ig+1pXGHFzgtwQEnQKTwK4g68RwEBDNgo9OOjk/c45JBesjCLHNbHZ8rDz0VL3Ex3GA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCCAA1F000C8;
	Thu, 19 Nov 2026 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083176;
	bh=K03F2f4Ft9K50wqvLnOpW9292yJSmRuD1JS5YqElWiA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jt7CrehmLMGaLTM0GMaSe3CYXcE3L3UMJtET6YQZDHD9wjJwjzEaiWy583Plu2gtG
	 LcSCBtrMNawctw0ct6AbYJODQSfu/Dk2v3pY2qAplis1iyUcZjD9yPswwZ5lSrPakZ
	 gO1LiwEGs1flg83I4VmjtlNC5GdmA8PgXHCDUQWhmy6VWDmyfDAlyeot1Ur7puwgMX
	 Xl42XmeN6Jm5nAF5+ZEj/FE9XLUO2CCpyt72QexoDICAo2uSBoQiERQaGoQP5bHf2G
	 IPgne1ITX5Zo+ED6khEOxMs5qnjjtq3hgC6yzUnhrsvqUpv8myilrgOWPalZtitz52
	 NjeodRq44xbnQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4851C4B208;
	Thu, 19 Nov 2026 10:12:55 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Thu, 19 Nov 2026 18:12:34 +0800
Subject: [PATCH v2] dt-bindings: soc: rockchip: Add RK3572 PMU and GRF
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
Message-Id: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
X-B4-Tracking: v=1; b=H4sIAJHL/moC/22Nyw6CMBBFf4XM2jGdkuJj5X8YFqWdSjVSaZFoC
 P9uga3Lk9x7zgSJo+cE52KCyKNPPnQZ5K4A0+ruxuhtZpBCVkR0Qm0tNkFHi+FRqoNEgykYFI0
 jpXXlVGUhn1+Rnf+s4mu9cXo3dzbDYlsWrU9DiN+1PNKy2yJCyn+RkVDkinD2qHRJzJe+35vwh
 Hqe5x/Y49qWxwAAAA==
X-Change-ID: 20261119-add-board-ok3572-c-soc-0bf15aa6f56d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083174; l=5318;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=b/rDTbq4DCmHSU701K3E2hX3KodZSHqR0es+ciOnncM=;
 b=T1wmbAcUr5SHtkt0cRgeD/nv42XSiVmV7RqDZ+6uN8OuohfqZgffN9iSBgDLcYGlT/0+iRMyU
 M8sXcuF/eNHBKdqabV+HA6x9dmbPPvJKqH1GtKy/abpUtZcqtw4hRRO
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com
Content-Transfer-Encoding: 7bit

From: Cunhao Lu <1579567540@qq.com>

The RK3572 PMU and GRF blocks are system controllers shared with the
clock, power-domain, and USB PHY drivers.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
This is one of the subsystem submissions for RK3572 support.

This patch documents the RK3572 power management unit (PMU) and general
register files (GRFs) used by the clock, power-domain and PHY drivers.
The GRF binding describes the USB2 PHY as a child of its GRF and
requires clocks for the NVM0, PHP, PIPE PHY and USB2 PHY GRFs.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module.

Passed functionality:

- SD and eMMC complete the firmware, kernel, and root filesystem
  boot chain.
- UART console works at 1500000 baud.
- SD read/write and data persistence checks pass.
- All eight CPUs start; CPU frequency scaling and hotplug checks pass.
- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.
- All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
  and reconnect persistence checks.
- Type-C host and device modes pass in both plug orientations. Physical
  reconnects correctly select the expected device, host, and device roles
  in sequence.

Some files in this series are derived from the Forlinx OK3572-C BSP
Alpha1. Thanks to Forlinx for their support.
Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
Wang, William Wu, and Ye Zhang for providing the driver source files.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data
---
Changes in v2:
- Split the original RK3572 support series by subsystem.
- Link to v1:
  https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com
---
Raw dmesg: see the v1 cover letter.
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml |  2 ++
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 1cff2328cd01..43dcaa77ffdb 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -28,6 +28,7 @@ select:
           - rockchip,rk3528-pmu
           - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
+          - rockchip,rk3572-pmu
           - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
           - rockchip,rv1126-pmu
@@ -48,6 +49,7 @@ properties:
           - rockchip,rk3528-pmu
           - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
+          - rockchip,rk3572-pmu
           - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
           - rockchip,rv1126-pmu
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7c138..0e0bf8e234c8 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -30,6 +30,12 @@ properties:
               - rockchip,rk3568-pipe-grf
               - rockchip,rk3568-pipe-phy-grf
               - rockchip,rk3568-usb2phy-grf
+              - rockchip,rk3572-ioc-grf
+              - rockchip,rk3572-nvm0-grf
+              - rockchip,rk3572-php-grf
+              - rockchip,rk3572-pipe-phy-grf
+              - rockchip,rk3572-pmu0-grf
+              - rockchip,rk3572-sys-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
               - rockchip,rk3576-csidphy-grf
@@ -96,6 +102,7 @@ properties:
               - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
+              - rockchip,rk3572-usb2phy-grf
               - rockchip,rk3576-ioc-grf
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
@@ -259,6 +266,7 @@ allOf:
               - rockchip,rk3308-usb2phy-grf
               - rockchip,rk3328-usb2phy-grf
               - rockchip,rk3399-grf
+              - rockchip,rk3572-usb2phy-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
               - rockchip,rv1108-grf
@@ -310,6 +318,10 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3572-nvm0-grf
+              - rockchip,rk3572-php-grf
+              - rockchip,rk3572-pipe-phy-grf
+              - rockchip,rk3572-usb2phy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-vo1-grf
               - rockchip,rk3588-vo-grf

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261119-add-board-ok3572-c-soc-0bf15aa6f56d

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


