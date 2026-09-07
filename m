Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3215837FF67
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759994; cv=none; b=m1jJXWjgUME2LxYsOWYHUQpMlQ3qkmMzqEj+W6dCASvQ1hXv6M7cWOmhT2pVHHyiyR50amYjZzy0N+kthpv6Btm4n9i6aE4luWBamcAAnizEaDys0CIxscoQ1CM67zo1oN6s8kqWnPGzERX0YGdNjeCR4KdZXz19JVQKaZ88Mbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759994; c=relaxed/simple;
	bh=TGGp65HQw/cMtOZ6c34YE/ci3z+cTavJC4fOlegELGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2abHe9IGFPrp8iGgTns32zT4/aUNSYywhjPy6zQPhRs/8guuTxrL+H3prH5hzju47Drt/FmdNO++LN90ucDbJwo8zgYuQ5eorev/A0hvOAy5Fk8kFajj8Y3WfLmZh28aVq1OukM98TCvYDXIxDZPa4IgnUoVC1mXF78OTr8fXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL4s0+TV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auY3pszw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EL4s0+TV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auY3pszw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lNud3102941
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 05:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=; b=EL4s0+TVhvnidJAO
	BJ+aBA+5w4xsi51FaUaHt+rkM7rWDQc5cdEsO3HaRzChyPu0jMpb+dr/0W4VLWZY
	3023ABlY/aU5uBmHREt7O7qI2oLj/zWymAfluSkJfNkq0SfOqJgv0HNBdPWKqPsB
	q5veqk8BCYxpUjK4HVBI2uWmVXoKIqLGxZnBiii0xFagI8haVyWXdzzuGYzaysWZ
	b+HMiq6z6N48yz01WzW3OcqlQyKfc5mKGsh43l0ErtlgQNhXWj8kXlhkSyiAsF1Y
	G+crE98cbBe4PGp6yxJCQllc0Yf0LVwPP3SYEPpJapjsoMGYcyYegTh9XZsQXDRP
	RiFJDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vd2hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:46:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso6164786a12.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 22:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759991; x=1789364791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=;
        b=auY3pszwZcUdT7GqU7XlliHLS9VcRgJdIQTL9kQQ21sSNu/i4PB8XWqBc1VRltPHVl
         p3tdPwUNxNzd5+ZhdTbLnlGPE/fwZNDiu4rMmfLvuhg25I0RrdbMlhpz0Z0BfUaNPLlL
         1zNUVCyrJllX/Uh2cqGLn1osspiabKM38TZhbWBv+QWE52ImdzsYMKD5MrPbHI262bpL
         Ko/H8gt2cj/Ux+BaZF9oKT3v3UFgsWXyE+i2nBr/aF7ih+eWqEbf9cZZgZl/qV245uie
         9lTKz/luVbvw7etKRRhJ6JVyq0f23CciyrrhoQmEG+aV1uWMb0YP2AR5HRAQ2ZNS2BlC
         Ct3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759991; x=1789364791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=;
        b=jtQVg8uaku5oGAM/6zR/0Kbn8E31Gc9yYqQE0gOv/l/FL3uXArmk9aO4eYWF9+9RtU
         JM7BpniTHw4+0sjbnQzKT756cjEAqLo9zcMPHH4GFtTt2z4k9IZ6gK3HEUp2kNyq+uu3
         w/QW8p2N1Z2G7sqSSAV3tX+MJCspAnWa92ETUs5EWO/UbiYzvZAfXZXHNJYTilIZp2YF
         8laKs00i2OLN01CMLspbqtNNb/qFO70W7OEH7NlRRxMn24mFCiIiY6gD2xJhUe7exM9w
         PmkujldCAjfxbwe8B+luWHj2iFlqsFTf9s/FZUdbMMGCFc2c2692BAapVZeXtjSPWAZo
         wDUA==
X-Forwarded-Encrypted: i=1; AKwUvBw1wSw3UgL6jYqzm/ohcwnYAsr2ruW/BUIdV2pbYzrKgALWCuoePTIODrF/sWfnXe6MLBPBPF8BRFoh@vger.kernel.org
X-Gm-Message-State: AFuF++k+fsIDZKcFcAXZfc542GgwRpm2nPIDFVuq/gCyFJaiI+vUqOIG
	JFTsfvVntYjvPNXGfg5iyslQOjqevLWPHEzAUwwHmbhOUszlTUGcZ/Z3jjLkmqqnYRFcVbwW7ag
	LCVyponWC2uMj8D3EBWvzbinhyN6QQenzgyLEXR9Uxz1ObAxSZeUx4lEdbIJVxN00
X-Gm-Gg: AYBFou3lP5ZMDrtWggx6MHynVxVWG6S4/gFPf/WmZxS90PMzTr8xjC2itWv7ZD2od4V
	jMrzqvwfYgN5sedJdUO2H/zNvjdlTMmA/giVIOISf8guSqP6JHW/Ioj3qZpdRkKgpB5C8Uy7Hlr
	6HViiQlyGqEWV/2Wgs5OLygQTfbQFo83bTUAiLyB73cOLKMia8JquaNjhisKMx7D+bkyTkq+TJr
	H7WegMPANiF/MW7tYX3yYjCloEgPq09+o2iA5EHQ9ES2l2tCk8IQi9KsA4mkHLi261LZfv6xy+x
	1DxVrHnxGqGjhka5xPTchWuTDuztbUNXibbALXg6q2BG0OHDci/VcGxcYCg2TJP06QePLF2Q8/f
	3wa7tb1WA2AqzgnJZTqAN1uRPqsQ3jEuuLAAM
X-Received: by 2002:a05:6a21:4e01:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3da3a178a99mr32448184637.24.1788759990954;
        Sun, 06 Sep 2026 22:46:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e01:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3da3a178a99mr32448137637.24.1788759990513;
        Sun, 06 Sep 2026 22:46:30 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:29 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 11:16:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add required
 vcc-supply property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1463;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=TGGp65HQw/cMtOZ6c34YE/ci3z+cTavJC4fOlegELGU=;
 b=HGqHYzefSsJiIaceJpBRFr7bUOzhMrcj8IGMVMJXpA5rttKU+yhWh2DxTHVq4N1MHRPikfKsu
 ubODr/32dUADgvFEFgN+dVi94V8ak6A+snFiqQVu9PCSDNRZSmLLi8C
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-ORIG-GUID: IC9TMJkaxMEa5fGN74K2xVltAlU4K-5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX5W6/+LyRacx9
 P3Xm2u/zL845qiDOv/YgyzsT2J5sqW4HE77DQcp6g+8wPNsSJ3OToU/vi35AT7UoaPgRuM9BpPN
 MGayi59nc4Z78Pvfk4I8+6ANew0J5fM8RIjS6btLvdqtZJOa4ee2uuph9ubAxWfohFeJYvVdt1W
 mH4Fic3GtWLG0Uq3K8UyjNMCdm6kcqds7kXs1m2K0ZtXy2fYslESlcqUGUSZER59qMLemG7bE5V
 dCnqKTqfMl4Vex0Qo6TRJj2Oza0+1B0NU6jWpopucjGKB6kgA+vCrSXNC7W9+dNedg3aXKzM+Xb
 AWNA5V8Ezlllypo90ECxuQYDFSgN670BnJ0ySnRBvlmbIMETgdbySBcNusB0+QdsK3xyI8We6nM
 PgDh0sR4j/aZhoJ6N05mKeKbG0a8ZgzwrROeww7FBiODYjrVuOZRzXx2kABG9wjH36tnxW2C+BF
 S/b7caxcAjNIUQzXUHg==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9e4fb8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H1PRAqIjwE-dPk8C70UA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: IC9TMJkaxMEa5fGN74K2xVltAlU4K-5y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX7rInvjSrc70Z
 nh+/fTfKjNnFFNiXpGRX7VSViJ8bu1AcRnhGwaIsxM/XVx99dbRWCnajjaWcOxOTKyVwidkeeJg
 oEy7xAOVJMgGHIcVlc8UFW6unXTdDRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070060

Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
regulator binding and mark it as required. The panel controller MCU
needs an external power rail to be supplied before any I2C communication
can take place.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..a6195e53be16 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -43,6 +46,7 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - "#pwm-cells"
+  - vcc-supply
 
 examples:
   - |
@@ -55,6 +59,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1

