Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835059;
	b=dWyeeF9wXn6+mWToyEk9FiO4cYl8vZo1KhPNBVNNbItpKoPZJdUEJlcvH2iNZov7D2S8
	 K7BDXxrZ/+ebDJFUgrxHw39jijvShyLmA4x/7fgRVJB3yazVGx+U5dY0gk0YL8n9tnyOk
	 QNjELPXDhJS0UP42NuEnPKxPVyU3qP6gHJIkXiHMJktcPvbPVMGAk3UZeB1dnXJYg6zsR
	 zkAieNPiZUrYfTyKEFSJ5IB7oAls78MFslAbGD4C/W7SYwt+9lxXMv7l4AHDvu1MUzTGJ
	 9h74B7Fe0Wlv58E4ThfCzaaIZu2TPvOFqHlOGbCxhoNYm3cs2BGJKaK8GVt4HgqEtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=;
	b=sh/6sMUmnE2yXMfTJvDAU374BmWWUzxr6N9P0KjA1cqTTUXTZ2Hx8yKRike5/yFriFUa
	 zegpwJtIhHMpWv7zdB6DblJfy/XhDx+KrhsOhjmyD8GHhPAOP0ZfPUHPTsZe12gffIeYq
	 hdr6S4eEpMb19ETE0Zjyf47zbc0EXocTHIluBb3IW+xh7QyYzfQUz/Aaqzl4+Ni/pWAl5
	 mOeXLEH+0EXCW+hTiBm2Tm96nrZgcAz9f3Z7w49OpymhvzPgwglclA/2CMwVYXIA/U6f9
	 SFHtVRzvItPYtIgV6XdUaSS6NDoUUOGVhqr2LscGQte+WvsNSVH+9iSx8nYawfTVBMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJV99GVW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1j4SVyK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA01606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA01606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJV99GVW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C1j4SVyK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC106U4069498
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=; b=oJV99GVWhizlc67Q
	Cgc4OQ0Rtg3ilZdfLXAa5PHsF8m0WxBUxa7hXDxy8J4tTZYT/gemtQ63Ycu4eHgg
	UYh+r+af6TLJWjS1jSClB7pPotQ9+8ZCgE6wMdCk/FuoNi4zkv4FOgnYsHSzov1I
	ti6vfVB/VsVmGA0R5B2KrbXzA33r+oNET/icyHA+nGliz6pwOjqW5zxZparad7+B
	UnQupi5CGAG1F4yEk+My2Jy87eDFFXreK/lGyMJMimNWikEQyD4p0jeV9dIOcGzt
	3u1YNtz/DdW9FEhTFfQ6aXNsbZHankEsmDgCZFS3JEhJSlogyPpniuAZYrxAl519
	9qaxTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcehqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so446275085a.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835058; x=1795439858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=;
        b=C1j4SVyK6I+lkDT5Iptyr3hM2krOGO3V/fV4Q6KQbTfuMACYbnNkcqG+msRolXeBj1
         A/HagduVx2RzUdP889i1eKvNb18QFQcETft5q7PourAf+sxdTBjgAivaWR4JDfRrO58C
         X6BRKsZU42Icw1diLrWdvExg7RvZhrzXEGmXaIzITCyvyJTMNMSJPOP8U4JE37KLZ9+6
         2f6vZJnDuI6eKCpqIssCxeaeAl+4wGDzhivFBGAXFO84fjLsSqbYVmYq6ZhLG2hn/qQW
         rXxH5i3OfBWgzsTE4pugBQ1eLhvdB2ECvsTBxuJeqq1B81EWx9y1pgNrd2k/ASLGgfhL
         Xbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835058; x=1795439858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=;
        b=STh3V2TkhNQxMNH87zSsolWrXwxll2+Iq6z6Lf1pySy5GYEX0rjUZblS7LXUoqSKYi
         wQoSkssgmjtGT9qeIMDxellyu8c/Gr1WIzqr5vw1yS8WKqueOx/8zra71Vb0zaqPny0D
         0H82t3jA0j9JQS0K9PEB2dj0+VdrQ6UCKpoo70pdYrjeF5yjhjtHikb9EtRihZissQgc
         E3yPMT7ZjiadzmfmFbfGxinFaalKF2fOTDzPif+nzZsMFW+6H7RYJaammaZ+ZiZGasoz
         ROUpgXK6QP9g5tT8+k5De6BBxEx9i2BS7DWoBuE9V48GSA8hd+/i/Nrzd83cPKQeylNC
         X+1w==
X-Forwarded-Encrypted: i=1; AL+hErEs54fCrIYPvqR3ze0IEQeexGZwWbDKEgw2r3vFFHpfhP9Fh6jSFO8qIZWkpz3Y47YJZboxRN+UeFO8@vger.kernel.org
X-Gm-Message-State: APuU4Z9whVqdqsyY9zPkA5Wy9j51LDgORKwi1U8HarfEqnE/XEISsfJO
	Tx6Hq3TwBCF4DbGGS7eoRV+u6XAZKFjgo21oByvFcuQmmyjx52nYWjTL/63DTc9JEs38/u5xyoB
	zn3LDP65ZZtQFzzQpH/rtD78FVVcI9lKit6UOoCN2IOmXnLBUkWXTbebXN6OQNkcy
X-Gm-Gg: AYBFou2hrHbb3+KXHbn3vCYOXKnDrHnAYu24zYqDF47gQCww4lNYy8lIzGnqWgobmCp
	9MQmQ7/NAU7ViUKa6VnSqHjpwOTDXqT47tY/cx0yX606Ho86VvGQXs1nB8dLEWthOyfC4DAl6m5
	AcLSpr6IR7ibT2LcmN+wZI53eV48wFo+zFAy/lP6GpDu7w+xjD32mQLt0jtxFDw1qnfwu3mr7nm
	HbitOkoeFG5wpvN2rjb9MGvmSyGbxH8LE4TgNV6Z1KyEzOnsNdOKzGXFzDSN0n6cpkn/COOfIPW
	l7ednvMWzEkvIpRxopWDQpN2sh/5jPTVdjoa4ja5b8vdmJ7n0KSs2y+Hn9aOs9G+m4OdKz/0YtK
	c8WJp4W4hyl70zHODazldx9K/x/eae5IJVQ5wVHAh0Bog/gV72yEf8u5QCTX5LjBzecf0cmVwTQ
	t2
X-Received: by 2002:a05:620a:2a06:b0:93b:d7a3:45cf with SMTP id af79cd13be357-9494bba04cbmr1720761085a.56.1794835057566;
        Mon, 16 Nov 2026 05:17:37 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:93b:d7a3:45cf with SMTP id af79cd13be357-9494bba04cbmr1720754585a.56.1794835056872;
        Mon, 16 Nov 2026 05:17:36 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:36 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:42 +0530
Subject: [PATCH v3 03/11] dt-bindings: display/msm: Document Nord MDSS
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
Message-Id: <20261116-nord-drv-dt-v3-3-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=14471;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=PIhvMharehcV8F2KI7CYEOsm1wLJbNBmm8ONnPnEAf4=;
 b=7Xmd1Rnw6dvQHQLx6rhBQ3vTvUB4i4t3RV3tubSMzH8sci//Vl8/48sFJWEPFmCmdAN82Sq4h
 +/wB9UyVJDfB4AWUkCBsSpoTP+Vnsjlqyz7/34zJEDVUh88933m0HCS
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX+B8wu1Hq5jXb
 Kkg64Bu5v5bZip4C8qY1EjR+tZhrDqU5PUW1Z8pdglMdIG9QA9PDbw960Q3IPERQPbdipoE1NWX
 v6SpYZL/pTPE8pagIAZwNwH1OrGkN5Q=
X-Proofpoint-ORIG-GUID: AKlc1qfUtTptRJzVdiQbw_RHYn_j1OIr
X-Proofpoint-GUID: AKlc1qfUtTptRJzVdiQbw_RHYn_j1OIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX0Ehu0iBubj32
 O5F4KNJ07qJ9Y6854U2qQ7OGk3PramJRsUWsreekPuj0UyN5Mj7M43BmaHrMkbvjVTvnPNBarNF
 +HfLCbZMHioWLUBEzvVYkaQk5AIVvnyQ+4pZwo1lbIFxnV1WAGNZxJVJPEpYJqpQ7iVte9T9Klv
 g3ejXfeR05+GUOPRErobfdlt/Tq1+jwA9StyAeqzMpD2x5lsPIbh3CF+1NEMPlQUWnPqiVOIXVc
 V8ewx68aNCA4QHhJT5PdR/g5bbn863DIcMopAf6GbR09lmXzC6RbTUT5LDBM71B+opuv7XpLQSA
 mQH/oekvqSOe0ZwXiflwcdIjEaD1lbYbDMS7arXsf0+QAPHmNWgBcSgIGGUIbGN06DOus3D78iN
 GKgUPnkn/Wr1fjG7r5FHepx9ZHF1XXE6BUD7amRQ3gmPBNlRf/Ct8V6WVxdfFPfW/wtcUxkeByY
 iyekfTZFgIYeagW6dzQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afb0272 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7d_QaK0HgB4quCyenD8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord has a new MDSS 12.1 revision with DPU 1499A and two independent,
DP-only display interface controllers (no DSI), which no existing
schema describes. Add a dedicated qcom,nord-mdss binding to document.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++++++++
 1 file changed, 396 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
new file mode 100644
index 000000000000..abd80dae4e7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
@@ -0,0 +1,396 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord display subsystem (MDSS)
+
+maintainers:
+  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
+
+description:
+  Nord display subsystem consists of MDSS (display controller), DPU 1499A
+  (display processing unit), and display interface controllers (DP only, no DSI).
+  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,nord-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
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
+        const: qcom,nord-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,nord-dp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,nord-dp-phy
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-dispcc.h>
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,nord-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+        resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                        <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu_1 0x3e0 0x2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,nord-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x3000>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "nrt_bus", "iface", "lut", "core", "vsync";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf4_out: endpoint {
+                        remote-endpoint = <&mdss_dp1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
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
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+
+                opp-710000000 {
+                    opp-hz = /bits/ 64 <710000000>;
+                    required-opps = <&rpmhpd_opp_turbo_l1>;
+                };
+            };
+        };
+
+        displayport-controller@af54000 {
+            compatible = "qcom,nord-dp";
+
+            reg = <0xaf54000 0x200>,
+                  <0xaf54200 0x200>,
+                  <0xaf55000 0xc00>,
+                  <0xaf56000 0x400>,
+                  <0xaf57000 0x400>,
+                  <0xaf58000 0x400>,
+                  <0xaf59000 0x400>,
+                  <0xaf5a000 0x600>,
+                  <0xaf5b000 0x600>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+            clock-names = "core_iface", "core_aux",
+                          "ctrl_link", "ctrl_link_iface",
+                          "stream_pixel", "stream_1_pixel",
+                          "stream_2_pixel", "stream_3_pixel";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+            assigned-clock-parents = <&dp0_phy 0>,
+                                     <&dp0_phy 1>,
+                                     <&dp0_phy 1>,
+                                     <&dp0_phy 1>,
+                                     <&dp0_phy 1>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            phys = <&dp0_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            #sound-dai-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp0_out: endpoint { };
+                };
+            };
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
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
+        };
+
+        displayport-controller@af5c000 {
+            compatible = "qcom,nord-dp";
+
+            reg = <0xaf5c000 0x200>,
+                  <0xaf5c200 0x200>,
+                  <0xaf5d000 0xc00>,
+                  <0xaf5e000 0x400>,
+                  <0xaf5f000 0x400>,
+                  <0xaf60000 0x400>,
+                  <0xaf61000 0x400>,
+                  <0xaf62000 0x600>,
+                  <0xaf63000 0x600>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+            clock-names = "core_iface", "core_aux",
+                          "ctrl_link", "ctrl_link_iface",
+                          "stream_pixel", "stream_1_pixel",
+                          "stream_2_pixel", "stream_3_pixel";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+            assigned-clock-parents = <&dp1_phy 0>,
+                                     <&dp1_phy 1>,
+                                     <&dp1_phy 1>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <13>;
+
+            phys = <&dp1_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&dp1_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            #sound-dai-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp1_in: endpoint {
+                        remote-endpoint = <&dpu_intf4_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp1_out: endpoint { };
+                };
+            };
+
+            dp1_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
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
+        };
+
+        dp0_phy: phy@fc3a00 {
+            compatible = "qcom,nord-dp-phy";
+
+            reg = <0xfc3a00 0x1d0>,
+                  <0xfc3200 0x128>,
+                  <0xfc3600 0x128>,
+                  <0xfc3000 0x200>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
+            clock-names = "aux", "cfg_ahb", "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            power-domains = <&rpmhpd RPMHPD_MX>;
+        };
+
+        dp1_phy: phy@fc6a00 {
+            compatible = "qcom,nord-dp-phy";
+
+            reg = <0xfc6a00 0x200>,
+                  <0xfc6200 0xd0>,
+                  <0xfc6600 0xd0>,
+                  <0xfc6000 0x1c8>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
+            clock-names = "aux", "cfg_ahb", "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            power-domains = <&rpmhpd RPMHPD_MX>;
+        };
+    };

-- 
2.34.1

