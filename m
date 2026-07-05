Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083BE366045
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238325; cv=none; b=ttL7lqTH3ol1h3IOo4LuD8ClhwsGCOSSA5PZT78Uso5fVk/DV3/7tjm4gNOe5WlyTefzFTecABwO5NQuuyhJ0Brq6Fj9X/ypJrpvrnAmlNX9Y1iaCnAgpzf8Pyoj9SkxrYJNNgfyhCFopBn+oJNsn+Cc7vVmVP/qPQn8Q28zHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238325; c=relaxed/simple;
	bh=k1rvSiyDPCpk0SDwFUE32ypMUm2i7I+6V8cUG5dyG3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RuzLk2AYRqjZ7ynbai4OsQn7QevFItEZn+UKDiWEoj0tjaeq5N57XedNHmyA9cU1XghmO3CFU+6ZzGkptCRgSnDo/mb5URxPzLzwIiWLh8bnfGdEkrE27L0acuSdv0RqrXqQe0kh6y8+jkULQzXX3gui0UiFUOieKLI8ueaQcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuVB5TV8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuVB5TV8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so12069715e9.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 00:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238322; x=1783843122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii5elS5NgLsQv2qqwGxrcHkoRbkINQLFmPJvl9kn5Xg=;
        b=LuVB5TV8fVpFw5WFm+ZdxERq8bLRePrlkjCOJ07Sg1y45dbOhoUJEA43uaAyYgQgMg
         XaeEkBFD3REg7Bj6JhbbChzIxNTHQDsPyxLZyEAAeFD6rMy1DprsB7YQdfpklPObqtvf
         6XPz4vzgo+s0dXZOYv5/ULBEPk21fqVcajF9Gl/n9meW1GvWyXW88F+zY14cay/DGNXj
         y5MHASMEhqjxE2fDwcqVADtFih1aKIl733wBBSJ09+7j6RTNnEI+fYIwazX9YH2nDf9O
         HxnXoupDOO+Zg0uPleO3qt7RSy/HcvKs9F2wdx+pVMcuOiqRYCU+geSnW9MYTC/AM5aa
         95YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238322; x=1783843122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ii5elS5NgLsQv2qqwGxrcHkoRbkINQLFmPJvl9kn5Xg=;
        b=Xjf81aRh14PNLZOQrDJQz9mzwKds1iPYMp6fBJIw+adnKe9thhY8a3zN4bExWSoS64
         QMeagZT2lKPWPmxP3DwOvgFRB23nWhBik/Iv39oduLhX7Kv0NfhB4YIZkWJ9BWlwBy1d
         u0MMQ/KuBsNDS7mguyhrQnsYhbsOtdx2xc6zITpPUphsYtHNdPkKqXWx39j9dOP59Dju
         wPSftiS91/dXT09GUXlF+mUgCjLHy7CrPoh/wOngaxq61cZKQ2XgJIheN3DwJqiKAgtg
         vQqB414QQG7F4ismgpUFyguHP7ApYk8kIlxUoulsoIE2u3q1C2SiYbaVJeZdOyy9ZAZy
         TiDw==
X-Forwarded-Encrypted: i=1; AFNElJ8UqlT4axEiaQ9yMI6wCx1RayX0KmS6nkbsQll//v/7+EFr0xPKX4yG3Urn1YVVtEShtNYht/6H9o36@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWj3H/v2bzHgrM79Onk8F3nntO62Q9VnJG2EPja4CtFpA2of5
	HzCHMF3jvW0YLntPdswC1SEJy28b+Xz2YNwDJYJLUHSNyv2tM93i++Q4ud/OqgvI
X-Gm-Gg: AfdE7cmQLVHErtaYjgKlBN7aM3QyGN7dFI68VYAnlNJB9PdKuy9FAhVwi7K+As2OV6/
	cd1qQnjjIywGBBjZFgWOo4DYGYLbJjmzHyhIf24mQNec54tdHYNq94EpIkfeuL/DUnKEYt6YTMN
	N1yedWNhvSBqAsrmQmB4OPlC76Tzv5bApHJ9oQdOUHtzthfycl97oIBU4bcUsCEF9+8dwzsjqkR
	x2C05A1REt3tTzrequoF+gu+aSnXt0KIhzL+RGkWLWWYjxZv3tgajR+djz1jYowfZ5sB9YeS9rW
	NuQwLHk0GZi/VUNI4rp9STQlLlS7jBlX9JNMRYz6JMoI2vuEhwSQ2CkUWC3tO3G9PiUwS/xgUtG
	YXaE56tyDd7G1sR+JyTJ0hq3m0SwBkt4tVSHhBQWFgREONYRKPw7z3TyTkU79E9nkdZbMEvuu6k
	zEAfXtBnQq1DgtBAbRWgP8XjgpVC6FOEHC4w==
X-Received: by 2002:a05:600c:474f:b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-493d11db16emr58211645e9.11.1783238322443;
        Sun, 05 Jul 2026 00:58:42 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:40 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
Date: Sun,  5 Jul 2026 10:58:06 +0300
Message-Id: <20260705075809.1793784-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
for DCP detection.

Update the binding and example DTS to use the corresponding
"chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index 0febd04a61f4..1a202cd29724 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -28,6 +28,7 @@ properties:
       - description: sessvld interrupt
       - description: sessend interrupt
       - description: se1 interrupt
+      - description: charger detection interrupt
       - description: dm interrupt
       - description: dp interrupt
 
@@ -41,6 +42,7 @@ properties:
       - const: sessvld
       - const: sessend
       - const: se1
+      - const: chrg_det
       - const: dm
       - const: dp
 
@@ -91,10 +93,10 @@ examples:
         interrupts-extended = <
             &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
             &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-            &cpcap 48 1
+            &cpcap 48 1 &cpcap 13 0
         >;
         interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
-                          "sessvld", "sessend", "se1", "dm", "dp";
+                          "sessvld", "sessend", "se1", "dm", "dp", "chrg_det";
         io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
         io-channel-names = "vbus", "id";
         vusb-supply = <&vusb>;
-- 
2.39.5

