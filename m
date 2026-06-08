Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B23859C3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902128; cv=none; b=Wv8a9FtX9tdQyjYZ2FCGqNCqcjkvJjq9lpUlMHAD5pALN3d671a7h35KH8b906OLXCuwqXcIEXhlD8grs5I03nihFROwhq0OTQVj6j2KSyE4/gPkPxEz5PriU9lq80MEKe5w/9IeWt67lhpy+PK3KxwVsjRCoZaoWnrHEP5NtXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902128; c=relaxed/simple;
	bh=f/sCFDjTgatU0BGy4aowz36ZzDRGX9hyPbW8Spw3VEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRQCROpYs5QuGsyM87Z+VZ/EuvcpIaikL+fyasWKHB6/Y9rghI7jyarRlo056bIjfcTQrQAtw/qqvbR7pBg1GbG2RXVuXZEVhKIZmYztV+8lpvEEm7AD3gFZPHn26FWfmt/Hp22vMO5Qy615R7xc8xM22mx7znMQ8zXfGzrcBSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkjzvS6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HINXchZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkjzvS6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HINXchZ8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuQE2832965
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=; b=LkjzvS6F7bXJ4tOj
	C3sz8nXDmROsAjh5QWk5fvuhZV5SLFkwDQvzt0TCTge6v4ZKqKcUJLhgTbKLu18L
	2K3oLpCpzUVIDkr3ZiHDTWSh0kba4+pgsRlOMWAysVBu4equjwoNOrwDysludr8t
	fEiZKyP+h7wEPWLKLYOOEpqCGqEN+KFlUo7o5+4EtvSVAJWMCO+UH+kwFF73dw3Y
	j8/uYDV6FDzQD+/3FkraiDFTR2j18C02fzoRXrSXpVEmCDuOtGGpPBVVY/GxaqoW
	hYqSlMXaizdn3WewH4Dp3UkNPrryCB2tu/sFrHOPPy+TSy4BNEsX3f3ogRti26Fi
	cTuekA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmreeva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:02:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso2717307b3a.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902124; x=1781506924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=;
        b=HINXchZ88Fwr/h7kf/3ZFAjMcBG8q85e6FiI9yZY/3JLPFAcbspVEceW2ueKYklglu
         JdWKskZb2QyAQxhrHv3DZ5pvZlJ74iIDszq1HDgkrzyEY9qS74Rxf8o+UjtdGYNh+j6r
         eLrMhUaA2XXsk7WchsDOx8w0mx1FP2R1TET0zI7Q1PWFFyxECCTVRJXuyFJ2DqmBCBZF
         8200/xtI8G0Dl33kUi3+HyCQnb1drlJXEjSGs6ArCGVhPenza8jkswu2ek/m0yvUiZIF
         PwT493i1h641NOlWuUhXfRDS7X6PAqa76Aj0j5dBRrd/DD52jBUt4I+Xd35l9GHNzYRg
         NqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902124; x=1781506924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4SqlhiCUHy+ItpDoHiIxZ33OiGVmsHhLICsi3glIWBc=;
        b=C3gz4Zm3edwTdYxC+VaA1eNdL4yIl0a3+4zAH6RwRiUtCBpInXbTvacg/EkuKqVN7c
         1SNq5gETm/fRUjcqdVl2JEqp/b6pxdnHMVWo6yq+CHQEVaStYUXsu3W6xl4vIecmX8bo
         oPvoEXqP9/O6OKoZGvPJ+OA+241ZfmPLgKWzTCS2bV0xyfWJXICM6nwJrx9295Fep4Jm
         OsrJoWzCZFQ7ULZIFcnOGvnr+1VSzzmiKNu+8+dvnIPQXMWILto4a53Fmb/Gev/N4a/L
         +SgOBYScnCeKruN46+rIrq1JE2TSvHGgGz06wu0kKLRDje41sgan59GQW2yf1BmI2HUX
         hPFA==
X-Forwarded-Encrypted: i=1; AFNElJ9x2J0xfpcKbp3xnhOOaUv57gOPjRbzmUl5x1r9KtAkhGslfBkhUVIcK8bNhZs8/TbDGRZbQLKyLdpQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZabvxo6zZ9v3a5Mn3qbLL7eiCEMU6xh5t6t/Kf8Q/PXOuHRGr
	ALRkRihfhdcffGyQF3fPYuCeFHBim/yX9JRFvbtqzwCLTWeGagrX9Iaam6BPM6O75Ts0pWESH6h
	+amF6Xv5Q6Ls0Yc0AUz6xWW+9lN4++2ot2rZOAi/un0q3SSe66z00t89HEjKbJ7UL
X-Gm-Gg: Acq92OEnN98R/i5i4LGM3qXpgllWypWkKefPTawHt1UZyKV+GuHx8t2GlLL/MSjKZ/a
	C52ff8n0tRkuFZLgVDEklXVnLkMIUYJl1rdREGvCEOmZ3E3xTiwhCDT6rwyxG7Nq8Dh7Qf2K3yM
	720Uu2Lj2WHkI8puHlVcSEelT27RiC91wO3kq7Y5ZCKtYegdl2nvRp7zEyIJAGXUnxPeDtiwb8q
	lDVmU38MFE386AHguoSqSAq4750tsbgGaHVVhF1EKb1c2FfKqP22xaC3JpuECFJPQlTiI+Zyapa
	JQcjT0Rn+PFhAMVFmErXDHOFBoQ1PAo6PxIudN2LjrmF5KAMujENahY4iMx63qnX9A+sOUPSyIy
	ajd8F2NkzQxp/jFhGIh77W1H846ZJLvqVrCDJL2Vcllc9Y/cMjk96GTSbsh0=
X-Received: by 2002:a05:6a21:6b8c:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3b4d39ea8d8mr11958827637.1.1780902123811;
        Mon, 08 Jun 2026 00:02:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b8c:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3b4d39ea8d8mr11958792637.1.1780902123334;
        Mon, 08 Jun 2026 00:02:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:02:02 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:31:42 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=3783;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=f/sCFDjTgatU0BGy4aowz36ZzDRGX9hyPbW8Spw3VEo=;
 b=3x+ZlUOf+wBvB+AHBU7fiuERNwbEV6hSQI9aySyJjZAyO4j5aINgHa5ClzJ3B/FdpAky6FC31
 e7ARgDXnF/bBbGnNPhCthcBG2EpS3e8W1qCplKY/8LUfa9o4nFpoBd7
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX/BZpne6kZL2I
 hGgpPUdS38/E91qD3c2NvEtE5/OtqONa/p/ohqW9ip7pAOFchchUUKeBlpwftaD+Z+i8ZH5SW2P
 nijiIj2NyzjxQQG+2aANUtrsNbr2iyvJvL6gdf1bjRD0AI5rPQb67z4ymJkNWBUpzVxgiSXFHEt
 +53nVfgJ8i3VOciPrXAqV0S+DzTJBC9lijZubjCxFuQQV3v3QSMJo2ZrNPlsfCTX+c1Lpu6KidW
 lCyJJZOQobjzhYH+xynMNp/1rEOMnIyYZqYnc11Wkb84zrgHp9XHMWIgbvUVB9BCbgDc817BGKE
 r6QGlPZNAkaJEwKcaS1ui24zaz+qNPgR+kOD6hJQ7zKiCy30d1zyKs3+GHPIggGzaZ6QqXTsBi2
 0VoCYznca8tt8F+McqYB3w6qHy50gcZ6XVQdTmLdaiKQfhVNvV7UhX6NGLjHsas3qyyozL20zFP
 OyNISeaOFnZyf4qqUlw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a2668ec cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=OEkpyX7SRU1z48_sfK4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9MPtrcgYoTdWfDQu2UpPfD_WTdGGkppV
X-Proofpoint-ORIG-GUID: 9MPtrcgYoTdWfDQu2UpPfD_WTdGGkppV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062

Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
the existing qcm2290 bindings to cover Shikra by adding fallback
compatible chains for MDSS, DPU and DSI controller nodes rather
than introducing a separate binding file.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..fd0834d09ad6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -47,6 +47,10 @@ properties:
               - qcom,sm8650-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,shikra-dsi-ctrl
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..034d3df8d247 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,7 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..49a7b5c4c678 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
@@ -12,13 +12,18 @@ maintainers:
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    oneOf:
+      - const: qcom,qcm2290-mdss
+      - items:
+          - const: qcom,shikra-mdss
+          - const: qcom,qcm2290-mdss
 
   clocks:
     items:
@@ -52,7 +57,8 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        contains:
+          const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +66,8 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,qcm2290-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1

