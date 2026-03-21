Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776931DDE5;
	Sat, 21 Mar 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112437; cv=none; b=YLB9bHclcorlLaJqidtYwqeJALgQxVbmuXm1fWazWxEWAH7LKiBQiGBRYnbSuSRn7Fphoa2NUv3d4B0Kft99nAusNnqKiBJ9Yq15N7kOeOJfxMbW56IxPCJ4NQpQpSm8MBzeOKRpL0SgrV2bunxg+5mz+EF4FuyG2uXrwO0ayog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112437; c=relaxed/simple;
	bh=31Wn8gTJKr7IePv8f/ZWHrQ+JtqvCrMcatTQJfCRkfY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bm+Sir3C7UWuxNK8xpU2XFmtKjd6OTiLwWI16pF/AZX/6Jo2Vwjz3nof6w4tv4EX4BOvfWe+khXzGJAH1LJPyJ9hl0MDOIjtW3qFCZPH0B0ASH9FLvuMcP41oMRWGUabTJtkFajGxW/Mp7z96nJcHYg10Tn5qE1amN4sw+SAYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=l2gHBqZD; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="l2gHBqZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774112427; x=1774371627;
	bh=1QdQtd3YsBGj/aw7mHLvQL0i2gLAiQ7RwQTZZXlk4CU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=l2gHBqZDekVGY86oyAIOTq1hHCQgqT7jfQC9a5udMwgFOvZwDA91DKhQ652NO61d0
	 GHllV0XM0fSdRRGFeWx5IWbzJIgtkIGspWSC2Vydmd9AzTnaVCXKDrvLGMlh1/kUlO
	 bKQMfi9xGvzHh/iKBzbz6yenhQttre6BPadW0pcZBmt5uC6yi4bItNu+5H6YCAtiZH
	 vmMesoP1bt1KLyMHIKti2NVgFy6rvVaHSXj+XYhB+3Lg/2shdpQZzdddHmIdv+dyKq
	 fPXdf3GXzwHfoVtUGuI58sYO0z6Yqmu70g3eb4QqrmMAoHv67AyOqi2WNXpuqhFpbp
	 in29eiKJCohyw==
Date: Sat, 21 Mar 2026 17:00:23 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/3] arm64: dts: qcom: Add support for the Nothing Phone (3a)
Message-ID: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ca399633c40f7f71e320f7fdc22088effe42529c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series adds initial support for the Nothing Phone (3a) smartphone, whi=
ch
is based on the on the Milos/SM7635 SoC.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (3):
      arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
      dt-bindings: arm: qcom: Add the Nothing Phone (3a)
      arm64: dts: qcom: Add the Nothing Phone (3a)

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   4 +
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 964 +++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |   2 +-
 5 files changed, 971 insertions(+), 1 deletion(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260321-asteroids-58f7d0bf56f0

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


