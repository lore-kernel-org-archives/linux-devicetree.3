Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294416;
	b=PoujxGmASRaUf3Sw0m/ghgN1335XdZ7jKRNIUR8nIq4HKJXP2u6GoOXhHBhH6tklAb6g
	 oNhgK0PwHNulV9TDwaQy26X/XbL/KhYt9EVgyTYBWmnRr6rOdgCfSZA6GWoBJKNWRf4yM
	 +ryuGF91jYHbxS8C3EyJdGAAjIxv+nmUnSNeybzR80FITsEZinO4bO8t0060Lo8enFg+u
	 /LnpbCd3tCq74+2r5Msc72Ax+TYKC0haZEVd9VxogIh7qfHX4laDeTTU6hN3nyX2ia5Pc
	 F7aY35QhwxxCq7ZV0tlmRPHlsYmRxYJy5ks0NuA+lLOoq6Fcta7i59iXt2zNkfMtcRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
	b=XDveK6cb3hMnwuI/FyN7xCLyMr5cohGp19PXI55fTlIMHCWS2VYWQywkEYf3S7a7j7Vd
	 I2k6m9+gGwrVzdyTc9WanfV4BZh6phGMylFy579L5wSUVbYqFRzLA1npIKYEJiMFSew+f
	 mC+0WL6swMITuUp7AwqQbzxWbbljKzNXh1IApHsrde/P/yUcBwgK9mxrIcdOhgYSRF4Ku
	 GJ0WuaGIFUrSjeojmVIYhLA4DKCuuxazf6PBoIcWqGwzJZzV2MFM6zozb/+Pj80F0wSRR
	 +QetnEysbnWkUGClEg8bvrm2KtcaHl+GpiYbnwAwXQ/BYG1lGW3mX4lF19t4epyQ1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HUFbWsOo;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D07606A337
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D07606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HUFbWsOo
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1016471a12.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294415; x=1794899215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
        b=HUFbWsOoBiq6NXRLuu3wRodYsgyh4ZBLi0BfoFsRrWxBxkO/VE8uq+dK789V3DWOcj
         ZdDqevOfVWonZ079zfUUBNdLVHnWAYw0IJSaJZRBV+KcICSpljXFNNu4kxrPYeQhZROm
         bHXIdNwoF4POr5U1aQQ6NuDt4VENm3L4rQaMN5ZTh8NsSpQ2dxu0niwKxwRyRCM9X1az
         +vPue60i6fHU0IFHVhF+do8U8A8nwGU785k/I5LWXzchFSGmSTBUoF/FvoSrYOK1zmOr
         tT2jn1d5MzOY+lyC3c+/KtHRqtqjvHyf9u6+Z6UBwumECEN/iLIfzq+nUBdEb52gpDqK
         kCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294415; x=1794899215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
        b=M/okCMogF+NtZOA4yF+psIcpLei2ajPVFQSvFk2LSIkhFBKtWW8Y2hBEGtvyck1QeE
         aTB57F7uvD2zoVgbnobn/TUMa0h2QNDzd5H6N4EwgqFWlQfkoMgVzMagZDW2WLxhpEsU
         Y7LRhME9kEdFysXgtPO8WgNf9gELGmiOsuHcw0+n17kpGosWP9RHldTVX1gkXpdUWlr6
         9OBeqsdKPyFlVZck/FtJMxli5vthqSgkjy6x2KqFaQGpfRTunVJ6NnAJ+olT2Jq/Cn2M
         OWgbqMzDjm8uM94dGa+4KdmnayNM/3TNHSNIQ4KltgvswUyuJ5daVPhdY/DovHMXSLyc
         2k8A==
X-Gm-Message-State: APuU4Z9IKuzounAavXynAih0dwFmreiwJpIyCCGszjfWzhO4rWX3wN1K
	csBsPhLa80sg7rFOhCSSBJ7Ca1+veNyT0i1V7FdmxfLpn4eIdZk7LnL/
X-Gm-Gg: AYBFou15fnt3vRKEppYZjcpTn0eY2LLwzlOIuqaaJdTGisOSkTqtAM6slu+AWVNcriF
	leQGJd9X3SOPXjZpAul3XDyq27pCEJdV/S9it3Qbz5lGJKRfz3aBUOUfLuy5hWk6Vfat3VhhsXv
	kGbI4ldhQAmdKJmn51D4eEStQLy4GG1OMUtD9wChV9GRwmM5eNpk0cSZ8VAUCuns8m/8ddcH6en
	hKwifggKwVKbbE6gJ67xLf/a03aPquPBTbT+9TmXF63bQP5fIMC55ebNxFZYcpP7l89vDy2uVVG
	tz+aRqJ5RLzere3ac8xeYNimtqmMkVR4BpybD+Ldz45lzjfnT/Vi4DN/6E7pFF6w2FbgZyCnlv4
	5cJqIFMGe+bGjiZ9quSj6fyGnp5QiO7Vb8tf/nUCDylmeNj7xXUDzZl18hoC13nT7cNai6L9Jkb
	9P2IDYJp06yfT0dQrh3LSglsBHdsZTBwEojHjjXeKw2QnTwV9amD2UiuuA3ZljkgCGtUmptmcS+
	tvkPAahlOWPZhcJzpmtFTjNy/oHaZVVtKAHfgIH1aTxgwsyp0c8cqU7U0dto7KDRoZU3cgiW5mF
	lrMZGHy50oi3VggYq7DFHQqFGaY=
X-Received: by 2002:a17:90b:5101:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b166c817c9mr2153597a91.13.1794294415185;
        Mon, 09 Nov 2026 23:06:55 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm2551932a91.14.2026.11.09.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:54 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 2/4] usb: dwc2: drd: Sync the generic PHY mode with role requests
Date: Tue, 10 Nov 2026 15:06:23 +0800
Message-ID: <20261110070627.217946-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB DRD does not reply on a OTG phy, which means the controller
should not reply on the switch behavior from PHY. Instead, it should
sync the phy state to avoid a brolen role.

Set the generic PHY mode after resolving the default role and before
updating the controller. And disable the controller clock if there
is a failure and it is disabled.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h     |  2 +-
 drivers/usb/dwc2/drd.c      | 48 ++++++++++++++++++++++++++++++-------
 drivers/usb/dwc2/platform.c |  4 +++-
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb7842d..298b418e6859 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1400,7 +1400,7 @@ static inline int dwc2_is_device_mode(struct dwc2_hsotg *hsotg)
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg);
 void dwc2_drd_suspend(struct dwc2_hsotg *hsotg);
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg);
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg);
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg);
 
 /*
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad8fa3f862a..1ad3804cbc80 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
 #include "core.h"
@@ -88,6 +89,7 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
 	unsigned long flags;
 	int already = 0;
+	int ret = 0;
 
 	/* Skip session not in line with dr_mode */
 	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
@@ -111,14 +113,11 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	 * mode and sessions. It is the case if cable is plugged at boot.
 	 */
 	if (!hsotg->ll_hw_enabled && hsotg->clk) {
-		int ret = clk_prepare_enable(hsotg->clk);
-
+		ret = clk_prepare_enable(hsotg->clk);
 		if (ret)
 			return ret;
 	}
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-
 	if (role == USB_ROLE_NONE) {
 		/* default operation mode when usb role is USB_ROLE_NONE */
 		if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
@@ -127,6 +126,15 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 			role = USB_ROLE_DEVICE;
 	}
 
+	if (role == USB_ROLE_HOST || role == USB_ROLE_DEVICE) {
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			goto out_clk;
+	}
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+
 	if ((IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) ||
 	     IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)) &&
 	     dwc2_is_device_mode(hsotg) &&
@@ -160,26 +168,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 		/* This will raise a Connector ID Status Change Interrupt */
 		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
 
-	if (!hsotg->ll_hw_enabled && hsotg->clk)
-		clk_disable_unprepare(hsotg->clk);
-
 	dev_dbg(hsotg->dev, "%s-session valid\n",
 		role == USB_ROLE_NONE ? "No" :
 		role == USB_ROLE_HOST ? "A" : "B");
 
-	return 0;
+out_clk:
+	if (!hsotg->ll_hw_enabled && hsotg->clk)
+		clk_disable_unprepare(hsotg->clk);
+
+	return ret;
 }
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg)
 {
 	struct usb_role_switch_desc role_sw_desc = {0};
 	struct usb_role_switch *role_sw;
+	bool is_host;
 	int ret;
 
 	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
 		return 0;
 
 	hsotg->role_sw_default_mode = usb_get_role_switch_default_mode(hsotg->dev);
+
+	if (hsotg->role_sw_default_mode != USB_DR_MODE_UNKNOWN)
+		is_host = hsotg->dr_mode == USB_DR_MODE_HOST;
+	else
+		is_host = hsotg->role_sw_default_mode == USB_DR_MODE_HOST;
+
+	ret = phy_set_mode(hsotg->phy,
+			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+	if (ret)
+		return dev_err_probe(hsotg->dev, ret,
+				     "failed to set default PHY mode\n");
+
 	role_sw_desc.driver_data = hsotg;
 	role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
 	role_sw_desc.set = dwc2_drd_role_sw_set;
@@ -214,10 +236,11 @@ void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
 	}
 }
 
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts, gintmsk;
 	enum usb_role role;
+	int ret;
 
 	if (hsotg->role_sw) {
 		/* get last known role (as the get ops isn't implemented by this driver) */
@@ -230,6 +253,11 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 				role = USB_ROLE_DEVICE;
 		}
 
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			return ret;
+
 		/* restore last role that may have been lost */
 		if (role == USB_ROLE_HOST)
 			dwc2_ovr_avalid(hsotg, true);
@@ -250,6 +278,8 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 		gintmsk |= GINTSTS_CONIDSTSCHNG;
 		dwc2_writel(hsotg, gintmsk, GINTMSK);
 	}
+
+	return 0;
 }
 
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg)
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..ab39d6b36b19 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -783,7 +783,9 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 		/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
 		dwc2_force_dr_mode(dwc2);
 	} else {
-		dwc2_drd_resume(dwc2);
+		ret = dwc2_drd_resume(dwc2);
+		if (ret)
+			return ret;
 	}
 
 	if (dwc2_is_device_mode(dwc2))
-- 
2.56.0

