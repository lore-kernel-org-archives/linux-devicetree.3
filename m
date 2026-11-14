Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618827;
	b=vv1Vc+pcEYCvFpxf44BIYG0qpPDllBXKm0O0W+Lw7MuzISBDPqRm1xo79mr8/FIQAAxl
	 S4968F8k/CDuDnvrgBZAOJAvXkU5Ls6cs70lI8UytcliyVaxUht/pRZmqO8A3iRNsGfMl
	 5fdhyFdj+hW3D0SNd1z4EnUi370H96lDVPUDC3QzdaqkwyFzH/IFPrAn3LR6yq3Q/TXdq
	 oaWKGD7RNgdtAQMLZBSGmDWgFpSq5O1FMEqLESG2a7AhVurcCOYuHbVW0lcQ+2dbq4sRq
	 JDVia7ae+fxodD9G9Jgq0Vg0PVVJmnchDLtGF8xquU+WqZQtINlaevO46k/4YTIj4Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
	b=h+CpKzWWE0Eu1j/LVllHSsJ4tP9mSR91q38ccuQAiVv7MtFS76qOMxpFPVqs58X0DV20
	 ORT6tDCirRamxJOBbKptFLpmpT9TvgysLHRHjyIplcGBuDG/+qeZGqptbq5a+1hZV1XHy
	 GIPJcJycjLOIso1IQ65bAUGxO2ch2Y1ckhyZUuOdZiFlCHW8ApfRSB/l031QHuxsQ6OBr
	 o4ZA8lBLTxvNj7z4GbnqHNlCFwm4klbzd6brXtfkxwS4F8NgDxub/My1t3vhgPODrEY9S
	 lyHo4T8lbonfSaBtGphVA5/Umn0fha/t7wHz6/z7UoDG09yv+f9xhwNujxfY2rHcsOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfRvvy5u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvdAK76H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2A606A887
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF2A606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfRvvy5u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvdAK76H
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE0Jhqh482821
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=; b=MfRvvy5udeIsF5tF
	3WfsknUOJgROwcaqYZ51gTUfVRF83ZzENP1SQTu6QIT9mGbLrkAmwXK6t/NYiio4
	ukkxq1JemCuhMkKbsa/SkdLwZ2BbPI6Zlogo0OmnoU5m9tAES69AxTDHRSGmfMlU
	SFF9p/sNS/pa+CL/p+uGeggwPTBWa2COxe3EwEMsL7B6QFCaherap9tJpou278m7
	1Jz0iyfbWmsJGX1BDDyithUyT7ClYjVnr8p6IPj4akP6sY5o+QAYFdryP1jLTMsd
	ThK4a7PM3uFGQzevfeW39Pm4hf0fMdaNk/yVfgRlnNhyDoiw+ph51o7qSVd7MA05
	qNtSzA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nr4j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2292485eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618824; x=1795223624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
        b=FvdAK76HKgoeTYLnVt7dx8KPiGUOQHYDP3CtAB068J+VpYo4yG2wMXlYEQ5xgwZayw
         m2Lbmn+99p1ekOtrq9OnVf7+2XlB6ZSSIVujSVXIkHAp+KCERK5/1D6Nsenh6MJBCOU+
         SbmYisF5aEagWZqGAMMGAUEb4vBQ7EsQB9Yh/LUHCO39PTNOXERgAgiOiUaCFl06TZsU
         yYL9OP2evl1nlM/m0tTwNbfLpC/WUH+ZQf4WoGe6wVHjyM4hajb4fgYDGGhM1uuGgsFc
         SNmo9+cY6QBdkvzsKiNt/9gdN1AqVSQ3ESBWQyxUE1bxeBLoQGHC9CIk0OrBqVSy9xVw
         pudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618824; x=1795223624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6QGHTbiKt0tsTxI6/Psf/ZbSXE1UseAZPqz6tlA+5g=;
        b=cKU2u3AIa7cBY6cXwJl8o0T8UtDnX72B/qT9iocozCF/FuzmWkLr3rNrHBMoKCGExT
         xPmDff00EH2kEqq3RIcM1emitJottrsjwr6imov36Pz7RFkfqOsO5FU5Gt5u7Nu6zFOx
         QfDTuaV5cgUMPDJS46oQzBYfzM+SqEXk2G45nLgV+wnTTVmtZ3PURPZt8DWhnzdGrSFL
         zz1ljyeAlkJ5xItatxeXkSpXZsn4PhO3L6uAzHl/3NeDqnbjX3LZ/vOibXxWPFVvLFd2
         VfvNoU4TcjgRTLmhARYJd6kXFM5RiTgdNPdzxtbkZEjOjXUApwlw9ZzLbM6nua9E4VwZ
         eaHw==
X-Forwarded-Encrypted: i=1; AL+hErFnTFhgzKyoh2IE7nYBmXYxGCtlrpp9BszT9xbhEKADzK1QZE4ATdbyAaff2z8Kb0RCEzfTps0QAhw0@vger.kernel.org
X-Gm-Message-State: APuU4Z+zDzDfsamZ/WjP0gn1q/URJvdXfOwaN1g54ICrKkrtGT5aIJ6q
	j3r8Fv/QDGTAudP3U9nLiG3BRocHAN3BjpK1HJ9s4QyaKEPeLXFL9R5aUSOUFKuzgHH9xKxWKm9
	lySe9L2nTn+t0HkWo9UfEv9vaUrBELSZaDRMIRxYrI1/C4OjbfOii3up2LDzUx3oE
X-Gm-Gg: AYBFou0ChPFK23G7xBNwxMJqJoCjMo77MUkHcuiRgposehYMrhUZhjl5YdlthtuUCsS
	0ljq+A+nk5+73ixvtmpyyIF1gCttAhtaJb15nHvYNeLJe5Ql/3Aqr8WgkXIwawb7CLaTIyO3j3y
	xpIe+pehb/z003woW7TCLxzld1KClrUO4o2yJ8b6dzQi3DostI5DcKJXp7nWeSHzf7AlpSD2N04
	8VyKS2FQD7CHZGO84klojsiAXwRl0PWYE6WMQ3n+kEOERz9m8BTlLIRHCzDzbHBhhpPyZMaaxg4
	Xy8qOc5hl5gAMJys93YQBWrDWbiRfiy1PmYtCNuU8gm+BdL2hkCtzKRyQAZ/UVijw1O3fB+vZbV
	NzYzTdfMxm/iPSI9a2QHQTTvh51dD7yCRNDp2DcqaaItHItpxKZLcA9wl7+Ajj2pHjZXDOy2Qwf
	QotvNWwQ4p
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr4045030eec.22.1794618824302;
        Fri, 13 Nov 2026 17:13:44 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr4044989eec.22.1794618823719;
        Fri, 13 Nov 2026 17:13:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:43 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:07 +0530
Subject: [PATCH v3 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to
 list qcs8300 first
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
Message-Id: <20261114-monaco_ep-v3-5-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1159;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zxS+46LvOuCqUZH6dROCss3FjAJ8EeURbIsga0w8/po=;
 b=zeu8POxTeEy82lD3VDgyQeiFY8IKN64oRX80O3Y4i+snxRCjKrU/EhOKhbIdETTKyhc7/Pz/V
 eJJ8oasipa7BNp0mxpXuIuLdaxZb7jk+NbLrDWPqjuna8HiTcKgWz4L
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX0X4lQlsiWbOE
 Q+kWGUs6Aid6qYZ0+RO4118v7QNmNCrdPYdW4bXygz+5RDS8io2/yZ8sRk9tsRahHpXsD3FhfX7
 /D7+s9OQaH6LGxyQwOCTLPqsHTjschg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX3LNHvtwSmk8u
 e1vK5V9FkpMv61hFr1ClDV22jJPr8eABuJ+GhM67AEvKg24Wpfs2sIagN4d2SoypaKJjfHppLwO
 eFQ9TOexDgx62z0Z0L4djk67HB1YBOrjirgi+HIvcX02V/BEGUCSYjq/6got8A4AIaAUDYA8zOE
 TySjJjGPTpe0nQDWorE8dnz8z2u0VBTvIiEiCSDm9ijdn3jyhFC4BkyBspcR3nybrFNteSdoco0
 jZ2Z75izyjKvSdNgz6/E3rnQEy8lO2dG1/e74mWe0zwoOwb3XQ3RVUGjz75nrpAqC9Rxc8kniGK
 kGnUWruogXzr5KjKRr1GozA6o8axsaaTvg9Fdk5uRdqeeCeIuvSoHlkVlPuIr/dWVlbiU/tJAWX
 u/QaeF3gVFNmjbl1kp3TsshrC0aQXPKEXX56W82tjd0Tda8Opla+ZkK3pfRoJ+/1pJa3XvNn+8c
 1trhA+FFuI3RfqSdsIQ==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7b5c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Rdy93yBZ3C331YjIzl_ySMdXbX5RCEVx
X-Proofpoint-GUID: Rdy93yBZ3C331YjIzl_ySMdXbX5RCEVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140004

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..f27f0953ab9e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2598,7 +2598,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

