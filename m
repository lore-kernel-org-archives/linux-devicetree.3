Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655935;
	b=cfNB7nQTerMt+1i8WOT5KyGhxnPJSr0robyOpD5CRnyzq/jcFTGchy1l98ctE4OL+foe
	 GzEZNjIUDic92tSHvfK2chn3vun6xOawXSFOxfhW98KPa4Msnbg+1TWTthP1e3aNrtvYu
	 jsXyxITrDSYgXJ4Zv9LHtzCpBiLXZLC1j6aUv3s2fWphZaWlp9IzPpSj99uA9/z6TaUxR
	 B/ahdsV07VdI2TrUX91w5GXva3KR39MLdjgWgg98xc4i5ptuet4KncLkJaHPbqgCIY7oh
	 fT75qMBI09oc9RvFAl6VXRRH+BGStOgJHiXazlF1lu1YYpTDyWxO0saHyGGJKWkL6tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
	b=VU4kI1oYFd2bDPDm6wb9vJtW+rQhpL7eLJqTceVEiiIgNqV79g6rNu5rB5ntlbjL3bJN
	 RFCBy/0VveX7IV8+gRo+qKwKdjLWiNs1tEldLwC8rCGK0phVr+iD9GBDO5FID+wCjZhzA
	 wIvMkVlvLSMkGNH4ogt+A3INbBRK1lkbWQ7XuvCQO0tEFt4e7V7dUPd0TN31fAe7i8RMx
	 VQQS7SwWBpSCF7bAkdyoTaw8dBDn82YUEtiIA8pGVb5k6bcqv70AKmKShOkqyYjJeXEsn
	 4m19R2km4pbXlmaevydTTR0Tmr19DG7fAxeZWWpKrJqKuboEmki26KmVGWtQkepD1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rb30fIlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2QPAAeq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E6606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5E6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rb30fIlB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2QPAAeq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wXhK3845316
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=; b=Rb30fIlBgs+mcJCD
	QUBI9NvC+h1X+6x5RkDiB4jvORgBbB5+6PMB0EpONoFZPCx4kdp1j6XNqARdEx6Z
	ypy5qVylklR1HjsMl9Nvg9WEJC8qte5JxFxcuDHArHi2XFE6ErX1aSGA93H2XiJ1
	orCDrKqx2X4DdXwgytW8Ws9UQM2cSRQkG4NPboww7Z9qLUJvnhl6V8pv5Al+FT1O
	XLNAMNEytXRpU4/bWp5qMOdz4YHoOgjFoJ4uec+58tsCj+f/plJeFsVmhjin9rCJ
	FWZ8H6Zi56R5xrbHD3/dHGD4aj0/s+bln2V1mAAtDom3QvNtFzskD0Kk8K1anH1I
	DHME0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgn7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c950b47ffso7176971cf.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655933; x=1795260733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
        b=J2QPAAeqnZDTvRVcdWybxMkQgaCoLdtCymx9C9YXsHgnywXEVMrfyh3LfCaYz8HhjN
         osltLvvxDjOx4S7DlDgAIjh//mMdgTxe55MQEL2MbULvgEhQvxmJZ7r0kCANOMjnZDi9
         sBnb9zoX6QiBV4X0KUgJvsSQvD90CGDhwZfFW6hBRaFWXvqKwacWv7eM8B5ICFCXuOO+
         XovM+x8uWBmp8+cPAa0KuWjOD9SO/XvZ05q1pNKC+8NhmUJtxPXvWLmN2O1o8J75vN3j
         5JkWY0gp846nve3Z2PI0Ftb0KDgScBgfRh0/RJnc8EhZkkDnggAD9LX6F6iWFEvH4/Ux
         ZqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655933; x=1795260733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
        b=Pi+eG6eDkDFOWBPD+WK3QZyh499AhNwz0IHoBdnkIi3huoSAKUM32n9g7UzlHuBzNe
         l8M4lVJJTcyMy2f4Ek7/6Nk07bENPkAF6UtkE6uzJVunKWETJXOUNd/KGVecZBuSBF1G
         gFb6uTFzHExjP83KkaHnld/cy9A2t3AxJjiDMu/6L2AUYgllFOO1ZE6Cy+FaSV2igOXN
         x7gxiqPJla7E3GKJotkTBVD/U3Cr8ffFy5tyP3HvhUZeNzfaV7emdPnFqt+jPLB5d/w1
         /UaEkNankI1gnTvCtUyIH6e9iHo1vri5XtmWUDeGWwmU2Ec6wdjQG4By7byEZzucNw8g
         1zCw==
X-Forwarded-Encrypted: i=1; AL+hErHALTrqTUkB1/w2evZbHv4pqfrRym9lKB8ngb4rrfn17O3pz54XQIGWH20W9reWxClppjjviB+zT/NR@vger.kernel.org
X-Gm-Message-State: APuU4Z+wgn+EaQCqLoSra54/jIewscSOA+iEhGf9UMTmJpAhu1YIdh3D
	xX5fsWRG1Kb207D9UR+EYdz88CyX98Kpp+3Czzs2vtOaHpmLthCSz8iY8Cqw+68iHzSUHZYwl1i
	T71GOASymd0jabxGVz+L/NuD7g811Ey+xosf131K8i4a7zfzU9945/GRGyqJxtOKs
X-Gm-Gg: AYBFou0RcGpNg9NWYhFy9jYQ/8AUarfsoHuF4hx0RianE2CG3LFFxBW1EmSno2YzAfJ
	jmCOW141yzqkgQWM69FOepqSatGSlCs9g8Oegze7+pBUw92MT8vJpPjGpo6usRWnwWWaQzcnB+7
	ElDsFr/ACovtQOA51LG9YHm2q1/0iSrXyfUXAby9+onTGAxnYMzY65HUEKuIqA0ICw4mYIrNVOk
	XsKsgpL1s8uba+RN6nHZkHmo2d5V70Nf3oegmroKtBP9IlgqElrNMCQaQBtjwaJMLuuFXbzDTYo
	WSrRMfjZflarP3Ed4Yyi6ZHMNW8QW/l5kvD9bFq0zgSpJ3VRhXbK9SdjdrHvsbGYrffhvXHmJXc
	fnRk9OF/IOenNL5PuaAxPjy8OubzVCeOOo4tMparXJzNMpPisl2+Bi8es0+vl3cGVV6Yz3KH+1Y
	/jCQRC/kFz0Ybftoikc8Oyrcpu32fYaXFxkP1ojei+
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr78978291cf.18.1794655933518;
        Sat, 14 Nov 2026 03:32:13 -0800 (PST)
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr78977961cf.18.1794655933007;
        Sat, 14 Nov 2026 03:32:13 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:12 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:33 +0800
Subject: [PATCH v7 16/23] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-16-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=2166;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ZjpIL59WVpDn2zuhTRFHiQbumlAhh6tSXd8R3gIf0As=;
 b=hqMmOgnhfauqkwhUk2lv+qrc/2o12LH4x6v3Jcd5C6MQx+NF/ugLG+9jQALC6LqjrjvqK4+NB
 SxlmJRyJgwdClYSPI9vbmm5M7ig+CXxAVrRS03QARqIcN2Qv5oNmuc1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: yw5Q3PhdQE75_E97AI4ZwaKkJNIuDgXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyfSAyNwdOmgJ
 lxi3/1ev0N3VBWYpk4IHNM1kuw4CW8NbCy/Bh5m5uw1pxH46WxCbhWIybNfeWQPo0On1xerYrcL
 SM2JU0pJWB6KDjmkoS4FEtrI13A77sG4adk9UavAEjYZ9AO91+U6PnP7Vp/MHp5AJTcDlt3/PMp
 FrqWwb1QVJHGqznrcKiwoWxYSK0Mc/jUcnc1fMqTgwgea5HdseDEsAV9s1ayfxCcfHxECqtCFqu
 6KOmFjzMRqMIjrqjToAAnkp/Hw42t2WJ7sHxJWkN816QInKw7cB/fK6jK44JoA853jHk4KE/4xo
 pxIqo0INWK2/S1kstgVq9XsCnTv60rxm37q3aIXEWe7g2Uaf8W+T0YvdSUnvci93OJ/ZDl/U3mK
 JDrQAsesWJNBPv8cUhiQpXthWyWl5uYQndwZbr0s4sA9LB1smlGZJgv3q69WtutEzXxlxVM3Ym2
 /g87giDhVrl7caSLN5Q==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af846be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZY3ACuDlzNLtHqm84dYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: yw5Q3PhdQE75_E97AI4ZwaKkJNIuDgXz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX8jgu045heD4k
 OAMGcOrBNzHUFJYIp7LflvoeGe0fqbqP81n2ggV712a5Mt5/V/qAtB4K3HHzU5RgEKb07VPfZU7
 0qcS1yGe4l5VuzJwodbfHJvNek0sdps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Define pinctrl definitions to enable camera master clocks on SM8750.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index b1fe1c2f5ae9c5b6107729fbdf31c2577ee3ebd3..522d2c0c374cba48de1420be5357db65864bd3cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4386,6 +4386,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_aon_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_aon_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1

