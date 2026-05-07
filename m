Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4D31E837
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132342; cv=none; b=j/KCsdfPYVU2XTPPyJ1h/2YRUjsk3uWowWBJQoS/05Z5Y1+JjkOqPMcLDRWzfdgARkCC1lnzpPLSpEWwpznNSvw61g1oCGYNYopqbUqNg7TzSlvXnCJxI60vwvj4PVvEDWjuQj0Vz6MDjbZoxMKn3Md1Oj7LOBoffEjJM6oP8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132342; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLjKWuUNeV+B1FpG+txco8qqG5+4URISLHruEpw2fxkrCauoaqg08XO51sib/KVRjL4gMpUpg6+g/X21SCdgobi2vnlXa/+uK0JHiWEdkhFptGB6ZhV6LeskNm5QlOKc3tWfrMdQ5vwCtRUIFzhX/12SVT0FQBK+VXep/1Jk8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8+IG58N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8MP5Pnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8+IG58N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8MP5Pnn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64744AK1151144
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 05:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=X8+IG58NqrBTCH22
	tHYBVMwUvFedaBdkj+jPp2A6Z5VSTbEXNAjRhLofOI8/DNs02laf9dYtPXHgwAvv
	M5WJV8sAdFwKWi7xxM3c4MQDoqPTO1X7cmv8m/qMAflSEL2gziOkj4kQRqgWu4/G
	ibsuSNAW6NnK9Yd6FdS6+nC0/u780+ik+KZGXOitv81kuK2j7aKuJvcFx8BxH+w+
	ZGXBjVYBcbwPoQJx13pXg6d0zXy39NPf1MODDHVvTGBKDMA/IX598RxQ7qzh75Ea
	ZgmKteF0+Mi0xhjwwJShi0a97KPnsc8ioT+d0TQVClfvcLOZSuhWdMiCrBANAwW0
	FKdEJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctr95t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:39:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-835423c69ffso269281b3a.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132339; x=1778737139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=J8MP5PnnUJxn3pNcaOu7onxfxXU6U7E9GD9GL9YYeJTcpjhkmm9GV+6tocS5g5yYIZ
         tw5ZQHwcl3KF5CSpQjEQcQ6xfMvaIK7uM5qamgOgtJW6YUXJd3ShoTd8JQQ9HRNOaZyV
         E+a7Ssf0pmS7QnWddHJJDn+moc5cfUaPCRA0kd2EYhugplrMwLMic93sfjJD63Q7IQNq
         YWE+9DQEatwnbXC8CB0bKlvjtgmMtwdzwmqfQHPo8nP9GaTLWvR8Cc8Ygk+R6uX2G1mD
         s0KwCqjZPLfzUUMBfjnot1lDji+Tc855U+1oel/X8NSKoSL3rzLi574EBF0BChSDLipl
         rN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132339; x=1778737139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=Khc6NPZoxeH8WIjRk9kQ2i6YG6Po4hubg0YhY2A9tLO6BIpdPGXvtoFjOlQvJjQa2U
         Zfycq9mjIjWjBHvHC6wOJqC3sv6eUoAFufkIDSznUP+7PHVYebOPqMvUSW5hGfYfyCgu
         /O5GXAnuQac3b/+v6IupJXTthkjTmI1lI7togwqAc2OqaNC7kP7pGRp48a5LbIO+2cAf
         iGmL29916bLkcXATsR7De5weOGuQm9fEXi9A1Qnp0YkDJuNuxKS2GMgiCZmDnZvmhlmq
         dgIFDdXl/9aRWNx5AKFdZajI87QHCn9c/BtKQB7E2Q2b1LoBkZIXAvZCkigrnOFAHvo5
         igmA==
X-Forwarded-Encrypted: i=1; AFNElJ+UlpqnU6QBTuhUboxCV+K4DRGeMIZU8Y6mA0CsLLuSQ/ymIJdhP8tcEsxO5yZV4VZIcHN6ZJ6cgk+B@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrIGjtNq4kkbQNpZoLEaqISrhF3dCiUt9NFiXBrSImjX2EhMt
	IsbYbuViQp3wFeSDNR2KO1Yd2CbkxMF60KKROyx08LswxLGJ0W4R1t5ZvE3VkyU7xVr5AUD1nJP
	tlCFYPDZ0spkmuVWTE2ZT8n8p3mL4aL/QnRFsJqUGtsr4plsxZB7HqJ+sxa/dnf1O
X-Gm-Gg: AeBDieusL3//Qn/xAF+v2n5JB9jJ+NAKq9CKDcPUHjyjbhCblVvAye2bH3jF1uqU3Lk
	Ptfjs1oZAWTVE+Qv2fvJL56saZklxeYjL91+46eguBmo6x1Xx6zXG5Y+T8Ro7VAhJ7fw7oyizpp
	GKOO3Ke2fMZ2yp+JhTh0Qh7AMzTpAYBoJg6fGCmHE/vDnpM4KaHaB87hoMLMFH2/nD/ls0RgQd1
	NSx7q0joFqy4SC+yBfG6kP0Gfy1rWxovUsN86L+II1yuMxNFOwe7P80bRj2QRm2xFs9tgHcaxn0
	otloApk1jR+FeZaJcFCq1rf5pdHWgcqCoWsQuJ78/OqJitvyvMn05a4tVvKM6Nbem31ihGimYjg
	mLG/+fUnDshFP8BQ2WRf562VvuNavXgF/YdhL0areNhajl42rYbYhXIaLbWR+pQA=
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr6243961b3a.22.1778132339367;
        Wed, 06 May 2026 22:38:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr6243923b3a.22.1778132338834;
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:27 +0530
Subject: [PATCH v5 2/6] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-2-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc2574 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: BNya6F2zU0KALW81xK41cUUsU6jurwJn
X-Proofpoint-ORIG-GUID: BNya6F2zU0KALW81xK41cUUsU6jurwJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX1XBEM3RNhenE
 a9mSR8nSotjnTKGUoWmpi3F2WyvcFr+Mp5OyZL9xLzTLOR7yeTJpsvJg0IEJ1XfUo8qRS6HaMiN
 TZgL0XIxouC1lRTvo9iOgZbsTqn6ORAeMZXwomygGQ3x4xt9d7dNXAGwuR0hpdEWA4DTN6sz619
 K7Ee5O3Div6dleO7E9SKEjthC7FG6gHbGX5cmVI2JNXneUgH4eswMYivgAtpdVnNlxjxPR7WySH
 J5rzJ6RnGQkc1jQyY+XDljf0vYIt/9pSLx87RFx61AFU/MKZQH+9aBbOQxi6u7M61QDUTfDgaNj
 FFG0EMHa7DJJ+ImR7ChXfb+AANDbqtzRgDjgOxPkJOdGhX8RnYtPAnrZZGgnnuZDeKDoaWX7n7O
 c7y3ATpe9VER467eFsHLP9zgUk/83m7DbX07stG04cn9SxbmupruVvKHqlAvkENdRytMyOCCZdd
 YMbzaIWX2QoPZVw7kRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070052

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1

