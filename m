Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9E4746C2;
	Thu, 13 Aug 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622401; cv=none; b=m0U7fRBYqVn9zGUXlzeqe5z3VkStzJPVYeaFfHw7nXkLAa/DGyvC9iN8IEc/DKjmNpd2cPu/w0dWkXgL2iphmnPfK/Bsp6ZsOGwxEnVjWS6Ho1YIFPIChsXRo1LzCzpnGvwNhOglP3gj3hMSxMPr8Troumo74y4H+1oDHJ2mft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622401; c=relaxed/simple;
	bh=uLvqSnLxFTr/El1MUjQjU5tqTpJ5ohRAn7CKilpJxCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZ4RRqd5TZ/ed1FXkYcnpNnmrbPh+YY0Gzv3/59lbvW17p8KYMtQ8VSdH8td1o8K4Y8Gjo+3QNAsLjusU10R2vJhIzv0z6Tt3o2f5pLEesT1jRnMJHnRXMfto7kr2p4gHLKh8EskleToES/ykdrcihyBqe/SnbQSdJFLMQCoDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIuftnYb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIuftnYb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE39CC2BCC7;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622401;
	bh=uLvqSnLxFTr/El1MUjQjU5tqTpJ5ohRAn7CKilpJxCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jIuftnYb97EcU4lSittDbG2omUlz++SJbnX7RSS4N+MRpMbe9WvyOFi3HLds+nZq/
	 zLUH2p4CUOa7XGD5806qyBP69SgNdc4WHL9XFkRkKBZUGn6vDq2umTvYB+xo1CHGPF
	 2CI0C2UZtDHRob/r/JwJr2KsQDBi/muBDDNcGqurEEsxq9NjjS6vkizIJZO3Dgm5fJ
	 bVPTpB6fNie/e0GqiyPwlPbH8plita48zovkKzKd6sApGjPvXeF/AADvV2yo5mqvNA
	 gpm3NtSTgLx5JLphAnAMoxBdcNwRmI5z7pXLevWVsjUG/IKXUeTLfw0RuGKvihBJVL
	 AfW1gACuqQPag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7631DC5DF74;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:45 +0800
Subject: [PATCH v5 15/15] ARM: dts: aspeed: anacapa: Remove redundant vhub
 pinctrl-names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-15-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=708;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=wZdptsf5KZoTZdsrUVb6bffHaz43HHnvSy2YjypcUzQ=;
 b=MNt1Xza2YC6AF1CLGYg5+fmVk3XcUzlYvu95056SM6MqhkXzcaRkrr1IQA22bjZap3PORfade
 w/MHSUsshQbCLMjz2y0SW7ThkUYvZHr+3ilQAmi6wMoioflnFU1XQyj
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Remove the pinctrl-names property from the vhub node since it is
already defined in aspeed-g6.dtsi.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index d613b5b9d6b0..039b016ae06c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -1106,8 +1106,6 @@ &uhci {
 };
 
 &vhub {
-	pinctrl-names = "default";
-
 	status = "okay";
 };
 

-- 
2.34.1


