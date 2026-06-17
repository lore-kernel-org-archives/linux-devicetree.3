Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FAD3AEB4E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680600; cv=none; b=VeEo8GRF4Odv/Wmk3K0dftujxIZ0N1U9AXjdnPfxn42AoNgh/b9wQOzDKmHWOUAN/VOApKbp8xPKQqWzVtsp+MJzWAH8U55GFrtDX1uQ4tefS7SoSHq3D5BSo1ZqIbGNMGWBNw+EvVjQWEG8ynzRASrMfvJxNrR4XiTHdT32uKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680600; c=relaxed/simple;
	bh=rb+aNnHYdNqy1IYBy9/+KLzknx32nWz+/xZ4/3QurYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auyad1OpZNgRz3hjieLQPIdeWuvGCTJOqnUVa5OxGrpi1vwz7Kzywesz7MSghPMj65yKzIdIE5zp5BcNFRVLSI269dVSmz1itS9+0MOtt31yRwgLppFgh8ykhj1y/LUfLGT3kGxECx4yPcZbr4pL2Jp1KGTBZ/M9UyYgZI3yqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvf5zA32; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvf5zA32"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c858014845aso272571a12.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680592; x=1782285392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=mvf5zA321MJ8uTH1ppj1OCBEDl4xIS7qawQpyk0kKG88llJ7p8nGsmJzSjSRs7nvfC
         2wJP0CFPlomf+/kt6ekiMybadyy+i/xDw5Z30dpVh8oedw30fRV52tJLhJ2+wpejXPtn
         d+KSRpgQfx/7vqUPWrnL/hD5aDLGRX9GewSxsygXDYD7k88rgIfCNRibOFkX7uecsZ9Q
         9A7uMAT/eR7pk+aJ0lOYaPEHorgRak8/BjvMHRlMS9JRTYayA1EAj1vSyI8P1LCR0SsQ
         vzUBiCPLmIX3WV/AES5N4zEDMuWqe2FiEMvp0HKU8bGHQ/fuKPoWiBqYbosOr0d7jO99
         LL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680592; x=1782285392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=GTjYerbT8uvlT+pSMO55Qe1lxa0siUKeJgTEeIZHP5FiyLoLW6Dydufj7TLxS8U5ek
         7Gcor7R8svJhzVvjiGrEFhiCD+rdfZk2JGQqEPcEryyvnE1oTzBq07A0w3e0bQ6oWzSB
         nIv1vBADPDkMsJdhruxX9XFuIXh7mWEz3IysTeP0+5p/NYsVBkFrdYpNdjWapWmHgmLg
         9ZQ4J2wJYxYxWb/3TOAB2j+zZ9ec9+YXJpLPNzhNuF+coYM+SEOuK7pYwZcNK2MdHrDc
         9sLQoswLma36k2Hy54wzE+icfUbvKk4LUO6Yu2PWN3ihEnXrQCsE2bk6V1hjjipG/Vaz
         7y3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8d7iZrvkk0a1sh/6/go3BE9FlJ6cWcsUDSlO3EKa015YaXjOi0ucEGvOE+eeEpb6R2E+EFczbN6d1E@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGbtsBSCrNXT4J6T0dGQCxAGs/IdoVy4RnVFrKug+kh2ZcSDf
	zwT6bUAxndbQcXDuVkDMuCNCoqc6rBWeHHMg7AvFkbCzka0ToSDoLwS4
X-Gm-Gg: Acq92OEQg+InhH2X/YJpdDt3yQeEvfnTn0M9QYWMVO/c8FGk7gMEmMyWm5dC/z0cT4c
	DzAMy/0gu7PrkKAEhrOPkjFrXmnfqSLrcBC7OvtA4wHcHeomG38VW2uFO/C18cZ8Rb7cQ99DTPd
	ErzXiHhygjBDzoFFeVywxesjrZ2p19DCPWibabjP50spOc9aTAuLzoC70QDVkQt5Po0UHR2w6xW
	sfIYciCG0qnQ1S7s1PrSG2o072Zi9aOxSomLOccMs8fnZs6bo7Isps8wXBicKqU0wOUREJBHCvb
	6eoDtZThbfZ0rhZ/09fdL9Tinli6StHxiZX3JO+z2cgIpCx6U9pVjbVGOZvyCS6/l7g7X7kVExh
	zYfh65b+ZPevblJ2rhVgB7sDd8xFKXPotKq7LXQt3G5K+DkQ9r08DdAwSP4M/8h1H/g1ffrjBDp
	iT/6DgQIKieQ==
X-Received: by 2002:a05:6a20:3d1f:b0:3b4:640e:f6c7 with SMTP id adf61e73a8af0-3b8dc83dedemr1795872637.14.1781680592429;
        Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 17 Jun 2026 15:15:57 +0800
Message-ID: <20260617071604.635627-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0

