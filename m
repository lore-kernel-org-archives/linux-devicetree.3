Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6D4322B7D
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777716834; cv=none; b=oXYl5EFA0/M+DU+VFkDzoZDf3r9eObIvtgHdxjrSOsnlJ4Q7/kWkYFERFnxrAlYTPra02O0DNuwSvyWmePujJm24wW1PF2BRRy0z4Yts1Q+fbjlV9ZoKM5HjwZuzO3FdVuW+FUwYZ8J2k30V/f/pC9OHlqNZd4I2u4jziYf/b18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777716834; c=relaxed/simple;
	bh=Qeyor5pnGeEUxHDLnSAUNrklZACkQd3iPe/8N51JgLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGo85jrw9PuEWplkrwp6S4tF2q2Ajscv8YMFmXeq/M+DgJ0IdtyEkIIPutg321zPuEZdCBUWlRk7tTJZNA5dZDfDiHbxSIeCOnLUS2BbtqE/r/WptqLj9FL9iWtRkol7DZ3rKkb8GsWWYC7apTzJwePsabZNq97WfRaW2RfI1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiCgcBXU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiCgcBXU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1766717a91.3
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716829; x=1778321629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xxbrEotld4A1INaWDXAQzVmz+vSmMssLxNlmQzLKGY=;
        b=kiCgcBXUAWJwH10riDIuTSYrQlMnGZsVj4epzPPBHl080ttjr14cLDKL1p0snx+G28
         tQjqxbX5VnOLP+iq+VJjGLQtcXXPsxASvjFC0ApGjGhHTfnuoiLjAoDXQR6e8cmeCB7Q
         15KS27gs2IMoYMjl1veGxvx68ZUm74wG5isPB5cPprXApLamM8Pvp9khv4c0BB4QpOyl
         7VwNlMVd6pBprulFCc/qO0fPDqSKpfP2NkNsxKmq2rzzXw1z3Z86UC4n1ZbzQKY3mL1I
         McSAKrPWYBa4BP6DnDBf2+BU2JW8y7tlhd6VIneWs+hrpJiADqWIzoJ88j0CWZapX/CN
         OQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716829; x=1778321629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xxbrEotld4A1INaWDXAQzVmz+vSmMssLxNlmQzLKGY=;
        b=BAJ+f6hCnCT+LOqHrHPj2LLYDG3w8o1ya+a7ebIud5RCPucTJcY2J1WNV7xy7iU73B
         MKO8QwqrHRRfHmdKjMbAuCDWY+oh/neWTBFSBVqyrfTY54l8PvuCsRdrPY7/lQ9wq+J7
         ZpAtl6m8F7IljdnebWrQqudsc0Z79nKZZHqJgFuchFzwDdkS0QObuSobpDNx3NZvV+1K
         8q4PSbm5FLAWK+S9cm81AhSJqshfwzNAYgtMWCFDl0vVZwIHZnBwVMENTbrghISDX299
         fT4+V5Wsnn650xeJS3zn0htHdvy22bEs7DwVMWQz0bSFdVDFFULG/ERq/C91d/YL6ZOS
         NkZw==
X-Forwarded-Encrypted: i=1; AFNElJ/FR2GqeNHiEkDfxWJHgEaA5k31mKMJaQK9Y0sjgAVYX8A52ljVIN+xL9FkFDVfrB8fbDDe7y0A5Srp@vger.kernel.org
X-Gm-Message-State: AOJu0YwqfxaicUGyhqADr9YIIHPTPupE5egbVyuq5HvGUTISQQxcwQM4
	8GXnn+fkW+Gp8QIBY6aG9pQaBf1bIc3agw0s8a1N9oZHsMyJCdzexOMx
X-Gm-Gg: AeBDies4jsdJ9WxcwDHY0QbcpDIMNdkW+oLTb/uEb2w4KjFjb6acEVfsd6C3JNrOSHQ
	HAtDmJprHp6zs4PKjSRBs7WXIyNjVi/Bjgrq46sqVKIQvy7GyoKEsyKllZujcQlcNhKlprUsUJl
	WCMACix9dO9acxfdFaffqqBNogif/D6OeIBPpmUpW+y94VNCvQh+z1IXnHgsSkyNr9cO1cKdBxX
	fPsmfa839Chelnp35NgeJotACkJvihtplwTQ2ib9LZojXUl3+srXb/zBxXUVAiy+0WDAZl3B7Z9
	DmXeIKrLS7dn/LtnbyGSq7DT5moku0ZaqAOwOAxC+kCww2nn8eptkTefIhuonQZo9nH5ymzhdqE
	+9BxrQoMp5v7yaSF3BObtbtOivY7W3dpEWrSjVqIk0mysQ7PjNywcfLAm6HDsZTdqZIfa+uTMmL
	CxsiBKRppdhTo10e9KASjSTMwd+/BBL6IghY+dOV0anAQo
X-Received: by 2002:a17:902:d20c:b0:2b9:ce81:fd75 with SMTP id d9443c01a7336-2b9f25674cemr17239855ad.11.1777716829028;
        Sat, 02 May 2026 03:13:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae6d123sm50453575ad.84.2026.05.02.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for msi handle check
Date: Sat,  2 May 2026 18:13:16 +0800
Message-ID: <20260502101319.2364052-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for msi handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..6a595207fae1 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        oneOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.54.0

