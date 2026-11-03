Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702165;
	b=OPxf8VQDTlvIX4MyLKeg2qzhhgaaysoCepBIDdXFSCnbuYnl0NUvPtP6ZIJdAI53U5ND
	 6u9aeg+2DXZ81GRPOEkvK+z3QTIKwso/aKMJkmtzf42uvgeWr5UQoMIPQXFGH1tXVGLLz
	 0dG0/ttphOfpn+sNpjLVXxvN0tTrnLm50fANhCqhGMhkYBAKfF6fDuVjHzOnXSAs5SrKk
	 +TbvbU0qTxiHnisKTxVbOyNC4ssy41pNfalKIH/cKt0jd4/WVb8EgClMwjQ6Wawbuc+nT
	 KwqjdxI9HHWuPbltiiMjS8jrHWWEtlONh2FDCXCIxliJnfZnPc+R/JyM+kjZiIXLG9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NAX0Zdv6X7idA1sDG56dXYCZVHe69B4hO8bLwUy2jqI=;
	b=R1O/i6Fbg9Kou2H7d1AHNWJPhJwXlohEwXdwBlxBiYssPuobUZRJp9fWst24g+zhJiKx
	 yil74W1HljFaAz5UtnFQXMwKm3qT0vuPMBY4eoyiFXB1uBIeO8E1rbzopGhTnlQWwl6Mf
	 6TkvDv0ExKy2onXZizFKRRJNmzA3wKEY0f8gAk5sfq52VtI8VgS13s5oFNzbWaIrgh4PN
	 GD9i93nEuDK4FR6v/HzuOHBskiEejjGdRXJ2LFO8pJRIrBoIUyKMkN9KnGCHlj2hVEzL2
	 6r/3BeVxYH3QAoUjH+nkI7CvWmiTdG+yes0PwZJNcyL1vqcZVk0zJqPCAXKHo/wKLDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8GJAOvd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyM5mDHQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59A606FAE3
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC59A606FAE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8GJAOvd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyM5mDHQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAN1s2554885
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 10:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAX0Zdv6X7idA1sDG56dXYCZVHe69B4hO8bLwUy2jqI=; b=l8GJAOvdYSWANG61
	KFH5BYtuW/gMKo1oVLJh1lkmvGgFHImxPvahJ8Cnn9LAUOLEIJAmXGxd4g+40UjQ
	yOySMIjXXKu638gxtG8Rn53C/+ejBl0k94ilFzAZ6SaDg9u5whVRmyz6RVQhL5oP
	zWDSic80K20FV2HhCJmKe4YlRW5jasdkLgSgmkCDw8Qq0IyF1/vH+et8dVXjLn49
	uQgkun4f27wQPwac57YG2vIhiP9S8kW/KwdgrNNEALa8MwMwbyPLMEUG50Q1S770
	1vMfdPffjzl4rcQOvwnVxEUfQ0oMgh9hjOKweZ3KFXiXQ6A3aofQocjrszERKJic
	DNxmjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjq3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:36:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so685472685a.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 02:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702163; x=1794306963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAX0Zdv6X7idA1sDG56dXYCZVHe69B4hO8bLwUy2jqI=;
        b=hyM5mDHQDXq/yPCXHPf3selkvUw9OtCUhvyTPCNmjTA+Ev6A6px8+7QWXqP7HY52Yt
         IHL24ZsS9sXmeLZb/015tyKIfOPrIuXpp7MUUCkoK6c74wTUTC65YcGUeKB4O/1BjX8l
         BEB34JGS8RHaO2NWf1iSxrBpx3Ta7/7a4lfEY8jZaRBahbqK4YKYm7OlvhcatRk7X+gL
         uK5A7LfuMV88iu+XFgLVt4Of/b/usiAcHZ1tcbg1x2oaolQG9xxsIQf87mf8/dhKj78q
         U6SmQ787CmV04WDcbNAfcLk9CcSPGmZ1ggaJoqaK1wure7AG+xnfO4CGwh0sRCPqqOXv
         cFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702163; x=1794306963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAX0Zdv6X7idA1sDG56dXYCZVHe69B4hO8bLwUy2jqI=;
        b=XZlQd71c7ZHU7nYhv75ltykINncQWhDLXoEdsaKEzHm4mYXmPEHyaSIoyagbFOA3XJ
         M+X4kbtUdb2lxZmgVWkQvVSVmXtAp6i5ywjkqEd/3dGINQazp3i9SOF29KVcNUewT4es
         IInLfOjYmyji7ZqUZhDkb6hkYHg1wBhwBKJcFbMN+8nsGXRr9iIDtbz9vfnbkaDuugUC
         Q0EvvXAkN3saHCcsXLuDzJi7Gu1szAWTejVPGuF9RWCdlWEYujOqm9/4ok0PR86yt27g
         f3HuusY+60/Ce7fX6D2IzRin20MXxOdiQJ+KIyNNtLZ26W20Rfjz12WnV6ArD/AFxumZ
         gsNA==
X-Forwarded-Encrypted: i=1; AKwUvBwy40xgyI+u4yLoKQA2xLY4WAML1p04ntMXOjkBOl/vnoMaTcECKVA8/+krEbn52LGb/aP6wSl3Gyi1@vger.kernel.org
X-Gm-Message-State: APuU4Z8cc2NYYbcYGuQ9opJ6xyxmwbFNKAojRslKE43zQuQe2A7HaLH/
	pAJOJaeqv2G+iJTsPVSZx1dOT2tATQnHu4BMpgHch2QW9PzFRUOkk55i83M5CV+e2scUtYAIEPP
	3+HLi4oIvCULWdNeprABUhhL/BcFHEAxVSq5hnevamnqPnXBVWd0uP7UgOqxzg0Fn
X-Gm-Gg: AYBFou3ajUl53PDN0xb+EHd1jDwtzP+5CTuvzIdSk0TftYbsnXH32Iq2MoYOYgJZmrn
	AZ3MccaiikxJ2KWhQXxX6rFu+SL/8yonIImTwVJ1Q8TS7u23rKldWhsjbD7mPScrreChqr8IbKx
	TkRSppwXdVmsK/fs1R67zIE4NCbKAExm7maxJDdEXiHF4v1A/CiEbdDjoNYHpBpUrFWlCb0EoSp
	X8yl7bIki4Q7usqwIeWF1KeJwNIQMnyX53FI7iAyol/NgGlrPAlLuoV6pnm8sqHbJxrxTe62KUV
	eENwq2rv22aJVH72ZqrOhUDWAQvCJ/X2bOQQhhmDgEjhnd36XZnCgID1gYR+jM7ZhWOKlludeGd
	RfaAD2gZ1UkF+wOBvHUW1S81Jlnh5wKgHddkebwGMJcOnUIjpcEsIC7zL4V82pmfo1gsCWw7QaJ
	IneA==
X-Received: by 2002:a05:620a:6f9a:10b0:944:2e2e:69cc with SMTP id af79cd13be357-9442e2e8f14mr1161859685a.49.1793702163265;
        Tue, 03 Nov 2026 02:36:03 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:10b0:944:2e2e:69cc with SMTP id af79cd13be357-9442e2e8f14mr1161857685a.49.1793702162852;
        Tue, 03 Nov 2026 02:36:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm55210015e9.1.2026.11.03.02.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:36:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:35:52 +0100
Subject: [PATCH v18 1/2] dt-bindings: phy: document the serdes PHY on
 sa8255p
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
Message-Id: <20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com>
References: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7YxsTW1rQPzMR96mXCD/od/qi/Dp8V9XKpVt8QO0Fwc=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGrpuQ6izRS9/QwpMWmIpO9IF860Byh2IKGUVdeTxAMyMXCje
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJq6bkOAAoJEAWdLsv/NoTDJS4QAJFs
 GuOKXIVpGw5xUeC4yp231kylt7+wzeoKEgKC/IFjyDYhIA7E7cO9fHVj4quvesg79OcR/wh192H
 cUnPGbAxbxnJy0D+W4Iv8tzTd6cPfs8r1ySgaQW1B1uvUsn52R41q+fO/FaNNa8Ckpxv/qWGnAw
 t9suybSTi6C7pLgyvXBlMopEQ0TzBvw82jkzdHpQFXqj/9DFP9naudm8R7E++LKEDfGkJC7eOqj
 lYTyPfq4bTxJkaUthsvzQDi0A90G/eDdkWeq3QiaPheWFJBA0YRKAzmvbnCqwdYqLdbdIlvY6/f
 8EoM7POlfjWcw1pZkoA7dSQMvU4qenIf3m+BDu9utDkNmheLSKJNF2njrscVv/jFi4L2iLRFFFU
 nXAz26NdKNUiLvZKNfX8gt53PXmoFGI3Uqn/k5X0vq2RyZJTHzsRb/uTFCft/07up/XqnaYBYhe
 643td5QJR2GZlZvxImJUfPpHAOkuuqRLh21WawqUh03QTO1TKRUzBxI7gHHplvMivurvK0OxTRJ
 j5lPrjVRy1GNZ/I2S4DUL0Yjw/ZtYNLlMmwyGwHduwQRpa5ueHxk9Ax/XmmSmUC5C6kfLbSUJmz
 jdlcldByKNatvN/8Pv2a6H6k5g2Dw/DD3e69ipXq6/tNJsMmJq12yi1/YjGHe5+hI3bw4T86Nbs
 fkUoS
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9b913 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXx87vKxpPhJ8w
 Hil5yzkG9xQK6B9OhfUl8hp0Av2JCwZeoyV0Uwr2Jnq5bQj2Ae2wS9WTRcjK2RcBwMGfvBOilHB
 QXw4B3EB6bP2A9sCfldpAQ+GnkmOV3vL2MdJEPtnbQsvYQU5U0Ek5iSVUU5Ihx3Ysp75qcl44Pe
 ftwhfR5N1cXiyjdSexvFIj3zZhqXwl92P+jI9PENmgJhhdYtBckbErsdf+s6+Jgh65dgvVM0lio
 lyEBltChe1SFWH568gvvaXPGZj0Ubs7n9CKKjDL18IlWbbdGEzmUr0VyI9sUK4bPNslPWgAFLol
 MzqfOZC0MPoR4hUYUD5kV6mlCxn9TKgo83Tv9dwDwsdrP04zxDSaYUT+I3zO0/YvcoQT1nMmo3u
 gku4Mos0OCpzehjBmkcxsx5uldtHBPchZMB/p0s5ROBiyN93ZsIdkdLh/k8iZHBGqCmDTJG8sks
 c6qAHcB9ZLYZdq8Wqdg==
X-Proofpoint-GUID: FPkMhMMyXs_de67jDgnWvXJc-bLespNB
X-Proofpoint-ORIG-GUID: FPkMhMMyXs_de67jDgnWvXJc-bLespNB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX8wfSgGbJNCQb
 5XllWrdelZkGgwpWJ8TLmk+TeYWjMy5C/i3S6x0TkjTHAT4AGM+Vm1j1YIkUaZlhA52/qaMFxUQ
 dGgwaNPjvW90Y2EtPSzLgEFzNiCaCJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000..4cbf1c271440f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+    };

-- 
2.47.3

