Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FF51D509
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755820; cv=none; b=Vn41oYiIgJhBdmA7My8Cpj3hxsJz5Ujx30nuxxu+VQTgvXATRqAtrqTas66M2DWoFzoSq7yCE7EyDB2UUzAJUZ7/FFKfoeF9WiiYNY9Vp7jUF191CB0MO4Gtv8Xt9NLx+fUR2eKECoKpKAtxjWuwW2HSXwHA8oaXCLmx3JW8B54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755820; c=relaxed/simple;
	bh=WAJrSEZkQYTEDq9vyw5OAkxECQ/CYjweOnUO5CKaYkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDRxhBTbSfoB9gH9jQCrQCN11AVHGG14subXG2AL50JGvmr4/QyYwDbTjtwuAJrTaZF8t+4/Wpk265e5eMUfoeoFjVEogvAkVTOMMsxrNII7Ve3g8gYc0aTVisPo7aRblOR4ViJIxwOJzqvgkDqbyIaS3WNc7Hj7RKXKlxzZjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=j0iTv/ug; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="j0iTv/ug"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so7950115e9.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755817; x=1790360617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0tZDlqxie/qCNA8rlhQkqn4p9JhLuqDdva7s2f0qY0=;
        b=j0iTv/ugO+bZmAnCrRAs3Y5Q10OWOOc0wzKUp2TZ0+1QlWfOZZI0obAoMfphNVfPsA
         1jhMixnCcp6226zZvTjGJGPPm5wMgOcYe0cK9kwtJ0FMrRq4RUtXVkGrLHpk3pOqpGun
         EmXHXKNeypXpe2DEYeiys/EzonrFn3Y+l87XevDrB0Y8PGeJxfg2ABo4+v60YVnqfuf3
         7U4MOj9dcoLKTJScB7J2ePqGnSxaoIagSiE6aTFyJosR5H0atmq3PaXUlgJI8r3N9hy9
         VoxiP4aULepAd+lSsl6ydRf/O5HIm+y1R6tBmp2HnVeN/Cfv0U/We7sUzphRWpqjYh5/
         rk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755817; x=1790360617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0tZDlqxie/qCNA8rlhQkqn4p9JhLuqDdva7s2f0qY0=;
        b=hhMC+sRFQebC+N+3u5z/2rG/X8UwSUYheColcXZDr1Mqvzr82VeMsrmUlnR8ULDcLy
         O/FmLld2laXkZlVSwFhgX4309p725nb/sx+Kc1SaHUyO7INM0Pv+12zIIbvu1oOEigRu
         v168KnzAQqFc2A6t2vBFiz8xla/cD6yOE6d8s4LrlGAoqNkTiT2+HIv144k4pmd7b9Oc
         X/+vbypkheWBcNpO+cs7Mb9sukd2dMRtaZHBwybgotpYr4Z6kCHQXybqoHXTuD5vHfgQ
         PPEuoZqinCqefsZcl9NSuIGAzggkT47+gZyDkWL2UrXsPGf8e1Lb1yhIYsMokp0KwbDy
         oHwg==
X-Forwarded-Encrypted: i=1; AKwUvBzv7YIMR4VFXWonYzUkIEGALVM+8J90IxEEokmR63AuiLAQuNrkNoXp3p1C2iZhQ7EsD36NEYY3abkV@vger.kernel.org
X-Gm-Message-State: AFuF++kkLk+O611T90gjf+02u12+YyM0qr1reZCXQ5AFfBNk0hBBFiJW
	UnCSCEaGktMhZzvRe6A8DD8EJ13Xho1ugiOA7IpNW+eZSZwbOnMHrhvzopSce1ufOVA=
X-Gm-Gg: AYBFou29j2pHLJ8KTs/upJobIcSzhiu9nVBG+KiDkis+LGgOHdZty9DaSjzzrh+Exkk
	0ye/iv/4TnL/BrX28wQhSRcKf5Q7Q2mc9DwIAU9Fvw+N6b34UIOA13E9ekCbrsrk2iB3qHEXqXJ
	zuzBKwgHdxUuYuzWU9mC6lh9yO1F4qVf0KHnv+2qqiQaAzxCkqL8a9LyKoXWe4OWCiMMorb3I0D
	7ET1B2kXes1VpdhQQkuSwfF3snIPjFXsycWfXc8BvpQOTLJ9ubTLsEQMrcRAo7CeSWGom9zHBXP
	cw5zz9RkI+9uqLSpTAVsJ2zsr3nPpj4lAzuBbIViDIxyUkVobkrjO5iebMEQVx9HS13axlBmQ6B
	Mb/+5Ugeo5e1lI6MbaM2soR7791jmiQ3VBh+kwAquA6BCwBmz5+3H3pwxoCYVKrGTBfpGFBKb7q
	43yb2gbz7mpec/gh9Fde2e1WH2xfJd6/XOd45dbsAal/8c4vAvjMmgWCB+wNH9qn7pIltm53r4a
	v+5nr6zyB7qKQ==
X-Received: by 2002:a05:600c:4e16:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fc574a641mr39896255e9.33.1789755816874;
        Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 18 Sep 2026 21:23:14 +0300
Message-Id: <20260918182317.143223-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba200296937..ff4a85f4cbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -559,6 +559,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

