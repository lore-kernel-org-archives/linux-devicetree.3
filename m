Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D959812E1DC
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575861; cv=none; b=aTXJGfqsrr1cufxlTBvHpSzQxAzGjTCTi3SjOLr2EAzaQuB5dvqU/uszezXNeZJVpEOHoTzRqMEMIuQQPuKn90uKSztan1gWn13Wgl0WGAtuKPpWi6TFB5Jvbb3U1aEYdAg6JDOFBGZci/Z2oSJsCNPne/KOUcc+XKQb14GQHy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575861; c=relaxed/simple;
	bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfV2LE+lFY+Xnx+LuHBZSzaqueLvA/PAz+UYLk3tws6kfHwbdjHkCmg5QuIFEAnNRHoT7tsCYq2HpQniQ0/DzS93QDnweFTuO9Ohu5yIki7nrZs0ZDt++Is4v5y6rU5Z9KXsmQRDjbUbCncHXJj6Jm3ERbXjr5KKudetECPuDhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhYBREwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnL1ts3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhYBREwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnL1ts3E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1B1ca3455729
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=hhYBREwloagq9SSi
	ckrfC4WjX+v88luweFvE//fkslVqCmhozicPepDxX3uxgLS5hRwHs6UtHpctnvai
	k4qy7E8wIxdPQ5SkTmwbWOcc4DknKhlO5PwfPItlaRwKWhA6LfPaIB7V4Btrv4ef
	EWe4EHcz3WSTOS1saqIKuMAu1Cq6cW+7u/GSmVdh5H9UtN830Ju8tWGD1g5cUals
	UyU4HnCTo2+/iwGTzC2dLVtr8UVMOYBOTbzBXpAIAYWRauFaxnCZi/LGGL1tGvo5
	ywyxI/mH1hkyBtwhUrHscjtccan8015nn940O5kh+DkKF3zpW0wTRpCiMbkfHOf9
	pQrRvQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq0re6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:10:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso2252559a91.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575859; x=1791180659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=bnL1ts3E1FVJQLW3/pqI1ea+OrTwKl8iYbxOvbdPFqaoPOUmHUzAQKFl58NgeVUves
         N2DVrgDm/utCj6eoWk/K1+09papFi0LzcFuYF1YntWevu70OdlBtU8NKPFDhXU3Conav
         Mx0opXUAoJk95GMuXP8N7eQncRfwCcwXYKc7kIM+QY4tqXS8hMrNolLWp7q3QPzSbOa/
         887vi6mTWteYu+MPKIR7Xiie+04ilOz7MhTjVDoBglZPGwgICBHnkY9bBBPHz1K3/6rh
         mjbBp6MeS1TPAlF23YyTl1UwFMmMxQw9GUv06CyfMQNy1P/G5q9lkIKEdD23xd4I7lqd
         qulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575859; x=1791180659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=cj22Kzg4AqCf2ZSBGHQDJC2dO5bQQKQKYTlQfeg1ajWMImzUFCQK06SqUnjzYl386R
         TpkTL/gn7Z+HeJU/37/ACAAXSJgLm6sKVn2s6E6oL/GzcDscJO4bThdV2gY9rk4P+wsW
         pFYX4zVyaCt18iOADWLvI+szD1nIE+KoIaWHKX0zx2P0VJTdht6ehglsgdi59QD1X7E/
         xTvUIlXjpkPNaF7IJtqs84qejsYL5XUHvp6L1KXzzijVKXDnEukVrfCkh0w16KvnR8sA
         uMY2jvbZERsOAn3n9niRK/nn46DA9k1eQvBJMjd3Uqafw+MJHJuZcUzwi6Y4VtN8ZDMH
         u1nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAlONAHBerc4JnOwgOmbnrZ02a6iZfmnO/x96UOzQIL0A2CkeBZbdY7bSJV7sDxh5yNUtx7geT8M/J@vger.kernel.org
X-Gm-Message-State: AFq9FYJx0CuTi5w4npOIie3ZXyCxxTDcx4AZTEwkpb3liWiVByRTdokj
	h+2GQNlMnwcizdpvfaP6QRrbqyShyYRk8qEnWUxLp2TO5lkvqueKGl+JJguThZLO0pqTYC7XZsZ
	mQpSpSzVEs/FN4bqaZGL+LURAy+2u4V+TLNlGovYxyfw2VWfReP3GGz0wxUukKi/7
X-Gm-Gg: AYBFou2aFfcQH1anxKQOe+lbT8kWKMHxmeWayhG+UIpwG3QZ32i0FPcGhm7qQu0xj8v
	Kq/mEhvOJQPnXYdfdNAZiUiOgt6nM4By+uwIH7oO2PkdkxoSDA5OZPfZTb7GW8ngqp/RmPrnzEr
	+LPU2UgcGrnejd0hgNQnd0TKpyAucW01dCwdBx9KAUr6eZkrdpDdwgfnG89fufso4lHswWJb+0L
	h22F83IexVgWVBNtSppbjxCorLLYik4hf9mas53UTBnxXxOPpaE+UTMf0HZYw3gPFUR3/Cgi0/2
	v4EgzjDTtl1nHIBE0fl2OFRo4B2jkElkFGUsF/06eBJLWcd5eJeg6lOlUL7whmRxNGR7eQZ+8JZ
	c7q0kH+XHk25hNkhgz33mDKLclT7SH1Opmu7o
X-Received: by 2002:a17:90b:35d0:b0:3a0:df61:3fe8 with SMTP id 98e67ed59e1d1-3a0df614b3emr3891083a91.13.1790575857164;
        Sun, 27 Sep 2026 23:10:57 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:3a0:df61:3fe8 with SMTP id 98e67ed59e1d1-3a0df614b3emr3891061a91.13.1790575856656;
        Sun, 27 Sep 2026 23:10:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:56 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:20 +0530
Subject: [PATCH v26 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-8-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=ISNKMf7RMjaU+bv5/aCDnX25z901Q9bqAKTDSWTlUTv61Ly921JCiACTAvjmSsgsSC7vVVaDn
 KfWEYUs+lA1AOkcX2OWs5xupnWc1Au1ilF9NORSNXjlWEltiZFYEAKp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: opquhZ8p-jAdkYFSXWgbI6RC7i-l5Bzw
X-Proofpoint-GUID: opquhZ8p-jAdkYFSXWgbI6RC7i-l5Bzw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX20zEVRLTm4Mv
 gej2dBMkZU6Ms0kATeOJPoS1SBIXoTGRcXAztLOUrcmaX4tR2+bg0gybZRRS12/aFy/dnFdc7hf
 wWRBPR0A6fFR/TZom1SitErSwyXT9bM=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba04f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX6TMKkJnvLKbE
 jVQ2k2ZeJkp2K6cfUNFc0DF7ZrkHMHQYm9pj4QV2+38AQl5kFQRqu1FTi6QMLV+u7wCAEsObjnD
 A1/rzm8qFCTah9tuKIXGpCd1l07TI53c0B3u7HmsBA7iSdrZPUUbVY+PpWT2yc3DcsSwisqU3bA
 HymsWsRPCzry4K8xj5bgGLC/FHr+s/pPfCyHjF9uLZi0oajv3C8scyFJ8M2Ik3cAaiJ7EDSY99w
 igiytcEtOwEkf4eaAd5Be9r+LNFFeNOpJRAzLDGWyFQYMiJiGhNG5f+ZAf068LQlRAkNlG2fP3O
 daLaL1Nov6DfV5vA0rvOIx8ir6tZSQm1aQvL/Ig7cPVe97wOuVy+h67mgWH6l7nkllcOynZ7pOQ
 +4ANEXpVit76f3/dT1uVgLh+ZTQaF/Z3wPHgtokumrR0xDqVF1XXptohTzoQyeq/+JpfsG0PibS
 Dax5g382OhT4zEX3OPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280024

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..87d01acc7b5a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..0adf9f02c8cf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..f0633b81a04d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

