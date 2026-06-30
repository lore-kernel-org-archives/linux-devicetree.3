Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7B127B34E
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833917; cv=none; b=Qo22QGfYcQ9wmlPrd5IGuIpLrU8/Ev+g2YAuBEs8KG6BLJGIDOmXrXy24qYVmXSOmG4PAz/3EVbH28qWFf3YQrJL6docUzGCxPEhjem4xTkTurLi8uA1dfGT/TVPUR0VUnuggawJmtm3Vl5cxKQ/eaKHAC1eWrOgyumq5Jss96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833917; c=relaxed/simple;
	bh=9F+YAr8YLKN22svH5CFFrddaSgce+A04HOUMM0xsx7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JZp3BhEJsBjFcQMTlH51hndXMYtTdyvRzFO5QQejxWgI8hoi3fJJENRjeNb1Se3bk0HOX0e3HPncXOfD1LUJ3DkiGN0jW7hgWDn7+N7uqR2Le2Dy3XWeItyz3bM6W8tEuCtPOMU3AY+vjaeeEkuXPVIEO36cTarN2R3rtdU7lAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E12s/Lmh; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E12s/Lmh"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c9abbd0a2e3so277637a12.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833916; x=1783438716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6+QzKXcRNoqQlHz7+u9sgV6eaPwE3xJHdlR/zl3wUs=;
        b=E12s/Lmh1RPFZVZqWf5WJw+B/Zw2W2XrYfXKnNO1WBWHguqrlingEOk1dCkN0O1hZj
         JnEPD7jOFXM1VxvZ0qupUsIQqgKFbEDpWDfiHtiiD5An+2pNVeyofoZurogXbz9h4pH4
         eL0e73i17+ktfLqTLmY6MW1m6wJiQZv0+5eO9nX3MHGp4OPKEwXIyFhb1TMvVkJNvYPf
         tjmBfG1157sjl7hGTcYRNRvnx3KoQiLCp1UnPwub/nhCO+5fH+pxlMPA7HKFdr7CGfL7
         XCvYBL2RbgoNimPGwWfSjB+Jyv80t6WBTZMpbI6og3ZO6hKjYHsY8X8WQQBy8CjKQYzu
         F1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833916; x=1783438716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6+QzKXcRNoqQlHz7+u9sgV6eaPwE3xJHdlR/zl3wUs=;
        b=P9oHlwhqB6VvXxcvay/W7meAaiPCEZ3aUPQ6icE42v0TSq45QbNH1T/oNdafxzcQ4A
         wlxx/t+OrZTU0M50EVOaa4//qMvNN/GlLwmU+al+eRwtlz0a6rkiVZpFSiiBihwp6s04
         L65vrc77AY26ZQ+fKfFXS+9Cc1yIQFOZbvomX5c0wBLOKCG+KuFfoWdg9mPGcIIQruVO
         ffuTVDXf0aFmEU6HpdlblnhQDrgQTZVsucov+PFGXfGgjP6ZlLY0J1mcgPebjm4oXt16
         a3bg8lx1ICM0LemFsPoA4DiCc2QXVcmBA1VmqNLDEqXo+3a39MRbFvmJyaMEAgWmI+0r
         6ONQ==
X-Gm-Message-State: AOJu0YxJ7Q4Tf6sjxXu1KRjP5b4ieeve4v0WUjMSOb340+O2QJu5TW3k
	0l+21+1GrV67dJhpgDiKbUIXSbqWM/XWD0ChRR7Su1kZ7TbQ+iEnz/8x
X-Gm-Gg: AfdE7clht+jmjmt2TlTXoRiipPVB3oB+kRXsSGh6zCrH3sTtOngi7+Pr6yFET2YPmL6
	si2ZBdAMkc70fADu8fK+cJ4vkXFHKO2CYVR7MgXYq2voNIVVdH6Myp57ZAsOzm6OQnWjswXu++8
	yJaQl/kBu+KvI3K8in8L9E4MLa8DvMZFcZFQfcpTrMZ0wSJDE+VXfE70kZb4x85ezvmi2nKzy6w
	G5/E6F6L6pZm8Ic58bTPeHDNH/F/GsthVQWcAwD8ZcvkXxk3fIVquw+2Lc2NGcqzG51Z57sIHS4
	sBbaH/vDk/GDUFDuYKT1xEgrDUSmRYSzWHAX9ARqHorAKEuMQ+3wvH8wh5IRxO1kpr+ZX1zGzlb
	vW+YCed9SjSIsxixK0cdDCLIOuVtF5KnKe2w4m/aCg7LI16ca4yr0GQ3TgRAQJMI+ZS6GvUXTPy
	8W8yi8bK07wqE=
X-Received: by 2002:a05:6a00:174b:b0:842:5a8d:3035 with SMTP id d2e1a72fcca58-8479eee483amr3328451b3a.22.1782833915487;
        Tue, 30 Jun 2026 08:38:35 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm2413695b3a.60.2026.06.30.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:38:34 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 0/3] Add devicetree for the Graperain G3568 v2
Date: Tue, 30 Jun 2026 23:38:07 +0800
Message-ID: <20260630153810.3574714-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
- Fix trailing whitespaces and other formatting issues.

Notes/Unchanged from v1:
- ADC keys have been verified with evtest and works fine; kept unchanged.
- The 'regulator-off-in-suspend' property for vqmmc-supply is retained.
  This is a known issue shared by most similar boards and should be
   addressed globally later.

Planned future changes (to be both with the similar X3568 v4 board series):
- Replace the legacy 'gpio' label with 'gpios'.
- Add the Bluetooth UART child node.

Coia Prant (3):
  dt-bindings: vendor-prefixes: Add graperain
  dt-bindings: arm: rockchip: Add Graperain G3568 series
  arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3568-graperain-g3568-v2.dts    | 894 ++++++++++++++++++
 4 files changed, 903 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

-- 
2.47.3

