Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897308;
	b=AbL8Z2JFGA1uxz+GIS+JuHMLvXJiMAaT3nnIkbK/Yk/y5q5s/rat7LNe70zJRvIvpNER
	 Upg9olPNuF4GamfVZ5U7NS7wVYDDxH3S84PpmYjUvcAp8YMnnpzuoWvMLZZrzrNgonJOo
	 czvWu9RYHO/zaRkuEDTqteNn5m/Cjp1aJ7HQeSjs/r+23LgcMLJOm2scTUQ0cEnseUzmW
	 zn6Sybd8EiO9Su8rwoZMd3tChPu+Lov9HNR4htWVJte1KycVpPOuKUNNdV/wVdsIHL+zy
	 UgZ4MaQ0x+7wScSa4fzxetzJ7mLEifF//zprlaKoIuDiHe47y8agxzP6fWxN2XLp4Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
	b=T0LjfdvhAzkIUhGu/SX4W0w0Mg10R7d+vHL4HKA9AdgeHAQAxxUgy9jkquoNBT8YbxY5
	 OquCpPxHA1Om9Z+e3L7mnrnZsu4DR87MyZJAohGRCCCmTHTulS4IVr042CZP+oyjkSXSS
	 D405BDDrSeQNTL2G5or2E8/lmKLkMyySU/NhSqejyD7JHnPGym9XuD8je44LlaG0CKfOr
	 2TroPmTt/QPwuFKcljKvX8eXostj5PCbnYfE0QhrJaJZkZ82+ydUozR2r4c1PSAXWdSmf
	 3cawiqoOlRaCZt1pesqGRKgnvbipTOR0hsKe/ygxpF6zIieutntcYPREwdRX/BmMZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2KWypeg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4AJjMBg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058C606A335
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1058C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2KWypeg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4AJjMBg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53GJc3458198
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=; b=I2KWypegpIKX/zlI
	wA4fFaO1UuO5Wf0TGwyU1U/k4JH/x8x/N8BqZu7TA4bZbRGJuWkJE11FTTTtT83j
	npX4Q1lryah+GI3BJODIxaOlwbxqNz6Fu55bcPzeKOlm6lzdDbn+r+HkShXF3o2F
	A96RqTL5bT75/sGhXV00GOfafhXlLrLecNKRvOyK268ZIlv6d/07yVTgbyduxWHQ
	NMbn3PdZED3FrwLPb0nixfQmrx6YAZygN79yg1iUdfl+CU/qw0afsEwRAMkY3ey3
	CqT9fcFUDwDZosvRddG+a+hu/hQAoE7GzrkRvqeIJSHkrltWLiBWemtzj/OKBUOk
	j1AQkA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh89nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:35:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2482796a12.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897306; x=1795502106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
        b=D4AJjMBgBB6SSobpVhX6bUzvJWyXdEWEdszmfRIE93v8YTdRTjEA1xKAEsggCXUXtY
         Q0sk2rnCXLOouNlO9L3s0QdwzI7rBF7Uj7MnGXo9Jqd0lLsdPCFvXOb4yvIvcu+FqJFu
         U1vISL+JWOcDufscFpWyhUQGR74sQhoP7i6FY45m/MwnSSUdsAZxCBFqUHpWh1QyIL2R
         Yj/KQjB6sYySBRcCTglx0rW0yoPce5ORusC8jdxZGeaDbSiSDYaO8tQAhwis+Dn2r7/G
         rsOFhAqKjcWNMpwn/WBv1/wEikP5FsfK0Mz5yOZDLSOeIB36l8cx2CQPHrVZYaT9iiM7
         q2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897306; x=1795502106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
        b=ur9lRiwDCVzFv+Ozci0vTxMxSs8shCSENlwgaRSy7T89Hv7AToga+T8CQZtGNLej6p
         6ppwJwdlak2cACM5Ux2qD4DxQApKjlSomPgljzybk0X3dK8fyK3o0e3u1bIdrlfB40aZ
         hEQJGynha+oHddhwQFRRRwmcv64S9jF2t+9Zani+hAknWEmijqhcOpVpGkfD3YGiz6ib
         /F4BOMoWjlmAYYeIIJGRN7npiqd8c6SqWKUJ457/y3vP6ek+PBAXNWxB+EtL78QIHqOv
         ndjHwCtPJWy7bjkuVKwwX6GwMHkuETvhJUGyf2CRU3GmFNPeOLbHBlHMfdeWMsax7NFL
         Q4Mw==
X-Forwarded-Encrypted: i=1; AL+hErHas3/LsSV4kJlFjPVQPphV+qcUNsO2uFN7NwFcp5MS830Cz6DrycDz0sDzbcRANzXt9IoYHLGpf/o1@vger.kernel.org
X-Gm-Message-State: APuU4Z8N1i7uQOZ0A2s7o7vsA1Es7eSyzC/YN+dbrpQ4pEAixz41JnUe
	s0UATc123AjWZRMjsyl6gtIPzDpQ7zuqiBRH4+RIHvRvA6vGUwD+vdduGBYIOdDv3qWpeBGkIKh
	iIRW3yOZ5sr4Ji1QYPLPEpVfDJt322oqjc2sNqDYWHj1ywUSuK7XHzYsVDWPMPVSL
X-Gm-Gg: AYBFou0spuVxTIWhafPobVbrNo7tPex0AdbMQCNR1NRsSpHkm436/T1sHw0Nc/CHg+Q
	KmTRB7MT5FYdkV+vzHW0rkSzmdwrvefPfNt6txvPDF0TNgJn27lqnkO2ZqyFD5lonLpMOrM49x7
	8SGrF/+ysgJ/8XHkRAc904z6O25Z2mbYex64ElySgE019GxZTSZDbOVxafU5SfS+gyUtJ8xiTtF
	PMksSxOPrtlPuzwicYi7V8iKhrO4URMWrekw/KCS+ENHVFvNfQVW0R/0JEeWkpJZU4ETPoPpnq0
	u2uttWNnpwzLqxCKbg4JfS+npibRoHUALt1vjqGX2HOKh38RRuDrANQjmqDhkn8G7veMR9dUsSb
	mtFpqOXo0BMpfm9W0VWZtP6mHtjQZmQOFCbYI9m5KjyfqHyjkAfKuaHLSCcKy2KAcGS/HWdNinD
	6cFxwv7JqTasuXGHUChzGndROOYvXfwPRWLkv3gMJ2OwqDqbiS
X-Received: by 2002:a05:6a20:9149:b0:3fa:cfec:227d with SMTP id adf61e73a8af0-3facfec31a0mr6338078637.57.1794897305637;
        Mon, 16 Nov 2026 22:35:05 -0800 (PST)
X-Received: by 2002:a05:6a20:9149:b0:3fa:cfec:227d with SMTP id adf61e73a8af0-3facfec31a0mr6338065637.57.1794897305193;
        Mon, 16 Nov 2026 22:35:05 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:35:04 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:34 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
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
Message-Id: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=834;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ghIyBjSSA206L5G45TbC9GZYxrWFbBzZFE2qCT1QgA4=;
 b=tXqNmKvAQiAY3laS0Mr4X1rW77yW1NwKCGBoUtiDeM4e0ryc+Z92bIRvJc3uOa/NYOZeFQIi1
 xRT9/DQkbXvAtcGSmlsVcaKcg2UqZXU84lCxESmMjmWKZQxsjGibyS8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: iPh1v9t4_juKw0ojAPUjXJ9xZcN0ln7g
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbf59a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8ycGgHVmDalfDplNnMAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: iPh1v9t4_juKw0ojAPUjXJ9xZcN0ln7g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXw9hOVse21MWO
 H9Z3bIW1DHn7CEa3LbHKEI/PZNMTVrLx74MXqr2uTG4tcgs7SlWBo+/ntx1XlFtKXaFI5EiET/p
 BN/CnCxgRHBfiVBc6MxMlQoB9OMCcRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX8OsxH/Qdg9Xi
 7u4jcex/I7BBoenshq2d+BwayetDIhl9df0equv6ZN0py9ET8sUpigmNVVzv81JXUFZcUkB1Bqu
 W4L2u9RKcv9DNZw3s8/Hrhk5BF2fQAp1xQbRMbU1qbyDQMFdqx8839Zp3h5yhDv5JidSwGO/oRe
 ckxL0RpeAwN48idyuCnUmo8W46YdsMl2iRzBbnlAnjhvNOfxrcbSVFahnhtSwxmQ15T4quGw0dO
 V4nRXvhlZARAe6e0wRagR2Vwnyr3j9iPWVIZj6RV3MT0fVRL0T1TDjjHdVFlTaz54cYhdKJ10G5
 zUcZO993WX28/jL6o4vO+7dWWQj2xdDNCqJVBsosji4Q3FRU4HTWSWzvDD9yaHZ+csuxzsQpsKM
 sTPsYdIwDkiYHWYi8Wu90RSsXrnEIHPoMBMlwJzf3blbR8Z3t8Q9nfecocWDWx3RJ5vSWTLuABb
 rRo51pA4hhyFBAouunA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

The Eliza EVK includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d455278f2ae9a3da60b02448e4fdf..b8e8c67c70b0318a7d24da8ec4031267605c0200 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -209,6 +209,10 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;

-- 
2.43.0

