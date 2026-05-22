Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7D3CD8D7;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=HErz/4KXSEdkymL2RMN+PB2IHKOsMGl/+jjz13RFTc+LZbuoILEYAtNxmVe9jPieUK7du51ODzdW+GeFKJmxzz5/URn+SXQagQC6ImYZnxhcZH9pGZYt32UiMcPRD9f5hozuKvTmem6R6M7o+ghNEaJg4n/WbmyysR5olx1IOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=i0HhI4WSvmMGbsbanuOcQvR5kMVZvQReHDRlz+BKBhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e02F9TjCNQOf2r/BN6A2jAM570Mg60RXWKlipq0rMV7ofDor4HyvrBjChtSlPXZ7r6VQQCRFYwx+Hyg3DgBJ5k5vIA0olFwg+dOE0NVrPGK/JoIKBhpjwbWV8XOECPDfaTMU78/qiiL4NHJMTsJa4mJbEWBoseLjq4EPqhKdPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QncHSb7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QncHSb7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F211C4AF0D;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=i0HhI4WSvmMGbsbanuOcQvR5kMVZvQReHDRlz+BKBhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QncHSb7QUfsmdDL5uXUb5CisiMemSn3Q5WwsfuI+8SVuR5IOyh60tnto29v91TqMf
	 a5jG7DQtJnOppNqv9OtdReflLqEgDJHaW5EGQqkZWqh2vAtJHhWRIiAPgkLUjAYGsd
	 3PcO6Uj9hgyQZBUUiuF6LftZnjoaV3J8e/3ulhzBr71wxcfWDGTWtubwfRPaYCyF06
	 EeUgdqWV7cE/FNmlB0xVYmLuFborgdFoYBKnhtnTLPZWcBpTH47OE24bmJf4sPkERc
	 ImROWCnr+b/yY7PjlGTJuMuKKNd3eECZ//3TgjfuNBGIoYC29JelU9hB1fpBZdrvzP
	 P5kqcXSGu7Mgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335A6CD5BB0;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:19 +0200
Subject: [PATCH v2 03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-3-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=875;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=kQpmZ/8szILdlQdsTvr0HbOSgibKcpTkyu/uRa4aSDk=;
 b=Vvgfph4BG/sNgeSvmfzNs4O7o/SrY4HqNc0PSxuyZfxWSeVrR8wi2fVPmV6eNzV6WynNqixv2
 ZAmmIZg9dYnC3HYKQ+v323PQ8+J3IfCB1XEKnpmwBJGXj/IDgum1kSa
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Define the USB-C orientation GPIOs so that the orientation is known
for the two USB-C ports on the left-side.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 476e17415da273330e3638e040db9cd4ed408bf1..c3b143ed11c73b7c1bedc576c10af8db30effc36 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -60,6 +60,8 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
 
 		/* Left-side top port */
 		connector@0 {

-- 
2.47.3


