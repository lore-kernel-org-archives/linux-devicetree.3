Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F63A382B
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642805; cv=none; b=rWqpPcT0NGerFuZ4ungQInnvIAGRmkS413oi54mebxVVoBotmS/rzByI+BO+rt/0+nDefBTG2PHus2V0v2OQT5j8fbiDvQ5kyV7F57iom5/cIdcRJnYA/6mMS3XzyWYzpFNEvLB13NxR2zbgYVeclYA+uu5TfpkdvLB9Th2UFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642805; c=relaxed/simple;
	bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIT4fZPBsprCSE2T3XAkvZinm4gTia5Gz02bqTpoZI1ZV63lwrx2c5vQdw+7EYnJa4KfywBvEmrf87mP3aoKRsHn4yhaW7P+HB+sYYkkdOe99g5HRmK7VVoSBlINN1YwAHSkrDk6v1qOkeLG51+BHMKsr/Y2pZFHn656jL5JNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESWKwyAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6AGVNGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESWKwyAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6AGVNGX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2rne083491
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=; b=ESWKwyAaen7w7fyP
	XCCojErwL/33jOzVPaPm3niAoGzOc7p07HJ4TXTX9V9/nJqqF1d9jYGEW0iou+3z
	Z48C4sDbXw2AMna3xAl+u+bjPbjtq9RHc/GyJxlnIexdXzOliyrStAxDqnzivFQL
	dfNm2seHP0iGxZ3Lkm7oXLERW6luDjynXPHjgTrdmax0V1pZNo1G2uDHvLxIY73+
	Pw3bS+Wad4smlr7d6ZCRgTj2sxHGsVtzdrZ0TVdmW+BEoP9vF0C7NvWlMl1tTzqB
	6W1WI3+sV3U+b3F3vMOQ+IktKoBTI/jbNTDMUNHSDmTct1dLilurLLJDGLdwWzLR
	yleKBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx3cjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso117856831cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642801; x=1775247601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=B6AGVNGX6eH4aHvY1ghnBw0JRlPO6AD0S00r9/ceCyl7VUcX2an4XQnNzPzsZNCc+O
         kCP90KLLeKUQ1sXzQOP1sKCUbJVIzxrpFrjdn13PRd83g2+Hy1z6LdVXHzULJRO3GJrq
         j1ZeM1cbaxJNbWurmr5GhE8yg8rvVoOuGuqlR4MumCRLGW91BmS1vHaVr7uu5DPcykDm
         t74bn4Sb86R0edCEyt95Qqdp+81tE/0wIN63w32quYUb1t+OCaVEYRKS7q1h6FaDZ8t8
         nohEYhlqjwKlZJaIh8jLSbSupOjBy1x9l+TPNqlYMeAN3ocvGJLRzcdgFiK72Z+1VTFk
         tCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642801; x=1775247601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=PqW0wnanEmvkVLXCWCSQRcspi3ujouL+cLvNyn4SIzI2af5P9zwK+MWW4rcnMJzxcH
         QRf3ChzBk6J3CxlQ8Ge8IdVxCQgQ7yTyG3ltPSuMMWpcTRlu2JbWvOtuJFILNNGs4w/i
         z03zTtjQkZNsESJ3m/Ii6lTCaXEu4CovgYwSV1opuPGNbeKtJHN6Lq0zGRiBncltK3xL
         tM0MXcBWxA7n/8w3fq2rG5TgRJ9LD5FhxG4H/SJVQE7z2dJ3noFBAf2x2oesWzXvgRfc
         w0m34HvE1EtdxgymJkIHPSzjPIpXztxtMjLL2A8Xi2AX324lTpb8V6sfjr/QKfoAR3H6
         f8pA==
X-Forwarded-Encrypted: i=1; AJvYcCWNDo39xo2CS5+vEo6idfJRQ795o/GkrPafpV0ZVcjBzpQHQpvES5wpIXeg7OiyisWBZmiY3vTGyNZB@vger.kernel.org
X-Gm-Message-State: AOJu0YyTgx0nDJKmzG1Q9arndNWFepKyO3lGz4XQtb5iGohUvStEqOVV
	sP86Wvj3p6UAaxG4RIHjZjRBX381AASrPfl4FkIgurLbRgtq5aoMgYglYwtAD2TT45ziDQ+sQCf
	YLOvjfXjiXnTR/De0QDeRwP58AXtv2gp+jaN1ZFUzH4lJcUBvc6lYaCl+yVV/MT73
X-Gm-Gg: ATEYQzwUnNj4fMfKfpO2bNcbe9jW3SufoAmMWjfTCCc/wbcdTnHZGwxPx0lkk2WRTW0
	w09uOgnZOQUU+R8jiw+/iUG3tx+WZnvJSvQ5sf5J7QOPLzaN6chRRyk7ygFq6+7d7+8SQLTHvh/
	egBuXfgT7/sfkamkBfFaNDlXoJzYWWJcvfJw9T0TvGxxfAunieFJ+lBrXtEAvmKf5J1k78LZ8MC
	4ViMSUm9DNVGIzanEYEOMpqKpmQVOv0TtlXrdCs/3JD/0F8tpSzoFNLWaPyHWMrqjbHSuGEY/8b
	k2zOZJ3c17f0aGJg0n0Yg/2IpJ8l/IR2ssIup4XCRFrCOG6mqwrSAbMlvcQvDbHd+bss5MFNfn2
	Pxr5r+3Qo/IdwC6HTbSN8wshVJ89oF66b6M1hWpY1D9ldQX5zmzgxHxy/UL/mzc2D0AuulPYZKG
	ZQ1d3fBljHxIHKkeAKFD7jZholprChg/8CJw0=
X-Received: by 2002:a05:622a:1886:b0:50b:2ca1:4d85 with SMTP id d75a77b69052e-50ba390dcb7mr51876671cf.52.1774642801237;
        Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1886:b0:50b:2ca1:4d85 with SMTP id d75a77b69052e-50ba390dcb7mr51876101cf.52.1774642800707;
        Fri, 27 Mar 2026 13:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:19:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:54 +0200
Subject: [PATCH v5 2/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-2-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZrEeRxdm2oFgIKpGcq8XmJigyNmQyJIr2oE
 szumgoILv2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1TAYCACSHejZpuRmFQIxR1d+ocU4SxkFFv9c/A7YB3JfkHaHvPZkLKu3Bw2W3R1xrmXjCIGheYW
 770KS9OuLpEuaWC7dRp90a/+pMtTTmBTNChqGI4BHWNA3FcPwsUFuAbdrYKvfKa0hyeVk6WwqKn
 KhQvKmgty9HKOzw6g8LHGb+k8dypNKn52slDc5uEPYwi3Q+oIxg3mehhVXL5xFKex/gvRVxy2zX
 QyWvhhi5sCJBM0sohsB36BU8q54f2BNtw4hHduB1jAwg/2kIx5tNYgBGAFzgJgq+uM7JDfYhUz/
 O7MVcjR6w0r9wDeAxax5hvyDQqKVgG4Dl8a7kuATAzdZP6/J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6e671 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7-KpWglQYDKQcNoizogFyXt9Gwxot2Kw
X-Proofpoint-ORIG-GUID: 7-KpWglQYDKQcNoizogFyXt9Gwxot2Kw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX58mu3uB0CJuB
 HEwUsEhDwd8Lkt3cFKP1krOcFnQ+CPeqZczCr+AdzeTWRcPvZWb2tZj2Kzs48uRpSGNwN5JW6cr
 YM3IBrKM8jIhAPWqP4/WFVHgOhUIfmfH92I1sYmck9WeBqHk1uaHWtdu8RnprHhjUvAxY+g6Yln
 CdUYbMXX74Q61QqkWUltXZai95Kl4JfLN+/74biNUZ0yxg6knrOm1HJDnBkuMUQTlbLCQxeFGtE
 9J83PAaOHnuIeODZNR8VAuN8Bb0Oa2aVnJlacLezz45kap1XlbyO79HyOgzW4ijtLbvzBQRkq39
 TVWu7vLYUDaFpaS2DzF65Wa5mxCDrUP+zkJHSdcrqjtHKYZl80vWlKn1uWd0P9HxDLbLzwvfN+v
 lldaD3RgUCam/FTr6xgyBl22GH1ixH5FZrxRl2tRuBozpMd3PSLBsksKjCwI7e1L+h+gT0jrbqs
 CTRQU6nQdhYZKyLHWMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270141

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3

