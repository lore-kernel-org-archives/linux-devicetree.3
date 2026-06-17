Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26763B8135
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684603; cv=none; b=rUZYL42KZl5zatoHpdbExh/PECBCK0IxPefW41qK4tCcUZ1MzrjiGN/RiBO8YwMVvgJpT/yC4jUQMgiywDR4+Q8ROBlgr9xafIpCzRiRnaTq5ORfBwigSQpYjTpfk7Xm4hdNwJ97u6/rG61kFnPmZV6pHAVe8gJ1F1lC9JJ4HJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684603; c=relaxed/simple;
	bh=ZqZCkDmY3c0/kditj/CSeHwbumIJp/ak3XkyRMjjrv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lve2Nc6v3Rf8laDuTJqNPm1Dmx6Lxs+OMpq/1fhvCGcW6HbP2XImi85VJvnokFX/xW1/BuV8y6pe+FWFq1apHJHNhFd4uYCuBBilcUF9dddbvJ5/dFHLqLzTg0W/qPolkWhAt+Da66/Vv0P+7C77SuvsfGDijvcFH9VSd61eetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6QeET6N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6QeET6N"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so34910555ad.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684599; x=1782289399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=E6QeET6N7FdTouSdOtfotQWGyBr/Tn6tPniIZysXrcCebtRQXtVYhRVMdwhpTMUzK7
         c7mnWy9pe3G68eLt0sKnem73UMLQsnC3XQ1nsCBILbOQZOr178bN2eq9pVutOL//hx8f
         VSljdImDFWYiq5YbdvslEOj5lCEb8/UNdbQrkFpxe5ShjyPu/RVAZN2viYv3YNq86gNE
         gPnqdiyrZ+HggQyJyXc8Xkw8gg4dZOoORetB802wfUEsMVsbYBAT7KiqwkXqB2nrp/iL
         Cu+4XQKmR8u7JhL4sgNhi8MYyJ48eyYxqjZhRlcYICKBqOfiJuliKok7r+Bl/HLE3AmW
         Bs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684599; x=1782289399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=M6l7roiBA0oVa1bnMsBPGJRMkw8toeJUC6ZlbNAgoyHCqKwR3cUA6WZfgfg9jF0/6t
         ZOBwN3rmeStp4MiFjyrkGeYeLfv48p8VvdbQmyxDTmVWbqtczSmXp1d0b3HL4duIoWw6
         rQVHGzpZFNTg0b+0fbnNFuR79aMyXuVaaUIZ92YyBREMkovc15C4FRcr5NYVf55d+EVE
         cIz5aN4N4z++p9WCOiPjeWn9O+czzK5B6Y7M+aVjE0+0RTfs4lK9z/WvVRCXxFw3Hrmz
         pUfSftAv7jrPDLi48AxF5odTYi655ZnG9lty5DOfR2HpcdjYDAP5jPfL/jAP1kwqaxZS
         qbpw==
X-Forwarded-Encrypted: i=1; AFNElJ/wA5ZN0v0zz9qzjh/EEjqfscP7h4OzS8SDA7yNoaYNSY9Dnu2+9ZDi79UFT+svqXr678Uo2EUuEDmq@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTZs6CGzb2Kwr2H9ZwaY/Wr/dMXlvLgGArPIh/s3FCN7tZizI
	TsVH68Om2zZQTkKUd8To1jCAfLFGNj3QfvsoCliKiym2QXvGc1tbLBVty1vyLZLl
X-Gm-Gg: AfdE7ck8mawo1d9p3uyfUeXl90cR0KwAZRApzww6WMTwo4dejzv/Z4XIxm3t9luxuY9
	NNzH7A7jqRFsgrCGdUnD+Z5ShKpIpvCj/XO9EDnYvUol+bq0kC8QuNzXWxwknRWM7ya+mQ/AGlO
	t9KrdBX7KWJd12ML4zcWeE7nsiRjgJqRSE0N7BHg00RSTVQjKPkMxZ3TWt1+3rumhaC8OMi9jvr
	u/BIHJ90ItQz2uvDzb6CVVGv/zwRguIxxEOeqqtAJTzE7MsEDWEJL8ZHgOzVNPbEfttn8jWzZCa
	/ZQvMnpEbq/2/U/LUpvybbkdf9i5u/OJ/E5brWnuAATyPpO2JsGK/bEBlmY1bD1uvmSNzVyoG1u
	l62vmo01k9H/Au/eudILEYq30TDYrXJBmlWghkiXzVYWtguApgrpKM6NLyMfTGJqzxo9ecKgCnO
	4PDVdQerBubQ==
X-Received: by 2002:a17:903:3c46:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c6bc27199amr27006845ad.36.1781684598761;
        Wed, 17 Jun 2026 01:23:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:18 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 17 Jun 2026 16:22:34 +0800
Message-ID: <20260617082239.645562-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
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

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
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

