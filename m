Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463514;
	b=lOLk02HdYY2CAINTkHFZVIoxbUmXtaZy2rIvvFRZpDCVBqzMaEvdbyUxhOYMBGw8z8lA
	 fEtx9PSqtzawfgDE08QExzbewUS4Z+6etjvlLnmZtaRO0Uk5yNJ6U+PD3tkYYZ2itOU8+
	 PFqS0Qbo8diMI/4Uum3QJSflCx046H3C0+6tjzen4ERnMeqz2Za/Mk07TDrDp63wKdEoD
	 B1U1pUXqKt1NMRe9ll7k/HeeqGVxlW0OWa0I53Ot4vH7ENmtVa4YFo40LgBJCp869nzam
	 xTDjdYRFSvjql8wz1CESgULW1UypT/jJN8k49OvAMLDN4SWQLmMpTPPlyMIHpLXyCjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
	b=ze9a99euSTd0vqyzjYLwh9MX8RgjHhSu9wcE4m94/udPyFuGAKD5tc24tKm0qCdtVl5x
	 W32cbtx6Wpm0bTJkpadzGlneG0Leqtv0eziTslDHxSCZY60wBRWwewgWkctDsF+wS+Vgg
	 hAFr4k03xG3YUxXKGPAF8XP+LWwUaRWQTmPZpzTTnXU7Qhnxi4bwRpRrQR8XX3xAmnPxT
	 HZ1DU5t16gzADrk1Eq+mkXXd580LvdAq3uA05HeYEgXqt7X9rCrfB/7hQ/im6+d3wOQIq
	 WqZOndWv6gWa0faTgp28uoV89LA/NDpf4Sq0XoxASeJC0lY81aI1js/1sgh4+6FoOPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CFC606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGv7Q2340294
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=; b=ldjygAZVjoaJIO6l
	Pj9FQlPlZK+MQHQ5WIvAp5lEGd34j5yXImG0EVV/lBFvQb8XTlHhve7qihg6MFKl
	mmC8wBuHegfJImDQYbzvZzhBbGPPPBPoMKDpqH71DOJxmwtHZjyojXLbD/wTCPsU
	BkFHhVrxup6jROy1QCckwDcmFtks4GX4VUwPOPfHXAGyheLPlXHDQ7OeTsUd39P8
	vR8yB9Yg3zzy+DADR2Klm/jX+DtgkIfTvMS5Tgen5+RopPHLjDmS6/pINpTpW3mA
	O7Y8v+TLL0ZOp1hjdIohAI59NjrE5cUrYnzpJ0KrQ7SymlXKG5zlHJfLQnN7FJwn
	TdxvLA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3cqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:51:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5164083eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463512; x=1796068312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=B+Pju7+5iG2yB7Gd/O+tkt2ycQff37Qs+miV6J+2bjmE+9t/JgR58KRHlu7huxeaXL
         v71bTsLdq4g43DtUdqxF199HKwsoTfy9e+nfzysp0k7xnq9vVgGBNlUXEiRFEC5ap9Ba
         vj3/2wGgcSInKOIgxLacGa9i3WfngV6M0DD5fgw/M29eN8GBm4HnmLJk+N7opPQStxZd
         C60zEBDcdOMtTq14koTnHqR3BqYfVxRDEmF5/BeOqxUniBjUX+VbCSwRclMn4yRKGx3/
         IxGOgMSHCBf4cI5SLtRcD1I9uQHBnjm39z/BIITF2og3UFHNHszbjW1KO+5x0vbDxZUK
         qMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463512; x=1796068312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=GZWA5i6sdvOUqCOdNk9G9aan7KcaBnisDU8LX4SAaobJrlabD4wnFZv/bO0yCnUFBy
         FxeBC+VYh0reUCHbjZnWokEyjW8gYqcUzh8e6j7RTbgIe46yFPaFIUoezv2Hary0jdxE
         WphHj4L3X4B0Bjt0D0nCmJkxZ1GS1KjL8ncJnwkcfx2pabqGu23FPRkK9o9Hy9Q7LKt6
         zZdDfnXjZmIkrTxoNm3V5RMQDG12pZ4oPYvzt1VaQ/YWfSocPMKvLe3RiMdwPNVIkg3E
         tpRjvmD+9290CH+JljN8qZeMXU52LGSKXWFy6lxYZLFsy7L+E0csa0cJgcvM1o0/Ymsa
         1ZAA==
X-Forwarded-Encrypted: i=1; AL+hErFDm/ji0+OvNkfr1CwLTGwLTAYUTUwhHMFrBMqqY9xFqjuOYIoSe07bHrbo49UwWNgLY+tY58GSkFrL@vger.kernel.org
X-Gm-Message-State: APuU4Z9wUuUDof+OvatZMgMFYyh6If8FapuHZ0z/Ict4Oc7JfwDHYWF3
	9DGe0Kt9sybuwUsEao+1H/Jk/qaQYVuR7DT0nN8hWw1PNJXeee0KyoVG/3JwtWDRq4aLCLDGtsZ
	kPmnswdqCOg+NMwKT6f5dcHz2lqNCGP7bw3MtftcWUiiBZvV0+8ZcvMGw15FrLvqm
X-Gm-Gg: AZFdTZc/DDFYghRENz3sx1UqWwLfTEN4nsL/P+appy2nA2jsItN0/PRU/06sa1aqU29
	Op8qkmHSTUW4mHFWiEqdDNae8aAEIgqyDqNT3H15w4OJ5b0og1RV8xaI0D7dhsnS9NNdw/yIB+p
	QXg9f2pTH5F11JesLY3sUsG5S02nBFkOpwuHTuGQiatwMGXRF97Q/oPPgxS8FURCloRZc3O/LDF
	hNdqlDe7J4zBdUslonK0Ilp9SgypsNJLrlRPzP/xsG6FU989qH2mMj5iAca2hz8L7TVCF/0pMas
	cHGXvLCEdGx/jfqkgKRV6gIbdEjOMVOqWFa1W0Xd7sfxxjvmZMzinftSqsj+TsEuDfGhhUw10g4
	WZssa/X3jUimmRLoun8wTh+XHaqomSZBABSLrL7ASnweyPZ4DTLSOE3NrKEFv6ulZtPcFC1ge7A
	==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653989eec.38.1795463512098;
        Mon, 23 Nov 2026 11:51:52 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653956eec.38.1795463511427;
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:32 +0530
Subject: [PATCH v3 01/10] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-1-98db26a87500@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b049958 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: jLCDFitMnRCNAa3_lmL5hGt_KobwBiPi
X-Proofpoint-GUID: jLCDFitMnRCNAa3_lmL5hGt_KobwBiPi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX+KclCzlBedGZ
 WxPyo2/5w+RGSf8N0O3y6QlWUoB9iKcIsVqDvjYgrPbEyDNnqeuDJS29S9+JxfRNeHWaE8ik/VI
 URkCatUShnxQjAZk4iyRjh11y6YqMuA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX/+zoX77UtshK
 8aG482I3enOEUzZMD9Jda3sWGbv0heb7IwryIAwkUyioMxj17ZydIomHwrw9mpC47ogeOVF8M/G
 YBzw9WTFLM/moQ7gX73QAhdl78LmJf20zzDEt6Ei2LPZsMw/tAsHW57RVZugv7xlK2lLy9aeXpz
 N+7ZGaGVeRtk/jKvK0q7uRRBmNu/aHoh2HdCnmDu+Tj5f73/7z3PAWlvG7NOEmXEhMMlWFpM+/V
 vnlPFWUpdg7ZfT2LKZoh2H2cV9cR414gtP1A+s17nzg9/IrWtzgD1sms07y4qsA33mlNsaWcntt
 LD9o7YcbqYr3W/NwpvsurBnKUMBAzFzcVdLGFN0/TFjMyFMU0YzpJgyHY9efrecMd6sT0QN62N+
 ECq01Z3DMZ5HpXG6UZoxLVfNFVysPxI2ECg/Kx4OfFxr/xVTZhsQSiuQ8nJZAEK8iHr1t+ucQIQ
 YWAyt2hzbuIKVPW/6CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc7280-gp-mnd.yaml         | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..76fecc6f7cb376770bfec06f3e1fcafcd480286a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-gp-mnd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Peripheral Web's PDM GP_MN clock divider receives an input clock
+  (TCXO4) with frequency Fin and generates an output clock with
+  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
+  and routed over a gpio pin.
+
+  The divider is configured using three registers:
+
+  - GP_MN_CLK_MDIV: holds the M value.
+  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
+  - GP_MN_CLK_DUTY: holds the D value.
+
+  For every N input clock cycles the GP_MN produces M output clock
+  cycles. D is the number of native clock cycles in which the GP_MN
+  output is low, counted over 2^13 native clock cycles.
+
+  Hardware constraints:
+
+    M <= 511
+    N <= 8191
+    N > 2 * M
+    M < D < (N - M)
+    M and N must be coprime (no common divisor)
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sc7280-gp-mnd
+      - items:
+          - enum:
+              - qcom,qcs615-gp-mnd
+              - qcom,qcs8300-gp-mnd
+              - qcom,sa8775p-gp-mnd
+              - qcom,shikra-gp-mnd
+              - qcom,sm8750-gp-mnd
+          - const: qcom,sc7280-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: |
+          PDM XO4 source clock. It is derived from the 19.2 MHz TCXO by an
+          integer divider of 1 to 16 programmed on the parent clock (for
+          example via assigned-clock-rates), giving supported input rates
+          from 19200000 Hz (divide by 1) down to 1200000 Hz (divide by 16).
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm
+      - const: ahb
+
+  '#clock-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    clock-controller@88d3000 {
+        compatible = "qcom,sc7280-gp-mnd";
+        reg = <0x88d3000 0x1000>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm", "ahb";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "default";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1

