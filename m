Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E01AAE17
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665148; cv=none; b=aDGGVkaeuiL4IYMBMWpX+lfKCK75yToAcWgtKP0xRYB217n0zCcJFvcvGEgiegdj4a8HdcvbjhtBSZS2On9HsDkGKRU7XvRwk3/A0VWN5qhoSTkgWVn9koSQUac1nnA8rEvXYYQzT5pvBzKofLNl/cYT/xINtxA2jboGRldHXfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665148; c=relaxed/simple;
	bh=WCxScN3+3shYk4oWiVR5D8bSSKIfAo+O5iQqzFaWARM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZyCnMl7rnPXZflIuQYVdNTh29kDyzsuQziz7hwT8Mm+QOAeMCh4preXhV/JmgWlLzjOimqMY0bU7NRAyupmFy4CvWx9UfKLCX1/Dap9tHu5IrGqce6wI+CZbH1xRJt10znQMU5QebPO5Tl+/GovJbvYywzDvwjLmgtNxj7gKG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTpCly8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLJ7YkV6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTpCly8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLJ7YkV6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNnUW7514565
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9HAxgUkvpe6av4f5T+wXhFcc6rAIntcGOvB
	TaP37iQ4=; b=ZTpCly8I8olMwFYpbWA4Ppum+5ylOeWwAbG/kewaPNCxZD6k6ku
	pwcfwU2X7W75Mmx14rFigSfH4eNve4tDsYsLTQzeu3MDPOI+HogRPV1lTi+K4PTh
	garSuvT9PbZf/FvRWHU6WxakTqsXpY+IbZ1v3pyxrxskAVCMgUdSy9CdBviY/Zqg
	QGGz1oIuHVC2YIvOOg/KHiozFL/KdiKa/GgVyUeSe24K6MPS3wqhwMcVPSGQ8+uQ
	Odbp3Q/xaHXytJ++oIRoNvsqQiJXr2pz4sMG+bqsqbn04avYHKuWLJf7HsR/q/l6
	xJm7o70h2tJMIdvVwh8fjU5HrbczYGilgSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynecmcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:05:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2da19227bc1so4100302eec.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665146; x=1777269946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HAxgUkvpe6av4f5T+wXhFcc6rAIntcGOvBTaP37iQ4=;
        b=TLJ7YkV6nG7vwToQgBdMkG1EkzSVBFPu5b3NVfRm83c64yyXU/iPnvfV0g8uaCYXlb
         UtGDALUJ0jG9HRjCv4VSpCTYfBG43KBEZhxdML29NoejrcduOBgLkIe89VCgdYWHiFbF
         Ly/jWl9JPE81DuoCmkms2l0rn0krkxzJ0+vBvkdPGmSwrtxe+Mj3DJutcnrP7JhHbII4
         WzpqqQwdyi1YQB0t47l4l/jYTrxfX9Zs7rrB6OHLqG4VQeAghMylK9mFTH2lKnMKwP9b
         FTEi1VxtzIBJAyNDlxKohBbF8jzhubFDCvwQBPpNkL08V9RCiak+WJo/P8htW9CLdWQK
         Oo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665146; x=1777269946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HAxgUkvpe6av4f5T+wXhFcc6rAIntcGOvBTaP37iQ4=;
        b=O6tpxmN+ynRbtdRPhfuA9wtD5pKzyqlTAKiYJFTYbwZkIemx1H998nG88CBGymBSSy
         jOYkN+UDQetLB2vBaldYDOr7DAB4fBiXREXYieidYeeyo4QAIyeSjpe3x+AOmT5FCvn5
         xgFnhbcQFo4nyY7sN7Mg47iwccwuRjzfgDBrRdPDn6xmz+taISq6IiMmaYj646wSVKCo
         ZIt9MJsg2cEn4oKjGIHqDRQuZ6HuDJs+D/wSu8xOPbawV3nl37egRfyHvKeMhqE434cV
         omqWyFelY8fCKt2FC+SY6ez0C0iTzhRRC4lGEZxAdngYyFzsDOmTuYXPqZbWdgV4EUxv
         oFhA==
X-Forwarded-Encrypted: i=1; AFNElJ8+3h5wLJ9eHNCMnuIsB+zD532CqFJTCHQxqfeO6nhHejnSKsp5f419iOml/tl8q+CzaEsNIdvOI3pb@vger.kernel.org
X-Gm-Message-State: AOJu0YymBV0oxg2WH1SVhoCfmgpTCP/TFUYrcTnGsGakX2wPyt1JGyE1
	Jh4a00abuzgkPwo6SnmANDVzCd9pNKlpNNh+Q1gS4U8mvy0pwH9s0R4JyN1Y+vt+szXFMODFdPz
	qi5Jnqjg7k4kn0HMqiwNf109hFQiYrU3vUTq8FuG6bJ62sS40jODcrLk9SFY7P47+1A/z4mSXmt
	M=
X-Gm-Gg: AeBDievLrLVuZLcGldtk+heG7F6c/L8Y/Bw1wzET2MkfJ/xSn/OxtYoTVp+Umk4KqPP
	qC8G2zg0Iul3UUrxnmrGzNyWyC27rC1vxZeZ4jkH1umgFhdrT6gIoEt9VBg9Ac9Z90lbAsqtwUQ
	W6n1TYWvzF3/bDU/G62f22gxbMm2D7f9YBRHwog2uIi9e4Z9U/EsVnxCZ/at6TblEu2IvVfXdrJ
	E0gWCLkB4wC2ZIU0WRXNbdpWbQeRP0wP0Ef1PqVUXcsM6K9h41B6aD6QG0ML5aQZ8Xu76g6XbRB
	5VevbCiXhNaT97WPAq3sMAfZtOctUTiRsG7Zcskl1tNElWou11w3nE7n2ywG8zpFgmS6mEKO0Px
	/0Z7Tkc/m3pAqRhy5YEC6qm/4NMdY49QcQxTKVjDXMNzKgWY7DQ0fAFbNLz+qNJoArwcS6G3xv8
	2pid8s4Hvr2XTG3XLN
X-Received: by 2002:a05:7300:bc97:b0:2c5:220c:5673 with SMTP id 5a478bee46e88-2e4647d0397mr6385059eec.5.1776665146087;
        Sun, 19 Apr 2026 23:05:46 -0700 (PDT)
X-Received: by 2002:a05:7300:bc97:b0:2c5:220c:5673 with SMTP id 5a478bee46e88-2e4647d0397mr6385035eec.5.1776665145585;
        Sun, 19 Apr 2026 23:05:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13430382eec.18.2026.04.19.23.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:05:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 14:05:24 +0800
Message-ID: <20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5c23a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oH9XnFzfs7V-9WSmyQkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: K151krG6oCnruyP_sX-uUSoZ23xDm2TZ
X-Proofpoint-ORIG-GUID: K151krG6oCnruyP_sX-uUSoZ23xDm2TZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1NyBTYWx0ZWRfXzUORkVeyDgeD
 GbFX57dMEetSeMqQSTT/ij1eNFZlfUnADg002zNVHGcaprL3JvK/6FTKOAAMAVhXvE5WkHAXAYR
 Xez+aaCECNGWckZ6qxFHTwoTe0/kpH8Mnvh2nqAqD/H5EK9Jp1Fgj1IpIz9dj/TKt84jMBmcgM3
 4fh51jeROFAjy8pR5n6lGMvw/EP6jwDMmDg89JWfxmU8ohZo6bEuNXAqOwmMlFK26yF/+193dG9
 fyeNov82NHXWykY9SGwggB/ytc9r6ekiKdE9jbrq/5xo6vUDmxkAk065Mg5cb0gEiMrrlRsbdNH
 NieHcbkK62J4vt58pnMGoYvRXA/JoOEbSZBUbpg2yE18X/hVBLvY/PPyB/VIkAcpL2ApJN/g+tu
 JP/lGbLGqK1wn3AUbfDWK68LTamYoPeDc1F0zmkeKp29EQYeIR8/RXHi1iTZRpcTCcoBW7fxWVx
 lF+iOa4bfTF8LtcxQlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200057

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document compatibles for QUP GENI UART controller on Nord SoC with
fallback on SA8255P compatibles.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/serial/qcom,sa8255p-geni-uart.yaml     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index c8f01923cb25..55e73b359f04 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -14,9 +14,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8255p-geni-uart
-      - qcom,sa8255p-geni-debug-uart
+    oneOf:
+      - enum:
+          - qcom,sa8255p-geni-uart
+          - qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,nord-auto-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,nord-auto-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1
-- 
2.43.0

