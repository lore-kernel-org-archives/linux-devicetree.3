Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783295;
	b=S0Vm50QM9n4LIDYnf/I64c11zf0+fsMcZjF0xU0i+dCDry7B9VYZSDUbsjf4ze300/3Q
	 0ElJB0J1MLRM3SwP1ATnVzjw+NkR5azyfQ2MpkYL0kQOWXqQ6Yon3Mxez6UxnOmEpstub
	 s2y3NJQK6kSL3GBkA+WWpZ/MMymHgnJF/dk5li1IteJuDDc1ykTScuyvC5NfgQZHUuRe3
	 bIFSCfa0zbaOlbQU9aJ8kC0mjER6jWK/OcXHO/uT+AqsqYFuAGFUReOswsmoxviJd2kn8
	 e6G56kTIUMu89a43n6U9xNzpm3K4po9vhrUi84pUjOWM7oYJZt6QMAb2bJQknnzq+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=;
	b=YTRr9TLAY119w/2SCWmfHY7YCBfhIoe2lromc0lSkW8MKzQbZTQmfGRwx7k88DHB55A4
	 riWiav30AAOt6SWyG3S0ap1E/kR9Dz4MBnBc1EeF0i6m2ysW0rHBO8TWN+EPjSVXkA0dD
	 9FCd0170Zu7WT6lBEI50g2kCKKqav98A61aCIZrxEL7l/c+JFVNx7PCcM+LXCnWcijX9T
	 MUQT85GNAS2yyGyXm2yG7cPg54l2YgwKCFJw14ZrNYl4x8YGQGBKkKssPy3/Qby8MnJkW
	 0ADXg7HVb+gafSFycoi4AhP2NqeFheGdXUBGAkHvrQY7HrOxlDcHyaCAYM7QxQv1qIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=azrTao7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfmQbyhb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27126606D827
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27126606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=azrTao7o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfmQbyhb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kkg01229324
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=; b=azrTao7olxA7+GjR
	xpXQPcYyKjMCkK2tCnHggxTZbWEne5HBM9kbEcX6wKOBAv++dkyb9HGY1RlPFAnJ
	G0SRXl8DGDCwy7hE7xiDvjbKIR+3x7POzADp+Gm0vzNOA9PDx5GrUv7vis5YQAkF
	m0fThlpfkcVoULDAaf28nT+tBJbLKa0SwLEt/DY0pvaneBgQEABz0USxKg9LVtL8
	9wuHMeRxQ1xC08kRdQxT+nBLN2shdWgMzzqI96fUzWm3te8/MbVtOosf0OjhZMaP
	quRQaPCCR5ivrGEED2wluhYSEY6NvDBGdAEdN0mOz29Qmpc+nqGRWogdkqpgviMz
	mytwnQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njyx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:08:13 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-7150e6da546so264453eaf.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783292; x=1794388092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=;
        b=jfmQbyhbaWyqeKvLozywIo0yxmOCSBRHsBOjs+pM8ROZocRxU9o7XFwxjtq/cDHI6o
         cpbOM8SkfbHYJR3W+X25IXXnapLAtEdKDbSHAJMnABBn9uFYripCMc/MSDMFaYpjWsec
         D68eb7+w/VL5CtiqZz/eckhQ3nW1VknIg5Eeunqt2LXrKeUIW5ZZrfjxs3i9eRhTuAW1
         5OR1+4xubvmoerICKI5V+JQjTRoyLdfj+LiEp65kwm4Zb6r6r76YGqd7zByvR8EZ1+05
         0q5kW/5KPd18+KLja9f07rky17C/FiqpcPhWAMDp+nyc83KW0MBullr9Jaj4y1RmSeqH
         hanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783292; x=1794388092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=;
        b=iUfHLnOCj65esGdPsSVah6xaPI3O+7dKPdihEK/G7+syeD6lvtrYFpX0DcaD0AqwQU
         1jYdePQDmBpwDC/frPS/mg7Sna976mmPFzEQ2P8MGxZsgmUzfbrKvKkes0XehapEuKZU
         sE5BJY1be1YAJBDYVma6tilm+dphbpwIDLL1YAciWbtGZKFNHjljLiOlk8U/4smocllL
         4xAviRi/t65n5z+/bA3oPbevxUHb4mkk8Q0A5TC3lz5/Ft3uJU4wkcfCYfYCsyumi3M/
         5C1j3oTgl0cDNchnqLfaRMfpUFor7a2olzZAg9jEj/0CGE2rAghCx5g7qerNC9cT6z5v
         TD3w==
X-Forwarded-Encrypted: i=1; AKwUvBx2Xt51y7wPH904Ub/nFOItwReeBMQjvu2IfyAV96htFePVvt+NYRWmP21BGOXIxlAiN/BUZs6bHXPA@vger.kernel.org
X-Gm-Message-State: APuU4Z95fIyU0i/pz7zK7EM6J1p3F7HR3Q8SrZiSQRusbrOjL+81IDgN
	d8HosMUQ989l28ZO1fv2gJhn1++xbTuILIdl0k2mQWm0Y9eo32Zkgsg2H2K51ZC1iVE8Ah6GEg7
	nTcAOOMqImRpEY2tWYsf+evvpzMKztm1tuYrSXBCdKBGkYib4cUbQo5PUhOC+E6Nw
X-Gm-Gg: AYBFou1Dy6rjYUpFAjD2Xx+A0i+etK4pO1v+SyPheDycfp1BQ1nSY4rB4TaAyt4CUfa
	3VxG0XrWyRZ8jKGpbDMPSJ7In0eBF+QyOTfxeEM95ztMZOjm0lon2lVnx0WWZyTX0K6QcpnvJai
	DDtXnKKp8iYC7ZdAlfA3ZuliDIhDallwH7OCkcs807Q3waMw2aWrhIau2bE06np6U7L5BujwohN
	PcQ/DuUZThI1x3cIrSZDfE/N48Sk+8nlz/VpRk+UH333AVjSYJJ5/DHqoSKDmUqtiUuBDc3Z9Pf
	qFB+51ChBB6v4GpyWRu0Q8Q3YSR6rmQAyHmlM8nrX7hW8FdB/EWa+74N6LcleMK8vibQhos3Xnl
	oeI3NKSE1EeCu9XkvMP2qK9tZekcejOpwEsu8rPbyi/NncQDM2vDnw7ydhlAmtQR/VBpj6xVMgs
	f4txGFBL3vlW1GnS53gSA=
X-Received: by 2002:a05:6820:a659:10b0:6ff:fcf5:40ed with SMTP id 006d021491bc7-714f2a97a1emr5707649eaf.90.1793783292348;
        Wed, 04 Nov 2026 01:08:12 -0800 (PST)
X-Received: by 2002:a05:6820:a659:10b0:6ff:fcf5:40ed with SMTP id 006d021491bc7-714f2a97a1emr5707641eaf.90.1793783291852;
        Wed, 04 Nov 2026 01:08:11 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:11 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:02 -0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
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
Message-Id: <20261104-phyrefgen_1104-v4-3-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=7726;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=qgl8m3HOTa+QKekvRBjrXG44N7rhEqII/ZPBl4OthEE=;
 b=c7nizw2jNJVMBhxWO8a9hYKoa0M0fVb3PYvKBeppGCcvdwtTqB63xV5Hfr+NTKSpZHqa6M5OL
 8uHatRLOxcTAxI7f3xbvCMYEFbdl/jKUtQjkaYVj9FVjus6OuUf34SE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX79AERIBXO0HT
 e8J4f1WbFaHnwQ96NuMC2F/Viw9LUiQBWGhFl6ftuVL07GXyNaNHpoqceb89uI9ACehjm+oV7R0
 VSNx1bN2OcF7iAYcmS0QbDth20knvYaoIUUNn2tHewYTpYXrPcnq+puuQ16BND34EBHkClxI1D5
 qaksEV5R4l92F7/9coTCfXQsmpShhzjLxTTyncSrtNyhEtAw5POyStQHZfZGg+MpoXkbd7XrBx7
 S6X4UWMQO+q2UiArd4ajmgnBSzuH8GXCAMynAwP5wWDsKkSj6yMP+d/vRkm/03G/KCT6ziRPpTY
 wwszY1zN6eysR5tWztcBxcM3tbDDvCHUmJIeimxy/YUtnwoDXjHXT33VwfPQeFlmkJFN0dvW91A
 WLJiRn5TLe7knRCXW69a34StOI0gczhlQ7AVGcNbnYmM9rgXcDB1aAg+Jej9dW5MAGjqyz0nA1d
 Rt04EvM7I0tjnQ7S2SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX1alzNPGwjwWB
 77FmB0sIt/IARTM3uwQgTiL/nEbzQoWEIR267RmjjwOVs7xNesEJwUs6nElUCoJhVmllCyaYZbm
 +KPgESgStU7S24/o4U7FMDyHKigeT9o=
X-Proofpoint-GUID: ghSiQyyVxhRYEA6C3ggSo7NCmHPpPiyq
X-Proofpoint-ORIG-GUID: ghSiQyyVxhRYEA6C3ggSo7NCmHPpPiyq
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeaf5fd cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hooUR3UheFJlRPkIXLkA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
REFGEN, which in turn is powered by two LDOs.

Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
vdda-refgen1p2 supplies for each PCIe PHY node.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts    | 2 ++
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                         | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts           | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts           | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                          | 6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                           | 2 ++
 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts | 6 ++++++
 8 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..d1746845a609 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -735,6 +735,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c1>;
 	vdda-pll-supply = <&vreg_l4f1>;
+	vdda-refgen0p9-supply = <&vreg_l1c1>;
+	vdda-refgen1p2-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..bf3c828c8a0b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -818,6 +818,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -843,6 +845,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4c_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4c_e0>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..b3f876956e7e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -764,6 +764,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -800,6 +802,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -821,6 +825,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
index 096d40e49210..7f79470ec004 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -545,6 +545,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p91>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -581,6 +583,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..130946ba9785 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -743,6 +743,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -779,6 +781,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4h_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0>;
 
 	status = "okay";
 };
@@ -800,6 +804,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f26bdc1cd84a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -448,6 +448,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -484,6 +486,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -505,6 +509,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..45c95543fff8 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -23,6 +23,8 @@ / {
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 };
 
 &tcsr {
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..ac7e1382166d 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -813,6 +813,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -850,6 +852,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -872,6 +876,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };

-- 
2.34.1

