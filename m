Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C0373BE0
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 18:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786820006; cv=none; b=Hjk3uj1XnHKUKNSyBaqTaQ+8dK0ixnbWIkXHMckJlTcleFB7Qh5CDln7pAY4kg9acBYJZbdrkQRIdesBRurWr02Ron7v5k3AWDkvvAibWDh4SS8Z9n4n3aOfytHjurqqy/IRAF8/LDCEzzTVeuxppk9YathJ0mdE5bsekd2MSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786820006; c=relaxed/simple;
	bh=0c/4L0Z1jAiqA034Ce5L4JKC6XAPputkHsDsi5EHESo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p+iwS3gxpiyFQjj6JrfB2PjvSfBAlXx2GSBmm5nctN+thF34hjNkAyfAzXafegFS+V3vDvhkymTLlyAwnJL7aEwzXfui8yW0CXFOh14UPBszJAKJ4b/gHgsvWht64OuMFHZuJo4m3pYuo1WX+R/HZTm1Ika0EPRflI9gGakY6PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJJ9VuvS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJJ9VuvS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-392af6bda98so196803a91.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786820004; x=1787424804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=;
        b=eJJ9VuvSSHVEy/sgGtURjv8ElLICgtacmbDGrppv+2icI8qGlMLaGvV/s65FiOElY2
         9zsEW3LxPV2sjc9MZ2QJEtKM0Y7jZ1jIba/zlg4gPF2Q5W4DlRCtYCimBTxQOG/XWCUj
         AjO88+rn6WIKgqoLjlWjcoBzPxW15F5G8Mv/BVnJ4jNrv8gw59W3ZXWDiQngf7fYjNcs
         u5XvVc7MposgGDCfpF4LuzGK0AxX02vn7KFMOGAWtI037LBkjTyPAcPDKcux3cTOHtGO
         fWZnqewKoCyDayw1QeQxh+Tyy7OkzDT/AOf7Z/i8dmHFU0iTnJL8VrmXLwt8XSy/YcHu
         4oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786820004; x=1787424804;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=;
        b=ZW4PpQwzuEe5kVAN9SiaEK93bXkblRn754/6nRmOGKF9bybwynZDofwfonHNxG16QO
         Lr3Qw7IZRk05fx+aHiwOehBIG7Uy5svn8DzJWe757JrzkQA4FPxTxfdjwV5xxyIEXigv
         VSBUZMhdi0BN99AHeQ+0GyyBPRCaRmU0aJ0U8j1Q4BFT11AW0cMYZQyMJJBr7LBJAyGe
         FO797N1DGk9xH/wc/WmnO02iwTDPV2keagdFp2FaRzt0BJD9Xc4hYx0xnh/RtSc93+jL
         MmjyIJQ27TwStgbsqFSAR0NIBklnSxd5FAm/hkpKzwDYsIRXeYhxhbmTRMi+KruHMuHL
         ueUA==
X-Forwarded-Encrypted: i=1; AHgh+RokQKVbHzeH2DWJhSCln+6ISxurpbNk46GYwRyt93hwOB6h30eUR+H/GOwBD3ymQ4Terl8OAFJ7JQ4t@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnWj8uUOXQN3KPcWlT/8yqdRHzYczaEEx9QvpeavT5KbfaJML
	xslF3EiO4t0yx0+eUUd3PatFgLUvXIw8sT20VAVWtxb14XWcTq+djD7f
X-Gm-Gg: AR+sD127LRi2nmxGOPr7H5950uSmvJn948/kW7IZxhg0X0lPBlfUL51Zv8TtTVdZgoq
	1mStHlU316EBESNTzarB27QDVWaW9KCXcYRIN8dOSWhgysvR9/D2w2crVcP7/QTQL+nYV7n7jAV
	NLCr9DL368/xbdyn9YL8zxuZURZCq7d2Y6ZfcPtXsqjFnX2h8hxcExu1BhBnDOBWJROSgOfRm+5
	wSHtQVPCJDze6FSl4j09RMkxqgAjBmAIabjACSMbO8NzUwGhWpyDGEz855N0hy0N15x6b6idRJa
	4qpt0IdhVn4WkQCxb+CXMqPkFD9+QmSWPQKKTC7KDr1ungx1YXkzMee5VyI10V2Q79dGy+3Ghbk
	vVZL3Zv+JpGhQB7fq3wfftCwQyTV1QpMV5Psyu/4LfSdKqVAW7pfeLph+dShOexKMLiMrc+X8uc
	3HrWmHNukPJPIoZv2hjGlwzlSbap8ZkYqP+Djm3MGeFIC9YcOe+OQ0eX349j10y3ZQjNpinToT
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr10888735a91.0.1786820004479;
        Sat, 15 Aug 2026 11:53:24 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm19289125eec.12.2026.08.15.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:53:23 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Sun, 16 Aug 2026 00:22:58 +0530
Message-Id: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ7CIBCFr9LM2jFAFVtX3sN0QWBoJ/bHACE2T
 e8u9gAuv5f3vrdBpMAU4V5tEChz5GUuoE4V2MHMPSG7wqCE0qKRNSbGF60xLTOho2xTGFHTpVV
 SeaqvDsryHcjz57A+u8IDl35Yj5Msf+l/X5YoUXthTHNzrfHNo58Mj2e7TNDt+/4FBDY0ILYAA
 AA=
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786819992; l=1571;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=0c/4L0Z1jAiqA034Ce5L4JKC6XAPputkHsDsi5EHESo=;
 b=Xo7ghDZ+X1o+TnmeQEkuJZN6NrHvhgHnyur8at9eZMwocYxHxuO7WdyBo/0kHttqh2kI5sB9B
 wNTP2VQC5xaD1B1e9GKqh8f+zHrc8argj11FZAjtRZ/76JO2F8Q/JAX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 100 insertions(+), 35 deletions(-)
---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

