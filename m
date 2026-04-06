Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A020B1FC7FB
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775439135; cv=pass; b=sbBqamy65tsq8nAWmkI/PHKvgJYe1D4lk4e4ERYJKhH0IsADVa6xPu0p3Q8tjM8A8E0H1LMPHloN/9ZnzajOnAJM+9mGlE8vVMMtE2kfxJnQSCL11MzgEOZQJ5rAcrpXLqqrysrqBTBI2e1hXgYOht+XyYwrfAEqI/E2nACt8iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775439135; c=relaxed/simple;
	bh=/2oRo61DdxBAwVd7d7a4v3psrsDUMYudbEHSnh1N+pY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TAR4Q2FJndZWKn7HO+qoDhieS162bHKMTy9z5E7TphkYLw9D6lHWm88Rf8NMOB3++HHiLPVyCx0xDnjRDD8/O6Et9Hf99jkNMTDhcic3uLjIM/681D7bwVGnZY1hx5n5spL9uvSRo3MOOnTrYOxOlhDuMlEIOOXhsCblCN/DFHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxNoFoLH; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxNoFoLH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd96354aso2058223f8f.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 18:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775439133; cv=none;
        d=google.com; s=arc-20240605;
        b=i3lAuxoh/0OX0NmuhakIVJDXCxE1dmvzH68Dn4CEudmJFrz+Mk6RFNReLZQR/Xj68J
         W06BEoFNk6bBrf5ypSHBJImDOq1LY9WuFqUBXDHa5QdUlYKdzJyf9NsCnwgTNYicHjTy
         ApLxGiggWYxxt2iNrCQ//reqKiF8rA7DpfZQiPN6mZw4raryKXjOqCivkO2aPo6fhnZY
         URY7FZRBeXp1bXYd0N/IKT11eJQLOpr1Nn2/ZwgTGkkaXGrTN6OsGFklJMQ5qV6Meo9W
         FZjpKCdbloNiwt6kgVQBqvmFtzVX4TnAHOp24KuY7IXK4y4kbGzAfqWmXU2nNMFGSPYb
         X7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XAmxd3EuZ38iPvxWt4ogN1XlFqeLQb1aml5sIWvbbCY=;
        fh=TiUj1o9cfGen3I47d9Oocd4nmC3Yaa3KXw52F1lgKI8=;
        b=ex29PfRKqBk069HOLWSl9qP0Jli6NmZtKMoz8L8K/zhOivA6GFLDM+DhuWUPJf+2RQ
         gVb1zC9Xd1fesTQzHHeKIUOYdhE1qhalN7bEB0mLJa07UQxigvoH4J1JbDe7sgnOBLC+
         0B6Z00lEzrsah4S+iIM0c2SId+ipv3/eG5YNV9DDTlBGn8dXsCET/3GbgS7iWmLebXZa
         rDFsPA2dxd7RmndwvoI0f69Zhv3lekMHiUSGu0i7+nGy6B/NzWuVV3t0+d6m+D95ek2t
         h6WWNwqAVtUinmYxQwYx/1auRQ0uy4cwYYM08oyi0YhHKpusrbXMorI1DuoYbvCDY/IE
         pwdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775439133; x=1776043933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XAmxd3EuZ38iPvxWt4ogN1XlFqeLQb1aml5sIWvbbCY=;
        b=FxNoFoLHJbQ2q5YJo+SohtBKC4R4IdqoKvaExHOwngByGINt42VmibAXJvht95z5sX
         Anmzh610CcsFqkzeh2NL0LIH7aM9I+yTkPcJcDhOOgG4MWthqQ6FueyrALWctmJRpPl5
         54yA2bCBBi1+9FJsSSWyEXp1jMRDvfUOGUpLtqgZnVGNeFVKg6Xg+lLfq1X+QAIRmhme
         EacJrL1mfa/bl3jfFTnI5um5JOhJpsCjlY9J6mrGY5VrtvrX2JcthsqowTAFhWHVC/UJ
         lWG3qfC2u3yMjTiaUuer682ES+21LtRGA2skqbOfgQ8bmCeLxc3nzHE/oyW4q4iuxjDR
         x/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775439133; x=1776043933;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAmxd3EuZ38iPvxWt4ogN1XlFqeLQb1aml5sIWvbbCY=;
        b=Xr76mKhvEBfTyKlwx73urewWLGLiGEunpxH6iH3YtaUPiAD+wkJe98zqahvG1SS7Sr
         UrKdzkcXNqRE4wqsPZ8rFCEgeQtu0iU2Z8DdXe3jMDo9z2gA39pVn/ZH/UHgZ5TbY5iz
         x+Pdu/5rzkPaXNTDOAWoDU3AV+s2rhF7a81sbHyzi/oFnuKYMyKy2ZOKVxSloSxqJNXT
         DNzIFbGUTBMuF8nBtOhtOqoMyB50vpsxA4I7w3Ts9GgVgv8/oeqXNfjpOyXl0jJ+pF9A
         EXGcurW0eOLtBYHk0nIkbJu0JNH2fRdXqq9LFsPwEy8aum8L9Dbw/oG+GoXN250Vl2Ym
         fFKA==
X-Forwarded-Encrypted: i=1; AJvYcCUbydOuKa8T3I92caTbC4sRRlim24/LESXTjBBK5jj4cceAZdSrcIrzXeiA2xjtGpy4FpHfigWyOGpN@vger.kernel.org
X-Gm-Message-State: AOJu0YznxbKcQwuwtUL9Tgl+AHEeOENEsjIRKEe7m/EN8br9cF9//62W
	YtztISiYI/u4dhpmBv94qvHdGzl/3llO+lDF/ULOxrFiyspXunKIH2rfjiH68AucgqPlPDga4Gh
	qURGH5g/BhsjEiGz3/amn/bKjE3/xF2E=
X-Gm-Gg: AeBDiesUPrgVexSvv1SjY6HTUy+0mSbyLdf/1uR5yxyz/Q7tUxGEFdK5c7yA2vlzIiX
	5PmPHz9nNFFQEbdoimiMqYQumX+yivsOQaM0zzHkNS8FZXxfG3V403ZvXmLNzwuDjECchGBGwKk
	nQjurgCrc575u6l/uo0YYGm8QgAkqxRpBljDHn7ec7n+eewTrUn8WsLXP41E2QKTGGPsRvjQFJW
	I2PwXD2SloCklcTJoGaV7+9o0kJbPm6XRpGxOtj79xd/SpFInMc4iA2mPfNpvreCympXhgR5yLQ
	c+JOSLRK10k3uabi6k28Q1wgc+4C7XEU/e/NQ5yXXHOCDGMUwqPyH9Yk7GkUXaQHSWQurw5lIbW
	ZDAzs29wntJMpYuImaA==
X-Received: by 2002:a05:6000:400e:b0:43c:f7e5:817b with SMTP id
 ffacd0b85a97d-43d2928f611mr16359770f8f.19.1775439132847; Sun, 05 Apr 2026
 18:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Avi Radinsky <avi.radinsky@gmail.com>
Date: Sun, 5 Apr 2026 21:31:36 -0400
X-Gm-Features: AQROBzA3j2s2NQMYcQWfo_HArGSVTDexkk-MQM2xoTZ5dio4YbuWIuqeCIsmH_w
Message-ID: <CAK=E+3BLMV35g1hC2=aQ57yKxgw1y8qR8ufpHQdKcx4MdT9ioA@mail.gmail.com>
Subject: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to YAML
To: alexandre.belloni@bootlin.com, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert the MOXA ART Real Time Clock text binding to YAML schema.

Signed-off-by: Avi Radinsky <avi.radinsky@gmail.com>
---
 .../bindings/rtc/moxa,moxart-rtc.txt          | 17 --------
 .../bindings/rtc/moxa,moxart-rtc.yaml         | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
deleted file mode 100644
index 1374df7bf9d6..000000000000
--- a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-MOXA ART real-time clock
-
-Required properties:
-
-- compatible : Should be "moxa,moxart-rtc"
-- rtc-sclk-gpios : RTC sclk gpio, with zero flags
-- rtc-data-gpios : RTC data gpio, with zero flags
-- rtc-reset-gpios : RTC reset gpio, with zero flags
-
-Example:
-
-       rtc: rtc {
-               compatible = "moxa,moxart-rtc";
-               rtc-sclk-gpios = <&gpio 5 0>;
-               rtc-data-gpios = <&gpio 6 0>;
-               rtc-reset-gpios = <&gpio 7 0>;
-       };
diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
new file mode 100644
index 000000000000..9693c96a9f27
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/moxa,moxart-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART Real Time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: moxa,moxart-rtc
+
+  rtc-sclk-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC serial clock.
+
+  rtc-data-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC data input/output.
+
+  rtc-reset-gpios:
+    maxItems: 1
+    description: GPIO line for the RTC reset.
+
+required:
+  - compatible
+  - rtc-sclk-gpios
+  - rtc-data-gpios
+  - rtc-reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+        compatible = "moxa,moxart-rtc";
+        rtc-sclk-gpios = <&gpio 5 0>;
+        rtc-data-gpios = <&gpio 6 0>;
+        rtc-reset-gpios = <&gpio 7 0>;
+    };
--
2.51.0
