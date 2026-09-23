Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3AF272816
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201044; cv=none; b=MvFnL/FNui61BYHasod5fF9/yNB/nfmyHsKOTJLNB2UZ8+j+Bc8R+nWPY65qfsfuF1ND5JsUjAzO+QL3H/JrBmRFMck+CDxzkLK4O2KwMNpSI6txIPdJBoWwaILPC2hULwFb3uS4Pz7A0FVfWQHkjvmWqZb3zvxfnuYzgmswBFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201044; c=relaxed/simple;
	bh=XYWu9x6hbf4E5RXhwpVrlV5tcStGDII4x4irJ8rJ/EE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PB7y08vt7HL3XSK36XTwZ15Z4RkeoBZ1JzlzP6kulifIxMpVVK1uV/0bDU1i6mI5+BogdduwPCf24EkIui1lfRQCGyS7/Hcg4lkb92Fd4hZ3wQu1R+rP8/8X9tBVTo1WfPDHZb8mAotu1WXOp43Kw0w0Uq6uIuh2RaFCs/rVxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNXWdi49; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNXWdi49"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e61b947d0so137997eec.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201042; x=1790805842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fh/HcB1NxrAKhTVrmSl2V1/xU2WUlyCi2XiJkw/1lm4=;
        b=BNXWdi49PDhslYHV0UWkY3qmxM0yqvv/SS7QhqjiBELlj0W8cDNKCcd6YAIQ+s2aOY
         AMW5oqMbmTeTiLYgG3+HoJRl6lYmCpKAfL2uzzq21mo2zsPzZPdtTlpBzi/qpLMQAnIE
         ousHIBgo5TSLr9ohroxcriBQhP9Tlf/sQHeMX24bDsQvZg0Tn79bEskByTqQtgc6Qkbr
         whxKePvAXPOaZ99YbUdlUpme8tnonT/rUAEUjCAeygqjgLyL/6P006TqjDRcS8LEQ0ZE
         z4fEvQm0ODr84SwBBa05XfFMfFbuyBWp3tyPexLgP2IA7Bd/VpVNlHcscUYi/KGKfi5E
         ADPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201042; x=1790805842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fh/HcB1NxrAKhTVrmSl2V1/xU2WUlyCi2XiJkw/1lm4=;
        b=N9Um4koX1/p1nEKBLxGJRc6gszWzwxrlqD2T+NECCvhvjCqcF7eMe6KvoRGHtj2h2V
         v4/qAwHl6lhMuFq4fPU0djPJLbctWQj3fBnIjVUDYBr/geyK9KX+SYw6V12odcYVysOL
         Iw+R4b87Lm9XpdDmFqEDZSvhA8I8IBuvwuRb3Ca+6wknQ4Sh+Jq6YYiDQtNGdgICMz2S
         ZrpcJeOoA72+8DHuB865LdfBwk2werkLXHcWhQJ/7mnwW6HXdoXQ5csolG0QnZHE2ANt
         2z2ofFhLjvrZ8jxiqW3lPKgRDHvDdZ33oE8mWle/L5Eh7hshD3tGMrn5u6zXSxWHszpG
         4M5A==
X-Forwarded-Encrypted: i=1; AKwUvBwqWiLR1yJWNJzklOH6++5V6iEcSSMpOEqg9q49cdtv7dwcUmC+3e+D/pH34tELLuRI8CngipJW/kAa@vger.kernel.org
X-Gm-Message-State: AFuF++nkXcSd8GPEQ5lW4UKvU+6MDmD1Zf5Oo1NA063eqF8xdfWq1B3F
	61JXA9K5Glx0z+e89EQz3nLod8WKId1HDSsuXjVQ81DmTciTpAfZ3IPg
X-Gm-Gg: AYBFou2RlfP127EDjBqTP4/w2gKPIL5bXPWUtXaamdUC5mYq6yopqstAVApx5ZvT7Hw
	ICixsUKcuOmlVosklRh8Q9D9j+erbIOJBtAmS0XknhQa1NgxulDLjUh5CH/OtSdTMtcKQfbpYCh
	YaR3nbpXshY/zwK0PZU+NCi+/lZTepk89HMmE3CWUBaBV2kXYQeQnTFXKoUooBALqsT/RGlVUsH
	lsTml+xHqAz01gxi7Pe5XR1k9pLHP3LzU0nDppkVQHBYZmTNNc/hnVqu0qITc/D728KggQaH7Ts
	nFpPGoQRQUD9TzEKWrl497nl5ucMk4aSrdz3oVAn6oxU56EVu89F+Eb0OPxjTCv8s33L1X631Cl
	dfVrzi2BfoC83Q6pmqXjawbdMF7Ng84zt/gax4pn7nzCr8SpLhKWUBy+zhXSuc/YZexeB+8R/Uf
	AkeUmRS7FN3+EhOXkfwzKKVF1AqOm2Ntkw2kM2R3O5NztyYui00BIF8372MRH484bq0x4uXOyOc
	joGTJE=
X-Received: by 2002:a05:7301:c017:b0:33b:e1f2:fa0d with SMTP id 5a478bee46e88-340032c70f4mr570866eec.2.1790201041985;
        Wed, 23 Sep 2026 15:04:01 -0700 (PDT)
Received: from [10.197.48.252] ([2409:40c2:5047:8a3f:9ef:734:1515:aac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm7962458eec.8.2026.09.23.15.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:04:01 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Thu, 24 Sep 2026 03:33:29 +0530
Message-Id: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NTQ6CMBCG4auQrq1hpqWAK+9hXNA/qFEgFBsM4
 e4Cxgguv2Sed0biTeeMJ6doJJ0Jzrumngc/RERVRV0a6vS8CcYo4gyB9o72rRdJJgYqE25SAMg
 hVWQWbWesG9ba5frZ/ilvRvVLYrmonO+b7rW+C7Dcfcu4KwegQHOmJBeSocT0XD4Kdz+q5kGWc
 sCfzUHsLdKYWkBltZWcC/Vv2dbme8tmK5jWyGPLRca3dpqmN8jpxUgwAQAA
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790201024; l=1889;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=XYWu9x6hbf4E5RXhwpVrlV5tcStGDII4x4irJ8rJ/EE=;
 b=EKEgcgmUWan6pVhjGd6mHholRHJ1cdAWwsrhcztq4uuwyQmAoTn2FJwVEw5A6qJg/uyHilqap
 ptwgibKv3dLA8L/kGcrhqZ5z892dPq4Hc7FN21w999t/w1Mq38LpS/b
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Dropped applied patches 1 and 4
- Rebased to broonie-regulator/for-7.4 to resolve conflicts
- Link to v3: https://lore.kernel.org/r/20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com

Changes in v3:
- Patch 2: Add '>' to description
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com

Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (2):
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++-
 .../regulator/maxim,max77620-regulator.yaml        |  5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 -------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 74 ++++++++++++++++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 5 files changed, 88 insertions(+), 69 deletions(-)
---
base-commit: 05a3330f490cfa266831c0fc7f8c6df942866d59
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

