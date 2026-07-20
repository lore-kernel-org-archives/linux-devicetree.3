Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC03D969E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541840; cv=none; b=Z0Utj4PBP5gONe6u+inq/5VV9ecE0tKShTajcUCbU5P9QcWnfDLMuEU68TrU54iynw5keX3wodrae/ippoH88YJYb/yaQ7/y/rQyubOYfbL+vI+dA/vZk6l7TSQv7mzOXt8MdmHrWfdJma6Uni6uWt9I4qa7/s/qUnrvoyxwJfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541840; c=relaxed/simple;
	bh=Z6kQuyieMuopwJ1tmnc9HxmIwjhsdZNL6CTw6x57HJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0EuZQ1ZvP78vNJJQYzUtux4g01QxH3Vj3P7FtuLtUqtOw+4kQKzlzyggchbnU+WBL/7wI0B4ILEUXHneVqZ5eGPZcU4OjTWhSvPcwYu1Rl6WEqiuBB9BBw2zqthdOZtI9eV7BSQJBEa86HmiwhirW8J6c94jMfw/XCJn1NyW+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=ov5g7zBT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="ov5g7zBT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495590ba856so9793995e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784541836; x=1785146636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U/4pTpx6AbELcRk0BkaznBQbTZTpi3siIIG3MSwhjA=;
        b=ov5g7zBT+W/rQgU777YGn8N/HAH6NF1NBuy0uPKdrkYv45gQ/WNqlDLhYlg5VYU+6V
         LGk+40w914Qjgy1uKB5EDwxTVuWlV7Hdm2yejoFhxGwEeXYYB0rmG53jwkZe/6ENhwIr
         OOhWRAl5kb3fEy1kkGfMEo3QZhz3bsAa4yqovbseBwkB3s+ylybH+YYdwuMj0fRAZeXJ
         TnLFYmO3KtLOAqjYJfQqIENokwJywI6KD+LaR7km3b5VhaS1H6dpgi3kASkydEjUvcIO
         /NwIOR6ZRwYx1oxwzDAAOn3d0jv6qc9jU7XoemgvFCg36hg0M1LQffF5hi7Rh68sXom5
         yG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541836; x=1785146636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/U/4pTpx6AbELcRk0BkaznBQbTZTpi3siIIG3MSwhjA=;
        b=MdeZgTL8JMq0Umdk3dTIwGNFKO0T7KjD7vSOJghLZzGHgWIFHt8BinLRGkZQeEIz3s
         tj7w1qbU6A/2KPmZCks33VQUUNyUAhGMMns/a6YVz+KgSBH02AHHB1foMYFktJu2s5EM
         ymMnle1UwodACPy9bZ6zk62Vd5128ZajBRX55rbp/8DLBwoVrsLvb66Lkm/L3/fAijBX
         4PfQLze6i6z510fhg39gr+Ez35+gdM016nLLrgnT1CIVVd1pA74iw2WO+uFOYYHYy3CA
         QwfKa9nBQT5cXdCfm3rxZC5+pQ7f6Msy0YtG6M6meG91MMhhbPlW9ITKiApkaIIvvNjU
         2yvg==
X-Forwarded-Encrypted: i=1; AHgh+RrepbDHqXZtRSzrtoSLwZCKS7P1k2AMFZv7e3FhlejJYArwkD8CYWsaOBknbChaaW/Tm2cKyEWzsENu@vger.kernel.org
X-Gm-Message-State: AOJu0YzZi7t2xVta/BdgOdv4GY+hq6WCfazZdTKhPBbs4QidBILeENga
	+jmFigXgFrsSZ6DH+veXr58iqU8GuD/1adg6/VwuP2DefnZOge28lW+EWbGwgGQ0EH1nhbCcGGf
	W3XOj
X-Gm-Gg: AfdE7ckoJzaoVMyIQ8JtJeebuEv8UEU1+fZSis+xCQHlJ3aB/atmVcdOnwrMKZY0a/A
	ENZoDUgXZQf8TaMVDjS17GU4c7XMTPUFVG8xMc99cxsMbNENVK7zx/YT713oJh+TQtSP25h7W2D
	znlRUDCkxOzFW4kBrq1HHatldM1nn7XPGrLPS4Vcw3t8O8m8vTNt2wDHQUsX12KN+gmtclP5QW2
	pdOOXe+RYFZODvMOciPV7VHXRy2M+ZOJaZek3vCpe834UNbXlH7Jb6eLt5bYlqX4z/Oehrh8oP+
	csfIQwIo8blqdYsvtG1BTT7YekL8jZt0bsUAA59Z2NTp1nTH/oWyGNSPyqldDwZhTJ8DK2/S7mO
	qk/FMwoK9s2VKntNOIVSr+tmsP2mSB/r3D7cNNBVc2kSr7FQxhsGAnzr4B6YHmLqEERrfAOGQTi
	5IW52e9m82c5Vvx5bbt4xI8u/izHHvAtMvLFPsI69JASlcq4uD8Vs=
X-Received: by 2002:a05:600c:3107:b0:495:6400:ab62 with SMTP id 5b1f17b1804b1-4956400ab9dmr2692925e9.20.1784541836132;
        Mon, 20 Jul 2026 03:03:56 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495516c68fasm191854485e9.1.2026.07.20.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:03:55 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: rk3399-hugsun-x99: Update SYR828 regulator initial mode to use device tree bindings constants
Date: Mon, 20 Jul 2026 12:03:35 +0200
Message-ID: <20260720100336.62004-4-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720100336.62004-1-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using a device tree bindings constant over a hardcoded value

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..a2b7bab63553 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -3,6 +3,7 @@
 #include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/fcs,fan53555-regulator.h>
 #include "rk3399.dtsi"
 
 / {
@@ -237,7 +238,7 @@ vdd_gpu: syr828@41 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vcc_sys>;
-		regulator-initial-mode = <1>;
+		regulator-initial-mode = <FAN53555_REGULATOR_MODE_FORCE_PWM>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
-- 
2.43.0

