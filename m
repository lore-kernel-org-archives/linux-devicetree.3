Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405272617
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775540410; cv=none; b=CkusJH7Kx4VrSPgJ1SAE1Z2RN4rAmkgsyBp8eflAOb2WsEKUQL2bShFJKlG+6N6qMtc0HDxQEgmvUrTCRfgAX8Y8TStHIJvwSs+kJMoMK94PQrE2n9GLrf3i9zCHZOssZAv8WdcPAKhYSgBy9gXaFeumG5Pbmb3mZC727oriVGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775540410; c=relaxed/simple;
	bh=vxzu1BItgDG+upVzuIGSwS+AnHAB1gz4KUgcXze+JR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsV3WzyD3dS8SuYeH3R+CyIQUI5IIm7/vUfBsRtfvW7Z5ZYdekInPnnr42SR3ETsVF+t0J0m2+jk0VcUO1GkkyZDJ9nliLx5mST7+yWWZnaJjooG4UfUbH8Ky2xFY5KYSQYk/A66Fwo4RQjcCYRUycVwXsT4cSOi9Wx/PvV509w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AobkrJNr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYwI16/U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AobkrJNr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYwI16/U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ7RW3536841
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 05:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RbjEEvlADdmXHSdeRe1aD+KWqgQivbL4+PD
	39XXNeow=; b=AobkrJNrNnC2K3VbPa3H4hDT4F/vv3SCMjV2KXYAttoXfaoLuyB
	b716soX0rn8p0pXkzU0gkmb9gPrX1zHy4guRb4Sg5Xu+Idx6c6HV+2lrozuXUWSp
	1dfSx+J19305apmtzCs2CgepndCa2DX3aotkGvY1OYFw9KkezZFl6FLJDZj1XX2e
	xuF4gZgCqHMOUgbgic2QeMttIuPDd9CgUrGedR3NwXY0gVmk8+uizrbGgw7yNA6B
	kUFmvTUWGmGx1ZLap4eWXyEu64pkVWRwFbHhm1yZ7W7OadaFt3E6/Gf9yqfk7itH
	WlOSmq2tpOQW5YM2Iu4/aoJEiH3/HQORUAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra17b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:40:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so91057771cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775540407; x=1776145207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbjEEvlADdmXHSdeRe1aD+KWqgQivbL4+PD39XXNeow=;
        b=jYwI16/UkI/xaua+OdAbUo+/eZDvvRpHHDKK3vh1QTXG3coT17/3UCsMqOIXcNhxc+
         X1YAl5Ct2S4bKH5fBKDzrLBl1nA2GLPVoKMXLdk34d2QGR4fxT+eIugT2WanNYDHw9Fa
         kvXWBPnQypB8uJPLuoIbs5M0M+cGJRhMpy1j6tE5g0I70eL3jAoMDCYo1rRfDU370tnD
         lq9CFfog1shTDRSaOjI9xpKCCevCquYnfjy4FV+leIwTanbGpuUTzBYu3GfN+dS8lj3j
         sY9D8qb3evhUfhn0mixYqnfutw2KnGXxyrXZGcqF92/EvQ+keaQHpwkN1QF1KqXZ04uA
         E4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775540407; x=1776145207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbjEEvlADdmXHSdeRe1aD+KWqgQivbL4+PD39XXNeow=;
        b=UxHwjYh9se+yaJuqnTXvdfYfs6gsaRHFDNft4kkWxqWp9jRHO+wNxsOmv2z363kAqe
         s62tXUAL7pN7q+Nn7wjjv0kc7u8ngQwJq5x8Y1bVRm7eotp8L3VOaG1YuRm6nDrkrW18
         V2hrhZySECIrn+TplLab1xAD5mvDUOU0qMLW3YUAuzdmKT9kykHtJF9ozCz1gQW+4mJ3
         sKk9Hsk0ahtbaHFkb5o92w7dyrUKyCgG3L5MsuBMtKdUGrTHACxoAwVy0nk+5t1eNpfQ
         UOM5Eios27OBp1EGkGXMBu43M8qdM8jxg4DHq1aTlecxJbV06I9SyvSq4x7X6UNWtq8i
         /Gng==
X-Forwarded-Encrypted: i=1; AJvYcCXobWJBjmdL9yyhHxX5zTa0zGGbaINCl/PKf4OIRphj7pQt9ySnJzNFZVEiSwzR4/ZihGH0CTnrFxgH@vger.kernel.org
X-Gm-Message-State: AOJu0YzNG7i/txl61SiO5GHhD777YOmKVz7AsTnR/6WRMuDCIuNLwwtw
	n+5iIa363l0hTCMXgovPvFrj49pVTQPs/Z3vruknORwI9P2QmEVZhvObPGnLY8u4wOcrPH/AGtY
	jDlkwnN8x+xo2Sapi3hBfq2SLU+0FxJeNhmseYGle3JJvZYyIxqZO16qQ2usiSVp9
X-Gm-Gg: AeBDieveW+NWLyehygLGl0LiLpDK+lPr3h8xvG+DB46vdh2KjZEijFfebStP1MnOdGy
	iEZ81ZRQy6R+opo5D8v8WJ0wFzmj3QfFU79Gd48UqUKMoiQUsin/ch/GuMXlf/ZZXAIN+pIBYUT
	xdhghzPCl52nHdDRhflAMw0N75CmC479kxXYbMVqvVQ06C2r7tLEz0gkbYmlt3uD/wHrhxRhpKx
	p03A6mrJ5R7nWZ/e+adcMSBCSu/b61LR1/R/axgxflSuWXxPuUIkRR2mFyH2VvhA0GzCcu8ckGy
	UHqul6VYGUM0UJDBQ72eJF75v4vIRteMepahcDEfiaP9h0Vd3ByPssu1K3/NOyydSlPqxxwTnOU
	57GPFD8sfJSHpcOKXlT0VyRMfrW93YJqtabJT
X-Received: by 2002:a05:622a:1a85:b0:509:144a:43bd with SMTP id d75a77b69052e-50d4fa36996mr225853241cf.3.1775540407458;
        Mon, 06 Apr 2026 22:40:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:509:144a:43bd with SMTP id d75a77b69052e-50d4fa36996mr225852961cf.3.1775540407015;
        Mon, 06 Apr 2026 22:40:07 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm729034045e9.15.2026.04.06.22.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:40:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: thermal: idle: Complete the example code
Date: Tue,  7 Apr 2026 07:39:58 +0200
Message-ID: <20260407053957.10508-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vxzu1BItgDG+upVzuIGSwS+AnHAB1gz4KUgcXze+JR8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1JitM9m6FmCdpAl4tcyldC4e9XDYxF8e9uh4T
 CDQd5CJPZeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadSYrQAKCRDBN2bmhouD
 10o3D/wNEADz1F2K/i7fliKkKHuyOoNf96ZScskYc4LQv6YZcqrrby7nqR4GG6lFyf/4kBXMHEB
 tuTws2RILwOsBnZQh4UlEBIvsU8udXgWLo5R/lyC8UFkuSlMBFPshqVkXSdc3dfKMCBhSYZAAXE
 TOK+1e5Qq1NZQh1n1cYPnmi/Len8TrVTakEORgoWf1lSEQH3AXRAT9eWKC3XS/CsR8Qmnl75plA
 DaPupbhXXXI3YLhW+tTTblyBbzzjZlSAk3/TGZVnNl68Nj6D+LwnHDffHVp5QdGEyw8DodIwpRD
 31fjTy7MLRDL/5d3YvrUP/WqPD1vOLSfaf7hb7UL4nfb6hAdkeegln+/GetYvaMf9fkNY7NW59H
 2plsLF4Qc3Zfg+HCS6WadWKci8t2UIy6Z46IzVp2FiFa05BVDKrjhLkIdCsLZVGLNxA8ay4iDLh
 yKxfrq9fUltouxME3dritqhzMV/NY2aEmoh4rdHoMrnCW1d4xDRwCk4eB7oUjZY2RbcpiWhHTBo
 +MMoK+aRCQ/QxnOYod21ztCLXtmTpod6U+a2VzQJdVPRINRK1flwvFM5cHBt2Fc8VCHSvkh/fhU
 B5Z0KWEaIRwRFEl3weHXdj9Bz7qpEWGESCO3ddAR8teegE++2u3n4nL+Mfczp6SKEdZM9sbzV9q iSwDzrb32XOE2Yw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kpTtJHS9Xx9Xjsly5U3jGELPl7kbmMGc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA1MSBTYWx0ZWRfX5ZFma1Dgi9x0
 oy+KaXlTZ88Y6ADpgXsMmZaoliVF6UqQlj9jmCkht5sFruZlJsQB6yB2TNMdOFCKQQr8OnDPMoy
 X0ufKzpnH6XpiBP0VgfKevJCkN0gvniTc3W/u0ZVWUequhXG6TfKTezlYsCXmZXb6TPle7oN1Sl
 13or85uYp9R5lKmwt4qRh5hMGX52c9xYaPzDzGdreE6B1jHH0VtgJWZfp18d2LFsu+7+lLJVf2b
 zJXxFzWG3R/CJ4BCrZc1xVdk2S1FIAIWD6BrV9RdrBWwEph+FYvlzuToxIqbVxPvb3Zu/qop5aZ
 Mso3NyHJCsp9YVpdQztGSBSftDcEvfmMLyQVPia1d0lt9GsLgzZ6CJxGLPMAbV1eVrn4GyWmtsW
 XWdQ2kozHhzL522G6VwB1HgsHTCdsaFRAxFAv0nIHif6zu4AAkbffymxTQQAn/1nDS1cL+Vk2a0
 4GNVJrrafhfnNZWP0Rg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d498b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=njFOWPmiop8x3v1vudgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kpTtJHS9Xx9Xjsly5U3jGELPl7kbmMGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070051

Thermal bindings expect the node name with all the zones to be named
'thermal-zones' (hyphen instead of underscore) and thermal zones to end
with '-thermal'.  Also DTS coding style is not to use underscores for
node names.  After using correct names, bindings point warnings for
missing properties, so add also thermal-sensors.  Drop fake top
compatible as it is not useful in this context.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop top level compatible and other properties
2. Add thermal-sensors
3. Rename also trips and cpu-thermal
---
 .../bindings/thermal/thermal-idle.yaml         | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-idle.yaml b/Documentation/devicetree/bindings/thermal/thermal-idle.yaml
index 1b77d542a7b8..bd420545803f 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-idle.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-idle.yaml
@@ -51,11 +51,6 @@ examples:
     /{
         #include <dt-bindings/thermal/thermal.h>
 
-        compatible = "foo";
-        model = "foo";
-        #address-cells = <1>;
-        #size-cells = <1>;
-
         // Example: Combining idle cooling device on big CPUs with cpufreq cooling device
         cpus {
             #address-cells = <2>;
@@ -101,33 +96,34 @@ examples:
 
         /* ... */
 
-        thermal_zones {
-            cpu_thermal: cpu {
+        thermal-zones {
+            cpu_thermal: cpu-thermal {
                 polling-delay-passive = <100>;
                 polling-delay = <1000>;
+                thermal-sensors = <&tsens0 1>;
 
                 /* ... */
 
                 trips {
-                    cpu_alert0: cpu_alert0 {
+                    cpu_alert0: cpu-alert0 {
                         temperature = <65000>;
                         hysteresis = <2000>;
                         type = "passive";
                     };
 
-                    cpu_alert1: cpu_alert1 {
+                    cpu_alert1: cpu-alert1 {
                         temperature = <70000>;
                         hysteresis = <2000>;
                         type = "passive";
                     };
 
-                    cpu_alert2: cpu_alert2 {
+                    cpu_alert2: cpu-alert2 {
                         temperature = <75000>;
                         hysteresis = <2000>;
                         type = "passive";
                     };
 
-                    cpu_crit: cpu_crit {
+                    cpu_crit: cpu-crit {
                         temperature = <95000>;
                         hysteresis = <2000>;
                         type = "critical";
-- 
2.51.0

