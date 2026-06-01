Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7A2E0901
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355759; cv=none; b=AEMFyUwJ8yloM62IJ8Hgyyj6lGQei6P98obTVGnqmu0dUYyK5Fv0Ufekem5muGVBKaVdLTd/QY4KiFR+CmlGCZbUHXJbENezQms+PpxiJVTm/KIQqyDymid7ZKItzY1c1l3pnAbhfKjLp+wvkgVzSECS6hKp5mVTXj8qWUIcTmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355759; c=relaxed/simple;
	bh=uzHEC8gmAxO8h2736QEykyhvl3Sb4cDm5wxPO1UPc5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBxHB9cjm5SD5ipxSwXkA+qAL03KQOt+p7a3ZPDE/pITGSTNH1wOwHNSp4WW1D9HF2DGj2GjQTboq4FBSEHocPDU3VpuKmglf5eEumGXVC0chySTbdNWKAKU6/CJkuU+0pAg9v4WeBO4hzre5JRmr/G8OzXhq0KX8ccL4iEfvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMVleSNg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMVleSNg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c3315c5dso19242905ad.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 16:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355757; x=1780960557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEGOFfHWeLdHXhuCkKkw3VwMtN/iTVupSierNalI6tY=;
        b=RMVleSNg7SysWCVkIwV15Cs9NIe155+C6D0hH2rdk286QD0CYLMowHSAFHOMPmTvn6
         RjDPw2pDBBNKZ2FiSX2jVxnnCyFZlkHZxf6NJzwrQ+RHQyY8P7nj0d4T3oc/ePfKCo26
         BZaC/9b0G7ErUrx4IHolcs513omlBQJ4exBbxyBYZD+rC64UmZTsDvPpBUjnJ+5I97b5
         QgDA1/pjqb3zJWUZM7ZoMAs5qJdC9IlnBBGphTczAQ6mumBRlJo+FdHPk9lf+GLYXhkf
         3S3KcdJ48E5gWZp5T6ky2J2Hqdb9SiFLTjBuoEoC05cxislC0GjnRLD2KiiJcd6YgS3T
         dgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355757; x=1780960557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vEGOFfHWeLdHXhuCkKkw3VwMtN/iTVupSierNalI6tY=;
        b=h7ajnu0NENiw+JUFbpIfO9QIDenhAgQwnGchcnKfyYbXod6jssebwr1FS33arKR67E
         waCvVl2K2SBzdLWhglz43MGy2SoxsBaQNqJ+T9AX3Lojkmi8n4d4kAwmlxPmIzt8I2cZ
         lGIxUAvjF0lrU8HrWGP/P/EvlmeM8BEdM9BPy3QemQRzBdoFMhT/6577fV1znH9p/KpK
         gS+pB31rq65gUXE8DSWULP0GzHyZf0IoLghKyESaxLCuDD5vTlkgEJOXj0TM3KUfcaid
         5ONRDUpbLDZMdjhYA5DO/IGeJPzCJ2Vo+I/3MgJ0XfoC8tT/EkJcgdcrlSIxoFRsCdQx
         7EFg==
X-Forwarded-Encrypted: i=1; AFNElJ99q33SQbNuf10S59zMaxX2nhZ9Zq8HZoFwv02AL6N2jMUQt4lOGQabsS6H1cPioPZuG2N6jCYyQ9gO@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDaHDP0xiB6eqZGMSaFqWOlYKW96Zugrttrg+KxtOl+kQf5mN
	zfa91k+EPyX06B+EpsbQsxkZpQ5hZ4LfXS8OlUz0Enpltfdn7LkYKBIj
X-Gm-Gg: Acq92OH8iTy3uvTgsrntmwInKI3qz0kY06GR3eOn92ZdSjPrYAER+qqDkzN3WjRNL7K
	7oECpD4okmGN3m1RAdDT2jyzZerpAN1Tt3zz6y5ejnqUuP5Li2oZ/B9vdftU+EKozxTvu2JASHL
	WAUvP++DhfgfXyv50Hpc4XSiSX4WK/4cpJlNTj+wsWRtTJKPN0cT2u00fUUg24SbMvAuOhSP5Zu
	k4TDxY26m05h5w3oQa+XSJefnRU1ye0jLYg3cOPpY95dR+3nzxw36pTK0nd7ATY7LhkuYTxjNos
	VUvPJUYLQsJlxJ77mA0BGCeVpR+AdrO12Ui0KtkAUiLmTdY17P2E2jhS0niQ0uWeBUki3Cum7lB
	MUWA6/yWwrIV55qtn2OiBQXWQN5cmCS0YinCJX02KkP85FWA7GEM02mvo3R/PATpw9vk65ZlZAq
	UPyizt0HUyRKqr3TpJKnYrqgSw2VMiW+1sv9O+cPhVe9yINKOSNfflEOhP8gf/0WorHyUA1/GYV
	KeE6JbBZVvyJxyQ0IoJ
X-Received: by 2002:a17:902:cec4:b0:2c0:bb2d:a321 with SMTP id d9443c01a7336-2c0bb2db260mr104962495ad.37.1780355757465;
        Mon, 01 Jun 2026 16:15:57 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:57 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: dwc3: add reinit-phy-on-resume quirk
Date: Tue,  2 Jun 2026 11:12:35 +1200
Message-ID: <20260601231236.20402-3-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some platforms gate the USB2 PHY power domain during deep sleep
(S3) even when device_may_wakeup is set, which causes the PHY
register state to be lost. The DWC3 fast resume path (taken when
device_may_wakeup is true) relies on phy_pm_runtime_get_sync() to
restore the PHY, but this is a no-op for PHY drivers that do not
implement runtime PM (e.g. the Qualcomm eUSB2 driver).

Add a new boolean quirk 'snps,reinit-phy-on-resume' that, when set,
forces a full phy_exit() + phy_init() cycle on each USB2 PHY during
the host-mode fast resume path. This ensures the PHY registers are
properly re-programmed after power loss.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 drivers/usb/dwc3/core.c | 25 +++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..82baaab0d1d1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1854,6 +1854,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
+	dwc->reinit_phy_on_resume = device_property_read_bool(dev,
+				"snps,reinit-phy-on-resume");
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
@@ -2561,6 +2563,29 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 		}
 
+		/*
+		 * Some platforms gate USB2 PHY power during deep sleep even
+		 * when device_may_wakeup is true, causing register state to be
+		 * lost.  Re-initialize the PHY to ensure clean signalling.
+		 */
+		if (dwc->reinit_phy_on_resume && !PMSG_IS_AUTO(msg)) {
+			for (i = 0; i < dwc->num_usb2_ports; i++) {
+				int ret;
+
+				ret = phy_exit(dwc->usb2_generic_phy[i]);
+				if (ret)
+					dev_warn_ratelimited(dwc->dev,
+						"failed to exit usb2 phy %d: %d\n",
+						i, ret);
+
+				ret = phy_init(dwc->usb2_generic_phy[i]);
+				if (ret)
+					dev_warn_ratelimited(dwc->dev,
+						"failed to init usb2 phy %d: %d\n",
+						i, ret);
+			}
+		}
+
 		for (i = 0; i < dwc->num_usb2_ports; i++)
 			phy_pm_runtime_get_sync(dwc->usb2_generic_phy[i]);
 		for (i = 0; i < dwc->num_usb3_ports; i++)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..f64cf709e194 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1403,6 +1403,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		reinit_phy_on_resume:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
 	unsigned		wakeup_configured:1;
-- 
2.53.0

