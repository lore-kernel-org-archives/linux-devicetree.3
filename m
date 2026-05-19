Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2540800A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204498; cv=none; b=LKIkdwxBr42eCaD2aq721KR85DOjgoCXHVYQQJ4k0TE6tt1P4BEJyHRvGf8XZm/fKteK/hsfJOPQBuH7PoFZ2qyHC+HBUyjxO0L1ken3a4tCjWzvrL5Bk81fmJGjZTLp7TUcIfGo0jumZhLgp5kgWp6msDZNX4W5isgimNsZ2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204498; c=relaxed/simple;
	bh=fMdQt/aGSLfWf1IFgJvS/76+p2Aty2j96FTfOBL2lgk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQN0C9sSEU9/EActGEu3Abma00xnQ/cMjUQRSrNrnIRIMlGxcGbg9FMfe2Hlj/oAAcui4yq2j60fsxmc67gvkrZvvy59EHXHxbdxWk5gUZjm573RD/Kd6kmN8FGRxcg4BErcfnVzSxAkMbBthGGwvGJ1f8xxs/x/6shBfv5tOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUdPF6f6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUdPF6f6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2494483f8f.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779204496; x=1779809296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtE/izIKPJg8dCdDmYZeqnA+KX0HuBWWzPxI6Am7M4k=;
        b=jUdPF6f6lGTY5p3sx4cYFo1GDwd35Se0cAbVaKKHVAyZfPZQKp1yCDy6utiUE8LSZc
         0xvO1fQO6DrYLT5AJdVdGJGtYktUZCiNol+jh4JP1LFciFjmmEKax3hQl1Uz2ob8JUfP
         5VGmuWENnE+PLhXwEgbx4Y/1+22yYmJAx4F67eRd2aEu0wyMOiGChds8RJV6TncIK5qY
         gyw43cw3ZehUYTBsxj+cKY0fUxFTjVhyiqAsMLLeISUH0sy5WPexOwzQ9zWxKzQDQ+x+
         qJRKw3jrYFSbCdaBDDbdjWwK4ysj/OxPoyQt6523QZyNHc1a5nVztIssyCeYLqLFRtRW
         NTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204496; x=1779809296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NtE/izIKPJg8dCdDmYZeqnA+KX0HuBWWzPxI6Am7M4k=;
        b=FtITDnCZjgh4S0fOnqsBdp6sbJwZcgZroDsWz0rmrY7QY1oeEqzlQ8wF7z/O7nBAGh
         Ts7bCj/2AsU8WSvkb7UpT/wx3quxkdC8p6kZXbRC67iaDXeCixzNpRMtKP2u2CzTcK1i
         JuwenY+hhtuxSXys3Z+pZOjgvpcFW6dAoOSvm5qNODkReWvoSQmI0xnHFmM64RKRz6Xk
         J/S9l2lKRgrCj8KeliBSH0aITkLTHwsgE/xUkBBka1UVDSm9PPdv/rB4mBWK/wmmTgst
         A9qzD2CZATAh1tbDlnT+disv6O3fxwPbzh/1BFAUnUJO7q64TAWGXw0FootPgnxVbI1k
         MYeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4tKG+FukL7aOx3MRYY4jrTAvC/iDUfDrKEtwK1BD6Hhcu8pYTlZZm/szLJnMb+WjzFZsql4Ot/lsP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79OmTdgWouIr6j/oQqP/jmZnYBiAiDG1TsJwSUV8iI6quBepL
	aTc6kNaqg11BPs0vOPkFIJyrgUqFVpNRShI8PRaJOClxC6TcGx8cVemm
X-Gm-Gg: Acq92OFou13eYHzVD7K9QkPgtAiQZaIsWi7Ms0ad+GJrsZMEfUotn+azMqIYNqCnhKX
	I3NSAFHykgVDUuhR1NpXP6tDkab34QZtK/iU04lRNZJ+6w+rf3Q4LUisMvWJs4wZKMMQ78sg977
	c9h7qmdPYIdi441oiTzI3Ed6tROng2zvvOWCjOJiJALWwUs9019EuScM1aeuDeGB6XEElZ0Qix2
	pBHVNMJFhvaFKExcDmqzCGUcV/saFYs+jrvmq3ibPxbfDgCoLugtuWqGdcC43xKrwzV6EUdavdc
	L3rpZVSG4Un4ubRy6ZL0wgFc9SdCiWLLlHPyZNK618o0ZnDVzynGCkaXrkFyKo3SICWw+hePlz6
	gnmaKjbsvCcpmtxcDqr6/5Fn1onDMUoH2ZYBr5rzT6UVwQ7GTEpuUOTjH+RbOuvzfuu7U42Uyi/
	tA/SU5H1z9UhrjU3bIyJadU3nuQ3enti5Qqdg839kVB80cr8i202kK8OaJcwQrSmZkY5FM+sM=
X-Received: by 2002:a05:6000:401e:b0:43c:d665:3830 with SMTP id ffacd0b85a97d-45e5c59540bmr31619437f8f.32.1779204495541;
        Tue, 19 May 2026 08:28:15 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm49005662f8f.18.2026.05.19.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:28:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: nvmem: airoha: add SMC eFuses schema
Date: Tue, 19 May 2026 17:28:05 +0200
Message-ID: <20260519152807.29407-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519152807.29407-1-ansuelsmth@gmail.com>
References: <20260519152807.29407-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Airoha SMC eFuses schema to document new Airoha SoC AN7581/AN7583
way of accessing the 2 eFuse bank via the SMC command.

Each eFuse bank expose 64 eFuse cells of 32 bit used to give information
on HW Revision, PHY Calibration,  Device Model, Private Key and
all kind of other info specific to the SoC or the running system.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/nvmem/airoha,smc-efuses.yaml     | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
new file mode 100644
index 000000000000..c52f8d4bec39
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/airoha,smc-efuses.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha SMC eFuses
+
+description: |
+  Airoha new SoC AN7581 expose banks of eFuse accessible
+  via specific SMC commands.
+
+  2 different bank of eFuse or 64 cells of 32 bit are exposed
+  read-only used to give information on HW Revision, PHY Calibration,
+  Device Model, Private Key...
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-efuses
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^efuse-bank@[0-1]$':
+    type: object
+
+    allOf:
+      - $ref: nvmem.yaml#
+
+    properties:
+      reg:
+        description: Identify the eFuse bank.
+        enum: [0, 1]
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "airoha,an7581-efuses";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        efuse-bank@0 {
+           reg = <0>;
+        };
+    };
+
+...
-- 
2.53.0

