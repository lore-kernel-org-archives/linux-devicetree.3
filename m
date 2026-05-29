Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11263A7F79
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082595; cv=none; b=Q4oM+RxZnGW97Na79odnSdfmQ562zP6r1e+1ozd9vOq0e5dwhLLf5NVhJuZRGqLBMsbYv5JuWleoM6DtJQ+NRAhbZRHTOuHQPKl5s913E1KffP6MkHQyjEvjYR09nuSv+IDvp7tES3i4tdBInW8rLbCss6+lkPXpZuIZluhfAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082595; c=relaxed/simple;
	bh=hyz4a9KfkQdq6GF9UiDXxz4gzafyVLqjGocQwFon4KY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Se5DDePcX5YIkg1qRMG3Su0F+i2OFsrMnohwm6Od3GfjmDaIRF/7//FY6r+YioYRfCRgBMjOaOEkzStJzIvKOp4WGFKR+TCiDJMXXL3Z5PmyX3kcpk64gm5c660BUgeAq3qWKMkRBJ96tjmiIRkofuQTco9nj+nYZzLof8/9fhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0zVxuQV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0zVxuQV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso123855465e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780082592; x=1780687392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndz1hoCdDpCMZ0CBl4eGMfc4kRE7BfbvXniyLhRZSE4=;
        b=B0zVxuQVlDJvt7ACcjEg57tiAkrD2iExtrSosNnyIAb4hsQTstKoXD/92xpvsfhqmB
         LFFUQ/5Q1ZYmVZVvSwxGEQiIAY2JwVKh8eTodKAoE0jilHX8By963GUNRq6bMs5GENxm
         zdbPG8k3nrlSXqm6ga3VbBw+EHoDUnBGX/6Q4MiETx8aNqLKaOiygFnq3OiuTJFTcF40
         AjyrXXgAgULnvlNTbeZbl9ZaCQxw/rsWsgM6tGrMbVRrUl/mbfISunZmMJypPI9JhBrb
         D05jlMYl6DvvJAt3u8QVllVKcS68ImHj18OEoqCuOOeHSFcAs/ooGAn9XuVfKbgCBEAT
         eV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082592; x=1780687392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndz1hoCdDpCMZ0CBl4eGMfc4kRE7BfbvXniyLhRZSE4=;
        b=sre0yZ4iy0o7SgHYjJ824RTb/6hc4E6VNE52S2hngv5f9GngEn2QCUPHarcN3pYUvg
         UglbNF1B8PU2EphWEjzmIbnnLGc8O70HDUC4yMn6yeJ05aifgOAyqL/kSV8GFB5RqQ6d
         CjQZjdjmwvY4X7JitS3jKdOPBjqQI/HJSXOztteprPEB9Kf6OwUA+wnvdQQQchsyF6+P
         V8hFz5aMIeODJP1Cy+VzLYdav51D6WNByzsnEt1O965w2ditR9eyJqLDFiPAI6lPygsQ
         bTye9GWL6snQCwqZ60PiXCsSAPEmXUudtxRBt/rVjLaz86hhnCGp0zXONgs+QGIccCEh
         K60g==
X-Forwarded-Encrypted: i=1; AFNElJ9u/B8EigitUDGUC7I0yy3HF3JnH8bXE5SWhAS8YfEJt0WqXFyukdaKNaM+JIE0lF1CtMH76UT6miuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/r2MX95FpNMsF2jq+u0QRgYQ0H2w/rBodyHYFGDDAVMbdyzqX
	mTHjE6aExaRrRZBxnmu+p0gbImDw8to90rMOtAc3vUIz/T5YBeDQtXn9wF6NS1ItNYo=
X-Gm-Gg: Acq92OHTXo87yy9H4Q6esikWzWbi7tyQKCr8oYxZUkeghlCRNIoSUskVX7SA/KR/w+m
	D3NToYMdOdVo5PTKH+A5GKM/h6+7Xxvtle2ZWsFN69oPapa/XfVjyVMM/5b0w6rAXFkxjMAjvol
	wjJDAjPUWnA10o4fbBYSqC9l07nZEaOFl65HBRkIbHGFks0WVYx5j1FW/tmbR0OQHKc+xBUbbVz
	nu1sGq6uj8yyRhkSD6ZiakWH/yzKtSbeMy6sCj+b0C177BoryJZIhVbb05/vFg/8zu1XM0hQ/2t
	kn0p7BQY1F3hhJAvHlOmqLX5EGu1f146AnafnfXbw2IWZkSd/MvuURNiAJLQnemx4BZbKpvpY41
	t8N6Q7kof8EYVMQb2p+8QUx2FCbRv3v6cNxvUUk9OGViLH53qQJ540ZD7a30Y93pNzSHCwxREQ7
	Rw2dIQcsU4kVaNtIYnk0A4ll8RMw75qiOGm+PRth1mxI/8aRQEaSq/mbY=
X-Received: by 2002:a05:600c:8b6c:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-490a292fba3mr15871725e9.18.1780082592072;
        Fri, 29 May 2026 12:23:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm28692545e9.9.2026.05.29.12.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 12:23:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Fri, 29 May 2026 21:23:07 +0200
Message-Id: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvnGWoC/5XPwU7EIBAG4FfZcHYMDFCoJ9/DeKB0uou6pYHa2
 Gz67sJ6cM1e6vFP/nz/zIVlSoEyezpcWKIl5BDHEvTDgfmTG48EoS+ZIceGK7Qwxyl4yGfbaA5
 udSNFmKJ/pxkyQl6N0RYkt4LIDIJQs0JNiYbwdZ15ef3J+bN7Iz9XuzZOIc8xrdc7FlF7/5xcB
 HDg3rme9NB3Ep8/wuhSfIzpyOrmgjeq5DtVLGr9RvFG8Z7aO1X+qlq0O1VZVPJWtKrrvLX6TlU
 3Koqdqiqqkd5IbIQm5f6o27Z9A+OP9kDtAQAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hyz4a9KfkQdq6GF9UiDXxz4gzafyVLqjGocQwFon4KY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqGeedDSAmaxEWFCz8CYt6xxzZKkdzED+A2UmDL8D2
 nVNNL4CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahnnnQAKCRB33NvayMhJ0dn9D/
 sE/AU77M7s/TwXuyqD/Mj1TYB7fXk4pCI+bWHvo+AEKx3QpoHQ6cLP/EZCUtdwYRsuWCFDI8afjfJr
 9psSKOo2Fly28TOIETBHkajm6CHMHh+e0Pb2biwVuUl00Rp5+KVHNMvogZg/kfNqh88baJPXGIwQNJ
 PCXJr7FP/tFpp5hFcZbacugiKvc2nohC61M84GNKpwgmGUzkbDNYgY4MEzgIj9Ww4PMai1Fc5AWxm4
 HINbalshfz5hR1omdn90hXK9F6+FOGEfKajDmcG5EhNacQlVON/10by2hKHG55MC6C4ofHsl4ApSrj
 IyG+wbtMoZmwG3tVi+obY4D0GAdQ37+JRqAnTA+9gJGSXJ8nZaYrp1+ID4G1Kd8u4i1nRIUjrjYS0L
 yCtbu82jAH8qXG8eUBOyRnzWr/Uy7h7oCiuZTzWiI0hpcNx1IOv4rIp4vC1F1IXx8dTU7GVgPCihZT
 YSQFpSGbU1VISH8Xu+7RuP3xfHdoCH0pEyTn4Oucd5bjEaBHXMAuCdAFWRy638S7Nk3/c5Qa8I4zvJ
 LkDeVo1whnBmBUd2uqtF7pRLAP5zMJuzHS4SZf+v6wYCZ5N4j91OcxQ45vK2miY3RgxDB2bvX2ACWj
 XWi0WdtUHPd/1OPlw+z7BRpTJi2O95IlMYgircSQ2I1AB/eP9cr8dWAGU42w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Rename vddio to vdd and make it optional in bindings
- Kept the bindings review since the change is trivial
- Link to v4: https://patch.msgid.link/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org

Changes in v4:
- Fixed Kconfig typo
- Remove again unused macros
- Added delay.h include
- Link to v3: https://patch.msgid.link/20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org

Changes in v3:
- Dropped unused macros
- Added second autho entry to match header and commit message
- Move my signof at the end
- Switched to flseep()
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org

Changes in v2:
- Fixed bindings subject and removed "|"
- Added review tag
- Added higher delay before reading ID from HW (100us was too short)
- Removed probe defer if i2c read fails
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org

---
KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Neil Armstrong (1):
      dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  52 +++++
 drivers/video/backlight/Kconfig                    |   8 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 259 +++++++++++++++++++++
 4 files changed, 320 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

