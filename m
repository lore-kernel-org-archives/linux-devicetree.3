Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D523AB87
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037775; cv=none; b=dT2TjYlHifupJSJjE1gkEi3A5+P0wMiIfkQj2pJngsxq4uo+DB6gUAXD7Y+55r4YLGmElEbOAsHs0P5vpaskt64IzjZlZwNN4tcLWcKIeNph5dgoJqpFykm6wXZi2GDpvWPjDTD6aYxYbFUf+wK3mZeQ3ZzaUt7cLFViLj6NHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037775; c=relaxed/simple;
	bh=xEL5X3IZ57dh0eb77WJAth7tHSF+GkeapUEPn2eP7Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhV0F2uF7VELx5uKYeNKWHkJt5Uvf1KqoqNBXgMeejLA5a8yxBXa0hG0l4JBb/hsngWbO0g+V91QtgVHPvylGP9FizgyOvRN3ViCjsUZb+resmFdhH7iW4ioSl4W+pnU1xZ6O7pn2JU+WJcirKAAi2boZtm+6nzSbWba+pg0jqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=c5TUUfvr; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="c5TUUfvr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778037771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VxBnGaW6GmFsh6ws8vX6h0ilXdjZ9ivbVBafazBpfV0=;
	b=c5TUUfvrpAvlqo+T6SMi+4YGXJcqUklxGhn3XwfefrTWohZGK6S3cethYhU1DYsdj3C4Gs
	VAS+cSQa6d4IBhRxj+sDSm+RTu0Ey4j+DEo+vwav5fVW5guJYBtDezJxkoUO7myGZaVmWU
	0qUCk6mSN2eo3kUHoU/6ebUVobxKknRzEDhyfUXr+hzX/W+rAdfuylPbrn38fHNSXmT5o+
	enyM25b6Y+cMAdGuQA8IoZfeETDZaphthgIcvH/dfTIYeFWELldVjaqYWKcDSjbsKVAz2d
	nVkmZko612XGhZj9w7LXsdK5YyloHuPpNrQ3qlz8EzjVMDxov+FCECt62adf2w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND] arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins
Date: Wed,  6 May 2026 00:19:26 -0300
Message-ID: <20260506032218.405131-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

i2c20 is used by the battmgr service on the ADSP to communicate with the
SBS interface of the battery. Initializing it from Linux would break the
battmgr functionality when booted in EL2. Mark those pins as reserved.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---

Pinnnng..

Previously sent as https://lore.kernel.org/all/20260312005731.12488-2-val@packett.cool/

OK technically that was a 2-patch series that also included the PCIe root port
thing that's now being handled collectively for all devices where it was missing:
https://lore.kernel.org/all/20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com/
and because of that I'm only sending this, but still

---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 7d56d05254f6..3b491369767e 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -982,12 +982,6 @@ &i2c8 {
 	status = "okay";
 };
 
-&i2c20 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-};
-
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
@@ -1313,6 +1307,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */
 
 	cam_rgb_default: cam-rgb-default-state {
-- 
2.53.0

