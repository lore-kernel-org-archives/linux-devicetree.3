Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23A33BBC5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304852; cv=none; b=Muv/GqQUm7FOzypVr+cxW1HixXx7g4JALPozMkRvw8ApTcdLuYn1BAX/H7hTpYv7av/aW2NMN79QJCVZCytBcJRXxDly0LPRiUD18HRyRJRdkMD0Ji1AhP+eWwuCJ0HEIWXezunVJdMXyILH4I9xHit/8XGpdApsMSFiioAQ/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304852; c=relaxed/simple;
	bh=4/Lo7ChhuzCpClfioxkED+8KA9Q5Jky/0/oWzVmGRRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nKMaAw17YZbZdZ8ZBUce+Arvwrx4OelmtpzXHjDx4HafP+7WZqj8q/Z559yjY4NXSsa8NTMh2vpdhZ7defzRNDG/EUb/kxRcjDQjxYb4b5pDOI5fFsOWo0dfy5k97X0vYp2Du6cmNzgeOMhKIrSKExxORlGqhr8HXIHA84M2FfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2oIsDOd; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2oIsDOd"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bdc947aaa3so49231907b3.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779304849; x=1779909649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9UA9aEbbdQ0kKVzOUrQK9f5EhaQWo43O1Q7AsJtofw=;
        b=h2oIsDOdoLo5f3q0/5La5e7SVctBEHZH6WpbU5HldSuwqWt/o6o+1PGCRKu6OooQhT
         pHvRM+v93zP33fuPks3DSWMSJu8RISUqrF5JF8/eFl1MMqMODdZ//JZm/oNxItGJmWPC
         xRwaJk1zfECe1i+2RwtVKFwEzcvt+3SE7wZy6FbkI8vcEZTrAdoVP2tMrUPLa9sz9Mlz
         fpvm9FU57LtOK6FFaFBUfvC4ueQ53/3lOwpYTtxoy8iYdqg37crHICO5FWMGl9bXBi5i
         RgmmBhQ++L92+Zy794JltufIuAFUoz9NaQZiVLSHz6/GfNR6pww6UvoDgYONsvwwllMq
         ZjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304849; x=1779909649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9UA9aEbbdQ0kKVzOUrQK9f5EhaQWo43O1Q7AsJtofw=;
        b=hRvXIYy6c+AwtzEjK3AwovODtSftcEh7Gexgg0iXC/WFqw2gQpEQokZ2FcDK7AEI6v
         rtncf3PI8jp+F15AgNxyaFfFjUYm0nknt+h1NzMhqMLnCQjd1T/t4Pzv0cqjZ5Kf3evv
         +bjZ4qhRvJB0A0+B+rWF1DgVBotW1rnvussuFleaOb3JhSuKsjYgRN47JQEkrIC7hoit
         L++4As1m7BL6K6NFfIGn+KytQxgapZYc+ghV6wN1g+wblVwHbqlFeeoATgEM/IIhML+d
         D/03o3YHKSJvkagIIDCWYDSes8tUK7SR4ZMAXIatDN7ILejVzHe/X5NZy4MdQ7nfW5Bq
         O5HA==
X-Forwarded-Encrypted: i=1; AFNElJ/o0pUfq1ho03BvdPgR1v5rlQUw1fiaqqSJamWdAgmnAdjSlvQKuhMU7nuiKVeJuLEIteGsogHSGiJd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78ju5H4gFL4DBlo9fAs8X5GQN59AAOQa0ZOI7wypVEMTNLz+s
	hyigAv6GC+rnPcm7wO/TT0/Bg+uMbC8MIrygTA/tF7ExqGn/68RTqTA=
X-Gm-Gg: Acq92OHu5RQrnkLGP0ioBWBYRtI1jXkAADDcR0ZX0BZPwCDlGEiogxZxW2qiI9ZHvCu
	Rn/jjqOLsjCgb4D6aiy7VLMaNLzSfeXC1vwPQlZnskAu/xuPOEhuhvxtaaF96fRqAM+y1onZ+7b
	Cs+FzMO8JMkV3eNu9CEdBBjCU24NAjTgKd/wtYSxpYFHhfmLYbbeXgq3ZxAUhatJrkod5+jhdzN
	MFtdhh3D/ZijaNt2hvFJz4YoQN4YIxJUMJLi+M/rUNyHgyAF25d/1yPUi6a/2chRLQ696ZgvgLk
	ywS+mpGYljdkPlzrRIWxIwoVsHmXilIvQHBB/UkvoMJc/0mxEexploqRruQF0DfIUrQTl56ycEV
	xSYrd2L3PAdIW20BV74VGxShUbCA/TzC2q/IcVtiGlEZ3Y/G0tJesMY4X6fqN+qbB7JgbUF8Njt
	FyZWbK7387qVLsRY9oTc9+lu5DOlGkNcASQ7OFtnD/pAGXOg==
X-Received: by 2002:a05:690c:350d:b0:7d1:9c6a:d60c with SMTP id 00721157ae682-7d19c6b0ec5mr19272437b3.18.1779304849408;
        Wed, 20 May 2026 12:20:49 -0700 (PDT)
Received: from alir-mac.sitimecorp.com ([12.1.37.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9d18dcddsm56346757b3.49.2026.05.20.12.20.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 20 May 2026 12:20:48 -0700 (PDT)
From: Ali Rouhi <rouhi.ali@gmail.com>
X-Google-Original-From: Ali Rouhi <arouhi@sitime.com>
To: jiri@resnulli.us
Cc: vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Rouhi <arouhi@sitime.com>
Subject: [PATCH v2 net-next 0/3] dpll: add SiTime SiT9531x DPLL clock driver
Date: Wed, 20 May 2026 12:19:40 -0700
Message-Id: <20260520191943.73938-1-arouhi@sitime.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a DPLL subsystem driver for the SiTime SiT95316 and
SiT95317 programmable clock generators, along with the associated
device tree bindings.

This driver has been through multiple rounds of off-list review with
Jiri Pirko and Carolina Jubran.

v1: https://lore.kernel.org/netdev/20260511211143.19792-1-arouhi@sitime.com/

Changes in v2:
- Patch 2/3 (DT bindings):
  - Remove Linux-specific runtime description paragraph (Conor)
  - Simplify reset-gpios, interrupts descriptions to hardware behavior (Conor)
  - Add allOf: $ref: /schemas/dpll/dpll-device.yaml#, switch to
    unevaluatedProperties (Conor)
  - Add pin sub-nodes in example 2 (Conor)
  - Rename node clock-generator@68 to dpll@68 to match dpll-device.yaml (Sashiko)
  - Add clocks/clock-names properties for xtal reference clock
- Patch 3/3 (driver):
  - Fix SiT95316 num_inputs: 8 -> 4 (Carolina)
  - Initialize xtal_freq at probe via devm_clk_get_optional_enabled
  - Move DPLL/kworker init before IRQ registration to prevent NULL deref
  - Clear notification latches in periodic worker to prevent IRQ tight loop
  - Use clkout_map[] in output_phase_adjust_set() for correct register addressing

Ali Rouhi (3):
  dt-bindings: vendor-prefixes: add SiTime Corporation
  dt-bindings: dpll: add SiTime SiT9531x clock generator
  dpll: add SiTime SiT9531x DPLL clock driver

 .../bindings/dpll/sitime,sit9531x.yaml        |  145 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    6 +
 drivers/dpll/Kconfig                          |    1 +
 drivers/dpll/Makefile                         |    1 +
 drivers/dpll/sit9531x/Kconfig                 |   17 +
 drivers/dpll/sit9531x/Makefile                |    4 +
 drivers/dpll/sit9531x/core.c                  | 2636 +++++++++++++++++
 drivers/dpll/sit9531x/core.h                  |  282 ++
 drivers/dpll/sit9531x/dpll.c                  | 1147 +++++++
 drivers/dpll/sit9531x/dpll.h                  |   90 +
 drivers/dpll/sit9531x/prop.c                  |  345 +++
 drivers/dpll/sit9531x/prop.h                  |   39 +
 drivers/dpll/sit9531x/regs.h                  |  359 +++
 14 files changed, 5074 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
 create mode 100644 drivers/dpll/sit9531x/Kconfig
 create mode 100644 drivers/dpll/sit9531x/Makefile
 create mode 100644 drivers/dpll/sit9531x/core.c
 create mode 100644 drivers/dpll/sit9531x/core.h
 create mode 100644 drivers/dpll/sit9531x/dpll.c
 create mode 100644 drivers/dpll/sit9531x/dpll.h
 create mode 100644 drivers/dpll/sit9531x/prop.c
 create mode 100644 drivers/dpll/sit9531x/prop.h
 create mode 100644 drivers/dpll/sit9531x/regs.h

-- 
2.43.0

