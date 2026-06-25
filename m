Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C05376BE2
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424682; cv=none; b=TrXNbC3EpjcPIGML4zXSvdY2bBi/wnLjnIewv5fhg8g94E9oE5YLVdT4OcvL0UB0c9OiPc1H63lBFuWpkT3hPnJD6apFAfMKZzX0dxM+ybQmKtyTBTR2m0Mvu5n21uGLAJ6x91MpE/wpEnZmfSjUT41+QWbkot8UUv2Zco0ezxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424682; c=relaxed/simple;
	bh=ZuNZE8rcXpZILcOaEBKLDnkP7uQZIoXjCu/kApiOj7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pESp0h06iTJWAnkaj3x6yGwod0A9MoyaSe7iHU8oA2tDwMxIKB0q6awdgpZsFrSxF9s9enQAS4la2YOavQRgqdqQmhZgrBZhj1QMF+4o5m3XEzpK4OT3Meug1p1EbKp3Ri5jM5EFZGGIR9qHpueb84FbHDXwC4utblLZ77DIssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSW/gAqE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSW/gAqE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49241896317so1631745e9.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424679; x=1783029479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=cSW/gAqE+L/J1Jm/7Dbcb4QcLx+DZDmo5LeW1VIln2ZMRQLu8F2pxJLAuY+TvRsNmC
         UTJBH2VDst0hEVGXCMAxE6Cj+j/ZORFQRLLYcdySYR1m7WzYrKhxVpY8iHZd7tsz117d
         WOzWElJAcWMlKir4mnG4l2jm2hJe1KhjMLfcdcCgw143g7S6E2OkC1Aj/wCUF0/4vPrN
         1OrZb+z1BaB9kh5UiJn9CuP6VuthtJL2P37imkXcLq3LmtFYnJDyw9pUpX17RX+Ozl3g
         MecAy/Lrsgxyoo63m87kV6/GmSayt6OBO3nAvSsaN//0ENHZNnjd9p8FbgXbmC5RG4SA
         9tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424679; x=1783029479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49Adk+rz41ma/ZabM7UStJxIriNv9H3xlG3UDtods8=;
        b=I2eoOVBwhNbOF+n1yN6zpOArwf3XkzCZBVsK5mvL96W+a+xW4qjXXh7VcUi5muRMsw
         haOtZaeAJQJM9+jXpvUIBMoIdG0BTMh12IOpEitcapIn6DWpYam3WLKpCVRmyPyN81Ep
         1ruMJrnBm2COQ2LWXfFWdiXq6mMrKAtZR1QTc4UQSR6dqZKZCes6RRlGxWqqfJO5AWBB
         05yTc5AB4obTfyOczJRZaMXco2uI8Z2KBxR570S6txxE5b1b2ScaiaAFgCl+hxZC9CMM
         eqHLX+2VnAnIz8k9bpm6QByHHRF85LeRUOo8JFmjEskfToV40Sur/03LXo24fRkib9Jm
         qvsw==
X-Forwarded-Encrypted: i=1; AFNElJ8m2KF9A4RFL+Jc1z03M8jSreLliQeTZ7yka+1ag0GDoVyVA2gliNdXpgg9StsGYsktRt9raDvf2Bgv@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdFduWLCo0oVsTJ+aO1r8WVkR0RHeVP/bXk6gweYMbmrvNJ3E
	BhYkB9oCCdOeo6ODcKzQoFYqMeO5LRtrN4Cfzocgbxz7BtMxjkEYA4y1
X-Gm-Gg: AfdE7ck8pg4pw06KUz8vSOFP0mBbVq1HSZBiFDqPyhZMo5MhplKg58QL8tuusfMghUE
	mavSTLUwY0fL52UPw1J6+nA2/AuifYC6yGh2Xl8pN0WhLjDGZzaTsMwZuvk1Ta0UJZwSE+5WS/Z
	vOMu7rB2sHyFvm1bKrEGYab1JW+LGrlmBQ7FucU0CpU8a7/qKlCPuwzHvHSvkS79Hz/Z+1x3cDv
	pjtN4eMJglVO3G7ciDs1fZhjx84ePlZKkJt2aWqDKeG/ULCwVYpJMtngcET9wN3k17MxzmNNtNK
	IwTcGnwjvxE325snn89g/KZpOZEOlim8a3K5PCu5v5tXI4LEQWp9laMGsSbT6BzkS2dmRx78KN/
	F3NKFm9eYqg7VN1paFQ6O8bmWbBpt+cVJhaKVRrYn7jxCaCuREN0tEXGk0rcjXsXBHPFcHCzVhg
	5ACoWIjGyjljFjhKhvDNop1dWdU2zTv3DtXZ6AdAsfI12LB5TiMcPL+CdrF819TiwSfHwP6JJiC
	5oiHHnft37C8oxZC9b8q7k=
X-Received: by 2002:a05:600c:154a:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-49266881b0dmr61623945e9.21.1782424678463;
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Thu, 25 Jun 2026 23:57:34 +0200
Message-ID: <20260625215741.3253212-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0

