Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39A4EA383
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821324; cv=none; b=TSRe0HHhrviAerjtnGdtM+92MRoF0T5GHYGZ0O3i5WBeIUVFFjkyN0pSAier01WG073I0rWl9kV9MZ/EQVdXx19jASZj5FYFAQaSfhUMGK1MYD00bxzieXDeUIyaUfiJ0Nu1V6AUt/1KO4qN7p1AV3db3B5p71vE9iqbt0qs8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821324; c=relaxed/simple;
	bh=Uxpyi86QWWWez51vf9h7G/S/w9n6MkT4D426+4rpJH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgZPexuWu1jMbK0hzwxwECwTjb54VxHjtHZ9YOTvfqSW3TwGs5LTffvOX5N9q4XNPoF2rP+1kIukRKVcRnPFaLCQ4O0SAOhGGj3uJ1Y9Ua140Q6Ys6Vm8FaP2zWhp285sLW2c3l6ZQkGoaP4pVhsMu6GPpS1kxMwBMiGpRqcstU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzIOaUsv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzIOaUsv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4210835e9.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821317; x=1785426117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcx+fOflZhetg37fsdgPkibtdUAllraHzQaa5Oytmww=;
        b=rzIOaUsvEWaERn/tDq7djqpVnpwI/l3GT24GyroBX64CCwkSkZ9vkZMF96LXyCHBrw
         nWysjIoYmWnQMhDwZHfOj/Vw9aPAcre32bj59AKZDHgojllXZdd76LXNH95YwSFoqgLt
         fYpCL0cYA5foX9JalgY/oHHb/yQo/MmYmCqLFXcMXJCFRNaCZd04TZShVjfCDIS6uMl+
         Lc/EpS/M2s4WaAjDbhk5QEN80fugbU00B7Wg8rbPzH14ob5JdOWLliXqU+ObbjkNMHwn
         vifr3/+C5sIPuZYP9ZRrKOuIxhd5Sq8MhVzKITUYN5pfpTe7P89ThUsJ0NNr8eoEYcTr
         aaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821317; x=1785426117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcx+fOflZhetg37fsdgPkibtdUAllraHzQaa5Oytmww=;
        b=AqWreO3MuUdazHmjBG5+MDDowVrycqJMaeWVSZFOuWk10XLesOqqC4dfpt04saqa5D
         SNv+fufBF6KXVdkpTcPairQ2EGbEL2bvxr4Y8H7uVzn1BZwtSLlEeRUscbrEA35jDmI7
         0DU/KlmLVBBxjMZ9dlNflCJjMAZhCUd3GRjVQyv1EeNVQ3ysjisxP5ea+S3p4Y6w/qyE
         DCvDbd7oPPiVKLLlzEaOJUpd4dglQ6d+cjq06SJq82gqovHZuk4Wiv3SE7S+qezE3aUZ
         6Grd6/T4WXMEHs26HokR/vt6VxK9IwqZyHTb2zOhbY/b8voOlHInekSpRhVHWS4nLQ6q
         wmOA==
X-Forwarded-Encrypted: i=1; AHgh+RpQeNzKbaHqKBP6vD3LB1O2g0O0SoS3ztYO+fUyIKatR1+Ohvjmgo7I7EFB/9DVfvrwu/YSCtNEGRbe@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVv3CuJ6BMaGmrAIoN41Sw1/erbdjJqhx+FPP1WaozjFRbEje
	24yVLD6KTb+dlaMOw7FfhxZSM4xiBAnByF1QbzKSuGXxD5BjGfYZInDFFEGvqw==
X-Gm-Gg: AR+sD11oZX6FzXOi8r1NaWrn4o8zp7RfANhCtlve8feMHcBAuWXfqOAgNGAoPdsIX1a
	Irv/PXkc1ZIeN6Rqa/UB7vUq5Dg8y3LcwCFWyXybBLvrEFjtw6utR9o4H/tjGukI6dX3d78fjok
	JBA2yZu4LiH6qIBDrxk5z+xM1gmbXZa/RFFIkRkUykMzDbIATFQG07TR6tOZdC4wWT/y9HKfNEx
	gu2AIyfT2bwG4L5/8i9buj1AA83+N9hQDJ0vtLzO3NOjm60EepB47iOW3xgsdFCByAWmaZJmJ0U
	AqTK81tjM+iSxt86d8Kc3qwagfc7JjJ6khbitcBpNMAAewWBf+0ZajeCAq9yXJlASUdXmq72Qga
	Jtu+/d7e2hgBMR8i3kKR5uswu9jxnMRDlxreQzQu67OaFXbRWLP8DbrZvGfZwWmMeER7vziOCmm
	TDiCbQnD/0/35AHkJPKAQ6kY9SGA6x8TzacStJzg==
X-Received: by 2002:a05:600c:474a:b0:495:5a91:8027 with SMTP id 5b1f17b1804b1-49573c8d444mr42787565e9.5.1784821317042;
        Thu, 23 Jul 2026 08:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 0/4] Add SDHI support for RZ/G3L SoC
Date: Thu, 23 Jul 2026 16:41:46 +0100
Message-ID: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This series adds pin control and device tree support for the three
SDHI (SD/MMC host interface) controllers on the Renesas RZ/G3L SoC
(r9a08g046), and enables them on the RZ/G3L SMARC EVK platform.

This patch series depend on [1]
[1] https://lore.kernel.org/all/20260723151024.318918-1-biju.das.jz@bp.renesas.com/

v18->v19:
 * Renamed aclk->aclks as it is AXI bus slave clock.
 * Rearranged AXI bus master and slave clocks as per binding.
 * Split SD0_CLK and SD0_CMD separate as input enable not available for
   SD0_CLK.
 * Added bias_pull_down, input enable, default drive strength for SD0_DS.
 * Added input enable for SD0_CMD and SD0_DAT*
 * Added default drive-strength for all SD0 pins except cd.
v18:
 * Split from patch series [2]
 * Moved sd_ch2 variable near to sd_ch[].
 
[2] https://lore.kernel.org/all/20260603065731.93243-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 233 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
 4 files changed, 444 insertions(+), 25 deletions(-)

-- 
2.43.0

