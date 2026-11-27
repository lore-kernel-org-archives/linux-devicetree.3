Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761442;
	b=0qN0XJZIse/BganHLSOUVbt7mo6VFGfD4CWXE+FbcwP4gbKGxBwHibLm+bjFHBeJSD9J
	 x+VDk4HoMeXcUq58gbT9dD+H9lTCkkG3j3Lakqr2RK/wnRWynaznOo1qC/GRgt00HmkBN
	 z/3TcebWjCX9vf6kmKyPBj4cfQPaeFSE9xuKG+1t0pY5ENvmUpLIttGHAzs19EKtDXEgA
	 NV8QdnYt0+Vokgy9fXwiejncA9mqNE0m8ak6S3tG+N8DsXssovgZNjbgxEcnWpmG5/Z4D
	 g/4hDSupjShrWKWXuDW/76niCtDIKLOabYtU9bVPG7/tAb2KbG5GfkMtVg8v+Kr0mMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=Nap0X/yluo8/+Gi/NJebUHW9zyJPUAZb0dYdYlLeF97UWL/maSjmhqxj+jMTUzk3/OqP
	 6ZgDgPW8Emb3peQL7PR0qUZh9B0wRvKXh/gb4+9FJZJzUd7C87A0c92BIj5+qd6oOyfEy
	 J15QomNR2sNsfCjH5HkyfZhOSpGAjogfPNpisJ9H1AHV/xcrxd5LlfkbANN77vRYf4FTo
	 XNEZHJH4p+UL333mtNRETMHVvZ/NyniZHOR+wnCej5DqQMA5WN0Q2X3D6JKw95ioSkKX0
	 1GDUijcBNCsnlbfEAdt3uxkzBbELspYmQWRm4TtdSfYz/2KAGj0EEvjwP/RY7XkeLAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucztA/QJ";
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31991606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31991606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucztA/QJ
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so58397851fa.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761440; x=1796366240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=ucztA/QJ143mwCYe3kf7A2RaycBZd2xoYXbvWqsW5cbri3/pQzV93kPcHYN9CCaW2l
         bnnQmXcGSWufUwLRWXIDFAM+WQkX6R5SuJomY1IMK3SQbYT/XVX/VcTCtiqRpPM4oVSR
         3r0Ax1FV8YKaxt+rwSQo8jYYBpMRb28Zt6Pz6uutC8KtVETt3fvPjcGdJVuf/uyWZRQV
         ML19RqqoRhgfjNVj+xSLTceTW5eOy3/VT5jUSlptVfHdtOdaZKYBdBV68si5wd8ViWCd
         iyM0U9S3MHMfjBoSum/p2e3pKQpX8IAChJUayLm/CwfyRn4+qsNlxaOdvUVImhb07gmI
         c32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761440; x=1796366240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=fwEoV5F9VnugUL2aX6GY14gjWlSBozNNoFV32ZTOz1dj7e15EI+CRdZrJOvwZbBK7G
         c3T8TKdNZ1uWIlQjEAsFtgtUkITDFMI/Agy6GXrrmONGmK9jwtSKeySBkcbujrGuon5Z
         nTPfwx6u5MC302Xrpte9OEkimvzkLz7ORVaGyNjccj4y5soZB3x3rVj3UkGRK9EJlPs9
         Nk2NYHTnqGCkZjXLKjjum9QiL9hCLWcuyF/UKLH+c8te7w7N3ClcbkLd+XHUVZBWM8t1
         jbdZPaG8NMOAQAxhxwkKnM5qcua4mzFnJGGaWQWB+vFIZRxwVn7DdqIKdnIJRfkygN3c
         mLUQ==
X-Forwarded-Encrypted: i=1; AL+hErEonGjae7BceqGpYpkI5me3qzMGTssTP8mUzsJaWqRG1KwWhQx3Go/QlcnDisMmmaswfaChbQI5wPMY@vger.kernel.org
X-Gm-Message-State: APuU4Z9R1lz7nWG9PsL+4ZfiZD4yWfxCz63JxtFIbEpt5YNlQ+KhLeEn
	WwKPQGtsC6gZpRvOUaBeDhtg4fVEs4S/yAm0FYcMcYIDhg1eD7yg3LW3
X-Gm-Gg: AZFdTZcZwpWCxNiCkTn1isIORmP1Yr9l28zGU5F8oZimHrtj95EkeAyXLI2xd90/uio
	fY5ewaRFlLwKavXpta1YoCzKKXeOEay58czARquMa/8fMCw5KnzkU3EycWiyjOJBcVKDfRCRiH7
	4c3WciMtShUAfGXM0WOkRLhp7lxmUUsnJkghc3wLhE0X6Lxt5PJrsY8oLpSsQXFEXi2Kk9QbUYU
	07r6OQGBLHru751HZhsX1gEQqqhVazSf2A4XSoezFWZGJ+jqp3tPHPKnspEK0w5Vx50GTMptAYC
	hW3YWP9yshDUk791wrM5KCR4JnWXg96SwTGt5SWUcq8PQtRUSz/oy1OhpaiHs+QBtX77svPH3B7
	lCivDIO21BppmdnIPqU1azcsUwe0IKKa2/NPBFRt/DpPR4Fw/60+vQOskpv2LhAUxYRhqzq1znF
	9E/e3Nc8rgBvZmseI1P64hil3FozhuG5FvUzdON7hdy0isXacFIc4HkMJa1PaLHXwIvZVzn/sXW
	x7CufI3e91nLwrxcxrzwswAmcOYmz8cYwR6OPX8m2Cf4l28+n3i7Zx7spffKZ4QAxtOK/2lUlRT
	+Cp2wquI8JYyzyirHbZZJ0CE5cdPvQ==
X-Received: by 2002:a05:6512:2249:b0:5bf:cea4:b26a with SMTP id 2adb3069b0e04-5c1bc86048dmr6197622e87.48.1795761439922;
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v7 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 27 Nov 2026 09:37:03 +0300
Message-ID: <20261127063708.3074433-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

