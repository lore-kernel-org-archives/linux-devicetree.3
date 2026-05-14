Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4183224AF7
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750137; cv=none; b=DCBcFnGRtiJDbGekbpe97+rltnHU8ZX3cre09EjkR4cX5VwDwQ+75HZzd/WQputhKo0RMn1PVcrBx15zFQ6u+L+//VneRiVDxFqIlfnOM5iXxIHESyr/GzvCTB4PW9YJ8nYmOJOz2IBTBqXKsafuS1VPyeNYMmuK+XKXvDYEUu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750137; c=relaxed/simple;
	bh=jPvKWRyTELDwdu0kVgfky3Tyx+TKGc+zP/ZBiy7qYG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmmZrRxvNG6QIAMrdQTJKf8cRm+Ryg2AmKBk0b41itZTT6Xcgez+P47EKsmYlWShDXRHKlrmxYl4sqbbfKWG93BqnRGk7E0uU0OIsobMeKT+koIegx+wHn9Wmw4gmw/oT5TY5FQe66hIHlM5zXgN3VGM7rI9LIW6FLPNIjLWleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FdrvLhJI; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FdrvLhJI"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso3397031a12.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750135; x=1779354935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4+ZN/ez4nROwuYUMbT55lLWK9CfEBz3lhrRLyAE58o=;
        b=FdrvLhJIUGU9rGguv5fZD/BeUNt+tEHdsBEzWFb4x/B4w4K8JBTnEY1/DdpuAHRYJz
         Bzb4xe4Rs3N2zcO45qLlzpCPEsqxH7UtDTMCPVm4TmhksLjh7sSoB8YoEunHFBPw5RUz
         eoPU222gvVzqN+H/yTPVp1fqBqF2BzGyctUZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750135; x=1779354935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4+ZN/ez4nROwuYUMbT55lLWK9CfEBz3lhrRLyAE58o=;
        b=Yg/sYJlqloiWv5sBvhX7a93LnLUfMKWwPM9PHpAq5bNkUlNjNrMX/8MjJ5aCHMoBKF
         ZaV18OwDOU6pgeMS8YFzzgHGobYO/f0hCnDa2C6farSX0hEaGgf+KmXXxuYn8mM8+D84
         Mb2ZphvAzrgmuakPxBQj2qjF4nRHaTgQNIhrgrZGLwMVXurjeZGGZ9WuQ0QEHu5/C0ud
         gKnPDVq4BuVUBET4qpiEt7tViSJt8cHQ7VnPdEicZA9Sb53w2yZ4Up9KM20P2u9intkg
         d9XT0cOTgxMfSqoRwnjRnB5JMrUER3L3LbivFjkENmdorAkXk9Pds978pUDFH6o/ftS3
         XuPA==
X-Forwarded-Encrypted: i=1; AFNElJ+hxJxe0ckNDBz7zomkYjRNXRUOn2Ju3kbqCaKqNHby5bmxRXoZF+p4jvOb5ct9/q4LaZekqFpS0Xs0@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLee3wn3fTbYUkIdiZwuQyy7x3dFgjfTNpdKJY7Psxo6r4HR7
	RwcKO5QQUZGMCS92D9/2B4j6zj2NnzSjVMs1sURiZbgqHSiir74RtjkMLJT+kRKTwr2lLlLFDd4
	/Sgw=
X-Gm-Gg: Acq92OEpugd46zHm42lhXhtaIXWNPw1lHmu06GguiamCURhQwQ1Yr4T8HYjSxTpNNqK
	mEhUo5vdPLgXbDALegfDcRvIzB//zXGZj2Fv6wcBsyFxnne5lC6sRbJKlgsktbfjMfliTWkdM6o
	tO9hDIyDBULDFGP/HFYpO+0BlMJKXE46daw7nv5BXPRBPj7Qe5TWONOQDTwX/GLVhNXZx7mCNXP
	I4HGx6Rfr7p5KAp5DLrOmhvwjNYa0NjEZS0LTu4eEWA4RPrhEKnbK7GLHraj9Ex9GdOfgwRvhcj
	EUq/KF7Cnt6gCHqoFAkm2dcVbX72MZbm11h8c5Oxl039Ndq1kc04Czowy4fxobX+aWpFf1aLMBu
	txwZcxvsKwxP8Ra24rXs8jSEGZdlSgLqSEnjNR+11GDQidY+iUrDQHtfyBqaHxxMLG2UU/v9YvP
	07EE1CN+jik4TtbDFJ7YpBfHFdhbeNGzu8zx+MaAAcjMwQp9bNJUts/ZiA0KFQAyii86G7mmSlS
	x4k1+Y0
X-Received: by 2002:a05:6a20:5497:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3af7fb74ea0mr7618829637.7.1778750135053;
        Thu, 14 May 2026 02:15:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:34 -0700 (PDT)
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
Subject: [PATCH v4 0/6] regulator: mt6359: cleanup and add supplies
Date: Thu, 14 May 2026 17:15:13 +0800
Message-ID: <20260514091520.2718987-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v4 of my "MT6359 PMIC cleanup and add supplies" series. This
version addresses review comments from Sashiko.

Changes since v3:
- Dropped duplicate 'va09' regulator from 'vsys-ldo2-supply'
- Added ending match to regex for deprecated vcn33_[12]_(bt|wifi) nodes
- Updated regulator DT example to use proper vcn33_[12] nodes
- Changed vbbck's supply name to 'VIO18' to match vio18 regulator's
  default name
- Fixed index off-by-one in error message in mt6359_sync_vcn33_setting()
- Added check of return value from mt6359_sync_vcn33_setting()
- Link to v3:
  https://lore.kernel.org/all/20260512085358.1693208-1-wenst@chromium.org/

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
 .../bindings/regulator/mt6359-regulator.yaml  |  70 +--
 drivers/regulator/mt6359-regulator.c          | 405 ++++++++++++------
 include/linux/regulator/mt6359-regulator.h    |  10 +-
 4 files changed, 348 insertions(+), 187 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog

