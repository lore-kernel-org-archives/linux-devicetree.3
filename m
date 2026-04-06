Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE873537D9
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461196; cv=none; b=R37vcyhHi8+r5DW4eHLYmnr0HloWXl6CJT4WeGdPXjKkIgByOuXIZNxrmvPLuVVO7urrir2D3126d+4HRH0QahliU2YwUiHIXJaqcBWlnC9LACC1ZGxCBqiKv4VYBSJUHwKilaIdWYMsCFOyf7393DN+QmH6Xe3/wibS2nGhC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461196; c=relaxed/simple;
	bh=xcfQ7/KvXVMirdcq7c98K6jioNdwwVEOkzE1auEGMZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=simdVJZoWHRzLDppQ1rg+HW/HoKlCtPFU0geKo6ROv/45Bqc0PrkvdN9gaYkFRgiAf3b+CJkC1xj9aoZ0tuDVbutjmp0+gAS2GtPst2qu7WAxYEJzZ8HQd68+Anf1VRWDmm3YBi9rylla9NUckAsCW94e79Vsm2w88yEeknWfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbkCuWBg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbkCuWBg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so23323015e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461193; x=1776065993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRVCqY8swwC0PUrYKMetJYUFRU1Yu0YEh2/EkBz/11A=;
        b=EbkCuWBgoDmtxlKllSeuSEeGfCeMbNrjwSsbW7yDbGcALQbPk0eTHLy66pbfvjKRnI
         l6U+LYF0CILlXghx7zzyp1NvSTyxqabR1SGQIgdBuYNgy1N5e9EI2JNGj/Mm0BhFBWx3
         MSo1cF9FpXjqoZxI0gdOKmbQOE5iWEfSj/SqXbXhRdfTD9sG34pJsqnnNqCkPUOaBK3Z
         0ICYk+vKK9s8iq1EPyWm5c22WvQgE4uF1jaNyanLiBfF6cbXxPpd5CiNyVn9PZrlqRsD
         aMaR2WAzILDEN+/t8XwXSpwkw12B8R0Upuj1zoHOGt2LlEnnjchzJSOIhc45TNrOgWuL
         D0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461193; x=1776065993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wRVCqY8swwC0PUrYKMetJYUFRU1Yu0YEh2/EkBz/11A=;
        b=QSzm58jrGCcsbBD6vn2qJmJf6ENimHMScfIIOxf5g5XipcLwPHKM19ldUPcatfd+HX
         elohpeAS4EqD7k2PifwZfAgs3piIbu15EuQpB9Sn37gF8L2/cH3oobtf2E6SYGFpPuP6
         KnFFMCYZqZbePw/LdJuLGkaqSC6NznsKF1vY7UB1kh+oPzAUYNu1Pm3aQDSfbRZFAFYl
         m5RL3PM5FAzlKfRGOBxxyu4Wi1Y+JWAyPFJ57m1RnQrrxrc+6UOvVR7xI5+y6DE6hNu5
         khap4IVCHwWTjB0gRktwyar+3Z9fy1t0tiW3zwcXPWTuVXSv6ekuNmscj5DtgfymUe9T
         lupg==
X-Forwarded-Encrypted: i=1; AJvYcCVijcXow44T+4hFjhg8Ns4O1RdLZXdevXj+HlAFQkGcrlJ3XFxumvqZ0NSH8LtTYxTGXpUeMQAc8zCC@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZgbYx+JwDpOVGfeaPnKls34nfLYWRMbFfWQ6ZwH759q9uuXS
	OEEiP5UZ1kW2ZytkvIqPKboqfp7lpq13sV+iqGsVTIHVmb8XQDqgZez0
X-Gm-Gg: AeBDiesu+EHVWDW2AZ4E8lKTxdtT4uMvNZ7VRmdRnjUxCufm2u36GrQQ3oZM5MgwctG
	dqWhS7+r9nOsGRG0zNSnUmGad9MCut4rVGicQ12Ax1mdvJGY5Q7nCFbt29/5pdT43ZEUH/f4SZN
	EfWUOXV+J3vrMjtCieB1d6nXYPcPNTYFschyqF9WZPYqVrXwgv6LbMyY3W73Kk+e7iuIM+w8gdo
	CnAlQsG9DTMysykmUIEOTWkcTiI6usqZggFkisz24En7sF55858B85AW88+w7N07iI6oxpA0hRf
	c0/XqjuAFwqCpGUU7Y7vsh0ZVvLbI9NjD7ndkyq5CXpsF2/KUKrBvYjFoIQ+GUknGNg+U1bSl3E
	ZAhK81lCf5jcH/drnfm95p89VFtcM2DlnSsfedwv0dGllevW5bmVz9DLGEnYMGKfHRB9hErz9Gz
	W+NEfjJGhjE8li
X-Received: by 2002:a05:600c:8907:b0:488:b5a3:fda1 with SMTP id 5b1f17b1804b1-488b5a3ffd8mr9815675e9.29.1775461192711;
        Mon, 06 Apr 2026 00:39:52 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm527201325e9.8.2026.04.06.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:39:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3 RESEND] dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS Transmitter
Date: Mon,  6 Apr 2026 10:39:27 +0300
Message-ID: <20260406073930.24662-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406073930.24662-1-clamor95@gmail.com>
References: <20260406073930.24662-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 7586d681bcc6..0363201f0e61 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - onnn,fin3385  # OnSemi FIN3385
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
-- 
2.51.0

