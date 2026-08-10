Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD0D3AB277
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352088; cv=none; b=deJQUQAfBDlYvtyhKlWyE5lzwFHmQxD4ssO8oHsOtB3Nklrm0I7mOo6MRuXRJwPKiPh7DhSKahkVEtXLxU/ZhI50twTmUzNhugn4NB4E7IIQRdNh2l0GsVSFdCV8O9j1dT3WquSwPqbdYvVZFMshpNQYWVXBe+N/Go/Qm8fv058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352088; c=relaxed/simple;
	bh=+FfxcinivrEyRAaQsyH1c/usA6LwzS+hkhy1s2Xjb+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixYV1UwNfNebtjA3v9rv+mB4LcQozb54RRx8QbhksD4dQFNtk8BjPkc+CBArl6aMdSxihQ9zR1MiZCLtuHeoa85kswID+WVerDODCFpWW8EjxKsO78pjfKqt3t3xxnVs21DmD0d0Dq6+tL70YvSapojxwolqpkhs2sJqzxwBEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvF8Vdi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIeFgPAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvF8Vdi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIeFgPAV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pdwH4149912
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYZsbdZHYze32GofhkFkzl9P6q7WCYwGWcyS3oDuak0=; b=TvF8Vdi5jMFI+ePf
	7jAzHWvTvRSKgC3SDysrH59M3ZMFxLzVEVsYSsCNFXXo+MBhKujQ7UDgNqT53NVB
	OdXt7/gDyYYiOTBoSZ/laApsZFH18jkxlyET1+0cfJGTnO1l3VmtjPY6ldSv4xvr
	aWBPdHvtucHjJZADh6ZSRVYOpFvHl8NxgLIMhrzahpZ4Z9DejDpZlxutha4vfRgS
	IypTmtzLzYYecDu2ENAP4vdl8JtvB/5AbJWWgkjV4QJtKRY8GZr+y0cOksEU9U27
	GTh6fZ1zzodq7CfIeI5fsAsO69hKnjeMfHZHmeSH/ugipdG6ULW8S+cO6velmeMD
	dK8lOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v90k0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so2117654a12.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352085; x=1786956885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYZsbdZHYze32GofhkFkzl9P6q7WCYwGWcyS3oDuak0=;
        b=IIeFgPAVtndYR3vERMz4BWeMycigDfZ9/j7YttM/l+2SGcMfp0DHm28zIVdMueA/u0
         8Uhrjby18APJwvt4XjNmOkHnI7oFM9YXdPob76DVOXYt4HnKEpUJABq1xgGKdUsGBi3b
         8InoOuwpUcxn9A/47AHOse0RTv4x/Ygfrc/JnmJGhUj46bTlPsOIwUSvsWmUyewrRyxk
         pCjxubaJV8b+pf1zUfPdrrvo1g4wxsagr9yWFbBRj80KODVcW0plULgs49wSwSvJ9X3b
         8PLSR+SMweXv3zw4B3j64LOihdKTwd1yeiJCsANFIq4wPeNNUEHl5JudpnW4Nw9RyrUE
         Qdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352085; x=1786956885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYZsbdZHYze32GofhkFkzl9P6q7WCYwGWcyS3oDuak0=;
        b=RTSqYgrw4jMh76mPd21i2FNX0Dgh7lBWYO4snxc0NQ1cSJg84ojIgsTsEvsSxtjI+W
         ywaxbKoWqv67+ej8jb9O+xobzoGzNhJ78Xtdatqe5k56EPVk5qKTTalVNMkjPFvew1zo
         GoNtsWsIs78ekWiOpV+xn9EdiABNGNuDBvoKYET2UkW1OhZu5n/D340tmamFqdREtwnB
         OmezLuxXftUyv44dOvoTs3cEK3VZEee/iof7FBAU3jbmwmbgoDrrK4hozQuOQ125wMOn
         HaLnH2zA8eZPIz2gdfZegn5XwzKhbKQj7clfZ4l2AQA7T/oC9YmNiQvcpRm2MHZvNZ2H
         TQdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrxvs6beDa6MCzPCV4UtTCZ1dvdld61vGGt5A7pHgxEYekJGPsRZ/pY75drIkMclkUfGfw/iMQ3F4r0@vger.kernel.org
X-Gm-Message-State: AOJu0YwGr20Qxt6FxASdAldLlYOJ9eyrMDBrgYZwDkYUHjvMjuHdkp/C
	VJBGB6SZgMMU+N2EmC7uq/ooVTKzdIS9dJ5NnykwTfCW9Rk+8aMViGV60vCeBjhAJjnac9CJJRv
	sAPOBwemhwLu+eJtosrATIfBTxUh4s+jKj5MRmPOPRTHBBxbgDaJKaZ6RIwb3rbpl
X-Gm-Gg: AR+sD13qpQesVLuTDZJNNQSDr2HusaMZHeK/DeNzdBogSLx3pVBmeqID5YZNUfr0esg
	xE7g5FTXbP+OuZBd/6kVtFdWoTRnF60E9RbxEHj5xioFnQ1PkE2QnXGmJOSAH0h+hBJqQF0jc8b
	WecRcSjfbhD9V+0L99MiwC5e5aYYXNT40za5X2jIqYlF/T0kXCPi4PHkevTT5oomf4WcRWlHoD/
	8Szz8+rZ7vDyf3tWm5KtFHVEv7XiVdAf9lsr1WXqh82SNT2tB22ZGRmKH0/mrSovEnRNbDsVox0
	yq3XIrMmUriQ2EkxmGchXc7wXsishhdr2pZNraRRQrMiLLY+GGgNoFzZIdSL1o6MJfq6DDoeSye
	/asowlayKgi55SbMAlsPaAAOi7x9k9JZ1Pth5TY6rCFNUrl8aETrWTA5mbc05tE/D
X-Received: by 2002:a17:90b:4a0f:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-392823340e5mr19286998a91.5.1786352084779;
        Mon, 10 Aug 2026 01:54:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0f:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-392823340e5mr19286953a91.5.1786352084336;
        Mon, 10 Aug 2026 01:54:44 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:44 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 01:54:34 -0700
Subject: [PATCH v6 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-kalambo-crd-v6-3-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=2893;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=+FfxcinivrEyRAaQsyH1c/usA6LwzS+hkhy1s2Xjb+A=;
 b=h7YJbRMBnTwmpiCF7tFGvNfGlL6FgAj6vI+/GBV8QYUb8t4hJEZQAd/IuuwrFQXJOoOLrXj/J
 VlaJvags+lBD7uSos2dQzZz/OsAJ+6ogkhFnZn3rKeC9nxyMsJVy+SY
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX18ep1r0Jwpg4
 G542MtRP0cUf08gFVzuwyDr8+TVYVUvkZqh/Vzatz6GniCHPIPzJSLH+rXGgJD7XYVJx5kjLwqU
 GkpMP8PMfl+djnzOJycnAN3el9oMp2E=
X-Proofpoint-ORIG-GUID: Du30vfC4C7Rso1MgS-urKPuaBlpTEBeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfXyTa+1kNfg/MB
 mPB8YAPMKQ9DbIhYJ0soC5UBepwtHLRQ/UlIApt9oDCULDz773fA06nWflFKTWtwy2HZO3Zp4os
 IqarhNVtgW2sTN1tg5zmSxJeh2o4SWKV6BQebL6XAV3IYj3iSPlEoNUCqNNKXwsJPD10e/bY/uU
 4p516lZ9K7QrAcJkfixSK9Wt1nVu5ICyHv3DGPS97QcRzC0nhRLhwjzX+eHLR0aN6C8NtlIqAPY
 37TVGrkiHLd/a/4kSsTN2UIHM9IchzYeXZCYWCYShfbvQsC3RSyB2ymPk4SAYVBqkxJZIeswIBK
 heVSvWI02c4jc0ndAY12VM+4i6zZBiI3+7vVYNOvdlGrTafonl4Ez6qJprx/9DAZx6luxz3GZj5
 CU+pRwzUNTOPOQX92kvKsGEZDm15NV+eobZbSB5Kj/OJuKscMROugmb2koBRB3RTLa4tE6SdjnS
 NjJr5lwb3hKkqwSFnRw==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a7991d5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mCez9LKK-YWkVuwSxDUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Du30vfC4C7Rso1MgS-urKPuaBlpTEBeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Kalambo uses the same QREF topology as Mahua through the qcom,mahua-tcsr
compatible TCSR block. Connect the QREF and refgen supply inputs to the
corresponding CRD LDOs so that the reference clocks for the PCIe and USB
PHYs can operate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..4384f72dfa0c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..9149cf6ad94b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

