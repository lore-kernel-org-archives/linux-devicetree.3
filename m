Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC93FB07E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093915; cv=none; b=RiHiaAHHbQ3eJTKWtCUwCnK8xjPcKvzwNwaCJhu9sA2fpCTVvD+XPLghzmqRtBKX9UC54Sq2nA/MMp/OPZo4G+yiLaCkjQ5wnDH0/LQ6sYG/iApQIrUsSWLAljUS7eIwM9sDujsf59WLDo7ZSa6Pewyd9qt+8c+XL7CnVNid6vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093915; c=relaxed/simple;
	bh=Nu8HpBISkhyyT78YFJLyyTWj8tTNef3kNVTDFyhfXic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YZh3tb9PjG7H/BgvMmSe6jM4oou/nBy5tOHaSHybBP/xdBxqysa6HfY9RCjK5rr3OQzDSFSgYuwSf6Ap3IWXwT3kEr/bl+PcLhzY+LlztuCXCOZWR0ixNKrQMp+E9iNVyo2rpTKRgEpkPvRo+KeIAGiXyg4ftFLVu56KOUFfjDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JszroMch; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JszroMch"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4908b92904fso76870085e9.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093913; x=1781698713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VPo0DaS3Hezc7yA/0Ri7xBuqxAb55K5gZJtR7wfkmI=;
        b=JszroMchCWBfh0pJQhV3XUqYP4c1meYDadJdffU6n3Qdez4b+s4GfjSCnclOyTqPLd
         V42n/usgKmbhir9bPt7E/0o5r5npnaZ/ALqUSMewruW5zsyg1M6ADqHxN0yz5IRjnD+M
         jvUsBVNzPlpAGpdlavzA1R2n14B8Mmywu5lRZdwjzAiriD6Y5mPo3dJ5SGWAfS2BnLsq
         NVcQybrEgdmcHRL++wJ4sOzmHRL+/PYNQ3ezb2PZrwE7d8Y37/in0cCcG6waTc3wZnT1
         kgLfX1cqCJlXCk1IzpR9FhPBa4my8mbCG7Vpu3Z7JSZIBQYdMp9fIZvueWG/zH1hcddK
         seoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093913; x=1781698713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VPo0DaS3Hezc7yA/0Ri7xBuqxAb55K5gZJtR7wfkmI=;
        b=mYJYDhRA85AKp8mhH3mgftHKzga9QACFggUsu0fcK3x5yFnXP3ZSYtxOhuBcgm63YQ
         bZDRugSxwSaew+0yqVuCNYvXekKXwr12ZSoz2dgha2KyjIjo1jk4ExtMrF59C/SxC/vk
         zBshk3vUrDb/KWf7gAge52WRAQ+TRRqTBz9OCgS0cKj7G8gJbnV52R29G6eFnDqZ2NnN
         3/9hzZW2c0RM2UVs+tyr5wfUlNWVk+HPL+ll+G+31S27g21t0RVGoQnD9xGqUzG/zabf
         xeAOQtJQg7gRMvb/BGWL8Lqb/uvwV/6l3aD7FLKhJ1e4ItkRafxPMgQwIChNNKs4NnNQ
         mVjA==
X-Forwarded-Encrypted: i=1; AFNElJ8uapo4+pp4rQd+DVnq5N7l8sRSd62ywyVTXYWz/xmUHaME+i7iBKzJWuNv+ABWJFej/0cUlVkcHcYT@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8Ndc2vohNHY37LiX1eOKo7g59hIL7F1z3x+843MNQdBOT0MF
	ESSMVIh5wSA0aIvFFLZv3zmFOqoZ4ICN4+SHALwVnMiPw/5Rq2Bklvh7S1JQ+w==
X-Gm-Gg: Acq92OF1gcGq0dJ/0nHdyoscuoTjKrdYx53uo0FvVqVCdlrizGT0H0Rj28H4WpP6Ts9
	H6uinPr1v8cqvHI4sVaqf4Dh5DMkJMT38tS7yjJnuH+akPU4mROud7gj7A2RKscyu5jKGK8i3yM
	mJHXEo/FHDhRvxAHHe1A57NYqJ9G1e/XmlYhkXwxs4KKId0sHWZiI9nGR1P2vgmF8/8sLqxFyTi
	fGt3v635yGMHxRpGmQU9rknnOvOzddsi3d2JgtqYEAfOCrS/sTcKLw7jpI9xviihvUpKC6/fQfa
	BT32KJYwTUU4Lr3aTWoT22l68SK0MqvnbwE9DQ84fnItNj242DwKeVeASrtEmDaMDXzOEcZA1G6
	6OnqYP71/rE6k/EEP+X4U7w1NpUgOxxfVbXu28+pIscDza7oBfNq+0UfngYU7+otTEoh9MRGuKJ
	S77zGaY/w2Bl/r+89mGRWa30UIvTAtS5/7niaE4qEprqyj
X-Received: by 2002:a05:600c:34c7:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490c2525299mr414522655e9.0.1781093912703;
        Wed, 10 Jun 2026 05:18:32 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm566553095e9.15.2026.06.10.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:18:32 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v5 0/3] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Wed, 10 Jun 2026 15:18:19 +0300
Message-Id: <20260610121822.2524634-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes.

Patch 2 drops redundant clock-names from those single-clock FIU
controllers.

Patch 3 renames the schema to nuvoton,npcm750-fiu.yaml, explains why the
direct-mapped flash window is optional, keeps the requested example
ordering, and simplifies reg/reg-names to the ordered minItems form.

Changes since version 4:
 - Rework patch 2 commit message to describe the DT binding rationale for
   dropping the undocumented FIU clock-names properties.
 - Keep the patch contents unchanged from version 4.

Changes since version 3:=0D
 - Split the DTS cleanup so the reg-names fix stands alone as patch 1.=0D
 - Added review tag to Drop bogus FIU memory reg-names commit.=0D
=0D
Changes since version 2:=0D
 - Drop redundant FIU clock-names from the NPCM7xx DTSI together with the=0D
   bogus reg-names cleanup.=0D
 - Rename the schema to nuvoton,npcm750-fiu.yaml and keep reg/reg-names=0D
   immediately after compatible in the example.=0D
 - Explain why the direct-mapped flash window is optional and model=0D
   reg/reg-names as ordered minItems arrays.=0D
 - Drop clock-names from the schema to match the driver and updated DTS.=0D
=0D
Changes since version 1:=0D
 - Drop interrupts property.=0D
 - Drop unused label.=0D
 - Keep reg as the second property, followed by reg-names.=0D

Tomer Maimon (3):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
  spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema

--=20
2.34.1
