Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468600;
	b=rCXUADapkv6IkFA16aQ6dxEkPKQMDjecdy7eiaQvNhcWyt0+er9Vngn4CBT9PA4c+ljW
	 RejLi0ighzS1eUZalB2aIbzPgEBRTg4TudsYezdkenmKQa+lyRhJlWOAiINdgG8N2hgEC
	 GLUzSGuO+DCEO5MZ0TEgVpmWFzZMa3gCAuLXWB6SQXWg/aJk2RwHyPaBe6Z7oaElS5Vk5
	 E5De7FLOkZLp/yBZ9X7AJ/FzGLUj01LL/qM6WP4R/xzhOph+G+KU2i09hktm9giChLpwR
	 N5dDOvP7ksnbykZamjo0tPDpHmhcmCoTlfUGpfAQMANXVUjfxMiUuQ7tCGW22rDvQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
	b=Qg7tFtUE+dBme6WaUjD3ALVVYW1iAoV4Q0wf7riUFdPeJdCH9XkMSDmaRWLgEmY8++lc
	 pUzLfqeQgSslxAZwYvOkm5+Ivlw/NUAUz/spyE7Bvdzt3NJSama0ziip23Mw02v/zx7Ct
	 mTqHtDK+VaY2qMh3zPMW1Tttn0DCVvcyT3t23Fx1r3MEP1rrNfOGa2PNiVQH4cBjoQKfI
	 8LNj148I1AUIjgzEQPi6THNrm7xR7e5EGQoHMkQd+lOtdUBIsmOfxXsUIt937Cwq+0G46
	 NbmP7ACp8kXieCGUkmuXP2eRHeitGWzumCvLgil3tm6sqDAsT64D5Qwxm0CgLlt5YVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfJ1j1S5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9B606A8A9
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC9B606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfJ1j1S5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32710685e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468599; x=1795073399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
        b=OfJ1j1S5+BgvVBAETT8hfBLxfRr4RV0PmCTZRMaJ2dAvq1oXrUGQlaZ5U58E71Ybjg
         93NfzP1c+pgdXugcq6Jwu4XhVvXb2ERf2rM+Z8n0R5NcHthV6W7902DzAniUaf9ukoAs
         7Kx/WTwkiHVtAwXqAkclbwtSUD7CeNvD1gMmlw5OvKplNi0LEghjqeVGSbV8F3Q4oFXy
         JFCX0yCZBz5TQaqgDXWQRvHsurCFjvrtSEZZFBN2i1btWoC1o5lz5J7+xdT13MNIiae4
         PXd1XYQbwkVkMYqbIpYKMacOodu/6SFbE25fSiK3kTp0ok54k/qcA6UDmeqwm5vJf4Kl
         KYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468599; x=1795073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
        b=b6Kxt7tP2Oay+btnQoV0P8myV90t4VQmbquAMgrqGSJ/7xKdOTUEQ/5lDlNgLHC+ZC
         dWew/B9JAT581P0qKADmsItCwAKcNYGUXP1bA2zs6pOmEcjyGaoYAln549L6BxnFCOIG
         eVWtKKlKU8UKqEXBvf6s00CxSP8S2cHComVlAgszMaZbT1a16w2xkCMjijeSJKk1pgzq
         TiA33YCYrZ7s3AGWtbYZKy99SPf8HghHjeiYiuKjuzM682ezOhwYWjEWqywOtW/IqbRa
         nsmt4TVEDRbYOtH2yf0+aC/3gj1REX7ZTXIBpDmH+oWu2FYo001D5o1b1CwI+ocIZtxd
         4d5A==
X-Forwarded-Encrypted: i=1; AL+hErEhmBdk09VzRbp+kewx+ruPBpf9yX/EL6PrCK09q07A49qr4YX3nUyfKQVU9ob8IIzCWQfEz74hSpCK@vger.kernel.org
X-Gm-Message-State: APuU4Z9MIXxf6jOKahOlTcZsH8003alaOz5QTGB8kTSx6jQJKHqpTPGY
	Q/ZKzHP29Qd+eVPLNJJF9XEh9QYb3P0ZTwLrnVU4zEIyaiRxBM3WLygH
X-Gm-Gg: AYBFou1Y3j6xwVCwjBK3UraZ4PpBXXs8qZyZkZxt5AvjwF3ClAgaWBOXKaacUCArnya
	0K90cdea/T3/RTffMN2YAHDvWDJYO8QcT51hvgrpHnB0nkyz5r4d3KTSW/OyettNLxMCZKIgT+Y
	NRaN3Pd0BhBU4Zw0ng4uDY6KkZN499KSNUzJQYndPogFdSCIL3qKIsiQru9WGmCpTyCyiinpLEe
	//NeyesSjo1o+wfqpwyzHxmz2BXppVY8wwrTYSnb0uoEwCr0QDsnO/pomc7JAlnMyWbs+FPcXIA
	UW5ktlaVSbpmM78W8UOWKWHC0J0omjwufrXT1jGb6SM6WIyrC5Ac/2gpJZ2CrUMExAAlXROliYB
	R6gqq5xW9/fmUF8aa/CmuPS7FWytsUNHHq0C2PfLYy4syIp6ZIp+0WGyqpkqsvJJpAhFDBRMGUZ
	YRwgJYWImCQMjS8tGJcGT0LSyMSWzMSbfH+0ckjTm3LmsJIdb2Sk1sLo0EbZMPTbgC8IMRsr+F2
	XhuGcJBXj9ajjBgxLxGGXD3iUz4N3+qIWck8J9u3WhSi1LWJHByWlOU/HHQhB28d3mNm9gZRmbL
	RnsRUPEx+vcLb7x09N2ekzkYHOvm0A7sYgE=
X-Received: by 2002:a05:600c:5251:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ba09392980mr80173815e9.17.1794468598725;
        Wed, 11 Nov 2026 23:29:58 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:56 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 12 Nov 2026 08:29:53 +0100
Message-Id: <20261112072953.989664-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
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

l2x0_of_init() looks the L2 cache node up by compatible and enables the
cache whatever its status property says, so a device tree cannot keep
the L2 cache off.

On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
CPU deadlocks against an L2C-310 line operation by physical address or a
Cache Sync on the other CPU, and the board hangs within seconds of WiFi
traffic.  Running with the L2 cache off avoids the deadlock, so a board
needs a way to say so.

Honour the status property, as the newer cache controller drivers
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c):
leave a disabled node alone.  The firmware is responsible for leaving
the cache disabled in that case; the kernel does not check.  No in-tree
L2 cache node is disabled, so nothing changes for existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.

Assisted-by: LLM
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..5d6a4c040a50 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1772,6 +1772,11 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		pr_info("L2C: disabled by the device tree\n");
+		return -ENODEV;
+	}
+
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
 
-- 
2.30.2

