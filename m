Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702220;
	b=VOiZtIvR6F7uBKqHK7JVf6o/E1FA5+YYaShcHJ02X+Ee43Y8tmW8blucDKZTV0aqbj0Q
	 2ItnmiNxzYsGGVuXz9i5oTgK0FNuBgOnS10JTYujKjZRprhpOFSbrPOGdk7RW8y4YmD3p
	 tPlBqyQMPOV08wSoIwSLte2kYYAoe9QR0QiLBu1IJpdSKLQcxy8cMhpTE5X20MPcqA24S
	 t5OvH2euadLr0Dzxlx0fG/NrYKVzYsZb1YBhIDKuwn8/fDOTG5EoquMnys51jwoBTNECH
	 fuNeOZeqa5iLmFjqztML60+hoR8QuRrVtwEDyPcFnU2lwI/cm0XG04zoNqONLHvLxNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702220;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=aiSa+52Dt9SE/lSULJzxwYlzsSPsTbxSxyg8vrv10uU=;
	b=1wEFkUi1pPzR+81JdJX4AH8zya1eDdg+dDt05I7dG0BKW0N9F7ucO02pzDWNdCEMY3rZ
	 AqV/SMz+pMSjWeStyF+iIgaKdPpSTkLC/UMsRt4M/4lFybrUnezSj+mFaI1woD0mX9aFt
	 o+YF4PN9ChH76IpZuVFV0rfS4rImsyOaWFZlFw7+VaMs3hQz5G57L2ygFe0ZdU+2WOKHJ
	 RzoHUei3a+3E9eQkCRofLr3eI55p5xuZtHBbNNCvGtcyMfJHspB6iiRhxbul4MjOFIlmj
	 hK3Xq4l13RCvAIFvYVpAdzJGfvyUBXvQNr2GpAKMmSEyF7dbkNhzeqvL9W/gmP45hFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1EKIpLN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B0606A31E;
	Thu, 26 Nov 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1EKIpLN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795702219;
	b=hZokeAUPO/dIStJW2l3uJfzll3SafQpAe+Dic/8dJwCSTzrsYtWKQo7o7319sgQwysPx
	 EyPzHuZFdgWkvMd67hFXNr4eUcucY2P45FAcnYkti6qx3hM+E4+QSgOQdsLdk+Lv6K+kO
	 c9or+xfKf8EnPzjTCKqea2hW0DSz/zb9KZsGyoMW0nWB2VP4vyUu6mKB0QKvVwQAvVgbM
	 3A8cs4pcqRo89jVeLU9p45r0SHlA7lOQWUoWIh6g0rgxisQELpGxuB7mQJgehI6INCPvM
	 ilcV/Bf4lRAqUMSALNIQRenH9qQ8e9Nn7sV/+L/A4OxsWBmtTl+fnk45uEtM+0WJuVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795702219;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aiSa+52Dt9SE/lSULJzxwYlzsSPsTbxSxyg8vrv10uU=;
	b=alDvqFUJLDg/QI0Lau8HJTK/CjyTnmf7tdQsB1aLHn/YcxjO/ayYSJLWexPDrrlFB1S6
	 Ej5ZEHubvjRk9LkJa882gms0HMqWDkvqRUcpAfKH6ta1EfBRpQvJbFFcnooXtlQmhWsAK
	 JCtC6uFl5G/mC8ge7/0oCO/Os5iZ6m0tv+O3XWNE2KsfOxHfb9L8lbsiowwH6py8YNYOK
	 f75GtGcB5+9Ihb+rjiha6yFbMNUR7migbH595ev5xfeJo+RhCSfeqhVa2RjxMGUnmSpCD
	 1iLUYc1KQAR7b/dYU1iV44NSjbkvNxuyMvp0FZKXz5UXvFp1ofWLzKxEIcxeZ985kRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 027D81F000CF;
	Thu, 26 Nov 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702219;
	bh=aiSa+52Dt9SE/lSULJzxwYlzsSPsTbxSxyg8vrv10uU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=E1EKIpLNlme45W/4g/3fv1wKCnebvk4AKqajwUKB86L6U+6eXJUVTlFJdvpPml9iK
	 kO/M4RMfK4WvTZEn5VjImtDeyGWa+a4qwFES+5F915BFVwdWmLKoIcNnHP7+5ifee2
	 Ag2lW63VYDFGOnyyZCTznQSEubN/T6akCM9TAaSaGhk4scxUv6DvM/sgQCW//IrUPM
	 xnrYW+5ESgQSBtgPj/j+JkEyjTzMCeNIMTkBc+Y0ciMqLMmkrYqTOsoLMDFMDGKLga
	 2Xq3Pz7kAUCUlD1VaL1ii9JQGIAma9d3OAWb0nAN5ffSFTAMGub4tAFJuDAOxW34O4
	 6NhvoMkIQCRfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 648AD4D57D;
	Thu, 26 Nov 2026 14:10:16 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sc8180x: add IMEM and IPA nodes
Date: Thu, 26 Nov 2026 15:10:15 +0100
Message-Id: <20261126-sc8180x-dts-ipa-v2-0-e919ed1643c1@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMc9CGsC/3WNzQrCMBCEX6Xs2ZUkGk178j2khzRZ2wX7Q1JCp
 eTdjb3LnL6B+WaHSIEpQlPtEChx5HkqoE4VuMFOPSH7wqCEukmpNEZnpBEb+jUiLxaFMFST1q7
 uPJTVEujF22F8toUHjuscPsdBkr/2vytJLFGkr+5O8tLpRz9afp/dPEKbc/4Cor6m264AAAA=
X-Change-ID: 20261125-sc8180x-dts-ipa-008e9e55c9bd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702215; l=1209;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=Q6eOgzYuDQdWByH1Fa1iUBFwIliyQWN4q9ZxgGtM9pw=;
 b=ZjDAAWAcf6DtlMt3HbRW7rtIMrNrbhn9AYmWSPDBXaCBPWScGpesoj1ijewXc6C/YHT/EdB+c
 paFEFqvB8VMC2etZPeGZZ50y/F9EQrUZMp2Y4/3I7n96rO9+Vjg18BX
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

Depends-on: https://lore.kernel.org/r/20261126-qcom-ipa-sc8180x-v2-0-89eba621da95@gmail.com
The "qcom,sc8180x-ipa" binding patch in that series carries a
Reviewed-by from Krzysztof Kozlowski.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Changes in v2:
- Document qcom,sc8180x-imem in Documentation/devicetree/bindings/sram/sram.yaml.
- Add the SC8180X IMEM SRAM node (sram@14680000) with the IPA modem tables
  slice (0x3d000, 8 KiB) and reference it via sram = <&ipa_modem_tables> on
  the IPA node instead of relying on hardcoded driver IMEM addresses.
- Link to v1: https://lore.kernel.org/r/20261125-sc8180x-dts-ipa-v1-1-12e54c7e13b5@gmail.com

---
Robert Ijtsma (3):
      dt-bindings: sram: Document qcom,sc8180x-imem compatible
      arm64: dts: qcom: sc8180x: add IMEM node
      arm64: dts: qcom: sc8180x: add IPA node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi            | 60 ++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261125-sc8180x-dts-ipa-008e9e55c9bd

Best regards,
-- 
Robert Ijtsma <robertijtsma@gmail.com>


