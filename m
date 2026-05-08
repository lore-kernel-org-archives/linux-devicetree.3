Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37ED41B349
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266887; cv=none; b=m8Byxyj1KzZfQI6W/El7FThR/keww3Hx8y7YYF+KnkFMIJSXFq82cG054g4C1ai1WjrEOtQ/LUjpf9TVA+6nU0+hu3bdIZbeTXlSFXLpVZP0t1s3jC4coUe5i2yVXy5TC+PHPWnMp1LTaqTVYayohJyAfF+LdlM0+yQg2KnORBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266887; c=relaxed/simple;
	bh=0dWJdTDAwn0TkLi9oQbbPaM4nI+PhW9C76C69+j4eJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWbGcB+BwFF73So3WN680mby7lv16U4CESocodjMmrcRl1SjT869bFgmcxIwL2iIQEECa51l/uBW/YOQJdPaGWVxEy491NtpAmk9hFtcUmJK88JI8cRkw0iyWyF9o7GUJSWIDThhCc37naMtWxSkZsyoUi2WA3W5Axv6PXRmcnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYXzWdtw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KiBOGcOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYXzWdtw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KiBOGcOD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Hdvpo874283
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Za4FY71bjLDkMnLupG5mzx1Qmfy9AGS6QDY9irb9sDY=; b=hYXzWdtw1pLIDNgI
	bQneaH821UuAVth2yqQHREe2JJNj4VRjSI9uqTzlMCflolwz3JxKVCg0s0gVbeHY
	18/Xmi2tT9UqD0Fz2Hsbfe98NDVFdt10h428ysXHYdLt4wUGY2ZoTM3SJ+tIoFvA
	ycG7YkamZ3dKDIE63sT372+BWiW3yND4O/gotYH6OmeQ5BtWx1W4M+AYf2Urz6iX
	2F8mjognmrxHolgMJ8AZhCVGGKWiCVsXIpFtjDoAEH21PNxihfuN3E+kdSCggdTU
	mfVvXZYEVGmXkIp/kr3gaMOYRXXEecQQPOY8vm7hc1MJuz876pz7vNnv8aufvpdN
	n/sHnA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1me808f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:01:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-835444b6ce1so1755566b3a.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266884; x=1778871684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za4FY71bjLDkMnLupG5mzx1Qmfy9AGS6QDY9irb9sDY=;
        b=KiBOGcODM/bQOTDVFrLmYehYc3J1PVw6fbBsG/AYfLvYXyTjinx+vDl32kCYVFs5mi
         /OfI+1Ys5vvYwtJ+JPz6VllF4XMpzONMSx3WvEhTcW4sHhR+vYtsNHP5HOAywAHLKN7y
         QbH6zdkKMXFfmsre5ggAlpXDVJSJg0iSz3IwAu8QAezFab4s9SGdBWnCPn7O4yyDeunA
         U2L9C+DwAdex6UysUObeskCXwVSdXf9OmIFK2q7x00epE1BwHmTo4UPrIZqRCSFyr1a8
         h44AK9Y/FtO240O0g0sMmye91/zrXrjTT+1RjPlBj+JcTDTTS3EzgcSAHqV9v501nkv3
         EwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266884; x=1778871684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Za4FY71bjLDkMnLupG5mzx1Qmfy9AGS6QDY9irb9sDY=;
        b=R1fnr9f4pkl98W8S+DL42L2XBLkQxQYw2qbpY3etVtfWF+21/wHwCqnZLO1I5gJ9dL
         /tI7D4J3nx0U8Gx/1hcgzDykn9YvJxJl7oMJHABehqqrXyNU2MLGGNBG3bOIKG7xGOQS
         8Y1PS/A5U9rOBM2czYmO/VuIKpKSEpoxl45DC30kCdICgQGnZESR8CmTFHELJbN112lM
         bm7QeO5aym816JmJGFo1UaiLcPtnp7GpuC0czRs/XHAt52q9KJwMVrL5Tb2fLMS0+Xq9
         84SqdgbSxR3nr+wOaw/exvkJKI6joYxRNHDBxDS29ooHM1rGRNWstc0Ml3HU2yMDCHUl
         dS9g==
X-Forwarded-Encrypted: i=1; AFNElJ/a/1a2yMpzJfzqvRBixE6V4xtAsqtE26NIvQf+h2tOxbFrXIpOmOC7XRbQ9ruHZ2zT23K4/GbBLzfd@vger.kernel.org
X-Gm-Message-State: AOJu0YxtwuifS2nK8aEXDqGMxqjaYsT/X9o5QYDUS2obh9FVxaicjJ/n
	/Obtzk98eLEy6t06yW8lUYtPFfEyb2LOfuxbxf9yXqn1dZjSo5h3a9L1WVJ/ATfhp7Z2Av7BVkq
	LGvOt8vTQswAShhOEBvhiBM6SrP1ss8xH/em9vzRZIzxhKX5u/LBrOZphnx6t3Wyg
X-Gm-Gg: Acq92OHgR3+QWWULRNZiCqn7HndtR040syRf98KgAJn5w7sZ3Rnd34eB2QTyWuvMJJj
	M+sg3iRYfStBULo+bvJbyr/9XO2KGtXU8uH8N8/oPCyCbvL139ktfUO54OAgaItzyOOByjrqqQ9
	rMo/1dCVrV/NMKVRYrMa+D4fvrauui8SqksPrTZNlqZWTj7iSYioLRFghw9CaxDNn4tOt/6fss1
	R6qm9jqXwmBQE7+/x5J2yyPrGTq3LK0H5qlGAkH84Rr01c6AWd+yGDupia5yaCZZ4wMSzJXR3nV
	zuDu4sscsM1m58Krdru+c55ljLEt28HUCK5Pq8B3YO4q9it8gml5KmFsKN25zdp3RAt4BZG8w7J
	Nnad/FKmqjbWSYKZrux6xChfSvf9koYq4t2lFrw7eJZQB65YTb3rY/bY=
X-Received: by 2002:a05:6a00:12d2:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-83a5badef24mr13109505b3a.19.1778266883534;
        Fri, 08 May 2026 12:01:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-83a5badef24mr13109425b3a.19.1778266882880;
        Fri, 08 May 2026 12:01:22 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:22 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:53 +0530
Subject: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=7695;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=0dWJdTDAwn0TkLi9oQbbPaM4nI+PhW9C76C69+j4eJE=;
 b=/KHg6Fbbyp7bMxmwvQxCz0VYHfgfzQIE0Gbe+gRd72nMi4t1mZGyk/6fiUKwFB2BFzcEI1AQE
 k8lpBJaG1E2Cqc/ETPS7EMuueKsNCNqKuYCTExfokLgTurZiylNk4IR
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX353P1boo4z2I
 lFGkUoL7uEKG7WGi5FzHEbxrovi2IWI85ceL40hvAJsS+i/AOL0/lu4lkIZXBbtXrGrRX+oLDWQ
 3sHIeY4vauveO2iVdcNSdsDtzjy7apOxJHaTfWSF/2425i12agLpM6hAiENXjVGYyE1iTuGNZq0
 RmFjoDjp18HYbE30n+eR0rUI1cJAldTufRwjK7CAUHzmR2kgZF5lSdJxbzgUC1iwBfdbpNXIceD
 kSu9+HxMstXXPLU1ox8QfABgytUAeecb8xaj/YdBiiF+Vprso4LYtx9V/w8JmJXy5lPn+yQ8vyH
 z/hpi0c0dImGcGq2HG0eq9Adii2143V2XBOnhQNauXmaTqT3BzFXVGTlioNAznh2fIpuvzlJKw2
 WD0C+Avpi9J9FzFLDcH++5GpPtba4kZaWnBPPzKAeN5TQdZXKn4MDEX6kYYck1wQLL33VykoR9W
 H8sH0RAyi0zQwacUhhg==
X-Authority-Analysis: v=2.4 cv=BsKtB4X5 c=1 sm=1 tr=0 ts=69fe3304 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=w3dAq1wZhxS8m1Mzo3IA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 3ZJqotGnGP2U02NcIXeGNTnNht8vDasj
X-Proofpoint-ORIG-GUID: 3ZJqotGnGP2U02NcIXeGNTnNht8vDasj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190

The common schema defines minItems and maxItems for clocks, power-domains,
and iommus. This suggests that the number of these resources can vary,
while in reality they are fixed constraints per platform.

Remove these constraints from the common schema. Each platform specific
schema already defines its own exact fixed constraints for these
properties. Additionally, remove these from the required list and update
all schemas that reference this common schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,msm8916-venus.yaml         |  3 +++
 .../bindings/media/qcom,msm8996-venus.yaml         |  3 +++
 .../bindings/media/qcom,qcm2290-venus.yaml         |  3 +++
 .../bindings/media/qcom,sc7180-venus.yaml          |  3 +++
 .../bindings/media/qcom,sc7280-venus.yaml          |  3 +++
 .../bindings/media/qcom,sdm660-venus.yaml          |  3 +++
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  3 +++
 .../bindings/media/qcom,sdm845-venus.yaml          |  3 +++
 .../bindings/media/qcom,sm8250-venus.yaml          |  3 +++
 .../bindings/media/qcom,sm8750-iris.yaml           |  3 +++
 .../bindings/media/qcom,venus-common.yaml          | 23 ----------------------
 11 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
index da140c2e3d3f..b1046a112e17 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
@@ -62,8 +62,11 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
   - iommus
+  - power-domains
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 56c16458e3bb..3664d5447ccb 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -97,8 +97,11 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
   - iommus
+  - power-domains
   - video-decoder
   - video-encoder
 
diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..9c90e16679df 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -57,7 +57,10 @@ properties:
     type: object
 
 required:
+  - clocks
+  - clock-names
   - compatible
+  - power-domains
   - power-domain-names
   - iommus
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..1017e522b4b7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -92,7 +92,10 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
+  - power-domains
   - power-domain-names
   - iommus
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee650..120c9300789d 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -85,7 +85,10 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
+  - power-domains
   - power-domain-names
   - iommus
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
index a51835b22045..c4103a0452a9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
@@ -96,8 +96,11 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
   - iommus
+  - power-domains
   - video-decoder
   - video-encoder
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index c839cb1ebc09..5943a0411fc7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -87,7 +87,10 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
+  - power-domains
   - power-domain-names
   - iommus
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
index eabc0957b241..a5b45f95ad2e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
@@ -88,8 +88,11 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
   - iommus
+  - power-domains
   - video-core0
   - video-core1
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9..1fd46ee8a9c5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -90,11 +90,14 @@ properties:
     additionalProperties: false
 
 required:
+  - clocks
+  - clock-names
   - compatible
   - power-domain-names
   - interconnects
   - interconnect-names
   - iommus
+  - power-domains
   - resets
   - reset-names
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac..46aa5743d672 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -68,11 +68,14 @@ properties:
       - const: vcodec0_core
 
 required:
+  - clocks
+  - clock-names
   - compatible
   - dma-coherent
   - interconnects
   - interconnect-names
   - iommus
+  - power-domains
   - power-domain-names
   - resets
   - reset-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..060be67574c7 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -18,35 +18,15 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    minItems: 3
-    maxItems: 7
-
-  clock-names:
-    minItems: 3
-    maxItems: 7
-
   firmware-name:
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-  iommus:
-    minItems: 1
-    maxItems: 20
-
   memory-region:
     maxItems: 1
 
-  power-domains:
-    minItems: 1
-    maxItems: 4
-
-  power-domain-names:
-    minItems: 1
-    maxItems: 4
-
   video-firmware:
     type: object
     additionalProperties: false
@@ -64,10 +44,7 @@ properties:
 
 required:
   - reg
-  - clocks
-  - clock-names
   - interrupts
   - memory-region
-  - power-domains
 
 additionalProperties: true

-- 
2.34.1

