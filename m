Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636365;
	b=HFJyRgiu1ysOcH3JZqnJWvzpL5oyy0IIM4BVkyXN1GR/zSNo8DxWE7xobDK4zoQ5enpD
	 87a5hlj6B1Qe/rlh/GTG24Z4DJVA5Vm83vCdMpfb1sxFv09o9nbqdnXCt8Ls4Kbc/cCNp
	 Phn2vtdtnucfEbIbxbw50WZJLQ/gEwP4r/xrhD5YH/hMedUpBBu+fgRhhYARpXUWLI5oX
	 R6lZDAoczPVcYDf4RaQh/kigx0m4wNmGPgw8MZsAG+gS1QD1oMBVvt8b0HWhqwo9QX+uQ
	 toHm91ugvJYFh453IqcTwA3fiEV810EHjoXETNOMvGpj4tlhazdTvy7l8UCgdpomMoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WBMiQJP19jkznUvjuyL4lpjOIC11peac/ln1EsczLao=;
	b=WXT4TQNnYpJEaZFuW/3vmQeqew4QdPHY8qy/EdKGnqhnq4w9rJ0kGWL+F9DeDivQTuri
	 biTW6vZtGj47fHW+lD3xltY5aU6N2WuaPUgIEnBnZJUCN8gkE6z48k67Dcp3nDggfh0C/
	 YX5WcteueShKiXPgLFCE1FW2mFWAzSXLueUo6AL3m0cOiRSA+G2IcAISJXNbpVtc8zlxd
	 kRxoDaoODMTs6iJMokDKeYh9EQQU8Lg+v6XnnGo06AscsUwf/HJC6DkkoaLvkampzrrou
	 L+D8uX8dpRo0GYS+oR13FENavjJyevA5otKwmaUV1cxZf6AlmepVsfY0wRM7c4VzENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="In/s4wR7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxBlYlzW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AC606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=In/s4wR7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxBlYlzW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgWrB1138016
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WBMiQJP19jk
	znUvjuyL4lpjOIC11peac/ln1EsczLao=; b=In/s4wR7F7GpkDpKtEXoGM8Ekyy
	r+YJwoXNY/jaK/4q9Z+wWrp6sm8eheLhn5tOuobZHA0MRMWLRP9UVRJnUvnADK4E
	FcFp6lh6e30ybjRvN3O4SDG3TkS123CvqLt5m+oPk5f4HszeQgxtBvTfG07dpN0P
	fiKSTakERDztTAzGMUHjLgPoDaSpYN5vKBeaRBDwhE4b7+qyEG2akNJ0742lK77O
	T96VstZYbECBaat3Smep3aoRPsGKwEB+k/CFuFt0mEirZgaV96ZwTHLHDtg2VNF6
	DVXh0JfUJfRM3NoMqDn+tbX0ElcfubTb+R5QmKFHOSJLZh1uVuLXDaG+M7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s811p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so892265485a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636363; x=1796241163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBMiQJP19jkznUvjuyL4lpjOIC11peac/ln1EsczLao=;
        b=gxBlYlzWyVE870k+kd+pZ7HsJU2jT17QK1FnQMYDJX+Bk9hsNMJ6fgkl2RI93Vvppl
         Yo7An+2tych1cUc4dTIAfEmI8oOeMC9jk/54ieSEZoLFG5Wr8G40MG8vcpKhwXnybufZ
         ldNiqmBEsmU9PsbrVmlt+MukAT4M7w1lnpzjbht2Yd8yG9LkCuEwDLMNrcy9o0rs3DLH
         Z97jhu7P4kUAxbAj/lWNJ1TOGpG9sTbR4fXVARDF6aUAtZS8ZQ++5xYh0h/GN8ggOika
         Mb2yY83XGn1rLIzRJRSx8moOL/vzBhHDmWPa/7cIOjf2dM410HYVzQFWFvYVjWe9P0U1
         b2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636363; x=1796241163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBMiQJP19jkznUvjuyL4lpjOIC11peac/ln1EsczLao=;
        b=zbaGsOiBEMHmCeQDY9nEE5Lhoz3keVciSQWDxVyqQsBgbJibHQEGXuVBdlTokwKK3R
         FCZOF7itl+j+I0ui1sPSmYLRG0TQW4rBs6NNppvhQUdP3mvY6fZV/mBFBJUy9AiZPb2i
         sYR+VPfeiCmv/iCHbiMWZywlfznIzmZlvjH8gntHdIAo6Kx+BN5yizwP6YacBKfNhXvY
         3FF+RoI7MId07261uDCw3oQEYneF990ChNbXGsMILtk4XYT/rR4QKY7gg9JLQtNaXp3p
         d/9+dc6LP9CSsuhuOewO2flJCUIm4jO0U7NBK9d+H9aCZAk8f21G1FJuOnb1KxtglfCM
         g2Eg==
X-Forwarded-Encrypted: i=1; AL+hErG813YpUBTIB9lOCgziSkRa2T3yCvJ8K2OMCdZzWYawYNRtZNz3erjm0lwrNJzZJt7VEDzh/K1t0JSP@vger.kernel.org
X-Gm-Message-State: APuU4Z/crm1/XxkUzQNz3RQhqh3eaCLcaCph/xBXmGDv2C2rQFCcqjWy
	HnLLBS5ZDBdoLWIkjrhjIpn/F2g0+6MHFVGEERP7+CMCi3suKtfNRvt7Bcp86uGYesgPGjFNdJk
	Vx+0QsFh3Xz54Kaz4UiUbKr5BzWEfQ2bE1HZXgVZM8a3pB6XPqFTpL+lQxi2uHh06
X-Gm-Gg: AZFdTZfr/7NVI4GObVr7/G6STU35G12gxc05l+iMqw4t25L3pzHRWDFwBukh45D6XqI
	GbPjjisObSrirFjYYmRyU6Bx1XaSXPpqSpF4KN9Ta1fy7w5ekxFjW6m87PQLXnXY4NCRjUgXgGp
	9k2asKe5EtI/Ink5isQZEfLmTfkX6baxm/Mg5eKDvCExOvMvk6UZDnZVdY5G6eU/j11nCXk9uYR
	/NIUrzGUk0z0nTRwWTcA04jerQ0D5ZrSegh5Pc/zCUApGoSdVqpsVd5lkfoILxecZ+nu+5oL8dX
	aRy255wzAV1DbPYzszoWhsLgqXfq+odQoX3uPY2WQZ9tpyQiHNo4UVG/Rb1zNE0sZyWrVtKoX++
	die5acgNzZFyTdjQsiYdUHgiNweIOeMg11qv2tfH1qCtj9muZrFBothf0Qm73g0q3
X-Received: by 2002:a05:620a:6c01:b0:93e:c12c:43f9 with SMTP id af79cd13be357-949bab6e243mr3192619685a.70.1795636362930;
        Wed, 25 Nov 2026 11:52:42 -0800 (PST)
X-Received: by 2002:a05:620a:6c01:b0:93e:c12c:43f9 with SMTP id af79cd13be357-949bab6e243mr3192615885a.70.1795636362477;
        Wed, 25 Nov 2026 11:52:42 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm
Date: Wed, 25 Nov 2026 19:52:26 +0000
Message-ID: <20261125195226.1563577-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b073c8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mO8_gwkcAAAA:8 a=lS6zJmM_-713XfzwtBwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: R4oCjovYwiMFuF4rLY-vfITP64cRgU2W
X-Proofpoint-ORIG-GUID: R4oCjovYwiMFuF4rLY-vfITP64cRgU2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX/nIhssVx6NpD
 +oCNI32zj+/Ik94aZK0D6l76wXJ7JkTmY/Sujsk1e0wCG+82iVDVSfCwJXKHcAnUn0ius82iFhj
 /6efsqUODxN3virhdhtcBNDPO9tYuiPcrRNhGbezQzHEQX41Fhw9ssP7HrDAy28Sv3viObYUdTy
 TgQ0LFHMfDZSktoij0Sf2DjN2ySitILvETQ99DRcxrUOOqZFqp1brTCv9oBHiZmdKem9tWbrJIW
 YtnNjft0xM4doWTNUBElyu+fEpNkpVBCtFX5n/aIyWNG4nR22UpJ/KnIe4sRRVSAkgHb0HY9VX3
 A5HuX5o6d73ASwOy5YZOE7OF2jdnUkYQXA7r9lGLu7C5RLgMYe+U7lqoonI11FLgDrrSj0ucnQY
 45qUf+2IRzYntC9fglNJu8uxeejTutWI1e6pQur8IqGgxQnRrEWasWPXFkvohKlhLcYpJsk+Hdf
 fHFbTGH9oIZEa4mEd2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfXyMGICjKbuBW6
 BLVP+PQgfGJBP4fzKGZEUATAtgVEfbmJAmjFBSu4Tc5U5xpRV59sGa9u5rKCove3GAG51Nb7hht
 nlRc0/nEcF2L/Wk9Zi2DpffQbjJV5qE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
node and wire real brightness control through the pmk8850 PWMR output
(EDP_BL/PWMR_BV_PS on the schematic).

panel-edp was asserting EDP_BL_EN before eDP link training, turning the
backlight on ahead of video. With a dedicated backlight node the
framework toggles EDP_BL_EN after the link is up; TLMM 18 remains the
LED-driver enable, now gated correctly.

The panel takes only its 3.3 V logic supply and references the
backlight via a phandle. Brightness drives the LPG/PWM channel on
pmk8850 routed out via pmk8850_gpios gpio5 (func3).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         |  3 ---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 2d6578edcc82..bad49ba5443f 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -156,6 +156,16 @@ vreg_edp_bl: regulator-edp-bl {
 		regulator-always-on;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8850_pwm 0 4266537>;
+		enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -579,11 +589,8 @@ &mdss_dp3 {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
-			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
+			backlight = <&backlight>;
 
 			port {
 				edp_panel_in: endpoint {
@@ -696,6 +703,17 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
+&pmk8850_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8850_pwm {
+	status = "okay";
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index 053ae42ef0fb..dfa99cbd21d7 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -69,9 +69,6 @@ reboot_reason: reboot-reason@48 {
 
 		pmk8850_pwm: pwm {
 			compatible = "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
 			#pwm-cells = <2>;
 
 			status = "disabled";
-- 
2.53.0

