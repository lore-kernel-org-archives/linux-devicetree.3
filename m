Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6AA3A8744
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209717; cv=none; b=KgLGYfVA6T1FnhH3DYmSV92a59q+01A+lUiNHT/S/mWlofXnga+jrIO7IjzFDpcP+tkI9lc/YR0TSu5R7K+cv9keFxGSRToI6nw/g6M8eFYtvd//6ou6oGCdSNxccJOgtxYl7MApbp3vafhdOVBQdr2wiBrt9Rl6GLF/fLjirRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209717; c=relaxed/simple;
	bh=fMKaNCHqvdnEkQNOcz/+Evogzl4yJdpF2G3aArECXqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6/5W4XWAz8h4FLjlEsyK/+s+DLyUOSIAh+zr9NpHcXaZCEhEmdEevpejEj3XDBTi+I4hm3voGNm6BhMdaEN+C+w1qcSTaNR/JAloiBi/QUaA3+rvcw7PnF21W9c0oyyDAMJTLfdUTVCF3LjcNHV0an7ncatR4OPlksWvRb0YY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IADPiKbd; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IADPiKbd"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43ccd4f6f6eso263731fac.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781209716; x=1781814516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG46e6wh0vfo+H1QfKvpne8/nrh3wipAUO48FCP+P1g=;
        b=IADPiKbdaOS+6TmS1BOdm/8aiB+cw+a2F8RY++/6yDKB1lwxYdVvQ029JnToG2XwYH
         LP6knBI/YP/jHSDV19Or1kgVl+lheRJgJf/k442fsQC1aQwQ+JsnQUNZV2oQCyhUjiBQ
         MwE17w8j13x/9EldJ8Locul3cNvIr5dPWmrFUH3oDCbvj2i7suhaSCgYNHcdhMhgn2C9
         K1XeMw8Gyefrf32ULXzqvT1e1wuKHTDAPJfsQ56QslbQumtwUrbZAUuPcpnXtEnGqprO
         eCvucVHSlZP5S3ToYvKfpxg/WAiw3zkbPcKQkksbpV576BT8kkaMVa5GD0k07sYh0kco
         VBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209716; x=1781814516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG46e6wh0vfo+H1QfKvpne8/nrh3wipAUO48FCP+P1g=;
        b=bNfbkAg46MhkeL/RGjArOahlAY0ig1d0b9jXm59xeX6MPt21N/zhd4+deVpCm6/QYQ
         +XEp1rFEjBll817t2d0vmtt14+QSyfUlT8NUYQfvTTceOv2vPolx4+0oa9EVYmniNNIl
         3c3Z8KD06LErawJcXgqSeBkpYNw5EO4CUYAyTxZcBwEDr492JkrvjpkhYQ+DJ0m8DFEx
         9YyuO6THErf+tKbb08Emsa8AR71Ly0ZJH9F6vtxE2t0wcnq2dNZ1pfyuaST0cbGJWl6g
         yyEZOOp8po56khOTMUDx6wAqSR8on5etL07VoEJ8+c1bGtO+Rn+8oUBwS72Gwah2riF4
         R+Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9pdx+oastg9g6w9FNQQx3iBlvFTw3myKeMi2ot9/m1C/sdkUvcZlPWIx56n3oy++XIFxvpIxNtiFrv@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWKlXJkxPnvhLmjvu3Lo+d6VCKW398bcKeCVp1+0DLgftVENA
	7qSeUqf9r265TKwf1HKsr0G6hZj+okyXtTLF11LWICzAWYj52yR6albt
X-Gm-Gg: Acq92OFl9UeI1C6DdP1jG7kr0W0tKtI2dkWQyrvJnGbcZJ34ewhqw12pREaVReru9DK
	+WjmhdB6ai6b6R66G6z45jpFy+kfPCfeH5F12y5zkhYuuvmpOQc79u2SYMoAO2QiCz1pjQw3kWy
	d3H7HPpqMaolTSiZnbKR/DnNzmKWdFM28VQjCotqNhwJEXbaJKWj4gUD1XmxbmFQ8j+Yxlo+5Bd
	NeWXWRQ5+8EZl5iTFV4mn51npXQBAigZ8VkQSaHZWZk+Qi2oeiafpGpiqZNAzRI1NY6w3KLnT8D
	ZoWPOMnBsRfP8pOY1kpDQvfRC4tD/jMLnTmx1LW0W1azoFWNLzH3OpUaVgTG2qMviEc334hVD3x
	27xOZBOtEx2OTEZMc4nIgdKenLm1ZpGyQaSR88BFMPmR8m57zjRnBtpEtAAVeHP8/mWXah5VWox
	9N/VozL80y6Ju3koEBu5xh0Khn9GzwbIfS
X-Received: by 2002:a05:6870:f289:b0:43d:2d44:5ec0 with SMTP id 586e51a60fabf-44241d43bdbmr2944367fac.26.1781209715705;
        Thu, 11 Jun 2026 13:28:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44244cd05c9sm1796134fac.18.2026.06.11.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:28:35 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V12 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Thu, 11 Jun 2026 15:25:59 -0500
Message-ID: <20260611202607.85376-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611202607.85376-1-macroalpha82@gmail.com>
References: <20260611202607.85376-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The driver does not require an
interrupt for these specific chip revisions.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..81b6e85decd5 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

