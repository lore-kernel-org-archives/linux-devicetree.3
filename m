Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916FC4E36EA
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733139; cv=none; b=N/isxG021eW7XmWrdA9NARCvDEXm102AsLZtQ1xIYEjnhzCM+7yzn2cat67i1IxNsp/5IP5PMECE9XTToCjER4CHc0gilx6ALBn0Q88TgUuzqxDWMlr3aMww2+8A3fvYx+aOwPy7njloU+ULfgPoVvNTPCcCT1g8a8ESpgI2XBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733139; c=relaxed/simple;
	bh=rbUOszSa6pKBjBFNE8KJKzGBB6kocCM3MHioANGUG3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G270915OMzNnNKJ8JnBlqvHKz1S3vuYclxFmN+Zx1zbu+gsG0+e3nEPlHYvdOyBh2M5pbjMZClXrerpGF8btS4VElPYgbuP/cvxG8H3crYdZl96pyw+Z6rJnKP7XlnJhqkg75h/ZXR1biKxxdN1HaRv+UdA8o8oacTvfqAtSTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPcEpqq6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brRMoDEk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPcEpqq6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brRMoDEk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3cwG3208460
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cI6VxWcYdbS
	4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=; b=XPcEpqq6twBEgiKWUqnDAa9d/KL
	E6JaXi6/w6x+P65QAhC3by8n0Faf114Eemv0MxQFZrdAVJvrmib7e0LSLNQBeXWz
	pe+KH/Eb0f9KIY3Hj8JZ5Wx4+/GnGhwWLnPYBpiQau1yTEAwYoCyNk1kt5gnhCD2
	a1rf7gwPPGG1aJjwkDNWJy6rbY2YN2hwUu1yA1wW4myx4Uw2HN9iKS/ZJqP5IkH9
	JPiSMERaVoajvkpPfucCF1HKKpwNj3dO7Yhl/eaEBzx/4lBzZYi7/JE4qaIL3gYd
	TYy91Ow84IHDyrlrR/hMCR/5fLPEO3rFHK1k0xgkRoshJDYBSQyPJQlxGiw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgddv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c9a55c0cbdso171061e0c.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733135; x=1790337935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI6VxWcYdbS4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=;
        b=brRMoDEkj20et4vexagtZPGR/DRUy33FlFU3dU3DrxjpiaMLhuos8f5BQ12dTDeldl
         SqqShXsjuuTRHhXpTDk1tL7w+NH/uUcwm1r4EcIPICkxLcWCJhOZT0AWwRqSMzjk2eip
         oGYpAUpM0RY2eZqflr4mcOlkxyZTWgWV1M5z9pKNtCHP2dz3gh0bFamR5WmIR5qjH3Wn
         pkOzKDbjha+Qyge/odV+F4oyuLyqN9P47TsovywYC9W8czs76iLe0gohgjFgqO2eY7sy
         Cnn7Tgpun/acKhEvyq29yMp6VnQ/DgMF9Cm3FYM6vFYCcjqKpONV+rLcnMeChyeUF0A4
         KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733135; x=1790337935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI6VxWcYdbS4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=;
        b=mws8JdqbrljTaNkKfNsA+v8YKQ24Z5oNpW0lojrKCQGG6u16dt/xRavb1j1ih0xJzs
         ChsMH7spWdafD82ns+/A5p3wrXWX1cHD4ru/+baajCRi+BM7LbslrALNzaiIIgIZk0SW
         zlMEd49few+JkehbkORUhiiGDm6ZXzZNZQhCDcUHn+8mWZjiPKUb1BkkKejmm/YkbuC8
         RXMU6xEjvmV+pIYp1KQbx4CBbV7jEn/4KSJvTDMEzoNxrWtJb2buhp8xjtpSn4+DuHA3
         k4f/gk0sggpN9ANIBPSz6DsYlWqtSoZsaO3zerspYvpcZe95h0eoSRkuQ+6UMhCk0Q5U
         Nq/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzRMgEViAEcXl+TH5ZV6ejvL+SEyTSagIedmkKJvK7qE4dUnT5O7tG2+iRJFs8nSoE1dfRd09hj8kR/@vger.kernel.org
X-Gm-Message-State: AFuF++mlgvDu36bc4Wxnll99bgrTwOip2pwhg9gzoD2Gm2X2Nxrhxis2
	FFJotCvnp4trK9tvFlN6lbW9PKpb4vfSIAPZiYXIcgf7z7gS+sQxHLky6wx/Q7MGBINo0ZfZMl5
	pKeHEWCiXJ6MrHsgMCiYLyTKNoG0ecWuXp7YXjDKo25hP4/ooAafBMbxqKO6rL7YC
X-Gm-Gg: AYBFou2nTCe/1rFI5a1jppe0pZLU1caGqPpaD9YtpKrPwGGkGTZgysW/zOSL6eO+U+W
	cxvh8/Ijv3aXK5k/NIyxH1uRumTzgJwC61rjpLB5s7kW2OGzOqCaMvK0K4PWVsYZgsl9bA7gee1
	jrelSMyen0vnVhum45R3Dvt2S7Lb8tg9JQyQlMO6oSNKtmXRX6etZCyFkTfvj8OeeXuweiH1BDK
	nciIG/vaFvAzeh77j9cI5qB6c2aMW/dGxBcS2DoSb2541ew2l9TgosaAPW8nPokHefeukie6yqO
	lircGD90dYZdseqh6u6jc2Je7ROY74rXMK1zlXO0nuR2WzscQGf6SRmmAYlg1SyOgiMrGWAn2c1
	xZz9gyLifJx0IIw==
X-Received: by 2002:a05:6122:1822:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9b59cc79bmr888355e0c.14.1789733134537;
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:1822:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9b59cc79bmr888323e0c.14.1789733134156;
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Fri, 18 Sep 2026 13:05:13 +0100
Message-ID: <20260918120515.595782-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX3AHZUpbKczDq
 gaIWZawWsw58h5taAvb2KXjJpJBxJkb5ei5rDXAiFSJAQXqu0Wx2weX3T6bd3TQvb2i9OB837rD
 qfcqvP08LWgGE/kD6zwMfQLKJ3iPNzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX7L4vj0uSlg4Q
 LxtqvF/h3rQEsirqQJDyaKceIYoNhwZMdTfj4L/x5QP+lxxAfFld6hdwcjJebANJypDhd9FKAN7
 MsHyUj1Kg5lvOumNtDsAAI75CWe0FF4Ln8zI765OtPc8F0LULvGOfMcZkx0f6R3g8gtn1z2rVFC
 KxpXhNo4NcJDH5mnkcMZe2iOJ2WIir6ECgvP6FH9u/THEY1/Wppl/mwb9Iqo64HGvOKYoxYzAbF
 03MnkCiuN6CLKYjlnLavEPKiNqgBSKff78Dpo6ikh5LMmllESgHoTolDxxm56bLcxPLCmuEYK3z
 UMZ8ZsGikkbzoasQ+jNa3nHsI1A21cJKLYe1M7Vy4yRlD6bxEcLGUfblm1dSmn6hty8yKX/KEzh
 2+XG5Pv7/wJc5BfQX5qhapcqoZcNTmq6kLAa+95Lisy2JZ/r3GeYoJ5V2JNGtl3D+wARc+hEuL9
 SbtSDvFE3RaWu/qnUvA==
X-Proofpoint-GUID: W8lBVbrB5g9uOAhxsVG6AyOfeOyeO8HW
X-Proofpoint-ORIG-GUID: W8lBVbrB5g9uOAhxsVG6AyOfeOyeO8HW
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad290f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MSM6P-WPhp0LPykjVWQA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cf9d940f7371..92326e0e7feb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -188,6 +188,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

