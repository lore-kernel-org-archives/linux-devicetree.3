Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972850;
	b=dAZDfFM9KBi25xYv/MiBIkzytHyHvUr+DL0y5IutI6G0leBOd+WudNM/F+XktbbOQzvL
	 Uwhq/w0IJy0UXbBe8CnT6qnBUP+tuEgmQy3UyO4dXk9ww4L5B2fJt34s5UlnCt5Wi8Fvo
	 ItKt8PQ53SVgS4tNL3XgNfZVf1p86MbaX6Q8ZCZy2IN/buYN1I1pQUxcbb6uGS6rRSXWe
	 ZktDz4hNyD7ouUKwBEnwV/uDTomYDqvB7zENpGDYZ945+7gLkbwHV/Eqb4LJdzyokEAMn
	 j8AT5lHu0Bf1TQ9e8UqPttMKlmG0rf/AMruR19Bdm9/hZWHcsWUZW/dtsHeca+fdMwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=;
	b=qGMtvzw2vvHaaI12Ztja8kEQQrTpplqT9JbxMO0/CeWMiac+IlcWsT4eIaDrcNDKcWvF
	 4V7XtnIIwis6D5IKrLVL6WSXo89s3gyDtIR8cZDVQ4uMq/Yug3t83ygm1r6eKgEUT2AfW
	 1Y/vyBiM1jt4mpgN7scBq41KiZSfwlHvYQyPjJ0lNVUylGa9Hm6ekkLNZFdatF6cVnnv6
	 niWWAZ3MathHo2XQ31vVF0CgeQdXr7uGH1h8szYK5HA/JYxsAArA+ILRtF6XKprXDbyUT
	 ojWHLYrxnQz2zfZPGk5Twp/ykKPGYxS4jLCOelDc8AoX+O6HjPL7cP9oHuzBm2OzekA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0WSWoOZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rp8mvja2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C1606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E8C1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0WSWoOZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rp8mvja2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2WAb04060197
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=; b=E0WSWoOZiDdU2oHo
	zmguQ30j7hS1+N9upFxm1T5cPMW4eiGWmbeWL8dnwsXUmDcE3IggVa2WW5ZsoOpy
	7QdzFbJ0wtlp4WirDevPc0pmBMJk5XTFRKhDAIdNYUjRgYCXCg0gK5RvKybXNqdb
	yZzTrysTGSlzv6YCn0G8hwDbSmXnT0kX+6m6mfAHjnXUI1+PKM3otBSOLSBgh2jE
	8ilh7FsHeWnDFdF72yG9XmcU6ctF6JpPtskBSkAnMl0zx1BpfUw0NMvT2kQeJEB7
	hkYufFBg5OI0J3NNjpoGZLdOoJYommwM9nDawW/0AlMo1P3fdqzFHYt6HH0VT0Os
	OZIExA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvch14c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so430082b3a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972848; x=1795577648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=;
        b=Rp8mvja2rlA/Koy+gdkT/z0tGJhRBwy2vgcZe/FIAMcCPNZBSPcEnD0FM0K5HIoKZI
         P0UGX68N9/ZvuFRcUSEjAkUbAn8DLpj4X7xWPbyE+aZHobQV7FUBXugan+q/8f1McCV4
         WPere++8ELsVEwyh8LuMlEp/LFpDk7iTa35DwQ4l9VOrkWOqjaYpwyadXd8YV7XueX1g
         +1iabloZDGK4ywvi29P4fA4goOkWtbpCW2HaS8zz3sKWGL3ldl3A2LO7KQWKO9HxERnw
         HXIdg1Oz6a+24kHgt149CDk1jWhhS/xMGQtYcTksW5cf/P3yN1BJXjHp1chK0d/ZL2c8
         3jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972848; x=1795577648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=;
        b=2O2jZ07n2YBwDmQScvUhcjjG0zOI21avN26CCfzt+lSQSdnHprJwc2mCts5gQB0/hf
         BqjsBcbv3FHhIPKWG9X05MHpdvJmILvj9xqPZqTBVHgXgTHo7BQMd7c6LIalJAUnEivw
         kZwnyviTi2Vg/nmJUBIKv9P2p7lqKK/h3D/mdovpoxtexoYafWoXoZ94zI9V1W7uNvml
         jwZDogHa+G6hNcSU+ZeSgGMShPByZQtlbqR9/1/gQR+GuS2TJNCUKodHaA8t0dHLHr5o
         Hv9rwYB734YyTajWkWvc49Rim+AoIU69Kwu6Vllx9cXk9b4d9czIdNoj1KnwYwWDLgsx
         5Tzg==
X-Forwarded-Encrypted: i=1; AL+hErF7sns5/Hda41ei2MlPk7mVFTkCjlmcsY2i34PLtTft+rOGcekH5QuIMYFvsNqsK+wiR1MdThVJLASq@vger.kernel.org
X-Gm-Message-State: APuU4Z+SKp3aTgOuQ2m73OLidSAoCJKKnSbahHQva4QRt41MbY1xfehJ
	Em16P9lLnzxBLQ9kx9aRWj9rV1tC+/3U8GwdFpnxiyhUf6fsd4B8ZrKDgD4tPsP2hpXyQp60Tio
	azNynrxC43Vm2pzGu5fpfy14xaAEjFHX/Y2kJ/WnZuFvS+9bBoeubedVXY9OZdLts
X-Gm-Gg: AYBFou1mlgDe9RCzqmUIgQpYrMf8gHl1AQtDwKRS9Z5AsoI7mchefX6cdP8bYjMsotO
	FFZssD8LNTz9vMxdvQkq7fNZi8m4Jcc5G6x80dxLkq1AATE5ylYWGZRqO9S1tjOHm10k3rt9/Yh
	fpf7zbRQy29YnhK6TmOTR7ARLQi5KRyCskJuyv8L2P0GLMewLwmX0t5migTfsNp956dMBC6bbik
	svXfkmSHkt5Rg4hAUDzuw/QEqx7W9smp6ywepYpGpnczrnw+AJN/gBhK3ZaKitDndJJ3W90PjOA
	9xLE+2114PpLIQ6fBfHocQTgKIDCR5LF3/uPgUb1twtG3omKdGjzu0QdqJA/dskFfZZcr2Dx98P
	8nAyB9Ikvh3ZFq8L/+JGi0yYlzOe4fOy4F+JgVVneeYZvtTAgrdl6P0QN/e3KFLFeYxLXdsAHWs
	atfjdFDe8IbHlQBC91Acw4d4gGNpw3llRusFHJcLFIgA==
X-Received: by 2002:a05:6300:8047:b0:3f9:cc40:dcb with SMTP id adf61e73a8af0-3fe976e289emr1143372637.33.1794972847538;
        Tue, 17 Nov 2026 19:34:07 -0800 (PST)
X-Received: by 2002:a05:6300:8047:b0:3f9:cc40:dcb with SMTP id adf61e73a8af0-3fe976e289emr1143360637.33.1794972847086;
        Tue, 17 Nov 2026 19:34:07 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c5327088sm431644b3a.0.2026.11.17.19.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:34:06 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:33:13 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
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
Message-Id: <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794972840; l=3154;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=F7C8yp4JXV4KgVwupVwrdLaOcWGGIIXBIwTgj3wUJsg=;
 b=gPdqGaiQp8jwTt4Lk7qnT7YhfGr6ahCIhFyYKVJibkPcPIq4ovglwu89UZzuY1TV44tRxqwPo
 wSTJ7Gpj7vGAiWdDhoKBcMXFo00tCFhp397G1ZSZfXOBJ8Ktc8JFXG3
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1cb1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Bcg_z5J1CQXIQLTfTnsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: UQU5UhL9NFUdl1EVBTnvB1eTrXl2NlZ-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX9xjyw82dam21
 fzTs9Dl8PSjeiNlYdU6Q/jXhBlu5grZPg5gRcbk0zs1o7RzSEoVOGkT7XG3ZaDcw7mCOPpkIu2r
 mffNN1Zh8ZJeQ0XA6mabyTFoTuinwRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX8RE5ma7VRvqk
 MHKLm03kW0xdBP/b060LbMSD9iFh0eGM3lwfPVI53JaaTvY6eHsfSAn53u6JuOhwVvXteljoLcI
 DgfgDkimeivWXD8mm9X47JOmaqzVl8btW8/cLX7FN1QIWJsDIx0pBpCKQJG/0EU7BmAOdpvkuAx
 SULagbFHopfyvGYKX9mJJH6gXvGBTWzNx7jbN+4wuNyvXzq6XY6ca/C5XiBzmTcjH7CyFqPYjvI
 bU2uns1wzSeBKNRtdofFilPNWP4vk2mHRFx3o4Fqg3fNzk2US+qfCNT6NY3+a0xK5nF+qbkL4HP
 xsQ6pbXHdf5NqiF75y21B2hM5waY5hSQG3srnO+sKBobV8KTMyk8NVb4GXFhc4uQqS1oMkO3UHd
 SeCiERTzmcDgWYaVumflxdkudI9Vg/zjvO9nM/fa7v7bj5FAjeFxDZrrST8XFcVB0nrVdvxmTDB
 1OvxMT2KNJPuCSzvZfA==
X-Proofpoint-ORIG-GUID: UQU5UhL9NFUdl1EVBTnvB1eTrXl2NlZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

Enable WCN785x Wi-Fi on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e0..a3c2016eb9053 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s1j_0p8>;
+		vddio-supply = <&vreg_l2d_1p8>;
+		vddio1p2-supply = <&vreg_l4g_1p2>;
+		vddaon-supply = <&vreg_s9d_1p0>;
+		vdddig-supply = <&vreg_s3c_1p2>;
+		vddrfa1p2-supply = <&vreg_s9d_1p0>;
+		vddrfa1p8-supply = <&vreg_s7g_1p2>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -757,6 +814,21 @@ &pcie0_phy {
 &pcie_port0 {
 	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie1 {
@@ -800,6 +872,16 @@ led-1 {
 };
 
 &pmh0104_c_e0_gpios {
+	wlan_en: wlan-en-state {
+		pins = "gpio7";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+
 	sd_card_eldo_en: sd-card-eldo-en-state {
 		pins = "gpio5";
 		function = "normal";
@@ -906,6 +988,12 @@ &tlmm {
 			       <119 2>,	/* SoCCP */
 			       <144 2>,	/* CXM UART */
 			       <211 1>; /* NFC Secure IO */
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart7 {

-- 
2.34.1

