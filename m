Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE143B6F7
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312298; cv=none; b=JxszoJIaLVfDL5v+IlieS1uLbySUf9BDMN9MH9oISQjG5M+Y4+1T29fdIHC2ssiLf0OVxZjFi0hppupuTgCZnYuPQPGsjzU13+lT5fe7Y+gqIAqc+UmWdf+CcXchvMNlJbu6hqnhpujaOFVx7BJN6g799Zj2IjBBhC0FGLMedWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312298; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJsmFA3lDULC3okqqhH4NTqABvgnMoN+rwPdZN62AREFcUNgyIpj/xrIlg2qYGWEXfiPY5j+HdljOXVyJ1RaR0DoRg6qiGMPvDwjbZ2pkqi5IXQpgt0eBjFFFaHH9iJGz+hgpe/tnQ5LUoi+BHSrHfBxUgrpjBdr+VvikwEdwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goQonZ1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+k5UgZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goQonZ1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+k5UgZR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f2581088679
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=goQonZ1SQvWwIF6t
	9TLuQSDvjJNL5uQBHlKscd4ptZGKTVnXsIVvV9r90709iHrXRYNTent5bINnbaM1
	stcz3AsT0PujgNfKLXPBMLnQuckpAHE8PHBsqcdUDlpPNWm+hiKaUvgUh6n974Nx
	sqIAFBd7UTs1eH+iO7ps6JB+6Uc0ik5I8qOV7JMMZ8jMsZjEgIXXYMpjhrGi4kED
	jr0dXktak7K0NdldMyGoK24ceytcl9mx40rvJqS6S1XFmb0+uO8o5ud9cxfsw+W8
	Q+FypHdZlNHv0zeVf2cLaQXqKUQMrL2FWQN3cOTkCXfM2Q/7140smsEx1VbyARqq
	bypjyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sahp84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:04:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso7062931cf.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312293; x=1785917093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=a+k5UgZR3dXhnIokad8IHFSoZ7G7k/A9ughXem0gtK3swLqSwRnrZlCGcCgcqLYxTn
         RUIY3o0Or7JuZ4e6gFovbzgl9r6f4+VGBolg3RZl8yECTw33tc1/QA7NnTltyZIfo3kN
         A4t8K3OoAn7FYVoxBVt3PTqxvKJPE183JsZrFjwDtFXQxMPab5n+x9guw1+c/zYpK67g
         YS9UN9AVQrTg8Kjta8hrVHUH3KOhr1xgg4BggqG19ZdZztYRiicjRnAuoYUXEazS+lKw
         JB4QwumJjqkZ8uNPyVoA7hinuDOib4zKPNdLqi3uQN2sazimLA1PSoFMP9h8jX8sNeuf
         nYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312293; x=1785917093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=HApR01ygE69VQHrLCOcag+Cve6IvEVlKIXOhu2uQRGBaRYnVw68SiZ0RdnVjYSaG7S
         gpOyt/3t/OuereAhPSlK0aSD+xR/rlf36agxo1SVlEO50bAh3pSHjgVjQ7c5xEA7WMOP
         SwzK0grjdDYfWsvOsUCozRVC2zLj2MqGwEjmz84xQxCnQAtfg8rw9L1s9h4pncEYMdyC
         npw7q7VNJD3AwJVm4JLM4iBL8NN27aL7iSBdK2ehhg7k/eWE+ptovjAQErdK6cFiUYSv
         PZdS+QU8jstJsOdbTrq3y0ztWqfu7zdVlu83bqzoA1g3RTH4QBHtuaLriS/PDAEgey0I
         bWuQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+yRXh1GUiux69qHPDlFvt2eAFP+AlVq+AlYqw/KD5WQ9aeaa5sCIVM7yRozQCRTSdUEAYR13mT7H8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsny5xJSps4XeKdXeAFclKbC4SeK+2khtNd3YmQWLXB+kMIUfX
	4NjZjDgsrZhYg8gjRkLBGGb+whGVUbWScY08e/e84vBp692ux8ZXmWWW1GZNbJShTE7Zwh1Vi8r
	xmmcLWjYcajpKIIHtABGoi6arF2Zb1LYqwbK++X+LCUzfONpo4euSt1BoHGzLN93sFjh7jiwQzt
	k=
X-Gm-Gg: AR+sD10rdnQtKk9hqGH2Dms8kGaakCUfUkUU0ar092/c5g9PTi4YNLtvYQoTx5E0qw2
	PLGfIKDgUJxzf65UuQnky7q45YZ9ZnTLCiELLnV7Qfck/c3XhnaydcZo+qAlSLAU7I5RWWm+nkq
	+SE2XTSeJbaOpL4o7JpwNJ332Z6qwneus30sA2W4iCVgaNZVyEvT4fP7fqz7PTisUC8c2BfcORY
	QUuZcXMPyQuDHfggJuNEfYnmi+OvTxPYkCbp7ZbNSsXCOKdSFN5w1IQmlPZkrIMdDmu123VjGGN
	vB2pzGja5BbXiir+JDyHfG/LXBx2Ora8aeL38LmCM45aYJyvsEZsPJHiErsEc4Lzsyq/jnfpWt4
	UASdUxDgIkydkIBF6qDaTWHhtcVKiI6bKhgj7CCdAnjO74hp3mTdJvZF0LWQIUFGoOpNM
X-Received: by 2002:ac8:5f8a:0:b0:51a:8c97:937c with SMTP id d75a77b69052e-529d72223a0mr48095591cf.68.1785312293017;
        Wed, 29 Jul 2026 01:04:53 -0700 (PDT)
X-Received: by 2002:ac8:5f8a:0:b0:51a:8c97:937c with SMTP id d75a77b69052e-529d72223a0mr48095361cf.68.1785312292545;
        Wed, 29 Jul 2026 01:04:52 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:04:51 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:04:30 +0800
Subject: [PATCH v4 1/4] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-og0va1b-v4-1-ec7e7ed87b2b@oss.qualcomm.com>
References: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
In-Reply-To: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=+nrwyoUMj1zhCcx4GfuQDFd6VjnQFFDEZgBUhcQEP1OW6p42wp1Q+xRPgbe8LPtsKL37R680X
 C7If69koX3eCSEBXxXuWocTywazFd7D/CYgJ8bfl0YlDUUDARyjiKWw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 0OYgfXK4SS3PbdAQDgjPhySVh1Tnjfyp
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69b426 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0OYgfXK4SS3PbdAQDgjPhySVh1Tnjfyp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXwhPW8Hp3w8WZ
 n4jhb3Aw2VKdiqJo+CMrcuXK1bMh7BJntPsRL/6D2+ojpXwYBi/GzqIc2tRvQqcMRM0I9jG7Tne
 OtKOXY0F6oafvD3rT6gT9XUv3SM922k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX6BIskg567TeC
 BmQ2r27fuacXnGEFf/GE0IcY0jx97y+c9IAPaK7KZrtApyobCoa1QwXQU3ZSplF0aMfYXT32x5D
 rYhTuXGkBSi96DJueyfrXZDT4Pjb95s40Q5YRyEySds7JD0q1rrQ2SpagEWaOyvG9pKee1K25id
 SktryAE8jST2y8WqyZfAB+ncaJpsjvD9WvgLisfqTS4sphqYC3D29EdAMGjJBiwZSgoNkvUu4L0
 YCX77Qzxt7YkrNCdyGwKFWIDUSGJiPJCZTrigztntxXQ22kpgxIMbkqasnXIXO+1Ku9lVwqMJAp
 tGJPzTTiM/1dASNGYqyX1WeK93G4/9cQlB9KptyQTdGhUYLCeaXRetKbre+OcrPfx2LMRuKHWxc
 R2UyXaMflRa5ZXq0gcwguJit8sSZEn8vA6J4wAfCxxAD3AzQMCx2xVF76G6JZngd3wF0k6r6dpM
 734cp1iw/4+11E/8e9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290064

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

