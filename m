Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769203EB819
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458819; cv=none; b=cFrGoulZmdSeeAlEyhXc+Ojt3K28R0A8VZuhujxZAWvRrPaiCaDXkhgqbV4mBTXRyL3DWIRiig+rlviLH3cSzYIsx8YIz4SLJGwiwWGqYwKlA8iGDIM021yqD98LYtzjeMJUmk/ATxg/gpyg5M46vvKNV23mFwDU23kO6w9g2nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458819; c=relaxed/simple;
	bh=i2NtLLLhNCL83g0ecLJOBZbfQ33HYTTevueS7EHO/Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3TB4DZsAHQLhXOrKjQxlDPo9CUgnTbPZ8rmZy7XKsgguN3fc2MU2xxgTn6WWXiZY2kZ7miEMJyzx5UDAfBAqpcyewVKlJRTtjibljS/u6qELvTw+SSqt9MMYmqIgCEvPyABkrhWR8uPslfU91GVG6okoxD4u73SP3W0o44z6ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=bb5egrAt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="bb5egrAt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d90833cacso7886363a91.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1777458818; x=1778063618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RTUgu04LfMLANwSoXjWoPf/4vksRgEvuPnPFzRPOsg=;
        b=bb5egrAtSdlBmRUphTKddFPKFrDn+JTyUzfRDqq3oo7gBks9F7j7A3KNKngLOs5hWq
         VNsmyy91BmjcbxipAf9JIUIp2AetgJMwBOm+0wlIdHuoAQmH3g2nyYfP4LTM63iMBfTr
         PyuYNq+UWOPVpX1dYWaFiOs9oShDGLmMAVF80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458818; x=1778063618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RTUgu04LfMLANwSoXjWoPf/4vksRgEvuPnPFzRPOsg=;
        b=N+h0ihlcPun4cc20wyXfp3WIr5tj1w9PRePEAfWVBzjfAqMFQhk+Ib/YuVdonUio+a
         qp7sjPLRMaRG/rpmwgmlmatG0PcYsjG05+UUc+Ctv9WK2+Y/Et9qPEJaePiIHg4J7e5z
         Jsr2yuMxeH5x8+VxickOP71uRzAe1ihUElLwLnA91ICuX3nBrtbIvK+6k35ov0POycBe
         CLwBNexRgmYF6/qGbwql2Z3gG1+FzhTenm+Ip/6xw3sbGsBwzdDUb90YADjkqO0bXaoq
         Xjob2+xsfLwzI4r+hOIZpHV6SuOOcGRUJieZ+9SyxVtYAHuHr4he/hBj+5VGL84TIFKM
         wn7A==
X-Forwarded-Encrypted: i=1; AFNElJ8Z4H2Ms+R5ysCzZEIwsPFFWR9Y3aUoMO5gFYwqLaGEpp9JjOgYnqPcXJ3K+JSogaFJyok1OM4EXSGK@vger.kernel.org
X-Gm-Message-State: AOJu0YzLurYess1EKbrKbMbH3WXm1yk4djk70p8P0XjM/BxU5EXH7j9b
	KBFU7Z3x9Q7yc2NkDyoG5H9A80rHPQfxR6UtDFSiCkm3i0TLK2AWz0b+PC6CcxYcLFk=
X-Gm-Gg: AeBDiesJhcexLpjuFv/jLip4j7JDyVMweCehGb6j4/gIRb4VxjI3o9INzm21tinLny3
	y5SdQcVODMRwsromH2D9u0EKV4T9Fpg5AGgIhohsj4whScTpCA9HBF6Dz/xP2gE0JvtfGoSP87C
	2WOrgtF6ShvRpArRrkuG3XuoU6t2rcc5jjw8EujaGh0bf2jpF3EvRTkwbJYgPyACl7rd3YRKXdN
	qu69Nhd2owOFGxABhq6xxv10oO72pcqS5kJ+VGs5AioSqdeD4Yzsu3d4g96YZgIvG3Tjpce9AMc
	4fYoNEMt3wqJns+kp7ULm44zqJQqclzUIMuWLUMunW0sXckYoUwSyoSJBO3RlPzZEA5dAgIdgW8
	m4CJeGJKIzltlvdycxNv775qHcGB/OY2wBb+OzdKqdkh1Tkb3A7/I0Tm2xhDMWfWBziU+j8sfqC
	k0nSJ8jtLLs/QSrtV6IXwj90MGkNfzIQTmA38glpOeN6eopBuoRt8NLa90r7obThhYZVxAsG4wP
	RBQLMYiBOn2immt/NCHGbFKf/1Q/YQWfuZUmaFzaUl2/5mGXDSz0RyFOUkdX1mRBU9XMnSETBff
	psir++xOOCBYEVFJoobaMH0TsEQdu8u/CIFB5YGE40UY5Xe/lMjCnHk3zXdM+CTHZKc8v/eoeFp
	ELGU=
X-Received: by 2002:a17:90b:2548:b0:35b:e52a:6fe5 with SMTP id 98e67ed59e1d1-36491f89c0cmr6867110a91.5.1777458817863;
        Wed, 29 Apr 2026 03:33:37 -0700 (PDT)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41a230bsm1955948a91.8.2026.04.29.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:33:37 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konradybcio@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] arm64: dts: qcom: slim7x: Add Embedded Controller node
Date: Wed, 29 Apr 2026 18:32:58 +0800
Message-ID: <20260429103301.17449-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
Hamoa Customer Reference Device (X1). Wire it up for fan control,
thermal sensor and suspend behaviour.

Dependencies:
https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..22c4ad34a2a4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1352,6 +1368,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.53.0

