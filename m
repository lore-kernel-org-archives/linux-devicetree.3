Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A13A1A3B
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403509; cv=none; b=l7YAxTxw2M8v409vWm4RkdaSdF3Bk5hxBUEcr8Y45iFNbGi9GYlyaBMDpE+otacXz/ciFwcv99vJyqXnntUdo7CPDnsw3qwssb53YAKRU2ERyIUYDSL/zcphENOisszKWK+IpPMlJ+upEzSVWc38SnSNiwJ6NN0ZHkCtFV6bGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403509; c=relaxed/simple;
	bh=f5C4+Bt5ugEiy2LVyokcq17w8vPsIll+88We6QbmemE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaMpYMEaCEnJSKiXYzNmX/4ktpiTbeHLriBOgxNgdCjZtN8Ss60axdyZGj0CjCG/VH3TB/iZYCRlBl1v1xIxRQHZp1htmM4JDU9NY3bzbhuCICMm7SQ4q5OQ8COyWl32iOLTV7YQrg+Oa29VscDeY1d8SaxnZ5x6ZQisenF0y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irtaw5nb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irtaw5nb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so1318133f8f.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403505; x=1783008305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjKkKqp9fBdZiADoXkPIOzR6TnKUMV6AHpcUuhEviCE=;
        b=Irtaw5nbN4SvenQo3FpAg3NpzzAkMJtoyybgHtk+XnSgILrcrSaLWXHMKsZ+rtOymu
         dvn/+Qg6nq5+uKO9/nFeyKJy6s33oYNsCOT3QXTlmZP2LEhi9wQgyzT09LMl7rcaruRN
         wRTQ15fRMcZg/LrywQpd3gD5qvvmJmXEXCzPdvfk67HI0aYJk5YU8C7sZohRy/C1D5fb
         zrpn5d4jL7PTToey2mFhdC1+Cn9iIcjzQE1PAy5oMws1f6+kSwjA9A2LpcSXt/Jq/bRk
         DtaA89mmpslcQPElZmwV+5bKZYGJ5zgE/2jrjBFd0OsrjIbJw0G5LpRau7AjeaPUbDKG
         iU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403505; x=1783008305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjKkKqp9fBdZiADoXkPIOzR6TnKUMV6AHpcUuhEviCE=;
        b=cH0HtQ2D9u1QpxjsH8iYrOA6T0VA2PTJL0dWKyYxbonvcc2NTes88ZMsTHrZ23PXlG
         6b9lhPEyifI7vpol4EuSHbrV3Mjr+7iYOVcDLBblDsmlycH9R7wU5FsU2ZqFmWd1abnK
         7ia4DbCZseaxNTiQDlrpzUMJQC2hHlfapopudK8FBvi2ouFIYVAktCSYZOxqvP5Z6+kX
         curcdLqpz2avL0shOLh+otiEKgA7+lW1xPESUz0XUmy6HwRC1iUDQ++EYnOL7AwdFVXu
         HgqctIFEBr4FF4b9PZ60zNhxLL7+CBZ5ZmAuLv9CGgk6DWcq96z1RtRndKZzOmBbHXBZ
         nEpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gPFwXCRc/9SzQvk3lYdb/LZAD2GljfwvxvlfGqZBaiLK+Y1pqv6rAgndC3J5eNruCWiHUc4nVATQC@vger.kernel.org
X-Gm-Message-State: AOJu0Yztr03TkDUVrWSKZQZHJJJf98Dthb2ifm97gDHFzeJApF0c89No
	PY5VEEdAPhqFUNcGvicW3nAsnUYqcMc4jZ4XUyeK7yDA69eMrPNIv1T/
X-Gm-Gg: AfdE7cm1fnglO02ZCYj7tYag07wCU9fI9ePgd06MdrhPSu0tpZnNUVPj9wk68Igt38W
	cg6Jmd1+dkx9o1gKp87+jaoCrliXaoLlzNAapFS73H8MkX/FKjaCmzhKt+ItLmtHLMoxQ+JDl0d
	oRbBcP4t232kxpgBvlcR9dm1xwbtoq+D9JDUREnWNJLq32f43r9jq7CTg5ysACPhKnP1U9MqWtz
	NtgHxR5dhRzJzwpf3i4VXbpVsshF3EQrTppg3n+nMNl5l5io/soatlTg8OOid/WDLpe92AVPriY
	XIADwetSQl0mikzWs0xvczjoPpoZC3C0ZAe1LXEjYzL9bb3sRfSEcrZf0Fygl1c1PUQUyRvZkxt
	P6JKjefFYGdORYldniXv/tRBJEjRIEYG9F93e+CB9bJPneN5mxieSFaCNhDdwh31HUik+dO3qqw
	khsdqoxEB5q0udknwHk6v3P6AomKjeVTR2jWccstHIm6cG2kxFCuvJ0BETfHyMGw==
X-Received: by 2002:a05:600c:4692:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-492668677ebmr48000945e9.1.1782403504589;
        Thu, 25 Jun 2026 09:05:04 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926543be74sm52220975e9.1.2026.06.25.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:05:03 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: chipcap2: Add label property
Date: Thu, 25 Jun 2026 19:04:22 +0300
Message-ID: <20260625160423.17882-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property similar to other hwmon devices.
This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
distinct names to each instance.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Implement suggestion from Javier Carrasco as proposed by Krzysztof Kozlowski.
- Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.nistor@gmail.com/

 .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
index 17351fdbefce..56b0cecfca5f 100644
--- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
+++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
@@ -45,6 +45,8 @@ properties:
       - const: low
       - const: high
 
+  label: true
+
   vdd-supply:
     description:
       Dedicated, controllable supply-regulator to reset the device and
@@ -55,6 +57,9 @@ required:
   - reg
   - vdd-supply
 
+allOf:
+  - $ref: hwmon-common.yaml#
+
 additionalProperties: false
 
 examples:
@@ -72,6 +77,7 @@ examples:
                          <5 IRQ_TYPE_EDGE_RISING>,
                          <6 IRQ_TYPE_EDGE_RISING>;
             interrupt-names = "ready", "low", "high";
+            label = "Room";
             vdd-supply = <&reg_vdd>;
         };
     };
-- 
2.34.1

