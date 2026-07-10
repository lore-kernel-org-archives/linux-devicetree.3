Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA823B42CD
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666355; cv=none; b=hQqOqPt4hK93QrFEYu6dsF8+iyxuJ/R1ZUrDBvgJ4b0KUCJmb/NGu+uVGROKJ+BJklp0qRe5EKBelbGpR+gi0HeBKuczGXj1QD4XL1FbKeNpeGG0XQMlmZBeUwlw8/nejtx6wEiDIWRY+hnP7JzN5tsjpVdcnlvynRlzmVFCulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666355; c=relaxed/simple;
	bh=D4WOQCoEyd7LTFef25pROJebQUO6pijrkTnstcA5ejk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Neobg0h9ts1A8tuyb+LAyjyAcgoLKsiMME7aoLYv0YOgJFwHtLWPeTBuQD7YS4JChlOOqgkfhzF1zJEKaCCqNi4ev3lwesstTbsxCETafugYBzgF6zE/st3NYjNFBS1CTRvl5GYiAk94HHk6+IVsW+e0t4YJmBFVQvJOV141yLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9mcN8rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElWgexZn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9mcN8rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ElWgexZn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n78O3802291
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oymSMDKTgbNw3vzJQeL1JNY59Ar/ZsjequuNwFdKzWg=; b=Z9mcN8rq+j2CaKT4
	iDSklf9DVygY+2S/Rth3jGlNDnv4rsJnJEdo8bf4EOiqftBMQIPVV8x1ZKE/wZtQ
	yOxzv3MHCReBCSJ7omUS5E/ifRr/EENMSqojbSlQg7DbsscyGSIUtxLSTyJzUmCY
	TvyrT1bD+/n1Mwl8WBDMuRZ2hLIAzWKvdKAVUpV5L9EA+SwV/Mo7ZeDf7tLOn7UM
	q0iS1T8pK3mw0WZUrrD9jNTLvEjqMQm7m8CU64m3ny5s6rrLsGwyuW8qgotZERnj
	xZrRpRmUSxJ4Y4yoK6i9K7WRO0/GV3BFmGNJwf4plgf34TTel4IB3lL6EVvWOt9F
	clBklg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpkrug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1223063a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666352; x=1784271152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oymSMDKTgbNw3vzJQeL1JNY59Ar/ZsjequuNwFdKzWg=;
        b=ElWgexZnhGOX1z4bcboIlfnJ62okevp5cbWU8L/xywgVNRI2Zl5YhC1Ss5zAal3UV2
         XaHvYC38BX4iDwcyJ+d23xedzjg3ch2pbbMte1nbqEGQWZLbjzUIZph2I1QQASdCqqTO
         wxjehl4SK8r/dq/3jfUG4DV2s8Dnx3geL5naHOFnkPZC9WogBbKZJZMPRKtJdRJTb96H
         1qyGqe80547AsnPKuz8MDocKOoPkd6Blh4vyWSeFm7s2IVvdsZmUBGRfrcT5sMsc0NDS
         xlOi/Tq0EjghabFeWvFLZSEYEoj4ELtWx7kLmM4XabwIvC0MFijwXQS2hOAhjYaHzmOS
         pBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666352; x=1784271152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oymSMDKTgbNw3vzJQeL1JNY59Ar/ZsjequuNwFdKzWg=;
        b=Krw8GWHCZRiz8Iob5LYqgFmD/SQpzIl7mzWEhYveGxYfuApZKiRx/h25up+1kD735f
         pthPs3vWyX5gfNlN65IDgyWlmbd7omtdSNxYTosrEVFDP92tAATBuJTmpbS8Tr/UNne1
         M3W0sDzfHLXO2FFP2+PWx9liy+Wva6zjfQFZ8/P/ARHiFcTN6KrrbSETwBOQSZc83Uaz
         tAuYRidrjIiF/VoTlElsc/oqU6xRNpvun2kbWXY2y0xvobHVq6zuAoqy/vOmX98CyWFb
         lYXTKloQeneJufCn+tCWQhonqsENFOBKR6sBQ83s00wkdT1bQW9GofEn5jBzJe02RSdv
         Jj3g==
X-Forwarded-Encrypted: i=1; AHgh+RoyRiREL9ecMQrZ2bsIA+pbbpP6zjCNbvlh35LEnEC0CV4fxE7L0ZxToce6M+oW0JpOoxCdPk3P60wK@vger.kernel.org
X-Gm-Message-State: AOJu0YzIg7xKeYpMzM9BHUISVV0q1JnQJBtnx/vvOPB9CJZnWKemokDC
	i9J3JTuFiiLoMWhBHaJeVjABEG/deH57r2lGwY0l2p1Y+YnQ3qBcIV+Wdmel3lJQMCeWtLYroCc
	B/HKK4WbBjfDSVt/kDfZGcYWd7wFH+n20ibEeswIhJTlGYsZy+Jvlp1pqBMS7OW4H
X-Gm-Gg: AfdE7clSy2hqjSuJk3K8+52cEe93Gpgl2q3dmLInPYqIxZrnQnoY+51zdNCwGB5eryG
	MZ45FgruQZDSXq1ka8SHNF5eq5WqcdslOb0QTiBZmr/0eKciTHChfHmhsok6/rIN5tvz1VTfRPQ
	Tt8QDWJCzZWuOpeRHn7GSF7Tk09jJrl6uV6grfOYF9rthfo4Q2e8gse68p91vHOw3AdetN7DUUf
	ISalfLr1ZeVihQgbIOX5NFD4qio57QroL0aiE0GRY5FPMV3zjvx2p4E/f+c+q6NkTeG0lospYlC
	Un2ts7MbTDphUnm8Xsw5J0+T77zI/lyBnFLc6oj+1vH1gXqu6H6VrQefkkfGL1QMC2klpzvyayA
	MzaZ4N6+zOmnxnvKai3pySuC6WNKhVg==
X-Received: by 2002:a05:6a20:7287:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c0bce9cc2emr11870659637.40.1783666352353;
        Thu, 09 Jul 2026 23:52:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:7287:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c0bce9cc2emr11870615637.40.1783666351803;
        Thu, 09 Jul 2026 23:52:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:09 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-2-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=1713;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=D4WOQCoEyd7LTFef25pROJebQUO6pijrkTnstcA5ejk=;
 b=FWxUOrNGe7oGApVeQDN5EUolSmmAbL7rsQH5kywA3+GqcIhmrYyZ3czHlgnd+A4vAVruheisZ
 UUsHk+RnujtCB0CTXHHK7efSFU4+XBZNEmfx/IpHKVuWswREM9dXc85
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXzVWhzVY5WABT
 Gawc9GG8P9akHxMlh9VU60bvWCtoHs4AiO7uhK7EaD30QEWuv31X+0x8OP4Li8hIDvsVzpyi+0h
 7UEswHkXbO/u53oOti3dD1M0fW3F9r+BzV2j9bFfWJrfMyHSfDE29YWhwia7cgK++NC+bYKDcIk
 jg9Wy2ZnqxeXx4pGPMwwrUXXDCDFDr72Juc1VGWtw1ghOTRAsjnubxjUN/ZjASL+xzaZ/rOgM7g
 AykrZbgfuhuwBax3xiyBOr2eNiVtCMz99dsF25/aQcrSYGpZvFN31/fVlX2mW4hYZisQahemFpy
 uPNVhq4izDNLSPwVuq1a08C+tBn5TwAI96EsNLN12ufF5Gz4W6bTb6X3q6NA155S2LrMXlDYbnx
 GH3uUVOSUld1H1PRe1RrQVS4LDNENTF/9bxQnhH+Yd1xNEy21r9hKP0Rl/rn8NNt2mDCYbEGbX/
 aUhMtonR9uaxRYzr65g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX0ToieczpFsxL
 tDeXgL0Xs+QPdcbJxzNlradn7/E1e029wXKTBHCxhC2d9B+qeApVfzqQ0fic7h3zGYciOl3q4ID
 MH6LZ7q4tonlD2fArL2zQWsNZraEM1k=
X-Proofpoint-GUID: 6QnBlYi4Cf7Ozs8D8ew2ZZ_sPY1XQT6i
X-Proofpoint-ORIG-GUID: 6QnBlYi4Cf7Ozs8D8ew2ZZ_sPY1XQT6i
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a5096b1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100063

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..e6f188cefffe 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,34 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0

