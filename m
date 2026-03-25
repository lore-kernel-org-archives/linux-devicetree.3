Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35813BD649
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441339; cv=none; b=DHT7nEHsW2f6hwkLLQs2xTAcG2WXmbg0ji19Snvhx5wVecEo6DdPHphqoFmvmIvX7p8H2w0x/FsNOLyEM97mC6Ejf5hBxWOsjwd3qy0yOEPJpDskmMV9fSi1Bv7OoMgHSLlFlnqISlRm5dFX64IXAqYGscBFSWVDUpexreO9uUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441339; c=relaxed/simple;
	bh=QjvkBHN0Ynt5Jyhs8+7uWPeH0tUdVFEn5b4Dr7UXA5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqjjXPO5EGcIjtiNFFhAhPMKQx6CsESwUK3cw9jbpktzqdkg/cbz42ujYA8siPXSsi/AarQK42aUKIBdZ+XMQigAoYS0Ckfmy91/pNHK050TU0PJUaa+kkeUwH/WfRD9+ur8qjGJw41g/ydlXjZ9mW+vF1LBUGT1YkwVlevvmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hu9JckLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRIeBNMk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hu9JckLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRIeBNMk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGOYC3922587
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eHIn9NS0KiffR+kOG1GENdB2A7PEdYJt6Dc
	j0vJAwP0=; b=hu9JckLzgxV9D1/XwASg1OCyoW2Piy/+z7cf89BHIJMasg8LZI8
	lirq1Yk8Y3k+O0/5EpFpHV6lLqiImbxrXS67v93A7T+T0Pzhh5bdjekRTV1PADdA
	ozQaYRKqeO1BWEkhoM1YsDP8Jw71TAPcI/XV5XvsJikoBOWD1jSRtT+yxbKtG7AB
	mmKATCnBOz22nbygfGx27UKX4/w5JUTdtSh11EYhAqDRsYnjtngYgP4NZM788h/1
	qLG+mRgmNLoynPaxAuDOQ557x8dBJpWuk0mdg9yK7jNd5tAkj+xxrtXbo+VGwcGc
	FHkAnsxh4jAJgHoXC46GpfA5KV0m9dZLxIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rau27x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:22:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899edf01747so483010946d6.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441336; x=1775046136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eHIn9NS0KiffR+kOG1GENdB2A7PEdYJt6Dcj0vJAwP0=;
        b=KRIeBNMk1v9JCjTw8KP2EcRejxEFPDFi6f38YGBBs8CTb5mu5N0qum9RtctaBsaIO5
         PXg9iGl6N9j0Fj2w8f7vfpmdkRrcd+JRa/gzZUCQ8du0HsoR8pgoKDJ4e31pexKYsDDd
         QL23XYxpFE9RKBBPBF0Rm/99geXqxQL0Occ1pVjqbIhIM7lPGKVA2rfilweslJRbBQ6V
         1YrOmWgpbqjp5nfphq2pjJTmAOs5izY6++z80PiqivCQg8gG9M72wBRq6Sr/1yT+5poO
         Mj8XFWf55pTbZPBZSfgE6wJcO1sDfXSKheoIReaI8JykCGQBf3Xw/ypAdHqNNahboJMr
         YiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441336; x=1775046136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHIn9NS0KiffR+kOG1GENdB2A7PEdYJt6Dcj0vJAwP0=;
        b=GPnSfGgmPItJYKfhD2jBz+A/scdiFtjy77pVbhuWEDyQkWI7u2Lg/D2598ioEIz7G4
         xVDSj68xEZgBJDifd5tUBddxFJZEwuGXZOOl35nr4M/5s/dKwyCWMU8tDaIMywkMAx03
         XBJqmaXYl5tu9MlctTB3RClaKwoCMpHWZX8l6wjHraPfg8NX1ksYmHzW7QoLZ/qEEbBr
         6PoD6E1z+JwYdlxH7Osmg2oLoncZtpB0UZumF4wx7P7iqrdcBIXwOs/TcoNDUgNifudr
         ukXri98u772KszN9p1s44N0MO4P44COAPI+TlFPEj0HIEb5HiG9eVx/dtcdqXTZ+D9PK
         G+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWUv9MFhgK+K/C3DAkCdREj0ergBhhs7jzSceO9rW1faSNUDbimdo23avw5PhtUuD+97EKzmG20peKu@vger.kernel.org
X-Gm-Message-State: AOJu0YywVLNvMBM1xD5OUkmrL8EYGefekx3lsEBlS9DeSB7ZAEco+iMa
	XrZ7w5ou1tpQdF92IEMVSZIhkVlFNDo/kZyofoFnYXYNsjvqXwAR/1BCJI9k7NaIUXKL659AZod
	yaAUpeXucpteeWZ6wfo7u4qG/DiNe9Ei5E4Cn55JF0Fs0hTb4yqNeFDq7m1xrVEry
X-Gm-Gg: ATEYQzxEg54znYXwzuYlCWl59nGm73OdODwGkqyCx/eXJcQ2am8EgFAzW4ce+ryMvT7
	0j3dhzyPezzVIQ13I9sRN0mc5yFuVmKokM2nkIhzCUBs2F72b4/IaUqjrGgmCZIBweoNmlKZSq1
	xYsSPAUASz2LUdYqEILcUcIUbIxhfw7jCe2c+Ebcx9qpdQD/z2hhNSmXLj5cXeXjyIaW6I6Yq44
	OTv4JgS5GxMqAbjcrGXC6Mpy7XTOSe69rTYJ5BdDu2nweuUQ+rTTtHHXS9WkluETkYxMdCCCSYc
	t/LGjbEwpJjqwB9hJQpKhs0MO9EL7Bs6NJJX8vcqxDkuApes9krCV6meglW197qTqMY16Gp1JQZ
	FX9xpjVivvf2NJ/9WwXrne1DKGfzee/cy0Sg7
X-Received: by 2002:a05:622a:356:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50b80d3aef2mr44187261cf.31.1774441336131;
        Wed, 25 Mar 2026 05:22:16 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50b80d3aef2mr44186581cf.31.1774441335439;
        Wed, 25 Mar 2026 05:22:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48717346586sm22144265e9.20.2026.03.25.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:22:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
Date: Wed, 25 Mar 2026 13:22:10 +0100
Message-ID: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QjvkBHN0Ynt5Jyhs8+7uWPeH0tUdVFEn5b4Dr7UXA5I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Nxm5PL7JhepvBXiMriG4QHuwZe/xicXV/X2
 LdVPi64EcSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPTcQAKCRDBN2bmhouD
 18VQD/9L9YY50PR5LIozttUq7VvDc/Zav5wjCsy66HYEO/CviFL14o1VuslvysysQHtUAQUOxfs
 ZU4he2eeCYS8g+6906mvRZeyDbYC9M/rs9H7OJhXtq0Jt0g/olh1tk9AGC/pLL+BOoP0e0YLf4s
 MLZcSu2CLsui+L3NwTpRTd6Zyurva98AwOZLeG4nCT5RD0BtiOujwp7vpLAIIPi++Z4EX3NHtiA
 GquD3taiXqidhgJSncgiKG0jJu4gzkOnwUqcNtE58FA0N/qd2VhwutBQEO7Wi+eAg0A9q8t4eCq
 Qfzlo7Ww1rllJtyL027qkWUfBSROzTAduF60YRZhrf/pgMu+nQ02Fg4orw712WPEV6LGBIztyTo
 4TCb23Ifk/p+3448PvxIQIpDGmbgDI5UgA4p+K/4xXcfK8Gxfr5ac6DgimoXvSLT8zBrpP7LpiA
 l9kxS820EG5annExGcaP2T1coGknn8VKrlUyYjw5WdO1w6NEDEz6S3PnjQehZr5VlQvj/N+VOUX
 ymmtRF5lOciXhs5cfqUjWXkmDgsGfJnhijbWdSkpJFUFE7qGSqe7tIVOKb3cCdAfDgowZfvh1b+
 7QBW2mwx31Wt+qILUO3m7t3g1RLVvvM3R8XY9R9bkySKnjmxuUT6RvvOVwwAyn87w1lTWjJfY8B mjMwb5NUCeh2Lhg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3d379 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=u0WoYhsv3NxjMHURO3IA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 6ShVZXevgfhyr4kWJpIKJ5ay_XWxWu3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfX1MHuARbvsgR+
 NLQMfh1oZdYb2o0u2Ytl5O6plRIhtKvlGlUupXStLggkViyTQMkxhfpZbUStMDiITH2HQ0if6P0
 JEj8S0wIyIPppQiZY/w+ywaR1hdf5I/bQXPCahpCBazBYt48OjQXFjqVeY1Ky7gDhhri9OaT6tx
 esxqC5rDkj6Cfx/4SaWsYxtK1TwLa6HLrm3u+hkvn61kRcfxGBGQP0wpGAuxZkIbVv5OdDU234o
 AH0bt1hTgvLERceTxbKy6LJE8wwALAjqKiYMnYOzuVdMb7QmG+o8SLtHOu2056CVOqyPsbA7IoT
 8lLciJjqLjOGyX03ZAu+XvB99SRUY10VtWSyFOeVEduP3i8kbY2l4DAQitayK0l58R9dSTI9FN9
 DvDU0nVBsCBZjPOEPNfvWfF0FCW58SLNKx5+Nv+S5lyXJLtVpR6e2EdPMz/ixhK23d6Eo9l5e/r
 H5tZYE/UNLMs3/G0GTA==
X-Proofpoint-GUID: 6ShVZXevgfhyr4kWJpIKJ5ay_XWxWu3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250088

Device node has children with MMIO addressing, so must have ranges:

  msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property

Fixes: 966a08c293cb ("dt-bindings: display: msm: qcm2290-mdss: Fix iommus property")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for commit taken by Bjorn (Qualcomm SoC).
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 2772cdec7e42..bb09ecd1a5b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -108,6 +108,7 @@ examples:
                              "cpu-cfg";
 
         iommus = <&apps_smmu 0x420 0x2>;
+        ranges;
 
         display-controller@5e01000 {
             compatible = "qcom,qcm2290-dpu";
-- 
2.51.0

