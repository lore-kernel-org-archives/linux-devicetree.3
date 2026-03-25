Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2896638F22B
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479311; cv=none; b=n69dIBaBMZMtV0WB+rseEdJzHGFyBhQN4BA8PYNvxofXtxso/T+gKPAgYbNzK04ZP5ikfQ0CrQpSIlALLbt6co7067Dvc9tun7P5fTkXeI5Ws97zbRM6fiSEfNn4ZDA2EEZIlcqv6FKzukYhvDo2XSmGSo24hggNWFl25puyxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479311; c=relaxed/simple;
	bh=cfmt8Fb6+/mGsuMLAVq8l84JoLhdl8W28ndt3in8j8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbPPJEjjIBWutoU4gU41QVIZ5K5G6uZRsvYd7rtT+BMHUeBma3BgRiPtn3zCYK+sJTpS+LlgzxtIWoPY5h3ZlKj20Cvf4FVvvPbeIL5OEcZ0D6hDf9ACMko8a7Ha12K6wHAoqAmDSlQwBV28xFwbrRqNYwVZ7wPvjaShfGBrAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrnHq+OU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrnHq+OU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso224114a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479309; x=1775084109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jg+jxIxiDHnN00TgvSu+pP6M1fm2u7hbNztuwkGyUXY=;
        b=qrnHq+OUC5ADeKpEqWbAZLqfeOkD4ZzRcmrzD7r9S4QwpU7UbqPtZIz5bLww66sS50
         MY2ajnA3YFNi0l74nfa9d2G0Tr2UdBt8xLFaqLRusPoa6p1zypUmHZO5LszttxaVsEQZ
         KcSwrrjFyesX1WBdgg73X90PD4Q+zHb3MPbaXgdrae/iX+dNQjDdynQNwLQRlXbBod4T
         4KbyiFJXo1MeDnQIpM9yoqkeQNntokWE+UvK87kTsC3RLvbpxZ0MRyPGC6XQn1CBAUfb
         sXLyq/SGXbbhZzI9q7cMB9DAo1nE4Od3cZPWzHhriFPOnftnuBRntXKvTH0Gf4gUD/1z
         QXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479309; x=1775084109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg+jxIxiDHnN00TgvSu+pP6M1fm2u7hbNztuwkGyUXY=;
        b=ng5AgyNa/0KnA6E0M3gRecDxaniAqtCmjqBZ1VMfP0K5ZfQU6M7JYbPDRZHEr30VfK
         d5WWiBq2UU9ipdnAkjT50J/4ztMmrBrjSb1oqBMa+6xfX66M8gU6Jn9DDS0p8Pu5VyP3
         z2bsZ9b+GJO+C1L1ChyXb4973hhceEHYy4jMpqdpPPPfam5b0AQhJK3BjErJCHf7zUVI
         i5QPWbIGGo5rswbQs1bLMxll3UTyk0Y6LwSeQMYf/aZnxPMEiy5FtqW5gXXj6/tbiAnd
         VJH1+nH/IOMBYCu82Bh0/fTRrddfmLRV+ZBE0Kvp+e54h/59Q8jVf7fXAwXZ9T3ESUXc
         FW/Q==
X-Gm-Message-State: AOJu0Yz5yXt1kAVAwzCvPB663F5oN7+i921OJ0qEBhfL87ud835BFpeT
	k1rNrLruNohMfUl5SGfuAeCRc2roVIGM3f0jol5z7JU9VvD9V3rTaawA2qscQQ==
X-Gm-Gg: ATEYQzx4lG5ecyiCsMifUu8m7vXpKk+3dK5YB2LD0zvm6/WGaE0M4vDFnLYmjyOeowI
	gFqAcpu08FSAxNI1BrOu28xcd14o/CtiFQIzAniEh8IDUgwfWft4ZGNt7SOgN3we9YCPf5HJEAW
	z8+STNBEy06oP/BhcL2j2Bpbg9bJK4g9geNJn9JkwtA18EXgZmTZsc/1RH7KHxDZnof+hJhXTMW
	nt/9djEdto3VcbUKa8lIgeVa9ZthSnWiprjQqJu/8aVCB+znLSbz44eSfnEwS1NCiy6r5YLkCMD
	InZ/BYuXJ1W2EB2GauL9oux8za8A5aloFmnT1pTtxUB51/TIq5qeAh6JJN0QddEv+ERX0A7Kcc1
	lxGoHrXIsBhCINnetoKuNnQ3xNR82J/ggHQfOhx3ZhGJrsclZxiyJve9AWPjbpniOR0YtnXp9I+
	/Akb3w2QMLWcYQKkiK0yEWNRVb
X-Received: by 2002:a17:90b:3f47:b0:356:7b41:d348 with SMTP id 98e67ed59e1d1-35c0dd95083mr4052323a91.20.1774479309361;
        Wed, 25 Mar 2026 15:55:09 -0700 (PDT)
Received: from arch ([2409:40c2:5018:3ab3:ebcf:9aee:dece:80da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1e1a64absm84066a91.2.2026.03.25.15.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:55:09 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
Date: Thu, 26 Mar 2026 04:24:37 +0530
Message-ID: <20260325225439.68161-1-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Hisilicon dw-mshc text bindings to DT schema
format and cleans up legacy node names in Hisilicon board files.

While testing the new YAML schema, dtbs_check flagged the hi3660, 
hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node 
name prefix. resulting in warnings.

Patch 1 Convert to DT schema
Patch 2 updates the Hisilicon dtsi files to use standard 'mmc' 
node name.

Changes in v2:
 - Patch 1: 
    - Grouped compatible strings into an enum.
    - Replaced raw numbers with proper flags.
    - Fixed property order and removed invalid hex values.
    - Added explanation for clock order change in commit message.
    - Collected Acked-by tag.
 - Patch 2: 
    - No code changes.
    - Collected Acked-by and Reviewed-by tags.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
Note: this patch is part of the process for applying to GSoC device
tree bindings conversion project #
https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

- The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
- It is used in following
    /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
    /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts

Bhargav Joshi (2):
  dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
  arm64: dts: hisilicon: Rename dwmmc nodes to mmc

 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
 5 files changed, 124 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

-- 
2.53.0

