Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8B470454;
	Wed,  5 Aug 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934991; cv=none; b=vDnGJHpJd9gQmnU/JIEEMwADFXRosLeJuSVJskBZ0EacRYG8iNFCiTE3S2sXL+efDx5hkIZ3xEmfbHAyQXUgW9rmI5b/SZfB4I/pa+hfuF5rvcRMhhIP0ufmP9oWLW+UQvXwSQ3V1OmRBMqIJPHrYEJnd+K8+eSEv3k3SDpbHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934991; c=relaxed/simple;
	bh=LdloDJM8DI8AB4ZLQsP/+vZzjiWKgFCiLWLBMA7iRMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esI07Y0wRLtDqMx5ky8rJDZMyab6NXXW7XSyPdfnu0QjqjyQWPDcQf+VPdnFkyz7jawBV0N/0mUh/ac4qSbl5P5HGoctmtCr/hFwe+DrW8dSIKehFjJdzAzUUqpTK6CexTllfwFwYhvr7VOYjQOa9zfc4bq6H/Lfid0ltOhdmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWqxjPCj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWqxjPCj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E649C2BD04;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934989;
	bh=LdloDJM8DI8AB4ZLQsP/+vZzjiWKgFCiLWLBMA7iRMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eWqxjPCjwCfgR/epli6oVNNb/qBgurRKnG61rPed6+cNt7L/dr9Z8+pnPQD5UJL6E
	 01SNxuHOmj5fxEGa9Ip2EVYLTUvCvBSCit4R4tJKXKRyex+1Un7VH2P1HdD/T/FfU/
	 h2V5/hP3C/CkCm61TvoAJa1rUllapXYRKgtHGUzlTVm4avFViBo9KbdshM8WwKk3PR
	 pT49Xa6XkhP8984wDU8lWYaqCPKFiLBXPLRaRfrH1fU5Bek/Puy/BNanNC4ujzj6gc
	 jwoRF1BDuWCGs6R8c/6WEdZ6hlz+xNt/DUF9LLUuVbPQw2k7Qn6HfrlGoq8WqzaE6F
	 dggNI0Ky+oATQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09059C56207;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:33 +0800
Subject: [PATCH v4 05/12] ARM: dts: aspeed: anacapa: Add additional EEPROM
 node for SCM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-5-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=1250;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=NAF+xcmhfBdWvCk+Ea9KmPCdarcFxDgMq2cQBYIvfaY=;
 b=wpqf0DC+1LYoo74qwFuJLHClCkzNFOqzu9etJpRAXMv19z6UtEFsANYU7piTdC53+d2rvOpU9
 ELG5mCU+j7QAQmdgL6n//ZCOtfQ4pb/yTyh9KNGmWK8vfT0Xu05wZ9k
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

The SCM FRU EEPROM I2C address differs between SCM revisions:
- Rev B uses address 0x50
- Rev C/D/E/F and later use address 0x51

Add an additional AT24C128 EEPROM node at 0x51 on i2c9 so the same
device tree can support multiple SCM revisions.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index 4a6ae7c6cbf8..1901a325c72c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -8,6 +8,20 @@ / {
 	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
 };
 
+// SCM
+&i2c9 {
+
+	// SCM FRU
+	// | DC-SCM Rev        | Slave address of eeprom  |
+	// |-------------------|--------------------------|
+	// | Rev B             | 0x50                     |
+	// | Rev C/D/E/F/above | 0x51                     |
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+};
+
 &sgpiom0 {
 	ngpios = <128>;
 	bus-frequency = <2000000>;

-- 
2.34.1


