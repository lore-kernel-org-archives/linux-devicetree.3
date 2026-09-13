Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ECD4BEE21
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303073; cv=none; b=BDbSZDxwehjrxdvZRq8Bz5zae3GTV3oF3HF4OeBMtgogmuV33DDIB28ItANNMBtNjU/Xk419uMLoXgjll4aKg4fKUhvHB0aOhh+NSUuNi9aW8fdf6s+ds47fFfFNQZ5Tdpx54q0mvBbQ/6KQlNhGVnXAPnf2dOiun/qB1eD/8HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303073; c=relaxed/simple;
	bh=DHiSrDaF7ntikY4DDRu6z4jLdZj6Ur1+ibp5ltAw+fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIjrG0EUyaQicRPqFUQydeZdBan4UbA6qCcWI49bt7L1u2l92S19q7TZToaEmPVokL1ByKE81r98p/u+I4ogb6q00TssBCkoQ+6cvUhJV7JNwUMejM46Jtm/LXwYtL0Mhli+kl4GPxmVRlHMoAd3puIH4okCGFjuzegfV8niil0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=AgiWbpM6; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="AgiWbpM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1789303070;
 bh=8C1mtlOBb7/mwHTUtdF5nW2Lo4LQe1sAVZjBxRdWHUQ=;
 b=AgiWbpM6hBgNRvLTgxMYA5XB0tsgMyZInwrB6K/993wETIwMLwVvEX5RmvlOgeeQorAdtpvGf
 J3lN1kQhlVPSdwuaP82aUoKZ3rKCHPCAUOrbY9Jpk0dRJsH9+Z1ul3tByqKYh4hLq68px1Nn6Qx
 FdSNzA6YBqLmD9gM4vWqylA=
X-Forward-Email-ID: 6aa6991953bb319e9d04cab4
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH v2 0/2] Add Samsung Galaxy A21s support
Date: Sun, 13 Sep 2026 13:37:38 +0100
Message-ID: <20260913123740.203698-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a small patch series which adds support to the Samsung Galaxy
A21s. This device is part of the Exynos850 SoC and its device tree is
very loosely based on the e850-95 one.

Thomas Turner (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
    (SM-A217F)
  arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
    (SM-A217F)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 194 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 4 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

-- 
2.47.3

