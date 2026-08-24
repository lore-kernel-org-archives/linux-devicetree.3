Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DB394E91
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569488; cv=none; b=VSYIa5hhl1l321Cm75wGP8evHoQIXpD/yDMoWhnZTII6sdD5uW/f3kw/H1yK2trRAEpSRlpW2w6BDYF8lfE/qSX5e5EWfy1kZpno6UhUfY3TT0MzeWcoZNJwb/Y6oPNjAfIAtgz38pXjsAEKKdQTkjKATn1XZW0bEMecARHqVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569488; c=relaxed/simple;
	bh=3QfgIH/GgpjZ3VkdsfXWUQfOIdxeyEfDrjW0KFRGvA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CEwxFZ3GfI2Iq3fPksqhNuL50mT97UgRlDtDyn1qd/FJJ92U43suKAfa+VfJApkioOmIe3TDAPZPZnDA4vZFNHPzANzGQWJGPXFvkp5m6LhkBQRvSI/4tyHeGfWCI+mN1Z7HMkNd0pYBCyZjfjpFVD5ixI0ZTJymvGBHNpU7fnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mFvuDLDJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mFvuDLDJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c197e7e4e94so588737166b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569485; x=1788174285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxuxqWbvyXC7ugR8MRCNznILz1F4+G4M9w5UTCg9J3I=;
        b=mFvuDLDJD7en2Q5ej4a2IkuH5R5F5cD/AGLPKkcvdHdSk8M+eUGSNKWfE0w62liUs+
         i3g4CMN4aeoqDHfr/d+EmhLPeuVvadt0QCFVL0FkTRiODTtqpkMaGqIk5hbz/mhQohxd
         EiubX3k927920CK2YFvEypKTG2+tdCoudTG26AiLXq+dZNVFs31CM50HLAhqUYf74Bw2
         x1Yv3RQuSeVgRnHdjdAkoQpqAvGLdL9sd7HrjUaLZeHN5ZQF6/dA1Dq/DIUT6poqIilq
         VdehDcI3dyi9xlOiwCij7mFCuZTDeMZQsJtT7FFmYpHz5L0D8j+QWwMnhxH496BUF8b1
         k0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569485; x=1788174285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxuxqWbvyXC7ugR8MRCNznILz1F4+G4M9w5UTCg9J3I=;
        b=CoBZWBi3ocyN/qofx0Y3rMFu7Yh4wtvlNygDWbinwSwTRFMM0IDQCGGWC8A7rVdqVv
         bBpyc252JFiyLYCaxG9arikrJdVi7vsZRJ6MORc+tHUhi+ng/xRbqhbsNjHm8D0TfNem
         c8b4Mty7MDGxz4qL8AzHrB3GjbSelJllUMRoxnVcQnLdYYHP6TNON5BczemQxYUN0z8I
         z61NOHjuCgoj8BWXeIW0NVHfSSJhJJ8BV9DMKsnQRsgYxCtsEhS/CXTxArBt/YIZsP+N
         IEmp+EiFJSIP9RANP4wQeL214XQHSQs63EKrIZZ84UkAYI3nSmaE7s4/tSlM9MVa19is
         Qldw==
X-Forwarded-Encrypted: i=1; AHgh+RpqSTsE8n+XOgxjAgtORcf7XEd8ozcu1kNf98KVgTZeKr1zpC3kxjEcXzjCThg0FOTyEo6ZYpTLAxrL@vger.kernel.org
X-Gm-Message-State: AFuF++kEw3LcljIIrleYT6NWg7KDTxoLkF6zRQggpUK4kDkVs47O6IF5
	OJNzmkjLcz4q3meNO4xnfrojtAwzjv+XpsP9aEz/XgJxQUJOsi4ue3UI16XPkBMCHXc=
X-Gm-Gg: AR+sD11q2SVlaQd3PpJhgHN+qrVwikVgAqGRDroiJGgNxyZuxArwMCLk+9ITwFHhbEs
	YcWZ5bfTdNYsZFyh//7q0qI9G30d2okd7UUnq8QNtmjZIIvgpLAadyOPFpdTFFJfZZyn+HXE5/S
	e9TTT8wkJIK3SnIZMEfV+MOJxEF+XoIqxXhCYn+3tMDUPg/TEWbC/iwEY/DIqEsS0QVkMOuMfks
	YnzYVxFbRSAKn5aYrOOt13/heEgbC2Z+l6D9HjIQJyNBL7FrLqmRW3HzMFeO2+Iuy+grnne9XJM
	pibhcXyHNtnwgOeR1A1D5ojdupglRACvnowidUPJlTKa6GQvdxoNBx8+TKYJJCcYdFGiDrPYR/5
	X2ekzg9hozb32N1dgPh8Odkz9rSKMcjAY8yJWwKsPXepOhjwc/klM8Fm44II24gzqpuWY8p2pOE
	k0A/o6o7/h+1jUNQLd1D7VWX0EPmnbrqegDAPvSQug1Mfo5YLPukB0PFUbcUm0A8mxmrvl7g6qO
	WsK4ktimVBWbs6w5AJ6VgQo4wkRLhpAdzRIrlQyGoDSSGv60NvhAcZqeTLLBkPSHbNsHBGpDPNr
	PdDbsm+9l2kb8cDStaZop4Ej7XjCsrHaqRq5Ig==
X-Received: by 2002:a17:906:9c93:b0:c24:6687:bf6a with SMTP id a640c23a62f3a-c2492663ee3mr1888041866b.21.1787569484828;
        Mon, 24 Aug 2026 04:04:44 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:43 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
Date: Mon, 24 Aug 2026 12:56:49 +0200
Message-ID: <20260824110432.1074136-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDHCI controller in the LAN969x family is compatible with the
SAM9X60 implementation. Add the microchip,lan9691-sdhci compatible
with microchip,sam9x60-sdhci as its fallback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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

