Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D023ACF01
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247723; cv=none; b=ihfH8Jt7Ove7ghUrpf0bS2bxJTgR/yfduOGEimjIkkD1PfG9PX9KdC7QkuabRuT0ReVNrn0haXxNX06zUbNOIjjqh1KXB688Ph50evv1n9calrmDpeJT7oZbTiCk9J0kcYDQ6t2HdtKXoR3TsSGAZ6d0ppoPcze+xMKEay/AMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247723; c=relaxed/simple;
	bh=dR45JslvD8X9ffV3iYwOxJm087D1op+CNofDiF/LfOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUfJFDVfar3a61KtkYPm50p+mOeKsw3qmTvOpfVJVx80Ommafb3A8wEJfhPvynyYkwB14gSDRvSIN6ve4j/UI6XEyuY/mSqKTKKV00fHS36MfyDxZGk/VYJly3Vi1gqqcmxTMYBIrPiBBIuyryyWKGvtW7xz+OHx5BMmkiQNgXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1oYq2F8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1oYq2F8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so10466455e9.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247720; x=1782852520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=;
        b=m1oYq2F8ZweMqdxIFtBb71bpuKN+qZPCxbJQ9VYlDb+JxLySGWFae+G3ZAXpb5EqLk
         w12SHOEEPQnHthqPzVJPqWJvKvd+7za9i4MEiGyRaYzvV8d3EOk39b0WWGd4ToEx8LEB
         bp8jNevYNz5j3e+wuGBrU70JCyAfSkGuCNO4YPbkeX4znQEpuBW1CltC2w9opBSDvvhv
         mQTH0zV/82oS1klhRgtIY44iZp1le6S+Yz+b2BI1MYmL7mMn4q5mLny6VTFrj88gWnp1
         5hCkKZF0JPbMOW7ybXJMPsJBEgpoijKcOnkkI+bq7/wCFPEjjQXfuzXHbU+nbI5RUDo+
         rysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247720; x=1782852520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=;
        b=NHjAxmNkx+fR0e48AP9K2Ajc5Od/JEUB27RjA3r3oqaBKiHsT7wm2Bi/05Grdx8uCE
         66tCHbMy+rC9a0NpNGpqlJhuqN//GgHgizJiB9K1+vIf+XYuJTd0fKTk5SB/R8CuVXf3
         OWf0sn0Sn+4OPhnJvwK7f8GVdv+wg1tHsvpjTLC0wlVwwGUd16WlgKFjnB9e98ta/fbn
         yDJ7p3ANv6Bv7NwnPBsG5IiY4zw2fE20QAqn4DjegNbHpiV/Ly+17q/UgjAdXJNlWEaj
         TBvOFcDon1Hup/DlJuOJgo7q6zFtzOfaNAOoq2DXF9LgQkbsTPdPVY7QcAHYemypQOGU
         gDeg==
X-Forwarded-Encrypted: i=1; AHgh+RqnxQgbN8pgjv0URyxFZ4urq/NQ82vCthTgzQJ493JxEwOQrBUb3SPAVyUJGl9tK1XbsZZ+Q/uKOO11@vger.kernel.org
X-Gm-Message-State: AOJu0YzBt/fUVEJgfCjZZ/3RM5srpW3T4NmPqn9yS6f8DbRtvv7WevXY
	OMzDausZmWk79hdiHTlDGIsQL/o9+8ZSoapDOVn6c71OvYR6Zd9e1tRD
X-Gm-Gg: AfdE7cktjc7fSJFP0tfTmLZbqbZWL2b9QkQpk5395bFjbMtzWpsOGgzxdHjPD9OcblM
	PW/rhJ+qtAFIFxABZZoopySMmyrWXwlzWE8jBB0/xqhq30QGwlm1Hykgt/oMD95z2BKYqiebyhH
	N0Fqaslu/pMtLHrSnctX4iJB5izgq74FAUbRpVezOLRv35R0Xr0Uby1N8lZ1Z+tUT60ZPA/9OBj
	CzQ3J1Or88u8nUb9OTK8fvBTVoaYGr2g4OGr4R4gdzErX3SVUfmsR8qc/Ehp+1iibGa++W59zIN
	ObDy40QVa4AYoqplzgztP+SW/VirSJhfWPxozmJAqA5iyeWWcejLIoGFqnG/Nwsc5sn3zsR7Dr+
	gCQIJJuk7F6bCdBynn4HXrBUqIv11dkjpQpVwyPqSUnu1B1AswIo/Yqhas2CpP9feLz23UJkGUW
	7/X91MYpsR62giy8G1DOvf9b1CFf1jKkHhmOl3zBtMSw==
X-Received: by 2002:a05:6000:401e:b0:460:6b12:1783 with SMTP id ffacd0b85a97d-46a7ebdf3eemr8161239f8f.4.1782247719719;
        Tue, 23 Jun 2026 13:48:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:39 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/6] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Tue, 23 Jun 2026 22:48:15 +0200
Message-ID: <20260623204824.691832-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- no changes
v4:
- renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..82dd58b95f8a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie A133 HelperBoard
+        items:
+          - const: baijie,helperboard-a133
+          - const: baijie,helperboard-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

