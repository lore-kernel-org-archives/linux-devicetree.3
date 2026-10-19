Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436494;
	b=zCcVoBlHhRlghs9UTJPPmYVbEP3IPCSjNDNZNEC2hBVBmdDgSAtDLpZBO1l9qaqfAxNC
	 PnIznaV8V0apk6x9PisT/9bXVCiw9GPYB8FxV791DlwAyjeg+7WZ+8MrGqQGqDimuruu0
	 dQpuwuuq9D3jyzbSPjzmLSqwU4o1/p821kzEG05lBSZqNlGgX94esnN2Njppale2ooUIm
	 R4uljReISOpyvYiamndoXMs/ZgRnF/6zdS9hb47MkasE3UB4+mp17Ntt3O6a5UZbmefvF
	 5jnOdg9cpyXA9fkxQPTNqmMI4EODaw1VWt0EcrwKXdHse9UfxiB5A/SsWshzEUjT28w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
	b=IrxhmCocNnjYGjox0atzb2hBnMC4g3XM0lfuyPUcywY9+9qEy7c7JujXLSPULPISMkwa
	 wMFUNgY+usrMlH+AnN1DmIMmkQLHqWIucfyuCFc1uPBhwsL2g5v4TkZqTQtIyejmj0Wrq
	 45Wl7bUxohANgiLyFlpW8lZ0QTTlzoAdjZA4+gUAeEQPXCBI3IBUsgnaRnK9wi9gBwfBA
	 nDkmWZiPyaZz/Rd63hy4C+vzWdCEUQ5IniGaTw/Jc+FSAspOtAZhHz29+2QdoPUdJhqr4
	 MG/RUleSx+qCWn95GPzYqGiuL19wtPUU3ZaOloDkSPLzaeoUPnODUd33JThkHs3L7Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQq+KE8x;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69162606A33A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 19:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69162606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQq+KE8x
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e96502e447so17798405ad.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436493; x=1793041293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
        b=BQq+KE8xOXbY/uqMBJRUuuiRWixMIYgasL2Q6oCe08KuYbbGLBcRh24ixnfWFYSdS+
         dCiH4G1K7vTp7FQiasyc/3m9GP5veIG+hi/bMw6XJT9kgi/wSJmKm372tZ0JKJdfCLaH
         7FoNQeI1qbJzVaYfIhpmC+tqgs9LZRyoUr7go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436493; x=1793041293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
        b=dURQmORQ9YGY+ZmIz3yIo/VEZKPJnvL505uxIQBbPfloT8Wt9nTB4DWRe6ROjkSFo7
         e6t0rGw2BmJL9IeanZZ+LDlHS4WNAizs1lkXA0XO7AfgM1RoleX7wTi0nftfJFa0VeK3
         Q+osywDgmOkBCH28Lz4K44G6Tj1kjYkCwxd0GImJS1RbdkoLYv6n/wKz/PdG2UnLC2Pp
         mlrIHw0GpoMZN/yq1ODnAP80AhaxyPz4mHLMMNodFslbyQhofPn4+7Yo7I2arbs5ANJW
         Jkfu2nT+DrtmQQiKMJcGmRBS6Yfdb1Q3BXhpzNdKeUFxGHpWZpm0C/iLQUeMjHAs2LBb
         Adfg==
X-Forwarded-Encrypted: i=1; AKwUvBzOmz6Ob434HAbIrIYpR2JAvkO3r3PPGWlkdZLKNBagjh05x0aYAaX++rusOgCeOjGfKRR89rdGilHy@vger.kernel.org
X-Gm-Message-State: AFq9FYKY51MYRBOq3/nckaB1u9nZJdXQYCztGXIURLf7cwkV7xigZQD/
	rPfoI+ApwvxYH9+WYtkCS2jl4PIK3TNZtUHiicoCSO/O/s1d7TRaJ9drhoCho0BHIQ==
X-Gm-Gg: AYBFou29gbqxI7dVarm1Y/SWJnBUGzxllbck6C5mjhpUoyhN9s4pHvJWM8dRZnEesiH
	zmNCDwr0lIvwD+BHAd6mE1J2lii21X94MwQlwkD/p0Sf0uGQScWIttJiImjjpKerRaoGZIJ1gwv
	t6z6lHP1xte5qka7GUhCScZ+GNIMzOdIj/glrtFMnir/u9DkXBVRxnyRd5G+/MzzrOgXuTWJIUt
	YwC2DaezAtD9CwCTL61vRQbTWlVZxhoU3EsiHDniaoaNbNyXxVkQOX5GNipf0FNTYygPpKfymAl
	UfWEGA290bPSha5DUsOWez3/bD5noyZrs2peZ2oRZnUg15Ie9aIYDmV61j+WEnhZAIdFii94M76
	5K9Xe5TsPEvQM6j2pDwk1kscrThC79UfQNBNkbO4h2WA3bTvgbpjWgsiQ6ECozAXFUe2rCtcYjh
	IU+2IZxV+BvIsBgNqh3/hrsm53p7EUuyjbj1wwo3ppPSxrFN13GgNAPJG/0eQvVap54QI6UgrcQ
	jFLb7tixSkS94TxcUueTlY9ymY3S0hX704KK809HlMnbKxfg4G5v+7XwwD5wRQqUGjRoSxN3kri
	XairuQ==
X-Received: by 2002:a17:903:283:b0:2df:90d4:1193 with SMTP id d9443c01a7336-2e9a704f530mr82162035ad.45.1792436491907;
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:14 +0000
Subject: [PATCH v6 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-send-upstream-v6-2-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=Z/2OynYTrncR3whlCD+8cLrRCycyd9G1cnZSFD18TV4=;
 b=lJc8V8Nqjo1jioaiCACjgd6Onu1pi3IF5K3H7O9O0Ysv6de+/D34pDGq9QMvDw8mebB528I80
 2kaE6ZZjzlGBGFbwmdNzil47p34PVsQJh7RrChGNGuNtij++kwe8mZX
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/hid-core.c | 3 +++
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cd..1b9dbb7515ad 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2373,6 +2373,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_SDW:
 		bus = "SOUNDWIRE";
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..45f713fe9982 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -821,6 +821,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)

-- 
2.56.0.212.g129ede20d9-goog

