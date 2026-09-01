Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAF37F303
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267511; cv=none; b=UMEVD6q/klxqK1JiVdtF6DyV2dlQpXGYJ6O1tBeTTQx9G72ergqEUKmMBCVg9eSWgfE4hb3XuYMZ473Fe0xdKy6VBQVmHNCGUMTa7AjsP8xJDvXpSy5hKhjdjLNRWdNJEeWCKScDBfyXraq/GAKYiLiyz+cGR7QuWEQcfrbsnyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267511; c=relaxed/simple;
	bh=Q3MIUo+gFc2NJp3XMl9CoNl/W6t2DiyBm6Rs2MqrdFw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=azZfa2qO313mr9tVF38Lm8VZkNXIFC38FEkotTf+LGL6wgvw4PJ1T5Tug0bktzxkv/9zPpcuEK5zVuCtpXP2V4vpTbPITwiEMcAqGHC4VTjb9f2fdL2x6E73oDLx3gj95PhNCqo9T7yj8FvE9rJ8VDPFkxmb57POsJRQZzVZC9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzD5myF4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzD5myF4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a60d406a5cso693372a12.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267508; x=1788872308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ld2dHDdDQiF6ur3QIWVOyuCBe04N1lf3nFHFqeQJu60=;
        b=rzD5myF4re8UGZm2USBuA1xk+k/coO3W01lAWZ0nGjx76wB8h9WOnTy/fiRcvHryuF
         U2z9pjpaiyFbktr0JyoCmbeI6758TmOL4Y2wUNd9+NsQ8eSEGVrAmqNTGzUxY05zuecz
         H2NoIoj8Nv/btVx3Mh+oyeHAMB6L9D+UUbbBqzh9ufzZJ0PNiK+WUgBuV7Vvjk95iVKi
         sQ//WOHAYjpLofqZy4L/Qrlo9HFpUCaE1RZ1OM+UmygwpWhjfJXjTw0oyXV9NH/GFQwR
         3Eyo/mCfPF2DXwncmUBzgrb7xbrCRIKYAAzzPFFgXmHdZhQdx8yeWf+m5kzSbal3+pFc
         rNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267508; x=1788872308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ld2dHDdDQiF6ur3QIWVOyuCBe04N1lf3nFHFqeQJu60=;
        b=I1kCGbaYSeIuC7POvoLSmtYskhq4Ewl5G5okGQTCZmUZJr9YJTUeHytdJa59iYjoJ9
         zIslqz1AuFSZ7yH/yw+FKJmRcs8vIdSHKuzJUKq9pYWunxKxvAxX6oG/zwfxTilyEJ6I
         jzdH2CR7m7PtfkvJCy6qDmga4le2Ha/ixxKE2iHOe0e2mGc4URJrF6l6r7CMd1S6q3PL
         LZ7tQmt9ZS5DoSY9WnL+HOWLVZhKNwR2F+2dYXUP8j9FBkq3AtzeXt/kDZjvos/7eYSt
         k/YRl/KWGbKdqy7tUKYwZhsE6OdQYbk28+RyukjkNxUruKwZ4o3dY6QgTtah0ecJvDiC
         xvVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNpeetydgI8EO6KefIElFdq68IwW215BUjeQODrFO7Zht+tsVaBg4VRQ1+DOb5YLiIvcO9hdGYEpsl@vger.kernel.org
X-Gm-Message-State: AFuF++kBt5VjewIRWCayFwWF91Xs2Bi062hF94DI1yysagZSdx0Xp085
	VXPyhu1ra0mOLaSFXjwxwOuwwhQlLtCfGz5cHTy7IvCWv/IH7Xma9PY4
X-Gm-Gg: AYBFou3LsIe57ledimXlgtf3DIowipgNC/m8BGpsdUgWRs5vgBumOnfUK+BsS3PdLW/
	A8IyigtGdK0BjEc38IXsM730fPofCaz9YE710G8F78c3Mwg1yRvtWke6ZGU2UaWAzt+s9S3Okrg
	UHlg+Fkj+zi5AeWFx9Hfp2QBF76v8NLH186sjkaToy3NeETOHf9iaBFQeBa6H7siErTRf7vQXDC
	oh9nHMCSseHoh8G8TuaU8WDh89MtPgiQf1ILEqEF858r49vVqvPzF7mb5s4csisWDdmS1ICzNz3
	xAQaSSyeCg2MXZOGm/aedtn1HFVjNbsP0tq5S0BkvLD7TUmQnvb55Sm7tsLtdxLbJI4EYlrRyx5
	oAE0tbYF0jQbkphwDDGt9rTJRuThnzLexJjx/096QeEUlIIPW0EbVr6QMx1OgruxWjQDxxHqGE9
	NxhVRuNeuIBGgIxQJTMNFHx5Lq54vogD9LoSAvQAGMQWn1xCSvXI9yujdjHVYc4fCR8vlCdI1Ro
	bEZOj6NdmwS+XsyKNk0Yn7mrYVannEltZ62VpGBsB2Pxu1pheeVbrPgJfTcck8=
X-Received: by 2002:a05:6402:24a5:b0:6a3:95bd:143c with SMTP id 4fb4d7f45d1cf-6a663a26d14mr6639703a12.5.1788267507997;
        Tue, 01 Sep 2026 05:58:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d15d10asm773959a12.28.2026.09.01.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:58:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue,  1 Sep 2026 14:58:16 +0200
Message-ID: <20260901125819.20378-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  13 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 826 ++++++++++++++++++
 8 files changed, 1294 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.53.0

