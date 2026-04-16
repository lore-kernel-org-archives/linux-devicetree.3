Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2D39D6D1
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340798; cv=none; b=beuuD2BBbSpyYK3VAU3kfH/uzuIBD23M7z127OylU2dkU8GHNO1l7BxsGjwWNkgf/BMS+piqpOyAfXzpDgUEXIUOFYMyYM4UMw8D42PLfzdPXK0rNA69Q6ub3CJQHaFaxXNB4CFEWs9tOyUBMkxEYBwBcPaAw9zcPPVGv2kOh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340798; c=relaxed/simple;
	bh=QhcT7I7/aMxwjiRWv+lMSZ9O1nf1QgKhkc5pxVQ9Aic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJjfLJ1D9kSVj7YYHy7LCf/2Bt78paR5yNxeuJZ/nEwcjrqGnQHupTeyrp9WtOrjh88n1mYzrifmatuL8F7e523oydftmm+wbssFJl8IDmd/qI/mCtpZfDnmQB/Bdq70SwRXXEpTepGP0EQF8dTOIIKlii0mzBAOLkOzIv7EAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI3jzBu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYWVNDtR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI3jzBu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYWVNDtR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6JPZM1668243
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHpvbENcsLtgvr2XEbf0CXHSig5EkRvJvVRMbKysza0=; b=XI3jzBu2q+89hWn2
	du21tHY8EWhr4GTFPD/rSiV/f8y8pMwMQDvpcX/R+HZ1QYoCLWsWU1x2HCT4Xc78
	VHrlUwTcQZflGeHOZ7vhkYASfig29q1DM7j4OyPaOGoanQLgCMYEpmcEeJhpeO3t
	9Zr1t6GxHrfwDNhLDTpokQh48qRUCEvJYNe5a/PCvLInoK+kEIzKoInHwbm30bwj
	VtAZV4lFyl7MjTOMeZTOGrI6XfLVkIyyZSLsXIm6Fum6C6PfmDN5XhRESHu1SGYp
	P3UwbLD5MiU6OArmTVlRJWYUW5FhF59lx+KqaSfCSAN8Lcc8M/J3S9GEE2AWkZJe
	Gqy2Mg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd9170q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:59:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c795e0001ffso853609a12.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340795; x=1776945595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHpvbENcsLtgvr2XEbf0CXHSig5EkRvJvVRMbKysza0=;
        b=TYWVNDtRzlaznz4V8RoqWOMpbC7/dgQcbyzMp7a1gDVCwcM2QM74hW0p8FjOADzrWX
         MELeqKNA+MXJ22iglpyqULCdfdTuoP3s7ctTkKO1DfSniWyG8eu6t30oeiOIJQqZ5DYo
         fYPJdALg/R/pkQBkAhpHc8AhglvsP1p+qveNzXq89KyazWteC3kp2CjvYk+HlTsobirt
         a59mdt2DNAydy3rgQaVdClcbB/Lm2XOSlf0xj61pcU92otYCufbjreS3SqscxfKACOxk
         6rGvfaQFmKaXWxYV4iLDqMKJflGOo80PHjmPKtvE4Nnt+vLAE+E7tYLI9ozR2oA6a22u
         YhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340795; x=1776945595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHpvbENcsLtgvr2XEbf0CXHSig5EkRvJvVRMbKysza0=;
        b=QYwEFhKZ9zKN5J2waoqvPl0ZIIl/mM9ptTJJxp7dyshJu7L71t+Kc6Q9WPn3qeuUSO
         5fGekVXGCDdABvW0rMQxej3IuOwdLv5sfhsCssX0Rkwofw42dmnpBOx1VVOdf8Oj8YaA
         cmgNMfUbdsE06CxX7uF3RegG1gU6y45qaUtTw5SRQlc2BRPHUiQoYVcphlSjfUaZYEVi
         Fk92UA7CRufzXsSN+4osb7KQcgNAy1pwo6Bb70o7sHosXlrs/n2RufJvpyyqQzlC3Wrx
         RIM2ggeCbmeap7paqmuJ6tMk/IDi3wUTbyep4Ri7xuLhae+44MQFybX0IHNEXQf0mYK2
         X3sA==
X-Forwarded-Encrypted: i=1; AFNElJ8ieAB/AVuIlKAOlVVXZVQWQGVSwRedxlawJ4Ln3dIWj9nvD/32L8dA2lOdsGIyb3inXy1ujCzI28GP@vger.kernel.org
X-Gm-Message-State: AOJu0YwhY27g06FTV9MUEX0Y6G08hsrv8ap+/9Fx/24mQFVzTUWOGF/X
	GmPv52Tq0f6CdTip5L0G/MekRioO9Jbr1NZxNOr+Z3ZpBb9g9ALKsSlbvrQq2jw1lSXarBjyh8h
	iYUBacJUbukUMoQWHKyzx2T8WPv4Sl2gPaI3BNPVJ/XlSPTOjdoCTJJ9QJ9Ddcufm
X-Gm-Gg: AeBDietWUPxk6QkIslvfRWhqCyRVqWUsuN1bf9mwF+pr/SoZ80+ZLGTPlpyu44xdz3J
	ciEce4DTwinji4S9f91/IE3a7rlecNPOyo+pNRuWxlmZGwgw4AEJd3R0OgXzSo3F4M/gW2r6ziL
	KVYvt4Q3i7xqJoNF+4QGHmT30aIl+oUlQn3BGrZSt0JbiytpjlKiTmrx1NO1kworlPM/4JzizOo
	Z0kuVvsGa3Sn+Y1eF4CwTyawu+IBz9acvyQa4c8b8xdiDTKlfptsX68MFPIN4HVi4ux8Th33Pmv
	DE7WA9sPzLMGXj6+l1KtY5Fs5c00Kf9fSC9tJ3TW84Hl/r9Poc5DCwMAEKaXCLqxyVH0ZpV/r2q
	C16uN/uXGLs+/yYmv38RUAceh75hEp4zt7XWwmnJIDXXpYhTpm4APhcK9gQ==
X-Received: by 2002:a05:6a00:4601:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f0c12fe20mr25366138b3a.11.1776340794511;
        Thu, 16 Apr 2026 04:59:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4601:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f0c12fe20mr25366111b3a.11.1776340793904;
        Thu, 16 Apr 2026 04:59:53 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:59:53 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:18 +0530
Subject: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=2738;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=QhcT7I7/aMxwjiRWv+lMSZ9O1nf1QgKhkc5pxVQ9Aic=;
 b=8WzfBJpvJinzib77N/gNAbcdq+bEhlbv3p4u0qPurYA2X0X4j/xA+ShU0KRMJ3dQbjWIb2Of6
 872NP3H6/gZBorI42sR5SNkpiXqtnQtO5K9jW+tWcUVv5XQK/waTlSr
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX8Vb91CTK8UlH
 dw1lXtnAb8YO885DhNFTxEcyq1etdj7mqwwBedFnRbHRW/cFpXqKOcNxe/tbo1xrltQnDzoeY5Z
 SAQwjwWQ5+GO4aQ6tKKW0WiFvaJyEXb81UIVRWxfJ0k1kNSQlg95GCmmsFvDhJAx+9oZlojXrkv
 BsqYHVgGJwBlLRPzYXXgLhutOLx8txBbUCUR0BkJw36NBYOgCJFACxYFFCD7aX39X1HVMLRlaKM
 bhAIthBmDR84hgQH7BU67J2IswZ7nFdZ3hB9rArGOnqw1Ghd4wIqHErz9KQCU1ESidnGRHa1HKM
 zD+aRQ/5DsG7zQlaKn1aM48HGTLdhBXJ0uPjeVLfYUmoD21M82/VH7BMPp328GZHGMrgnPW6e/9
 mEZ2c1mdmvxnk7j1XpnAaOu9LgdQ+kB5+phi1ICY3pb/EMZlpYyqET4NCP0JAZ4Z0SRChxoKV8o
 t1rXyPoR8MGEucT7CDA==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0cf3b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nlf9mDh_Z9TmLa7YYksA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: MB2cCIdaNe6JDLrZLzkxMM2ZlfHYhUYz
X-Proofpoint-ORIG-GUID: MB2cCIdaNe6JDLrZLzkxMM2ZlfHYhUYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113

The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
power-domain and iface clock. Without enabling the iface clock and the
associated power-domain the ICE hardware cannot function correctly and
leads to unclocked hardware accesses being observed during probe.

Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
power-domain and iface clock for new devices (Eliza and Milos) introduced
in the current release (7.1) with yet-to-stabilize ABI, while preserving
backward compatibility for older devices.

Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..ccb6b8dd8e11 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -30,6 +30,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: iface
+
+  power-domains:
     maxItems: 1
 
   operating-points-v2: true
@@ -44,6 +54,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-inline-crypto-engine
+              - qcom,milos-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>
@@ -52,7 +81,11 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "core",
+                    "iface";
+      power-domains = <&gcc UFS_PHY_GDSC>;
 
       operating-points-v2 = <&ice_opp_table>;
 

-- 
2.34.1

