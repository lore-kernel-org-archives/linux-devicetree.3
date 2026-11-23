Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463548;
	b=tJxCnDWgFpu8DEswoko+4mr77WPSYv+qafIkWkTkxEasnW6HtYQXOtjGCgNrZTfxxo81
	 IZiLQ8vYWOsLUEWmNeCkHX8wpjFb0yfrm/GApUf7sSAslcCoiJf326rusmAv+xppzW2s6
	 +MeM3IUigPIpUnf3QlGHahg33stIJjD4NthaIhwxL9aMN8uF855hCX0OByQD1HmymxI5e
	 UziR3x3XKaNGwbMJsPJtaY5dJ9KLCBU/Sftj17cVenQJAr6gawc0tRnfyXewwFAgf3xd0
	 vBhAvc/cSwxVoKe6D5Z3x2sru8mNVv8SQAC6UGY7HAfhFTlAuVR698uq9azMP+tAs9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
	b=qUJW7RSRN6tuTjYX/JRdvlI0syKuOCDZOeQcS3+YZdSdxWxbuQMzERxX/6HGo6ZUO+Ti
	 Hrxz+sd7od3YZ8i9UBH8iierDKeHEeQ1FzgwJmXmBy20AcrRA3m5Fwf+0OeujeffqDGUZ
	 VmEfBuSdQiwCKRoGjivTdYwqpejMkW0nLKhMFyBkI2XI8oXsU3QI1pBoQa7U4qq5Dlftf
	 gK0mJsJmrZn/fgr+B/42q3G12lKPvtxNnasdNJ+zFp+8lnoeAiZkpjwRrZcfiEOgX9AiR
	 9x5S4WyV0XUEzkO9ijZZDWylRRqkZVNx4t4EA6zUL9PqOo390Wq2FhIYIXlKaupIbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A4C606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEuoM6vL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhCVNVdN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNxaE3441386
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=; b=SEuoM6vLNzMom+R9
	jHLxOHK0ndtSRUeXl8wV2xIxUa5faQ3dFWkmzJKJsZtxQwAV5as9U9wDAz046fYg
	V6bTnoNjfNH8JOX7NuMp7Yk7O1LJ/usacXy07ZmELCXfRhnYc/tZk9RTx8T84I33
	a3rzuqV+H0tsZalPTvt+uqHUZr8nshLKPvr7qimWEB4tzhklz8foUi1BbvAqXRCv
	h/59mh/yLErvPKfQ/fm7XNFuMB82ts8oU3t7wCj1qa271lckokZHIz1dtaOevRQD
	Xsg/sF6a9+vBSQUIs88t/C8Auehy1Z3LBCFdzYX3ohUqKGrHksVX8dUX//9ifkX1
	OjdV2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr83ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6639866eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463547; x=1796068347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=fhCVNVdN2azqQAEFSzQIOZyF5j9or2gDQvyAI1PGSAj9pRGPZ+YXNWvTAQ8+8QMdy7
         gRWifWOXgWG2Xf9rX9FctC+5I7ndHxqSViOIynCt7lj6XPO9J5oRR83T0/3U1pHZ+xJM
         +ZXURDzN6Pw/vnkeoFIZ1Y5lsBrrVH3SVopUlkNsaPTIdwMB4FC/WZtasvtNzYVhIlv3
         LZz61UlX1R4vCBl2s3lqFFs9SQlofBqkpsZFH2zVAFicvAZS78oEmLx1z6/TIroSoRJZ
         d9bEFINZi3ijjVaknXwz5tpRk006Q+xSUzYpW4sIQBkgf8EymtPGfgT1VmesX8Vz+IQb
         c3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463547; x=1796068347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btlcSdqV5jTYTQSssW3pWW39iKegzCvI972FmwWqElw=;
        b=CS0alI+dUjtLw0m6ozrvWcLLIgFR18MtXESV7aQpGHybDWeaU0qfg1EspIwru45arW
         eRwYBTuBOqqfQ7COYYp7kcwLcSbIpxdSHY6XMt+5R10iyuM3+XfpJLfEl5whyZMpQsWa
         7VBYdJdmk7kan6yXd1xwgqjEI9qRP7ZtCMr05CCrGMTIS8Fvohb7Ercu58vHFl8pQPXP
         Pp/52Sf9Hq+gJdnygEzu2KUVckPfJmWfVsSyIIWm1IBJ5CSXTsGfpOxOJmUD7yZ5Be41
         jmEylMSDAM1NRMVTqwX6AcVq6vABjdPfDrl6wqRPRdOp6Xqc1gmM99qT3630ccmo9koE
         v52w==
X-Forwarded-Encrypted: i=1; AL+hErHpzydl6fo7dARp6pI61veKSFlAmqCN3/T985I+mlUQUly86NiW/r4FG6xE755wgEi3aadBz2hElmD6@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xlf6iuVUEQt4EzKxF7+Mc+13uJqPg377HmtBg8/02LTvBPQNG
	42kP1m0LaGQRucxRxcciD+dShdlh8ZrRxKyQushRj4QlDmlFOdywGsJjlL7HCR0L+hxzBgnWVRR
	ShyCAm4yp03ZE4HD2GXyY23Jv9uUFaa57DRDKU1Z70OsQgyLSp721O1HsorwliHC9
X-Gm-Gg: AZFdTZe+jtBtd/7tVzmkeGpAX2hKTGgSR1J5O9pfxbnwrNFK3gOQQUnLl+dol5M8irL
	Pydy93sjJg2IG7ii7cQkDUgolOOdSYqas92nPdbDf8ZFhLPS/QCCDHEapXuEng7shHYQzrpNDpd
	B2+hgLSG68FrxmmsK4wz+eCDm9kxweH2RlrVY46nn/qftbQUnMrLKgRfIMJl2Jee5RltZmGAkLF
	vheEuMJmYvySeSsdAgnW06Ml5XKoFQoGInRAP2m7zASPJeCWt1PoV90i7Jp6K/uLQs0yVMLH8kf
	b+oM89XXD80sUH0104kX2ROdFLdrJNW4rnW4Srkd4RzgFmARl4X0NofRN1clfStgQ54qLDDsz5Q
	XUtzlZV2tOhH7add6wEwFYsp4adc9lxzj04pruym+aiXLNQrOvDMuqXsQquE1DyyzDt8HEkx9Vg
	==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564881eec.24.1795463546822;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr7564855eec.24.1795463546284;
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:37 +0530
Subject: [PATCH v3 06/10] arm64: dts: qcom: sa8775p: Add GP M/N clock
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-6-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX5FyItJ5aAPiS
 LvJ5xXeDB0nICtDVrJYSV3R34GPoa7e5QvJWFQ/0VctFml7FJa4wcMqLYQ4vKxx21Xp0V+UUGYI
 n1zppJ56erJqjn5AS+ReKhEPzOzP/zc=
X-Proofpoint-ORIG-GUID: B7D9Orzjh--_f-TD6P0ncayqcOytz3r-
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04997b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qaJfFEnBwp12TzHMd1oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX9xnkemr4fl/2
 a2xNdXJE2dR2OwJYgL38uMpnjp9STBcZoP+hmImq7GbhZl5URKkAjRXhfzqYAY7DMLU/Div+iv4
 lNOQaXe6fw4WXPj960oqTy6Ri0Vx2yEOKtyqCw9vSfYToB5f7Or82VtPOYzkOjq8H9InyrVtATL
 OnZB+uAWSl6kjpdmzVAuYe3Heeq0YqWprn972KNyCkHNmd+lh5ztvX6UvIZB6hIECfj4nG/vz5T
 gHPwQndLt+za3knn/dnm2F8504AI3lQGigenixiTx4Lopz3h/d3qyEPTrJJIxd/WWxFHB/tP6GE
 rYRgV6gYkv/PITn0e6tuPi2xrrXUWAJo8ifkJ5KIlgnl/Wg9L1zoRoe5JLdAlLr5L34VIaSV5bm
 cl1n3qLa7DM4oe0T9EY3mYgsMoXlhgM9LH/vTAtE2Wm1qWpfOfhYSPK/EBzTCfdiFVk4ahOkY+9
 Z5o1C3678w1Yq4DS6Fw==
X-Proofpoint-GUID: B7D9Orzjh--_f-TD6P0ncayqcOytz3r-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..4bba23df8a95d306867e22c49981dd8c22d4a6e4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1849,6 +1849,20 @@ lpass_ag_noc: interconnect@3c40000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gp_mn: clock-controller@88d3000 {
+		compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+		reg = <0x0 0x088d3000 0x0 0x1000>;
+		clocks = <&gcc GCC_PDM_XO4_CLK>,
+			 <&gcc GCC_PDM_AHB_CLK>;
+		clock-names = "pdm", "ahb";
+		#clock-cells = <0>;
+		pinctrl-0 = <&gp_mn_active>;
+		pinctrl-names = "default";
+		assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+		assigned-clock-rates = <4800000>;
+		status = "disabled";
+	};
+
 	usb_0_hsphy: phy@88e4000 {
 		compatible = "qcom,sa8775p-usb-hs-phy",
 			     "qcom,usb-snps-hs-5nm-phy";
@@ -2515,6 +2529,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	gp_mn_active: gp-mn-active-state {
+		pins = "gpio35";
+		function = "gp_mn";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	hs0_mi2s_active: hs0-mi2s-active-state {
 		pins = "gpio114", "gpio115", "gpio116", "gpio117";
 		function = "hs0_mi2s";

-- 
2.34.1

