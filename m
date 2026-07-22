Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911F35203E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717828; cv=none; b=LVMGN21vJZUbb9UdqYpQSN5ECL6TlB21fnT6ffxpq6XevD+otDuR6yUSg+P58Zn4dsZO4v5MStfaUmhipat+wKIpOGFlSoqUyge3drfIWWzavzrV9zyW6/Zj6O4uKc62iNiHFltGl0yRH40rXMjRiGUD/kITqIg//UEQg9bTWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717828; c=relaxed/simple;
	bh=HLDNHMkeRHSbz22zFYyaBoStA7/BA5Gmi8S/43s0xwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhB8tVObeOqpzyhIWUlJ56mtIptDgoHJhEmRjyM+VlE1HRtMygzCAXnAseXFQ++lc0+VY6z6eiaoFQTg8fD9r0x7z2z1YR/IxyuEW5ESfaNwOtEK7de8jkn/QvHb8aoC0+Pao8CsDcW7ycDXE2GM+ZlUumqLPeZrJPheYKgIMUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km2cGbJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTCWVxXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km2cGbJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTCWVxXN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x79j401183
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/QePOBmPnRol9R9DnitCpLwEaauF3mRCy3iF3hD26E=; b=Km2cGbJ3U44rvWHT
	pYsDCxtnRQiaFlKfb1n10k6XlQ6tyb3BmV0N5Esqw60iRueaRfCEX8Ey0ngL4waO
	Rrus0Ot58JCdFXzshQPel8c0dpJlhGWqkRrC40uUyXyzrMcrVgZdS8aq4euQizVi
	3IJa+hhh9STuomeQav1pt1W0x7DKNlpSGHNCD2fdAnFCgclpoTpYSPoWHbqJ2VGr
	U94E2afVCi42tQecXqYCiJdWN6eIzuA/0pQZrS5Mq2XS2Us1Bfvq99ngobTYbfzv
	cJ1U6hlgwsQLsUoMZYGRduwvgGOD5aWGWicz2D5NYYPMLYRzNpgAFnf0RLq6+rJ1
	4ppOpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt798mr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:57:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso195699501cf.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717822; x=1785322622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/QePOBmPnRol9R9DnitCpLwEaauF3mRCy3iF3hD26E=;
        b=BTCWVxXN7nQAzL3AlfgJegkDQ5Y/z7scEMH0kOCCneN843dAFYMIOE0vQp9ysF6Cam
         7TnyzbiDXPzfxPZh4syJBTibWz26J/YSCz+N1DDfS7vUcM0LJQoJsw5z5DJR7B1HMqTR
         U9Z1DBus5mYxUInyZcfuW8MS4Mhk7a8TpJOuMmH9xfVUP3gv7jV4UcKyZsRdebvLSJBV
         2/vcg84cKHgrkBdS0J6lynLYy6yzfHcGflQu8jRAPjrB44RS1ooZI6zjs8av9i8jV2aS
         047p1n9Gvl51KwFDKxx900qvubX4gtmlhFazaPl+hy1+oqCZhIibTUjD2lzoPPpwrpdh
         HlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717822; x=1785322622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/QePOBmPnRol9R9DnitCpLwEaauF3mRCy3iF3hD26E=;
        b=e/QucxtXLBwT80Xwnci87jXGEwRGTw5sczECRg7xQA3c0GI0eUsqs9KF8qW95Grf6q
         67ZSLYnMvdx8AYS4geI6T8n4dxvDEu9iuldbOZXyGrFcccSMYELxf+td9Vz5da+36RZF
         ELDW7XgebrBzf8P8ewmKktC52Eq2fglYq7o5Fr8X/Upnxz/kvcEFdxPORUWXbU3fq7E6
         AXOknQX9hQgwjvrCJIOMMr0CxnM+uTfKUNTMSKH0glKuhnmY42BsiB0v4lWdo+pH0V3T
         S+tIwoY+KLf7IcF8n4iPSWSRNgKciqUNUKqFDohiSUZyCo98TGyxeRS6CIblO5b9Wijr
         mFbw==
X-Forwarded-Encrypted: i=1; AHgh+RrTM3jcfz+oV/a74pgjpURBW7QUteXdFUM3KsnG4cbpL6RLL1Vv9yJG8r4OxuIDmfvahQjAV5n3FiLK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGlYMCxpwrs5vENZjZfSK/WjPyGCL5RXlUF+QZ9K1q7Cafn7o
	XfKvjKko4n5XbwvUs7v9qZvfXUzmbbxjOClgBit33GF6McuAZUea8eB8ePXrfIYQSTInPzfrPxY
	L4mByDAXMsCOI/gJKt1nJPS+L+pULIhhC9C3r6E3gLp7OCm6xbinu2rPbl0QT5tx6
X-Gm-Gg: AR+sD1001truA0Kkb7GtLwy6otP8xKOjOsfjU9b/jKWgWUyi12+OBRPIdZDa+ANtKPM
	YIgQBMFTQBb61H57X2VGZQFKmP1olOe38Br2yDmicmHZB0xA5YWoOjLo+uig5oQomgiB5wXC15O
	zVYW1pJYxzIM0LONP/bT2C9F5+sqGue8/VSC0L7gHONI2Ik8N9KEFA3Bk4kqryAYbO3exfV/lx5
	jk9EOYSrPCDF/Gc5HR6jeF8+c/PxYzBko1Nrv+6k8jV7epcdRb37vaCReBhOMDwDeAGM/twa7VO
	LSielLaH70X5E+ZqFQXaBqNw72MzUoYPy2M4945p2EXkRUZelfyxMlVzh9Hk0dmyeSEhVK2AUj9
	/sNCmr8S3
X-Received: by 2002:a05:622a:13cd:b0:517:7d9a:a88 with SMTP id d75a77b69052e-5213cbd8efamr196537521cf.37.1784717822002;
        Wed, 22 Jul 2026 03:57:02 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:517:7d9a:a88 with SMTP id d75a77b69052e-5213cbd8efamr196537211cf.37.1784717821358;
        Wed, 22 Jul 2026 03:57:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0571f5sm36240285e9.4.2026.07.22.03.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:56:48 +0300
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-remoteproc-eliza-cdsp-v4-1-04c6eee70cb1@oss.qualcomm.com>
References: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
In-Reply-To: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HLDNHMkeRHSbz22zFYyaBoStA7/BA5Gmi8S/43s0xwM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYKH1FHiJ97f56zrKR4TZpr/AzKJHcpp4fplXz
 FJK3C6i3NKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCh9QAKCRAbX0TJAJUV
 VkOND/0YEjSjLMdxQYn49emtsbIU4MZZfczO65mSLAL4ijLtvsatKSh9asnKnvdTtIGIHPde8qM
 BnwCGiEvLtXWo9rx2Rwyk3DgbSLs/PoMCTyxfu76z2bKDxBKlOHgZqqA2bBmCrKSP2qy6ZkyFHH
 LYUZNR8M7Dv+HWKl7d5yzCtce5wjQdy6pi2r+jnaTQpv+2t2PTwjMQxEXJKO1szLJNgcK8G6K3Z
 C6TaTSdmY7bAUPEvKIiO+0VemVsWcBkwPpg7FcbLDLpMJkanwIPcrD1KXEy1Kj00mrkp1W4+rOR
 KhmxEe82kS+MS1xbHwAvhmeJOsnHlA7ERFzUDzwiyRP5bYh0X9p2XYZ6MHmzR2mMTPNFankFN35
 /wP9LwsMa2m4ri0ydyeSKLhYgB02flzSMIoBt+OkBgImY3vjwAq+Uq7dm2JtQevfXLYoR/Dj6PP
 /U2ND8XEkbJUAcgF366hp27WsjsGXfmjd34gr0L5SM8g/DKtLf5CxA62A5Rscl+bdiuRPOMcBJC
 B4svimySmrms5EFxZevmCLzZpfZAf+xbDFzdhcusZr3P+i4yU+gpd6eWidX2VGb2MMtYdJSOQzP
 qm3srGb6FY5FKGJI7qfrUpgS8WTrVBuUvvc4JfaxzIBfHsf7v37L5E/gOKtBOfDbWqozdHIKlqj
 F79AnxM3rNSs3JA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60a1fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ovmeWcPxak0IfAIrAdcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Ahdp-2HrlDWIFd9rBPq8Df8J8dJ56MTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX62xsrrN3h+H6
 94VDPVGtajOptjSbW+vNfW/qH+6Dns7CFCBCx8JhJluUBvIlYZiFhEVv0L/ZQUkc2K+wBoRfCmp
 D4ZenjzjLA9pgc5zMSHQkl76102172dfaKoZUg0INg10EDIho9q7mmjwOkNjLGYaaNod+nHHxm2
 Rtp9BQ+8tAFmhZL1WLwj9zhWqtLjR9kGaNaQXsBFijHc10pqvNRbR/pvxkqPRmAm+D+G1q2i017
 aaY0K4VOFDed6P+h6IcC/vbo/X8jVic0xdm4Db9JoXnJnflMWVSYZQW5/Xp1TLaE6r2VlFVcH88
 ydQSM8mVucvwzS/L0mOLhUWOpDPEuDiqv4o9g5m/icDHOZKR2P2GUOT67d+grzvEYbrEt35T/Tz
 tphNEKJ9Ub6EA9d/PSapTlpvwjWxe1XKpTc4me6ufkKkawoczyidDy1B9y90HHOr8NVB76wv9bO
 3gjXdBb/5nudMiTQsjg==
X-Proofpoint-GUID: Ahdp-2HrlDWIFd9rBPq8Df8J8dJ56MTk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX9Lwq9IxqRVu2
 bnZGRwZz3eXukgjbl/DkQG5GGYDoTvCO5J33o0Dsvtx6kDmMYt/eI2pOQxBiRHQcZAVQ3FlHtgk
 ljtCoMfVHOiUGH7O6E0/TnCx3tQX1Nc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106

Document compatible string for the CDSP Peripheral Authentication Service
on the Eliza SoC. It is not compatible with any other.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 019db91be7fd..5492a88bb100 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -173,6 +174,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cdsp-pas
               - qcom,sm8750-cdsp-pas
     then:
       properties:
@@ -288,6 +290,25 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
 unevaluatedProperties: false
 
 examples:

-- 
2.54.0

