Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463576;
	b=qX+LATbcM8EFeFMfo79trWfDIimWyYh5HDtL/j0+CbYu5a9rY2bz7ndMTn2VlOnt0iQ3
	 aDA0xEbQLAhbRHJmU3eOszDXF2rUZRPjtswroghMXUmWk56RR3jKs2AxF1BCbA7gBLlDX
	 5wMDBqeQMJMBrC+51szYRtrsH5QygZIJgxa0LXzIcjYi8IA9Vhxufv0HNktOArl7kKWVx
	 FXIPwH26BfuNmovOgpTX2i4h5zIQab7VxLWsELtkjRBUg3DQf/QkPmL59xWYVUtjVXjbu
	 RQQcKpf0hYFkEIaanDfiRR+pQDJXw0GZPowc+QRlfHTqyEIbiqWjtGOOxa8Z/h0l0tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
	b=1wXYgYWO+QBQH4/jUVHeqYWVoVUm1GfTk+Bwq4ngzh8HIzTX8kauNu5i81XPU/IE36m4
	 3+YRuULGNFiiJXpEuahYiXUR8MBF+BdeY5e57UFcaDI9UHMbL4daOT9kI1LRN/wQ2/dgx
	 acUgWzdOixTVTlylbqnBKiH2ou2rzN2u1/qJ9RwW7z1pWr9jE5Ck9tzFmZiXST6jDr1Hi
	 XzLibuBAcYqF0egg37GLGsUt9j3jES89unE+UTIzNDjhsgEOXESYZphKAXgnA962gD7Y0
	 1EIai39uJMzj+40th5BBfaJSO0D10KEof4RPx4OOyAUMqC0X9+lYj1r8ukXDyB+BEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Y0hE/zS8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647C606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1647C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0hE/zS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH45I3475300
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=; b=Y0hE/zS81YmcykKG
	Ecx7laIbm0Hzc+GkteZPg8CAdeAGeIjeZGQU48SH2sird9V3JAO/iFfkwoCUTVoJ
	ZVi5+y6FzW5bFIjuu++7tSfyGdhekHYdXAcIG+2YLz3hoiAkU3sxbxbwF4LXshGb
	vNLB5AFID6gDFqP4WY5cUG5OCgZdveos6bv4aXOO6YMNMBQA4PjtBkDs15bGO3BN
	akrCYrB79oU/0eLleq1UD76CjvGxhlmQ16hBlJvyr8Z7CcNVqJrDBGMMo7JXwqH7
	W7rbNxoe6G50pzt5w1fRbLAJ8QtqYe4856foBuEFI9l2iJpcUtqlAbaP03zl5Pcx
	1FV1ZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tuyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so1965939eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463574; x=1796068374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=a+p2zF5JtQFLdHMI8jOzvdShY4shu+kItzg/zAcqC/LI6swQaqMkUdwPPxgkJURXip
         JevgGuQq9EkEybxmx3eOp1yxtn1hzXV4RPTixwSbRKueWS4BhkPotrxteuz39b3sqbT1
         on1egO5aBvBWjKRhbS+9NNQWd2a0PYH7YBdU1HZbnBqtgFhcEWJZku9wHJpKXpxjAocd
         fy+TaU8Czy7pGr23G3n/RHtzgT333voY86WR9IHilbePBBuV7vu6oWyrTMmNZoYvKeS2
         etZL69TAVtHMOk719w9WoSvNq9WoVkRoTRWwkPRkn/jBs1NBKuw8Y87HNLRf+Gg40A5z
         7OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463574; x=1796068374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=ID0lu9MOX0sl2S+rtZF02dhlbU9io2ahYiGHu0vaa/SPCgAt1hE7CmZBXqnAw6AX7X
         L0Jc+W/LRnqrZmVg+5QVC+kfCTLGqwOo2ilbh5/mXdTHu2Zi4FnBnEGABUYHEa6szw5M
         zjxmPf7AuxnBl02ysxz1Vf0acT81jXmHSwkaEzpcZAhMrG13qVF6q9+03tQzaTKj+AHu
         KyAVNEdt1DLOYbl+Ym9ZOZiOH1xHnTR/URT5HrVRm6niaP1v/FK8Wj97CFAVUKGEnb2Y
         jEBPtATwlGz2HWkJMQuj5XW8vE5VDP5EgTezCdAo4QxedDhcPjUoX2vEXLQXawVeui42
         JkzA==
X-Forwarded-Encrypted: i=1; AL+hErHPJ9J5eTuPePhPF/31wJHm4PUBCng6fRjrygXMUYADGBV2gkdoAZ+chRIqoQcQ42sS6N8yat3aExlt@vger.kernel.org
X-Gm-Message-State: APuU4Z/gAqFOOSHUvWeAPCcACbSjy+1RIdpoNfcKqNz0mLjTLu3VRS+S
	GwInxe1PQA78HN0jHS9haM1Txz2awpW2S7ZNNn9uOyYR3qzyl8PanuB8VJ2A4TrBKA/vx9t9dcv
	PEdND8KrvvvqG+EPLIz16s43Zts30g0unC8b9N3qE0M7v2ZAnGEC1vL8lZM9ICpzi
X-Gm-Gg: AZFdTZene3pkGf5BrHrl02cP0xcaU+Su8NJz/0ZwfoecGMBSTX+UskvLyeaM7JZiiCs
	esKJMczhuUBJtdDQpS0ldheM6NT3+6qs1oz+BHXCJX2JB/tvFguePNSUfYbgOoDzCBQB+zyNMPs
	F3hN3PvJcjNJc7Kud1fGuwJGQJBTLLaiHPsDZ2xBQf8Wx9dwMsR2HfnXs2ToBiIg3RAiLlIliT+
	YHRx9Dr88dP1s0Fn0HpEKVrOEYsXfcFT7VWd9mJ9C+IiWfDa9nf1eRigSPgI/a5CzE9i3x56Ab4
	Vz2h8oHbIllTyd/IIc4aYOte7AGYRzyBw8eifVF1TTHMIkN7XNaa9HX/6KEU5rkJGYbcAoXYX94
	/ImWU0ePO9f2mBDWh6+eR32GzPW+4LHr+/KjXQewj4nuMQ42WTcnnXhYs/vPu5nY1xwi7usqr9g
	==
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405169eec.41.1795463574038;
        Mon, 23 Nov 2026 11:52:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405145eec.41.1795463573559;
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:41 +0530
Subject: [PATCH v3 10/10] arm64: dts: qcom: shikra: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b049997 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tsJniCoxF0iYytplHVkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX1H8NQ8R/S865
 0XZ/eLiEpJlYgiCoD4YJ3iBPqyPGPz/k5OcxuqEsYHi40BOHejK+Fcd6ZFjC4oFPoC4Id3rlLBc
 lpbjzCmllt5uAYqfWinpnBuO1fOSK1mKTB+Ne+xie4EUcuVHwyftujuvja2dTQofDLpISCb9f5t
 KEklVuiQToGvilSAMzb0uBDW08K8TEwHqgTS4r1ZqXCpYGyjiJhiJjIb5AsUN+XwOZG6LFEFILw
 2hGM6fOpgO1YDcyFb0BoWAkKs4d6WfFquzH/TFxI2c8nTO5oyGXsawRZsyMPQ4bs29ysJAAKl8m
 +SmFtdnTyHsztELnhzCUvkN1ApQWF8x0/SGIK1ZMzlQC5dc2qPJcQzQSW44y375yNaHFwl5l7ZC
 g4KeAl669BWCSuKLlsrYeRfunlpBQ6r1ccUt5dExlHGliy/dRH6AZWEZz8LE8Cj009GK4xT/Un7
 ErJz6yUrVIozTwXUmTw==
X-Proofpoint-GUID: 4WgyE0NxH2W0F7aJL_6IfW2CaOG9Xe0o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX1NmpaH2qKw1j
 g82LML3AsFuBP1FU5/9f9QVHmMX5NLk/ptd1CSX2zqsOlU6Oe7mHZCwDvGdFRePntfEn+QUCS0k
 Hdp4mYe4q5/7osNQYFMAsBC7QF/D0dc=
X-Proofpoint-ORIG-GUID: 4WgyE0NxH2W0F7aJL_6IfW2CaOG9Xe0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for Shikra.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio87. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..a5079b82f22f518fd9e858303292bb7ab874e1b9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -992,6 +992,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio87";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		pmu@c91000 {
@@ -1303,6 +1310,20 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		gp_mn: clock-controller@4713000 {
+			compatible = "qcom,shikra-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x04713000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

