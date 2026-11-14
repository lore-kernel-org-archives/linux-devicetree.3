Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655347;
	b=SafBRzAeewfQ9Fj82dlJKTm0uHvN8nTOOR6Tcwgy/J5oFOc18p03WGrEjTs64v9YEXXL
	 ELXi8av0cGEQYCt9OoG7PCeL4YzawwKrepflHLz3UDVyprJTwsuFTPrlDWzU/prv69gHE
	 7aMlEzQcx63+/r5/HrbiwcBtYxZywZTI+Bsn6wQDzzc+c+zsffx5rslf52jTtXkSbBWmD
	 jQG7zzIpYl2N6bgXdbqqWyz55tRuseoB8Vc1LU4nZUYalWZkoqpNonB6oSSRYqpo9+gxG
	 Lx6GehJq2Z8nd9askmFqiOtLbJw/cZFDr63hK20KTCUH0MCgVqcpqD440MSWaHW4w2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
	b=T1lMUu2PBg+08SeHdw6c4QPJNq9K/h1ygcVpcfSQaQO4DzVUZGu35VLZwG4y7vVYzWRh
	 ArHhATE291i+gSr/3YgNXUZ6qCe7jY3FXbqnYdc7Ax3O+U7obi97KGsG0/WTzePmJISWQ
	 9n/hqSkj3QK4+5KjGbOTRhfgs7k20s7e2cCSzbPkvK5On4obUWn0CdDL/Wy8x+qJk2cQI
	 SprZQ115dFKr5EM3aHZXORveh7ZMKgMj/jJS6mMQOWc6ht6jUg6/+Fs0XYOSNUjmr7jcp
	 SB7cBPHvPV8BYH6nUMcZFUU67TYU+jeYMO5WeYvpSzDylAAY+T+DW4JU5Fgz3pMy39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/QRd9tY";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7DA606A88B
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7DA606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/QRd9tY
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b600fae14dso995326b3a.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794655346; x=1795260146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
        b=X/QRd9tYzMUrGM9ds4MFgmgnjgzlmMZQUvIuQQBK2gHq2xohb8KhWkuTSwbaJ74Zud
         UO9hYbk3WsKBa/AlLsZ5050aLkPgC1SNwvlVCpqzMuq6n2k84iJqmjp5Rm1UCcT3op+y
         RNQWzpZYbLmhwfEu6LcRUSg9ZERYaxvr7r5pPGBbHl8Gtpeq5uVVksUcIfOHDZWPslku
         7nYUyJ6/UWupvH5mxF7aOntC4A5NmIYdcmBI/AjUtwOM+2P0z9QrWqvVSMTn30+8LVEL
         sHtHLcNvup3KATG570d3LQ5Moy3R5T6+D2vBEJuTvAUlpEOp5EYSqHZ7DwipYOPn/5mL
         4MTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655346; x=1795260146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
        b=j7QZ3GcGueDFui/DZwxeiGH79PuxoFbYXM4tyTTqueCv/bfS/1QElA6nRW+zsa/1g+
         yexTw7PkwPy0j08ifQHHrQQR/eUlyeYvwmS7+lAwlGC6PFQuA+rugdt8VStLIZyeHiYP
         y/Ih0PYfZ0mgJINLcRI/2pp5OvQMJYSzyO9ns5j8KbVTWoT0UzGD3JykI+UputfRdcrL
         DDNQ3I5zg0yS0yIDLdupo/eCdd2/gVz1Z6FUbflkUvwRbAfFOvPNglAxGYTPbiziCqYr
         qhm+Qj+/H36iZf56/bF+MBlo80JCE0rYdIuAkolqhGWunsPceQmNfTZc6A48tZ6EmPh5
         +R6g==
X-Forwarded-Encrypted: i=1; AL+hErHCr2910ZxAi4m760+a0fzVnb15t18TuIKjMZjwZyFQPibKjtyMuEAC2EpU+THfuTACgnvuGd5Avxbs@vger.kernel.org
X-Gm-Message-State: APuU4Z/2FTPNJuch5TClRkCSbD2VLeqycQz6SDzHkLgNtxrS7EVKfTrv
	Tqu7x0Z9hD9+seEhEEVaD4Q1o9YDzPLuzIZrmwCszMvjMaQWf0eKL9Um
X-Gm-Gg: AYBFou1W0J4UP7YV0aD17CCdnWZtXrCx1vOXTkXz2feW3uQpMMRHCKLJNxE4wn9vnk3
	azQiyjXP6Gveic6lqMwujaJhmASP5e6CiLT/OSsJhggYuLE+I03kjKfMfOqfuSr4B/uRefxQrfp
	7eA4qZJsieBtG2QVblYCY2rlWZUXw/g+FP8632DZDib7oT4XaAL8ZPnCtHiwiF6t0fR3zLw+/qG
	/mOuZ0x+SX1e84Ya/CqwlITzkSYT1EomJCPSDwc2u9kUtv7dmtdcZ/R79WO6yMFlMCfB+PO0Oui
	Hk1sbJFjcWVaXpOc30zidBig1gmyp8+uPuLpQBNqNIcOvBfRYcfpyFea/tvcTEO1020Pg3XYdvT
	ZMm/ck7VvaJJ9KUTVlEAzw3K+lyUTLoR+UuwVgDM+LXWXHXiZyNZd0SjYMSMNduLFTKs46ADi3e
	scg3vUoi/EN7K0U9Fw25LJqDPct0b/esuYizfFNNyWTtpqNofB/BCZuP++lRx4XpbqvkkIaEDsc
	g+ogvVM8G8yAcyJZMoyCLbjGqLX+2lPsuk6zMzUw2Fb58FyYWEG5AuvrEaWmkcKZ6Wtrqto4Li+
	b173+g1yF+Me0qKhd0zXKuAh7khBCIDm23Wfrz7y/+qw/DsWGHjQJa4vBwuzGThUfPvL6KKmZua
	61b/0A7QTPNi6uijNnuefH+W5E8qGZ8E6KYhCFnjh0Dcy2aDOZGs/zQjX7s8kSiAe9ZZ+AQ==
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr4900156a91.34.1794655345714;
        Sat, 14 Nov 2026 03:22:25 -0800 (PST)
Received: from localhost.localdomain ([118.68.25.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm3981142a91.3.2026.11.14.03.22.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:22:25 -0800 (PST)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Connolly <casey.connolly@linaro.org>,
	Adrian Nguyen <thenguyen1024@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Sat, 14 Nov 2026 18:21:54 +0700
Message-ID: <20261114112155.85068-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114112155.85068-1-thenguyen1024@gmail.com>
References: <20261114112155.85068-1-thenguyen1024@gmail.com>
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

The Qualcomm SMB1351 is a switch-mode battery charger with an I2C
interface. Some phones use it as a parallel charger next to the charger
in their PMIC: both take power from the same USB input and charge the
same battery. On the Vsmart Active 1 (SDM660, PM660) the SMB1351 is
powered from that input alone, so it does not respond on I2C while the
input is absent.

The SMB1350 has the same programming interface, and the two can be told
apart by their version register, so the SMB1350 gets its own compatible
with qcom,smb1351 as the fallback. The version register of the chip on
the Vsmart Active 1 identifies it as an SMB1350.

Document the chip with the battery it charges and its STAT output,
which it can drive as an interrupt line. On a parallel charger,
power-supplies refers to the PMIC charger whose USB input also powers
the SMB1351. The SMB1351 can also be the only charger of a board, with
no PMIC charger to refer to, so that property is optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---

Notes:
    Changes in v3:
    - Drop the Assisted-by tag: since commit 1e035297ffda ("docs: remove
      Assisted-by references") the cover letter carries that information.

 .../bindings/power/supply/qcom,smb1351.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
new file mode 100644
index 000000000000..468899c15fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,smb1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMB1351 battery charger
+
+maintainers:
+  - Adrian Nguyen <thenguyen1024@gmail.com>
+
+description:
+  The Qualcomm SMB1351 is a switch-mode single-cell battery charger with an
+  I2C interface. Some boards use it as a parallel charger next to the
+  charger in a PMIC, taking power from the same USB input and charging the
+  same battery. On some of them it is powered from that input only, so it
+  does not respond on I2C and loses its configuration while the input is
+  absent. The SMB1350 has the same programming interface, and the two can be
+  told apart by their version register.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,smb1351
+      - items:
+          - const: qcom,smb1350
+          - const: qcom,smb1351
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The STAT output, which the chip can drive as an interrupt line.
+    maxItems: 1
+
+  power-supplies:
+    description:
+      The PMIC charger whose USB input (VBUS) also powers this charger, on
+      boards that use it as a parallel charger.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - monitored-battery
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1d {
+            compatible = "qcom,smb1350", "qcom,smb1351";
+            reg = <0x1d>;
+            interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
+
+            monitored-battery = <&battery>;
+            power-supplies = <&pm660_charger>;
+        };
+    };
-- 
2.43.0

