Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C7429CEE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007489; cv=none; b=RJSWCV7rHyzPeyghK31wlRqrvnvgASyg4EEgC6ieIVb9rirOY8bYyIhqs3dZXowvqO9p5uZQ49LmIqd/i5A6lyEP2M0rpcAVTZlWP5BG8KAMJcKee9pgG9O6gMo5dFKldJEnLzvVTC18GNFD13iAMUYkzqQrH8+D0V67oDuucFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007489; c=relaxed/simple;
	bh=qhFs8Q7mC3tbcvi1oRlOfNyL/rnoiRGN1ibGqXacaxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZD2H6e6yr4lsykTueqOwdhbHgpChZ/nJDqVecqdg5Hcn32eKGQNQX4ubDrisutwxaOnXblF1m/fNC3Z7cTryKxTfQPyeF0LWEoE1+/PHk56k5KRW/e0Y0U/w0r1BvqZKGXsho0DIzGXjejCSZA6TyKN1SowgnrGejKx+CsOT/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=e6TulK3U; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="e6TulK3U"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1239785f8f.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1786007481; x=1786612281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hu1semPENZkZU2NkQkIvTPohOaxpIZrEskSIx1/HGTc=;
        b=e6TulK3UiKaWBJZEigHO42wojPGRRu6J4TEIuX6LU7IpHUKVm3QnuJDOvKROkqIK/d
         k1Wt+U5c4EVqzS4r4nH5wNcwVpY6CGInM9VQc6Dezv068MNpZlXEyzodYDizaQtOnNs8
         sHL9zOvNJQSagKxfm0ZQAeGhf1bWtAVGLksXyKTpyMoZ42lrIO2jwJ3IKDOeuHoh83Nq
         0uDuWmGt3zxj765NXykIMOV+fxS6GmDKWu4QGK97sPdxXPr1oVMWoFeCKJjBmbHAXo6r
         9xJ1V8dW5Joz98bnA0rGhtp9ql5V8+HDCpWc+gVuMljpr190ofsbgJQ80xo5/w2TEfF1
         IVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007481; x=1786612281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hu1semPENZkZU2NkQkIvTPohOaxpIZrEskSIx1/HGTc=;
        b=Qzb0OmhE8BvaYU16F4mPv20/56fkyK7nj1YqO5FDnvk+E2UXwpTK2zlhZS47EcbTxy
         9FrWhVNjw6k4X7Iy7a5AdqeEN9nqH+irMDod71hwf/sj8qZ0/dMDxqXds77MBeIGlifl
         YgVEmUhagguAemiTzgFPL8OtqxrNqIm3dM5l90usQpSjmylHtRsuUp1MsXaKdIsd3nrd
         IYc2HVlr+0VHZbmLaAgZGV+JojvmWT0BmalIK522lUWwZWQtIhGIGqPOp5EBm2h4LNfl
         9/hUccQlmQDRUUDUgdQhYeQpLdq+ToVkqzaoV920SpLhl8IcZdDsMeRRw2M4xD8wuWho
         FZHg==
X-Forwarded-Encrypted: i=1; AHgh+RqX1zRzNLgHNnMdedntQq6Mu0uVbRq5wajgtvY1uotZBzPUAi7mGQjJizSw2usTWdpO1mfeXaHo2Kcf@vger.kernel.org
X-Gm-Message-State: AOJu0YyCdrCb2a9I3GWH+7suGgrO8KJNDSCEhiNoTr2JNq4kgsUkdc8x
	pSfPEkxoI6YHcAj46cVFmbzWIqeaBQfWMIsPCcWBKOsn0jb2kV/DEDGS53KskCgzsN8=
X-Gm-Gg: AR+sD122gI4DcgjatSntrgyK777QYARyR3a9IgB77uhr6q5/PFHxo5Y1BIkRjhBQhfq
	nhKh0Iyf1kuzZFrNvcFimrM+VqSpPw8bl2E5Z2aeSydnVl/pYYApW6JCSx+7WJLV/TTD3ni2DyG
	XAYZwdTcx636U61BBkFzlWHHLy77xtj8tFMPt5zGzg5sjFRC31X8iZDoyR3DSlvAooUbucXaS/F
	g2NQcYKFNHh0uL52bwGFjONOonxHGc9tEwtUb/09kTdb/VdsBKQeWcPgl7apoBncnBtqQG/Q7ZJ
	nlTgkytXPdo/vyWgMcq9ia26X6d5CtP2HFpEtpDg5Yp728i6xZngPujH8E/AkG08zt83bKc2be3
	Npanjvsa0HXjo4REJH1uVz/k6HRXm9knAXLPtfSJ9cBZuul42FRnA6/2Gicwrp3yUE4jwFs5UwD
	EQflXkzEtxrTzHwpWOJErDoYvAAuLhYgrad1pUVuxD8bLWmfXUn/dVi9yewH603CcTFyoOVGZgi
	ToeCSEH8cY0BqyyLgOias97e/E3
X-Received: by 2002:a5d:6f0a:0:b0:47f:8a1c:54d8 with SMTP id ffacd0b85a97d-47fec502df3mr19472963f8f.3.1786007481459;
        Thu, 06 Aug 2026 02:11:21 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b31975sm4035213f8f.33.2026.08.06.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:11:21 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 0/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Thu,  6 Aug 2026 11:11:10 +0200
Message-ID: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds a device tree setting to the PIPE3 PHY for
the reference clock selection of the ACSPCIe clock buffer stage.

The clock buffer can operate in either RX mode (clock pins are input,
recover the clock from the bus) or in TX mode (generate the reference
clock for the bus).

This was tested on a board using a phyCORE-AM57x SoM.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

---
Changes in v2:
 - Add ti vendor prefix to property name
 - Reorder patch set to add the device tree documentation first
 - Add a property description to the device tree schema
 - Add an example to the device tree documentation
 - Make the property exclusive to the PCIe PHY in the device tree schema

---

David Oberhollenzer (2):
  dt-bindings: phy: ti,phy-usb3: Add aspcie reference clock setting
  phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode

 .../devicetree/bindings/phy/ti,phy-usb3.yaml  | 39 +++++++++++++++++++
 drivers/phy/ti/phy-ti-pipe3.c                 | 27 +++++++++++++
 2 files changed, 66 insertions(+)

-- 
2.55.0

