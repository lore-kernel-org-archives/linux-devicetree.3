Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E639A061
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004723; cv=none; b=cFvrtK4gTZ1xMAcp0M6VIcQu21k6ZfTuNuhucckE5OsIeOmnzUrw5YGGtoAscOxWj5YC4L7J9gx40IcKPPxYPaVPQZtq6xa2Jw5tt/kt3AXP7GqJTdvrMqeoCr9eyae5HtAJkKxT+DlADpYwwAMEWUzSUAtcHlO3qQ5D8Cl5Z+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004723; c=relaxed/simple;
	bh=eIXDrzxDlq49pE2fcf2vzbdsd3Koi4r1FzVnUcQ5K+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hvbrwc3Kj0fJtkoPl59EnsV6bJUj3wla8FLWM+nwTK3aGIYfYOcCJsZ5DxAWl7TlVTZLvDmVNLZXgnZse0tZy8fc6zJGoLgz+6lw2VMnuhGTePL1PgprD4VGk7HDDhOXEBGvlwFHX6yI5BTHzILyERmWEwyLXZA/+5ARB1BtJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+7cWGFE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+7cWGFE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so14741745e9.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004720; x=1788609520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUONAbsac9yqqFRFu6bWfUs5ayDN0YKRiZQdTwHdCRY=;
        b=Z+7cWGFECmXf74ixlh+M6PgvbBtHIsApp+/Ir7wbuFe/BDM7J5r5FB8lOmdaMZJbNX
         JrdwdtPO+JYfWHSFLdxv9qN+YAFak2Qsh9ATTE0mUmNdzYvpZaEnTeAbCttgi+Gwz13e
         Rcu7+TdoHzPMHLj2WSN9xZqsO1L7gx1jUIn4Ywwc4rm3DLXmlUTE+thbW8kSRQkl1FE/
         ZOiu49PWTC5ZNKdyy5ygFYQMl860piUHTszhvq5mCvbvVNdJ7UOv8rPdBcEQ3UG2J3Nb
         0ps5RCQdSpj6BXM7G/edWc+EM7+SEzIzK/+91O/QVAZQWrwFF6ZWCczyl0xWg+2iKovZ
         bBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004720; x=1788609520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUONAbsac9yqqFRFu6bWfUs5ayDN0YKRiZQdTwHdCRY=;
        b=pav5TKp80g71mB/pFoA88sBXJcqQRgin2j+MNq+7ekVy7Nv3rd8CjLBYgAGN6vtIlV
         bF1sAOFlEsHOBadnJe15SpF9Pa/zJL6oVFSemDmb0MkOa3v7FQVR/B8I/eXookSQDyDM
         mh9Efdf2jHhEXysn88iUa1ypV9yQ1R0cjzXfMagEmpcwco0HRBiTJTLXEe8SOrhfwQxc
         Kjkq/OVc7z4/fuqxLIiWQR5hYPyovGLbxgMu2KN7bQQ6tIXzafAWAo/XLmTFXYOxVsEX
         B5AIC7mfDn7B89ctGOQeViMJBOYRYC5XZeQug0vzCxtjPBiI9Mv4UBmYjPFZlAkIafSb
         AlhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPjqCNAQFn4hJ2x8os9TWicTyrk66hx2OBRmv1r8qJZZvut7f+yxcY6+LN6Tg+7VOhvbsAjgQZ37G6@vger.kernel.org
X-Gm-Message-State: AFuF++m6krh9P90clo/fQx/3sYLsUK0amk9Vw3OvMj06vfTO08x9Qz66
	rRdqYA3lhPh25LV4LrlmbQf1kOx+oBbw39eK/uhnjHDFaHF5x0Hqd2t7
X-Gm-Gg: AR+sD13FbvdA3pTJzBE8LrSk+kv8FpmVm2fLhoeTij9RWlUurcKy657Bp8Ezrx8UIax
	Oj+xhw6zim37sgYAUBp4yStyGxTCS+A6JGJmBf2PHxGqC5NLORm9Ib7ILtAEbrX8SXP9uGhYfqN
	hYQ6mRbgZ7jkIacJjwsdpRkS8uChW+i0/Z1UF9/vpZjhPFp75l1XRHazlmKcN3+a6BGyhwM8RTd
	RRe9VQhG7DQfUWIwnQwlgOHniclMuvX6BWbyHEB8c9sIIAaqeZd4qhxUnzlcuSH7XL/4xXqzAoK
	BpxobVvfG+5MbrX0JBLR4uvYOkGufIDI8tXqt0dtxP1h0+M/42K8F6ElchRQP92/9+x8YMZ8q/x
	d2uNhMkGWOuMROr3e2/6OLUBWEPf2a6fgDXm1ySKlh1o9Yx2QWO0ivgo3OR+RW73hZUMlJtssOj
	mI25TsOCd03A3HL/89wmr5fGyTn/HyoefxudEGp/R2sEtM/+44rcWt1JD0JrxU0WP633FQoTiHo
	RVQEB1fhqXEn8tPLptBZZOvfuasu87Wozhd9ZGWR2J+emB4UAgzNWmzM+qeR+hKKGCm38NilmBz
	SCZiCJmGtmeOrsc=
X-Received: by 2002:a05:600c:c170:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-49b91c2930dmr220010665e9.8.1788004720135;
        Sat, 29 Aug 2026 04:58:40 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm111107945e9.0.2026.08.29.04.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:58:39 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v3 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Sat, 29 Aug 2026 13:58:32 +0200
Message-ID: <20260829115832.8749-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829115832.8749-1-robertbozik@gmail.com>
References: <20260829115832.8749-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v3:
- Comment above the entry cut down to the sensor name; where the link
  frequency comes from is documented in the driver instead.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..385400a58 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV32C4 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

