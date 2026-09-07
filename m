Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2024E3778
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786069; cv=none; b=YT07X59VRGWfWv8CK/ceFW0ZN8FF3h8ra3F9gPvy03nfe0xXa4bNhe67JpYZg4lxSeUH6Rp0LWH4vVObrZ9txeFXfo878Pq2ViZr4g1lU9Mx89t7y8IBKI1n2wnoxsLWmhKeATC4ZpdNHac1WaTpsGcOnhXIzIYmfqDIjiNlZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786069; c=relaxed/simple;
	bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsGxaWFnwQh5fPSWlkpWR5BqGlftDPsUFfwDjgH8OcwQg1EbUDsuzNfH2XDp37H4KOHoB394WI7gqnT7rf359Behgq0uLlAPrW0wj1ouWV+BnZs65DXXy0QCxDYtNGWyuLOGA3Cn/HDIaElmuLJzNkDyyABKxjsrBerqg0W9LqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeyDuyqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK9jB/4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeyDuyqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK9jB/4i"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3nG3230488
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=; b=JeyDuyqhPyOJhQNo
	dwaVgIkG+yKlIXzw44icOX4UHs5HZFBeWgQVQ8b9S6rXB1dym/fL15+FLHl+hm+e
	Ch9MzwqSRQNVphWaHMvcHlaynYiW3wIPsMCtbMQcbmxP2aah+G2U41aAqxvOT/e7
	fVzOZ8RIFHpyL1o3FopcWrr70Szpg7np8EL9VE2w3zp24ZC7Vtgy+/iF2+QO8/9V
	9Z92mipyt65jv3eRdkbY84hQFN9mfZHPYaBcQAi4o9/Qishd2kdIjAwcvsWpjfc/
	PLVqCPtqGqo7amL5/WBHZjmBCS+D28FJiYMAlis2L9oIwk+3FqXEWtIlAsRJSyMU
	6AV9UA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktsu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:00:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980b637ed69so15333241.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786049; x=1789390849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=VK9jB/4i/B6LRZLWV8LG5PD/jJBQd1eZsMjCJ4WON33XL6XuA8c8JI25gyGf2h6pPb
         MwwfbogZe1KlVERJBwy4yQdsZmFqLcaXHTL38TAkBWL7R8ruoFHxtNMTEIKTqqK4TqVi
         ryKsO07sbAZ0gC6Mrqup/NiEDTf2WDHXFqvosJo8dMJqDLkZaa55KU1drFE0XiBZTDa0
         /Sc3Va+of/2qUFG6hsXLnYMnG8iHeex3iCspM5t1vnz132p6ecru+Lc2kVwJapw14PQo
         HsQHhXoBNWWiPeRucHT0ryciRUSkFdWPr/a8FqUTz5/0yOS6/vC2oEwTC6MaSQLsAz3D
         ekZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786049; x=1789390849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=JJeYx6rnOUF8byNIr9lABrlgwCvRc1WKmkJQPHmNXkqadUFEybgSvnWxYZ3AWWngB+
         XBFcuvH4Wsowd8NFpkRy2r7xYsvV9FLDh3HWkfLoGDck0yYYOWvECwlfAAlYyTvBOUrN
         Kxmvy9GtW9xW8fr8ERjcD4MaEC16lM2YaxNfJDdt35esGzKz7v3swMx4kot2LNMCWlIQ
         FatQvJ5dXGwVRKfUrCw3n9xUjrwpxGPAWa4WOCbQJPHC1HFRoOxlSxcV9QeDINxDro/p
         KbYwJbxXRerR0kPHuw65k7bRLsWyqE+xiGqI+bbsXq5iqao/XeDD7a5mvWG52pwvi/nZ
         2VeA==
X-Forwarded-Encrypted: i=1; AKwUvBxDjsF2l2YgxJt83wayMBcI6ep2eClUNLPQNDKbbChWMRODKTStzqsTF/UbsmCRfa6QHTrblZncExTL@vger.kernel.org
X-Gm-Message-State: AFuF++meqsM4wuLQNXNiNy1ibS4cpEcqf6/mBpymjiffHsI//7gaZuvP
	pluyhRj5B2jl/BFAFsuNWjPTYuL2I/WKSzxAWqnq3dXdGGlAM8Thnm/7mg/OhtxQtrLfqRLNoBh
	t1giZhPHwrbYnQf5aDMNCTZr5g3UX7yqeP8c2z52PyIPyUKC9TWgJhBKhhNwo45/M
X-Gm-Gg: AYBFou3KI+qUMnJsUnVy2dNK9fw79sHdswkN3aB5ZUdf2mLwP0U2ivAfZnVZ7ZST7XO
	u8DmOJHgTsvehGAdly5GBUYLQhliv+lXdUn+ZmRr1wXqxY3HCQY+HCGa7twqZVfhTJnlyVs+5j/
	91OayeWyPDIyPv0PbnodLpF0Z6FeXXtG0J8rpK3lAquJBjrc18A5ne8Fi9Evrv3oH53YcjZg3s2
	+p96xOMXj7fnV+L+4peJ96XjBv9XoYiGE+vOO/VB4KiDJnPGjkb6JWJJQbqGmv5ahmqyY/A56c/
	bYW6r25T0Y8RVD4TDo4JGrdwWSih/L0c8NJDYx7jHeZDejhd/3DhgzkxkkoAr8NaqXiFgveqsee
	Gszlaz8dDhFD+62gZ0b8gxK8=
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-78a4a6d4adfmr7328440137.2.1788786049300;
        Mon, 07 Sep 2026 06:00:49 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-78a4a6d4adfmr7328410137.2.1788786048792;
        Mon, 07 Sep 2026 06:00:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:21 +0200
Subject: [PATCH v2 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-7-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVp5cFMmNVGYy9ANhImIAHyKD5dGnRPUBeVP
 O1DuCsl5oaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61aQAKCRDBN2bmhouD
 16++D/0bbkHFrM/DSB17DsFeQob3v757v8onIfgsK4xIpUIPtiULuD/AG8t0JcY8swQx5ckcrCm
 raqmFRD4zTdXnygkjlS+0MUr9+5zVTDvB1N58YdxWso47cdyTrA9XES4yWIHADmk4Yu/EobsWA8
 +Kg0jWeqjDVoifxxk2ra9XUq9p42HzDHADKOitroD3WMzx2hGpBsIpJdPWIWf66/k13GlWRCAhg
 eVThPzf9myJWdnmeODBJ+vJQrl4rpCMsKOBWcpa0HBQXCfw/hhRcIl7aayrAKJuefX01wDYuYvi
 ZbZxGOPIsbcoZKpgeLFOOtxOKal0cFCn+p+ikNF9GKmxjGENd6Q8MWgTaHVH+l6sMaq4FI/6FhT
 vpvhxZFAeE/sOAvCQnkJqHhCYtaF6fXFkuSRTO4eMyq1dMHWXxTQ9Lo1/UBINsi/YvHrniMsdv7
 fi3TFc/mxIm68i8ahUny1DvLamzdcNHpOUiCBpFVe50QKnT3nUEZt+Vwx6Qwsid+BfaSkY/X84e
 3s2cQSFrXlc5/sjrmlNb/vbnvS3JM06B6+6e5/Ac0Z8zQuTIXdjZO6wuodgUGzrrOAksYJIoATo
 Ea4/8xYhjDsnO1tUaqOt+DmnKYLA/MIwvBs/N2t+ybpJZM0ZHumq1j0MzkiIpDokDx5UdGWrxUS
 /1ynteKFLOmJsyQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXyJkodbT8zjNV
 Nim0jAnG7G5/8J8C5no6sAaJW4g4IjuSahWZ7KjTpkO/A0x5vOY3EshSF7bI1sFIpBjZPb44tNG
 jpLeIXHK4TtY/k7PAnfeQioR7qYav6u278BglG6YQ5H46IFoSvhfXmgUva/74khEMjkPL+QbV+u
 mqCrhkCqcURyLqWkL6WS2MTf/R3cID5/Thuw8eZJfBVq9MBqOMiGuCaTQ6+BPY68EyX1iiqviEE
 4Y5om0Vc3tofrFA5uMs8EWjHWBOaqyU6nJAWiX6pjRetkvTR8d8ZqJHJW6dxzfZEGGIcJrJBT47
 trgWgynON8UM1mdVD+2kZKXD5KyLB2OXROQ1Nol6qQff+kRvVrmHboOkUqvfwkqlncszeSIR+da
 uV3m0ybb7KeqtB1Qj3hTdlCY73Miud4HcsmJUuRFVGdl/KEh0OtQVvQfv0nEDIqDhOozrSq0ojv
 l9Bpm+KdSf04I/6XyHQ==
X-Proofpoint-GUID: aYphpF9liAQT_PsHbypT3tY0iLY5Pn9c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX1oDqFdD+tHBu
 HGpcLMAbMumltF2HJHbuPHSt0MznyVtUa64Z8g/+WeeLob5zmT70Kz35k0ciQxHYemhfqr54g8v
 BmDylvwA9D1M/m4/7+0Krow3f44+4VY=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9eb581 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: aYphpF9liAQT_PsHbypT3tY0iLY5Pn9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

