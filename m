Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416660;
	b=iDw/UHTfBxdiOk1XeTUZlhLafXeUfICUSvwCQMSEpjpSI4eTLjOKgOqnw4urAamDh9im
	 EN14ZStrKOVD6W5vOXLf8mghOLWw9GHe88gN159Wqol4tfKAw6mLeyHnMJaIQBfVzzE9I
	 KTMyl9h+xRsd+J7udNcJBr9FfNerEnpqdWVhu50VbZjq1zOq/8VAc8I/8u5N7tgKuCJE3
	 ra+ilouvWOMVol2GzPtaOojNjKW3JyhpJmy7Ca/JWHhWxRSmqzVIocdVLrOPIgj3kl5JC
	 XI2MTxkV/b+TE92LbSAxtZjtRePJf18+1S1PWzmqEtzaa/DOajVFddSaHC08h870lIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
	b=1uib+5E39b+likYZBSZufNBG2Cp+GWt4rPt9JjcPQUQV/opp0f52cMTSvL+e/Cir0tG3
	 jUzLo0rTIHazXEgBqwzq5hbDXSOEP0QSVwxB25i4/VtawBr3Jy+559Dx6PSRBMHKca+CQ
	 7wq2Cn0s4mBVLLaBNCaMamZ9d1Ja8XNUzqWaUSSYXwuTqepO4TvhdLWqpcfawObFQWI0e
	 GQx3S9Jw94iZdnZJ8v4oUcjUldyWT2m9o3eX6L1Rm0EKK2RAzTSd4JV8W4blDgJ6cMdzL
	 pdgbRe5zQvFJOTseX4rwp2OyURmBYcO454sOSmBMQxGf4/niWloTaHHgCAx1dl+Wa5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osGx5X4K;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85070606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85070606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osGx5X4K
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f01f296937so22850215ad.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416660; x=1796021460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=osGx5X4K+tP+brbe/Jq/ezSTXsZfwiId4NNXJrH0yADP23Nwe39iKVSJ3IkHvvzLme
         TQNQ1Xc4iwc0emV47AeRD6FP4QvRsBCMQGp70itnWisvAsmXACYqaG6etG2T4kLqqtlW
         fQS3vm8BS+m5fBYIC/rxNAyOeaQAwb/zsVfEd6XSXe3ANb2Cuoac1lQowb99dCTLmgeI
         2RSHWhc83UwWAhymEhfK9EerVVLUqnJ4duhY7akO8IK/AWiq+gCrciRbxOoCcidp//k3
         1SLxZq5kUR3GMKXa2nM1cAyYy4+/VS+ApvakJ28u6hDof96f+u4v1dfpzMWK1lDZ7vd1
         K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416660; x=1796021460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=nju6XZm+zkKDHrM9nF+Gy8BFjFDgtMTt0lt/tXLBfcdkFQHw6rErq5v1St0fTUkB92
         bRV+JOZwN6x0/Z5JyTpuLGIHFxOqmL3rs4PNH2OOERgmurkYgbK3cKNUC6ImUVzZtCHO
         NMz4yHEns04UHCcSBHu2bKXiwZwpRILAS+yePeeo7PlaDdhGFqFaXOQSfOpuqr5aD94s
         IQPsgEocIHasiB4IW8WNwsYIpKi3J9Pi3AACHBaN3zFCW6FpqM5RLzu02fxnjmzqN67D
         0l+62LiXRLgnrXJfAl3aNFUYl4qmkAlBjbJ5LZEPYzIihydwKKgpEU20TkO5ozlBBbk2
         Hr3w==
X-Forwarded-Encrypted: i=1; AL+hErE9gYhoAxoW+Ck5XyChdVCs7h+v0sP7wJ2lWyusn23mQa0bf6gzDddB1WtQN7zzYGAO2xLRDMDwFSEs@vger.kernel.org
X-Gm-Message-State: APuU4Z/qJ7lMCEHglRQW7kXY0wkUkhhDrFIbES2qqfngrPh+R3JnRa5X
	6QtlxC00g/e0znt8rVTsh2rZU7D33xjpGMEvWInmvo4hlsCjSq4w4IXp
X-Gm-Gg: AZFdTZctOVrxHn1krWZpWOJ2MLGv4+dEL5nAqsmxrbcIb23UGlqoisLWZ5Ud3YTz52x
	wzSrdfO5V0XU8vtP31MqFY9nU4OQbbfOpII4pC9EsswUjpdKf4C6vDNlGIA4nQmXYQGwnMttsmq
	x6pCKf5NLrlw5NEFZuibqx+tfRDKomys28etiJl7bR89tjHmXA0yjvbqThcOAvezWB46W0uUr3H
	1oTZ3BKpA2itLE8vm7ZrC/pjWkadLjPl61ZarpZmqwmxtijaNfdgqcYp7glyBT85yZnh4xM9chE
	iSl30pmhqmbu3HuZSjd3seZXoGyFkXzHlBmtpd7GXDwu/J8LHFxN5YURfPbhSAW0He51Ed6txqe
	yjJN/SH5H9CrhPhj04S+KuUpDY+XVKEqZb/+pwrhT+2Ao01npnRFjUlisUfLJRNTChbiOZhmulf
	4K5QsTDouYCxx3rQYxiO4iId0lu5XieWlq15cpw0LQTQBrvXIASQsGorbpuJ/mZuod9dGwJl0/b
	u8N6EBO/MXV8YjllOynFWV7WDCSb4TAJi1ntXtVa5Ur0NQAPoQsLk2gnZjX/5rkmbiJuyeGHlDJ
	GTCcQc7sLZGLgDlJO7WrMv8hMh+O+V2jrWM7f7ZOs8SeRT2j0zMZYjgiF+98HbMChkg8BEDG8tx
	YampI/omziC50xQc=
X-Received: by 2002:a17:90b:2ec4:b0:3b4:1934:721a with SMTP id 98e67ed59e1d1-3b41c9613b0mr10185031a91.60.1795416659799;
        Sun, 22 Nov 2026 22:50:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:50:59 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
Date: Mon, 23 Nov 2026 14:50:05 +0800
Message-Id: <20261123065006.28768-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123065006.28768-1-cwweng.linux@gmail.com>
References: <20261123065006.28768-1-cwweng.linux@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add device tree binding for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels and uses one register
region and one functional clock. The binding uses the standard PWM binding
with three PWM cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..47a59bdd14d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nuvoton,ma35d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PWM controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pwm@40580000 {
+      compatible = "nuvoton,ma35d1-pwm";
+      reg = <0x40580000 0x400>;
+      clocks = <&clk EPWM0_GATE>;
+      #pwm-cells = <3>;
+    };
-- 
2.25.1

