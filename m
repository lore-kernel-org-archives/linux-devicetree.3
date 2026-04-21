Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F83D33F5A2;
	Tue, 21 Apr 2026 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.232.1.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786845; cv=none; b=RRs4Kft76/tD8/vw/Yc7YfzvlDZ6BvpQS30mtMc/UE4myb8flRU9fjVBJuFlY5ACeBJLBGK5lb5DNnPCVAtXbUyLraTzp/sVdj4BLlEcuxwYGMwLWP1uyaM9HTJYJd5HZGfzfeTOeveH95vf0apHdO/cE9ATm5D295W9SaL0Pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786845; c=relaxed/simple;
	bh=WC43/Zi36PR0jMglG4CV61QZ03CxcLSXxvq9nLXvQHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GUMI3TH0jUUazt1GAQwq3Tm2QIY/XMfuXT90xpVg85uuAwnJAHbYSzN3KRhxjQewNCI9xaLGZP5TC4kDWVjnRK3YV5/Pw8UPx5YLgN287DiNsJMDU1JTEyQCkdiPyyG0CJN3yp6pkiDAn/q6hkQH8/CkfJ9Onu3Xnw6iiZODFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at; spf=pass smtp.mailfrom=student.uibk.ac.at; dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b=rC6wgR+n; arc=none smtp.client-ip=138.232.1.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b="rC6wgR+n"
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63LFrULx2501267
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 21 Apr 2026 17:53:34 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63LFrULx2501267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776786814;
	bh=Naa1oyRkUNUVOUuBidaVs+/e9mdftRGQ/QJOlDTjJok=;
	h=From:To:Cc:Subject:Date;
	b=rC6wgR+n8nQ04Vk1M06RCP83Gq9TpqmcSbqHKmGkUHwZ5DShA49cGzvjbjLWMwroS
	 MGjcs+Zm9tvWUEYjErRHbFrfBzmblSP9Y/iL1z1s7opBkR3RpYEC1ybD+TDNVrgLbd
	 e4A+eBcmCF+EKTDGVIl7+lmXnD+X/xymCwgB7KKY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v3 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Tue, 21 Apr 2026 17:53:26 +0200
Message-ID: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -12.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,UIBK_PHI_SUBJ,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Changes in v3:
- Change position of the entry in the amlogic.yaml.
- Change formatting of the Amlogic W150S1 Wi-Fi module comment.
- Fix several formatting issues.

Changes in v2:
- Split dt-bindings and dts changes into separate patches.
- Updated model string to match documented vendor prefix.
- Put vddio_sd states array in a single line.
- Added a comment for the unsupported Amlogic W150S1 Wi-Fi module.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: arm: amlogic: add support for Amediatech X98Q
  arm64: dts: amlogic: add support for X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

-- 
2.53.0

