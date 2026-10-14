Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7C44C51A
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960094; cv=none; b=JLZ20gHtR+rt3vl3mM9KhP3cQpnp9DuCiXtFBCRqOdTnxGKviPYkt/+Vu7Aij3WRl1Jq4v0adJFOzQWiEt6Q7t8se80hHl/hO1Oid4Rhu7eaZ/ilqudJRQmiwVjsB3ouo8AAWGMizmSDxSYJY4d3SSembQsSFTsQUYVK3nwhfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960094; c=relaxed/simple;
	bh=PN595rmuOJuScEjlON739IE6fb80MQUkhHO9UMMLQqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBDeRyqLqji0c3QKXq/9yUNJIRhh72VbHmRYSsl9PATUIKLoftrAWR0XGSK53FKjHvQkudFF00VAbanMtG694nEvvUufY1Xv3VGyknZIn98OU5Xuq8VNjNzPldJAqOznEsbGlOrfSvRhzUtoJcfZI4paOVuF32WxmlNMjtwxyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUBCVXle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asZJawRq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUBCVXle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asZJawRq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67hwo2685171
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFw1EjbkJf+
	dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=; b=SUBCVXletbIExXyHwR7Dl9lorNd
	+U4xsRE43da1jae57bAm4DG5Tb+qkDSIh2wxhCuw5/EXQeKhK/TtyDgycnJq9K1n
	fcP2y1Zik9W6XyltivNjCVFxxWHt2YOwjxL5d2UETPxLeuVd33sCOvgM2mF2JCs7
	Ovba5gmXVWVz56rMZsj6uqKof9yuepv5No5YVLMqCO0Omzzni1XhJ3Tl7oLTjb1K
	Rig8FR9TqMdgGVa5eqaInaQ9uQqbqoLT1QZOtwTXZ+2kgtOvXu5wsgKttGQCwLDt
	mVHn/GvD4DXsWNhBn4HW0rcbPVog2SWsh1PvXaHzp74Q9sJKZK6SS9EkkXA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u04dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so631411a12.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960091; x=1792564891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFw1EjbkJf+dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=;
        b=asZJawRqF6iWC5wC4eqT2mkTMExuIT4To2J4tcgzxXkxI96FszzK/cW8DE18dH+U8V
         yx0+PgQnLmpxjH3ObslFzKbfD2VPBWtSnoyxztB8xV2TQaMjop7YJkzYO8cR1o/97MCH
         cvIIkxaMjCxs3avCaZ2EOdppHGJmutXDDAdBHf4wkVBhZh3bhDW77tASh4saXTFjaI28
         mR3/iD+TX9y3gcgjwPD0PQVKTD4Z1tP90qEmWldMmmZZyBM3jkdixb0BUDELzBr0PqK1
         MgP3qEKekWvrJJkIiQO4+Tpfrk31OHtl9baD77TTviTIgA9nV8qdwwLuPT5zb8VA6IGR
         peAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960091; x=1792564891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFw1EjbkJf+dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=;
        b=cUZq+mj9uMs161DhhBNDLMyoAFBglk7YHIlr/vRyiPkmoVsz2BjcPNfJJpJMVA4xGp
         beb8PoUjHs6nfOVjucI3TzjtJ+6Wz/EwtxkPhCFQX50sQr3piPN39JVx58apMi5scPnr
         RR3Fmf5WpePqaXRqbV1U05syt+oRlbD2Wc0LtVU07X0LgY9pQL6LwyVhxVY5JysquipX
         V4iBmyOAiW3hs4HYbJLDaaqeUJCBL6OIBgdebtHYbks0xVfgtrP4edMwgxuzCtUz/T4m
         Av9prVG/J6ooHQcUy0V1wxAeGoaeflpzo/BxWeMdtjYbyhOUHgT7GoB8+0PtBb3BH09D
         yskA==
X-Forwarded-Encrypted: i=1; AKwUvBwTgpR8BfOrZG0qLS9ns8OoSC9nlxjNN1lz8owT425Mw8Mfe1hvvQE3CDZrNicy+JIQCk9vWVu7VMRn@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2XEwa/V5JigPSPDixmNERacGzyn5tQSTw/6+bQ3Rznz2VFOz9
	VSpS7vAXnR0dLDvTKGAZqvLAs5Mxuz5I8e4iLXf3v1wwIDzOdI2wgRYDt0WHX5b6Gr6WjVa5sOK
	A3lDT6CHTqKRxJfoQDxlMN+nB67sSDnfIzq/iJYin1cXmmRjhVubboNtIfL0dfVZx
X-Gm-Gg: AYBFou2d9O2Va0wWBq8hI3c+jK7VQqxreqqxO9kB4NimPjImKml8QykJY1kq+gY0pH8
	VuI8nI0ttY3MjWSLaab6sta/ZElcd/Yu4wzajp4irErYJcRdyyO63ueqx/PD3llgOeZfCpqfz+W
	KXkWV+LMKnXf3F/rXY/GMrgA4N4gJgkhzXJWRN4yp7xt8msRPVTioTqIZMmy1xOowupkEmfT6qY
	B4AmbDZtYOC+lTRYYE1eyQBz3KxiA15ONT78GeNNuprJo5e8m54vk5gRVmskyw8g4+gSiSDzEvI
	WKkLIQ7KdU+qbAlLbHNr6rZ3lsFhbKMGo1TZRN1+xAfP+CcmjDQrDg/FdjdrPE9/GO3bltD5TuD
	2Ul5EFytFpef2vOV/ygZKYWxtHLboqkCLfDaDtjMbcChyZvJFhoL0CfsEA3U=
X-Received: by 2002:a05:6300:2287:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e16be3aa83mr13683408637.36.1791960091276;
        Tue, 13 Oct 2026 23:41:31 -0700 (PDT)
X-Received: by 2002:a05:6300:2287:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e16be3aa83mr13683387637.36.1791960090722;
        Tue, 13 Oct 2026 23:41:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Wed, 14 Oct 2026 14:39:51 +0800
Message-ID: <20261014063953.549379-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX0rYQvFyCKfuG
 7g1jnHoXF/nQK9uI3gQ3AaiJ6Eux2DqAQU9RnH57xz23mPCaaRbJUzSVcJXInWaOPmZkeW7/sJE
 mwjtxDZwLx9xERoATm3tOpbor7uCEF8=
X-Proofpoint-GUID: HQSCMz7_ECX9msfC-_7bljVPZEGNzp9l
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf241b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Lrn1JOtORFUC_bamxP0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX6rqfrlVZILl4
 RjCsmrZk7LyPQzhyOzBBJShxQ5zebqCSEgWXkGRjQRtIqT3alvxoA1QrzVuooZkWi4/CxdDHKWv
 /ROhhKFasJea46WV/ERM7FY/OuUYappEkPtLUWYpFgXMNm1eDB/ZSr6hQAPtd9E2wzKW34hHioF
 pi+E1y+x8AXmxIbWqfBQXLKzpDyV3P261KwsuaV5n7zkvLJCULcnIxLGBzWsyzeldf13HaanlDF
 Jo5W0L/fDKfCpYsRw6K9QU1RdfichZ6B4MqYyZGwAOpWaLlIfPLQ/QP/EgkID60SZKjljf3wjx1
 MWM8LLysvKYueg9FzxjDSUbNofWqmS7UyeQIYsSdW0TnV0/+S7wx/6TGbTNh1aJlVEI71JPNPBl
 /pogj7nIyGEO+9MpdF07KVfdK5asOBZBX9sjVeOm1wH+NOvr5fMOAN3sDGut6wIIaO5sEsTV0eP
 G1+6C3ALqxfMsbIJ4IQ==
X-Proofpoint-ORIG-GUID: HQSCMz7_ECX9msfC-_7bljVPZEGNzp9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..7557efa4e168 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -434,6 +434,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

