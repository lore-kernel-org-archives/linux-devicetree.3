Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE1396B8C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448492; cv=none; b=PkgzaTxdn6styxuwq8wY0xdh8AbYq/tRVcdZTmdBDiFxLXxXmJO+YwNdhOhzm4D5+hRyG+vGDXoiFXrwVfAthLyNyQfDw1mXfbiq5M5VWQWPJkFCbY2amsmUxSH4hyszbjxQUFSP2DbhCS2vpVJtpdfHVESV20YfJzau1wlyBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448492; c=relaxed/simple;
	bh=HoldeK6Y6q5KKy85/YQjScHZJE+f6Zn8Ukpab/mP8Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mcYWA+eJYa+QaCkG/11X7sWkBgKhAwaaLSbQIj+P1YZRdm5jAbA49wuLY8pstGuntdjMbNHw1z78MbLNdt13yimHLA/xuMNSMvqTHRhBwjRIHpRTGt/wvl3Hn+L6a27S4JO5ruutFhycNq8rLp6oqyPiRbxnbrixC2ekmUCnTD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AMq5xxvl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AMq5xxvl"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so6251706a91.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448490; x=1778053290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFZhSnSnaJvbVAF8eyUqTOgahKo+NC7KLHnE9JI0jEw=;
        b=AMq5xxvlAB/v+huI8HE/Fx9JoND5d+iX+ROCC0460fgLpFZcYrlXt9ilpCGp/ckPJa
         Cqzjenr8+KoRl+YwkKt6z+XmfxjxOe6mtLLvWysREcqGrcDxBFLe5UT9vUqMGByqSwLh
         NBIJDPcdBJpsTb+YBOZIllGvYymzj3DGkrXQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448490; x=1778053290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFZhSnSnaJvbVAF8eyUqTOgahKo+NC7KLHnE9JI0jEw=;
        b=i2gYi0HjGiBpNveTYR6YKw/7l+dl26q07rU8zR3+sO2iLQYiJc4rkT88NPMAYfJx1S
         HkDEaWu7JJKjq1+RBl9HhHboHM3oTVi8kG3w7Z3cm1JEglbFEc17RNwOao5oBpSgKbGj
         HCoohOSCvNVu54Y41J3hnPX2YkIUm/Jm4CmI+ZApoLnWjkiJoSTvw+X+mDOjg1rOfTs6
         sSLozSu8rdXwS9mIbr5t64DcfrUJkRP+EIAKqXD8QFnX+bi1Gy7IuLDsLrq1z5J+CJyG
         iUSVn+o1H67ADDCjrKs5JwDN8CBJnfWCwb/fSzBEhFq0flhvMZaWSF16mF/As7hI7N5L
         BUXg==
X-Forwarded-Encrypted: i=1; AFNElJ/NSlaRn0zCiWPIZlZDXVsdvGqD91EzNR4cImbQHULqOTNtTERgABavyg63iZDBtgisRKXFmtqEyZr+@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGuKNYUvhfTwZ33PSDmatt+zlrE20JH1jvPeZWMw+pCeZ0+aA
	FrGdsRimyDxdZ+aU7ipl0hitO5ikZS3gOPs0XxN+K9HbFmYt7Epxq4mtWM4iKUqxIg==
X-Gm-Gg: AeBDievGbuYvwWlK2Ci7ymejHxBr6MFAQ45kmAERNHhvSB8h/ulLb2PtSZcqVHUWUXF
	vaBBkOnU48+duhmDXcbR18iu0SSmFPuEElpBRAsHlO7aFNcZU0+qLxJCdCTrRQk+Qcy0D401cK3
	TwKggdzHf9hrPdd8Q+VCKQspEWLFDf2G4yqCnvPMXz8YcaNjwdWzs4zQg6VnwVIzhqtlub+DtR6
	fP5KpRivgckyThGY799ta/vt1oJ1iYpb9HLdjxYAAtjVl5i8CqOGMUrXR/7Nku4+r1kTpO9qCp6
	jQi44jqVk5JuKNXncOZK5KGFBlcXKBE1IQ2X0/HvfbLIGem/OytjBUJjYi0/RyLQDY7Q/jeyDAQ
	FXpxqK8MWrZhxpct5vAIz0xJjOPdjCj5sNBCjOq8FBlbiIrEFP+muj5b0Z8L1SxvKZZbHlhow6H
	DhBKtWVtAkNTu+e5f6Lzk0OVE3RVPO6KLfLAYEruJMLub+GEHNVkEm8tSKB/11YddA5Z6CYT1OA
	GR2IQWckYvkxH5MbZA=
X-Received: by 2002:a17:90b:2fc5:b0:35c:b02:b5c1 with SMTP id 98e67ed59e1d1-364a0b2b59bmr2680846a91.2.1777448489640;
        Wed, 29 Apr 2026 00:41:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] regulator: mt6359: cleanup and add supplies
Date: Wed, 29 Apr 2026 15:41:06 +0800
Message-ID: <20260429074113.3720271-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of my "MT6359 PMIC cleanup and add supplies" series.

Changes since v1:
- Moved regulator supply properties up to the PMIC mfd node
  - This requires moving the properties to the mfd bindings
- deprecated vcn33_[12]_(bt|wifi) regulators and added vcn33_[12]
- model the deprecated ones as downstream to the new ones
  (vcn33_[12] -> vcn33_[12]_(bt|wifi)
- Handle internal supply of vbbck directly in the driver, instead of
  specifying it in the binding
- Added patch to constify data structures in the regulator driver

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 3 deprecates the vcn33_[12]_(bt|wifi) regulators, and adds new
proper vcn33_[12] regulators. The two *real* VCN33 regulator outputs
each have two enable bits that are OR-ed together to control the
output. This allowed WiFi and BT stacks to separately control power
output without coordination.

Patch 4 constifies the data structures used throughout the regulator
driver. While not directly related, it touches the same context and
it is easier to include it in the series.

Patch 5 adds the supply names from the DT binding change in patch 2
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

Patch 6 implements the changes of the DT binding change in patch 3.


One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (6):
  mfd: dt-bindings: mt6397: Add regulator supplies
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split
    regulators
  regulator: mt6359: const-ify regulator descriptions
  regulator: mt6359: Add regulator supply names
  regulator: mt6359: Add proper ldo_vcn33_[12] regulators

 .../bindings/mfd/mediatek,mt6397.yaml         |  50 +++
 .../bindings/regulator/mt6359-regulator.yaml  |  52 +--
 drivers/regulator/mt6359-regulator.c          | 400 ++++++++++++------
 include/linux/regulator/mt6359-regulator.h    |  10 +-
 4 files changed, 339 insertions(+), 173 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog

