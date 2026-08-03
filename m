Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB8426430
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778663; cv=none; b=sXDnB6Yvl0fF7CLkv4ChRHRWwCq/kzh9tVSZYJinc9m+sMQGbddWk3VgTjxLs3Sn6h/wBFHwTufXsH8mNXsm4hHHBqPkgwxJgbS+v25EYIZ5RgdIp9By7x4S+k5EZKl88PH8g6t6tO3Dh4e90BJBPzGQQW8o0I8phkmCatLakBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778663; c=relaxed/simple;
	bh=ZS0XS6kLln29UYlZ8WzCICcvpyUhhj1pAkkCVzulFQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kRbgPPsJHMlvxQWTcHsU6YQJVQIpDAEgAtR3N1W5p8CztZPQgIkBuS/1ss8MT6h4jNJfpRWpSJ9+JfzCwkpR7CGdImEmP8CZqQ2GFw3xygqNTe15CmFPnFcBqzGTPnlYR0S/gYp/6zSqVS2nDZrN1Rylsoom4+8dx/5/7W/+N+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTXC6mSo; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTXC6mSo"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3337429a91.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785778661; x=1786383461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ggw6RNSbRfKcNoKstdM8y3wKuc7rtFdrEqUHCmYX1Cw=;
        b=XTXC6mSogZNQPUE7UEIsvohnt1hy3N/hfGxyhFLUDCXBnYasWLLAgJh9ShvS/2xDnx
         Jm2kwEKIL3D7o2c/EuUoK4rMTDSQnLJuyqnEdmYKG8940f+RF2BgvlhrbG381CdtXpG1
         tzeWlrpZbSQHL0dk4wgvjgoCLFQE7/MNoJaccRZzQKDS7wlWZZVblRCZ0WcsRyk6WHhW
         RcRd3uwvQ43+7Jom2F2juuyxIc7SFstYd9BSgRrJKQ/qOh4P4ziXzOqDX1N+3BXXsUry
         QybN49SZyW2V+zxzyvOGCiFjWhINLB2QOb+FQZDhrLzecZ7upzIWPiVEbJpTHu1za+O1
         mZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778661; x=1786383461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ggw6RNSbRfKcNoKstdM8y3wKuc7rtFdrEqUHCmYX1Cw=;
        b=YcuWMpoepXUPdRzXBYH41TtZAOpJQHgR84BLpFPIFrGsqtE9Cd0phTDPt6uXUJo8a4
         9Nx2/q80cDz4jKaw3UZL7iJg4ZUvGaA3bhSqUJV2y5yuacy0SOp9rZ+R0V5b7DiRMjYe
         Bx7n6bUMijxJIjPHXGdjJq7vg9Kap7Uxu8OurIEtpZcINbS5iqzIM1SEvLOmSnX5affG
         Jxop90wj3EKiHOwUVYDH10yjCfWJZv0wup8Gg4IOMvKajT3Fyjvzr+ISNyG+ZxS+SoyY
         pLDDst6aimyMJ3uh1EyWidpEYoUjgTMT7B2OIJQtQ430GN4iQ8IlNNM8hbNgahwr703F
         YUPg==
X-Forwarded-Encrypted: i=1; AHgh+RqHRK+PNqxDrVgS26K8mBO7u6IS9pt91os3TG+jltjplTxJ56Wc+jJrGnwPnlZyEGyS/kOvMsZA2dWM@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnvI0nBHJcS7Z23BoP1BHGXssV6j8rnIYELyzlWImHocLsQtz
	1zSycEZz9HptfoHCQI302Wkb/ur9foeqaWvUjenaFqqFhJskJ7rz1edv
X-Gm-Gg: AR+sD13bfcbqG8klDm0wVUynu68yyvfXGAOK/QoF9+fE9MI7JQ4xSrf+t/K7B6CxTkn
	65OhLB0HRukKW6utSUQojGNS3cbLPRmQbP9EH62R5vAHOLbiNDp893eGZMpMjS2SOa6+gb8Lk9c
	da6vxEtq+OgXVtHFWRzq+sjJ1vX/YG6pNv5cWnQ0gM+LFhfgF5PrvOr2n+RPKrOT0YGy/TH/Zjn
	MpJTKDoQ0ovh4VSUVBVnUO/Tvardk4ZtnX2HQz1NdYiD065leTqjeoLpEpmDDHL0Fub3CKaxjKK
	7lCIHAA1iklQPUWAqBD/DxE7tcnMAZDNQrqT9O5EXzq7uN6RRXxmklwUbD5W6o3oNsFbY6K6aMO
	IRoZXw2ZwpdXhljNYIbaJ9auN+ERA5pcZJ+wBitJIc1WV+B57msrfbVxsVwdKrIMB33XU1Bvbeg
	ABbAFY5cs5wAwTdgoaFNoZVH3jbsy57D6GUp1UwuQvUTzcnieeCQFRelzGvo6lkk4TNQo=
X-Received: by 2002:a17:90b:2ccf:b0:38f:57f0:1f4b with SMTP id 98e67ed59e1d1-38fbc576496mr8815875a91.35.1785778661240;
        Mon, 03 Aug 2026 10:37:41 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm65612331eec.28.2026.08.03.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:37:40 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 0/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Mon,  3 Aug 2026 14:34:28 -0300
Message-ID: <20260803173705.2268792-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This patch adds the device tree overlay for the Toradex Capacitive Touch
Display 10.1" LVDS V2 through the DSI to LVDS bridge on the Aquila
Development Carrier board with the Aquila AM69 SoM.

This change depends on two other patch series, and should be applied after
them: 

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t

  Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for the
  Verdin AM62. This series is required because it adds the panel bindings for
  the display. It is currently in linux-next.

- https://lore.kernel.org/all/20260602115123.1324474-9-ivitro@gmail.com/

    Adds the other device tree overlays for the Aquila AM69. It is currently in
    linux-next. This is required for the changes to apply cleanly.

Leonardo Costa (1):
  arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with
    the 10.1" V2 display

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

