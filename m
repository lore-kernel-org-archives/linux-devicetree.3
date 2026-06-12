Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB85282F06
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268415; cv=none; b=nXOd0pl73a36ajDecQyHFcHr3fnzdip6S3y50LDPf55iC4pNdVkKppbWOpKFIQ9Daa0u3uLaWQYCb2pwQQIwqgcsZInwlvef4uAMrNf76XEMfVjqGMt0TQqrweYUKjp8GVjGn1dhw2itFIq2ZL4Tq15QIkKr1iTAQU+yIGQKW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268415; c=relaxed/simple;
	bh=OeCMVr5zr4slBpySTy0rNlGp/yvw6DNLdo99ezjEHFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibliaCC/3Z5wmoM6PjI4HU0gvHMJVPpJutNa5cURxBtN+iwqlkosFCRojMwbSc7SQXBZMWGxn8ztnD+3VqTIUAl7mrqvk8gm2VCv5ENxhqwyo6HWV+zHPT+F81iwGbmCPa+QA7IJlAdv/Fr9F5UxB///rj1fwc5QwK8IBYLD50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c132ac5ec2so9410635ad.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268414; x=1781873214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1ga3PlRn9GakSbw7BgrbomeeCmUv0p2MhtufpPdTfQ=;
        b=d/GkLgCRAWK0czAGWxhIZFAWw9wBihEWyTLsMwkDblSNOD4CYPSXt68qqb5t2GOWX7
         8NDjj7+83CmnoV/mnKn/02ilZJnR5SYSBKGmXs7X1h33NBm3FdIHT9TXXu6Wbwi0so08
         X6ZfGanOSGVP9A9suN77nK00+DpjHpla7/s2wKAwlTPY87DR/T+iKjrQBIRCPGrpVSDN
         qM4mCJCKy0tKN6lGUYT9vb+Gm5B1awccJ0VYlDjyxvMVJEXQQfGOurcbGwDf0bkw3xin
         fVPys9ufjBPu/RGn4P/xo2lVSM0Yxzk3Jg5e9kooyj0U7bsvOyV39IqFmUE4n76VBasb
         92jA==
X-Forwarded-Encrypted: i=1; AFNElJ9Wx4TgU6eZFCCGi7EZFMXn7CYueTG+4qfuiZ+kP3S79+bU1GDzE4V5Nvhk2MzJJrK6ZZ61X5dLuTm8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9CbZ75dDaoc/cyHugBzBwz/UDCN9G1j8fsjMbnocp9v6YhSY
	U4/E9aOsNQqzNH4UvJ+YzMKtFwWsPc8IZT0zqAUqH3xp/8Rm5sAIQPy0
X-Gm-Gg: Acq92OFuGcAvgHp6NlnC6hyqV/IThsgK0Wgu44SQv3Ls6Q+qHpMn13uNBt9wt719YNH
	EBY1EvxJJMiRVgB+QvGhV8Al/By8y4vq1P4vkrhDbPi1Ui6x8C2bZ5MM+3pdTgpf8W1DvM4h4Nd
	hzkX572mi/NsumAm1jm+kbzXrFTVjkqR1BkiBylPsU6dUr9V7S19qFqh3g/SMx4uvWOBpvA5dJC
	gwe1l9vdPT8Gortsvow1TyT52ijrlhjM19tfLRs8Cjks9EtjJMOD+X/EY3Sdyv346hFIK5gtdEY
	q3TEQbjTyE1TOW3T3ns9pRfg7aTlMnpK8RbYKA5BQvVjPb3Z2QpISEvtCfaEVdAIVHj93+A/R5C
	eliajK6oYkxkOhi7D1Eaqme6ewbteYWBJ9SIUJmxHvms66Thqv3dnE4mXF8R8F+L+V2eIuYpaZr
	mYIxY6yL8z0ZwnYWjubEZdX6Im1fDzbe/7rUDh0pMGYJBmHG4nuB3siNDWVdHL1TG1gYAlXNjpj
	bB4tgW9Sv9g57jdAkNw/G7KnCkUP/QGnlOzLSk4KDWhtkYp6TSFHUrDH6Y11aLeSppU/V7KpHOn
	ilDzcA==
X-Received: by 2002:a17:902:d2d0:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c412550f4fmr35794475ad.33.1781268413483;
        Fri, 12 Jun 2026 05:46:53 -0700 (PDT)
Received: from fedora ([42.0.4.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm21115625ad.32.2026.06.12.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:46:53 -0700 (PDT)
From: Siratul Islam <email@sirat.me>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siratul Islam <email@sirat.me>
Subject: [PATCH 2/3] dt-bindings: iio: magnetometer: add QST QMC5883L Sensor
Date: Fri, 12 Jun 2026 18:45:26 +0600
Message-ID: <20260612124557.13750-3-email@sirat.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612124557.13750-1-email@sirat.me>
References: <20260612124557.13750-1-email@sirat.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding for the QST QMC5883L 3-Axis Magnetic Sensor
connected via i2c.
Interrupt not implemented in driver but kept in the binding for future
addition.
Used enum so that more driver could use this binding

Signed-off-by: Siratul Islam <email@sirat.me>
---
 .../iio/magnetometer/qstcorp,qmc5883l.yaml    | 48 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml b/Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml
new file mode 100644
index 000000000000..238cc7e22b89
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/qstcorp,qmc5883l.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QST QMC5883L 3-Axis Magnetic Sensor
+
+maintainers:
+  - Siratul Islam <email@sirat.me>
+
+properties:
+  compatible:
+    enum:
+      - qstcorp,qmc5883l
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply: true
+
+  vddio-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@d {
+            compatible = "qstcorp,qmc5883l";
+            reg = <0x0d>;
+            vdd-supply = <&vdd_3v3_reg>;
+            vddio-supply = <&vdd_3v3_reg>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e035a3be797c..310074b34072 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21787,6 +21787,12 @@ F:	Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
 F:	drivers/bus/fsl-mc/
 F:	include/uapi/linux/fsl_mc.h
 
+QST QMC5883L 3-Axis Magnetic Sensor
+M:	Siratul Islam <email@sirat.me>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml
+
 QT1010 MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.54.0

