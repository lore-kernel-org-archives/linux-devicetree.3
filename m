Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225EF396572
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799799; cv=none; b=K9KrGUuCjAd/T9lZZ8QF7kuN/L8+2sNEj8/y1zBUTOid6pBZo98p5xlSSsz+xzD/DcSz9mTBsMebRuDoghKs6IXMoU0o71Z6pdehVxlzE3hGuiIBaLBX1ua8wZwjMaeriiOZ4ajZmeqhAqKrn2f3ZOYj40vnpOGORWoe/vd2Usc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799799; c=relaxed/simple;
	bh=GdBr63/reP3Wl9EB+qPXsBbASaozd7eVeU8Brd8bmQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kepd3zs+AaUJHmt0AVeGdogh8i6S3QiqNclCH2Ru4gkhAITKL4CVC6bkaoB8kKMcj9OFsIELz3pJgq4lQYdDqs4lbeq2mSkBk+JcAlrWofWrsE4cumeGL56SM1k44oBBqul+DPHOnOkGEujVRzubCvKMZ1pEG1QwQwi3ldOlK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q23PGFPP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q23PGFPP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso19550405e9.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799784; x=1792404584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=q23PGFPPozSr/KCXj3cm7fVXgqLqwXIcadbZmO20DR6tcdwCKBrYEv4U+PvELrr0cW
         5dScVZWjrmZv+DQabTlbLfA2RdRHwJIl+PE/kckGH6P9lJ84Gkq2ORKF8f/e8/3/Xdi5
         lsdStmU17MS5yk3XEtnb8OeQ6Ek5pt8FNsfMnqgZip9YrexwXivi5qsD6HP0uzTm1HcW
         lxtXgeqXAu30yO47GJXDNqafYSPjNEoe0ADRd2HGrbQUlSPA9sAkwxv3Zw/2aKEPBpRc
         2xTGtdL4DJO3CAAoP3lMBbcuGbBLM8aYZ1x+XQK/B659GvhZvsEM+42x2QuvRT7HtTAo
         PLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799784; x=1792404584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=TzhleR2qXCKYEpXLYqZAigI/WaAGsrSXJ5xlvGtRC+TIpUZit+qFXJsyrVZlut/ugV
         yK5qbJVaRxckVUzGbWkTuwmHeqSf6JbOL0KDHvsE6kLbzFwQ87agMcDHFbgkODJ4C8QY
         vHpn23N/3U4f10dNBz52NgWIpv4MlG++Wdcr1KVWRbwe7dFI3g5kX0dzkUVJQ4Z11oNj
         yt+eGp0s3jF6kbKSfZIRwopdxST9uYktHYg0W8IdL9wJlhTwe3OT/Zb1EcsEEtqnfv61
         8TXQ2ZBYLuQfhesjqVZzJqXdXmkwkXDDoY9jb5PkO+EdQ4gzFfoP6qoN+eaNfQz3C4gD
         IPwA==
X-Forwarded-Encrypted: i=1; AKwUvByKkymrGCe2xBgPM9bnqjH/pHugJ8LSLU61Hn23WQLJxAxAVnAgBoMMeHnwnADpJ4G3J+gVDV3imsRA@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6i8ezTPTFw5UEYht8tot8SxCEn+e0c3jyB+L5aObQKouh5u/a
	h+kCcJLkehDmXWFYRwg9q9cVp1Hmfmg30vtx+8osiEeY7NkLATj6FY8r
X-Gm-Gg: AYBFou0N2rv8018wV45PwPvB+ZIbVsdNg/SWiwWLO+cfpGQqopvWXkFLNnk6O7o/IDO
	0x3IkoEz5kQ09SyKbL6Z+FA1orndHPeEU+1eWvGMFF2IicRp2URUBbeKY/5NKmHcRNWWFpCgh2U
	Hfg8NpfHeNtY4C+a7yjgYtGgzhu5OWnJMBwJpkHIH9LgshQBsAyYrBTjNOtzjUVjtvKMbNUt4Ya
	DR9WJAyxD9QLXQPiSQfH+WX/EUdKYzd+W6Zdkmj1WOYaINiUBL97/npweVSCwOrouv6+8l8Er4g
	yQMFyAxNhhsyF+AKUXYNXwmrWtVLMONnrkIU2bhWXfuASE1lNC51XxeA/gmF8Yem84Vg9cOGNND
	2Xd5/2G65w+duuNbK3p3MVk81/JtDizYdf36hpueDFKJS9cOShnym04VGwcLdUqyAAz5tlk853P
	/fGIrh3bK+Lv29Y7sJutTZZqcYMMnqivb/JA2RTSEog3/34e2qgFpqRGN8Lbeah/VBIxUJfZ44s
	HdrtdKjsn5yRANvT6aB1EBqVPMeuw+6
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr160592305e9.17.1791799783597;
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:14 +0100
Message-ID: <20261012100816.331033-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0

