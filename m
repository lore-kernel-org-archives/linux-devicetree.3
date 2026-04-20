Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8037A493
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668073; cv=none; b=BhNW9vAc5RfD6pQV8VQ1bItyXYnkV4TYWr5uO+fwu4gRbmQiJR+4z9XZTGW47Wkns/HYZVbqIi8GLXAqmc+odepNsw2UN2CJwx60mkN8f4/X3NH7F/OmyQuR4ll38T/FnwmbJyI+er1cenkEaZ/c+LZG5JOovG1OiLu7sbBXBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668073; c=relaxed/simple;
	bh=+gpiwd/uytI50Y+36bWOKFiJGYYLm13vxU2a9WScgiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnMRp6WpDU3/VcCuj7lR2PEiP0Vf7tdCKhmuPUYbnpUzOruP8w6h+NP1tixs/dGFRsSzzAw/cjVFsVyYMYg+1pvSO8UQN6iGVSmal7W/BtS8Mrl+WzUjNzezivOG/cqRDPpv+Wep2qL1DuYkKjnONlqFM6/VCgzuQQ9sW1NJsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayjc3QIc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYghVbtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayjc3QIc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYghVbtU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNcr5U1479134
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QQE4p3HA2XSX/yYP31R8chNUnw0g5gaO+Ji
	c8gI1HbE=; b=ayjc3QIciZ6OOJtlw401tejoQitFQnftE/H1Ut13l9BhqzKrQ52
	giLFxbn5VauO88ldBZBCZ/Lede7d89Hz/MJF8bh7nJs0RIRN6B0v6hmBJoHhKS+X
	aG6XAXEhVt5PHO4fhpHPUYV5T7lFlzpkQbWOwsShrMVn905+Vi1YLnfxe9KcJS6T
	vH4nwk0IOkvH17Imza9hKTAYgeXOZdUNL5RpWJtcGE6AqccbDdHtvlH/4EZGnoAK
	GKEnJvOuZe0QSOLwX0MUwbCezRM29kzWQu+k3HyBG4ckA38IjNJAECKz9b2TN7Tb
	xxef3cXVnSaGimsbKvf8VvbRuThUyST3haw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b74f44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:54:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso2893263eec.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776668069; x=1777272869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQE4p3HA2XSX/yYP31R8chNUnw0g5gaO+Jic8gI1HbE=;
        b=HYghVbtUtFxbqU+5Jtx/CejWqg11AjHzqGcKZQpPb1pTP0FP0vwa98fSTuctaKzuWY
         //ysK2u7MA0ZLfhfitf9JZDmw7LyOKRtxV+aeMIv7njb0n/8P4xSuPJfiMAhimbsvhKt
         f+NOiqUjURHwhcS3kfXS/absdWxOGsj982PGVnAR1PHHbfYQ4wKBdgqsbs8/g/Gw08ze
         /F1yPPAiH9Rv/yaCA+dVyHVAmLuSF8LqAZYnSSTQgnODLwdm9w9C/uLGi9s6Gam5Ich6
         bPmPsbQIJh02pbPvzF56dYxBsXZpnA7PTPSKinEB7i/RFS0kpVJGSiPWyoS4wOzYUk2U
         H+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776668069; x=1777272869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQE4p3HA2XSX/yYP31R8chNUnw0g5gaO+Jic8gI1HbE=;
        b=HrLvtmrzkVOtvH2xsesOMU4nSQHMCipW0ypQpRrk3mdVjdrbAF7H3dkQra9Dz4GEmC
         cmtPisbcvGaG5brlcNpOKHiWLx8RXi6GC7AM9Mf0jHjyUr3U6TjSn3FihmF6QTPH+5ut
         pxJj5CZDvgSzc9yOrJtWmbZiVGgbLV+AIfH/NRRJfrY3lHOxFfQr897cH1ZtWHaMmbdr
         S+NYOxKd6PAWsrDtrx7aymO2K991J5FLU/SIGxNEcfV84SmgExbCdiqvkGEJ5PYdo0q3
         9PO9FEAJt+6W81K3rlC9/STrVjeeTD5itf37QXW8R9WES+Yc0cbtZ/ZiUFKCXu26QvsN
         /kHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yxuxfLiXtn9elnBhyQY5mwiwezeg6OcTyE7xafQAEkN9UbcmHHBqw7g3ujUKRZbFhAovPjzNIKHmY@vger.kernel.org
X-Gm-Message-State: AOJu0YymNLy3OA/GlFQvoYWBDzWPnUDWPmYq0FZbK24haOz87EajpRQe
	Vw7/BVr62MGk3hqtTJiE+fPZAErN8KXhFUO91LocJjEVwNBJMQ7FNGNfbrJPzPYFy2gsr+a81ml
	Hu/O4M+18g4PQF1EVgoeY2+LM01f6JvaYk17WgJjKTFSsv+U9x6LQf2EdJ5DaCNH4
X-Gm-Gg: AeBDievdpyTVGxJSNtMIbHofgnft5jI6mdW2R+nFEj/SxNzbjGLm/+6hTmXY+u6rPpN
	hHno/nwNd7RJaQeFOw8/P0xuSL0dnJsSobEPQeNwtHTFTzcMjeI7iXJkWeX59ojqNbotLAMCVFM
	3YDCI3NqRxV8Qf/5zozzFLG5C3LKfI7Z5oOFRAxnPXljseqW8p2X9657lVoY2UammxQ96hCaMWf
	vg9vf276iwF6fDjz572csTgiTclbLMsLxQkKwggrXKZ7tI295Rm3Fbbz2Lu9W6oQ9px3IJobxy3
	uwICXb/Rk7LHc/7x/at76wiZPAKgVK/WKwqZpWH/hy/Gaftnm3mt0fSqNXIspz/oSQbGGtu8ZmG
	6jCW8N8Pg63vIlMykIYysTY1jPWG51hHHLAo1tbTm3k4tlQMj4iuWunUFU1P3Ym3e2YNGuMIXyE
	nyZoq7Zk13gTrdHdD4
X-Received: by 2002:a05:7300:72cc:b0:2be:7885:31df with SMTP id 5a478bee46e88-2e478839275mr7110403eec.17.1776668068742;
        Sun, 19 Apr 2026 23:54:28 -0700 (PDT)
X-Received: by 2002:a05:7300:72cc:b0:2be:7885:31df with SMTP id 5a478bee46e88-2e478839275mr7110381eec.17.1776668068202;
        Sun, 19 Apr 2026 23:54:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm16314442eec.8.2026.04.19.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:54:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord Temperature Sensor
Date: Mon, 20 Apr 2026 14:54:09 +0800
Message-ID: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5cda5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TcyPYtoLkGytR_Rpxo8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA2NSBTYWx0ZWRfX6nwopr+jNfg2
 dkayl6uRh5ECzzf5/g2labPpfJcuHUCvVfmr1iYbZ1/b0h7TnGOaAL5edniVbAh/QQP0kXRRU/H
 TD9kcMgNccfsgCWHry7mYAwSZr+2jdIOi6khOSNnD6YJKP+KS5Bas9K+k03CRmq/0xr4hD5c4/S
 GCJZ4WtrM0Kg7393NVsagYo9YJq+Fnd/VFk7atdZrUoVZGfqalOtuGRilgcFACaitER/t7ErmEC
 jse50sc+uM2LMGHiS7M43zjpBl8EhLWMxlpV4RhT10ZZGxzbodod637t6pY8l6H6SNT07bSaoiy
 ZHssGav3Y7p42v0Kf3+rnKYoLuovkXCdTsKFXjDJD0jy/WTWSwT1HqV1KVj4kEtZIE++ITgBZPM
 xYfwu7Mw/EFgyDjr9Y9ODUHqYjWv2N1ib5Nj6C++Clz10lRqFYuZBRPMWTskjGEIeC24j4tFM6M
 Gha2Y5szcHcRhtJNBjg==
X-Proofpoint-GUID: 8Efrjs6gIMGqf1PGSZxeu-7Mry6v9ztV
X-Proofpoint-ORIG-GUID: 8Efrjs6gIMGqf1PGSZxeu-7Mry6v9ztV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200065

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatible for Temperature Sensor (TSENS) of Nord SoC with
a fallback on qcom,tsens-v2.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..e65ebc6f1698 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
+              - qcom,nord-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.43.0

