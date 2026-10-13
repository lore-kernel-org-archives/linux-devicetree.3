Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA914ED180
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890512; cv=none; b=YdCepA6vAl7rOBeO5Hxk/5e1OhmRfZX+TgHJ1n0rC1EVamFsq/YekNB/3VbSrD4r0GkZ99vxmDUhWgz7JJItax81Jwju6gzEK957pFE+iIhSfzvd/5m6u01n7Ad4Lg5ypI8KAVn2hxsv+o9F1w/iBD5xd9lXivau6Us5uRhM/9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890512; c=relaxed/simple;
	bh=MdVnzxM/WL1xMOmZ5fkiZNZC+hOYTLuP3CwOMPlKirY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEhudQki3S4pxZ2/uYweGvddYaQNgPqI7gcCzBRcw+zK/Qp7Y8nYoBOw8fDBdLf2BE2bZY5gepsWOopeYJxYdCqsiFi+UubGqNta4c5W7kiGB0/wxfmLewirjAbs84mzBuJs8dzjfxSxBBLYcQtd6R7cgn5vGhaCLbtDIkHOHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6922hBF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6922hBF"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso1122715e87.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890508; x=1792495308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKvVNAZIKBPJrUX9wm9cpi3TihxLC/jhSA17k/UyT1Y=;
        b=A6922hBF9R0rdvq4517CBv/6E8XSkml729Pt6EtbPziI/yhXCPzSVz3TWvA+re27KJ
         vBsfRrqTwTZJTUJqJaUTbU4dNoziPOLcc+DX703jqCVmOUi1ZkLX2oGxcHeQQAnXK92B
         Uq4EPsnYd8wnxDbRrQGHJ8wUZv5V7S1Lv4k2U9DgmUUhl4fLYmmNE93Ii+5Dc7WizBIg
         IYxYsY9uz0W/48XzCELKXzi2k5VXQiWUKXygix2B5JGushmcWTms3qNBRnN+V8hYdabi
         Eb1/5yNhZQPEwMz6gF3b6goDxgno27/25wy9mJZ3o0AGfbq7eex719CGxvw1KRvzMvkL
         QrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890508; x=1792495308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKvVNAZIKBPJrUX9wm9cpi3TihxLC/jhSA17k/UyT1Y=;
        b=zr+3JWMqPA0Mw5hCZhyt5fb6T4DR23FkFFMofz8MNILDPaz+GF1vHDqG3izK7uRRuh
         Jda2nhzRsEh6ymh9X+6ahDL5S0JtalMp9vhB7loJ9ysgoJk+k/LlnZzK7DMSdhxNJFUE
         frg07NGV0IRVaQfCLP2Zs8V5M44fyPqDvbF6TsFacDY8sZjFbVj7dO8XJtduoDHAF3FA
         7cRgNErF/DdO+NHFT+ZKqHENwIN0ffMzjvhTt9HQ3QjKyurYUoqetjHIGX1CJ2qTxy9H
         ygH6wAnXYhVlQyEWk8QsOYB424yFi/8DlM8zTGGUrVjo8HVfJ1MafdMqQiJpJvxE+BqA
         L19w==
X-Forwarded-Encrypted: i=1; AKwUvBwq2H3HZw/MWiXr9neLgOdbTPxMkHNEczh2GA9rJ2XXGwTQ750M9zsuO9ptna6mnrvOyl8Y3YLYCv4L@vger.kernel.org
X-Gm-Message-State: AFq9FYII/I7nyjlbkYLi62Atmfk06SoxYBKLBbWNcc1LDu8j5TrHlohk
	rITHFIgY7wfyQ7arCNo/VFvDRqw6y1rW+bBB5UypMlnnlaUS7aCxB5VJ
X-Gm-Gg: AYBFou08+FFTUH0rG1zjE0s4TCwMkYn29XffpHjFwB474CA9nd9H/8zMTwWJx1ZllWv
	CDWuTXJqMjrGSKAinRndo5sdk0o0g62QQRZD8D92jwOyHT3ck1lKJhK3yWgDj0SVnoMe33NymVN
	fZMBSpogZEyiYMUNwtdJlpXlakX2oXe/2574dJhPomIWcxeigOF71D7dKXKo/u3tllax75AikcZ
	mdg+nmSrxWyOmOyrQ7jkiWRBa2C8gMYLeHqL4ST5oWm+y4XEPHvv+SPUsHt3S4PY4WmI1XwID0h
	0Dnvp3UfSPST98eCLqC71t6Gw2rEAsXhmvh0W+stXH7/DIExwFJqztW6DHrmSegai0rZ21Ub+4H
	sBLnfFcEk0ojyA+u5mAdnlkgwkpZ8k9v9v7rRxHkc8Cbf2sq1oQCy34KKJ2xxV1WjsWe2Eu5EdJ
	Brf2BT/xQf00uS8CZPUceqtOy7dCOWqFzpGutt2mBRK/LjpUj6U1s+rxrE/TIukuArZvGGbKJV8
	L3XmWhyGyaGI8I/5xXGVRZi92j8k5hawo2z7TjsqrjyFD6KbWS3gC/djp7mPYiiM/PNb7fHadD4
	2wcGE2Ol4xSjgjO2h8YUk2oNKG2wKltAY3Y9gA==
X-Received: by 2002:a05:6512:3d24:b0:5b6:1a7c:59cb with SMTP id 2adb3069b0e04-5bcde6d3d68mr4216008e87.37.1791890507765;
        Tue, 13 Oct 2026 04:21:47 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:47 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/6] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Tue, 13 Oct 2026 14:21:21 +0300
Message-ID: <20261013112124.1878296-4-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../devicetree/bindings/iio/pressure/infineon,dps310.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 1912a1b0b4ba..416117dfd927 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 description:
   The DPS310 is a barometric pressure and temperature sensor with an I2C
-  interface.
+  interface. The Zilltek ZTS8032 is register compatible with it, but has
+  additional calibration coefficients.
 
 properties:
   compatible:
     enum:
       - infineon,dps310
+      - zilltek,zts8032
 
   reg:
     maxItems: 1
-- 
2.55.0

