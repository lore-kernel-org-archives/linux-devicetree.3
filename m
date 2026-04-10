Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F456347FC8;
	Fri, 10 Apr 2026 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827942; cv=none; b=sfmPbIplWJ0mAObAX8c11PKww4i9XYQWDhZ6O3rQlGg7Z6KyDjvT9Nvvf5+ff2cRbkAQALIiyos4g5txVX+uGEpY+1+ozh/6lzVDpcHDbq10UyyeI4cTDztipcUG5raKszq3WYO7W6uVNzjUe2pRAGKfukevcvx7q+YxxQXUse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827942; c=relaxed/simple;
	bh=qNEw8dmDaNVmgg2XjTc1lTdfVEER7H/DpLWeeRSmJuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GAx/2L2DhQTCJjPK71Zkd+31naDrA7v3z44lnCU8i7rufVWciu4K9DMwRyhZ8KRCPaxfHWRE+rj/kr+YuQVRVdayAaI75Q4YQkttbaqaZOxLQI4njzfEsB8+ecUyTTvB1DwqmWG1uRSJY+WyvxopQ4U2z6gzye7xG+pg3UtbZew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEWbTv33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEWbTv33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB7CC19421;
	Fri, 10 Apr 2026 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775827941;
	bh=qNEw8dmDaNVmgg2XjTc1lTdfVEER7H/DpLWeeRSmJuY=;
	h=From:Date:Subject:To:Cc:From;
	b=qEWbTv33V6v0NmGQM9B9MbMo9hK3CAjp2mIVAjppqwWemUB8mWyTEALzt+iFxOWMP
	 Z0De1/lSF+SyWIfGq4V5B9XL6oPNM9SbKJ3mNRrU/fwsM2kx4AFnp2P/uke5hJAwPt
	 32+Tg7hNHBM90j/6P+UcVPitSKaj4B0SRP8svWrqJGQAgXEKZHMP8QW3QEQVMt8hwI
	 9DLRHx085wdPIEnTikcejyQdSfGu8pwaoxCZ43LLsVk7X51a0OxroqslX6L5zFUWW+
	 OpTW5pn8I0aFVcnJUBBwJ7o/9Pui+6Y/9szArZ0pGlsMIVw4PLG45Namw99CBTWXaJ
	 3fp2oSpVD/ouw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 10 Apr 2026 15:32:13 +0200
Subject: [PATCH] arm64: dts: qcom: hamoa: Add interconnects to primary USB3
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-hamoa_usb_icc-v1-1-461e64304067@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBM0+r9KRKiNNYs0tCIQ7560/
 BbvRQjoCQOMRQSPDwVyNkOUBehd2g0ZrdlQ8arlteDscidptsvDyeUOaiGtWWf6tVEKzVAryOX
 p0dD7X6c5pQ9+MphdZQAAAA==
X-Change-ID: 20260410-topic-hamoa_usb_icc-7f8d5bbef94b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775827938; l=1338;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=1Er8Bm5uppP0Wmzu5HmgQVhht5m+Fr+vvL9pARopPFI=;
 b=UgBe9atgxpaAZVzIsWwuUh6UK73QWEkjvlBdFfQ1nKJGAPg2LB3xENMFGZhp+FsOFTQ+bAji6
 BDq2+3JBsaTB5ehBYKU3EtcQDLnYzVA4z/O3IHJTFWL4F1iucup/BL9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the interconnect paths to enable drivers to vote on them, ensuring
the necessary NoC bandwidth is available.

This hasn't been done before, as prior to commit 05566ebcc0cd
("clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON"), this
would cause an inexplicable crash upon resume from system suspend.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..233c7ab4c52c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5318,6 +5318,13 @@ usb_1_ss0: usb@a600000 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&usb_south_anoc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x1420 0x0>;

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260410-topic-hamoa_usb_icc-7f8d5bbef94b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

