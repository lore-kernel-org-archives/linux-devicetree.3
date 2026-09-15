Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213E476CDD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464492; cv=none; b=nFiMsxJi6/ni7QPC8dRXM4y0Wctq7206KeXFphmGJNJe1PGNc5aUP0TjUOOkx5QKEclKpiSm+z5qYTyCRbmdAUZzvXvHncQSdSv0HTfYB3AxaYqUFUEDsRuDjvcqIEcjaJpmeID8pevdWqGdbbb7+ossqwbLG9GgPPiMyZdqQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464492; c=relaxed/simple;
	bh=TX4jqPBLlu4A2aYFMXqYAcpyR7z5nFViS5MfFWhFt3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fmc1v/BJHa68S/Fk21nQxjeQillQO1iXbtNl1ItptzEFhqZjCAfqGC0ccV3loS0403xj1vhG2UpdCNn9q3A4cEcMKzW360smM9QasormECm7EdRhV3jCbi256WRmxAlPwA3OLmQzqzw8dGSXt5lpc6N9XfTE+a7d5iJ0VB7FuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C4rkHS2/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jj89EcYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C4rkHS2/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jj89EcYI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z9LD2167889
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOD1KP36pobZqUuAtEcmWFCfB4SqMaD8dO+mChPrfyQ=; b=C4rkHS2/MXlMdPl4
	M4VSG2VHUr4+i011eQzf8MREF5vSksrICKXIbmOEyFD7xxZIsBztCz3jLq3k8mN7
	qHs6wMKTq5yeE+7CSfOgEiADryjKMnSvnOujDKwPCI+GSfnGZrPD3vdtjRVujxRK
	JG3orhmTG7rKduEskWPAdlR+jS+neAKQuzESvARDOCr/yyLFD4S1hCq2RptKEZyL
	QUyKjmSbRNCOm0gCK8JKskOFzG2MIq6UZYG1xBEVYdP3+IpZ0zsovbloMQROq/BH
	ZArrF8zh1hrhCXTBdjHp+GliYIsVlxU/L3fIH0VCQfsNizrUG7G47NQgkIf4BUB8
	Suu3mQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9adh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:28:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d206e2b4so87882201cf.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464488; x=1790069288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOD1KP36pobZqUuAtEcmWFCfB4SqMaD8dO+mChPrfyQ=;
        b=jj89EcYIqXPMe6XmsstVwG0O3jTttaqvF0qrG13+ZAlHnrJU+A1YR+kHkY3GG8+XT/
         x3yIqJJK0vCdGIQfkieJAhZm6WxGRs7STol54XpmRvcSy10+47v7KdErE8x88kKhYG7a
         Zg3YbVqBXHCraURoLxJvkQnEVrLEp5sNFtmDUrhv0loekNJWREygKrWil4Yl656bHCrg
         pDaPB+4sku2MJyunWu2+27t6SDiQGm99akPtBfKkExerXhWORPNawtRXfu2qZtaiNe0I
         AD+muDMbtijDVtZDDpXBQRwI/GP4Q+fU1iSiz8pcZdmsSkIJRgjJMv/+GYeZ6aXUThJm
         6Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464488; x=1790069288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOD1KP36pobZqUuAtEcmWFCfB4SqMaD8dO+mChPrfyQ=;
        b=XEapWOCdgIrJ7AfeHDxC5um/tmZqO990GqZAP+N+rz+/uPLFtjyvFLELSEagxNS/LC
         vqlZfOf6PZFSuV/IluXja6OIvAuas/eUOPJF1UZnEwKvLZhVxH/19xKcwbRfKdLuONwo
         7Ui9368ibtpPulC53UplkjwY3Nll0/M1alw35LED+iza7DQpuCHLdJIfLUbx/CUX78fZ
         zvMmdP4J0szzbcc8p1EV9pnS/QSH2pwIZLtZx3canYYvhYj3S8uN8TlUwnn7KYhTEjxY
         ZUJXB2loRTa0njLmXVsYaOLKGuuwapMm7/e9FeAw92oLsLmTdQt3aR6IEpPb8aq272Dq
         LfWw==
X-Forwarded-Encrypted: i=1; AKwUvBy8UPnrCrWBU+lPHczvtgfeJq0CKKq3texDc9yTBDciC3ePxOWPPxGjVvq5IK0v46CFYvqrscPrSI7m@vger.kernel.org
X-Gm-Message-State: AFuF++lPJ0LAlEVSkiHUHqbcLaOh9bw4Nb8/yaYnU/rgOS8zKAivf9cy
	+b+TeuZ8/BXFIAh4P4GwvjNJPulUUKE72hED/u2+HTCc7MzZSEjoJ9EmyeDrs1Po5bc+a//gvnz
	MRb2oOe/CPmd62eIzugys9NVy1IdNeTiEWNL33n2zKKkb3JtVWrMXFHFU6JslzSXh
X-Gm-Gg: AYBFou0mwCB7/+3R8DFCSs5Qg9/r4TcswvxGRpkFzW6ABKRvuWT3MGMCxRxM91V7rqm
	ilzMJxG0b8/Pb8W5INYGSLWeipvzYCwZMkVNhRYFW92I2DGcQ9v7tMWoM6Nx4NmFPA28dJOtFMj
	zUXoIV70Q0NLOKECJdeX4NIAje6cmTecsxrImV0qPy/OkAI9YV0w5uYvwSAf6UOMbC+5nEMIisV
	SoYQHaB43e4sxrQklq3woI2HshQml37JTmWk05bkle1tBKkb0jinQHA0el461nkxpie3ER9rR74
	mp9ZDsR1FhzQN6wZTiHwIsKENExWc60eAtVayExIx6ixY4aVvIDB7D5AQtxdFRGihOxXv3jvPvO
	0/QMR5WMFFfOkeYfcVxuVsAodPF3Ac51dfdvShg3Fy2TXrVFv9ySEqNfAktUxKCs=
X-Received: by 2002:a05:620a:460f:b0:93a:e8b:2df0 with SMTP id af79cd13be357-93a299efe8emr946843785a.40.1789464488384;
        Tue, 15 Sep 2026 02:28:08 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:93a:e8b:2df0 with SMTP id af79cd13be357-93a299efe8emr946839385a.40.1789464487826;
        Tue, 15 Sep 2026 02:28:07 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a3f467566sm18939785a.39.2026.09.15.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:28:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:27:48 +0800
Subject: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464471; l=2699;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=TX4jqPBLlu4A2aYFMXqYAcpyR7z5nFViS5MfFWhFt3A=;
 b=ccj30gophPm075i6Y68UPWPfvwlgy2kmluX43cL4bGo28OMdYsKYhTip3oPMJG4Vzb19Q3NIY
 7imkjaOrf96Dw5N/3TJKbl1cpR/bZ+4iE7UR0/58HmUzrgEskLnqoyW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX4R4qBfHxvgyD
 j1rjl32LTayCGQOeXtMgZBLbP6+E3/ZqovJKozsSYmvvkyg/hjS5+u7qymWdYVnnwDsEw8fmGJh
 LoFAwwhWoqGfuuQhpQdngSOR2F3dlxU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX/76yWJVujr3u
 4IC86ndDZEmaMEUEAVDFpi5/GIaLsvSddSnbPbxCKUVLZC46wt0WH+VCU7wcbDIM1G8LiNDxYhT
 PT2GPrECbOMNbOuGxJvFsP9R1BN0/fKTaatJ0aZ5Erzw0VqGeTuEaSWtRnUKv2U2IGyTqgu3zWd
 0qUPJL6kIIkGkZMYB4H/02utsJ4yzbQ1IsLDliP3CmVBrWOi0xU145TKIQuIiV2BggWL2OZFUKR
 LBjebsB/7B+Mw3Gc2FC22S7hhsGLUu5mSxgqRFoxvZh+r4XD4rXeqWRKMvZucoxttolKMOjYffg
 S0ZvgnHSFUoilOFcc9GnunBvdbUqj+9ix7ktTWi8Umt9P9OuHlwYs8eia88uXRd5xtKHdtniJuQ
 ztAfREYVRuZjoAtdtlIXxsDNrN757rxVBRyaIAVtBmbcr1gHcLGNRn9LRB71qje7OEpuXF0EBOA
 2fTNsU5TB+hpi4ucVRQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa90fa9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ObFffn2ZCBQ8pwh_5TYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WQ19tZlQJb30_d_Xr7U7-XOwqBwBqXSt
X-Proofpoint-ORIG-GUID: WQ19tZlQJb30_d_Xr7U7-XOwqBwBqXSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150135

Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
that powers the rest of the MDSS hardware.

Describe INT2 GDSC as an additional power domain of the DPU device
rather than of the whole MDSS, since it only supplies DPU-local
source pipes. Restrict the schema change to the Kaanapali DPU
compatible via an if/then, so other platforms sharing
qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
existing single power-domain constraint.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 3f953aa5e694..19b791a857b5 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -25,8 +25,7 @@ properties:
   interrupts:
     maxItems: 1
 
-  power-domains:
-    maxItems: 1
+  power-domains: true
 
   operating-points-v2: true
   opp-table:
@@ -53,4 +52,20 @@ required:
   - operating-points-v2
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index aa0cf0ec5b93..88aa71d2b912 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -61,6 +61,29 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: MMCX power domain
+            - description: INT2 GDSC power domain
+
+        power-domain-names:
+          minItems: 2
+          maxItems: 2
+          items:
+            - const: mmcx
+            - const: int2
+
+      required:
+        - power-domain-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

