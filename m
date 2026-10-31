Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452261;
	b=U2CoetKJcOra8UQKZWiURQV/c0m6oDVCY9q15EjzCDcN9M1RSh6bQMMnN5qZdaHU/v5Z
	 afB2nDNveRTmOGDyIBjuczIjVWP0XV6bFYDSukjFhQgsYExGnDDB6HE1RjM9Y9slUbbCm
	 w/ILWyQLLAOclJEO5waG2Y3n1Nc0d9SHFcdCXNXoPBWwMDdE6x802dUmUe05X///sOHh2
	 wyDwIT25hyAfk4Mxu72+oaCx6aYW/TQwnXmVtlvjqtuZdZ/k3X9afIaIQcCWYc8YQYKGm
	 k6XRgbNTl2PdmYBP/KyldyHsBq3w0EZxNWoopkZQBoi+6i4ZQd+OOMsphVSmvV6Qafw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FN5kU6oTioq9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=;
	b=VfNgNzhEu8SSjzgW7+j3dCDL+Gv+OMl4LGyFufTDzUp8hVD+sY/Jp/FSRFWoHPW62+im
	 eAipNIdRlPtx6oUw9PQumCn8N9/xdrmrXK7K96BkJhnl12O1DMO6Ek14lknx9Pvpwb411
	 NTaT3OmqyHR2YBfmNKJ/cnxGMMAFjm+HPIbgSPgMeXoqT5zz9KqHGu9hZQ7ogt8ycjAnP
	 6IgYi7ONZW5TjNFiAzpJQTgfSqF1JktpOP6goHhVOKRPoixWV+fsyKYaJO9s2mFd0oUZ9
	 GNa7MFuXHxMb7hbpdhgO7mhAIhwTvxp/hCSPDDmA0Mm8KwMgBmveGLJWmJHhXu/2XuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSBpY0LI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PqsVWoJa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1F606A324
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B1F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSBpY0LI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PqsVWoJa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD05J63174303
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FN5kU6oTioq
	9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=; b=lSBpY0LI1Wu9AdHjmXG33XNieDQ
	rEs0iirMpaqv/vc9ZVJAiQPtyTaVCwTYrsKkAxqVbZ2nJtI/bTm6c9fUZgnERKfE
	KAOYPbqPghwauXP2nqSQEu+skvRJoy2q4ODwpb5K8MbGUQFuqofSL368pWPgmZKm
	o4HT553FjvI+GrjNvgHQ70H1Cs1hxjxZml9R1oXnwVsfMSABz/yDdGr3Lit+na+t
	gVpG95IotUDidM69zVilmX6CnDYv0ZcrkrIS8Zv3AlPt5JkAyt1hWzFa+3Bi+3rF
	eVQO+VnZClhomwAeaBJj1r7kyAsu5I5fdSpa0k5JNUzfQ4UF3G6v4bwMq9A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsfa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:59 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2455327c88.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452259; x=1794057059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FN5kU6oTioq9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=;
        b=PqsVWoJaPA6kqArxt70IuLt9J6u40auWla9DYIpqfwT2nvvzVoVq8uEE1CtT77/tn7
         YmAfylK42G5SEMFTdVw2OZFsq7zeLZqiif+opvbdaGRGeGOyTQQojFzEeIWxLfT/9uPQ
         37b3PhdudwoPRtSS2neMc0rVx/Rw2dfkxzKGfqgfxt8qaVR5jjMkJXmCkposodwcxCHA
         YNbMQ7jAydD+c0JlsmGV5KAuWzYkfe/GpT0hOofrvzmG/GJxeOz2HR0srkwG8zDEbBE5
         Y0c/dViGDXI/R8T/Q/58RpORB4Sd1USJZdXJn/eIBWQCh+riT9hNV2fWjztNN+CJQkfd
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452259; x=1794057059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FN5kU6oTioq9bW3byJMj7ckiOeO0+wc8DN3aRibQaBM=;
        b=bQnaOhSPVSNCt7NK3angxFxfWcYNCUyEQ3PNk+09Klmm1iyk/RCPo3g2Iu8GSeUu/F
         KCJct3IUImvY0S1hiQgnKC06JwmHQTPo12OGoy47UlpzuN35ds/oVAtANhn5TJDl4eRr
         +CquAsv+CmE664Hxb3J9CM+0JNNReTIiJlKwAo5FVDFR8xITudnFMHUhef0ROVkbNtqN
         Ya9PpQVfjKV+KrwzFKxjRFHwi1yh+Fp6hSGy76ZCsYtGfCcf7C2CyBHIpesI6QeCIqJB
         fqvvvA9VFgOu52Bh9TP9lSk1W176Y88Dv0FR8O2ZNtxLjMAz0rmjSkC92efvyMXleCfn
         nl6g==
X-Forwarded-Encrypted: i=1; AKwUvBy5VREYjLEkdwuzEtakRKyKi541trYrcAuB0+QVqFp3PvwSqSU9cSH/GzgfEKQizULRbJdRuYtEnczD@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Z4J60OiHJNkKPIS6nYhzb7HRhN+Z844l8yG0VxAIChE5OwRp
	nGMgvIuLEYUr9Zp/rA+6jWA9SxjtBPXnuGxnvHJQseQOxfJ6HeIQvmFgkJ++d1IrRPFkSNkrjDB
	22+TYzmHCJfXWlmqa959m2etO4cjJyd96ueWZ31o+VLFIpbO6b5Y52DYrHJmy2tLa
X-Gm-Gg: AYBFou1CwktgBd+K9hqe0BImXnttPdPz0dgZC5K34hEHwddjXFDt7fBoTc81EQ4OhwC
	jNEB9apSKGzOoAYNyRdGyOBTvqLVOHCN0dbKEX2kKMkWUro3/xn3tBaEl/Vm9JJcSRtVFlLYNcW
	JbSUgmdeEm154pkfJk6dJHYGjgZbtHpzKmkTAUdZZ19yGjbLF0eWi6QJYuHmHzp1A5aTPkae2MP
	LkDVSfnr2EqQgUm9uzbDWJhwzpZhfUFm396mvz0jjVVM6RderI5uI8eQy5df8YSnpe9NugSU07W
	gK8fm3s5X+cmwu+0Wg8rgR35X40clgw/6wvuYKYhKgo30FTZcJt8UsGiwlAZvoM/ZExpUaIcxB8
	un8HWmYMmVHHhIDv3p+JetcRafcENrM1oEDGPmFXh2UqJNk70qRnmNEMqsw4flg0ENbGUl4BRVX
	R03lBkIllSWSHZg/JAo/jGeJQP1eRfA3L8
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr7841608c88.19.1793452258487;
        Sat, 31 Oct 2026 06:10:58 -0700 (PDT)
X-Received: by 2002:a05:701b:42c2:10b0:185:1640:5536 with SMTP id a92af1059eb24-1ac5ab52fa9mr7841567c88.19.1793452257680;
        Sat, 31 Oct 2026 06:10:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/6] arm64: dts: qcom: lemans: Move pinctrl states into lemans-embedded.dtsi
Date: Sat, 31 Oct 2026 21:10:38 +0800
Message-ID: <20261031131042.1200862-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX0EY39JiRBrjv
 vnHt0kf4s2F4tX6jg6KbMJCFmf35w7L5ECdSA/8qPImKRAn1hWXS2svG4ePyr9wp0VrG54BQFwf
 y/94vgM5M/tBn7mleuWMNRIc0ZarOt8=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5e8e3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8rxlO3qUXUvb7ns18uEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: mm6I8SSDZyMLdBrIjbXFWACvhkw8PqTk
X-Proofpoint-ORIG-GUID: mm6I8SSDZyMLdBrIjbXFWACvhkw8PqTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfXxv3uL4/pz43D
 4RmFwxBzN8ybrtdaa+DkKTjJGvB3QgfaNnlo4HMIn4vRB4rm1HErEcFlKjrXNPFq/hch8p6K9Rc
 4MU/7XfDrWTZ24h87QO5o1nbhhOhH5uFnDhNQi+Y6bb/vLmJUWeNpse+IQuyt4STCoeJOR6BdlT
 sWlUHvnAeDAuiAmMMH8uFbSjFnatGiGfsjN5WG78NXckWC8LurjpmpGCKZBpAffcglgrfCwzUIw
 TsMPPH3iKGmDvxjK27I6Simeyls7CM/NGYq8au3ThyjpbdUFCg07GZBSi/cMmkD/hih5ksVJrKZ
 S3ci0t4zzDjYmEgXnVJsgbFP/DURbjzE/iXWn1XHkv20RhuW5ZfxCvgyM0ftklRqRpuf+MMDmnY
 eLNCkB16kNY8c95UOr7xRklf3xom/qR2NK4/IjqwPp/4hl1evrqLfT5UpSTGPuAV5qZ2yciHyxw
 hZWMqvILhKXqy7uQ7Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

The lemans.dtsi will become a base devicetree shared by all Lemans
series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
they are used by Embedded variant (IQ9/SA8775P) only.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 808 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 806 -----------------
 2 files changed, 808 insertions(+), 806 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 80d8c75e4895..107db7a74756 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -4,3 +4,811 @@
  */
 
 #include "lemans.dtsi"
+
+&tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio101";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio102";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
+	hs0_mi2s_active: hs0-mi2s-active-state {
+		pins = "gpio114", "gpio115", "gpio116", "gpio117";
+		function = "hs0_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	hs2_mi2s_active: hs2-mi2s-active-state {
+		pins = "gpio122", "gpio123", "gpio124", "gpio125";
+		function = "hs2_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	cci0_0_default: cci0-0-default-state {
+		pins = "gpio60", "gpio61";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci0_0_sleep: cci0-0-sleep-state {
+		pins = "gpio60", "gpio61";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci0_1_default: cci0-1-default-state {
+		pins = "gpio52", "gpio53";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci0_1_sleep: cci0-1-sleep-state {
+		pins = "gpio52", "gpio53";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_0_default: cci1-0-default-state {
+		pins = "gpio62", "gpio63";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci1_0_sleep: cci1-0-sleep-state {
+		pins = "gpio62", "gpio63";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_1_default: cci1-1-default-state {
+		pins = "gpio54", "gpio55";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci1_1_sleep: cci1-1-sleep-state {
+		pins = "gpio54", "gpio55";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci2_0_default: cci2-0-default-state {
+		pins = "gpio64", "gpio65";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci2_0_sleep: cci2-0-sleep-state {
+		pins = "gpio64", "gpio65";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci2_1_default: cci2-1-default-state {
+		pins = "gpio56", "gpio57";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci2_1_sleep: cci2-1-sleep-state {
+		pins = "gpio56", "gpio57";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci3_0_default: cci3-0-default-state {
+		pins = "gpio66", "gpio67";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci3_0_sleep: cci3-0-sleep-state {
+		pins = "gpio66", "gpio67";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci3_1_default: cci3-1-default-state {
+		pins = "gpio58", "gpio59";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-up = <2200>;
+	};
+
+	cci3_1_sleep: cci3-1-sleep-state {
+		pins = "gpio58", "gpio59";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	qup_i2c0_default: qup-i2c0-state {
+		pins = "gpio20", "gpio21";
+		function = "qup0_se0";
+	};
+
+	qup_i2c1_default: qup-i2c1-state {
+		pins = "gpio24", "gpio25";
+		function = "qup0_se1";
+	};
+
+	qup_i2c2_default: qup-i2c2-state {
+		pins = "gpio36", "gpio37";
+		function = "qup0_se2";
+	};
+
+	qup_i2c3_default: qup-i2c3-state {
+		pins = "gpio28", "gpio29";
+		function = "qup0_se3";
+	};
+
+	qup_i2c4_default: qup-i2c4-state {
+		pins = "gpio32", "gpio33";
+		function = "qup0_se4";
+	};
+
+	qup_i2c5_default: qup-i2c5-state {
+		pins = "gpio36", "gpio37";
+		function = "qup0_se5";
+	};
+
+	qup_i2c7_default: qup-i2c7-state {
+		pins = "gpio40", "gpio41";
+		function = "qup1_se0";
+	};
+
+	qup_i2c8_default: qup-i2c8-state {
+		pins = "gpio42", "gpio43";
+		function = "qup1_se1";
+	};
+
+	qup_i2c9_default: qup-i2c9-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se2";
+	};
+
+	qup_i2c10_default: qup-i2c10-state {
+		pins = "gpio44", "gpio45";
+		function = "qup1_se3";
+	};
+
+	qup_i2c11_default: qup-i2c11-state {
+		pins = "gpio48", "gpio49";
+		function = "qup1_se4";
+	};
+
+	qup_i2c12_default: qup-i2c12-state {
+		pins = "gpio52", "gpio53";
+		function = "qup1_se5";
+	};
+
+	qup_i2c13_default: qup-i2c13-state {
+		pins = "gpio56", "gpio57";
+		function = "qup1_se6";
+	};
+
+	qup_i2c14_default: qup-i2c14-state {
+		pins = "gpio80", "gpio81";
+		function = "qup2_se0";
+	};
+
+	qup_i2c15_default: qup-i2c15-state {
+		pins = "gpio84", "gpio85";
+		function = "qup2_se1";
+	};
+
+	qup_i2c16_default: qup-i2c16-state {
+		pins = "gpio86", "gpio87";
+		function = "qup2_se2";
+	};
+
+	qup_i2c17_default: qup-i2c17-state {
+		pins = "gpio91", "gpio92";
+		function = "qup2_se3";
+	};
+
+	qup_i2c18_default: qup-i2c18-state {
+		pins = "gpio95", "gpio96";
+		function = "qup2_se4";
+	};
+
+	qup_i2c19_default: qup-i2c19-state {
+		pins = "gpio99", "gpio100";
+		function = "qup2_se5";
+	};
+
+	qup_i2c20_default: qup-i2c20-state {
+		pins = "gpio97", "gpio98";
+		function = "qup2_se6";
+	};
+
+	qup_i2c21_default: qup-i2c21-state {
+		pins = "gpio13", "gpio14";
+		function = "qup3_se0";
+	};
+
+	qup_spi0_default: qup-spi0-state {
+		pins = "gpio20", "gpio21", "gpio22", "gpio23";
+		function = "qup0_se0";
+	};
+
+	qup_spi1_default: qup-spi1-state {
+		pins = "gpio24", "gpio25", "gpio26", "gpio27";
+		function = "qup0_se1";
+	};
+
+	qup_spi2_default: qup-spi2-state {
+		pins = "gpio36", "gpio37", "gpio38", "gpio39";
+		function = "qup0_se2";
+	};
+
+	qup_spi3_default: qup-spi3-state {
+		pins = "gpio28", "gpio29", "gpio30", "gpio31";
+		function = "qup0_se3";
+	};
+
+	qup_spi4_default: qup-spi4-state {
+		pins = "gpio32", "gpio33", "gpio34", "gpio35";
+		function = "qup0_se4";
+	};
+
+	qup_spi5_default: qup-spi5-state {
+		pins = "gpio36", "gpio37", "gpio38", "gpio39";
+		function = "qup0_se5";
+	};
+
+	qup_spi7_default: qup-spi7-state {
+		pins = "gpio40", "gpio41", "gpio42", "gpio43";
+		function = "qup1_se0";
+	};
+
+	qup_spi8_default: qup-spi8-state {
+		pins = "gpio42", "gpio43", "gpio40", "gpio41";
+		function = "qup1_se1";
+	};
+
+	qup_spi9_default: qup-spi9-state {
+		pins = "gpio46", "gpio47", "gpio44", "gpio45";
+		function = "qup1_se2";
+	};
+
+	qup_spi10_default: qup-spi10-state {
+		pins = "gpio44", "gpio45", "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_spi11_default: qup-spi11-state {
+		pins = "gpio48", "gpio49", "gpio50", "gpio51";
+		function = "qup1_se4";
+	};
+
+	qup_spi12_default: qup-spi12-state {
+		pins = "gpio52", "gpio53", "gpio54", "gpio55";
+		function = "qup1_se5";
+	};
+
+	qup_spi14_default: qup-spi14-state {
+		pins = "gpio80", "gpio81", "gpio82", "gpio83";
+		function = "qup2_se0";
+	};
+
+	qup_spi15_default: qup-spi15-state {
+		pins = "gpio84", "gpio85", "gpio99", "gpio100";
+		function = "qup2_se1";
+	};
+
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+	};
+
+	qup_spi17_default: qup-spi17-state {
+		pins = "gpio91", "gpio92", "gpio93", "gpio94";
+		function = "qup2_se3";
+	};
+
+	qup_spi18_default: qup-spi18-state {
+		pins = "gpio95", "gpio96", "gpio97", "gpio98";
+		function = "qup2_se4";
+	};
+
+	qup_spi19_default: qup-spi19-state {
+		pins = "gpio99", "gpio100", "gpio84", "gpio85";
+		function = "qup2_se5";
+	};
+
+	qup_spi20_default: qup-spi20-state {
+		pins = "gpio97", "gpio98", "gpio95", "gpio96";
+		function = "qup2_se6";
+	};
+
+	qup_spi21_default: qup-spi21-state {
+		pins = "gpio13", "gpio14", "gpio15", "gpio16";
+		function = "qup3_se0";
+	};
+
+	qup_uart0_default: qup-uart0-state {
+		qup_uart0_cts: qup-uart0-cts-pins {
+			pins = "gpio20";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_rts: qup-uart0-rts-pins {
+			pins = "gpio21";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_tx: qup-uart0-tx-pins {
+			pins = "gpio22";
+			function = "qup0_se0";
+		};
+
+		qup_uart0_rx: qup-uart0-rx-pins {
+			pins = "gpio23";
+			function = "qup0_se0";
+		};
+	};
+
+	qup_uart1_default: qup-uart1-state {
+		qup_uart1_cts: qup-uart1-cts-pins {
+			pins = "gpio24";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_rts: qup-uart1-rts-pins {
+			pins = "gpio25";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_tx: qup-uart1-tx-pins {
+			pins = "gpio26";
+			function = "qup0_se1";
+		};
+
+		qup_uart1_rx: qup-uart1-rx-pins {
+			pins = "gpio27";
+			function = "qup0_se1";
+		};
+	};
+
+	qup_uart2_default: qup-uart2-state {
+		qup_uart2_cts: qup-uart2-cts-pins {
+			pins = "gpio36";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_rts: qup-uart2-rts-pins {
+			pins = "gpio37";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_tx: qup-uart2-tx-pins {
+			pins = "gpio38";
+			function = "qup0_se2";
+		};
+
+		qup_uart2_rx: qup-uart2-rx-pins {
+			pins = "gpio39";
+			function = "qup0_se2";
+		};
+	};
+
+	qup_uart3_default: qup-uart3-state {
+		qup_uart3_cts: qup-uart3-cts-pins {
+			pins = "gpio28";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_rts: qup-uart3-rts-pins {
+			pins = "gpio29";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_tx: qup-uart3-tx-pins {
+			pins = "gpio30";
+			function = "qup0_se3";
+		};
+
+		qup_uart3_rx: qup-uart3-rx-pins {
+			pins = "gpio31";
+			function = "qup0_se3";
+		};
+	};
+
+	qup_uart4_default: qup-uart4-state {
+		qup_uart4_cts: qup-uart4-cts-pins {
+			pins = "gpio32";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_rts: qup-uart4-rts-pins {
+			pins = "gpio33";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_tx: qup-uart4-tx-pins {
+			pins = "gpio34";
+			function = "qup0_se4";
+		};
+
+		qup_uart4_rx: qup-uart4-rx-pins {
+			pins = "gpio35";
+			function = "qup0_se4";
+		};
+	};
+
+	qup_uart5_default: qup-uart5-state {
+		qup_uart5_cts: qup-uart5-cts-pins {
+			pins = "gpio36";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_rts: qup-uart5-rts-pins {
+			pins = "gpio37";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_tx: qup-uart5-tx-pins {
+			pins = "gpio38";
+			function = "qup0_se5";
+		};
+
+		qup_uart5_rx: qup-uart5-rx-pins {
+			pins = "gpio39";
+			function = "qup0_se5";
+		};
+	};
+
+	qup_uart7_default: qup-uart7-state {
+		qup_uart7_cts: qup-uart7-cts-pins {
+			pins = "gpio40";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_rts: qup-uart7-rts-pins {
+			pins = "gpio41";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_tx: qup-uart7-tx-pins {
+			pins = "gpio42";
+			function = "qup1_se0";
+		};
+
+		qup_uart7_rx: qup-uart7-rx-pins {
+			pins = "gpio43";
+			function = "qup1_se0";
+		};
+	};
+
+	qup_uart8_default: qup-uart8-state {
+		qup_uart8_cts: qup-uart8-cts-pins {
+			pins = "gpio42";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_rts: qup-uart8-rts-pins {
+			pins = "gpio43";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_tx: qup-uart8-tx-pins {
+			pins = "gpio40";
+			function = "qup1_se1";
+		};
+
+		qup_uart8_rx: qup-uart8-rx-pins {
+			pins = "gpio41";
+			function = "qup1_se1";
+		};
+	};
+
+	qup_uart9_default: qup-uart9-state {
+		qup_uart9_cts: qup-uart9-cts-pins {
+			pins = "gpio46";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_rts: qup-uart9-rts-pins {
+			pins = "gpio47";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_tx: qup-uart9-tx-pins {
+			pins = "gpio44";
+			function = "qup1_se2";
+		};
+
+		qup_uart9_rx: qup-uart9-rx-pins {
+			pins = "gpio45";
+			function = "qup1_se2";
+		};
+	};
+
+	qup_uart10_default: qup-uart10-state {
+		pins = "gpio46", "gpio47";
+		function = "qup1_se3";
+	};
+
+	qup_uart11_default: qup-uart11-state {
+		qup_uart11_cts: qup-uart11-cts-pins {
+			pins = "gpio48";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_rts: qup-uart11-rts-pins {
+			pins = "gpio49";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_tx: qup-uart11-tx-pins {
+			pins = "gpio50";
+			function = "qup1_se4";
+		};
+
+		qup_uart11_rx: qup-uart11-rx-pins {
+			pins = "gpio51";
+			function = "qup1_se4";
+		};
+	};
+
+	qup_uart12_default: qup-uart12-state {
+		qup_uart12_cts: qup-uart12-cts-pins {
+			pins = "gpio52";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_rts: qup-uart12-rts-pins {
+			pins = "gpio53";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_tx: qup-uart12-tx-pins {
+			pins = "gpio54";
+			function = "qup1_se5";
+		};
+
+		qup_uart12_rx: qup-uart12-rx-pins {
+			pins = "gpio55";
+			function = "qup1_se5";
+		};
+	};
+
+	qup_uart14_default: qup-uart14-state {
+		qup_uart14_cts: qup-uart14-cts-pins {
+			pins = "gpio80";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_rts: qup-uart14-rts-pins {
+			pins = "gpio81";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_tx: qup-uart14-tx-pins {
+			pins = "gpio82";
+			function = "qup2_se0";
+		};
+
+		qup_uart14_rx: qup-uart14-rx-pins {
+			pins = "gpio83";
+			function = "qup2_se0";
+		};
+	};
+
+	qup_uart15_default: qup-uart15-state {
+		qup_uart15_cts: qup-uart15-cts-pins {
+			pins = "gpio84";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_rts: qup-uart15-rts-pins {
+			pins = "gpio85";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_tx: qup-uart15-tx-pins {
+			pins = "gpio99";
+			function = "qup2_se1";
+		};
+
+		qup_uart15_rx: qup-uart15-rx-pins {
+			pins = "gpio100";
+			function = "qup2_se1";
+		};
+	};
+
+	qup_uart16_default: qup-uart16-state {
+		qup_uart16_cts: qup-uart16-cts-pins {
+			pins = "gpio86";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_rts: qup-uart16-rts-pins {
+			pins = "gpio87";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_tx: qup-uart16-tx-pins {
+			pins = "gpio88";
+			function = "qup2_se2";
+		};
+
+		qup_uart16_rx: qup-uart16-rx-pins {
+			pins = "gpio89";
+			function = "qup2_se2";
+		};
+	};
+
+	qup_uart17_default: qup-uart17-state {
+		qup_uart17_cts: qup-uart17-cts-pins {
+			pins = "gpio91";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_rts: qup0-uart17-rts-pins {
+			pins = "gpio92";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_tx: qup0-uart17-tx-pins {
+			pins = "gpio93";
+			function = "qup2_se3";
+		};
+
+		qup_uart17_rx: qup0-uart17-rx-pins {
+			pins = "gpio94";
+			function = "qup2_se3";
+		};
+	};
+
+	qup_uart18_default: qup-uart18-state {
+		qup_uart18_cts: qup-uart18-cts-pins {
+			pins = "gpio95";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_rts: qup-uart18-rts-pins {
+			pins = "gpio96";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_tx: qup-uart18-tx-pins {
+			pins = "gpio97";
+			function = "qup2_se4";
+		};
+
+		qup_uart18_rx: qup-uart18-rx-pins {
+			pins = "gpio98";
+			function = "qup2_se4";
+		};
+	};
+
+	qup_uart19_default: qup-uart19-state {
+		qup_uart19_cts: qup-uart19-cts-pins {
+			pins = "gpio99";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_rts: qup-uart19-rts-pins {
+			pins = "gpio100";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_tx: qup-uart19-tx-pins {
+			pins = "gpio84";
+			function = "qup2_se5";
+		};
+
+		qup_uart19_rx: qup-uart19-rx-pins {
+			pins = "gpio85";
+			function = "qup2_se5";
+		};
+	};
+
+	qup_uart20_default: qup-uart20-state {
+		qup_uart20_cts: qup-uart20-cts-pins {
+			pins = "gpio97";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_rts: qup-uart20-rts-pins {
+			pins = "gpio98";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_tx: qup-uart20-tx-pins {
+			pins = "gpio95";
+			function = "qup2_se6";
+		};
+
+		qup_uart20_rx: qup-uart20-rx-pins {
+			pins = "gpio96";
+			function = "qup2_se6";
+		};
+	};
+
+	qup_uart21_default: qup-uart21-state {
+		qup_uart21_cts: qup-uart21-cts-pins {
+			pins = "gpio13";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_rts: qup-uart21-rts-pins {
+			pins = "gpio14";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_tx: qup-uart21-tx-pins {
+			pins = "gpio15";
+			function = "qup3_se0";
+		};
+
+		qup_uart21_rx: qup-uart21-rx-pins {
+			pins = "gpio16";
+			function = "qup3_se0";
+		};
+	};
+
+	sdc_default: sdc-default-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
+
+	sdc_sleep: sdc-sleep-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..7547042d8e85 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6004,812 +6004,6 @@ tlmm: pinctrl@f000000 {
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
-
-			dp0_hot_plug_det: dp0-hot-plug-det-state {
-				pins = "gpio101";
-				function = "edp0_hot";
-				bias-disable;
-			};
-
-			dp1_hot_plug_det: dp1-hot-plug-det-state {
-				pins = "gpio102";
-				function = "edp1_hot";
-				bias-disable;
-			};
-
-			hs0_mi2s_active: hs0-mi2s-active-state {
-				pins = "gpio114", "gpio115", "gpio116", "gpio117";
-				function = "hs0_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			hs2_mi2s_active: hs2-mi2s-active-state {
-				pins = "gpio122", "gpio123", "gpio124", "gpio125";
-				function = "hs2_mi2s";
-				drive-strength = <8>;
-				bias-disable;
-			};
-
-			cci0_0_default: cci0-0-default-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_0_sleep: cci0-0-sleep-state {
-				pins = "gpio60", "gpio61";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci0_1_default: cci0-1-default-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci0_1_sleep: cci0-1-sleep-state {
-				pins = "gpio52", "gpio53";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_0_default: cci1-0-default-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_0_sleep: cci1-0-sleep-state {
-				pins = "gpio62", "gpio63";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci1_1_default: cci1-1-default-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci1_1_sleep: cci1-1-sleep-state {
-				pins = "gpio54", "gpio55";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_0_default: cci2-0-default-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_0_sleep: cci2-0-sleep-state {
-				pins = "gpio64", "gpio65";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci2_1_default: cci2-1-default-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci2_1_sleep: cci2-1-sleep-state {
-				pins = "gpio56", "gpio57";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_0_default: cci3-0-default-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_0_sleep: cci3-0-sleep-state {
-				pins = "gpio66", "gpio67";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			cci3_1_default: cci3-1-default-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-up = <2200>;
-			};
-
-			cci3_1_sleep: cci3-1-sleep-state {
-				pins = "gpio58", "gpio59";
-				function = "cci_i2c";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
-
-			qup_i2c0_default: qup-i2c0-state {
-				pins = "gpio20", "gpio21";
-				function = "qup0_se0";
-			};
-
-			qup_i2c1_default: qup-i2c1-state {
-				pins = "gpio24", "gpio25";
-				function = "qup0_se1";
-			};
-
-			qup_i2c2_default: qup-i2c2-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se2";
-			};
-
-			qup_i2c3_default: qup-i2c3-state {
-				pins = "gpio28", "gpio29";
-				function = "qup0_se3";
-			};
-
-			qup_i2c4_default: qup-i2c4-state {
-				pins = "gpio32", "gpio33";
-				function = "qup0_se4";
-			};
-
-			qup_i2c5_default: qup-i2c5-state {
-				pins = "gpio36", "gpio37";
-				function = "qup0_se5";
-			};
-
-			qup_i2c7_default: qup-i2c7-state {
-				pins = "gpio40", "gpio41";
-				function = "qup1_se0";
-			};
-
-			qup_i2c8_default: qup-i2c8-state {
-				pins = "gpio42", "gpio43";
-				function = "qup1_se1";
-			};
-
-			qup_i2c9_default: qup-i2c9-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se2";
-			};
-
-			qup_i2c10_default: qup-i2c10-state {
-				pins = "gpio44", "gpio45";
-				function = "qup1_se3";
-			};
-
-			qup_i2c11_default: qup-i2c11-state {
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-			};
-
-			qup_i2c12_default: qup-i2c12-state {
-				pins = "gpio52", "gpio53";
-				function = "qup1_se5";
-			};
-
-			qup_i2c13_default: qup-i2c13-state {
-				pins = "gpio56", "gpio57";
-				function = "qup1_se6";
-			};
-
-			qup_i2c14_default: qup-i2c14-state {
-				pins = "gpio80", "gpio81";
-				function = "qup2_se0";
-			};
-
-			qup_i2c15_default: qup-i2c15-state {
-				pins = "gpio84", "gpio85";
-				function = "qup2_se1";
-			};
-
-			qup_i2c16_default: qup-i2c16-state {
-				pins = "gpio86", "gpio87";
-				function = "qup2_se2";
-			};
-
-			qup_i2c17_default: qup-i2c17-state {
-				pins = "gpio91", "gpio92";
-				function = "qup2_se3";
-			};
-
-			qup_i2c18_default: qup-i2c18-state {
-				pins = "gpio95", "gpio96";
-				function = "qup2_se4";
-			};
-
-			qup_i2c19_default: qup-i2c19-state {
-				pins = "gpio99", "gpio100";
-				function = "qup2_se5";
-			};
-
-			qup_i2c20_default: qup-i2c20-state {
-				pins = "gpio97", "gpio98";
-				function = "qup2_se6";
-			};
-
-			qup_i2c21_default: qup-i2c21-state {
-				pins = "gpio13", "gpio14";
-				function = "qup3_se0";
-			};
-
-			qup_spi0_default: qup-spi0-state {
-				pins = "gpio20", "gpio21", "gpio22", "gpio23";
-				function = "qup0_se0";
-			};
-
-			qup_spi1_default: qup-spi1-state {
-				pins = "gpio24", "gpio25", "gpio26", "gpio27";
-				function = "qup0_se1";
-			};
-
-			qup_spi2_default: qup-spi2-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se2";
-			};
-
-			qup_spi3_default: qup-spi3-state {
-				pins = "gpio28", "gpio29", "gpio30", "gpio31";
-				function = "qup0_se3";
-			};
-
-			qup_spi4_default: qup-spi4-state {
-				pins = "gpio32", "gpio33", "gpio34", "gpio35";
-				function = "qup0_se4";
-			};
-
-			qup_spi5_default: qup-spi5-state {
-				pins = "gpio36", "gpio37", "gpio38", "gpio39";
-				function = "qup0_se5";
-			};
-
-			qup_spi7_default: qup-spi7-state {
-				pins = "gpio40", "gpio41", "gpio42", "gpio43";
-				function = "qup1_se0";
-			};
-
-			qup_spi8_default: qup-spi8-state {
-				pins = "gpio42", "gpio43", "gpio40", "gpio41";
-				function = "qup1_se1";
-			};
-
-			qup_spi9_default: qup-spi9-state {
-				pins = "gpio46", "gpio47", "gpio44", "gpio45";
-				function = "qup1_se2";
-			};
-
-			qup_spi10_default: qup-spi10-state {
-				pins = "gpio44", "gpio45", "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_spi11_default: qup-spi11-state {
-				pins = "gpio48", "gpio49", "gpio50", "gpio51";
-				function = "qup1_se4";
-			};
-
-			qup_spi12_default: qup-spi12-state {
-				pins = "gpio52", "gpio53", "gpio54", "gpio55";
-				function = "qup1_se5";
-			};
-
-			qup_spi14_default: qup-spi14-state {
-				pins = "gpio80", "gpio81", "gpio82", "gpio83";
-				function = "qup2_se0";
-			};
-
-			qup_spi15_default: qup-spi15-state {
-				pins = "gpio84", "gpio85", "gpio99", "gpio100";
-				function = "qup2_se1";
-			};
-
-			qup_spi16_default: qup-spi16-state {
-				pins = "gpio86", "gpio87", "gpio88", "gpio89";
-				function = "qup2_se2";
-			};
-
-			qup_spi17_default: qup-spi17-state {
-				pins = "gpio91", "gpio92", "gpio93", "gpio94";
-				function = "qup2_se3";
-			};
-
-			qup_spi18_default: qup-spi18-state {
-				pins = "gpio95", "gpio96", "gpio97", "gpio98";
-				function = "qup2_se4";
-			};
-
-			qup_spi19_default: qup-spi19-state {
-				pins = "gpio99", "gpio100", "gpio84", "gpio85";
-				function = "qup2_se5";
-			};
-
-			qup_spi20_default: qup-spi20-state {
-				pins = "gpio97", "gpio98", "gpio95", "gpio96";
-				function = "qup2_se6";
-			};
-
-			qup_spi21_default: qup-spi21-state {
-				pins = "gpio13", "gpio14", "gpio15", "gpio16";
-				function = "qup3_se0";
-			};
-
-			qup_uart0_default: qup-uart0-state {
-				qup_uart0_cts: qup-uart0-cts-pins {
-					pins = "gpio20";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rts: qup-uart0-rts-pins {
-					pins = "gpio21";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_tx: qup-uart0-tx-pins {
-					pins = "gpio22";
-					function = "qup0_se0";
-				};
-
-				qup_uart0_rx: qup-uart0-rx-pins {
-					pins = "gpio23";
-					function = "qup0_se0";
-				};
-			};
-
-			qup_uart1_default: qup-uart1-state {
-				qup_uart1_cts: qup-uart1-cts-pins {
-					pins = "gpio24";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rts: qup-uart1-rts-pins {
-					pins = "gpio25";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_tx: qup-uart1-tx-pins {
-					pins = "gpio26";
-					function = "qup0_se1";
-				};
-
-				qup_uart1_rx: qup-uart1-rx-pins {
-					pins = "gpio27";
-					function = "qup0_se1";
-				};
-			};
-
-			qup_uart2_default: qup-uart2-state {
-				qup_uart2_cts: qup-uart2-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rts: qup-uart2-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_tx: qup-uart2-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se2";
-				};
-
-				qup_uart2_rx: qup-uart2-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se2";
-				};
-			};
-
-			qup_uart3_default: qup-uart3-state {
-				qup_uart3_cts: qup-uart3-cts-pins {
-					pins = "gpio28";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rts: qup-uart3-rts-pins {
-					pins = "gpio29";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_tx: qup-uart3-tx-pins {
-					pins = "gpio30";
-					function = "qup0_se3";
-				};
-
-				qup_uart3_rx: qup-uart3-rx-pins {
-					pins = "gpio31";
-					function = "qup0_se3";
-				};
-			};
-
-			qup_uart4_default: qup-uart4-state {
-				qup_uart4_cts: qup-uart4-cts-pins {
-					pins = "gpio32";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rts: qup-uart4-rts-pins {
-					pins = "gpio33";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_tx: qup-uart4-tx-pins {
-					pins = "gpio34";
-					function = "qup0_se4";
-				};
-
-				qup_uart4_rx: qup-uart4-rx-pins {
-					pins = "gpio35";
-					function = "qup0_se4";
-				};
-			};
-
-			qup_uart5_default: qup-uart5-state {
-				qup_uart5_cts: qup-uart5-cts-pins {
-					pins = "gpio36";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rts: qup-uart5-rts-pins {
-					pins = "gpio37";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_tx: qup-uart5-tx-pins {
-					pins = "gpio38";
-					function = "qup0_se5";
-				};
-
-				qup_uart5_rx: qup-uart5-rx-pins {
-					pins = "gpio39";
-					function = "qup0_se5";
-				};
-			};
-
-			qup_uart7_default: qup-uart7-state {
-				qup_uart7_cts: qup-uart7-cts-pins {
-					pins = "gpio40";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rts: qup-uart7-rts-pins {
-					pins = "gpio41";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_tx: qup-uart7-tx-pins {
-					pins = "gpio42";
-					function = "qup1_se0";
-				};
-
-				qup_uart7_rx: qup-uart7-rx-pins {
-					pins = "gpio43";
-					function = "qup1_se0";
-				};
-			};
-
-			qup_uart8_default: qup-uart8-state {
-				qup_uart8_cts: qup-uart8-cts-pins {
-					pins = "gpio42";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rts: qup-uart8-rts-pins {
-					pins = "gpio43";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_tx: qup-uart8-tx-pins {
-					pins = "gpio40";
-					function = "qup1_se1";
-				};
-
-				qup_uart8_rx: qup-uart8-rx-pins {
-					pins = "gpio41";
-					function = "qup1_se1";
-				};
-			};
-
-			qup_uart9_default: qup-uart9-state {
-				qup_uart9_cts: qup-uart9-cts-pins {
-					pins = "gpio46";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rts: qup-uart9-rts-pins {
-					pins = "gpio47";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_tx: qup-uart9-tx-pins {
-					pins = "gpio44";
-					function = "qup1_se2";
-				};
-
-				qup_uart9_rx: qup-uart9-rx-pins {
-					pins = "gpio45";
-					function = "qup1_se2";
-				};
-			};
-
-			qup_uart10_default: qup-uart10-state {
-				pins = "gpio46", "gpio47";
-				function = "qup1_se3";
-			};
-
-			qup_uart11_default: qup-uart11-state {
-				qup_uart11_cts: qup-uart11-cts-pins {
-					pins = "gpio48";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rts: qup-uart11-rts-pins {
-					pins = "gpio49";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_tx: qup-uart11-tx-pins {
-					pins = "gpio50";
-					function = "qup1_se4";
-				};
-
-				qup_uart11_rx: qup-uart11-rx-pins {
-					pins = "gpio51";
-					function = "qup1_se4";
-				};
-			};
-
-			qup_uart12_default: qup-uart12-state {
-				qup_uart12_cts: qup-uart12-cts-pins {
-					pins = "gpio52";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rts: qup-uart12-rts-pins {
-					pins = "gpio53";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_tx: qup-uart12-tx-pins {
-					pins = "gpio54";
-					function = "qup1_se5";
-				};
-
-				qup_uart12_rx: qup-uart12-rx-pins {
-					pins = "gpio55";
-					function = "qup1_se5";
-				};
-			};
-
-			qup_uart14_default: qup-uart14-state {
-				qup_uart14_cts: qup-uart14-cts-pins {
-					pins = "gpio80";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rts: qup-uart14-rts-pins {
-					pins = "gpio81";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_tx: qup-uart14-tx-pins {
-					pins = "gpio82";
-					function = "qup2_se0";
-				};
-
-				qup_uart14_rx: qup-uart14-rx-pins {
-					pins = "gpio83";
-					function = "qup2_se0";
-				};
-			};
-
-			qup_uart15_default: qup-uart15-state {
-				qup_uart15_cts: qup-uart15-cts-pins {
-					pins = "gpio84";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rts: qup-uart15-rts-pins {
-					pins = "gpio85";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_tx: qup-uart15-tx-pins {
-					pins = "gpio99";
-					function = "qup2_se1";
-				};
-
-				qup_uart15_rx: qup-uart15-rx-pins {
-					pins = "gpio100";
-					function = "qup2_se1";
-				};
-			};
-
-			qup_uart16_default: qup-uart16-state {
-				qup_uart16_cts: qup-uart16-cts-pins {
-					pins = "gpio86";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rts: qup-uart16-rts-pins {
-					pins = "gpio87";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_tx: qup-uart16-tx-pins {
-					pins = "gpio88";
-					function = "qup2_se2";
-				};
-
-				qup_uart16_rx: qup-uart16-rx-pins {
-					pins = "gpio89";
-					function = "qup2_se2";
-				};
-			};
-
-			qup_uart17_default: qup-uart17-state {
-				qup_uart17_cts: qup-uart17-cts-pins {
-					pins = "gpio91";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rts: qup0-uart17-rts-pins {
-					pins = "gpio92";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_tx: qup0-uart17-tx-pins {
-					pins = "gpio93";
-					function = "qup2_se3";
-				};
-
-				qup_uart17_rx: qup0-uart17-rx-pins {
-					pins = "gpio94";
-					function = "qup2_se3";
-				};
-			};
-
-			qup_uart18_default: qup-uart18-state {
-				qup_uart18_cts: qup-uart18-cts-pins {
-					pins = "gpio95";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rts: qup-uart18-rts-pins {
-					pins = "gpio96";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_tx: qup-uart18-tx-pins {
-					pins = "gpio97";
-					function = "qup2_se4";
-				};
-
-				qup_uart18_rx: qup-uart18-rx-pins {
-					pins = "gpio98";
-					function = "qup2_se4";
-				};
-			};
-
-			qup_uart19_default: qup-uart19-state {
-				qup_uart19_cts: qup-uart19-cts-pins {
-					pins = "gpio99";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rts: qup-uart19-rts-pins {
-					pins = "gpio100";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_tx: qup-uart19-tx-pins {
-					pins = "gpio84";
-					function = "qup2_se5";
-				};
-
-				qup_uart19_rx: qup-uart19-rx-pins {
-					pins = "gpio85";
-					function = "qup2_se5";
-				};
-			};
-
-			qup_uart20_default: qup-uart20-state {
-				qup_uart20_cts: qup-uart20-cts-pins {
-					pins = "gpio97";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rts: qup-uart20-rts-pins {
-					pins = "gpio98";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_tx: qup-uart20-tx-pins {
-					pins = "gpio95";
-					function = "qup2_se6";
-				};
-
-				qup_uart20_rx: qup-uart20-rx-pins {
-					pins = "gpio96";
-					function = "qup2_se6";
-				};
-			};
-
-			qup_uart21_default: qup-uart21-state {
-				qup_uart21_cts: qup-uart21-cts-pins {
-					pins = "gpio13";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rts: qup-uart21-rts-pins {
-					pins = "gpio14";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_tx: qup-uart21-tx-pins {
-					pins = "gpio15";
-					function = "qup3_se0";
-				};
-
-				qup_uart21_rx: qup-uart21-rx-pins {
-					pins = "gpio16";
-					function = "qup3_se0";
-				};
-			};
-
-			sdc_default: sdc-default-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <16>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <10>;
-					bias-pull-up;
-				};
-			};
-
-			sdc_sleep: sdc-sleep-state {
-				clk-pins {
-					pins = "sdc1_clk";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				cmd-pins {
-					pins = "sdc1_cmd";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-
-				data-pins {
-					pins = "sdc1_data";
-					drive-strength = <2>;
-					bias-bus-hold;
-				};
-			};
 		};
 
 		sram: sram@146d8000 {
-- 
2.43.0

