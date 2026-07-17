Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F613F412F;
	Fri, 17 Jul 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286014; cv=none; b=kIhXuBIaZMKylBDxWILbovRmKMKuc2ZXwjs/qIGZ0XUh67QA2iJYJBGNoPtGWo8msWjt8AcAbVgNCqwj3222pMRfz0GXdXmZccKNHU8iOFSnWrQwjSjNFEL53I/SfltXIzgn7FjMBalmZCvaBsW5SnHfAfwHvnz6ZvM+Z8vZlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286014; c=relaxed/simple;
	bh=ozwm+ESiufs5A479a9txe0ioWp1X9kyFiU+g77nvRTQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LsLbcjf2BkXCbvtHuVqZhJETQWFwjtAFb6dFOZknuUew26T+uBiU4dDBBTv2M0nfJg3ddf+2xDQWllVv+qdHQW8gGadhgtw9GJopb6NzavtcvRpfZr5hMoZJz1T7ddlm9SE8uPmOpZ9GQ8ElcMH7pbi2klKS/a0niLa7d6efdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A98mbBkP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A98mbBkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7E31F000E9;
	Fri, 17 Jul 2026 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286005;
	bh=mYsxrW/LpSpNLz4FJ7ENPJA3upWCqcYKhYSHrpDliEw=;
	h=From:Subject:Date:To:Cc;
	b=A98mbBkPD4pGQqD7ul14/5ZfbrpYKwCiFmgmv0PA2aOBEveKa/wcNv1pHpC54xpUh
	 bw0iGv4c1iuI8ZbQ46zTzdHwKj4oeQ3sfDydAa4akYf2wQj+A1a2x7bwyzksUWoiAc
	 oLQEMaBjPDohRYySor1t28PTYvVcKmplWRO/n2KLMhCCtHidTJ8hZe91nAYgJCLZCM
	 kKsGEe6V9Yo3W34xqBq6njWjOKuaThL+Lo6Cn2+w1gU1zUEQLojo3R3fAbp/12LZs2
	 qmstH/L2Y9kzNklg4lAMz//NmNToHQc0MfFE8WmwHH9lkA8eMvtTNQYky1R5pSsHKN
	 yQXW0fC1V1WgQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/5] Minor dt warnings fixes
Date: Fri, 17 Jul 2026 12:59:57 +0200
Message-Id: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBCFr0JmbUkpoUFX3sMQgsNUSoRipxAN4
 e4WPICbl3x5fysweUsMl2QFT4tl68YI6pQAds34IGHbyKCk0lJnUgQ3WRT9PJLSdRu4NvZNLDB
 XlKMpC9MaiOXJ02HE7q36Mc/3njDsa3uisxyc/xzPS7bn/p4smZBCkcRzkTcaZXl1zOlrbp7oh
 iGNAtW2bV+lcx/H1QAAAA==
X-Change-ID: 20260610-topic-june26_dts_fixes-c32e3cf85fdf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784286000; l=1841;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ozwm+ESiufs5A479a9txe0ioWp1X9kyFiU+g77nvRTQ=;
 b=DF77fHTA+T4+rvu7DJjyt+kD4TbiX3b3zSddME6Nkbpt8YP1FicCYcR089JGgzp1VGTw9o+2L
 ZHl6Ox4yeaKB3OAL8BA8Zmjt8Ced70aITXmWwT6UeMRUx+UQWgXIAsv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Nothing particularly of note, mechanical fixes

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Improve commit messages on patches 4 and 5
- Rework patch 1
- Pick up tags
- Link to v1: https://patch.msgid.link/20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Apitzsch <git@apitzsch.eu>
To: Gabriela David <ultracoolguy@disroot.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (5):
      arm64: dts: qcom: msm8998: Don't pull-up I2C pins by default in sleep
      arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
      arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
      arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply name
      arm64: dts: qcom: talos-evk-som: Fix BT RFA supply name

 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      |  4 ++--
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  4 ----
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |  5 -----
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 24 +++++++++++-----------
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  2 +-
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts |  2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  2 +-
 7 files changed, 17 insertions(+), 26 deletions(-)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260610-topic-june26_dts_fixes-c32e3cf85fdf

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

