Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502A43637F;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589929; cv=none; b=DDgqaqXKjjYLlhpC+oLe2sH3VxACBvH/Q1BuDlcoWiX3VlvupjjoTYJPUGwS76C6su/MWH1O8+0swxOsk4foXb//340aKEwGLJUrJC8HmAcntgZwI8fYyiv2mNVzoI1FByvkujL0bzWc/XZn8qc7zptoypQc2GowqO1c1CHCkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589929; c=relaxed/simple;
	bh=hbnbdk5hcXpiYf5E3X8ufCwSA0tJeSFQ5rt8/7yaBNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dqJadxTl5RfdPZtPfN9auqpW0EC7uIK9l/akqyiGkp4OrYME1YZxeaStvioGuh91ZWfxMSwGnvvXfXvF0LDzHmf2BPAGxwGKXnAt1M43p9GTpQmjw+GERWocUp7P26QDZ/RnuUH4yYsySNO2CjvDxO1SlV6Xqi1zHjuyDvbYnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpwjZxQa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpwjZxQa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A8A0C2BCFB;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589929;
	bh=hbnbdk5hcXpiYf5E3X8ufCwSA0tJeSFQ5rt8/7yaBNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IpwjZxQatwEe1UoM5dFR/73BbjjlHYCQ0G0FgdPNMe6QBUNusDa8HXDTF3XkfAPqi
	 KuAbtKvOM/6cN5HloLgHqGkpdJ7Z/3JgxK4auJTyXgVRRIdkcw8A91yFpdzj0KuMtn
	 SGzsPDYW2Ox9z8EfrSdACTeyMBaOAyN/IsNBIgDD10J4QE7gN8Uw9XgYxeHdyfzLHt
	 lzQHJSI12xM8/Q9MSJxOu+llMcHSfc+BJ3ukbSBHhxswfIBYZ2TALNrXbyNPEiBZJu
	 CttIBLkRXjhLlTJH2aM5FbvqEbVtPFZjW0/VZksVnwZBm7Nt9+kwexvvuhYenJ6EcO
	 jMBXS6DwEH9JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFDCD6E79;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 04 Jun 2026 18:18:39 +0200
Subject: [PATCH v3 03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-surface-sp9-5g-for-next-v3-3-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=936;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=G99UBcbrZwtaqeqPJRUSaHBYDMjBAma4TMxJ7Y0s0tA=;
 b=odZyReNdb99FgoeqjyM6fIvUCH6gHpn51nnSK4wb/npORtUWhHaBsdredYAVtZtuUzc6hmoyo
 xgGwfI3EzcVD6jfrnyBx5G3rIpaExZJC/SSGnsJ2EDf4XE4rVwPLPkJ
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Define the USB-C orientation GPIOs so that the orientation is known
for the two USB-C ports on the left-side.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


