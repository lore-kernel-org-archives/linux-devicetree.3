Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA0386429
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612133; cv=none; b=oYp6S8XOMTMWhPqodBQAZFbiK7AY1ZTym/mKQ8hySWqBXZo/0dRf/R67uY/nHfyVa5kuxFC/Ok0dj5SuRblJp6UvdVXyNIBdsoDXC2AwJL+b5zI5Z8/XlwPZ6Gg+CZuJjIYHndviRoYz98/fzHcLAhOtBbSJt4MY8zzV+A9DS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612133; c=relaxed/simple;
	bh=Dd3x4WBKvhqfMwm6I/iaCaqL9LzIkZkFwPA0xsebKOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwDO/Eq3JsfNTNGnQwYJnMo5PoNtx4PDlY45omaoRXurI2ls+8ab1oqGTrAG1I5YmgfO0WbxNutZlNL6Fe31uD1c6JG3QtI4EHnNYVBvNTXM/QF3I8uWoKiCR7gTp47jm+zakfxZwGC9aOr0wyjPELP58BNudHrm4H9xlX6m0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlmseoMS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlmseoMS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe655187so23225935e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 04:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612130; x=1775216930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlDICnktaJaM8Uj3TXIg53Glb9nXu0vfJwdqBVHvmvg=;
        b=AlmseoMS9EOPtt8zjmdimJUMNfBM6/teHhLrvQusdX9lZtVfXrflsWCNu63T8zEAJJ
         9BNsODWkS23rnwDXXGPfL9dEoau5V1BMpICRuWnTKO7gzhb3UuHu0Csicqgv6oR3NhZF
         JSBZ6E7YURtKwEm4uC96s45Kh5a8hhQZ9+bHO8LS59la4mdrrkh0x1NBVO1dwwxYUQ5R
         h7J9UcLUmr6er3doxJjPgrG0rg88Z9515UjiHgivWDjc3ZY3BHrsJbHpx2G8gHoozv4U
         lb45SKkSKrYfrOr9g93vixSh0u9ZyO/HlVrO96Vbu4azSsxLvyU7hcA4yzcjbb+TuiFk
         MEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612130; x=1775216930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SlDICnktaJaM8Uj3TXIg53Glb9nXu0vfJwdqBVHvmvg=;
        b=I8is/2UY5YvB0WNfa5Bi8oztxm+AUdtPbhiWMWIOmfGpsUlCNXGSI+RwAPJyKbxX+G
         Is6asgAKp9INHhBPozCQndicxZfAudE8ie9pHrPMydm831pMxXdV7lFLI553OsPSQsab
         f90YYIj99UBm+Yxdf4aIxbUd0/rVGkGBiqNVv3ln6juqBuGKtM6KmSpOXfZFqkXHwvpf
         dNkI9w7rzO3QOwYYpOc+QrAhm0FWy8efV+WrgPdDDg1j8t+OEC+zpLevj+T0922Uf9Cb
         in8x9zByGyVdhPi7acNGQ1tORVPSLPdAawUyd9fB7iArIVT1oQoXoQR7xWQWIsuCwfZs
         gKug==
X-Forwarded-Encrypted: i=1; AJvYcCXrl+147tY3f3u/r9k9+PS2WRajsqRlgsrqlu+awLZ9njMHEbhXpXns95Jlcx3Wng6eu22vCQx38sO2@vger.kernel.org
X-Gm-Message-State: AOJu0YxWXxo1otcOLzY8dh3LUNc+vFg9yM8o//WXSu1RszynXGsFnuPD
	Xg/lvnSSwuaZNXXgD5IB8p5PC4TLg+Z0klw0LR8FjKI3Zbz7b/26J1fe
X-Gm-Gg: ATEYQzwMea4vrE5k+LdtMDtkyRSDMQWaRMo6d8ss4ovoUg86aWapPHmJRVPe4rhyfAp
	UfAv+Z6VuOS5bsUCqcC3mg5MpsxMvyYDhHnmHyCiHaTLT9CbXJ5d/g3vnmAaT8/ooOE7XCUPRw8
	24JiZgrJ++XwQHP6c0Yy2hi85naalykNB7qWst5y0GAl8vdpEZvYkJ8ml4cdVW0QbPQ20yefbAg
	o7qB/4GsZ4juYUm66/VFzmj6Ev/O1Usj4zdEzM6EuQhYk8Kf0mMm6ucxW26st8zZJtgSJ6rr5pY
	sym+8xVuNn+7TeryRsLa0eddpZxIzsrepcs+TMKTXJxhthpKIKTrYIEglmg5DwrKIKqFJddWDvG
	sJc6BD37nLAl/rxu1ZDtiLTQfuuqMT7uFPV60Pxs8HRgkqk7c25jiBdHPeRnUkneb2K98gjra65
	k9oXIro1VQXBUxnWnEUvBMTEqg5+G/IzvXAwd+KPGTWMREsZU6Rxz/9Z2FGT2jeSc3UU8uQ1K4j
	2IGpK2QVhNBcuqs7q/1syEoMw==
X-Received: by 2002:a05:600c:c8f:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48727d45a8emr36404505e9.5.1774612129939;
        Fri, 27 Mar 2026 04:48:49 -0700 (PDT)
Received: from iris-Ian.fritz.box (p200300eb5f28a7005a7787565d4257d0.dip0.t-ipconnect.de. [2003:eb:5f28:a700:5a77:8756:5d42:57d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d49c18sm90506115e9.14.2026.03.27.04.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:48:49 -0700 (PDT)
From: iansdannapel@gmail.com
To: linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mdf@kernel.org,
	yilun.xu@intel.com,
	trix@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	marex@nabladev.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	dev@kael-k.io,
	Ian Dannapel <iansdannapel@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Dahl <ada@thorsis.com>
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefix: Add prefix for Efinix, Inc.
Date: Fri, 27 Mar 2026 12:48:39 +0100
Message-ID: <20260327114842.1300284-2-iansdannapel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327114842.1300284-1-iansdannapel@gmail.com>
References: <20260327114842.1300284-1-iansdannapel@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Dannapel <iansdannapel@gmail.com>

Add entry for Efinix, Inc. (https://www.efinixinc.com/)

Signed-off-by: Ian Dannapel <iansdannapel@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Alexander Dahl <ada@thorsis.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..dd3837500915 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -481,6 +481,8 @@ patternProperties:
     description: Emtop Embedded Solutions
   "^eeti,.*":
     description: eGalax_eMPIA Technology Inc
+  "^efinix,.*":
+    description: Efinix, Inc.
   "^egnite,.*":
     description: egnite GmbH
   "^einfochips,.*":
-- 
2.43.0

