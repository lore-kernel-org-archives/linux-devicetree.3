Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5D352014
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740112; cv=none; b=R01qnpxGXJG6aFhbmuzllfUat3T/7oTpyzCfl9DOETVYx90k9TNcbTwACLa9tXCSGppajB2CZA7uDJ7ACOf9HJ3JvHaYqub+0QAO7N6q3suKpVnvWOaodMJHVn4FYLaUQdL0t7Wmrw5vDu50Ld64X3uN7z5TmSBX9CVwmzwCowk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740112; c=relaxed/simple;
	bh=zly4axDacz2KGW2LsJekH3WMI/9q2D/SHxkeinrzjb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzSAwrxVC80Gkf+A4gdGbjf99JRLsMGQDWagJoE/gDmIFmcSLZ1TMf8nLeKm0c4TtNK5TBMeeVP7DQBtcsLVukNSct72i79baDgYMUVcc2i1Wdq7PD9Qz2C4+RKGXLYiyvVc2rQX1kplO2L0nJ7qp/QMcrGamRqJeCgC3gO17J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWIcFXuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSZV35b/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWIcFXuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSZV35b/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHrT33649651
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ei/zFpRu6EC
	G2rPyMqVUbWpIsWo9Nc4YtRl8jEgHM84=; b=GWIcFXuZaEH3gZFvYCpVTrymd3Y
	iTKsxZPfE631//3PkEPUvqBX/8Q0zN39o3gZE/+dgtsfLSz80vOyAsdh83Y+QkHI
	Qlo8QIAKXhAKVxm5IdRKZRt3Bl4hL3GylWt9Pa/mpLP8rfp0+/UilLd/Tt7gFPxa
	rOs5/pxVmbkG++QOYHYV88LKYGQe8y9kXGir0VziHo4CHkCaU2/lKKfVtYM50vtl
	9SaNt/SQWt4XQUJ5kJSkfmP+XqrTFGob2GnmU5hWu8lbqe0O9lYMxIj22Mhxtde1
	Jt33dXydrfTEgRoUa5q2C8TBL5U5Ep32mwc289RJPszFqOvSipGBG8zxSBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrpc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:28:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfe48ca1efso13729425ad.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740108; x=1788344908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei/zFpRu6ECG2rPyMqVUbWpIsWo9Nc4YtRl8jEgHM84=;
        b=QSZV35b/3o1nwk1D0tP981Bx5HncUpoaJM+WsWlVtra6kt2f5tKAnJ5hQz/0GYjaY0
         gif28uy+jywgovrWHS5YiTFbgSMPxZu1iKSNCX9Lf6it/yrlFvFqESY4KD5iIeEFrmDN
         T3LAK1TXnAfGRH4GxZ8mVYqI0Fluo7/Ty1MRzMv8MB2dHim1DnLD6eKZc+5DgzKp763M
         4IlWLm7JMBgf/K4S4mraR4g6uk9i19PGflRFcgYq0N0qyCGH3HgjGAGtjNTEohZ0R39g
         YaVKLEQe+lEfWwHM8yuklJ6/as7mUvRqVJcPpcLQyjgP5Cnlh65T0/d2fJvcQksOmkNV
         dnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740108; x=1788344908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ei/zFpRu6ECG2rPyMqVUbWpIsWo9Nc4YtRl8jEgHM84=;
        b=JUcXzteW/zRe8/lInV1O4bwe8tUs8dIFxlowo6qrdKqbGjL3f/zawunnHvmim+8MPY
         PVMoqbOUPbkyZTZIDQpxGTd7wUfYyCuVSr5Sl45L2yWSK5RS9LugxxoALT1Djbv04Am8
         9f0m/Vaz3VMPr/e4gsDfnsziTe2Um/qZZ7vLMgVwTgP3z5CJLjt9KTnRPxaiKjYuWlSn
         kZRFRvoVNL8SKvQiuEf47UQm2h1102moYpxfkz/4Rc+/3LZutBLckd+12jm6C78OEhhG
         /mIChdj7uduy46HdN1F3M7mVlzaN1FhABWSMvB/Cu1ECwYlumgk/NV002StxYKYIMGWX
         BR2g==
X-Forwarded-Encrypted: i=1; AHgh+Rq8MJMQL1zVn+AlHbE7kPRwcegDGwInrEYQZepahPmnEKdW2/nQMVr2HEUHBjqxNdVNnSTbMQDziaFJ@vger.kernel.org
X-Gm-Message-State: AFuF++kpjx6XOYHqTjkNYcsbBnLQyRfGgMNEv8KtET8Y3TvgeKvld6x+
	LGQMb+tVjzmYjX4DRQYev8G3SeU0TWD0I6sKf+JLDP+OE6swxP60jbku5eBFyhSKH5vDTjNAwoj
	JTTEwXx1tDLwcJVHa7te57NOfeCVH5DwRucYgJrqLQ1w+oJfUh11EB/M4UrKW/E10
X-Gm-Gg: AR+sD11jma8tDYwjyKQ4op1fsiHxiLJJFYfWr/IHR5GAit/6aZXbRk+1qwfCil/i2zi
	CDyfJQff3LPQdJGXCN1OA6tol3yPjsnxQ/R1NbJ0XlVsDbVRYMjcBBcH+5ukBPTkoUiyukZmiPc
	ykRzb2O3QBLnBQRZu+LQlcIFVuCzqBoNuI5LfrV8BH2Kcs6skF5zHe4mZdGbm1xH6qkSsMsF4CT
	YlNLl8pLt6PxKrJk56aE0AjMwD4TWd98P9p2oNlSPL7N9BDh0ixuxS3CCPozG0Y8ISTI4+BoZ/J
	qdWtVefnzt3/SeRK/IfnizyoO3pQ7fNUvkyLSHAb5St+QvSDlrCjfNYUA3Y8RQCgO4L4X3wr674
	xbb71oTzMEvMFD3LFWVzyJrlMCGMjc3Bps6M22UhzvJO2RIy3tboO8tVfTZKj
X-Received: by 2002:a17:903:2a8e:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d707b90f2cmr111768455ad.13.1787740108094;
        Wed, 26 Aug 2026 03:28:28 -0700 (PDT)
X-Received: by 2002:a17:903:2a8e:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d707b90f2cmr111767625ad.13.1787740107687;
        Wed, 26 Aug 2026 03:28:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs to NMXC rail
Date: Wed, 26 Aug 2026 18:27:45 +0800
Message-ID: <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ebfcd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MJIzKBglWAtiuGNpmKkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: qw9zR3FXoYa0cxhwjoEZA0lPPLUb78WW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX7LfSmMemORS/
 aLUoOxrcUBK1dLqbXPXjRWDo1tyUaluD/wc0+bThP0o3FwpzprZzoNb+H2Z7mcnS1Ua4J3aTGbw
 eKMP5o7VCHUoEnW5S7tKpUd1iywpTxUrVmhOHKxb9eNFgiA6EshPe9t13Hqdw5c0tOd+bRMU59X
 wkNgnDpGNmjhg2N23Y9HCT+earJ8vGXZzXipxAn/eUDnozFx3LPY/pWh7V06PzwEDnAm/Qxa1DI
 1jfZbSI8TiFnqJPJckIpBURQ7OKlF2A8Gj1h8ss+ZWA7zjva9aZI2yg5tMU1jjCU4ozgB7cxIrz
 EVYd/RWsQC8ACz43YK3H4rWNreA7b/jlLe5pnnsAlPaUVn6KOi895RmDqxias7O2grWQjmEuUe9
 OHiesIOmaCL+qIp/IFoS224SYCuB3e2ag5eO1lKG/memAFFnW5WNofM4sWs9P1uYsY9NoZYu6N6
 DaNZD5RdCiQZQENVxCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX6Ih5p8z1Avez
 5SB5xZ7DcwikOs1zPW4KyWH2/UQAPclbHSYRl9aLYJt/5eGdBm4sB40Xlc4UB6z+lzU2QmDDjtK
 ckqE52xCFlrhNMG9d5zOoKkOaZbj75I=
X-Proofpoint-GUID: qw9zR3FXoYa0cxhwjoEZA0lPPLUb78WW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

Nord supplies the CDSP memory rail from a dedicated NMXC RPMh resource
instead of the shared MX rail, so the CDSPs have to reference "nmxc"
rather than "mx" as their second proxy power domain.

That makes the ADSP and CDSP name lists diverge at the second entry, so a
single top-level 'items' list can no longer describe both. Keep only the
item count at the top level and move the per-domain descriptions into the
respective branches of the existing conditional.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,nord-pas.yaml    | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
index e90d2953ba69..b09b51f26afe 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -24,17 +24,11 @@ properties:
 
   power-domains:
     minItems: 2
-    items:
-      - description: CX power domain
-      - description: MX power domain
-      - description: NSP power domain
+    maxItems: 3
 
   power-domain-names:
     minItems: 2
-    items:
-      - const: cx
-      - const: mx
-      - const: nsp
+    maxItems: 3
 
   reg:
     maxItems: 1
@@ -104,15 +98,25 @@ allOf:
     then:
       properties:
         power-domains:
-          maxItems: 2
+          items:
+            - description: CX power domain
+            - description: MX power domain
         power-domain-names:
-          maxItems: 2
+          items:
+            - const: cx
+            - const: mx
     else:
       properties:
         power-domains:
-          minItems: 3
+          items:
+            - description: CX power domain
+            - description: NMXC power domain
+            - description: NSP power domain
         power-domain-names:
-          minItems: 3
+          items:
+            - const: cx
+            - const: nmxc
+            - const: nsp
 
 unevaluatedProperties: false
 
-- 
2.43.0

