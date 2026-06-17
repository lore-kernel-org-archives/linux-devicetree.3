Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B013ACF15
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680599; cv=none; b=oyh1hzcmiGEs0/Q2Qv5XG0Av7arEA0/EPLrXAiBEYkql8I0yCcED1fsgtrcCMkJ1nNsgHoZMUM2JwvPOHTng4ZvmcEgMCfQOU6cz+SvcFvqF6RB9m/0Cr7Ox22tKzRYlDzCcYp12xCPiWZocPU4lqDL0EtDWdQfXJ9UOhd0iUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680599; c=relaxed/simple;
	bh=WUwH+wmJoYp53+Ha9VE2n542T3IzX/5L9HXbhRg1Qgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIFjJKcB5Sy2baVtr9bgC12TJ9rbXwAwR3p+IzRcBnm3N8wOEYtSE+BEg+dJSxwJahkGcrM8PJYe3LbJ0wmRK2UhZ16D3eObrzVEP28z4mrWt1UNJ3j3Oy235tq+ue2Og+QmcrNPWEIXA5o9I4seOu5ZT41PqwmLronAHjEe48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xdoa8fBH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xdoa8fBH"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8584e80d59so2192221a12.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680598; x=1782285398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=;
        b=Xdoa8fBHTZMINZqx1kOl4aJZUvR7kSdivIblbHbD5etL8XZhuLRX0y77TmfbqWWQSf
         nsFN5GJcLsYdu+iVxOql1ewTKEx/VaDCp4lyCljYV6kXxVgvjR8zouHeUs3j0vsBTX6H
         jOlCODVdJWfPjl466wJKf2cxohrhHQBuKa8IgY1OpHtnxKy17Dfe3tjCxTAlD3IYyWvg
         3nW7DtrTS2Y01QqvjTtRaNAYhJoK34225Gs7PAk/ecpto8SXa2bFfFbozNZ8xroSXt5W
         a7m+89CO8O3r//HTdRpdvatxkocfPiIyNXp4zA3EiGl41aVTTjnXaGMKItEHAMgL02rQ
         eZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680598; x=1782285398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=;
        b=nVlOY6ykKyQxCVbuMsEDmZxp4hvCbSZuVDlSjTTvJWmlwe9wmczVEtR2fIhI5JA2K6
         6IiOGY/rzrpbmwpx7uO/7VYDNXKQh/ROL4lrYvDQCtRggj6ehQajTwN2CT1UZqnDabgh
         bMNo9AjLTjdm6pUKKWCij3Z6Zz0p2KFNakpz8fYCFswfxDF+fs+7kkXMQKeH9dBSdMS+
         9y2jgHT3zmyYnyOpLiGOYkBfaeNzTZxCddTqxqYhwPmwSNtLBuft3w9zQzCtysOnzzYG
         Z3HrjvR8uzd1+1ybQA8G76N6pfXF1CH5w4SHWJsMHKdffvE5t3ZCpTkz+lCaJxQhH3aX
         K24g==
X-Forwarded-Encrypted: i=1; AFNElJ/wHa2WT+l1IQPQBRbB5uDDxznqWQw3TJza9B99ai2Nv5G+HUedxBsN1NkS+mHK9mm+PxFYNkn5OENS@vger.kernel.org
X-Gm-Message-State: AOJu0YyuE0H8WTVP8SCs156Tyh7MMKpZ3MjIWkOj1RKoZ9fIqlPfuLAB
	INP8ZxT7e6aW8l4nWQqEDghW9957WIv+9LP4iarEHta2JT7uyfg6naZz
X-Gm-Gg: Acq92OEguw703qrHAzz76NgrwPxyvK8dQ4VEf6qdMFNVRsBoAK4FRIG9sLAa3Wasx6O
	FCqJjFhW6kn9vK/bElq0Q9n3AcKVk+TyW6Blzg7qx5yHB972+nehPde/tTs6prQItoJtKpFahJt
	GYoDWM12bPKTai9RT3EvNlcA5sD0Oub24dvDraYonzrzl96mCR6K0jdcbLablkEvCYs8KM+gUjd
	4yc5KYDwcskn/vi0OIgqrhaRxAeIP2SW+Wki0llsTOrvlJ4/ogY0cWFwKGt1Jc2vz/yKnGLEro/
	xXVNce/SoT6r3i6oYpj7RTKC5SPOfhvZ8EEB/84Jd+rrrU1sXanwNe5NnPvcR/H7PueLbQ3W3/A
	Zx2v56yyqgfAIqRj1TEZASJY9Ah5ZqF9jJSYuWvJIKrCtdLoz8DvkILwtQXBoF7sQI5WbtMgFPr
	4CAs/xxHiZ2A==
X-Received: by 2002:a05:6a21:6315:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3b8bc376001mr2966185637.2.1781680597498;
        Wed, 17 Jun 2026 00:16:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:37 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 17 Jun 2026 15:15:58 +0800
Message-ID: <20260617071604.635627-4-jerrysteve1101@gmail.com>
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0

