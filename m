Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB30378D92
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719295; cv=none; b=HNtpza6dTj8uMjNF4VKNWyCs+lPH9n+LfDAz8IZpC+MA7zkHTvFxV+r6TX/E3WpbK2PAwqqf053rerM+Imb0pr1B6/H52ywQ6upSPUr8T9WNalU304O5mYDzghrKW9tzTEYtlBo4Nd5MexUpRxzj0+YELy/3ppMg4sN39Oekf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719295; c=relaxed/simple;
	bh=m96OQJeZXwqMAZDwEFgVBfZj0hp9r4nYmWS+ag9wmZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eguFgG/tNpzQZ3UoItY652e3+SQcLGMWcUlUDAgqApJ1lTStySURlUj3Jx1f799gxoQk6bVnfF8NxcHsvFBV/JxpxNwkwvNZMCeZsk0j9nzJMXmUMtXuyileDcFwmdCduDGyA1Z3kVTwBtXxr3PBqoVdDoWkt5yKYMeiXhXd3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oASyPTQh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oASyPTQh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cec955160so469258b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719293; x=1776324093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
        b=oASyPTQhEAJlqirFHCIxCH68iVrRqXErSTLW4TXLQdrvrsbUKlqH7G9bYYWk3xqhMV
         tsUFJMf/5n1NZVlW7RJjBVGXNYX+Gms38LzoVa26c3HbHM4GNnbUP6H0aMl0YxXLv5VE
         DMU/snF8cQ3Qn5eaQWnaJr7xMDgqwjgG74IU2Zjl++wpXYdzZYo/eng0oxXurvd99uix
         4fjNfJ5mugOibE5xfKkV2Rnd7WEjjEIlIWcRoVYrlV2Xpn0wI4XhBHdgSVyWsTwTcssj
         A8z7BWE5IMXRV9LTgA9vfj9uueCII3Dqo8G+u50xWSRiluTe5ihjUXe5uhPOcKy/IVU0
         Hl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719293; x=1776324093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
        b=ITcN4L2mtjq9iGQ9jgRYBaCZKZ/wo/QfanGB5scFtCDSGH+b9DT69MbEvUDQeV+DCl
         tTCfS7jzFqzOz0SDsY5NnnaYYoGB9Ey+P5U0q5qis/NW1oerwutfSWB+SNrCtaQMmt1Y
         65KjqxdveMprhYWX4/LNZjrVND/Th40sjII4xyDloKtfDr35A7rjRN+RAjxWkp+vj4S3
         jKdZSZHQFyrZa4mTTK3Se/SRgQzzi499k2Sd1wwLBJNa5JfH+g1VCeBC4Y19rQZd0taa
         9CbNTp3p05prl7QlxiczxkLLRwGRUuz6uwBzslFSNYmCUZ0lsvNJ2jboztbOSb4UBzZq
         s1/A==
X-Forwarded-Encrypted: i=1; AJvYcCUYi73xP6Hcqi8FNnf/3MnTyab6iURkAudWNWalIThl9m/PXwbKM9OqPplmCHA5Dsj4lDW4UpvsYI9y@vger.kernel.org
X-Gm-Message-State: AOJu0YxITBZcu+54lK4WCcJMYCQYI3FnNSq1SXp3N6QLo2cNdtFrt0US
	VmKtmzr1lPrgddnVTy8qwbYCDR3hc2l7ymBBg5J/9u249lDZAIfL36wt
X-Gm-Gg: AeBDievlJkRzH8sj9vDDNzqSdHv5N4nG1yTkIWoz+Yqa3+aW7clFHc9N2kPu7p460uC
	fK2GQK1A0heSugrMXXWPGoQfEX/IbpoNmk0acuJsZ6WNesjh3fQm9QjTEWgJEBoMR6nQOP/MVT6
	H1KdsbZHqZuteSRMhBEbP4YDX+rsYsl7wyvMUo2z0E6gzKT5Bt7KU/fLWhOSU+LYJE770pcvP9E
	tJdk6fjkZnlsVveorLtVUwu8t/JsGA5QPhacj0lyLbGd+eNoV2ING2eG37Np9m4KHiDsCQVr/Tl
	l8czEkhN1B3v8e/A1y9BwqunRS8Fdx6Zxo9rozJRFr8FVjtHZq312eJYi4qZfEGD4z6OI6TwSIL
	UyNM2GAeyuEhcVG/ZDpauseb7AD+pjeno9Q4orbkdPmNovQSi079h0U2yIGluewfFWkNq0qGdA7
	fyK12trTOKFP4OvphxyXVN5FzZpt2LsyVSEGG06+cZw6FWPrUo4fIWLMe2MFWQu4DLsfLEag==
X-Received: by 2002:a05:6a00:3902:b0:7f1:4:66b with SMTP id d2e1a72fcca58-82dd8b0da28mr2490958b3a.44.1775719293311;
        Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 2/2] rtc: nct3018y: add optional control register initialization
Date: Thu,  9 Apr 2026 15:21:05 +0800
Message-Id: <65d40ded5afd87d0dbdcf98652a97e4ad244505c.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775717959.git.tomato1220@gmail.com>
References: <cover.1775717959.git.tomato1220@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the "nuvoton,ctrl-reg-val" Device Tree property to initialize
the RTC control register (0x0A) during the probe phase.

This provides flexibility for different platforms to override default
hardware settings.

Signed-off-by: David Wang <tomato1220@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cd4b1db902e9..4bc47b4ac935 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -534,6 +534,15 @@ static int nct3018y_probe(struct i2c_client *client)
 		}
 	}
 
+	if (!of_property_read_u32(client->dev.of_node, "nuvoton,ctrl-reg-val", &flags)) {
+
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, (u8)flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
+	}
+
 	flags = 0;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
 	if (err < 0) {
-- 
2.34.1

