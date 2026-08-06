Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90E377A9F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976629; cv=none; b=G0X4RlxI+FWXutPRmu1XSsPL6s2mY52Fpe5+fCfa/OKTghcLh92OkRHcWRg/vXqbW45olPh9avCC0fwC7wjXaKDYuqtcjRjnHFpNm9wy9pC9V5blCCg7AjsK3kF9rY8J27eDwCChC2x5RP5wHcUVaJqIKo6xViWrbzVh976BJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976629; c=relaxed/simple;
	bh=s0xc/qRqKSYszbosWK1revJhFS9bWxi6O3940Ky6HUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rR1ZRmSUESL2lgEMQNv/DHcOk24MqX+QloipGPA++yNO+L857qKm5YK0YeAzrPLhdU/vPRd2zCplImS8C2UozxGJJqhf8fNW0rpzXQ/9fQ5h5QNDc1cN69PjZjDwHt+Xt2M26AsmUtwE4bCqv5bw4m9AxhuaWp6vzfduecsOCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtAVzx/o; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtAVzx/o"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ff20870ac7so10727086d6.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 17:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785976627; x=1786581427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/YMYZ/ZLPHXITGBWlmd5D8EZ5M6klx5Cg4Wc6dV+NEs=;
        b=VtAVzx/of8HH0OiUae7JQkH2fqKnq+xKBO74sbtk3aG43nB9ytGLaJQFwqliV4zv4A
         qXd/TlfmsRdP/bZzLEmC6Qirtcg1kU2dphCwmLWVqrlHWcleSfh2r0CYaDTUZeeX4QX3
         KAvv0LE63tVwMxQRXIPmHmbBab3yXGxV5zxErZp7H9HRvaKpYCmTp9dlOXX6ikEQSXAS
         qKVVO1Uz4xHbgCDBJFCcrhViZrOjKCqwfzbVbQ4EBBXROWtwQTkDMECw8fInOs7iQE5F
         8/rPhch6NjJNbeUq6fB5SEIHXY/AKq0nugicXm7haQRwtkeXyFYvGLZ3j7hC6wE7VaK1
         SK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785976627; x=1786581427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YMYZ/ZLPHXITGBWlmd5D8EZ5M6klx5Cg4Wc6dV+NEs=;
        b=WGkCqnx6SHnr9EzRas0+izuCmcD+NrS4ito78K0js3Q4wF2SJpiQk48kUYf2hB7CN+
         aO8nGpOGc5Uvlo25TdPVCJJl7TY+BHLnJAihyNoAlx+I0lRuV4EgAiN2cv8UrZzIHF9C
         wGdA7PUuo70lxsi079bEI/xRkfAsbyGZxGQmpfQ36SDJImSC58ticfetbrlwbX1uJt2z
         e5kZMZ0KMHreUt3ozgsjTEAHbVOspDhkOXxNx8JR/oiEeSiXfqge5wN/4rrDnAx9N0m+
         v5/jiqiHxbIBlH4dVBVpuRlGFMSixJKtBfbZwT6V8sSiuhSchtctwGJOJlrWA/0k/ne5
         RV5Q==
X-Gm-Message-State: AOJu0Yx+TdrQRjg9/Eb0JGZ1BEHCtdBBmoV6LXhfr8uEizfY8IV1Oll7
	kEUTJbwc6t00InJl4oCKz7OWArpbY1awMP3vHCqFQKKDts/PKo8SiESke5E7ag==
X-Gm-Gg: AR+sD11h3a6A+ion0F+3TTnxfOg5WGkw/tqUYwo77kUpgZxyNqHbcxRHS+f0HGq3UCf
	cZFGW2hbXe693Vbmjw61kcKO1WZjEOlUV7JwrI9Bgp2iRwRYNUNBuaIqK62AbFLgNXfHZ2rQMXu
	7g2xhVzyljJ8r/PCU2WYNMWIWhggrbeFj7QDUgGoODiP1E+0Xi0lgFRqbCfOeY/qS3hfisqyeOz
	W0gMo3jahuYwDFDV6dIgAIXfB2sIh1N3Sak5Lmw+vf3IgJlmKIxFYTbuED32hwq019iAl8VoxpI
	b/RjmXF1mJ/WgAcmVFOD5pAzXwA+qs/X2PvHFXzIHCRP7TTsXTP6WKNxbKYqwJgctjU4vdBLYVR
	rKhp4JiSV9+dJY6DISurYPILgt5Wpw2JhB0XqQOMrqEXomoqpUUx3Ydhn6KY24jKtSVHyasEkFd
	0qY2vvsxC0vDJVD2s7tysWK+IpqEoW7mk69kFEWI0QgriEl59RsTEcL/Jfm1AI9ephbBJgD8yRe
	w9g86zQQp2FquAZDSdlJr/WJgNTYwNYiR7EWLd/nGxYBRpA5E6/2MvhkVBWnI+KGhbu/76UigYV
	yObBlqnxWSdW0JWDr6RW5el5p9ZDT8Y9R/A+zA==
X-Received: by 2002:a05:6214:252d:b0:8ed:a980:6b2c with SMTP id 6a1803df08f44-908813bd801mr126643476d6.30.1785976626999;
        Wed, 05 Aug 2026 17:37:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9088008e9aasm38717096d6.28.2026.08.05.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 17:37:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM53573 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM53573: Rename mpcore node to mpcore-bus
Date: Wed,  5 Aug 2026 17:37:03 -0700
Message-ID: <20260806003703.5141-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'mpcore' node name does not match the simple-bus node name pattern
'^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'.
Rename to 'mpcore-bus' to match the pattern, consistent with the
naming used in bcm-nsp.dtsi and bcm-ns.dtsi.

Assisted-by: OpenCode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm53573.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm53573.dtsi b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
index 1aaa05cd3693..2c43be98090b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53573.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
@@ -32,7 +32,7 @@ cpu@0 {
 		};
 	};
 
-	mpcore@18310000 {
+	mpcore-bus@18310000 {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x18310000 0x00008000>;
 		#address-cells = <1>;
-- 
2.55.0

