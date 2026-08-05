Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026263AEF36
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956804; cv=none; b=oKhz/MiWNhOCBkO4kokPx7G2Iw5QjsjM7Wpo+1HJkUdvYOLi+HNjaeP2VDrkilrqcRbgSTMff67knJm2Kq0xAIfz3/f7hR/1rXgz9KPDgdASU2+P1F8iOIOJdjpaueXNteVYdpVtIdsQKe8xKG3e2tLDXSr/OoPN/n31XYRm8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956804; c=relaxed/simple;
	bh=LkqfwV0kaUPSca5Y4LF6P7I7FiVLBGjXK6From9qyBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZTSRTAs/5ZUs39AK8pYtSWLeEMVEhrSEH9nLDl4Mt0e43Wio+YXK7DpZH3borZp5i+KM1IjgFEX1QELj6Z7k48xYwf8HRJnZpbSBbaiQBrk892xP7H6diZ7E6n5UqH2ZOQD16j3PhnjHkg8WIZMIhvILM3UHWfIErvpP7K+VZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWXpxxjs; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWXpxxjs"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486ac3f347so219751b3a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956802; x=1786561602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6fqphzLCLb0mLA33O2rb2yaxUz+K1JaPk2AB/U3hnI=;
        b=ZWXpxxjs5+Xq0Rh6TO13J/BoBwjXYlO+8gepJ83JPo6WTwbLDh25pWfL6GssbxmhKC
         Gtmo/dxbaZbautfPKpy9zSELUaKir7O8gcJUMTjA1ae9MDdg2Q+c65UrCVpGIMMmKBQ9
         T3pwCphHnkHuH0m19QmvU311fs1W3h0aM3kbsKG9tAFsEEg8tDju9hDPRC46NvxEe06D
         eqhYD/kz71cspIsyZ3rqyxUF363s7c6Ximz1eXDvcMh3fsJxrEj6tnnpKrrv85M/O9qY
         kWIpvKq4x8FZXL+2hAeAnTXJiYRVU4BWAtg4LIl6lVXENji8OE8xbUaFiAoV3wyjht6H
         cmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956802; x=1786561602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6fqphzLCLb0mLA33O2rb2yaxUz+K1JaPk2AB/U3hnI=;
        b=mbWWtMfhsd/lFItDxz3mDBYT3iiYyl+LNlIKt4Ia5CXLNTBpkk9lO6qydzq81VDUTN
         kmw8w8zJp8s0KuMdRAYJt+Ap8H3r+cu91mmCq999A+Nm9kAgr2k9hhkIR5OvwAztG7ID
         3RAAm0AEprbU0dRKSUnOQbCjVV2vj21IUGhe01mrknJAA6sjlbHqyrHPCWHjito1psS4
         S9H+GUYd1BlOwVCfw7LOgzTHZV9VUO/jV+Ovjjf+ZsWk5MkFIb2zvveRqhj2WAWea1NO
         SU74mg7vSfLbkXUypi1ZraP6OTkpGTMb1WGlNW3CGqbNw3RkKyas7GNqLBQVlCJdAh/y
         qjdA==
X-Gm-Message-State: AOJu0Yy8Y5RRzZo602xkxBK5NxIyh91pqYF5zXCb+Cf5cfdPH8Q4PaBm
	LUPPmDIFzVlOy1fdnQxULGAJToR6aeeXLAZtSsE7soZ+nPDDrxda/uO4U5bDRg==
X-Gm-Gg: AR+sD12xAm+Fa4yfS2VvjWEveuNsTSoxLnyggWi9CEGKEm/rB4DDtsUW2GfmMx8sdOq
	N89Hd64Q5SWXo9U7OhqRgJZgbowAbIO13TQm0Rhion8Crv0YixRdyB3/R2YrxkjYtgd/pZw17vm
	BW8UTLNy/gN0L1HZ3EDfqPuZUnKigvUipRC7HS6LW/hL17M7I5wmsuvXPs7ZE90zx/6Gn0BxkQ3
	fe2VJkGDdXJVlSX6Qb5VaFc58HmGIaQbxrwKG/Mg2/UmzFwRYUq1OiNTd+esXdj3oOzAdKXdTPy
	YdOF97jsHYD5s3DbpDyFJ0losSHZr4IezbYwWfCeX3XhCR2xJhykqT2k3QKw4AZxaQS9ejISaxF
	tpz9zHNnSeUqgkCMEyxwbWVIdzfDJenKORxbzhHvOLPZ6La3ajiobtjGOvl807DvEXuA5ILla+a
	jpdnnLksoypanw6Iua3zR8oh0ptmUJjYCaR8M45iaFruwnYNW7Xdnv2lEKFSTV5rUyOPgpkOCjw
	qSXKgkchYtHX1q0pzFaYqMA6ZaKsBYGBSt75HiV7N6u/62/xmVEIwC2J0BUDwI837I41xM3Ty4+
	E5iQajw7XE1XmXLxS70YhbYdpvYIIO7pjAx4Og==
X-Received: by 2002:a05:6a20:cfa6:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cb9c1ae26bmr2055316637.9.1785956802198;
        Wed, 05 Aug 2026 12:06:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe706e1c03sm2152786a12.0.2026.08.05.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:06:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA9200: add LAN WMAC
Date: Wed,  5 Aug 2026 12:06:40 -0700
Message-ID: <20260805190640.7957-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it clear what the MAC is relative to the others, which already have
nvmem definitions.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 9041dc6bfa8d..37593e7582ba 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -162,6 +162,11 @@ &usb3 {
 	vcc-gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
 };
 
+&gmac2 {
+	nvmem-cells = <&et2macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &srab {
 	status = "okay";
 
-- 
2.55.0

