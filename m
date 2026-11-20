Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202489;
	b=LB2ag938tZ8qEEG+jfap68QoZl1xdRmDfXtlKUTUoiWZhuhEd6ZBigGicHGiJzZigNJV
	 WEuyTlmC0jwXcPA0276H5iVZx9MAVbu3pi1u8k+7V5jxWR8cuEdkDp/weC0fPsDVZm7DQ
	 sV+HbVI/zxEzayukcedlADBgtvYkQ14obU0kpnnuV7m0NYmNhqOl9KoNDc3Aglrn5G/mj
	 3MgG94UynmNKX+DKQd+aa4rceA3i0MrXCYnR390hA4oQUdE1ilcUTWetKB0JNZuzxWCh1
	 oCGss7Yvsjv/UAYkYBHpwXmFdTEd505nmkjYaJZvtADr6QJgBVuH2YB04Sif6D1cpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
	b=OJ27NWbafymYGF00SChhUw1UDEIIxYb6EUhn+WRwc77XrU6oEGq0DtoZv/5wWDbTRBZI
	 ESExGvsBt3gZE7tu+iC+U7aQSdpKQfpnyBwsxaptiNz1LLL51eQl54yliKRdkPG1+j7In
	 3Vh4m2HQYWR7zIJaZdJYfUmsL6KMZ8p1P2r4tXk2LVpBADPgQS9w5X+RvSknVxrh/y5fE
	 D6FKpeybizIG5jUsahZ5SdQOEsh0LWQEn5AW19aG6XltiHhldyMoGwnps8iZKcCO0jqvh
	 qa2yTigSx7XrJP/mveG4wnjU+CDAGpZISor70LiFid0oqDKmL8KpiJVSWM4jdCbWbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T4tOW19Y;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F6606A6F7
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E9F6606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T4tOW19Y
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso894264f8f.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202478; x=1795807278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
        b=T4tOW19YElmKFmop88otDRY1CZI7u/lkEIa3fMEFjJzWQzTGjqw17kwgJIVQmp+EF9
         izrrQM2EPFvaHM79PkUa5NLr+JSNnW3RcK03ZaSbJRrpW0H2+TYImcr+D8tqbkyRbtFg
         L4YgpZ87M/hvaSDxvM5ed4s3VVOt20i9CD1t7kl4GK2nB/uVqdiMNCH0vPXFti4o2Z+b
         4xvZgit33WpJ7mjUQq9QmMfEFIYyYKZX89q2qaEAdRcoN7LcMci+E1Jlgd3vWQ7zHqCq
         vWf/3uhvsKaT7z+wxaVFalLkGVlL5e8Yu0GXNq9vIZWakTd+ZbeD6iOp1Rgc/l/y46pv
         YfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202478; x=1795807278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
        b=BwKSNCT9brLdjISO+vFo4jlm/cQqlYRiz5ueUIpVKYEpjP/6imowGtTqeUA7kjNQzO
         cNcz1UmXJtEAp0QZp5+d1Ef8XlIWRDRgR6oHOXWmF2mJzRKORidiJaiTzvzRP6T5O1jC
         f1T2R4NMJakFVd7WZduw/9PQHHjq52+o0KWOoGSYEtJqB0VE03DwBZvZnCZuTvbuSAQV
         OilPt97ogW5hBH+dAV3AOfXZo8gSIBrJthznFJd3Yz+4fFBraQfj0lhuHu9h4AgHYiQQ
         8iR7giJFK61teU01/O01w8q8Kecmz7udpUQrPlnkJm7ZaVWK4zyzL++MgDUVr/d+f+gb
         wvsw==
X-Gm-Message-State: APuU4Z/ziLHpTpqAUg1dQCnuoqIV0onTmfGVgr63n70ayZpnOk4H7xHk
	wH329/vxG0OlK/7GzP25HL/rxYCriw0k/1uJSZGhpIIpIn/G/NnAlPdd
X-Gm-Gg: AZFdTZdI5UBvdinDs4ggYsFeq1Djs6qUrCfRnWTSscvGpS5jMa2U48yDHrCiOx5CdyU
	dFzX8ROTsJXzxJMZ3McMesCxLupc9N5Nl8pzl9BcpSWmHf2iEVlxhyVxgTvnES8ovzRx/1FanJf
	T/ApWLcSy0xNPrqQM/sKL6+9tRu7i8QTm6sBXM6hSn27z7x2JVTy5XQWlp7OSDzCrszK5JsmF4X
	0W9akeTCSZ7CB78ASbX13SMRhsx5Zza3Ne3Y2FLUB4G0dAzYoImFKjD+hLIA+k4iuK64wdaJcyT
	yUlvtQO70uuMm0L/i36Zd9Vd7o8jMwzuBVyCXsBQKx/m9/RoHGpkoTDEl9RWfEz5+wlYFuGMQ6u
	3qucSS+Tc4mv2+5H3UqZrVzMatfzQWblwQ0A+JXvTmgeHuKtBoWtGp6TLLGeIOhq5bS2JbfqCMe
	QYzPC+oXlxL4ZFYZbtqjNkx6n9WZAUGkL/61eIDTOgBmZIbdl9bD0H/Jfd8aZLaBeVEwk+Ivnz2
	kflgjQHWDnaS2n8vz01zzNFk0QRcB+wrFPFAfbou2R11cOVDkAqlEtjfhk21UqbzrUOA4RUIwgs
	QgqPZ36Jv3t2u0VvWlk9GEEJ9ihyjYs6VfvfuMOOFn9CvvWP7tGaxy5x6IH/7Q==
X-Received: by 2002:adf:e014:0:20b0:4a4:ee9f:a3d9 with SMTP id ffacd0b85a97d-4abb3d2c028mr6479804f8f.16.1795202477805;
        Fri, 20 Nov 2026 11:21:17 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:16 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:51 +0300
Subject: [PATCH 2/6] mfd: zx297520v3: Add socsys to the mfd host driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-2-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=haBO5T9O8DxAeLkHhQl6vHvSOM2ApNjiaO+2we2t8aM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2WR3OKSSthkwM8w2YGowPMIiV8WT0ADPYEg
 gyX3RTbznaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJkcA/8CdzFthVu8Y5p4obuulOSnPPIeLQWVnC
 UpCUT/7T/s39YYU9rQ4pkMeAqBP7ctNWI21AIp9weT6VcqwQYN5x4QtRqXyFUSYTWQh1UnuZzO/
 uGObg2YzD/iK1GSAHk+30Ia3CYmsHJ7m9KuqJ9V6Mt7NNwSiaUTUKbFnk3FVauzrAYWxtpPnzyD
 d1zZ6BANKQVtMIQZQitU5JruOEKaTAqI1iKobUI8TnrqBXgFVzPxvF1Ik5skRlkWGkcYmxp7lhT
 U4nsJy9P/R0FT1hkJdo4AGdrDTkMjHKOh28vHZTGjwwlAePl7Zbt5PzvmiVIIrsBKDAVvbtx9+x
 veAk1nCXL8il4O1ssjB8MBk3Y47cNzVLeV/eZAYSHXacsk2RGACAL4QciW9wPRMS2g9KPy7p/gR
 83CGrOjaPU2i1O+GQq7VhXn9WXWTreWgQGYpPus75EeoBmZJfbtkQw46XMHxMB/0tpuAp3Gwujh
 5d+56Qd4I6w+xqBvuQAJHBCOlGbKKilro5h9H+P+lcy/DvSCQBcqpsm+V+c249lxUykPTWYbMRc
 SGVEQv0O/w42BhSCtahVA2SwKuD7dzvxDl8DL2+OeVCJt8sRgY2To86kbvtoabvrprLodxo8L+0
 ZLJqtiSbQRMUSLLn3do8j1mpqqou+WNLFwjlh/1DQcrHo23Mh454=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This patch adds the parts of the zx297520v3 socsys controller, that can
be exposed via established driver APIs to the MFD host driver, so that
drivers in the respective subsystems can consume them. For now these are
a reset controller for Ethernet and maybe more, and a power domain
controller for USB, GSM and possibly a cryptographic engine.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

This series does not contain a driver for the reset child, as
implementing Ethernet is beyond the scope of the series and needs other
prerequisites (namely pincontrol).
---
 drivers/mfd/zte-zx297520v3-crm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
index 7c29a860be3f..3d542e3dd7b8 100644
--- a/drivers/mfd/zte-zx297520v3-crm.c
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -23,6 +23,7 @@ enum zx_device_type {
 	TYPE_TOPCRM,
 	TYPE_MATRIXCRM,
 	TYPE_LSPCRM,
+	TYPE_SOCSYS,
 };
 
 static const struct mfd_cell zx297520v3_topcrm_cells[] = {
@@ -42,6 +43,11 @@ static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
 	MFD_CELL_NAME("zx297520v3-lspreset"),
 };
 
+static const struct mfd_cell zx297520v3_socsys_cells[] = {
+	MFD_CELL_NAME("zx297520v3-socsys-reset"),
+	MFD_CELL_NAME("zx297520v3-socsys-power"),
+};
+
 static int zx297520v3_crm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -77,6 +83,11 @@ static int zx297520v3_crm_probe(struct platform_device *pdev)
 					     "Failed to deassert reset control\n");
 		break;
 
+	case TYPE_SOCSYS:
+		cells = zx297520v3_socsys_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_socsys_cells);
+		break;
+
 	default:
 		return -ENODEV;
 	}
@@ -88,6 +99,7 @@ static const struct of_device_id of_match_zx297520v3_crm[] = {
 	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
 	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
 	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
+	{ .compatible = "zte,zx297520v3-socsys", .data = (void *)TYPE_SOCSYS },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);

-- 
2.56.1

