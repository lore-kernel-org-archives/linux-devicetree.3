Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775104772A7
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390098; cv=none; b=u01n2xdjCOtvKqq1J+x9OrsiYkaUGo10KyhoUhL0PTxgkMWFMCTUn3qJblvjC72WJZ2L8ZMhn1t1xQaYTilrdFzCqWxo+RnFESjaDXhs8qZz3NvJg7FGo7cMn75I93UzrkC615Q8RjAtgqYQ7yB6gEgjeRIOq1h8FceSB+cC9WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390098; c=relaxed/simple;
	bh=HfNHkaVNQW8Ivt7UX8oz+gycqQ1mngAo7/JgQDEJuKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejnYGz3WPoUW3ZregIbFnmoNflF3XFbMRTsO5u54fQPeJuQXJG/jtlQBmkYRhnuKrcr/wWbb0fJOBixjQz9k1hw4G/HLBr9TEXPiWH/mdMrIdBFAz8jQqyGlJumkp7n39KO+8Cnota0CESJ4vuB9MAoVPZBIJKHPsL+XK3Q6/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzxD7pge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYGxT1/x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzxD7pge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYGxT1/x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFdI406580
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=; b=hzxD7pgeXwJqbBaH
	gxxAEUehlba71vOBJQtsrBEa2kcSgaWY+ubcMMCyfWTOUOZrxMMleulrUD8xPa8X
	MExU/bycvSPhNjqm2Ku48fh9CZi+hz9iNtcrTxduUMCmXQJl361bZ99ZAjPHlUOr
	DtHPIFQwwYxRb4qbgCTo89i3d5tN7sqdF9Zm+FyrmlfgpTgZICy9D08OnKYj6T9w
	YjW554eBV8lHBnGplmLIUyko34JW9xadxBh3Y0MyAHnXHQxSubAC2MgNOoN3VAQP
	A8N8JWVZkJ/53OGbMNpHY9+HZoxTLsoX0nmrWXeVWpeU5m1B0HphwtE6cV0kqVBZ
	a9Bk4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr86h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1d44c437so157588685a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390095; x=1789994895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=;
        b=fYGxT1/x7a0HzMgbFU7hyxZIAU1qrutbszqnShKVt9fYH930aUmWgm7Mlc9jXFZE9T
         vd9pbwKZNauZsCQKK7KyMiY19I92HDlYiVgmSaTSjYl4yi7hZNra3iqHIRD8Yi+Kirje
         aAOxAJpjRxjllrMxA6XpPk5R6jUzDCA+n1gtPCAjKPWagfsP2xYkoKIqsP8FqsBqQ1RY
         koybhcZzmHso5I9o7hfLwburD2gpeC0Xm3CjnNtW6AJlqpjGgrXQR0P2fBPVx5ntGChl
         x1zIq9hZAI5zFCsuJ10knLibqwo5DjlpLT/QPTkZ+5CuDnxKkPCjj85SGnUCzMXWRzN9
         KRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390095; x=1789994895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=;
        b=aN9oNoF8vrqoRUk6pr1Z8fufOb7EcaZUxFsOE/jVA8mDUBRxetzYDgcCuGGVch640c
         6WAd48hjEUiaeSV2lcyOdebUZJZlgFbiyJEXmEIsNCulpaAbbIPsiKHqDCCvE6v8Retk
         uXXoPFquJSDE8R26nftegCU2f0tkpW06yWy6LHGgwtd680ITSOhqrFgsMm2c6ay+TURJ
         EGtisFaQyZxgLsVfwS4Nujs5UnEPDD4C50zU1f7EdKzUXesXKOBI76yrJmPUy0mAJFE0
         Glyu4QJqgudusYKZyDZ0QDywOrk/UCb3cTN2GeJmFTYO3o2M7tqP128ZZQPxN/muNPww
         jt7w==
X-Forwarded-Encrypted: i=1; AKwUvBzQWJQCqNOkx4lP1sgKS0AVCZOrZb29CDn9+K32HxC2xpUF0W/AOkDUQ5yupzI0Qz4lRm2WmMlcIGyp@vger.kernel.org
X-Gm-Message-State: AFuF++m82dBUhDAnLDQHkwY1PFlosiHlqEu9MXtHisx+y7A4inHmTjAv
	VWdTISZZpvmgrbb/VyimPGUblI0kkj14MKzRBARG+ZNRT5fBUaya1J+oVbHOdRscnG4frhKUKwO
	6O8+SmwF9iqZ8XRIAiYFBmmB/FBLHqG2qCSqGOIGsfAhuV+G8XfUoiUowP3DJBbQq
X-Gm-Gg: AYBFou3WvrTNKzJdX+k4UyyjPZeRM1sbad6NPlStPRFcl82F4kZbvwRGATQxFH9nS5h
	3azozMdjR8Bw1PQ3XpYdPqOGWUdaAOciDWJYK9bDEtiN5a07mUk1SeRiqIyr0gOv9h0ZSDaU7sp
	H5H7vdrFR8SPvOnlBpPf4SALD53Mf4EDNTtAHOZfKt9S3CYF+FZBguP6fZLttklkjxNz40jn2f0
	giX27BlO/IwXLyqVbzTOCrpJ83Vhceho/8CRF5nFt6NZf7/WNr2N5SOiMNTcoAOiPggkIDJg2jz
	rpXD2QLcozj6meg8ZFBTm6s7xNBceOADGF4cr75fOOJyU8qH5D7AO04/SEbC3qLJRi95nOe5RWD
	vvZWlSR3B
X-Received: by 2002:a05:620a:489a:b0:939:fa1e:d6fe with SMTP id af79cd13be357-93a29966d7cmr334843685a.25.1789390094705;
        Mon, 14 Sep 2026 05:48:14 -0700 (PDT)
X-Received: by 2002:a05:620a:489a:b0:939:fa1e:d6fe with SMTP id af79cd13be357-93a29966d7cmr334793185a.25.1789390090028;
        Mon, 14 Sep 2026 05:48:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:02 +0300
Subject: [PATCH v4 03/52] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-3-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HfNHkaVNQW8Ivt7UX8oz+gycqQ1mngAo7/JgQDEJuKI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zOOwIgbxods8dI3eNoWZOHGKl2iXFWTRguw
 YdCq40ZQj+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfszgAKCRAbX0TJAJUV
 ViXpEAC56g5nwPtkEKHi1LBazQ0ZY76kDbzr7aGAXOt0oqDLb9HpicMxabVKpolPBJJM/rCr5aM
 1C5qz3WFmFvEoetOlIugySPphwMB+aSCJ+KWvs6e9XVu8+/roLYk2cGsUYjVmufeW85P8v7RtKu
 QXcn+6qNURNcgBlwrCO79MQxxPGvVmKyyviy/ckA/9oYnVp88BK2rTSK3bJ6DYIdZzYnSzfw+sS
 2qF9H57NAkCSbus+Z3X9++NuNo1X8S3MJe1UQ24yapSqQikFcF0qfzsPlm6Yq1FTL8a1VIMJKFx
 j6w0FinE0ezknAM2ReZfG+e4kg6y4drLjsw+rYMAJfYgxhqK/q3U+winPG1vPcPO5eGhJE6EWOb
 DuW3/6TazCtbS/Tma9OLW9eAww6UQ39B3JdInRJ+iyDvSW5JnhD9kHYjkQ4Iv2bWZwyYW1G+Gdk
 +wjTckEosNHBjaeCxfZMqY4iqlnucPNoaSPGF4qbiSZxkT3uUiJwKRH03cS6n9x9TDpp1igeYcK
 mEwM4i9540Yl00nendPLQoKbxWZiLQ+IzUgiSxQmkoaKhkXyfnMDNce8ciN3NIsmB98M6HmnmQE
 SaH4bxsAhzuTH+88B/kiKj7CfCTw9Na/J7nyvcIqVERkLZLQxM5lm4C687TzjMazqJOTrVtJ3IW
 K2SWTihGKZF9BWw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Lj0yTaoI1oPB99OFW5Kt2RgJ1lDVgApq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX+OqLAVcaLV8E
 t4jQTxaw9WB9ysOlJaBp2Lk35475XZnq8Xvqm+8qg+ZW9y1KM1us/1ckz6b6mcseGydiQ6z1fF5
 V/CQozAA2SQ8na2xEGt0T7CQIJIL1OKuU0aiLlotUFaWdADdpRGLzQDMwEwzN0bXYQmcMCwHWS+
 nAJS2CwqzZ+6o5WL/b62SvqYGicd0oyZYSEKDrjsB2/ui+edROK+IGRuVlLZ75gZT1t8YQdqYej
 GRe9Ionk2ejwgFrbhB8WALvd7j0+2TQnt/Om0+nrsFpm6fkl9JkUeSpsLHGN6ZevLKiuVWZxC5F
 ZaQm4t2++eLPEm8Nrs5eyy1KP64AB93qolbB1+YfAN8Er29cP22PaS85DanVWpB+2bW5EVsYue/
 /Tn8thT/QLio8ppfSCQqMwKCrvvE3QX78eXJDRxlzk1fFelrq/dQkc8AaFmz1tVkJ0nkKD+sNJt
 GiH71I91Ib2ICc4u2Bg==
X-Proofpoint-GUID: Lj0yTaoI1oPB99OFW5Kt2RgJ1lDVgApq
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed0f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX3/8GBDV8iFdg
 fLZp5WlxdSKGsRGeqvD5aMW0zFRUAHvboNFTA6QjlUmbrM0IWDODLTSSnn5ct7v/nS1ziwF3VRB
 Fa2dusbBLQhH+WcwIlYK2VUSEQhJ4Dw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..5f9aae728245 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +59,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

