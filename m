Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461F405C21;
	Wed, 10 Jun 2026 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093080; cv=none; b=MB4FaQRSws8BwyZGvzCltQXEHpQCCBQlgsAsH0mHbu9ps8vC4Lo/xQHrUPuvfJ4j0MhwTmw9o/kRCXXXvlRGCYLNXcpb9WlQBenk/Byh8AzIVijraDrqhwAR/kjCCBIEQzJtIEO26sFz9lYXx+gIKPAb4rOp1Ues8rW2gLZH7c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093080; c=relaxed/simple;
	bh=acvQtfaE3Uyr4t9ol0KddBIkrEr9YyjhD1bx/I6Kjto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=riRX/Dd+Ddcq2Es7sCUN+7AR1o596FMLZbWQMKhrf2g4bUDPuo4ddjn/TvydYLKuyo5g7Tt2gc+846Stm+yaVrGjQAKeC3/Y5QSS+ztwEDKkqjREAqlfNP1+M6XrcvWrBzXTCybnOxiotSLwEt/uHYrKoMkpye+9WKQqeRPdGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ouj5CA/L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ouj5CA/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A7F1F00893;
	Wed, 10 Jun 2026 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093079;
	bh=6MxkLfVTgOymLs1OLxd1A3Z0JsUSiCEc8rBNsWbG15E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ouj5CA/LY6QBdjBUjZt/2iUcJ1cEcJYBD/p/oSlwdA6Xg64rPeha1ewLGHbg1mA9a
	 55ww20MlyqpeE5W74mncid3rtMrOZ59USrRLbMm7KTuCeQVhBm22/JsLnLdAEV1uVm
	 Z+vY0y2XXKBjZrrSxxBkDnVEHHicIrZVK70XkUMhN+ZJBf2nHEIl8ZH8xQgcFSN4gy
	 IYzSnicBP0v+VFRpiOY1HFMRO/aRc3zI7SoQmWuV+3H5/TP9dABeQ8yry3DSTu2T2J
	 mcxb7kpQpKLQEKBIUKTZl+2PRToyin/M42JY08eWeN+og7sV4TrgxneVhNyQugAeOf
	 i/GfdDCfN7rZg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 14:04:15 +0200
Subject: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093064; l=1433;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/ui5Yg3LXmtp1fdq4VydD+WQDMD4O0VCJcitDenV/8Q=;
 b=tkd/Jk16gkRkcT+qIYZbr5ZcVGq1sOxVojrGlMYXbobcSlJSVXo7JxkDJDgkv4wPnts+YBGYo
 FvJg/ryl2mWCr2uIJziGZn2QPlHToH6ltcxgnTf6G67pzDtW9GQYAfS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I don't know where the existing one came from, but it's apparently
wrong, according to both docs and a downstream DT [1]. Fix it up.

The updated values also happen to match SM6125, which will allow us
to fix that platform too.

[1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..c304ccd9f31f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -233,9 +233,9 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
 
 static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc0),
 
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),

-- 
2.54.0

