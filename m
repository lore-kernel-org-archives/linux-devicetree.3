Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0623A543C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448499; cv=none; b=gTAJLBJQJjNrVA2qQuYKkPs9pZJBqnXdpcVxiUREldWmyOx92GZqv1AIcgLGjA08R+rTLux8hoJ1QYNasxxD2nbaXHD8SyzbuSESMTK407d2BlLw4wyMCb3CIdKalgGrynLfTcXGNiD9M+xiPma8ToPFWwJxe6pILrq24Z6LJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448499; c=relaxed/simple;
	bh=w1ArHdlD1zNB1WzocPIcfMKRMebBEgG9wna5WY5+4lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIPCHRhjLMAkailrY+8Ck7tXNI1YExeIn/9XEixoLdBvVrx2G6LtenAKOImWx3e0LtNjai4xbopZl5su0eYsUrKgUpPBQyx11oSWtogUEX0eZ0Wf7qFrffGG/PLns8yn9s3D/uG6B1QtXiU0WOmuj1owMnHSYEdBfb+SpnJKvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bxgXngOi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bxgXngOi"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso7230696a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448497; x=1778053297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=;
        b=bxgXngOicJDm5L2SGk0EsoFwzDROCqaXy/Ho5Bz6MlnSu/BMocaWn/YHeKoN9LAgrS
         AQUDydmlxjOT3f1T6phDPsYomPugdhym+M3eDOOKUcH7/neillHYQff6aq/UdBPWx+m9
         hTZ0xVTTyd1rGJw9GTs7x5v65/GeK4GtdSQRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448497; x=1778053297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=;
        b=hoTVHDeuLOCHdmrZFXkTqFhsxG8OcHJtJQtziBHjKJqMoeIN1lNUlr4yxVdexj0/o2
         v4uXk08F9KkFKG3WtQtqrR0MdUQGcRrHq9fn3QEE6/gPBv77j4o4xeVgZpnu3NXkfKcx
         BshnzmdRUWWq3WU/sohNVH4/z3TRv0eqTUWWXp1cHqCqOMGAVWqp7Z3Zw30DbqhjdnN5
         vnFyUgvVXZ7oC70/s2Gnanaixwwo28TpwM3tC3Jwcz67VTZzMpUxQ8YgTTmBE/HV5uLR
         7oCy0Ko/7t8u/0q2Gn3mQXkUEOW5rjScSTPkWzZhjzvPisZY0DsUwkYGygtKcmv96hxu
         otDA==
X-Forwarded-Encrypted: i=1; AFNElJ9QF1Bz0R7wkWFeZE6yHd+jQjF4imNUng0fBWpZ9p9I4I0HfCbop3qrjF8Uc1nuxq7L9czpppr27j86@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/XgOY/OXCf434WAH25sIp2/CJfwxyZUgG5LByMPDGTNrWUCV
	i4xvP9qBc3Xyja6A5cLJ00bVX5DEIAHB7prPsPL35UcIIhXIJ4AvahMqCy5Gkqzqjw==
X-Gm-Gg: AeBDietKl004lsJ1vp9eXHEyyvJhakCD3JKzw3EQKRU/uwzUv44z76d7J1mSmuYTqW+
	m0F0QU8u5mk0ApFjZ3Ivu4vmpnR45ciiZk6bVTFvnqT+IQloJrb4SQiPtbjdWMjWVDhwhrVed/s
	XaWMEdkcXTfSq6E75tTpqpZlb7dQC/4AzoSWKXZQKlu+Ey1x6aS5wCzAp2YYZZpJrlc+cYlCL2+
	R1YPdNRGIrzvetiqntC14UcnVUrsNyCgLyy+Ae5P1ecU0I16KQbaEesENwcCz3puvCWjA4Hn1RW
	beWLVxvY5S3dt8aBAdUSGYlkcgWfdlVbYXrxzEVBaSHHs/yt8btmHNqPofvOdr5w1B45Hi5kXE+
	5GmUe7XBgWYaDzLEn4N2+6U3nkHge74D/J4IycWet0/RuVwXNHxNe26JQngUHks8Uu2KA4Oc2SF
	/SEvU7hM3UXMIs23EyyNe2B94MOM8GYKrTUPEgK+TN0gd1+731rRVkMqDvvNFJ2XSUlMNx1oUqx
	X8nzf/IE33D2Q1yVWD40nnTFZXiDg==
X-Received: by 2002:a17:90b:35c3:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-36491fbf094mr6917809a91.4.1777448497660;
        Wed, 29 Apr 2026 00:41:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Wed, 29 Apr 2026 15:41:09 +0800
Message-ID: <20260429074113.3720271-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- deprecate the bogus regulators and add proper ones, instead of
  removing one and keeping the other

 .../bindings/regulator/mt6359-regulator.yaml          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..eb62d6a0355d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
-- 
2.54.0.545.g6539524ca2-goog

