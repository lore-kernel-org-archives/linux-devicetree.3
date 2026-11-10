Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294420;
	b=ZEf9A5DIA5qfKQgzCWwTp7jcHoQ3PmP08c2rHtg1keTAg8WuBQYusyJyzpgk3q5ueqtL
	 meI88nzIjFxMH/GKzYD2da8XQ3x9wAvY3Ip8fUGSc+mS0n80WYxrXOTVO5lrWbh+DBkLl
	 gfAr74L7Z0w2MCoYdQBumYDxszHynvUoEi4sD+WpyVWjT5XDOAk5pO8qWBoIK11y6ZgKO
	 RKUXNyVY87/hEM7nkpUKfbY+Tu5MnStwcN696pbx5pK7CUsfsVX7gm57u5Ug7ELR1HSfw
	 V+ekZp+SBs9pl7n3hER/xSM2vfzjd3zsNJ2N7kq/Ah0fYIFK2FkwZiB2DCCSFjHl5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
	b=vqSoXrX18mBgWsmXr8kJOiXXiARRHnioKMdiNhh8S/3Ohq/WL75CHw6hMY8FWBDXEm6n
	 v21uFLQrWouOb45/zaZYXx39zYHjxcVfOco9JzdTol9ey+/B6a5qgYhpRrRZfStLkvpXO
	 M5BCjd0jTWBwOrm4d3v3XhuIR1z/MDTdjO7IDbhgiw1cfvcectI7P58BISb+ODOnX1rbq
	 8Czm67BKiQ+0sx2yBrP+5JCXeYlc6/qmxHotPa9Mrm3mGuvBvXOCCyND45MyJEq7f5eET
	 njlR92vrbXXLXNPhRAS9z6s+5+olrMK0YqW9WO4VIe3qE6VgdfnxGJi/0JEStctQxIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJkEfN4Q;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6913606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6913606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJkEfN4Q
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1018787b3a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294419; x=1794899219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
        b=qJkEfN4Q820p4M1zXid3KgjNmsMp1HP++144FYcsmDcycGxltdAnH0SJLsY56XhXiO
         Dy2uI7hxhIR3ljnMKl5konxUyAZmun+7f9XfgU3n8vNqGtYQnz6HC0MJJvJdZBd16MOw
         w0GXCpDkS0PiChU/Ye46DXGpNx7asK3doPPLxJ2hkxGn9aF9HU6tB1sIex4LkjPhFFcM
         ERBeANXXrcxDAlHHc+Ls0n9hu6KPEsY3XrP5p+Ea5V4guDuHDQS/qlSAoaaX0iA0owvn
         GqeFhoedLp4V26pLYkm89xsDC0esKaluYrrRQAS0Ep8f9cphPGPAuT1j5l0rlRXrvUMy
         wIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294419; x=1794899219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
        b=wK4oCvTWNirKKAizUGEE8Eq1ArSSLjNcuBufCAo7rgXaNm+22YdTkQpv4wdV32hsgS
         JqCQs2+s5EzksYIpXsMXfXWlStXXMd1c1cRPv0YVS430FW1oJXlFfNgVDz7VGSwxwM0r
         tDtrvenWskmtGAsfjO04ZCu02MP5c/HzxtmSfVqxYjdLlnvHoVehYkVCcNNuUOGoaZnc
         EDC7/748Kdk09w3lDIzubuXbab/chMIc1sq7yytnjwg6lVVUZPuzi1AUMiTVKU6CjtVP
         UW4T4Li73T7Y8qBcC31ZhMqhIcQUIHiPN2jrthRUPcr+AFl8WDpac3lRWQygsltt3aUM
         dZWg==
X-Gm-Message-State: APuU4Z+QNoQGihbQnhs0hB5LaOsQ3SJY+9aX1BqypPfEgRLtuDPsrNp4
	qib5b2bHPbpgxKGwvmAdkjnWNkU7ZzJWLwmaXhfbLiHXAQcUEvudqxTe
X-Gm-Gg: AYBFou0g1BV3nSXGm62dbDqrCpbQ/9fcmZSIp/+1uPr0Vr3imCn0JKV7++pWa8vPqpy
	5J83FTpA7Nb61Zt1t/CuXSI+oIHsFtyXYQzMK2xUbF4mhbDn6c2nRrZV+OrH2Mhv/YQcEcuKrEQ
	3oEKTTqixE2229fI+BvEdo/sG7QXgB0CeVc9lFrR4kCQq9HJA7L0PChrnDw90Ev4Gx8aztf/nsD
	MO9sOWMmFjmaZ0ZOmnSPUt36v7XJZlKZLBMiFarvzDOR/ptsKKlE4IYNAW9vivJYGJ2n7/uuWwS
	muMArlfmyaDQVvcQdGIn3GkhT4rSJ2KcwL0cc+dm1Uo86IlCObYT1SVUEgl4j7Nej1Ydln1uCjA
	snwXJBsflnJIA5P2GlLb5SPevPdLkTAxCl8qVGV0Zk9CtKla/LaZIaDwR2tRSkLtzyJ1SDkU1pv
	JHJ3OLJhsFTdcAwnz31vERjNzH5cuzRRPeYN8tYkE37cViOy2zkaf74rtfUinuCZ/tmz/BpK++s
	KuzQOZKkqfvbxEugsPBsAV4A1kfBwm7OsQRTujHQsNApKYer7qmFXXvYrMD7Gv00W2a29VhWT8p
	yAyaAAmOjSNzyl35H4RITpzAfSY=
X-Received: by 2002:a05:6a00:a85:b0:8b6:12fd:7285 with SMTP id d2e1a72fcca58-8ba83bd70ddmr2045184b3a.2.1794294419027;
        Mon, 09 Nov 2026 23:06:59 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dffb5sm498961b3a.55.2026.11.09.23.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:58 -0800 (PST)
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
Subject: [PATCH 3/4] usb: dwc2: Add USB DRD support on CV1800 series SoC
Date: Tue, 10 Nov 2026 15:06:24 +0800
Message-ID: <20261110070627.217946-4-inochiama@gmail.com>
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

On CV1800 series SoC, it has a problem that it enters the role switch
with a persistent Session End Detected interrupt. As a result, GOTGINT
bit 2 remains set after write-one-to-clear accesses and prevents a
normal boot.

Keeping the BVALID override asserted in host mode avoids the observed
interrupt storm while allowing host enumeration and device operation.
As the BVALOVAL field is device only in the datasheet, this change is
added as a quirk.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h   |  3 +++
 drivers/usb/dwc2/drd.c    | 29 +++++++++++++++++++++--------
 drivers/usb/dwc2/params.c |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 298b418e6859..52ac64f67f41 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -357,6 +357,8 @@ enum dwc2_ep0_state {
  *                      case.
  *                      0 - No (default)
  *                      1 - Yes
+ * @force_bvalid_in_host: Set the BVALID override value to 1 in host mode to
+ *                       avoid persistent Session End Detected interrupts.
  * @power_down:         Specifies whether the controller support power_down.
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
@@ -460,6 +462,7 @@ struct dwc2_core_params {
 	bool reload_ctl;
 	bool uframe_sched;
 	bool external_id_pin_ctl;
+	bool force_bvalid_in_host;
 
 	int power_down;
 #define DWC2_POWER_DOWN_PARAM_NONE		0
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad3804cbc80..4f7441a87c85 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -28,10 +28,13 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	gotgctl = dwc2_readl(hsotg, GOTGCTL);
 	dwc2_ovr_gotgctl(gotgctl);
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
-	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
+	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+	} else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL) {
 		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
@@ -45,18 +48,26 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if A-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_ASESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_host_mode(hsotg) && (gotgctl & GOTGCTL_BVALOVAL) &&
+	       (gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
 		return -EALREADY;
 
 	/* Always enable overrides to handle the resume case */
 	dwc2_ovr_gotgctl(gotgctl);
 
-	gotgctl &= ~GOTGCTL_BVALOVAL;
-	if (valid)
+	if (valid) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else
-		gotgctl &= ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+		else
+			gotgctl &= ~GOTGCTL_BVALOVAL;
+	} else {
+		gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL |
+			     GOTGCTL_VBVALOVAL);
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	return 0;
@@ -67,7 +78,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if B-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_BSESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_BSESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_device_mode(hsotg) && !(gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
 		return -EALREADY;
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..16db9c3c1991 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -222,6 +222,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
+	p->force_bvalid_in_host = true;
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
-- 
2.56.0

