Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9463B8D58;
	Mon, 27 Apr 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289329; cv=none; b=rboEW9M5uBgTuFUEfVQdQM1FQRxlSSskUMa3OCwq48e/cBNS5sSaSK3dOXtwSaHNfI9CjQKr+3mqOdCOrsF3wFNx+sBb+9jBrjRnwub11PHEa7zDjVAG/i0IvIwInzBRAJfUkK8Bo/Wqusu7w2HY8nxnJpLOuEan9weunXg1e5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289329; c=relaxed/simple;
	bh=aKwNjt53lo5/NgoBL0pDnhoHYvwnxyOpOxm+WJsPP9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MkZbhvSr17fbgXyK1Dpny8sJ2E+TSjVMRoGfjaXnozrUBEIaPdXe2OIAg/gRW650CnLKdYWtSBNZMXP+DCh2XQHfMxE9uMZ9nhLE2uKRhmWJohGTBDNy4xHaU4lmXIkOg89xTyhVenUWIyAdIgBZUKaWKOXhaxnKkM6pK9JPg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRS3yNwF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRS3yNwF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2598C2BCB4;
	Mon, 27 Apr 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289329;
	bh=aKwNjt53lo5/NgoBL0pDnhoHYvwnxyOpOxm+WJsPP9w=;
	h=From:To:Cc:Subject:Date:From;
	b=lRS3yNwFzWBIpclmbzOo5eBBvRCcYsSy0AhQwSOLIwzenjHXyMwb2oqvJd3JIMgo7
	 LtFXcowlQUkkgquCK2mvY38tqKHXz/Ph2IJWh4jeVxn2z+GAKaGjAsqdo+05fh2COK
	 jYbr0cgvKMF2tkTKX7OE3YDiYfon5Kxh87izqgAEiOI5rNziRp0kEQgFg7IaxCTKD0
	 bX8Ncn7nEJIKfzdBk2OycEL8fm4RCGVUqY5BX2ACwwfq3BTv32Yq7GuiYgWo6ueuQI
	 yvuZNm0+KI0+7MJl+jG1/4+P9uXHdFnu/sWXOOxo7AraVfv6HeAz2zZaal9EMbqRPy
	 WLUKQ8NJ4MwvQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	bsatish@qti.qualcomm.com,
	akhiverm@qti.qualcomm.com,
	nicolas.dechesne@oss.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Drop modem support
Date: Mon, 27 Apr 2026 16:58:32 +0530
Message-ID: <20260427112833.1160332-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

QRB2210 has modem fused out as it's only available on the mobile variant
which is QCM2290. So let's disable modem support from RB1.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index da46e9d65528..7c5e0cf18131 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -453,11 +453,6 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
-&remoteproc_mpss {
-	firmware-name = "qcom/qcm2290/modem.mbn";
-	status = "okay";
-};
-
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
-- 
2.51.0

