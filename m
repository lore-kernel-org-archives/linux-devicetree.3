Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30E3090D7
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881733; cv=none; b=RDXtYHUdISWEDXXEQBVem55U53pBQ67sqMUezvzIkHZCd2PgNEGQ2cJlxRDX/ycoV1P2pKZh++35MjB5Xp2+BkMwFtPzgYCan1vAu2Z9NxdCYD6cL0dcxl+Qvar8Igy0eXyU0Fxp4pHg1gKfu2IcjUI4unk1l3GFVnm9SpBlsn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881733; c=relaxed/simple;
	bh=JaQLph1fDFoND2GO0hCL4fd2O6UsqhltUs4hWnc5M5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pRpD0nQ3FI8QY2E/QMk5VFnjTJ1HuBKj6GBvNPbxKZyGIqIjtR/kmQQ4IMt8riGaFH2ptQHDlrQo9YwCmy0juO85Ufe1lHcSvJWYTG30BKseFCI2mqDsJsMzTcma8sBUyK4mO0oj54SNXWe7t4sNNxLo0v25oIzgUKSLTYcGluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtZcfJ5g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtZcfJ5g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d75312379so2644274f8f.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777881731; x=1778486531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg5udYoZeehjUQryzul1N4fTdsRztvPb50rKAHLeaoE=;
        b=UtZcfJ5gBdFnPSfzK/L9gSmAwWLKkxV10qgwjDNN29gYkiYyr/FqKoPxzIvsDb/G0z
         b1QeUBDXRKQ1CWQwAPXSvctOUOIGFPMG6ZSBUpME6I0n4Qjk/NkORqfLGzFSdZkxnsYq
         G5zH7J2ou1BM4ZTn0PdhoA3MoyksXOEaY3PeMDbBGcXWwPj/Bxm3txnLEpflllQdssQ+
         Zre/aeKW3uKtmpZopkgJYj8Ehf0EmiD2k4wXG55pukbMLcmRISxCMeSXlBXNwU7Pa39d
         0bKyOEJx1cN2COuchb2EMY9n41VUBlHneN87SSBqIGKvQyqX0RhcBoaGV3LO5C3zRhn3
         j3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881731; x=1778486531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg5udYoZeehjUQryzul1N4fTdsRztvPb50rKAHLeaoE=;
        b=ADQBUoA4gp+X5+So7wqSM3qtW7q8wzWp2cqDZRZ9D4IvS3vr/8d1/OwbohW42uj59v
         dMBv7vpDTALRW3tBADuAxu9RqO9K9Dh29fClXVKGFjUnAzEQac0DavvitTFjLkc5H12t
         BluwAk5SGVGE8KpPZKajyN9qnKq3ifjPAPS/6xMZ+YTesiSW3bhbxMlwyymSPwC9la+w
         pE7eaNG9npjqYG0cNISpBM8tUCpNZa7+2psYA5rYYhG1IrTP8E8yQy2WjfGR1Y7IxA1Y
         Djck8j9j34jMdK4mZKO9ZjmNsLAPuqzhwNMmaqcK66C/IXR59FTRM3WU41dIOtR/TVoh
         hKsw==
X-Forwarded-Encrypted: i=1; AFNElJ/gFGHk4FMhwAuFqUuPzL9I++K62E176TDJYsirr3bqMI1thTYu6vYt/xLpGb1qR0esQNehPgIpfROr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IuS3WvQjMKMHRDbd1H1kZ74697Tgq+z8YvyzSUvTE7u1HEOR
	15DiVUXjZ4W7VI5jt++0cABCraDaiz4BOOF7ot4ZOLSIHs2U9ZgZDtWy6wskiPyC5do=
X-Gm-Gg: AeBDievBARcHYwSgUnw4YYjL5YQMEq6csruN5sIh9hBjffXnQfx0O/bJVFho5/lU2H7
	KjddLG+COW2uuyVc3Xc6FKSW9keRV02eacybXisMJ1LuY05j4P5oIRqcTp3W5yTOv0NgQoi0YQC
	t7cAO1SQMS+kKAiUMvGo4KulrVB1CSLmu4+kRJKY/xQxdfNH70beL6lIGM1i8Qb0kX2omicC5kI
	uwBKbwXFLYOj9kRCMxfJRS7k3L28oFo3wEg5AwjU28zeUXWcaDP3KVL/rXW1I/+R9+l9rXg3XMZ
	yJY/2bnCLlzsMDyM9me5Oonrn9As7/3BZCnsF9ey7ahwh1j/exquzpDnipo0O81IvuvDTZ06m5s
	k3efzOfg90CHCTfT4teGEbWU7DnA6tBF5Z0BfKRk9TSJin37nwS8hDmS9fooAUAd9XYb5EkwHGz
	CKHxbltKyf8wUL5FV+StvstrUHda4BVdGqBws2X9OIS44+U6JYU9l4iks=
X-Received: by 2002:a05:6000:440c:b0:43f:df55:fe5e with SMTP id ffacd0b85a97d-4494aad7a40mr17780464f8f.0.1777881730057;
        Mon, 04 May 2026 01:02:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defb3sm32255216f8f.20.2026.05.04.01.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:02:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] drm: panel: support the R63419 based dual-DSI video
 mode Display Panels
Date: Mon, 04 May 2026 10:02:04 +0200
Message-Id: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1S+GkC/5WOyw6CMBBFf4V07Zi2lJcr/8O4KGWA+mhJi0RC+
 Hdb3OhOk9mc5OacWYhHp9GTQ7IQh5P22poA6S4hqpemQ9BNYMIpz6ngJYx20Ar8vcwzCnKWBi0
 MVl1xBM/B5algFWDBRV4gb2rakqAaHLb6uWVO5zf7R31BNUZ3XPTaj9bN2x8Ti7s/kxMDClXJs
 M5kuIwdb9pIZ/fWdSQ2J/5hTemPVh6tTCpGRZY2VH1Z13V9AUR6s6BBAQAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JaQLph1fDFoND2GO0hCL4fd2O6UsqhltUs4hWnc5M5I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+FJ/GtTpEfBWK/iVdg99R5G8MciUcSEu9ztDdWnn
 JBoNdUmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafhSfwAKCRB33NvayMhJ0Te8D/
 416er81uookd+JqHcJ1mDZw/9ZVUHbRTK1DxF/opxsUlpRtaeOWQhloEJ1h2th2A6t5ZWH1UVIJ+51
 PpS81eccdEL+2+XKBJi3MkyQCCznSHLyA2sOPct0dD6J68ShRR9Aox2kygusVBtyeo6myM/7PBE7PY
 umXlnSsjYkR4pkFOR7k8XSStrNlK5gzmZvXdgd2wgFav6qwSinlKksqGy0uLxOqeueDBaipUGVimeN
 NpMYeXE3sJW2AV0x+w/MYbatsj3DZdJh7w9jYYd1x/9HL7oxkDtndWL1Ov6MWD9WSPZ3EhJ0bLqEAG
 IyqpEC7oOPOyPOnySiq8YoJwjBKMNMFfEmAoB+grcNGycR+rReRrgh0SztHk/HsJAJ0/V61xXpzMGa
 NpPUgLz41Q6+S5JLvlv9LMqlax5Y/c35FnxhwQG0uN6SP9erV17UquIi4+SbZ+6QStZvrvKmZJ9RVw
 oC61mXlhcRGJ77dkHLJPHpMGxMBTxTQCyOiXl4FUBqOa424ikqUmEG8QEfzu/Vt36OZjEmRiw28hOy
 +m3KfzhMhA2H17Zkdcofma2AAY4bbFa4MuxHDX3xIBjF64+Em36zcUqiUWg4Dpwd/YhVwD9lBbvbYZ
 D6AcDSavs1aATRCxMWSUZ+ayuJ4tyCjVeDGM+LEZzMZxkYF1wkA43WNZRNEQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the Renesas 63419 based dual-DSI video mode
Display Panels found in the Ayaneo gaming handled devices.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Added DDIC compatible as fallback
- Added rotation in bindings example
- Fixed bindings subject
- Added second MODULE_AUTHOR entry and re-ordered signed-off-by order
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org

Changes in v2:
- Add missing rotation property into bindings
- Fix commit message & subject typos
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org

---
KancyJoe (1):
      drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels

Neil Armstrong (1):
      dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels

 .../bindings/display/panel/renesas,r63419.yaml     |  97 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-renesas-r63419.c       | 357 +++++++++++++++++++++
 4 files changed, 467 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

