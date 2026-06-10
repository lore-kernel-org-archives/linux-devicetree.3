Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377ED404BE7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089885; cv=none; b=LmHEi1YIGsi0MiZKiBn3cbzXCNKq8725qvZbomXelqEVPeDN2HS4qFCeEwqqqILxVNXR+q80JycuyRUpWoKjv/d268zMPtXmReWeEWXjux3VDC2ubsOqZwWL8EArZ7NPkkms5pHHVVsNo2X06FmzGzXRYsjPE0tKR4BG9pwsHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089885; c=relaxed/simple;
	bh=TOj5OjxrruVphHTMiT2EGjrkwWWLSP4XZSWSQUFM7DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BudvtOSCoYo/rQRxwKOQ8LSE04X7/8oo0udGYhvueqqF1pnjeBXMnzoPlP8wHJpTXEa/k3bJ0IOZCRmdIc6Pxjlc+T8mkW9d2EjMxHgyyVAkuoXWRtmLsMg0Rm7LVdmz+WnaxB20bcMcnd81oPrlWS6sCZ8bsLG6m3EQOG18uZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs7mq+Rp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs7mq+Rp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf114b0cf9so60570875ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089878; x=1781694678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06m6eTJZDZPQJ7w1wtJsPkoURM31DLSHf6Zo31tPFoY=;
        b=cs7mq+RpG6dR6AXshfcBjj/ymvMRu6LxZjL+FKjjm4p9svuWUzwcHwP/ALx5BdfQok
         j+IKXV7L1qKkXEeR3e7XUnCRBNgDF1OsFRaJH9v1s+NTpangFRqraJ7xIWryM4/ldL+X
         M91b0ngs9QS1qx54kbTYO8zLCGsaC8FbKChbJ5g5fdOfci6I/3+kdoXZZRm8Y42Tcviy
         l5BAp5u/1hiS8KjtfdAjR1g0Gvsle/KvcUg+wDT2iEeXcpzEtp5DVkGknxiu15YezFBA
         mcKSqzNbAa3f0ajR9NZW3/vgqEJJiofkJ+lIHtRs50WYKTCzRNPaYe4dloOD5ZxFpjml
         ZwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089878; x=1781694678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=06m6eTJZDZPQJ7w1wtJsPkoURM31DLSHf6Zo31tPFoY=;
        b=sLJadZyVGfw9wWGgYxigzBrcL5pESajY/+AknOAsFeMx3iBoCluUc8Z9D4rC6MSi19
         CyrVuJCdRGdSyP2KcAPQVk3++NPs5yAx4uep+gudP9EbYUoO5UdJ3ggiC65havAotRCv
         DqM2x2VaFrh2IxUJPybKq/8ri2diQL38Xg6dDQ30Gqwslc92lBnKMy3Uq07gSauAFmI/
         o4ZQa9xqFdt2WkP4jOgEwA1dyJOco6AeLkV5F81fQdSGeZCPZevAne4GameDi+ENA2dr
         qUFOUsyhRIxJIstsO126nuvQVD4Q8ZzwO5NMbeghx3fhRrYeMniTK+d6LY7v+d5bO3rW
         vj2g==
X-Forwarded-Encrypted: i=1; AFNElJ9VZjfpZwA8pudUDZ74iMbsFpYPLPWGNunNIoQqpeUxKLioBKm1nIKKxccIgQ8GjhCebuL/UXeVLzLA@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSINLObXlQV1YGMTA8H9j7Hzt9iGrp1sad271wVMOMCCjy13c
	/rF/KPRViUd51IwSn5mlfLeDiV025hP2J5lY0qK9rommR03n4TlvI3dH
X-Gm-Gg: Acq92OGMmu/cvmByAmDTEL3OvmEdpjCYnzDHctYyfQ4EKkz/L6/4ZhL9SKCIsvuUWY4
	eoP7dxn35Q8ZeJSDVulJk7GvcIle13mTi0vJzhEsdUl5Ta1GWMhkkGDN7sNuu2VVOsU94lqebir
	FoNGTBmRMsXb1YK6JqFBgeuwY+t236zLDgFNrDdjf8TX45sLN3f2VgHEk8d3fmZ+GbdkSaZ4gkk
	efmhiCoEV+PBM/w9tB13HN5g902KF8oI4pjmGSZV4uVE1y9d2IvUy2PzSf48qUyOhQ4xcQptGxM
	i3syyMv6rciIh0WFNztoxBb7I/1nZe3vH5LgHjL3LEoLdgOIlzJyXcOg1xQP4n//g2W/q8DWjY3
	/UgtSjun9MYG2g8iA3eTGjeUILHSwPaiZ6LMHy6TsTWX/kY+ln/0di45Pvctgg5LgUXuOBMjai1
	s/C3vpvjX6HsJ+KEnwjMGn+wm6wH3wJU0YfEAmyw==
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr280552555ad.37.1781089878316;
        Wed, 10 Jun 2026 04:11:18 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:17 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:31 +0530
Subject: [PATCH 6/9] arm64: dts/media: qcom: keep PLL8 out of Purwa camss
 hot path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=TOj5OjxrruVphHTMiT2EGjrkwWWLSP4XZSWSQUFM7DA=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYPxDDLtCkxvbn6f4FJreQtb2Zfs33lMRdPL
 +pACyui44iJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDwAKCRAVlYpeERwF
 3ieLEACVICuCKoukuly4K7kScUxZ74qX8QAG4zbHFuiq7U94MhTncgezdfSWNrVxWQbmUtrbacm
 BXIBD2PS9ko97X5H0Ch32aHBTRmEX1oNGd+iIdOfsZwfapINTymnBGrDfZ4mWsGObV965OJi2tg
 TCmpD5TOFYOVQiHtlDRWrLLFCr6O0wUp4+4ebsCySQDTrs3eU7xqtZb8BheDCmmym0PCKreaF6D
 2r9G7zium9UGoIOcrcjIS5jbXRnYDWxG6aeFqotOZqIZw7YlHUCUQer+W1fMhKlILUFG7GVNWmj
 4ur/XNEc/31fSMZYppkLuQFJICy8BPKLPrNit/owy0WFTzJigxs/6J/L7L9h35fxWN/hQY890AS
 /nqA9WWoPtkO35gKQ/61813IxQL8GIBpp1EDpyBxt6Y9qB5sK/h7NH1PT0ic03qE7Db81FQbf12
 fox/NEdl634WSrlmowVIU1eEB+i4kFe3EGMY3F1M+WJrk5g70a34yodxVSIMlIrx8+uAEcgnxfJ
 PWhoWlwsvh9s6hFbGW3H5XrvDdTOjfVW4uozhpNYrmZ/zxSasqatK63fRDx1DTBhbhVLRxjapt4
 FPRGEMmLSNNTs/TIDF7yIM3CG7G87L3BosX5mKKbNHCQquuNoIQ1tc67UdGhRHBZ9Sjzve0uEXv
 xXKd0AWF4HyFvwQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

cam_cc_pll8 (defined in camcc-x1e80100.c) doesn't latch on Purwa
silicon. "Lucid PLL latch failed. Output may be unstable!" fires from
wait_for_pll() whenever something asks for a PLL8-sourced rate, and
the camera pipeline ends up dead with "Failed to start media
pipeline: -32" even after the qcom,x1p42100-camss compatible is in
place.

PLL8 sneaks into the streaming path via two RCG freq tables: the
slow_ahb RCG defaults to its 64 MHz entry (PLL8-sourced) when CSID
pulls it during csid_set_power, and vfe_lite picks its highest entry
(480 MHz, also PLL8) at streamon.

Fix this from the DT side:

  * pin slow_ahb at 80 MHz via assigned-clock-rates in purwa.dtsi so
    the RCG is reprogrammed to PLL0_OUT_EVEN at clk-init time and
    never reaches PLL8;
  * drop the 480 MHz entry from the Purwa vfe_lite clock_rate array
    so the driver caps at 400 MHz (PLL0_OUT_ODD).

I went poking at the Qualcomm Windows BSP shipped for the UX3407QA to
see what rates the vendor side actually uses. The AeoB resource blob
at qccamplatform_ext8380/CAMP_{PERF,RES}_MTP.bin lists the camera
clocks Windows enables, and PLL8 isn't referenced once. For CCI in
particular Windows runs at 37.5 MHz off PLL0_OUT_EVEN, not the
30 MHz/PLL8 alternative the Linux driver happens to pick first.
Whether PLL8 is fused off, trust-zone-only, or just unwired on this
SoC I don't know, but treating it as unavailable matches what the
vendor does.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi       | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index cee72349da49..5e39355c38d4 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -409,3 +409,15 @@ &tsens3 {
 &videocc {
 	compatible = "qcom,x1p42100-videocc";
 };
+
+/*
+ * PLL8 in the camcc-x1e80100 driver fails to lock on Purwa silicon
+ * ("Lucid PLL latch failed"). Several RCGs default to PLL8 as parent
+ * (slow_ahb at 64 MHz, cci_0 at 30 MHz). Pin slow_ahb to the next-best
+ * PLL0-sourced rate (80 MHz) at clock-init time so enabling it does not
+ * try to bring PLL8 up. cci_0 already defaults to 19.2 MHz via TCXO.
+ */
+&camcc {
+	assigned-clocks = <&camcc CAM_CC_SLOW_AHB_CLK_SRC>;
+	assigned-clock-rates = <80000000>;
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5c9530d52bbd..ca43ff309b26 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4437,8 +4437,8 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
@@ -4460,8 +4460,8 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {
@@ -4574,8 +4574,8 @@ static const struct camss_subdev_resources vfe_res_x1p42100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
@@ -4597,8 +4597,8 @@ static const struct camss_subdev_resources vfe_res_x1p42100[] = {
 				{ 0 },
 				{ 0 },
 				{ 0 },
-				{ 266666667, 400000000, 480000000 },
-				{ 266666667, 400000000, 480000000 }, },
+				{ 266666667, 400000000 },
+				{ 266666667, 400000000 }, },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {

-- 
2.53.0

