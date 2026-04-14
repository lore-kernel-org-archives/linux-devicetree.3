Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D37F3D6CBA;
	Tue, 14 Apr 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162840; cv=none; b=QdoTePGfcOmVqrzr/WplRlO63T3vrHabAI7slr1FLBgOfuHVgunpRt/TxGMT/Yuh+hJ6TkdMwU6ppgNBDeAvTgN9nGwbAlXJWiiOZdfbuAVQKp0cI51liyYh14dgtyVtK2WmKiBJsrHbAzhtPyqnhBmgsGapJSdHSkcAuADz2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162840; c=relaxed/simple;
	bh=peArRsgSCdj7tCOZzX4QtAqjUdjIstvhefAfXi/8La8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ObfiIdlFRWl5BnNxa4u3qmtm2XP+QDdALJZXFeU05W3tDufw3Cs6yrrTnSYSm539Rw/t8qimA56hlz/UWLWq1SsQVeZ6F2pNtNdQ15TUVhdD5fGQCXRlsSHDcsEck6QAZID/4fy7lkcGpAdHA8Bjkty6gXNE0v99hLtPFdEzl+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JO0JIPLx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JO0JIPLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162825;
	bh=peArRsgSCdj7tCOZzX4QtAqjUdjIstvhefAfXi/8La8=;
	h=From:Subject:Date:To:Cc:From;
	b=JO0JIPLxnzATb3XL7LLUAIMuCPWiB4uDlrtuMDy8pkPSk08izy7xNRM6+a1WDgBoF
	 Ff+48Qxg33kZg8++zzDQsy7hHMZsEfuAO7TvFkpmccR+Fvu/1ikEXWwFWToYFazr8p
	 PsObnyrPPbl5sY1ZnnG6WzcKvFd6xFOgr732TdqqnIop+1rVubZ5t1rrtSuPi7baeZ
	 QnaAc3KOCUYP8b9dBCDvX4Zhio6Ud3RtlO5ozS0d8K7TpmsGb2a8kru2OuOLR83zl4
	 6sSat6EgsCsrd72VY3qfu7OGh9zUtB8tHrG9QCqYgBp946p2oFg4Oq6Ajc4c6KfURa
	 g/gw16G01Ky2A==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A89717E0EB6;
	Tue, 14 Apr 2026 12:33:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio 510/700-EVK: add CPU power supplies
Date: Tue, 14 Apr 2026 12:33:30 +0200
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NywqDMBBFf0Vm3YHEqin+SnER09EObWLMowjiv
 zfULs+Fe84OkQJThL7aIdCHIy+ugLxUYJ7azYT8KAy1qDvRyCva9MK5lQKVEGh8xpi9fxcFNlK
 rm+7GSaoWyt8Hmnj7ue/DyYHWXBLpHGHUkdAs1nLqK0dbwn9GwHAcX6sad3ecAAAA
X-Change-ID: 20260413-mtk-g510-700-cpu-supplies-41a78a6bf175
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=1365;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=peArRsgSCdj7tCOZzX4QtAqjUdjIstvhefAfXi/8La8=;
 b=NXk+aPBqN3LNQq+MyWv/ARR7Zmgai7cJuc9VV97YVOvAoxADMXzwzGDLeyBqBj1iszsiacPFG
 dOyhAKK8+OVDKdRepioQuYsNVf6/XKPQKBty+njlyaNeyLYw7+rvZ8s
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

This series adds for the Mediatek Genio 510-EVK (MT8370) and 700-EVK
(MT8390) boards the CPU power supply definitions in their devicetree
that are missing for all their CPU cores.

On the boards, the big core power is supplied by a MT6319 (sub PMIC)
and little core power by a MT6365 (main PMIC).

Patch 1 adds the MT6319 PMIC support that was not yet enabled for these
boards.
Patch 2 adds the CPU power supplies definitions that are common to both
Genio 510 and 700 EVK boards, and patch 3 adds the Genio 700-EVK
specific ones.

The series has been tested on Genio 510-EVK board with a kernel based
on linux-next (tag: next-20260410).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8390-genio-common: add MT6319 PMIC support
      arm64: dts: mediatek: mt8390-genio-common: add CPU power supplies
      arm64: dts: mediatek: mt8390-genio-700-evk: add specific CPU power supplies

 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     |  7 +++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 68 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)
---
base-commit: f244905cd8cff7a7249cd3dac8a366e02d61ad4f
change-id: 20260413-mtk-g510-700-cpu-supplies-41a78a6bf175

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

