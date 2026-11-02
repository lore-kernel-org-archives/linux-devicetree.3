Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615497;
	b=aKaZxmrqgUfxS6HzJm/XzavCt2rF03ITRYmEs4UG/UuvPeQF7sK5fsH2R/K3Fd1QzG3K
	 n89V1IbcaB3gGhZLuTFnRC3HUSqcCt5ii8o5qODbwEPOa1TxA3G0pWlRmJCwPlu+Am8x7
	 7QhdCXl4O7Obu3243AuNYp8/cxNDCkf0JZCBLdVX9bZP7mqtfUsWsq46mTW64/LoIO1o8
	 rNqzNrlVViP6qGBsATHPnm3E3Nf8dtCq+DJYB8kA/WDXk28kFS9YNVPtL+5LIv71kq/sL
	 1hD6S3bzc5QGh0lu2ztkno3YgIEucDv5HU+A00nIvT4rTH/5sv0YauNCw30SAxEDV2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
	b=GBEb0WD1yq+e+yZBnJ0AESAxhK+8rfsv94YhRAn0bx5PkRmtEBIENmCjWxWmwggAgGhJ
	 Hfw7vEZ5KeNvQFkiZGTkL+LQ4EwmN1rPZYEEv3AQ+7TKbYOSJl/wFeiJ089VVJSwv8z1d
	 rdu1qt7iM/4vMVKWG8qlyZBx99l2N9ZTUTxj0dTF40h3P/Iy9LxhzQVfH9AZJbZInpPBU
	 XMbjYQS8Brq2lkcvyhjfXoOxBWe/fL1NOVX3ajhxwFSEVYxIx9vLz1xzMQhwvrZad0/Lh
	 6vmzxWpW1N9m4c6SBzXBrRoZ7a7u5SfpfC8Y2HOpMfPdvrrjGNESdoydou715h2tObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5Zhrho4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI0KRFil;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B7606A338
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4B7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5Zhrho4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI0KRFil
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6l2213989
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=D5Zhrho4JNtM5SKc
	9C/2uQubF07fQBuHlnHO0Kl1QTSQsW1MTfZI7+pNeC8HqGDgtcbeyxAO8/pYUdoN
	Z59rwc49qm+eRxCMaZpfJo2zgr+ctuFMeN7R8jeJveOEADtkHc8YHIRoXTprVHt8
	QzHeNk6OfJeAj0S643/7ubSgf+6X0qdyxD2br1Tps5e7om/VsEaYQ6OGsvqRK8u/
	/lJWrrejt1RYd77W5vhj+6QYhAzhCXnvQWU7lYQHQHu5Ihqi/MG7HOwp0T90UaGN
	cf4oE67aT+eUini33hyJ3mFKam22Qp22EQ7eQiZ33jUS1z/Lag6BaKxeQhpkYhtp
	A02tVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s559-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:31:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so500819485a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615491; x=1794220291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=JI0KRFils6Xk0EOdtTs4ktLLaXZImqcNKBmau9dqCd6eQRPRENl0PN5ywrE8wnkR0R
         wqfDwX4MLzpsC6kDuTavb5zd5riRdgOpRjSr4NSsgAV9fO0bCW7SiK5too0GhcpuKQMT
         bt694LrXOQSAdiZ5431jVhfPSnA35nLuVhI/E1D552RAO8SIEy6ReW3nBOqwmb28Lvpi
         od3UvVICbwvT/BSxCfQoU4K222gAF2Ml5lEsEwNMyBmx2iNHtqc2fD1EwqfNl28X0PBY
         6glMbu12ftf+q1wMKfIQMpHoLLFpr3sSsEy+2Xlo1v73cWgLcwVUsXysRQunp2qQchVD
         vWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615491; x=1794220291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=Ja8eMFWJwhBD/g0YhMtWchz6nNbf2hSuVJWLA8SnyNUkbW4xBS4n/jYSuDsb6z3gLQ
         hSPz/m4fe3bH4qYCKjjE1hYaP/Jkzx8hVjuuO8YwF5jxuAzPGmyr0SS+tVsk7Prhao90
         r2BKyjZlz/l/K3nZ8mDkj/bM0QceQ2Gxh/mjTkkBD/FWgCW/PnAbLsB5/TGEOG6LEEos
         ech2ZAEyCkUXUxcA16BOPvWLaQvtIRUuXrbTBmV9oATIZEw/HNFJclGnj8Yp68+jGGgq
         6aOzRa6tGUKAaFNbiLodcHJ1ZgHK9JIELeaGy4Y59BnlcBGtN4MsLKcn257lY8oqd3zo
         24Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwhMwPHrca1IlvKlb/gBTiORVZO1l8SU4kLdGhndHdXurapGW0P6QzCBJJ8UsqftOmEOUWvTlfzNlPJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLDLBGkTyFQwm31HCuwNvOGo6af2tPe61GOhaJC2ZgFQJPkaK8Y
	UR21rVjtomMZrtzTF8Nnh9egmrBuTFKNM03mou1evOKdSyGdh4UFC6N6XPr4fgclVkMghUcX9H/
	sB0qnOoeaVVg20fqSFo3fotfB8EkDPe0EdC2WIK9htbyXQ7K3X2b7RkxwJJmPMKpY
X-Gm-Gg: AYBFou0ez62TW7T7diPe/yPzY/xrd0a6UN3hXnzjU6cuAJ0gRotFhZ3O1lsNHEkn9ci
	52lmYotTca4tF5DrXJXcLiPcYpgzTe0y5cP1qoJUj61VmAOQxeXHqvtf4fytJyKSPvYZnStClb/
	ceCvZEYkzBH69lePqJf8Ma4+tosxPWRIxE0q8hOd0sI6DUaF8ryWZKQcoXxrytAAXvdWFLczUrB
	xZNv85j9JNT0fewh50sAO+Ubt8cZVnFz7xkc6D5vLrB9hbDYL7UnuGlP2fo+M/wNO9itumvD1Jb
	/7QIx2ktrkK7Csc+BZrMqOEKWVVulMBnCTxgjA7rD6DTPtOKplvH8GE8z68PP3gmLAzEsMm0rpJ
	5vDZNbXJSzE7VBJJjDPqYE2nprVM5+RIYZi5vMkmvyrL4ryHODR+UY0/ayK56uLlIsc9ZvehEO0
	LOfg==
X-Received: by 2002:a05:620a:31a2:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9442180b5demr1569727485a.77.1793615490679;
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a2:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9442180b5demr1569724385a.77.1793615490220;
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm327847885e9.0.2026.11.02.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:31:20 +0100
Subject: [PATCH v17 1/2] dt-bindings: phy: document the serdes PHY on
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
Message-Id: <20261102-sa8255p-eth-phy-v17-1-aa138f2912a0@oss.qualcomm.com>
References: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
In-Reply-To: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GZ+RHjr12vHBhn0eHZ4GbLtL3zdbnI1zDJio
 LxHYZvQlqCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhmfgAKCRAFnS7L/zaE
 w35uD/9wcl/m4vYFGffyJsazxW9oQxPMi3BENRaVfoIkO3MtigFHDByww4DdmrtZkop1/RTh/bE
 BItYPSlNGtrT4UH9G7C0WVvR6aCzZrGWQOQPyX2+6R76HoOfIGeFvxpnau+JofUy8DtCDtE+XzB
 VfsT5eFTqdD2Xu4SIJFDc5W+Y4TJhP+HGYGrt22fiGFgzQtadUSHqz32Okio4pdo9zRYhduBZ9y
 7tiN84zdDnpoxoFqtB0mUvfA6E4fAPaGjdEO2CTZbOsS+qQ+2+dCSoOChNe5GESRz9Ze2wdW9To
 RUKhHGioM9QIpbv7dQQ2S9Q/Dxh5ha1/4I7h9yzT/7sbugMAYAYqUTD3LD+uFwo/Cjk2btj1cdB
 ufsqWeLCuV8wMB4xc6lU8/Mn2KE1sCYkB7WbciyXW6yV27EG50OVtAPhu1oENZxecqMPDBiQg4H
 hizZTdI0dIekxgD15e/W8FGPja8fkFeHzT1qaMH6n2i/sMDX2wSvaNREa3ZK596Tg5XLjZawTxa
 Jbjhkl0rxvtsPcHs5htcReS7pQtulZXM+6ieogpCDnNZ/NJbVlWbn4d3X4xHiB5enjrLFi2nD7g
 k3WXFd+KvOEBcmmc8MXAEDvgxHraAvcxj3+RS81K+/0AJ7oX8QR1VopSYRYI0E1c487CJ8zg9pL
 ofK0qxPLaPcC8DQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Se71Ua3P1ACjpdB6BaMmPHANOwaM0cuA
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae86683 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX4DjKXRbib4Je
 RC/8M9g+gNhCTWKl3LlwJSfDg9viZNtDCouuQuTLqIpt8edjGrlpCl691CsUYyuMiHZ/wFokKeU
 +UokMvnwB8PhSgR0ExVEBiwKC2USAU1r6yp83zTSMgEaRUPx36yc1610mYGJyy4ZQ869zKAmcAo
 y4lxzbIBXNwBImwATkJP/0VCRoSA6ZOZzhSh5AzHgsfb+4lq/xlSaYhl2kqqIe//Rz2VzFfDSlX
 CDIKci0m5lFxDFItVNTNJSfz7vsMnfd1MJM5IqiAmN+OzhPYnYYB/ZpY0ABHJJNMVf0g3NsvM9x
 mYCjORaDuorghA4QgQ4Z/yJ63FEI2Ej2dPBwowD+NqY9C2H55iSKkr7pFAPWETTsmiATFvIa7GH
 V81SGUlAy/nwZJnIAdb/rBsen3vvbGdUKh6SeiADvOzPydEhYaQ6zgFxKp9wxd3Bz4q1TDeS5LY
 pM/Qk1HlVStQL/yecEQ==
X-Proofpoint-GUID: Se71Ua3P1ACjpdB6BaMmPHANOwaM0cuA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXxJDBEWeTswnn
 dlecieya9DXemuorAzNDmt5O39ww9CQHhxa35NtxLDZxCaIPoVw8lqcbT4W20xZhmiplX1imwYR
 /xMhuljkzD+qCEdjZueRMsD3cQu7Uk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
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
+  power-domain-names:
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
+  - power-domain-names
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
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

