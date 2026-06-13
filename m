Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43EF3C1991
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338202; cv=none; b=BHj3gC50KO7Eh5gYJ1u1pjUM3PNd5Gl+l04jIVtBok7YfM0LkMbzn5Lpe7+AkN0NpXTsITif5BjjEdcgQz28B4yhzsJ/8frNBlDu9g7V1U9d7hM7y6PyZMmTKJbO3L/SP3W6jjxOYFrL1azFncYom54PKtB1+TjJvPLrRTUy7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338202; c=relaxed/simple;
	bh=tQPHD9UJKS4V71UqeFoVB3YIRyBT8mZHaek/CsebTt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPtlY++JXPDAHKAb77ITLntZO8JuZbZl4EnxElG/X8Fwmi97mDKRK1hOOaDSOOM0QyUc5+U2GuErVnHV2o5f7k/0Q3Fa9li2auhc2Qb0Hs/N01yYafn69nHIf6Y+S1S2dXKz33CNOz3H/skLpiBL90CxJqhD9b+Wcmai2HMYmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MT+xyZl9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jc8JriO9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MT+xyZl9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jc8JriO9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6fVeT1728457
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tro/SuIT+usV65tjAioArgwoi8LfhCNRSF7TsCmTtVk=; b=MT+xyZl9wbMWYTH4
	w3z0Xg8sypH+dGeNZWJKT+Hw8Rgr4vfy5Ip/con0dxzOTrJH/sAYVy25uaDsGPnu
	xD/YyMwqqxsFVWOir97bJY1UBKeDhOMQiEWfnmEs5jNnm09X+g5dvPWksMnQmZa9
	8cR6AiKT8pksH8ndjvYxmdAH3GQhAiJTEf8/TIyyYACygGsNF1BCA4nGPG5Ew+VM
	kNI/x7pIm2KGq/9ZmVmbCmjImVcLMET2+al+SxVuoGsfMVpi8mnA6945pEPeuyL0
	k6yurgbe8IG7MJQ4iexOVFcQJInUBABBt9mBRXhDBDBHq32hvlJIu6LM4PdIku0Z
	4WXljA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f8hey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:10:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84256bee9a9so1183775b3a.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338199; x=1781942999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tro/SuIT+usV65tjAioArgwoi8LfhCNRSF7TsCmTtVk=;
        b=jc8JriO9Pnj8J7CcTNVw2vaNZ7Qv6Ku+bk1kc/0o/5zDZYqB5qEttxC8otXe0QwE6N
         jB6FJ3HExo9TVeQ/vpuMs72cDIyT1m02Hb1Yzt+yPjCCqubFFn2L5O3hh/VAXlFWy4Uw
         gtNye5RSx/6VE0FlBkq2m1yFx6ICDQO4J3BBzHE6TPbxIKHR1Tg23aRWkJsyL5vr6swm
         k8Tsk3yU5g1RjbKZfj54O9hpvSDWPufurD6KX9MoNjjo9PZ2BxoZR5rMglcQ1f6dPHgX
         FtFgDco1lQhDmH86KVCfIIZELSfVKH/8QohsgB/HAS1CEFJGdnMKky/34y+czSK0hOyi
         OtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338199; x=1781942999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tro/SuIT+usV65tjAioArgwoi8LfhCNRSF7TsCmTtVk=;
        b=TMIgZRgsjFILq42TpDcw4sOvnknJ+NMPoYv71gDNDrsUHcdeB15NtStRxbPzgEdX1x
         gGCGc7D7Vf3yv9yfEXMTdHDp/w1Trs/KiKY16aKQoFpyfcs40FDUKI7o8L2lwgb0okHM
         xwGShyqYS49MsXl1YD+YKJ9hk3pFxHGkynoMBLq1kxvmOq/VTup3E6IQZe+H8QZNq8TV
         PSRYmkGQqjlbg6RMxlmGhTi79/9tRfvxyvgG1uByWuqjINwQOvRwq53ij2I5FDxReMxN
         qqrc7PqiBJqlhU0VW+2eZzBp3rCOK//HwfQvdgbUCB/DXtuJAD9JYsrUWI8F+SVIL0lq
         P8SQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sve2cAyCM+6l3FSjVGa1CIzOT1cneWz22xhY7uWq/+1HQLpra1OZtnKeW/vmXKPmcTu6peNGQzSVH@vger.kernel.org
X-Gm-Message-State: AOJu0YytkkWUX0gEDVeCnwSbJu2L4TIqlt/TdK+tA0X0tLPasrtCFxTh
	gXXbG7dmjAvjaU7CGjE9KaGzoqWAnSm1y/Hw71msSGBfpah9NtoP7434b/vzIXMYBL4VwdIX5hg
	ZP6+VqYq8CS8/7Db8xMN4/69hBut9irHHjnpGCCgAEF0w5DKHpOj2nSWJoQekKXMj
X-Gm-Gg: Acq92OGV5BuWHGLLmYceZ7rOh2eA86UC7stWSn76BynNG0mXJ1QdlOjChmuLO0dSjWB
	IiUOVwBs2ttbO52DdsE3r7cZDeo4c2+ucPc0xpuSaOzu3wm7N+KcE1FmrFhXVOUBSyUQWA+S+zx
	2WrDZJ3QOjzB4GIgYhfRXNYmvpa1aTFpw5PVNMytguICaO4oISbfBLpT1F+hhgLp29W6CJZlZHd
	e+BRAbnBxbQuapBVZN/fy9rGGZsOdEGOxhqKmfXs+fuAl5Igc9K2jZVvUmztqnxWr+b4cGDigzv
	fdn8EGIF0WEpNmxY1nuW8/COXvjp+gEZTNWzGHwa/bBoWOx3PM4N+S8IJCH2WqI+q6DrZmDEo6k
	hamaDk7bz3hYebE/FAF5q+K4nKoTgkfk6AUm0N4D3
X-Received: by 2002:a05:6a00:9285:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-844e19879d5mr3257917b3a.17.1781338199499;
        Sat, 13 Jun 2026 01:09:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:9285:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-844e19879d5mr3257885b3a.17.1781338199079;
        Sat, 13 Jun 2026 01:09:59 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:09:57 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:21 +0530
Subject: [PATCH 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-1-57d5e6c7f47d@oss.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
In-Reply-To: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=2551;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=tQPHD9UJKS4V71UqeFoVB3YIRyBT8mZHaek/CsebTt8=;
 b=kQdl3OJpRzKqDBNd00jFpWkYOIOqPqdSiIdAgGQkiYzoOxxF8eqG4damGmghyNcuJwPrp/dcG
 OqMoVC28LjEC75yXPkviOQEyD7+4Laqe45bM7iQvWdFhHgINVfZplq1
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX30mYfh5mNwHI
 FTObaaAdDHGCwW3jtgU1xodr9bTQJ+DxwFrWA6DWbOv8EczM08AHB+SA106mioo4zKtOni5rmVS
 f4n+3ND/nqcVF/nIXMic7AashNAHDwNWvAcwKlmKhkAJkNzmg8UsZQ3DP024Lj7SB2g6QpiBCwT
 YIPwP1ZvjnuhojsLF9HWZGyRqtoCy89ruwGJHKI7NT2KXZ+Ij3reom7YjI3wRTQWYLDUpbRXErz
 afrvVnOL3xpDk3YArODIGWlwKhSQHQazmA2XDD2ewvdvkT2DGwW54GrmGYa3UgPYgUFgDbc68+6
 T9vmKk/cRF6q4gHUhA8RcyfeZJwReMy52hVUnobkGP4QQri/6YnW5OJkPpuecn56WzNs4gOS5fQ
 FbcKYZmCqBDNeESIPZU2z1DJTFwDkYsaSnouPeLmXBHxgHiplMp6u5WXcZ4f0Ely34IcVidCh8K
 Cqtvlrgaix+IBvToxVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX7k4rKJOgVzBm
 hHqoohMjAbK4C2hSA2S1oCZ25LMdanBqH2oIPpcO/7M5/P1q/kzmudXBidQky+25b17IG/FXg4m
 oWt4MSllApPTFkcDlVhS9BAgmwJbFuU=
X-Proofpoint-GUID: 6M0EmZVmXdOMonhSIxgisNre08RWOFrB
X-Proofpoint-ORIG-GUID: 6M0EmZVmXdOMonhSIxgisNre08RWOFrB
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d1058 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pVylo6aZF31Nrf24llsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da..7113504d5941 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -65,6 +65,83 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+			status = "disabled";
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0

