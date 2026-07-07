Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA8434E3F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443979; cv=none; b=YdJvmAMJf+FmYmvsB50T/6WuW0KsrwsT5vG0lYTuhb/vfhuCZI5Vy09DP5TvRJTESc3/4+TH9cPUAwXHJF78o+dLUy5jpYktznjQjj3boNKFaPLzawvgkaltvlc8/0jhbDVCzyt6ULEFbQvmZMQrOWKI5uJmsKv7cvjdtPB9TjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443979; c=relaxed/simple;
	bh=SsYILJfkf2iZ7t/l3nX0eduOwBCCQs08zQkAb5y17HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=slZnZTj3PjGVweIKcVUhqivGiWkxhDVWvEQU6N4Ytc0dyvQAVkVmTFFDNys321QNI1rUEUSAgm4jbu/n/0BdDOcnKAQiFeAk0kP8+sWzEa7QlQAh/vWT32CttiWPWEDa7nh6Qjco9GpbuJzIFQndSiJehROID6p/Ila8K9TQOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dUSVizK9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dUSVizK9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-474560436c3so4213648f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443976; x=1784048776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98h84xUiJLI3J436hrpC7VMqWAkahaKTeHKmOowBonw=;
        b=dUSVizK9Krz6nBviYXyqZrx4nuxLk4IBIYFqa7tp4k3Iluf7HsgG1eb3CuN3MmmLFI
         lgPdL1+LQmrLGMapLMTdH1iHmEGfhaUCjKmc8KBiJKphx3N+2sfjMUSHcwBdxf5P8KNg
         A7LFYdIodXhawQiU7k31v62UsnQb1xOOcqDYvXujajO54Zh4SJs89DkqPC/+/8LRtY/O
         L3434c24vLoNDG1DipxGXppPjpIcBtBi3CFICcQhyZulBtacwWnKrjeaiVucHJD3mVQi
         /Yi+r56QKjh2qq+3+HNUYeyZclMbMencUuAqpBtX21XpcoD9kdAi8cjb8PKXyihsaKJv
         szMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443976; x=1784048776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98h84xUiJLI3J436hrpC7VMqWAkahaKTeHKmOowBonw=;
        b=G6ZrzJrRLAj2+aO+fbZmW5unaf8Uj2eabjemX7OB4Elupr5i9tOY2lkskoUCb/Lu41
         CZn5j++qKwdMH+4QaVcJfdB0MeP68WFN08XKA51RT1eGSZNlM/Y9gGNJF/eTwIUgI/q6
         yrpnjCJ8tO+SCaUY+WGafX6t8e9U3SbBJSEMulzJ8lwsQYSsK0v6GuQtuE6CpYwDanFN
         hmHyZBCmBmkZMDdqNYubbJpaj90r66hnhsroyj+ornD54KUyNk2F6oldtm4Yc6KE+AAx
         vbn3zeBZfWPaPop+FsZCU5BSKttglOxxsxVIcAH0xEWOAneoV9fZKXiKQd5MT95Dw0P6
         X/Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8RsmswL85BGF0r72KcmNELPTY34aISUoKiYNJ+uFgkzMgzLVNTJDv8jqOR8moUK3TmVHN2OcXxr+9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+H/NpmxPWmKJkfsjhxnV3r2YHTmcWxX7/2KGz2FKZ0wPMyLu
	OGxpqzdWuyMSZIVnslclRyQABONrszMRYcNmU7sIdK+mlP+3+I5v+7njx34hCmXMGI4=
X-Gm-Gg: AfdE7cnI8JadZfJmDBiy4SNAHtn+FVDdrL0JNcYZBRn7T3hvnvo9lPxrCNbdOfxe2VK
	NJq9ve/kUpXYslIsT6Md/eg/VJkIBQh4Phvm2xXjuGSVxtexA+jvmtP5KRMj2PKaSn7yQjBGB/G
	qSKc9YKoa8UsGZJExYsQ+YWahOXMZz4hfJ+VXgtvPRlLt4zd2nnUvCFXCGrjilVHcEqu3+77Wru
	3x84855eLhtf3Yg6BF7/aCL/32GF9f8O5iKn+o+9tqVbLcFlzcIc3w+YEJ5nsGcUdY0cBbaYuzK
	GVLfdB3dwjm4+bef5CWxnjEuAfW72tssn20FwWYKjG99+/68lflk0YJWDYNnaWijpARja07xW7u
	PetOCg9KQLzjbbnqXqUNVsxZqCnH0CiZqKQzoEChlDVbCQicSfHcCRZ70P1cCPb5hRET475rwW0
	0nGwIQ1r6lee+QGvtj36W61edhEQuIwi6zpPNcLv9TLeVO7Mbj/FPvEHKcrhdULE7I
X-Received: by 2002:a05:6000:1f06:b0:47d:e022:944c with SMTP id ffacd0b85a97d-47de668a6a0mr5130779f8f.4.1783443976106;
        Tue, 07 Jul 2026 10:06:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:34 +0100
Subject: [PATCH v2 02/20] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-2-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The sensor supports output over either 2 or 4 CSI2 data
lanes. The binding only permitted the 4 lane configuration.

Add the 2 lane configuration as an option.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

---
The original bindings just used minItems and maxItems which implies
that lane reordering is supported on the sensor and that the lanes
can be entered in any order. This isn't the case as lane reordering
isn't supported.

If this change counts as breaking the binding, then is minItems: 2,
maxItems: 4 the best that can be achieved which leaves 3 permitted
but invalid? Or is there a better syntax?
---
 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
index 6050d7e7dcfe..d9cdfda699bf 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -50,8 +50,15 @@ properties:
 
         properties:
           data-lanes:
-            minItems: 4
-            maxItems: 4
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
 
         required:
           - link-frequencies

-- 
2.34.1

