Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014BC3BA23F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315553; cv=none; b=WdNaJwqsBNTvqJc9pBrjhrYzoTlZRDQ+LJ4vcIpRip+l02lKbMkOcXQApXlcDJQ5hk7xMlHQf+7aQCfI7kNHzyK5yoINyGi34eJPoQ/QGAhrsodC5S/cSBe7QVt0LYkUfXTrGf7Av05gtJYmjSc5xYvQwCLmQbolVUYSDKvhPLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315553; c=relaxed/simple;
	bh=u3xKfiYK+Qm/nVYNvA6AL/jqKDwwphJQIhKq2Ytmhvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=to4BpiiSCxKVKIAwIgBz9lXOR99cqf4js+N8OOwbul5lD1oH7euTC7xzkyjmGw61tKsz4vD/zHcfGpm4iPqLhubzLxqi5RusMRwqcqtsvI5zDfCQRLWxm625Hilrw93kf3GZlurNEgNMc6MOhytG1Z5oeionMdDC+zkOIrzu+6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4kRIi0H; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4kRIi0H"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so500044a12.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315551; x=1785920351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJQtueKY7DcQgS7lfvQ6xWjiCToIdui2BYDzzrpTxG8=;
        b=o4kRIi0HZZ/GSp4MDdc7ybrRO6mQ9cKuU1bApR2Id8mOsyflGktgubJAMkuvhF8tpj
         2nbp5WGqOnoAI3RDPPgXv/wfCK7fuTPLh5OhB7yvhAWMJY/JQSCp9G35f0mB/FjK3nxz
         VrX0p72z/B9N/VRm6KxrLHzE4q1KcVC576lQ3EVIJf/GMYpp3XUfwcGJ2VM6hK6Z+QaN
         gk025nch8Sgq3DDReu+86Kw0DZXhlkLE+mtEn0Sl4qab86uTea0rFl97pCYw3KULzP5d
         x2o3byXPbffkj667hQdF41kjzLrfUp91Ys6e3FN3oAoqk3CU163eR0/cuwmDGZ6THJMa
         s0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315551; x=1785920351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJQtueKY7DcQgS7lfvQ6xWjiCToIdui2BYDzzrpTxG8=;
        b=QRMMObZE6CfZViHvinOMkOBhoVQw2DcYvYpnfACcGdZCkGt8CuIVJJiIjFCUBpPc2p
         C65cLGRd2Wd0GWkh7Lln5melgHbCtmKLDaPc5LItffVv49QO6rPHOn4TpCphTlOFSZBg
         qrUp6SOzamN9tIu0F6TaDC3nuFZyPR5Oih2v0acuBkjzJBnyw/FALl7RmV11pj/FXo85
         oC31irrxHsCcKutSpCeqrfNXBliYfUpJ4LsauSfh77A/9DFfLdVOPHFETuTC6/PbIUfW
         QxqdlSyRhm9x1EcbOpSwPmnkgr8iBMc7lDYt58cxpHmnt21ok3TEli+hnQ4bK6A4uAai
         B0vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/9zayMWRtmePkDjghhC+4NMs2ffPlx5wM0R5n8QtQNYs+qeWX7E/0fZSH8VNxDbq/bXxuk8oWUnps@vger.kernel.org
X-Gm-Message-State: AOJu0YxPIkDCGplOguTtirbZlkxmDO6BGIfWIb9hJ1KStSCnC+iqzHrt
	GoUrZetS+DL8eFYBVlf6QBNdQ6f4KqrbmZkY0PtaNbrMCWPn+B+cRBo0
X-Gm-Gg: AR+sD13ooBJjoHVhZW2MgFaLLB6NfVqkdgY4YnOo4qZtP607lg8uU4Ci7GctRzAP7zU
	EqtWogZOn/9tFpCzuMei/kd+8+loDL5FNtSOMsO2M50vLl9yv5T+MIJnDSJ4CtKTBXViRn0gL8t
	un5F6AGM2BPY/thYEXOZ7zVw7WB/VGkMsNMEZn/8jczEDFPhqHUJ065/mo3FA/e3UvHTYt2n5C/
	J1vigGALwQcRehiuk3fBByuYMchdf+1sVlajAVgoKvebCZ415xDiXFoQooHHC5XCBTQSJ1SmfTW
	CXUycnoa8hxDK2Ya1lzgCdJJQ1uHzy/ygwMT5+DhXv/p8LXXfu6pMG4Jx6OFDZW6K8IF1UTbMU9
	Ro24oUIsJHI6VMyAuojbRbFDaozNsyg2HGTYx16r/L7/HiCca4pM7f4gvVu5HGh958c7dYsnw9f
	Ikbt/ml3MzDyWbbckQRfjOaZ3VdqRGAMDzfg41iR2wTYgaX5TKNld23F31KoHX1JnSL/1OXwwWH
	iMVhQ==
X-Received: by 2002:a05:6a21:7113:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c8ba5eba0amr7062835637.54.1785315551272;
        Wed, 29 Jul 2026 01:59:11 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm8179352eec.14.2026.07.29.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:59:10 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] nvmem: rockchip-efuse: add write support with VQPS gating
Date: Wed, 29 Jul 2026 14:28:54 +0530
Message-ID: <20260729085856.226001-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RK3399 eFuse write (OTP programming) support, gated on the presence
of an optional VQPS programming supply in the device tree.

Changes in v2:
  - Replaced the rockchip,efuse-write-enable boolean property (v1) with
    a proper optional vqps-supply regulator, as suggested by Heiko
    Stuebner. The supply presence acts as the hardware-level gate for
    write support; the driver owns regulator sequencing entirely inside
    the write callback (enable before A_PGM strobe loop, disable after).
  - Removed stale debug dev_info() left from development.
  - Fixed checkpatch: removed blank line after while open-brace in
    rockchip_rk3399_efuse_read().

Link: https://lore.kernel.org/all/20260715110107.409204-1-hrushirajg23@gmail.com/

Hrushiraj Gandhi (2):
  dt-bindings: nvmem: rockchip-efuse: add optional vqps supply
  nvmem: rockchip-efuse: add write support with optional VQPS supply
    gating

 .../bindings/nvmem/rockchip-efuse.yaml        |   5 +
 drivers/nvmem/rockchip-efuse.c                | 178 +++++++++++++++---
 2 files changed, 158 insertions(+), 25 deletions(-)

-- 
2.47.3

