Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914013A254C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432242; cv=none; b=G4284FmNULO+N2tSJUTgRAWza0UthG9R6gW6W38bkti/9tEJwRE4KHo68QJtPHq0mCmmu3syQVTSNiOufGsb0ndWMrNf9HPWcSTif8H5Cmbvj4ID6M+l2wzft5Ff9Ljqd7T8V90akLmrpCZkVHRCCRVi3NCNp7HTQDwtrjJnPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432242; c=relaxed/simple;
	bh=BtU/1FlmpGpeVuq2O50FZAVFbmjaQJruHeTie0Nm7GM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q9evzHYSKsQTy60KwKODdZyAPYg+qPLsExtCwX/q9uu17CmIVazCViLHJ9hxNUDLF/gJ8jZhdF5ayWW+Iaik8gi0HQjlJCquNkBN7DdykAfyzSSjuQtOy5ipFNH1UWAHPe/8FuaA/i8fq5F9QkdAIAh2TUyNfElk7h3VHdSdJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmJztJHW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmJztJHW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so27183915e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432238; x=1775037038; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=;
        b=NmJztJHWHjZTZyfJW4XnjBEqwfx5j7bUcZcAzliL1wnALQEmXwUNJMqquyiJH5ODVU
         cftwLIUEGTHVFBN3ga7rw3iB39wSp5MRabn9cI4yb+tBjV9HYAHsbFrcuUvg4LSVTWMU
         hOqO0LVk6oVT4X5rjeBZihrlF1eLyelVkPMnVabRo+9qYgAkE4yCB9AseMJpEqRhgzL4
         YOIhWJe9OPVNKt6T5HBpnA5i1jcP55df1xlVmf8FWG6/+zqnND1c0seLhr4XPpWIodiv
         pO+DqtwM5iElxHjIlFjeFH7XoTCV2hxpDBlV9wrkO5ZJHAgUdrMkHFVrnN6lbkij+e/L
         3pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432238; x=1775037038;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPn24ee3Ut3if8Ncvi7vY0xSmV1MlIqacbWnXs0wBFE=;
        b=AGrc4cP6ScyMj+uaGVqLKYdYdzsmA02xBGflKMFluXgs8TN2QwxWCrsmNwtLn3hedw
         d9XswwX4f24BTyae+Bc/mT8cAaHQkhOvtugJn4ke5d3ztEH+Q2iSMWPgCLL51NTtZogX
         gbpqvuKG2u7Y0GSXintQT1XcdNL4iVSkL9WUqV06wlA06Ut5Qk4SNhddIOt2n3cdac9w
         rfZLbS7o8jL7rg1LhPtsLxpQdAp4gXu+HLReYaCVOmWoMwLm5ZgaRnPq0zFO3/6jChyW
         3gTDcSCguliBh0VybGyWM8FGq3xNBfoa2oTawAkGo4FqG+RzD5o/z0Dq42pTRQZjepuo
         RhWQ==
X-Gm-Message-State: AOJu0YzvQKtj3H/XcUKa6eR471LvqECYEjg6gT+aiAlTW8FW2zmCD4Z+
	1ZH6LowoIPbebAGLmtLac47tS9iIc/bNzxtTsUrM9OFrxrBn5FdF/OXiYLKCPdi/
X-Gm-Gg: ATEYQzy1+y+gKwX6xHz8nhHCKL10M3whorBrjlrV86ZZ6epJV0NT5INeRb/Dmz+G7xQ
	OKAQ5K+PZttNZSqPM2ubuAak8G7l8mvf4Frwl7n0w6g1xiJZJDyrUD2Asg/h9EuRZzGGtXXAIQr
	JHxD1p1ivld1dO1oBngaNXLETMjX7/oAqh6IBLbjT4B/ry7sF/cMVHChbzZzkQGb3d6gSs21bA9
	dlcW5clLNG9cqfdQZ1WbUYtsm/CXw0bw/G9fj2t/rLkxtO707VZSHlT9nkUdZoxmgnUtyDsmJUj
	JR4DOu04b3xzO/hofq5lIVjIY7m3uGaQ1iIJzLYjvV8ZoOlt2FVR2u8svOHVKkqcvKec9+utppG
	QrO1mhMDtSRNcUlWDvRRpbJTUSmu5gCpo+W9NdG6DJww2w6bGuOM6UvkPTnzuEROSG1cI1TDd5L
	NQ3AdmijNSDgJC2qA9y0YfWiEqAE8YbgeBg2fjd06Qz0Ni75+695rnAzfjJNQG9WGYyGNem1QjA
	L/8ZTYiw0SBLjxRDjWgNuqhqt223Mbgd9bMF7ePYkpgogW0zmqqSNDiW24+N+bCRHYjY8CQBs3B
X-Received: by 2002:a05:600c:c490:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-48715fd526cmr41004935e9.8.1774432237393;
        Wed, 25 Mar 2026 02:50:37 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:36 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add
 Bluetooth and SER2
Date: Wed, 25 Mar 2026 10:50:19 +0100
Message-Id: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuvw2kC/x2MQQqAIBAAvxJ7TtishPpKdLDcaqFMtCIQ/550H
 IaZCIE8U4C+iODp4cCnzVCVBcybtisJNplBolRYy0Ycmu3OlsTtjL6yPt6uFYiTWdTcNpNGyK3
 ztPD7f4cxpQ9kZqivZwAAAA==
X-Change-ID: 20260324-mainline-update-imx95-00bdf6c54ba0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

This patch series adds support for missing interfaces on the Toradex 
SMARC i.MX95 SoM.

It adds:
- SER2 interface
- UART interface for Bluetooth
- WIFI_UART_EN as a gpio-hog to select the UART function by default,  
  as the MAYA-W260 UART signals are shared with the JTAG.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (3):
      arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
      arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
      arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN

 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 44 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
---
base-commit: efc6947b672d449d6b4560a55ad3589a6bee746c
change-id: 20260324-mainline-update-imx95-00bdf6c54ba0

Best regards,
-- 
Franz Schnyder <franz.schnyder@toradex.com>

