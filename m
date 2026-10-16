Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709AD3BF68F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188993; cv=none; b=KVI/M0QPKKeq4CVE4Oy6S3VyuZQNQJJgtSnWJkv1gm599m4G6tciKJRrRp07gE2ns64apxQKFwYKJL9mfV+4DTO/vOAwEUJUVAufn+0L4MXoPqY1/7Rpptd4dCML7Xik7ycS7f+Xjbll4hV1aH9IyCoPfDiChyx/nL2gZEENcgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188993; c=relaxed/simple;
	bh=TXBqsVGg9cAtgaVHRhNDFyJ7mFNE3M7pp6dyhTAsDp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecambSaD10bUsMI0CTMR0QWwapakQRBWGLPMkpBXqXrhr9yVz10aGsQ2qseDcS5GlOkU1YJJdiXd3CVnCa+a5Tx2+1kL6RC7WKhd6eHW3WMd8VJHbGsk0fhAQnHeNUTRtYSYcbEhvQmx8qo3QVb3adl2nKmf0p3XWgpukdQoNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdpTr6tl; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdpTr6tl"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so395346eec.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188989; x=1792793789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RQWVgYSBP0OMtApng4YZ1gHWXM9hb7Ag3kJOb+CrpA=;
        b=CdpTr6tlGv6Dh3hjWO3vxHYfQjRfIFH/aG67epNUmoRlIpOAO5s3rrJQu2v/fjqZe8
         hDo2LvHALk4eLeTOAIdPzPgoMqXFNr1/upY+3Pl+Ql0Bilra+KS3ueCYJtAV6M3XUpFh
         HQnp65AjQ3kj/D8KYtrZU84CWbfTFnsPxMcdiIiLEADz0/BMnllKWJNLojQKKhvD8sXP
         cJaha7QcqNQalSNFY511Ce0AdJcG3BSMtOOQpIC5acZWCFE29AMokpoC4TtKZaJOdCVf
         KifKaDjYT5OGEUHrNK0V/N0xZ/WRg3zkN1DwzSApnmE1amkn7xWIW7G7spHm/JOQKtWO
         mNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188989; x=1792793789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RQWVgYSBP0OMtApng4YZ1gHWXM9hb7Ag3kJOb+CrpA=;
        b=Mu3NOSXjo/nQkKlrdaSEdXghaUpPg5GbbOYPF+dcYHZBT8ruYiGS81s6yRGQ7MfO19
         c2yzhO461rYkUx1bJBzbRbSY4qsS4wpzQkhNkM6RdOdXIaE8+5x3/3kxmIIuvGKkyXFD
         pPdqwAHyROq7wa0EXhNToExzlIXLjwyCEZK8WKN0KNXRJxysyE7YYy+ocTh1STc/6ebw
         gPKkHR4u/QywZceqmBmvKwMVzxI940er5Fn2/o86kPU5ZYkOlCFDVuDi2vFFPmbdkHEU
         Vl+kcHsOPLE8UVLGZF72G6Pp9zd26MtmE33vc0fWTx+4gPNpUqi5AenDo7fZ8V2vNTWP
         qVJw==
X-Forwarded-Encrypted: i=1; AKwUvBxOi1w9h/QD5Mve0v0fOE3UhPnRQYnUiMjXOQMPcy1DJNLW/21ornSW3r1V5PrTHxLScBJ2rryh7X8C@vger.kernel.org
X-Gm-Message-State: AFq9FYIy5Iz9d1pZTTnVHtwi5SWyt/Q1+oqUX9AfkjI5hzV2YrVTEsE/
	S7l12KYMZZ/KUjmaRK4Muwi/bqxdtDdciB4+iy3+K7RXxiUjpBhTfYqe
X-Gm-Gg: AYBFou0rwTbp5FmoQNlOyZPPK0aL07xR9MzxsqI5dK9cw4zb3NHlrN/9QA2hKpI7ghF
	oIGCkg+hORSVu8Wqy49f6k/en6VhZ0180xIpyfvUPSXyUfWFuAKq1ETcv4DLLw1S47GqSYx8qnH
	koqMb69VC6BwbRZn3PTek4lOmYrTyAiXLIEoI1UlI+Ln1A497Yb8A5APzFQjTMWBFRVFY+6UysX
	ziwkj5FNcFzu7O5Nb7366qkj62QQkVuXp0aX8xsF4iWdW8o/SpRklo14ZSdRrQOpAWkztZM+6aK
	WAThZsAU0xQ7I+7oSSP9PFv/xHq2okmKW1tMc6196JeS/vXfKChKChRtxrZZsLwgwW7I9gF7G/8
	fKC5FVYAOtXqLAmnyK0tIK6M+ziATlXCw+ZqNKV0sQuDSNxHVIYfPKVDeemtxik+sqc314eBoiA
	hr5qEw6CA8PZfHyXp/hHTqawUwNPNCOEURak29XUt7c77AYiG1eUrrnobn6Y0D9RjqGvsptq4=
X-Received: by 2002:a05:7022:f118:b0:146:85b9:970b with SMTP id a92af1059eb24-18514256f24mr1604037c88.39.1792188989457;
        Fri, 16 Oct 2026 15:16:29 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:28 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 4/5] MIPS: Alchemy: Use the GPIO watchdog driver on MTX-1
Date: Fri, 16 Oct 2026 15:16:16 -0700
Message-ID: <20261016221617.2223004-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MTX-1 watchdog is serviced by toggling GPIO 215. Describe its toggle
algorithm and 1.6-second minimum interval through the existing software
node properties, and register gpio-wdt instead of mtx1-wdt.

The nominal 100-second circuit reset the test board about 82 seconds after
starting an unclean-close test over the serial console. Allow for circuit
tolerance and console transmission time with a conservative 70-second
hardware service margin. Keep a 100-second initial userspace timeout and
let the core schedule keepalives for the longer userspace timeout.

Mark the watchdog always-running so the core services it before userspace
opens the device and after a clean stop, without trying to disable the
hardware by tristating the GPIO. Enable GPIO_WATCHDOG in the MTX-1
defconfig.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/alchemy/board-mtx1.c   | 8 +++++++-
 arch/mips/configs/mtx1_defconfig | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index 88c20c0ca96d..8543ae42af92 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -125,13 +125,19 @@ static void __init mtx1_keys_init(void)
 }
 
 static const struct property_entry mtx1_wdt_props[] = {
+	PROPERTY_ENTRY_STRING("hw_algo", "toggle"),
+	/* Allow for tolerance in the nominal 100-second timeout. */
+	PROPERTY_ENTRY_U32("hw_margin_ms", 70000),
+	PROPERTY_ENTRY_U32("hw-min-interval-ms", 1600),
+	PROPERTY_ENTRY_U32("timeout-sec", 100),
+	PROPERTY_ENTRY_BOOL("always-running"),
 	/* Global number 215 is offset 15 on Alchemy GPIO 2 */
 	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 15, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
 static const struct platform_device_info mtx1_wdt_info __initconst = {
-	.name = "mtx1-wdt",
+	.name = "gpio-wdt",
 	.id = 0,
 	.properties = mtx1_wdt_props,
 };
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index e28a0b1e6d52..5e060daded9d 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -377,7 +377,7 @@ CONFIG_SENSORS_W83627HF=m
 CONFIG_SENSORS_W83627EHF=m
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_NOWAYOUT=y
-CONFIG_WDT_MTX1=y
+CONFIG_GPIO_WATCHDOG=y
 # CONFIG_VGA_ARB is not set
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-- 
2.53.0

