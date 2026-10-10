Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653274AD4B4
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637254; cv=none; b=dF2SOMx3Amr1gmLM8tPHbXZWcjdi5lrOsouSvRAhL2gxcaXDT5kbn/7N4Lbz117G0mY64hRB5IY8lRHLrngMkPLIWWa16BcXZFcoCjDiaZg7IqMTGmfcBpN5J3Eul88PtzbvEAIsOlYR9RVROhY/+P37psNlDY79iuxrxDO7g7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637254; c=relaxed/simple;
	bh=n4MOVXWt9K7Yi8srXBDxZvBAZQxMnbf2UfzQx6vMP3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXnRHpLm6XneqH8WQPqmCOZE2fTdTS3OP/HSj/wHpVHzim+EcDQYTPRiKt8q+hw4M/K0Ry4YmESOgkVUp/fRUnlATHtygfdA0/M3Za2gDUOy6MkyptQjS9h1WcXOwGTn4cOOiSf8piTLQgEjEkuWeXQfrvxptKXZPVf4OFil9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDCqUVe5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDCqUVe5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so5683325e9.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637250; x=1792242050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=;
        b=EDCqUVe5/zBt7coTrFcTYjfJSGvIyGC0oxRwritUTgY4F2Yz5ihkvl6Wocoi+cd2Vr
         LmNijsnUhEtXBJVXTQLbY2A7vnq1GYlBVmV8S6egnvJsD6zZOIxPnM/zex/rd7XsqWrD
         3sm7yIiSskiCxDUGkJgNEPY3QsaydCWpl54Svg3zCqpV3+BC0oNX+ypUEKn1DYQO1rDA
         xclwkuaDn9eZhx+iihjhGNGmLgO0+nyEB90Ya2ZkVsZcxE8iiPexZKbrTC280TNzt1Af
         xW+V6rLGG240MuDQaw4KqIPhNUVmTi30bOEzNDl8Q9Oje9x/SALwM/IPA9gDfFuoED8x
         scaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637250; x=1792242050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=;
        b=c6LrcvQzutY7X1/EWxQIGxnVC49nBVNA1luCSlSLVpkOcNepWoN3cgAm9l5U1guFgE
         YPC3oSbRTmQ9XWobuMEWk6F3crZ0e5k9T6QS8CaZ+iCOglzZ4v5y+NINldH3OJmN3gDn
         gI5Q1noXJ3v9oMuIPcfR8i95Qv+/8pOeqnhbgiCeKDlWRKD89pYc6zd6OQ6n6rI/xilT
         xrLbIX9PJOApRIV2ippbNHGQAljr17u0RsIrX4xBYXRpxvKB80qlhLq5nDKvqjUqujg5
         nZMN7JCmPS87mEEGKTPJp9mQQRspIMu84jmt0AEk62mJpH/FSNhQQappfFnQV417v805
         Rktg==
X-Gm-Message-State: AFq9FYLCu+ElbZhimxKc8yxAbnw1qu+MfQ1A9+jA/W7mC0Ou67EnJKNk
	D9jDcmxAqMLTAsHCLz+7RrS4wMKyWuvd7tYiSCgCgefjPCkKnNbWj2rl
X-Gm-Gg: AYBFou2ZT1gVzP1Iz1/ABnAsPZQ49V5HQmg5CIR5FKDuxkfCaXSY/zgmCIB8XaoHLDu
	7xyJAu17/WBqm2R3pOQdMvSj7A6icCKPxivEtGo4IM+Y0PbfoJd2FkJtRIOjd49rDrytgQsbfse
	h64QY+ApLYRRofih8Cod8UglnxaIsEL19D1TuZroyfEUULlsK2aLO0GAZnfMUOromiemrTF/mSL
	FKRfB6Izo/Ngd/2zHMnfU+S8+5C4ZAkipo7wgkEnYE2qaZKRUZ11b1vpFnAWicNeIgxrUpQB9mA
	zNHnF2p1/1aonvmZnaLEjBWOSrdIdZTo2SY0W9EPNLYxGGjSzcoVnMUOba7wqpuAoI//UocqDqH
	lD04mLQn7hIYndD3uQd6lxKW48Pg5vxPiSohFdLc81qnjZHV7HY8+AtSl8TIFfkjU4X0mN3EdO9
	9jXKQt4DgpNBmyoWtnuu3AqJw0nUg3sd8wLNNzPIoy27SDTvIG2xhUWOPz13aXSKXKsTJoVJM4T
	wsSIak/5h6p/8OxY9JDkQnOxMuUOUjKSqx1N3GFXkdb0BPITqKtrksavKghAvaMcgY675+PP1y8
	qd6Y8zjLpDmQ/c+O+hM+8UqIyVvScf2Jw4JJDJeoKtHxkqGhx1cQMHIyOE9vYw==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr108686395e9.10.1791637250411;
        Sat, 10 Oct 2026 06:00:50 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:49 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Sat, 10 Oct 2026 14:00:00 +0100
Message-ID: <20261010130024.177503-23-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the generic DWC3 platform integration to enable clocks and release
resets.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/usb/dwc3/Kconfig             | 2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a4..dd0f6d25dd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -207,7 +207,7 @@ config USB_DWC3_GENERIC_PLAT
 	default USB_DWC3
 	help
 	  Support USB3 functionality in simple SoC integrations.
-	  Currently supports SpacemiT DWC USB3. Platforms using
+	  Currently supports SpacemiT and ZTE zx279128s DWC USB3. Platforms using
 	  dwc3-of-simple can easily switch to dwc3-generic by flattening
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb0..aa838cf067 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "zte,zx279128s-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.55.0

