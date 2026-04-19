Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF02F5487
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622985; cv=none; b=my01vzJ6D+Z6NAGDdcpZMdrbAOgPhdSHM+N1wya8YvmJiTWInLO4fvbEqCh/X21GCNk8yJHJQnADkTEh7De2HxZpN3UG4f8/kIu0VbPhwmcz7kQ8JxJ7Q+kh7aIP9YQdegfNdHLDBXNOvs0bIDHWdNsSD1KbiY0A2MEYMd/pMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622985; c=relaxed/simple;
	bh=WzntAKrn3SE/S0P6q3sFoaSPnkduyAfvojxfo8h0D/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6rgOMND4sIk46V2Fdfc/EpW+BN3GGnn5eZJLEmZUFNivlJ5qBO/b+ohCBkDgjGuZ8qU8JaPDpY9EXVBSEzMOHPrmcPz6lyRNIftcIaZCxk0kL0YbX46QPNdBsNXbETDaELgSzKDXlhG+sp8P8yPxN1enKmais8fSj0cnLV4+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hgkh6xag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyJZ7Ljn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hgkh6xag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyJZ7Ljn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63INviGR2640135
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 18:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/O0gxmkDAI9
	OIMx5SPRWuVmH2AlYc/ZdPsgTg3SpEAo=; b=Hgkh6xagQ7VuzMo95XqD7wXM8EW
	RmfJQJnGYCg+zIr14mvfwXRiofcPUgBcJT1x3V2T1HuMu1bZ/9I4psqEwzlv9cPz
	k5lF9nwyVVIpQhownNXkMiTWDzeQh6OfHpte3eXiJ70mLmQZG39C0pfE/Ymj/DnA
	qCk+m/SiN2hpb1hrNRE6hV4JIyPgQzBT0ZPLZmIgH9emvNkFE3sGnYKqxKEz8u21
	7r9/TVICyhptUNTv/Hq7X8CG7gkufNdf/lP6iP7XlctZY+yzuYNg1ic3OQc6ekf4
	FeN9Fk+jGAl0p3nJor4Lm0lpa3KAQJy7Iw20yoya2PbXgkVNJkYkwLT+LuA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr35gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 18:23:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b0312bb1dcso45777336d6.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622980; x=1777227780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O0gxmkDAI9OIMx5SPRWuVmH2AlYc/ZdPsgTg3SpEAo=;
        b=KyJZ7LjnQdmhr5hkI2I/xDuUZU46NZYDgRnSq9MQ9cxe+0eDZ+p1shMNvRDkpWDj+C
         aQX4lnpT45I9wx3/trQ5ve2/6W1l3F0J8nu+LcMxVg3ICAbvHMdQhDS7Rq0JSzhaR0Ie
         4KzYEZXfIjG+YICK6lzUPuCkJNRXEZfuRoBmhYrKPEfYir4ybItFviniqfrSyNmZ3nO/
         54HY6tKSzd+rcEAgbVqkd26+FGqaWpSqUaGIYkgCF8W/moiSHKKj0uVcUd2iqrozMTrE
         +vw8fpJbaoz1iZgJ0XVMER/Rfz8fadMLMkIVQ8ANtkuYLCtKHnFF0wHfFfnNtxjMwqyM
         55zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622980; x=1777227780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/O0gxmkDAI9OIMx5SPRWuVmH2AlYc/ZdPsgTg3SpEAo=;
        b=nVvmFEnPUshZaxpcgRE9FdI1n7ujYrxJLJRK8aEDq59kxk2tCOzVZMaGvXUpKVU+OD
         pe8VUbqCcO6DP4gDqTSSQJ8LZZPiKp0VwtEanIzWF4ngm5WU12dQ+tulOcQzJJgoAJar
         9ExLi7dEXeG/OE9NxqRXP9PBQTFaAE2oszGkKiRzC6rIHhu9JsUkqTLuRRhw5hLW1U++
         OW50j2nwXfl/OYcBgTfj3EWEhQcJOv25rLyWlKtH/GCMGLNKKdnrBnGUwvJH8DcN/CUj
         vbsELJwFSbyhRFPo/Qkw2+VSw5WqELCtUgemAcs70v1/dtQ6345OIeKd1GyRqDkzJZIi
         v0RQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bEYpcIOSBGCUmtT+HTWhtkYVNRdyb4Fia3uHWSNgZRV1h8crDPRn+RIPnrkkID2Mh8p4efcDTSqXi@vger.kernel.org
X-Gm-Message-State: AOJu0YybjO0zoGGFthAyi4JSxiNDUBbCWhceM2VH2ZnjaiCf/eUpt8VT
	LAPTnWkQ2nJuVuWc9kIXjaqfdVGsZsgXkILATKriy6+CXXgTIpwQ/prZhKDjXTo6pT06xxaPP9T
	gtXHhBStwakKFhCXCrTFiseqWjJzhHSRrZntZACPSqSUa5fX1b6UgzZ76ZB+PssgD
X-Gm-Gg: AeBDieuidBuHmyujerpSWP9YpVjs2KWfDinvRGBd3KEDiPW6evXZByv/e4npkXEAqup
	h1zQ99Zp7J/8fJguNa9Rd40TLxnLS93GvW6ZkVGzWKxN7hWN0gFj02wDttmYUjUMqwXcGLdttLz
	q0mueeOIKc3XZ4anEk2/GWl1eqApOkUV0za6XakkgqcNZN0DFXJdvDX6K9FcBeprcBgI92mWr5N
	ISTwBG42esWTTG+xsNCDUnyuAmjHvPPdnXRB7r8iq6iyvAEmll4GTeQRSE1fY2H5/BP70F8HSlu
	AQm0l5cCv2pEVqXqYpYk9PeYaH2noheCfbPY2qolxk6vakkpltj6U4p6nhVloJJEAnc7Ypetk4P
	VgLHwwaIIJqtjokjqQyguBNZRccUdtR0zF/f5ZhBmG4gEnGH7oMdpVVVflpSb
X-Received: by 2002:a05:622a:a05:b0:50d:dd3a:73b4 with SMTP id d75a77b69052e-50e36c49454mr168590931cf.37.1776622980466;
        Sun, 19 Apr 2026 11:23:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a05:b0:50d:dd3a:73b4 with SMTP id d75a77b69052e-50e36c49454mr168590301cf.37.1776622980036;
        Sun, 19 Apr 2026 11:23:00 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v1 14/14] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Sun, 19 Apr 2026 20:21:58 +0200
Message-ID: <20260419182203.4083985-15-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX41uh1wPAn+4A
 O9hBZm51Fd3CdZ9zUh4V+reD9s77EbXH98MdSTj+iy34jHjVSKc/Cycsz+PgEtlFig/oT17KUjC
 LFBAA20W8efJM48W978Vd6HIEWlDb9VPTiWs/T1xkxW8QYZPQng9YZnPVDNiUX1p8M2cN1rhM56
 3T1ld4WqQYKFyR2PJrmt/xxTfVTyKe8g5uTYKjZBeMPBLNFvaK931Ms53Vq28B9OkUzK0cRaKYo
 DWUgkbj3R+gpLMjIqdusWoZ6de0yv9S5ALtKj3dHWkXQjA3e4xaMSLnWB0EYIix8mbeEV3rOJva
 cUfPtT3KjEIfA0pusqhPVTP1U2So7HsCCDqzsrXGGDFZcE/TuFO/yHz16H0P0PBlktu3scBiShj
 LD02c/1e3dDygE/DDMn84tKbzCBdjB4czpqdlKQbvR8wBHhwHdFqCp3waUqMfrhgJb4E1oPZYHZ
 GmA+Iqo+9YTUX4EQzaA==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e51d85 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=GhBi0EG2tKjOyko4s0MA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Cusv6Jy3Y2DGE3iEVBeY-X9aJGXmwv5d
X-Proofpoint-GUID: Cusv6Jy3Y2DGE3iEVBeY-X9aJGXmwv5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Extend the thermal cooling device binding to support a 3 cells specifier
along with tje 2 cells format.

Update #cooling-cells property to enum to support both 2 and 3 arguments.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/thermal/thermal-cooling-devices.yaml         | 8 ++++++--
 .../devicetree/bindings/thermal/thermal-zones.yaml        | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
index b9022f1613d8..28f5818f1e60 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
@@ -44,10 +44,14 @@ select: true
 properties:
   "#cooling-cells":
     description:
-      Must be 2, in order to specify minimum and maximum cooling state used in
+      Must be 2 or 3. If 2, specifies minimum and maximum cooling state used in
       the cooling-maps reference. The first cell is the minimum cooling state
       and the second cell is the maximum cooling state requested.
-    const: 2
+      If 3, the first cell specifies the thermal mitigation device specifier
+      index for devices that support multiple thermal mitigation mechanisms.
+      The two other cells are respectively the minimum cooling state and the
+      maximum cooling state.
+    enum: [2, 3]
 
 additionalProperties: true
 
diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 0de0a9757ccc..1261ba0e802e 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -214,7 +214,8 @@ patternProperties:
                   device. Using the THERMAL_NO_LIMIT (-1UL) constant in the
                   cooling-device phandle limit specifier lets the framework
                   use the minimum and maximum cooling state for that cooling
-                  device automatically.
+                  device automatically. If three arguments are specified,
+                  the first argument is the cooling device specifier.
 
               contribution:
                 $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0

