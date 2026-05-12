Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361FF38425A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576070; cv=none; b=CmAJoOXZeUAxjtrFcn66P8nlcMIyhjGVyA4cljZZEuWMo9wQul8kkFT/F6430afqIIT7nXFTelD4Wmns0o1pvqJv40WWiOx4zlUcpOjjtuaXpqo2v+taR4/um5M+Kkc012T0zZIKAJCL7yH5a22nC1OoqIYmg/rIaj+Ndq+NuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576070; c=relaxed/simple;
	bh=4o2CbnD0Qf1nNkyGYKngFIgxLtPB1PLjwdP7tErmoa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hV0bczHOyYHy2D80NuyLUxNGgRJWLNMjStECM1Ie3OFh+oK1wpEE/j0R3Km+04jzW8H8RcUVcogna4nI8tXY6eOxMaXDuzvehMJESYeNHS1eY06ZGMzc37PGkZLtzDh1BNNchp7frg0N/v7F49xZdGqP6JqAJJ+R5L60vqp0aPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WLffR0Qr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WLffR0Qr"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so2162964a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576057; x=1779180857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=;
        b=WLffR0QrwY2zVEA4OanvZTeYroQyNxaklnVQGzJx55OStfDp8SIKXx4DscKNVMxBrv
         wZLaOzldSYkp7qIxcN8tX3OI1KRq5pRn7xYYi+78pzIEJQBD7iGW3pvbRtJ2at75pLWF
         B16Wf1SwDXjdvwaTeqNlrEOAuU4kNkB9XMXbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576057; x=1779180857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=;
        b=kaiQmCIcVfO33TcgcpkU7sdKpuQmbdlqwb2c6l5JKlNq0Ej0uyaIC5u/PusX5gwn6A
         RHx+kzjxFnMOeP5z55MNeZX3qwADUVH/ZtwgKjxv53vtvCmg6esBsT8YGMNTRqqqtLXM
         +vMqQ0g14rKk2MQPiPqBlk3EX/GGVo+oOdUvh1zO/BecrsmZQeuEyCZcwQjbJpyA6WCT
         ysz77DjDXFKQciyiYEvigfHn15nxub5hiop76cpvRBBenvQ0CJE9MrfPB529lJhpwQOX
         Y75FD+fHHb2QE4Xak7VnHrMzW/giVjOWcK/rDurEAWttVNc0u6XfRZrXZGlMO53yhazT
         BQVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Zd/c1XIUaCFCksD5NcRqbcW7RDNnNHRIDwyTQD2KMD2mbxwXBP57jooDeID2yrNAAXuvvz6CgL4zI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7sqgKHw++QBwFAsolg7JENsso95XAH+O8eV6SlL4rf/leeUzj
	mBJ3WNB/6Dr5zn12oIDgIZSpV4WC9lIptgIMj4jVW/9CLuyOuYIimdPnYN9n/baAoA==
X-Gm-Gg: Acq92OHDd5rsX0f7TS46lxG+xBAZhMCFAWz5d69a61DO73nLO28c/kvNemDQKTprjPB
	Of7ap0dwEFwdlR+OM870Kpy8W+6qY/WEBuyFRtV9lPn+izYG3Qh+8lZwGxpIZHBrt+NmPrYwzn2
	zYNl/pvIWfI9ybAjQE/O8AN9BXnlh52qcLhE/HQ9QrTfHw13zRzUG5pDUcopaSXHbVWJQdwPL2Z
	hDzlaOtWcHBcKA2fc4dbzM18AQXyRh1UjxpTrSkAF47HOY5YCpTMo/S5W2rpIniErt2P9p8bOjk
	3ATXhkk2lw855xCKGLssVm2FZW5LInxR3vzwRt4SNWSXKoaUEYXqt70HhyfyXv6m8LPCVXeV6FH
	VObpqnyNDsQWNaJZyDSQ+Vn8ASEr3UBLoGSm5MqDPhZn24dHKpWWvfOGuSyaf0wAfkJKGrZNt5W
	hN95n0kxuoZWCDBzrc069j0ynHIYGGgfxwnyo8GpFbosQmCF12lsR+N4rxy9fbWqpJYF6T9tpVv
	ragwSIx
X-Received: by 2002:a05:6a20:7fa9:b0:39c:787:f196 with SMTP id adf61e73a8af0-3aa5a99f496mr29462031637.16.1778576057122;
        Tue, 12 May 2026 01:54:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] regulator: mt6359: cleanup and add supplies
Date: Tue, 12 May 2026 16:53:48 +0800
Message-ID: <20260512085358.1693208-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v3 of my "MT6359 PMIC cleanup and add supplies" series.

Changes since v2:
- Fixed vsys-smps-supply property name (from "vspms-supply")
- Collected reviewed-by on patch 3
- Included Lee in recipients (sorry about that)
- Link to v2:
  https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/

Changes since v1:
- Moved regulator supply properties up to the PMIC mfd node
  - This requires moving the properties to the mfd bindings
- deprecated vcn33_[12]_(bt|wifi) regulators and added vcn33_[12]
- model the deprecated ones as downstream to the new ones
  (vcn33_[12] -> vcn33_[12]_(bt|wifi)
- Handle internal supply of vbbck directly in the driver, instead of
  specifying it in the binding
- Added patch to constify data structures in the regulator driver
- Link to v1:
  https://lore.kernel.org/all/20260320072440.2403318-1-wenst@chromium.org/

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
2.54.0.563.g4f69b47b94-goog

