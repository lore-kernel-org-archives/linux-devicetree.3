Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD364EE84F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879495; cv=none; b=Ih2EdzRt+/PFvTqzLRvYpgpbrKvhJHqXNwe+iAHak1KF5/11q63XUa5e7t9RAeW+gZ3QWMBPFxSpnXqV54JQn/UVArKa+rSKoQAm1RzukPRP400vZceow6/7s2Xi3rHAH6Sw4JX9Jm7BgDpL3C1BlLRoO1JWkVrrjnHOz67ZRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879495; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhjhYi7dZvGhT4VtvnP4D6ZNTUY0sK50kku28N/sy+HXV7lJQFm7ntOpFFYw0KB7SW5blZ+BtJ60bsCOTSRzTRrgFp6QK2KEyYsYW4cGqWkktdaVxeAsxTlfe0OEV6JS4L7JXTgplc2NxT/sDgbs8v0KnMc4zKrvQhMffUtDFuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx0KeTIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2wVT0Ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx0KeTIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2wVT0Ax"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej3pV230323
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 14:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=Tx0KeTIt0AOxpg1Z
	EI3PzlCzkOxqx31uyixTbn5VZ2vcGP/cfKpWNggL11BX4NRpgK3vbuttK23ugi0P
	NyK6aVgGqPjJ7NsQboVYsOnhrRYuQ1NHtARXej7cmss8eLdezFM46FUs0+MjtPBk
	lq/RBD/byupgRAGykXT1bysneTIruSD7pLgaDdp0jviV5s1VXXxlknoh8jV946TY
	tG+Zyz/RU7xT3FuZZxbsCksFjbU32dy8LKZZDMV4Ek3RI/bbB7BPAOX2hEq8ErGK
	l0vmqKSFncRg9gCyJfhC5UlNZY/RrgviL65EDkjGaKQCGCXOdIRwzsTu4HMv+zr+
	mFiP2Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pakhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 14:58:02 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980a896f53eso2424382241.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879481; x=1789484281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=O2wVT0AxwK0CTVqFXMDURnYvs5NfpdquQRC0YtIgapBRL5uCYZuN5jcabI/oArvffx
         hgCgiJRDjuZ1ajOqAiNcpLdNhpxzbqmKTnp1chjaPeAh6R3GbNYLsYtLRBH5Qv7iq9HM
         7KCGPI+ZpSvwJwDC7ut45xS5Iiyb/c4Aq/jzGhZ9C3TGZxsU/nryc6v4zlAO99UFqZes
         /pF0L5ENdRFkWl7dDaebT3dHvDM+xLfkPLyzQ3MFsrAIkSWGuKoiJqOXpKEeycpbDykb
         w/1wi7z+92s/dMmMPQAmsNlwKQFc5bMrjTE4sLPCrnayBghfT72BXK2YnTOeIimzDqsU
         79mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879481; x=1789484281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=SFHvtlxZ4V7C5ON6Uk1EeAgS5LgfX/IGh0WPjzMpKmvFrRMV4WjLf7GlO+sg/zkTmx
         xLW2sMeNhnj+ARO6uFlc9QtlfQrJOjR8IRJhPshEmS2QW81kHXaPjaaGaEOxdpnter7+
         MkVmhkNuUffRA0O59mMCR9YYPoI9UsOtk8q7p+P1qR7STm3o1NbBsDDszTjseyB6Gkp7
         zAjyVrgl9zwP9KgZM1wYASanSy2KW8quGY0MCKEOCXr9FNzgMclgJUpnjZTYsfmgBF6l
         I9c3cVihaTajcar7NAj0jIhC+5Jkc7q8edf5QbO5dYWSPoGfbSBIMttIDlDuRXCloOYc
         x6Vw==
X-Forwarded-Encrypted: i=1; AKwUvBySK05zK1K94jk8VGq2q+ptY3wqhJqEvPn/zgmXBpckad/3a3rzRh1wBnOjqW8DHh69fMsQdqVKms3I@vger.kernel.org
X-Gm-Message-State: AFuF++kq5O0pRV4ZhZo8GQ35ve/zXlVzKqouhpW+g+8wbBhG9u5fl88I
	MUefu/UMrN5YJ01LkpjaceePj0kQViDvXyRH7VDlLNHmpuAyB3iqWrGAAQYultbNmmSmotCyW7C
	pPu8lAWL8Caz2uwSppKW+Bp0lTgKb8yn3RQ8KQk7rr2CEvhOKUnwSA9VVJ8DVzhFc
X-Gm-Gg: AYBFou2GyhK0pq8sIVvGjiCoZw4fGzI1jnloK/6YXDg5jUNofpebQV8CBzUB6K1rRcw
	by4KGDsftw3i33n4Hg5yJMt3iCs9J+lxigA4ahFjkYVbUY2xg+b+UOnZjAPldFWcHcyvtmQEPrI
	uBfIReEliD5v/9PsgsxrPrQaTDE7hibbOXHqDIF8Lo8805lem/gDrJgfTGwTeijYbkxtOGt/6nt
	8ezo/iS6AR0jk5p2URBKyz9G5Dz5bV+tfn+o/khWOY2iI/mARuCuhz0eW2OhuBBB/pyQ0Nf1bFx
	lI8yY5M+uP2eAQNZrYR1UnF9vtL7rQySgtn6vVFE9QqxR/7Ewssmt7q4M4/84165bktXsZqfSFN
	5SgwVlc28AfvUtmpV05YnPR6hcV12
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id ada2fe7eead31-78a4a918bdfmr12691807137.3.1788879481291;
        Tue, 08 Sep 2026 07:58:01 -0700 (PDT)
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id ada2fe7eead31-78a4a918bdfmr12691786137.3.1788879480827;
        Tue, 08 Sep 2026 07:58:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:21 +0200
Subject: [PATCH net-next v14 02/10] dt-bindings: phy: document the serdes
 PHY on sa8255p
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-2-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJnajTItqWRiT6SMc37O+jx/iYaFaHW4w2Xx
 saScv6vyGKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiZwAKCRAFnS7L/zaE
 w++tD/0fr2YRZr6C7h4q6iPVWjh2HNSX4GV9MKYWKIYBmYFejDYaJEFc4h98X4UjI5Rw1vfad+B
 /EYWEucAMPhKHZQqcKRsmq9VqmbfcIFXrFVI8rRRuHhLp0IWaXYIIeSecT7Uu2Lbj1tDFgUII95
 juhVAMKcY2pDV4SasZOyYAKEBo49uQrVuTG74OWjZ/F0bPqy+RzfXqcnavEpTBzq/DKS0KYKsvh
 FeOll87EJdwRuJmIgANys9iKZRuag6wHKvdzv+6cJnSE2TrRlL5waOQAyiQ/Z6t6YUF/gQVJXX+
 iQZRwGUMtY7eJdwLS8X/2MZF8gMzIYh9Lct/RKik0ZNiHpTc7mc+Vs3kwj96kscXCK12u2XXMIF
 9ueQLpXb3y/gm8jDFwekh+uZ0j5ZUnUnKsDLZxuF0iVNjQFbZuJPf81dcBV4f14ddUdOpBKz8qv
 2EaOTsJ/6GqT/YBtlLSJKA74dZtPs4DDosX6jcqJ9Ujrn8+gJnhOFp5Jq32nMVYe1Qx9BKaliPM
 X8fJX1IUax5vBGTEiueUd0MyoDwfm5Ps5zAFCVrhgD9Pi06qFACTxu5z4+WIl0YDKnY0NaqjX0a
 LEYtyDlUEFpDHJUuaR5ridtl4gfyUa+f0oQOCFnR0C27C4ixRpilc3ub3jVoBu5XUvvy1Iw3DJS
 1Is5ebpQSqIVC/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: XKImv4lGUjCDoRktgGDQ1T_mS5oSSHBO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXwfM/sSRscJEH
 659yxsM4Amr+gdqSYWD04lt29XxYKHpDDQKjzexKCgYaaRJSFHW4JmUsIbKcNyXC6n/w+GBtoiW
 jBm3fJ85ncM3mwyECe15HbebLoq42PI=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa0227a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: XKImv4lGUjCDoRktgGDQ1T_mS5oSSHBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX21znx6ofgNrE
 v07jJHXcYkKeGQOF3SdhXSZ820920bCl60AYrHSlLtn98BNVZWdBSREHTxF9anR6UB1EOlkDtrL
 /8J65Iie8WV1JC4AaK0rs/lPe2YLpQbZsrBMf54YvvhIgZJEINPV2NvQ3K9UEsVkzFVomcly5Hy
 Om0TSblUz/r5yWn1XJQK7/d7J1QWeFk5Ghw5maMWpOa61OoblKREle9Txs6iLnMqrkk3lxYt9X8
 DoY9lfxdLqbJ3AtetrHR1YhmXa3bKcoQb8H7ukfE8IyAqXpOvp+042FJD3pjAtGG+GqmYUbPvmv
 ntRWoj06nFTobRPgnHXMn9/VnzrX+vp8IIlTMRbIfOhMg1eYGcoh5k4vzaBGszlMXmoVgmhEGv8
 bBJNABrX3RNTQiUDNsXohlRlIQmUFtwQOk7i0PanIJJXtoIHh7LAcPOj+sRkoWT1GNyAB9y7/Wz
 io0DAMT3m9vQbMSel5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080161

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

