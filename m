Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01435F61E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187566; cv=none; b=has9SFJFMGEtQsHMFGSWwmw3jzWVn/0iBSHuIPx7kMERTO3ziK32RO+bLfiuAg78HmnV8GctDkM5LKPocuWTvz10xsbn4oqP/UuQLMES0N/5AaQoOdzClrOrzXa+N6xPeDd5T71EkymSVvGR7KJgfgoOhDK6kz/hTSh2vc+XuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187566; c=relaxed/simple;
	bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZPLlMOCnTn3HwJI3ACfD8tqDEfxLBYYqDnJsMC5dRrkKlAN6jc2BuhJfe+kU9qC8TW9R9WA+4HrZHNcQo/PSztcbQEn37lCqDhKCFf8yzBBbTa1MyWjaSmWjX89FNDI+lQibr4en4MI9qECftjXGHz+xws9fyZLu1DmLWyap0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJae/0J/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJae/0J/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-384c94c9423so424012a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187565; x=1788792365; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=rJae/0J/UpsgQ4MD+7Wjv67ylQSr/5ViF70+OxmsmdW1Dl4Wa2coMXzbgOiFw/j48B
         vQRg4gOBsgIrGgpLcxHpTPydk6Mrsp9+a3lQn0DUd3v2GcgxqM//H8SUo5/YQ12KhI/v
         qFnhzcev/qUA2mGwsp/uSa2ltYbsOCkUkzWWUJKbb7A6quVyaHKRkwZ7fICYmQbpO9nL
         6hnexLe8vslzOSlepvhsj8T8S/PHj3kwZdxo7UmNR24pkcf1F5EOzQ1IbebR322NBQUL
         G0eNKv8oVu77E9Ahw+nPbnnaV/YOLxn5m+V+qVjnAxfty6djpqb4lDBYk5NOfuY7O3pO
         rGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187565; x=1788792365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=qs25fPBOwzwxe6ZUhREfXI+hPhw2a6KEyRnViYjw39P20mJsqjpqGxjxD+ADBmHQMu
         uK5Jv6EPIxMBvmkMeqrurVcoOW7gvSqB3aFddszzDWaisVHay0fvgEUJAktaWFOYvplI
         kjDb0YFkJX0JYQGzhTtP4e5K6r0JFFWg699HDyDAPfsV7VAYsob9h9I4i/+w5p/SBXST
         RYLIdlJkkedofpjnPwsFt1JJ/1lDRKB34B/tJ01mWASYD7N0wlAtRrr2WzmWZcTo8Jyz
         spcckFYIJGgrMMInKTop2HD7Gd+QvGODeE3HDplat76w6DZcWghG4vF+bRKQLJoBqcCI
         Rlbg==
X-Forwarded-Encrypted: i=1; AKwUvBxTbYNLJ0krwyVpRP9YmRcl1yWIVmK0saSbNGmH/qUFA9sVQkBX37uMzDT8WYB6KT5WiYaU/9XrVZWf@vger.kernel.org
X-Gm-Message-State: AFuF++lErqrTYNbRuB/UvKpg+cYklj4Sxd6JbpTrOIqYicAuVaxhjCkS
	RL2QiApwNQzoTwIs9BliW9Ke2LvgEtQ6ZM1fQaszX6Lil8DIIx2+YHGU
X-Gm-Gg: AYBFou2zEkB6JfAW6dXn9pIxcAlXJNky3XdiniglnI11nGjzKdlopmrxLQipHfprJYF
	/St6pd0AEE/Ov7SkrD79QPTA4XgOvRaCSbKi+XRSmBZ5pMBBVUL02vNUXS2juX2sxhOCklHHERN
	wWod0INSNuBkV/Q2FS7BHbOT6QOur0lkzXQDzji0RAcmwZiCD2oKp5pXXQK8p+fa8hXKSL1I7I+
	EU/oaY8frUZEaA7B6jikhNZD8A4837jrhFQXPez8SWkBMDbtN0YlWWmUNWmeexA8fahr16IEiuv
	qnlppoj4WfNjADtUw7/cnOIjSEji+tZm5wqAd5CLpUz5fXwiozKFipDqIdfbtbmNWosWo8WQC0p
	tgEqH9zFpR4uW+DNeih1wIH3wjMiXJMOkXK7uNmDYq3E0gUG6bMZeTd2vuywYDhZjec9bIQ2RVV
	m+snm8N6a906Flxgj37cAKVOqwL+kJM5dRqPWig6rbd1TR695C+JlNPAlvHYbxJQAlmhDdBk8=
X-Received: by 2002:a17:90b:17c3:b0:398:bada:832b with SMTP id 98e67ed59e1d1-398bada8463mr13042007a91.6.1788187564330;
        Mon, 31 Aug 2026 07:46:04 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Mon, 31 Aug 2026 20:15:33 +0530
Message-Id: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIAzA8VcxnK2h4HDz5HsYDwhlI+7DwEJcl
 r27bKcdjMd/0/46s0jBU2TXw8wCJR/90OeQxwMzje5rAm9zM8GF4iVKGD28aIrj0BNYSmYMLSg
 6VwKFI1lYli/fgZz/bOr9kbvxeT9M25OE6/S/lxAQlONalxdbaVfe6k779mSGjq1eEntD/TYEc
 Cj0EwmlwcLg3liW5QssVIWW+gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=1832;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
 b=5uAF3LTjxwbIRorl7/hnCp7yFyq96RIEgs7RuXrtj+raAjTecfJX+WAM7jZuoYQBJFYRLlgxl
 N1rT/BPZrX/DPWg29wTgWzLZjONyX8XsbRKmfhqszWfkPSXbw+mVYO/
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

