Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6F54B1DC
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994772; cv=none; b=DKfWQsfWZaQ72un21YERjsN7sZB5iitj/BQyroeEu5Rkd0HpRO8FqsQiKuL96a82dPtv8vndkRET7mzgC6UILjFIFg/LlulQOWdmWDX1t7kVOFXsEf38r81TY/t2L8UOoMiUxFdPspuuHVzjA2wZV6y1bWbjfOSmC+8JxghiU4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994772; c=relaxed/simple;
	bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMgvgXjVy4KpX3vC4fCgSxnkMK17d8G9ln6EzcaGiqffumRTKkbAt7yC4b44xmr5i0GBUyAnBVh3IBOkll7YzhL/iwrbGFXBt2TrEnlvJBdYMcUJWyYhYAX+HgHUk+5gYq4sW08e0kxTuD3f9tU7KadbnKhycl3NNL4cEEw5fJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLWb0ROc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdrTjwxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLWb0ROc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdrTjwxs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb3WQ1013177
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=; b=pLWb0ROcOc9PtZgX
	7HgmNxOUcneULNYEVNi2ruiFZUCuFGvnp2zDcjll6fdbOygleoG3oO7ZWAqrGyAc
	8G9ok3MgrzW4YkzVXJZQJQw/NOnmnmGTV/F10ZThZuRtkc/pSL5VV0SMWlD6uwLb
	GlQZ/7OQHHy4VM6ZOmkMt1uOLOCqBP6klqeoqjAs2dlmUNaWEmGW+4UzPWsCD1rE
	Kq0ubDgtSWr9l0IqJLjC/qSAS1+zM8zxOizBiS/22t6agSJjXpA5QPGY7KA/QHEW
	sjIF9CDbcli6JuBJ69N1z64gcq3wA3FCbXJRtJNYd88Bg0nu6CjGMPcXTAVaczBD
	90ilSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80csd3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:19:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so1167271585a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994768; x=1792599568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=YdrTjwxsHGo2iYelOYC3k9HuB4K6uWCYFuMXMObmKgaZ/huq0Pvl2qOlPdykQXxB7n
         6+Q8KcGtF8b4eA9Hn0dbip3cQLeXnSukB0yZi/xHz/rQbCY59UvbavOPzx/W03snBTr1
         CKxqtWKVozFYWHv5v2ZZNo0Pf+HIklpB+Ifo04olQQKEqacGG+VRZOXyibrfQF9DFLiy
         hJX2KHSB4HhhsvepQ0i017+EFyZ4qqgh3xMUh0gc7DFJ59aCuYqJQQADSNCb+tayKj5c
         PfRid2SuiCEnjEAhMyUwZ90mvPchEmwfrtiha9Ym83LRcO1xWzr+qyRLbZ0Nb6pIphIp
         btgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994768; x=1792599568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=Vg+hHgVfLo7s8o9THcos93aGXTlcGlqovpNxger0shOeWthaiYfy5mY3R8qQUMnVEs
         gs9yZr53lAF1eIagVQOtwRFUKMSIsuddJwqvlpNTeLu1X1Vb5a8qXD++uOZ1Opx+8xmt
         dT6Y7prjhOWdSouAEp9nXYKXoco4TO7SuXKNaOsmPEzVkjsoNBsdiKfDbWY6MCb9KMjj
         /EDgKqnsiVH2XkGJluzhdFfttVbNYWv9e9WIU3Bu0PfLKZu2u2o/WtSp9mBvRBKupkh1
         SdePJPgJQAchgL862A2P/hc5CTu1f4BnRYfgnQ5eeUri6YIVId6qDpJNZe5PK4IBH2gw
         P6uw==
X-Forwarded-Encrypted: i=1; AKwUvBzzumx4eAWm3Gi7C3sBAqnuZKMUgjgxtWUG/ImpS+JOzVqRUFBMI4mZ8XGtnxt0xavwL6OvdgO/+bK5@vger.kernel.org
X-Gm-Message-State: AFq9FYJjiKzMWFdLNtWQjR/2IeQKTKVTc3g7scJR2kYMbTZILAXHkqhM
	p7fw8G24T+Vv6ViA9J7d5HZPGFvLZSPa23zZ2pLNPiQr8xqTGN6KqLhEJGjgod9m0QPNN3m368z
	wNMaJiqwhvfOG5FwMzXwQ+0BOwFBg/byIA60nnYDIaDbpYYIFe/xkbY8hmur/M3H0
X-Gm-Gg: AYBFou2GcgoDtrlMqhjs7XWWf2fjVsqb2LQAWX9DEcsyO35U/gUfkKKMZ2+9gedVmbF
	7+uY7GoDJDHBhCnc8u+u0PCz0IphvbqgZxgtZW3VB4qXJABizwcV+RsaFU1bmBUtW8vpm9wPT+P
	baM6ki/rAgiMlst9EixXE6IeiivpCCdKNv7zHOjwsQICJBrpRLFl5gd/ixIHFvrQ7lkkkFIENfK
	cJOLcYBHfVl1fJvw/gtqAJNyxkSpAys0GJK1oGs0VqVIpDSrTXzzSRCQCGn5/QkyIPbZZGC+DLQ
	uhZz9LjLmT2BX4ELdHWdii2GkrDjP7LteRroadpLIX7u4zgM7cwlFwcIxqkvzY4yU76EaNUpneB
	mDtg5NMm5EIN7zUlndnX9NTFHFdoQcEzCnS0wMPHYnaJjx0yld/dVu7/bW7ZUPxfURy6IbGYuf6
	aSVncQUycSIEZR
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:fbba with SMTP id af79cd13be357-93ec12d08bfmr2614209885a.71.1791994767619;
        Wed, 14 Oct 2026 09:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:fbba with SMTP id af79cd13be357-93ec12d08bfmr2614198985a.71.1791994766522;
        Wed, 14 Oct 2026 09:19:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:16 +0300
Subject: [PATCH v2 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-1-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uGAFgE0CkXa4ltb/f9AHLvc+RyB+ghur2s4
 EONUgy3x0+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+rhgAKCRCLPIo+Aiko
 1XnOCACRQNTYxqCdZS4yKkEgV2Tryf5Yu4zl6pjDChuPjeenHaqwL+KrD1wNA+bbqoPPZQN0lpH
 QUBsJU0Yz/uTfuZUuDE0UBoiRJt7JUbcyedFA66VbM2yGnK5lvoxdWW+Hc01veBAna/Y2bjQoDM
 Lg5N5hp1iczJhhcxtUgjwM9kRq8cAE8IdKqoiQr6sRZQ5zVSX2cCmagiqV854kfbTRrc3M9gpWz
 5yZ64SoxTmW1MBu/K30bvLrS8tike1mU1yENkd4J7GDzTEgqqbKRSalJqP75Bh4DrJcRFHYap4S
 dBIfTBlEPIwM0Odb9kRTZq80HPX8nw3AynzOiu+y1RoN89bl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX9PZ6mHpNGWRd
 ceN1r8e4LLU+ELH3F0Vw58s4Jmzc+u096x2bsH+n5YTeaG4dwhKKLA0gCi1HmT3X/CmuAkdOPKu
 N4gUAwDWePEwVq7pTPX4Asun6FygjvA=
X-Proofpoint-GUID: atduBVmFQYZZQ6-mWeVfNIru7mhxoSNk
X-Proofpoint-ORIG-GUID: atduBVmFQYZZQ6-mWeVfNIru7mhxoSNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX3E73y+1WIZiX
 HDp/TJlFPMRMPHYvyXaaGrOo9i9eW4T67+g47MJbq0512nDoKh9JikPpHW449RoDPbfY2NB1j5h
 /HNJT2KDvwro1aI3m7qCAxMVzWj9GzMbvXKBl0F4NDWbqeE28YjfopD2dAU1FeoOMfVt4whx957
 JKpnlOpiubjOQ38IMedCFv9KC5IU7nKjPntKX0jTtjUtw3qWajQLTnRSMm05Llv6Qq+0YsvWC/k
 SLR6kV8jBWQWQh6wdC4xUmK8em9tmSLEmbjFcOF9QLpZ8SMgwF1woZjk4k5p39/wCtZe/07MLbK
 oK27OSUkkk0RSc9GQywnxPorK2PSLVRW7okRnXfCXW8WO/o/b5ewzHIxBOsDxj4tljVerj4K6jp
 wybSrvyvXswciNrNrjKom/BwKp0D1KXTEH52/ID98ZQdzSaXneopDIxurF6ed+z7XlVHJukedlY
 Dq5GZ/vj/jbm2arZI0w==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acfab90 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../display/panel/truly,wqhd60-nt36850.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
new file mode 100644
index 000000000000..1cc63a6adc7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/truly,wqhd60-nt36850.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Truly WQHD panel based on the Novatek NT36850
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Truly 5.7" 1440x2560 60 Hz LCD panel driven by the Novatek NT36850
+  controller. It is a command mode panel using two DSI links and it is found
+  on the display cards for Qualcomm hardware development kits.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: truly,wqhd60-nt36850
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage supply
+
+  avdd-supply:
+    description: positive bias supply
+
+  avee-supply:
+    description: negative bias supply
+
+  ports:
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - avdd-supply
+  - avee-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "truly,wqhd60-nt36850";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l14a_1p8>;
+            avdd-supply = <&lcdb_ldo>;
+            avee-supply = <&lcdb_ncp>;
+
+            backlight = <&wled>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.47.3

