Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300A46D2B1
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787597; cv=none; b=a07Hb2efAbab+2FCtF8K9gHwGf4CzsLrlMbuIcPWHz62t8H+fcy4NMMdN4/js13RoV80iO9NVS6QrXrcMWhQR1KQDnE3V1RdsK1h35Dlu/nU2iTqCUDo9zfSC+TnopOZP2oIH1NC94fqnVcSGB2nohpG0KNNwzDlhq+w+9yyvgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787597; c=relaxed/simple;
	bh=1fyQQQPzmxyCPUj7mMErj8lT7aXLJp7Cxl4JDzDEaTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Diu9AaEnzNcUtE5V3UN9AZ6qRaDRtNMBO73f8NJM8/wMBi81Jbg3/Gh/6z+WOR3wXUPutDPT/GHllckjqZef6r5AeyjqGflcZoXM5z4uIChafxHbutldQ1THx6C88Coq7lR0JlnQXLR4HZqDqSDKL0daR29q4M2XuGoGjX9O9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uZMmhbEw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uZMmhbEw"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c250f28f1cdso555587666b.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787591; x=1789392391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=;
        b=uZMmhbEwV1CFzeujc6w+O+fbRQYBrY+pDgJv9T2d8OKYdOvhxJYuW+yiFrHpGAhp2Z
         A9Xl0vdYn5vI5uaoChi6J+0P8G+D8QDnwjrm+RYrQTeIekKxtgjjT2zGeipi9mmen0Zd
         MXTidfSpsoqncNcGSChKM/2Fno6cHl00Av5MwP86vN24+UXPzd8YKH2qVUah0BjaaDYh
         JF/KMJ+Wnr2Z1eXtEJKHYslo0Cjk2aZ3X85X4Y2T7DCGWIoZFczZW4t+6UCXzma7rufA
         Gc222iR3xd0c1dJxTFuRIV0Au5Me628ClxkFFWf4LxBZ/czoqZYhltyujWjWuKjdp64D
         UqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787591; x=1789392391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=;
        b=pPaVa/2XHYKTZcay0l7agbF0HEVnvmM7NqnfIcmbwOOIsXG3IFWtj9Q75yEquYoJXq
         qaRSBmnvd3OBVUcNzAapG+fDwf2b6H3Y95qw4REakgITgukYgpLuPw5prIma+O/01mk6
         M4Yk0yxYua5F00vYu7uFQ6i3Cx9TEJbw97JWgy8DBp+Ls7syJPVVMP5r3Rt/D82wz60i
         R+Q+Twu2MOczeKiA/H1JRko+kR976O4eyF+aRSQ5/iPbg2ffbr+fuQ7wW4AUIdEbfoqF
         E9cMTCCKcflVzQomGf4G0ChLSIRMZg6dmy8BFDQTvUYf/tcf8DSGrocg/jST9oI1rbPk
         E64Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlmbNTm6bQFhqioXIGp+R/xEmOpLjZW7hLXuN8h1hRq0e0sQM7otC8dO7f6nUBACEXXkqt0XJY6uID@vger.kernel.org
X-Gm-Message-State: AFuF++mWeD2WwYtpFEjaqNPOZ8VkJBCNdDppy3t/or9Tmv3u3EuxO7ZB
	0Jkjsn/lrBnEohzndA0FZXSr09IgneHiCk++s61VhTmFlt1YzrBwjg3TuzOLKMcuLBk=
X-Gm-Gg: AYBFou0AapO8BICSN/I53tqNbnVkTetsY3NKIiqrJXLnLjS/hXORvd3bdpU6vqf4fEp
	d9hJcGcT/KIzXt5+QE4kRp8wHUJBpyc4TTCcqofBEIaA7xWpfnpyMiDfQkyZWHu+Zdg2vLAsBJ+
	1eXCmB0Tkjo/jCWxLwKicggLBEOiRHqQ44eYYAoO3McEVo1nvnuEFncoqjyEivJper+MsTCz25U
	X0tJYr0C2IbT6liCqPHL2e+C8g2b0VYJYzN4AnTXm6SGVs2fLg4ielJdftZgsEkOYKwJ3vZsgPh
	zcml7VizAL2zhuxl6/gQMOot6+aZ3ZyasXgOLstwBbhc8u6wMxGrp3DVfi8oJqwBWil5CNtZ3AU
	7TqE+lLhyjOdMKoj+jOfaWrlIoR1zH8a2CoaENx4pY/cPFrzAPSoCZkCUHHmNdOg6Fl+pqBEl3O
	tZhLGPSlycZBWCZ72vgYlF5WawmrPFJYcNNiumv3DFT2D90YRZlVhiu8OgRVrq4PpUzjECsEO+d
	e9CvcNLUN/1NosqtqHocLFtSMGYshVRpoGKJVEunu3zZ02Wj47AVWzz9ZuhQB6HsQBJRidzwBa8
	WwRtYOp2zjLSrcP+ti1w5AAjrQO9qbLpstQkxg==
X-Received: by 2002:a17:907:3f2a:b0:c28:fb3f:fe20 with SMTP id a640c23a62f3a-c28fb400053mr139347066b.30.1788787590853;
        Mon, 07 Sep 2026 06:26:30 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:30 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/6] dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
Date: Mon,  7 Sep 2026 15:25:29 +0200
Message-ID: <20260907132617.1198548-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDHCI controller in the LAN969x family uses the same register layout
as the SAM9X60 implementation. Add the microchip,lan9691-sdhci compatible
with microchip,sam9x60-sdhci as its fallback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
* Clarify the relationship between the LAN969x and SAM9X60 controllers.
* Add Conor Dooley's Acked-by.

 Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
index ba75623b7778..af1c66a1f882 100644
--- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
@@ -21,6 +21,7 @@ properties:
           - microchip,sam9x60-sdhci
       - items:
           - enum:
+              - microchip,lan9691-sdhci
               - microchip,sam9x7-sdhci
               - microchip,sama7d65-sdhci
               - microchip,sama7g5-sdhci
-- 
2.55.0
