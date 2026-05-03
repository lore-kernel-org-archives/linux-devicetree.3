Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F03AF657
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810217; cv=none; b=PRs5AtvO6WtIiXMsNgikwRyU78eTg26Nk7GkHCSs260qLXYtSXUIlSA01VejlrUU8Fal1ppH05gPOungRE/Uy2s+j0LEwHI7RqXJ2eAJ7YXB9oOz/ZRq7+no2tFPW2bHBtxfkybfITIWFHL/VhQ3NhYchd7ei+sgiwcIPFVGImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810217; c=relaxed/simple;
	bh=WCLmJv0TuyoCPe5fY1tMyic3ZulSQKRkwgkbREGxp4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fn2D+ezzkle4IWIN2iD7JpVmYEcrmmmNZECzR8k3tUzvl9SPM1pQ/uLENP3IPlwfIg+NYadUH0pN/PADWqNhxGWt89OMtsyumZ4v+vh85PItAzKLc4kYqLQwmY49I4swuWdjAeX03RS05efBXXT/ESDMw6AIpnrdsOVgB8H0NOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goU6gLEK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goU6gLEK"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso1061613a12.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810215; x=1778415015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA9kbxgmrtt9myna//5BeoIpHJyNBXuDKkpos5wjQ7w=;
        b=goU6gLEKw+OhWiBpaHHbLaR90SBD/ImsYoWf9tMeSq1KgRpM2THJYPvQizCe9xaDWb
         YItWx+Da9UH8PF8sOldo9Rarx0Om1tg0BSa8mHWY7v0qtIQYUvkCN5oiKq8DzGd2jRqM
         4PjV5ZOmv8Nbm4gdjqY7l9EkgWH+gMV7hN/dZeKfYnrQ8AJjwwJaswGBAKgfdcaINpcE
         0RF2PzVDpKKk1E+cEERDieNiISKEXmNRhqsaPOOaN4IaN20heJGwYpquUGFgf4s4SZsP
         b8CiL0wEkmB9399smPdyB0V0jjpT2LOiUG09l4srhzkraemuWj/M9z4Z99CJb2fX6Lg6
         H34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810215; x=1778415015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qA9kbxgmrtt9myna//5BeoIpHJyNBXuDKkpos5wjQ7w=;
        b=DR8MQbC6qnGQSEo37zU6yeBpYL4c0Sa0bHkf5JhQnee05TB/qm2k6v/4A3fDEmfS/x
         o640vkgnS10+mmprpBbuZ2rioVmwGPQsCIKh6NPf4ArsTSkSJ4KnERB6Cotd550EXujN
         Y/XJyF7nttS+MRqtn1xnHLfvICjPt5Qo0SCK5NUi3JjVGn+T45CmiLbBjvokcW/V/3kP
         eEXTfh+1fOQ4KD043Pjr6aQ2JRfy79wXooJ+iLeNKfvdV52dX98a/2hZvPvmHI+ONl48
         Jx6F60n/Ic7zA0YHEqUVr8C5r/ksRKNAiLQA2d071NMKlyirO5z1OEwSJG5ChPLn7gax
         RNVw==
X-Forwarded-Encrypted: i=1; AFNElJ/BcChV+WKp8xGo4bkPV12zg3elPx83jA/Bn//9xGJzbIEHnZ8O+Yrb5PzD8naJz96wpmcGwzNV9tn/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzy4kpeYQOpJRcDcUjIvbi542v9CfC3N6bNOA+PLrkqsjwy5w8
	NtMm3JhuSJYKPjbzbSs04UJTWvkQi5DfczU5HQRkMpUaJgd6GVwaj7y9
X-Gm-Gg: AeBDieuY2VQ1q1IELJSZOlpEoRSCgTz6meZM7asI3N6cPJdKIhSDCtSPbTvOqqTnUw4
	Qg4FrtAgylqVOhCVEzClQbUiy6XYbMJ1so2d5/9H0AaJSjUm5/ZPYpgBOs9ZD0gLlyTc/0eiYl7
	BgfJBS+buu9Aacne6sf7qLrTs6AQqzBKPnLTWVhPokMKMBPdCOnXe+Fsi/I5+qcl7EkB73nLbxw
	eOwcfIs2+UL3HF6M/ONgJ2ZxVyvj3lWGivc6s2RNMWEhV3wCMtkZ6jEVS5aftVbojplqp4eyBMe
	U5uHlGYF58GhCpyM6kDQLSBlmLiqQvc+3ociQdj8qkNphoxUoS2xLNDCa+COHzYhOjHpO78t4sB
	ncYUF/bURa0AveOyzoa4vRyG+JCnxQR/3xqdOC3s/XLZ5a+075RsuTin3BIkrmjx1EjRL8iErAV
	apKQPaoe0TF6GgzuJ6WjUJCuU0n3a2/iCG5nET2+yoh1ucHhUnCJY51Mw5bE4eLvorZhsW3mugQ
	500Iyxk+ykPe+0edGPDKWFBAs5NZ3grKv58EJ0h0OrFW2NXG7QGzXWKIkOGXnx31XmKpJjwj+4+
	XTTiEg==
X-Received: by 2002:a05:6a20:7290:b0:39b:d937:8020 with SMTP id adf61e73a8af0-3a7f1c52686mr5876488637.42.1777810215055;
        Sun, 03 May 2026 05:10:15 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:14 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
Date: Sun,  3 May 2026 17:39:31 +0530
Message-ID: <20260503120949.80292-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional VSUP supply used by the HX711 on-chip regulator.

Keep this separate from the HX710B support so the existing HX711
binding extension stands on its own.

No functional change for existing users.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 1ea60dff98d5..a8eaa1f18de5 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -33,6 +33,10 @@ properties:
     description:
       Analog supply voltage (AVDD).
 
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
-- 
2.43.0

