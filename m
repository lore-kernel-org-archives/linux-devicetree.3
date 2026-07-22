Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E33B9930
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734933; cv=none; b=gDi3C2QFzs9UpRrBvu/bXwDKW90Nztb1IegtaV4l6AdiudCs75ZYDsv3RWdcj2YA0tC9oyXhPkxlA3lw/VE9Nw7v2X+CU2qweCb+xWsrpspDjRHsEWcrSVc8QlsJy/o6etZgIB8OWYpt4EGwy9j7fXZfzwbmw/ljlccywBpYeMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734933; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXGr5N0JfoqAW8XuUzDWvt+AVA2kI49PxpbyIHPne/lQDpQK+SHicnU5wXQp2mj3FLQ40JK3t/UvFhqnAQBZmDJRRRNv6O09enIT5X9VYT4VkbDMfSbbbCkA/I/4KguxGiidx8TNhldSEpuRLZa9ZoumUzng4uElpT/5gvjunME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ba3GQ1tj; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba3GQ1tj"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb34c17b96so8413438a34.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734930; x=1785339730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=Ba3GQ1tjDyQNycDl4IgPEGI6ktBpv3EfJZOb+g+WHGrRCESei07uRI1opo0HKBEFZ+
         BiQ354im6H3QfxobuijXIeEcFNX1icf1MF7iWlRI7+nczvIZDnWJ+Y0GSDVAo6P7UViM
         foFgt/7cqfpQ7cwTHG4a0fnEM3w4G/kfvYYwmkbhRXp5QIaECvjvwdUvVP/xPS5iFjEA
         3F/kdfsoA2zC3vNov4OrAvj/BsWegkXXfkLi5PWg6SWMmHipoXKMWTZtDug8eJfW3uyn
         ry8k0jP1b6VsMKWDY+J2Zn2r0hU90t/RcYYe9gnHGgmVuCgKhlIDytVvOiuoLrFDGOmr
         j9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734930; x=1785339730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=GiN3ZXowI6QpLUNfrpdhigMSH8OQOVe4wZoP3VaztI8JGNNhur/kG6/eaPFVbaR9uz
         KzsblZvFutIlraZZVzMsDaLScDmbFe3/8rpFPQ1rGjZGIE3+E0+stI4+jHMrewIHsv5r
         E9bSgnP5KLo6esvPaizIykfggcJJKg7P+lb4Tx0svWmCrn3CHCJLzi/3ZGSBXUvwdl7f
         k75DsYsgha6Nm7apq5vnAScUEarWPYK5jqsnNFEUv491W+bv5oLRlXpAzuZW9AJP1F6r
         O/5Gylu3cE18m5IAr+O8KORI8qakZedfLs2bQ3rZ3ZdEghLJqDiJ5yAnvbDagqsXNAOh
         HI2w==
X-Forwarded-Encrypted: i=1; AHgh+RpBVqJQT/jVmRCTcHsj51uEyl9zBwguCFB/2EwDiHfwrjKJVgxbHbwy9mNZkka7GeU7UFK0Z2Zhpsd8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtfJJwc4c8gwTvfiAUEJXJP1xyx19MA8aZvWUQ6MhLPg/vpa8
	rTDByq2HXCvC6oPQkU4PmCByWUqVfpHM77GvIIxUo1mPfED7v6f5a+O/
X-Gm-Gg: AR+sD12viYEYBNU7PcEG0FBcf2DD/qTJi08lJmtA082B1Wta6VFPoikAf6qqCtE1zw6
	OLmUitCGIIvwVfd55PbdI6Ws8AfUNE1MWJ346gCBItoJpYJy6JQkyKVW09wiKRnWX70UbOFHHQJ
	bR5+Rio7owygq1+2grIRNjTSXIKPOCuq3Z9AomGWXHoHGaNdWf83KrZb205A9m8u62JFJasl8vE
	2GwwVUNIEpAElBDZl7Smy4/VThyMFP+uuZJTDy5dVHPwCC8u+zohwe9QaXEn5fQkjyAkw0G6/PM
	7FPc+8AmQ3ysF2cw2hNesP+qafuI2ZTmYRY0XW/6GrgbRBWjngGAIcKpyXc7HYVCpFlxzRoV2xl
	Hq0WtAWRpu38DYHoWd3u4mB46QoR7HDccK8WYB0MLZhtpbDcd28hZYHcRmu3xXMxk8/34PZWqS4
	RSp4OFJ9CS0Eo=
X-Received: by 2002:a05:6820:4b87:b0:6a3:14f3:3cd8 with SMTP id 006d021491bc7-6a53687c6e5mr11326683eaf.52.1784734929965;
        Wed, 22 Jul 2026 08:42:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aac3a494d4sm1300804eaf.3.2026.07.22.08.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:42:08 -0700 (PDT)
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
Subject: [PATCH V19 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix
Date: Wed, 22 Jul 2026 10:39:32 -0500
Message-ID: <20260722153942.144387-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722153942.144387-1-macroalpha82@gmail.com>
References: <20260722153942.144387-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..9b2af104f186 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

