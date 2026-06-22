Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8016F349CC3
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 19:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782156683; cv=none; b=E7px8kG06d2wHaiIZEFPKL4axTVxd9XgPUjl7zhFoPLyBMRMXKYt38aFr8htoAQou3RYFYS5bWFf3vKc3U3J4y3xj5/dtaqw1r3dTvwPQ0sgxP1m+e6vLJv6WlaUjwn7NCJErEZn2Xk/hX7iOW40B/o3COkxRFUQwgsN+APE5Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782156683; c=relaxed/simple;
	bh=7QGAD+nROuS7N2rqF3iN072mIBsfhr1RpExKc0esyLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0R8x8URFsLKMI+YAf4d1iErA+sg28X1lv0lqcK92+5VWATD9OfUubzngbHHpP3zFn0i/KJnk/oCPDR5idB6UUiDCfSauqAfYEWXFbtQunLFFFX7g+B1w3hdIuPK8Hg2o1ITf2srWC7XJZ4pD4JHO3pyX6XQO1iMgBROgkVb6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS445JVW; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS445JVW"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966d7738c3bso3125327241.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782156680; x=1782761480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI0fnV8zlyDVqJjWS0Wf4SlFETnFz3GuDIglX+QJc4U=;
        b=TS445JVWj3TDGl9uWHVzl7IncSeEfR9hbs2sujl6CL0eU5fLmWbIvFjXdrK8gOYnyH
         i9eDVSlp90coWoiIUgEEwrNBoLEpBujk77JgGhO6wV0plxl+vdsQU6bn8gVPE1srZgyc
         8pFTrCcc5yOmSxIPL+6b7cInSyzyq7pjUyHIzX2Acfs82Vuqb6+JjZKAsdwVyv9+JQdX
         A1cK/llclKylha+tZnDXeJvIBgurz34PpStTgvSYRvQpCyw/qp3xO6ZwkeLLHTRMqTSS
         7YgtX27EYRejlu7HX8ExaXKXzyzLg20D95DIkOtaqvcfYneTMBstakki/OT4KcEyKBBD
         tUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782156680; x=1782761480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qI0fnV8zlyDVqJjWS0Wf4SlFETnFz3GuDIglX+QJc4U=;
        b=aZtjlBCvJBZLb0lNBxjdb8UiGtU50eD5lwbXDIvvPKCPowTEkgIKO7JBDav2dLRFn8
         ucdWTjRdJmzCao3vH+GciUwCqzniH3kjt3cZxnH4rOg9F0z34fsjkAZj6qYChyeKFQWD
         fxhh//eoVQveXnRNA9JyBC7DNhqD1AnQwD1e0U5mRtpOgL0aRChHeavbeUXxJ92YmqAQ
         +0BiKto+51PDMyuQ6XKj+0hGZI97qLHdQ5yf6Fob9535pRL9Sz9YjaBCJK74aAtsGd/B
         A1R59Osu+H5v/aRa62FvcgBNWe3nV6N0tokKDUgMiZFHt086CQhT8ezoiZmiIiXBIAbq
         AIyA==
X-Forwarded-Encrypted: i=1; AFNElJ9gPd3i5GyZfaTCxJkSVi9tOuzlP7GuMIMHBnYrK11q0wZEVMW8i19ZIxcOYIVKDJ4z5s/bReSMFM1y@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9v8cI2kJPT5tdye9R0TesTYcjVsHXg4PjhV4/iBcCLrtI5wR
	RN26Vbd/WgQfpQUld6xdj7IvNuoQ5ogs7FfbtUPX63V0aLhGwT1yOReZ
X-Gm-Gg: AfdE7clWIwxKHRlVzKiHNmae4lENIgXR5v+sqSAWrMg4Nre60nFPoY8aaWeRomyOdsy
	H6y3D6PF3II1sxxKXV6RgdpmaYjeQeheNN9xi2JZmfdwEVJ8aqjaPc++X32qR5zAs5IcczycwW5
	5INjH6nzbgxT8dIu1gCY8mL3Fe9V9/nVfeyEDmzdnl+b7d5bEh+nK1UZ97BxP56Hd1/Ivz5/RCL
	jWDqfDaweLfjkZfSWML/eT1twVYHn3oJnbveB2KKt5OQqe8JDjJ3v3BsMTebZFqUBTst2fZ0x+n
	OEUVoJnratAkC+OBgFwXTVMDppXnFHwu5W022l/3iex6URvLZZHQ4NGWxJto2DQ9cuNVv8wMueG
	DLgza4ukHy8YapR1bw/+MG1JTlH2FwqsX1kfiMvmC6BFiVDT5FBc78kL5p06kKIurVxt27ZFIFz
	LmLlBWu27WOV2G7RFvpzg7fUEm5g==
X-Received: by 2002:a05:6102:6444:b0:631:4e9a:bab with SMTP id ada2fe7eead31-72a1f0af940mr9114119137.18.1782156680600;
        Mon, 22 Jun 2026 12:31:20 -0700 (PDT)
Received: from [192.168.100.222] ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c0e484bsm7227910241.2.2026.06.22.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 12:31:20 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 22 Jun 2026 14:30:47 -0500
Subject: [PATCH RFC v2 3/3] dt-bindings: iio: adc: Add burn-out current
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-new-channel-props-v2-3-aafd5369f253@gmail.com>
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
In-Reply-To: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=7QGAD+nROuS7N2rqF3iN072mIBsfhr1RpExKc0esyLE=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFmWvQ0HbE69e39nk/y7lw7b2KxTeZP6/2XUKaZ967xxz
 ejyplV+HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjARjgqG/3niRbf7qiQnaBzf
 uNn/8HOmE7XPgh6Ednf0xP5X/KzQt5eR4T/DGysxk1khak97frg+dy279m3TZhNjDvZ8oWNRWvL
 eTAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Some ADCs incorporate burn-out current sources that provide current to
the channel's input pins for open-circuit or short-circuit detection.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 160a8cfa9842a86..9240f569d4ab7af 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -105,6 +105,12 @@ properties:
       This array describes the current configuration of the excitation current
       sources or the single matched current for all sources.
 
+  burn-out-current-microamp:
+    maxItems: 1
+    description:
+      Burn-out current sources provide current to the channel's input pins for
+      open-circuit or short-circuit detection.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.54.0

