Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857242BC37
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174021; cv=none; b=mObalHE6iaeDnrvKsLYLcTYG3v7avUfItW7g2A9dIkmgLI86Ia+V1ArezsxBjN3P2LcXAysyt66WPpG0m0s+0ffyo+vxm4HoDJAbi+0xDmdtVEPDKoHLGIU6zKmjo3STtoCokR00u/MzR53WGZ2EPTD7hFUo09cwIdhh4ozOn68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174021; c=relaxed/simple;
	bh=f6zF/cZY66TrE8iQjjIRaAGEPDZaZ/nB72Zpltal4ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7Ow8libARDeJ5AXgzvBzsNKkZkOfzs4lAOF3ZqnACu52ClqJACI8K2BqS7MhDsm6ByaxctbaPx/5TsNkFZyO7ArY0xRVBaM75vRWuaMAqrIVdYvOEwWp9kRCMrMKq+p3u5J2MCJJoJR6RaaPac1tWMPdNAgiIiHa/A0Yz1NRE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixl5cU17; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixl5cU17"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2989530b3a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174018; x=1785778818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLAfO4vgeRYgxOeRuUb0Ab16fkzdVk0WYV86aUUze8s=;
        b=ixl5cU17Jf4tzf0G020yjsu8dlwWhw8luIRcjoiO+6k6u4wIvhwWxmZ/lUY1b+JjhJ
         0LKcarFzML7aH2nkzQqL6YQwZL6GaNl6i814J7F4YeXvctbs1HzYJFJnLR4op6EzvpP+
         Olu5YkdKpQ+Gdan8SKWP900ZzcB7+zFwc0rxj8PEasquowY1eNHHQwK2dtXKKV7mcHc6
         MyeYu4HAxCSBcRbdzVfCkWEs/r13h5mu4CeGDAVNQCEopwDPyM7BCt4vT3CknzYnB5az
         +R+S9c3cbBSFSgjEcKPPDwK9bQxgWgDSRGZVhcf7810xfXrKuZMTl9ya/5m930tysa3e
         KunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174018; x=1785778818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLAfO4vgeRYgxOeRuUb0Ab16fkzdVk0WYV86aUUze8s=;
        b=dtG52LJ/jacoMPIhSL1liC48KqIxG3VU4rTIQNwWs47lQZr49h42N3cFe6SBj3O4jV
         w9CXpg3xgV1UuRO8QXbymvmDbgmj1ZUng8dhvekLpp7UX5xETxNnSICIcZwprWrbKifW
         yem+n1PCHvBYY344zNzXEhCo++HH4UQMdfp/g0E8ibLTDDr0BFhVMxa8FHlQfaJ+qeJ0
         TGiMb96PZL8X7Ausyos/eiXxjv24joxjpw5gc05MWz/nb7lH3jqDzMoxzV6f5mTwEZXE
         Ttw6LQ5Pd78SiqQOY6J8SwYNV4TlHh1JbZJTiOYbvCp7CkYZwoeR+gX2YFefn65NJ68U
         sX4A==
X-Forwarded-Encrypted: i=1; AHgh+RrYX6WChgnq88gD1fyJt6y58VowOtI26QSFH4Ob72p53l8mAxQHhBEajKsIAGxuhijx1Y0bsFBjca+6@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGgwo/rL84oAAWIy3tyA7e9Fj+2U4kUmLXtNxXGRqr7qVp9tZ
	GaHqQDMWrh/TDsx9519nXB/JpYGtwQZGOWh9NrtIcvzcQ+dOD45KhXdw
X-Gm-Gg: AR+sD110XnHhrbwlp+UEuqd0myunOiyG0lAq6E01Os8y67Xe54nOFRb5/ZLIrS+l79G
	HtQ61WehRM3YFYg/VbzP1TXC6KQJAmp8fxN1WoV54kGNr5/+9K7VNw77FxwuhSwlMP1Z0ZGLBQu
	1Yu/0vSlk1snE3IgQC+DULOgt9tPFaQOORBtkbz0/YSoWAyUw+sj4TiVpw2tq91u3kMZlk6AoSv
	njr6eZHybVSKAfaDxR+Wa4bsyOLaSHHhsXYhOPm3dIwZ2EP96VZE9pC7r59354t+7IYOfh019fV
	g6h3Pw8vlAr2w4fK/N3nNXNec8VonmeQD+215FDxNZeTIt5ju6kLfIAeVhQatxCpIg43WsyhGcu
	tO9sc7zzoLVclZdQ/neGME33NRGx6CPBlFhBJqOnnOIL3oy9rshh/QEuDgUGEdBAbilwGveug+S
	Ugs/SQu3ZFpV7PETs1przaT8KTQRB5+TyAizUENStC7t3DOf6KV58=
X-Received: by 2002:a05:6300:193:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c6c8016bb2mr582045637.42.1785174018200;
        Mon, 27 Jul 2026 10:40:18 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:21e4:da15:d321:6b72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm33850735eec.10.2026.07.27.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:40:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overlays
Date: Mon, 27 Jul 2026 14:40:07 -0300
Message-ID: <20260727174007.2581714-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip RK3568 MIPI CSI-2 receiver binding requires the bus-type
property in its input endpoint.

Specify that the Radxa CAM4K modules connected to CSI2 and CSI4 use a
MIPI CSI-2 D-PHY bus. This fixes the following dtbs_check warning:

endpoint: 'bus-type' is a required property

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso | 2 ++
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
index ee9ecf68a886..5c7fb960b099 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -80,6 +81,7 @@ &csi2 {
 
 &csi2_in {
 	csi2_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 		data-lanes = <1 2 3 4>;
 		link-frequencies = /bits/ 64 <445500000>;
 		remote-endpoint = <&imx415_output>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
index 8a4cf3fdbf8e..1ee9036b9095 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -80,6 +81,7 @@ &csi4 {
 
 &csi4_in {
 	csi4_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 		data-lanes = <1 2 3 4>;
 		link-frequencies = /bits/ 64 <445500000>;
 		remote-endpoint = <&cam1_imx415_output>;
-- 
2.43.0

