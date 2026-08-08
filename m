Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D34723E325;
	Sat,  8 Aug 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183247; cv=none; b=tVvSg1hSUHlGcAXFdDZ8ltvmvv/1oIvGLc5QkZRs6NKapgo4VMvn4DbU47KbAfuXSQXVKXwtCGRzkONqw6IBytEfYg9eAZnvYueEf+n7exOL1R5LINl9cnsYa6f9jmg/ZSE/GaIaq4lTJpQo7FAUfnKLUB9K4oL91grAKwKaT+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183247; c=relaxed/simple;
	bh=a1J2XgfyQBKWmYJGrTXLbe2wW2xOVMHdK4e8vCdBE+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M/Lya5v5C94FrRF4nil75ZM4w/ZIbqm3wH/tHIwZYMGEIzJLvnsmw+xaAyNLrZC8nBbB/3xx26Fhap2qYzLIYh3eEYwe4PAMBZoqvlM7EXJY+UShnnZauL+qjJT+B8yIHCV1/Oc1IlgXQfq3HcBM+Y2oQgFhgBQbbl8xmhzOn0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4941337b1;
	Sat, 8 Aug 2026 18:00:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: fix adc button voltage on Radxa E52C
Date: Sat,  8 Aug 2026 18:00:00 +0800
Message-Id: <20260808100000.1518466-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fe0d13b9303a2kunm6a2cc1c465c42
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQk5LVhhIGkpCHUhMHh5MTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

The ADC button voltage should be around 1.8 V, not 18 mV.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index 854c118418eb..1eb919a58be2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -29,7 +29,7 @@ keys-0 {
 		compatible = "adc-keys";
 		io-channels = <&saradc 0>;
 		io-channel-names = "buttons";
-		keyup-threshold-microvolt = <18000>;
+		keyup-threshold-microvolt = <1800000>;
 		poll-interval = <100>;
 
 		button-0 {
-- 
2.34.1

