Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7B3D9DAE
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441035; cv=none; b=EWTJtbIBC45WAwULd9RtA81xHv/ofSvA75kaDt81iR6KzQ6Vt9e37j9HNRQKfzEN+ngRP6rfMKU6uDyu/CHCLoYD/aLJedsgd2NJuBrjPbZxyPgiJ5afPpC9O+GIenI6D1VBJNdHC8QCGoeRYEksRYh+y5G4+XNaeEXdMfLbENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441035; c=relaxed/simple;
	bh=EwI/Ilroe2dcZtsTMAQYHEJswLAcBpbqNllMx+9MzZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCmQhBLKqzw7Hyj6XPJdMRd6gzCzB2XncaPKfIP96P6ixTUks9jTWaGVovPM6KCwrySg3Q1yn0ceT3ve5eGQ9QFTckXVEJ0QQAWBD/dzM8ebBSjAxUVfXxX3ov49OSOGzzfB9pfJKmuqJcwrQrtG+cz/3jKNIAOL1zRdupHwYfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL52UEZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZHccwS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL52UEZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZHccwS8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBH7od1024460
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvYYLWhWfjzIYUd3a5Nk0Q+Nm2WxSO1rmYo5uvWd9qA=; b=WL52UEZW4vcAiX+8
	Ggyf4Civ6+Bs8sWN0o8cLrl+9RCi+24uMydaz9RwFtoojBOrYYV676cOnOYYV3Zn
	q+oK4zyed2uEaOECGYiDzQ7pmzYRgntsngBepk2K1mI/EhbQz8I6vyn7X4u2dgTU
	asCbt86wRJjkm/5iorNlVMHvJ5Q8M0sEWaD0vO4V3iuejRboGv7X0xDMAM9VzGYO
	m4aTdIQW/blZBK8DbMSksz8DXn3VEY7YH7Rctgrj9mG0wMoHZYheoSP7U2WrNNZo
	FeqJaOjsV9DaywDf9KhWf4bzSPvyestGnilPVuJiIbYFUGyoBWZehRLVs7u5dELy
	4HWCwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvvbq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso21856851cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441032; x=1775045832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvYYLWhWfjzIYUd3a5Nk0Q+Nm2WxSO1rmYo5uvWd9qA=;
        b=eZHccwS8UnH0dMlXAeyAPviuuRm4yYak4gFqgqMhY6Q/p3RT+7UtGbFBzXTD6fNB0S
         WTEhh4/PXkVr/3Wz5GlPXwMTHxRVjWa3jkjjDWBZ1VyLoFOaEc+dhhqiRG7KrpJwjoYS
         vXWjwp9o8kiy4YvaIyS8WeSz6QVgPNdi1ag05hMlLkYZs0Aq0gHbJQJ4rL1IC3bWElcQ
         ic9FRFYd/ERm73Wa4MYiv9tWTU7AREPZVnnbOj86UAFGf1OxB2hLKT38z1XO7rKoag0P
         14QB3J3wbJGkUbsFbZ8xZrh7IA4ydBSo/ItHZIiP2uYMTF3mxVYafEB8CBSgyiSCN6og
         FObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441032; x=1775045832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvYYLWhWfjzIYUd3a5Nk0Q+Nm2WxSO1rmYo5uvWd9qA=;
        b=VqDN9Rj0694kUsieUgknkPidMZPQ1PKoV7wo1XIs+uD2s3Itjy9Etztd8TLqoIwB1F
         lwuGWHOrHc3/kh1tGFnmE6GCFStyurgS+1xgWQjAVS2bSnAMTp0BvS3EIhA5PfuIU+2I
         tWfVYQqmmxHY64DqPJG2mJAywA7a7WMw4mIctBmL2Mnndns7xB5V3HbM5nBSzE/B7vcc
         O4Y01ap9LkpGOirq93axEw5Zi3tR51MeRr7cdXi1cPCUa9ovShC42BsZr3W9KqUESJ8m
         gQITiYN3ZqTpp+w/BUxvS6zecJbopZ6pOy+1BY/wEu3srbHh3XWG2FyJT53seAyXsMD/
         yMPA==
X-Forwarded-Encrypted: i=1; AJvYcCXalhVhC48cHxzrJT+hG16N9Guq3ES9TCw5971I6LZIUqeGX/mJJ9+UWF97dOLWeobhBXdCp+keOwTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5eidR+op5171gsOGWWP1jpW5blXHeXf0Pil/WeTAneYVqXNyq
	V6k4j6NEZc/2a0vm0xI8hD/KaKq+7+PlepGsKIsNI3rZeqPpeyU3H8J4OKq6x3sw2752fI3e0UB
	lViRERetQEZR2A/nQezcjsN35s7jRKMaKjfvwCn5uPlt5+biuGHq+btsUKQy2h70Y
X-Gm-Gg: ATEYQzzYR/1oRaHFTDw0lsVcKrgRaW4+RM6NZ9fPnzGKIZttAAz8jCo/EttHfLT0iyL
	l0qcEuX60/+QVphDw79/C176IPdJkffQvE7fIMpbwSz8YNk8LLSHilRY+aoTSqvoNZgwxGoe6WL
	E+lRN0eow+tWGxP4blyOR2sDFHpuDO19LHQzfDQnN5nSXbC1un2iDAXcSajM86APeXa7qKMu/rR
	puWH9DDIGWy6uqtlo/XjOYQHsqh/SAMT70Pj7jAfjTnXUESb51+L4rEE1jhi2bqPHLH9KKq9Zf+
	pcyICKqKYn/FnuOx9eP7plEnqQJq46+T7KApAs/0oI8+Ya1n+MgLs7nRgoTX9/JAu3bc70zpCgA
	CDkMyrXTb4fN/YIwFnxgl9T/cDw7loN+d1fon/eZ+qNbf
X-Received: by 2002:ac8:6906:0:b0:509:882:9e7a with SMTP id d75a77b69052e-50b80f2ba1fmr44135981cf.70.1774441031337;
        Wed, 25 Mar 2026 05:17:11 -0700 (PDT)
X-Received: by 2002:ac8:6906:0:b0:509:882:9e7a with SMTP id d75a77b69052e-50b80f2ba1fmr44134931cf.70.1774441030584;
        Wed, 25 Mar 2026 05:17:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:46 +0100
Subject: [PATCH v3 5/8] dt-bindings: display/msm: qcom,eliza-mdss: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-5-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16867;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EwI/Ilroe2dcZtsTMAQYHEJswLAcBpbqNllMx+9MzZM=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnD0jOhxtybdiczdXXma1ol1bajlNlEaUIFckM2SCxnT5OWZ
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpw9IzAAoJEME3ZuaGi4PXsiQP/jqW
 8iwDR+sklJqiSLHRZ+OZit+PWLoWB2r0iqJUX8l78rVlkmKypcKNofL9tjt2j2HfaQO7su/kKyn
 YhxyKcXlrU/o+KeqfoFA7wzLCODrAU8CWIStjt3cqKX/MY7TxijEP/r7Tqv6iY7ysXcJlLOq6uH
 AdSUyfuQihEwLtQ0hYWHOD/8b1T0p6tpLSa8wSgH6VZRJdGiTrcWchX0oHtvQTH3+llX4DT6q2w
 //oXL/XVDPbDqL48qzP+W9+gHMZda1Agt8scvJ2PV7k95zlChyQWpv9oQvN6YwFPSgX/aV92PXo
 doOgm4gH3N2Y6d5rOlxVV3b8kN3J4Y5xxuO9do1PKgulqD0aLJqfrDAzxPLMx1+geQf6zeDdp+V
 QOHWXypb2qt7SaGNIDPlHizW/jWMrDgrl/AZ0aqEwG/b9Z1ISIglwzfd8hC9dmsVg/ff7//lmhN
 wkTpnECKGtBmrCj+rbtX94UU2cIVIsWHJx7igr9Iq8mnvphDR/dVwttGwiyyM0MsNVjTJmJBDHA
 b+n8l6laygsupPZyg9vySXd5cuRwexWu6IV2CPIJ1dDel2hTMBSLIEGC81/t5OOhz7rCWsSECNf
 cjGoi2r1I91n6sVie5vJ/WVBNwzESFh+goRN+d5/WERF11SyUeeTB41NYy1hcG85Y2HErZbbGjm
 AHp2y
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX3jER3JZgvxY4
 v1DSZFeya9dwNgeeJ25zJmqEunjh/SVMO4E291H3iX02I9ACV7WOnK97FFmL/DFb3vNzU19lvyE
 2t8uoOscrLvf2Ferwug+9Sa81sFBNIgdLR8JeXqWP/1E0QcJm74Ws96NbOexuPLOoOygwCJLrZI
 c3TeqBbmeGeYuyD4OJiKHXp22R+JQxpvt+lrJ3613kwSWl0b5F68dZqaPrH72bXDWdncLZh9QPS
 3nBAMf4kBLYP2PcDNEYaEtWkMuZrw8tIt67HQ4JQ8WkefYHDq5I0x0pBNc6EiVzO1ctj21BlP3z
 Y6zzRoDHpTbDarjIs6KuhbtGW9GPGogNooPIOA/D6Hg0Zvly4eWuk4+IQ6vxHT0lvSMnQBIjCuH
 52LbXYfLNoIp9FxjOpsa+ONbeiHONmtFmorj9X7Imqe/pE2TRGnX9mrw1cNItxZgY0tRGyHyFGa
 eJi7VxBKqkJpQHT+Gug==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3d248 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wHLdSD0nsKlegPJtv6gA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ZbrKXUltUuzzhxy8DMc2X0rayoE8XVSS
X-Proofpoint-GUID: ZbrKXUltUuzzhxy8DMc2X0rayoE8XVSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Add MDSS/MDP display subsystem for Qualcomm Eliza SoC, being overall a
minor revision change against SM8750, but coming with few different
components, like different DSI PHY, missing DP1 and added HDMI.

The binding does not include HDMI description yet.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix build by decoupling from headers.
---
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++++++
 1 file changed, 494 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
new file mode 100644
index 000000000000..47938d13d1ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -0,0 +1,494 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,eliza-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Eliza SoC Display MDSS
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  Eliza SoC Mobile Display Subsystem (MDSS) encapsulates sub-blocks like DPU
+  display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,eliza-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,eliza-dsi-phy-4nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,eliza-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+        ranges;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&disp_cc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&disp_cc_mdss_mdp_clk>;
+
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        interconnects = <&mmss_noc_master_mdp QCOM_ICC_TAG_ALWAYS
+                         &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                        <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc_slave_display_cfg QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mdss_mdp: display-controller@ae01000 {
+            compatible = "qcom,eliza-dpu";
+            reg = <0x0ae01000 0x93000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_mdp_lut_clk>,
+                     <&disp_cc_mdss_mdp_clk>,
+                     <&disp_cc_mdss_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-150000000 {
+                    opp-hz = /bits/ 64 <150000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-207000000 {
+                    opp-hz = /bits/ 64 <207000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-342000000 {
+                    opp-hz = /bits/ 64 <342000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-660000000 {
+                    opp-hz = /bits/ 64 <660000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&disp_cc_mdss_byte0_clk>,
+                     <&disp_cc_mdss_byte0_intf_clk>,
+                     <&disp_cc_mdss_pclk0_clk>,
+                     <&disp_cc_mdss_esc0_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+                     <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+                     <&disp_cc_esync0_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte0_clk_src>,
+                     <&disp_cc_mdss_pclk0_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-140630000 {
+                    opp-hz = /bits/ 64 <140630000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae95000 {
+            compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x280>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&bi_tcxo_div2>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdds-supply = <&vreg_l2b>;
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 5>;
+
+            clocks = <&disp_cc_mdss_byte1_clk>,
+                     <&disp_cc_mdss_byte1_intf_clk>,
+                     <&disp_cc_mdss_pclk1_clk>,
+                     <&disp_cc_mdss_esc1_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+                     <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+                     <&disp_cc_esync1_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte1_clk_src>,
+                     <&disp_cc_mdss_pclk1_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi1_phy>;
+            phy-names = "dsi";
+
+            vdda-supply = <&vreg_l4b>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+
+        mdss_dsi1_phy: phy@ae97000 {
+            compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
+            reg = <0x0ae97000 0x200>,
+                  <0x0ae97200 0x280>,
+                  <0x0ae97500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdds-supply = <&vreg_l2b>;
+        };
+
+        displayport-controller@af54000 {
+            compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
+            reg = <0xaf54000 0x104>,
+                  <0xaf54200 0xc0>,
+                  <0xaf55000 0x770>,
+                  <0xaf56000 0x9c>,
+                  <0xaf57000 0x9c>;
+
+            interrupts-extended = <&mdss 12>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_dptx0_aux_clk>,
+                     <&disp_cc_mdss_dptx0_link_clk>,
+                     <&disp_cc_mdss_dptx0_link_intf_clk>,
+                     <&disp_cc_mdss_dptx0_pixel0_clk>,
+                     <&disp_cc_mdss_dptx0_pixel1_clk>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel",
+                          "stream_1_pixel";
+
+            assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
+                              <&disp_cc_mdss_dptx0_pixel0_clk_src>,
+                              <&disp_cc_mdss_dptx0_pixel1_clk_src>;
+            assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+                                     <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            operating-points-v2 = <&dp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-192000000 {
+                    opp-hz = /bits/ 64 <192000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dp0_out: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                        link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.51.0

