Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705251;
	b=io67mMI8RPz9acmL2CSg7l/AUP+XQVesNofQA2FnrISCSfCXHtGJGYrAH9zJQOZCCrga
	 pzDrFOplwgrVbNy1RuaH1TPlVVkDlWfVuagzVSTNrpIUBHRlIS/9xShUB1WiY3vAXxAHt
	 A6TTZ7ZKsVoiJdqcEZknUtUAOHhz4Di9fZM7gL5CG7pSJimCC+N71vnUkAn18uy7ohq3m
	 kYXEzcJ9ftgC7/YhkjpfjD+gDZ0g3Gu6/WfyLMZ0KrEGYpx7pkQ/yBGt+S16zwDJipblj
	 o8GNwH4XhfEsUsJmp9nSVBDhD80a3DOyPHuPodMBJwTr60slmSjVSTjKeJFy+J1WiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705251;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RB78X0IcOyrqNjXNG6N3DX4I1/jgYJG4ZEhjhOhkzQs=;
	b=IDFmfF2T5tR5/ODOrWHJwrtjJg2njuuynjb8XdAHn2lMEKfivU6wIWFkrNXA0j10Mh0i
	 J9gqOUDow/tvzx5a2NltGn2H9F0UIqjTAZHTJDqvKkSBB6ZT77HzuJBQqiUq+2cKBn+so
	 uXPM9yKDL8ITC0YSNgr7y9Zcezw9IDy2DWOMv7SnZJzeJEGFs8M6td5bedyPWwVbk/7Yl
	 7Akf058mM46JQRDKq15e+uRp5c6YEKe1ZgCweDieRZq2KO0j3zVE4414ZNvT2z9ClRax/
	 XBVctCTaj62gmRgIM/WB8cD0V+xYpXKOY64kzAwBZOLTPRVVX8e/pNLhKKT2rMR804A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz68Hsaa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23DE606A329;
	Thu, 26 Nov 2026 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz68Hsaa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFD61F000C4;
	Thu, 26 Nov 2026 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705251;
	bh=RB78X0IcOyrqNjXNG6N3DX4I1/jgYJG4ZEhjhOhkzQs=;
	h=From:To:Cc:Subject:Date;
	b=Gz68HsaaIeYn+XU6mxagfJkVh7xsjb8Is2cqwsEkAP/7JxmR38b1EO0S/lqe6S9ju
	 h1mgNRqcQgBF4z01M8/fzrmItYD7XfRmd1ErZNS2opE5xnL2Kl10u3Ro/dO68BOh4Y
	 s75dQBQoFMwju6oz8D11MDSEOkb19Xhc3x74bAyMfSBulchWXGBJ4xjjI/wuyADs8n
	 vsPNgYr7uhLZLs80azXwtdZUDwSD5B2xZpwD8e0L7g1lP3RUFg3UBQh6Je9SlYCxPw
	 kO+7ugALNp4XOecfjUxE0W8n6Olz+7BziokFpO1yVqjHb1AdLWWTNTnfrFCAONWI2y
	 aYcRkUMDFOOqA==
From: Sasha Levin <sashal@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernelci@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8750: Mark the watchdog as reserved
Date: Thu, 26 Nov 2026 10:00:48 -0500
Message-ID: <20261126150048.2221469-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since next-20261110 the SM8750 MTP in KernelCI panics during boot when
qcom_wdt probes:

  Internal error: synchronous external abort: 0000000096000010 [#1] SMP
  pc : qcom_wdt_probe+0x374/0x460 [qcom_wdt]
  Kernel panic - not syncing: synchronous external abort: Fatal exception

The node has no "sram" property, so qcom_wdt_get_bootstatus() reads
WDT_STS, and that first watchdog MMIO read takes the external abort.
The MTP runs the Gunyah hypervisor, which owns the APSS watchdog, as on
SM8650.

Mark the node reserved, as commit 4f8202061737 ("arm64: dts: qcom:
sm8650: Add watchdog node") does for SM8650. This also lets qcom_scm
register the Gunyah watchdog, which it skips while a "qcom,kpss-wdt"
node is available.

Fixes: 6554c11efd6d ("arm64: dts: qcom: sm8750: Add watchdog node")
Link: https://files.kernelci.org/qualcomm/baseline-arm64-qualcomm-6b071ff5286e1965ecb6e758/log.txt.gz
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Built sm8750-mtp.dtb and sm8750-qrd.dtb on top of arm64-for-7.5 (W=1),
not tested on hardware.

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f46a5e8a953c7..3f76dfe0bd565 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6007,6 +6007,7 @@ watchdog@16410000 {
 			reg = <0x0 0x16410000 0x0 0x1000>;
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+			status = "reserved"; /* Owned by hypervisor */
 		};
 
 		cpucp_mbox: mailbox@16430000 {

base-commit: dde0308a2f8867806a444df1fdd7e685b1c56d5b
-- 
2.53.0

