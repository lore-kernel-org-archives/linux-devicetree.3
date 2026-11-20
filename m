Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217753;
	b=S+vLVm2Prjn5NR9f9V+jtZ5DSxwLGvw8FZyvPGB8iVz6UHWO8alfw/fHd0VP9rgZlJzL
	 dpW+TCUK2y/1v02Reov250V0V/bRhozBR7/LA9ZUq9Ibhv1pabMCy+NGaSMTt17Pxvlt6
	 6HjZy6mLJvpH30BoVxAoDfvI0GRb9/lh/za7Bd4CxAXQC3/57Ia0hx93eDZ6rjgkCIXYQ
	 f7keaCWBxfrpFYQzUbfjV+uZ2eomVMvrFWRPZC/5W8T5XPI7yu7Yl7SuRmWHqECBuyPpY
	 gyZ060y9IrsYZ2QWrfta1wTjyIVMjnN9h/zYHvJcBq1gIxwh8J/Qbmtalp81UvxnLkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
	b=ICXnvIUjeG0iYwcqyX6GL5Nn1mI6o/TQyJ6oJFCFnr4gBOMN6xYUyAodXtfSBQzLYaeM
	 86X3LaekCl2+36xGE0QQfG3MIQsaTZduQPClqw24dHJj9LRj4QuzS7tT6qzgDWojQSj17
	 dv5ikreTXAg9Gq3YnWgX405k1MqlORSQF4A2OyaJszX3mA7pXIBQG/X2AC2+rxAo7I6x7
	 e0/fk2pSElpwYVUgB1SO0ij95SQKRLpR1jYmEJ928E9mjUhj0SlGGuE6o+3AU/2e+/Nvx
	 T6YN8ZGU8naLiZiObE2Ke3GOhNZROfJHOHfYQPSkGgBFfP5QQmz8JaQHbbr7zFYpX/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4V5h3w;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C29606A6BC
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C29606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4V5h3w
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so6284555e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217746; x=1795822546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
        b=Vh4V5h3wrScbR+aUpgN095jL+1i0bDxiHInNwG95ZLFvVbqjhUWEDU3gRRPGSzQv5o
         6PXI7x7HuFCm8Eehc9nYYw3RThyjB4D6VlNxuqYxTusJJwXyisj28FaF68bA/2gAJoH2
         /muws63J4fbwGqDaC+IDrSO3wORW+HoWjbF5gqs787TbaYWt1bFCJ+1AU/fEdbTJ+Mc9
         nlw10mUzcdLoL1MSHoU1UVniVxDuAJDxeyS4c+4cibZwQInSW48TBUDWQ5Jk2xuWN309
         x1tuO/14QgJV6dEi428tNIFH9/Vp9UuSwCq576p1qOwBqG33CAzpQlf0Ao/JKuiZhfe6
         iOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217746; x=1795822546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
        b=dQVct7qCz1IRiKgfbzoEO2dlIgomg7iW4i6U0P4a1ExhyG2dq0r+rdH7Xl90DaI8Le
         gG2Oi686L/mXoy49aD4BUqHxDIpe6hO13MEGVh6VbCJFMoMToPwYCle6JJhzcU5gzT/O
         dVqoIVp8A/rwcEzpagjtP/DpmpqitiqBV+aUh35CRaaGNhiVeTe0ppq/pCvIHLmORfcm
         DgtQKnc+macx9ZTF/yYb56iEPUF78z1zDr8+nX2lccyulJDICXgbiOgaulY9/GyBNq+k
         EixPigJXBcloHyoXcz4DOtbMXIC/NUhUjzsLxG6PfN+1eKRLLEmf5+IPT7pK7OR+ndT1
         DZKg==
X-Forwarded-Encrypted: i=1; AL+hErFkdHuZWMwGHkUePLcUwMsn/3HElUAtYt0slZAPQRrDtNkMP1I/nPFErTSG1WP8BFuqaTb6YrQZsygY@vger.kernel.org
X-Gm-Message-State: APuU4Z8TuNrywo1trKZzor1jp//YgUOSyp9Hxq6v14hh/blbFKN/keS1
	jm5fDlWnG9z5iArEQf4UXKAkuZz5ecXcBu46j0l4nnYgkqB8SGlt10FS
X-Gm-Gg: AYBFou1Vgi73zSdcyjfR/A0WY7wAODduIO9JJiSn513pr4pdTblxQszcLySXMYYcWMJ
	3224QISl0KLTKfhQ8LQvvtXMmQPxyOJTtpXKlgXWIX9WtSgNVI/sv0Xtikk8OSOZ7ZHzKqUsGW/
	pDAleG25t9HCNor0Xu5QeGprfLUNtx3TKE0FcrgLBjqj6DGszRrGsKNQ9LbyNniDs1BwymFH437
	iCcJzOQOu7uv5PCqIjJicqK02VMsSNo6jt5x2/fp3FckWSlL7mV6QHGN9GctUoaE4hOBWtl036D
	nahuv/T4KojJrcNrqC4PUMlRbmtychnzX2fLxc4YPKbpgXmrTfyEBzG+7RkrI5bqq18jfblR4pa
	at8pCRVkhK7JL3tjlKDS2Dqi2a6AAFRzo96qv67sH7AkcVjsQ87Qh2/oG6ph508ARbcdq03iz4z
	5fJ8OEr9Sj26sXJ9MNugQoCMW5TR1j6CNxJa4REX2ob1vLgZQiKTiPxRYo8YK1rtGFO2gsnWqEE
	1uiu6zpKL09Jgg8ZU8TeoguNbvNlddMWROSanjkncefSahDV2TaBaSjDtSLW/Wz4A6rMeqES7NJ
	JWa8Fg58XNVUc+BdJeh7mjk9UXnP+6PU9O10jV8CdRCzYpHrt+ftpXuFVg03wAyWi0CNUFY9pBK
	581jfIduTmK321gsmTy2tKPxm0snBCSigpEIimWq+7PHP87wUgKGv
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr108198535e9.5.1795217746082;
        Fri, 20 Nov 2026 15:35:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v14 0/5] clk: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 00:35:28 +0100
Message-ID: <20261120233535.164885-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v14:
- Fix wrong definition for chip-scu
- Use scoped guard and guard API in reset
- Rework for better num_clocks handling
- Address some forma impovement suggested by Brian

Changes v13:
- Use guard API
- Drop spinlock on read operation
- Use enabled/disabled now that they don't sleep anymore
- Rebase on top of linux-next

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++
 drivers/clk/clk-en7523.c                      | 390 ++++++++++++++++--
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++
 4 files changed, 448 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

