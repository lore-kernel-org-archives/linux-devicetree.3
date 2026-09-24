Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDAC3932D9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230227; cv=none; b=Vkms632Q8VvXVbYBXl6NLzkWiu4M1FRrhb7pljICDH5HdFkZbC6JCJ7DvGQSzr7Fym5YoKOG8M9zI0BceT6OUXTIkuUfo1LUMRyQumRrHnlk2MXdku5UqqPQWnOI8wg5cHrbF9/AyqrEAsmN3+J7OzXtAfZcabQAYSn+9sx/iLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230227; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXy5La55FKmoGyAT502N1U7ik6Z3Fe9iokfD0KvVSJ4Q5scHGAbdUbuHPkYAGAvqPDtXR9yfUkb5bdafhDex17VDpeaCwRgcCbRV90yUnvkkBY2VbXeooLJkEOl6Pe6ZPD3toB5oUe5sJUfBPIjM5wdSpqiTVC7L0lxp1QXv/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0NbT0FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4Xx6sSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0NbT0FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4Xx6sSb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eJG1582455
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=S0NbT0FZIxcuhKot
	HDtBPzTEh4ryyTu4nJ6JZRXC2cku5E3yg4ow69g55l5WYr/a4l7p5szRhVfOrnPT
	L4GIJwkx18Ubf2ALsDP5oCF/hvgfAtuWGnW4u1NZueL78mzJBbf2DZ/9NiDNrjMf
	6ZttFXCUYyNbCfal57g/13A8PVBVpaDY6jNxmyZRrHT5kGR/CIIEXX0cf145cqv3
	9UF3vzp55UkcjYqaGseD122LfGqGX2o27/9mrVnCR4LtR+EwEA8wz0GoUcv/C+lg
	zAO0r0ErFftHetMlYJWY5mOs9sNMKBZmev3JwFDjxMX+N+gdYLWpzUJ1jysWcu81
	DU/5Ew==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkhru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so2379041c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230222; x=1790835022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=I4Xx6sSbNYee5Is/4CVTiopl8JXUSSXAwwCL0ByhCvD5+kqcWiylnfylojdhxb7MVt
         ZfLZwTdQffCjGr59mfZ/VGqZDJRVhAciXALJ7QPpFgMkLp9ysi0yWP6VEaBiZYndjz7S
         AM6+6Pp9ym35jWcOdCY+GJvQomr515o+IaoamVIqmJYN5JssCLtEHnencoZgqL99bPYJ
         tm8hzg4NeH15EyzcEGSYsErqHl2my6iGvKuoZuoWEW1HE+g21qU6Ghw4TFYfWIU9oNDg
         xzlgXQXGOQAsZRaPN3VWCkSHVXnsNDNMKd/zBBw3srF+f6pwfVjxoui79gkB9SkgBLFV
         4gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230222; x=1790835022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=EImg/gTebaaXondDlOh1nxnesppSdWpS0MLQrX9ZvPSFQdrumK9LyFKkhhnCT8tGiB
         iw+OB+glo9vQU2JyLz6JPqpBW/E9ZWni0N6ZknbznnRmMqCGUbcB4EhUZ0AVpvETVuo2
         5zAo5A/ONWSPU1Gl2zTl80pODTCK/FOmu97mbH5AaFUxFbx8PO8f4jPqOhEq5D8tb6Re
         E5lGs/rrWlIFdZwout372Na8YfP4vC+/rot8Cys7gveNyZWKsl/W7PzbH0ff/K6gr8IN
         Gr+3l5XPPdap++YkKqvZSJd01DC4TkCKDbBl9/mgd7pdRfEgUQqBaJRBIZT4ueuYvmVC
         e9yQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9411VbeCnSwAGNh65UIvWVV2PFAf3kqez1CVh+xEqqJsZ6CQJMZwrqNXccPO+db4l5D9n2h7yZzND@vger.kernel.org
X-Gm-Message-State: AFuF++m9dk5E2H54OgCpiiqpYCFFygLPRzNBYYeJsCovLevDztH72qLh
	1IZMCRMh+yy9Rgcv1i8AisC+qAvIwnqTE6biBR0k9tZqzpuq+VMZY2+vG2NNuJX/adK/E/C0Z0B
	6+fNVipzpQPE0eS4HDu0gc04gxVYqBWV+VwKJNeZ5OznfnN3Ck6PoF4b/Z9WSYUaD
X-Gm-Gg: AYBFou39Nqoe+eKMICMhCwrTn6tZ+6S6aa8JAE+pW/m1QGfErBGwX0WmmsGzxKGCPnw
	mOutUYB8nUkq4bLXCmcmV/1D2CcUvlQFWAkH48kU8AHHqQyleODdb8WO/nuOwAowop1wgOMX5gg
	Hgboup5pdHumI4pu4T0z/1vxJAMe2te0SCHgwhG99peA1EQ64ccmW2+SDy0o7PAanpMs+3rs8lO
	A5addfW+oyf6mdOdkp/ILELTcjjGFZf58wYg3rdQyFcO9l7swexteCcokq679rz6BoG8wz/LnDM
	hHDgenoaD5NRScJAINgMkGaJax+j4bOi8WeCvgDa05fN4CnhWt629mgTHOyVvL3YRzkAPx0Frz6
	yzbbIsU4S6rlQDMYR3s6Yo1GjeGyVwBB0azRMr5FTyua8ulHFAfb11+bdetkvhrFci7Wvg9PpBU
	jix0TMOViek4RrRK3aFba7qTtq8FLj
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1068099c88.6.1790230221801;
        Wed, 23 Sep 2026 23:10:21 -0700 (PDT)
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1068063c88.6.1790230221207;
        Wed, 23 Sep 2026 23:10:21 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:20 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:02 +0530
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-1-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX6PGo7KBRGp4Q
 rHBu9HCkQpFKZi4PJc4+0NKxxWWX8u3AsWYqZrL8B/hDyOmE2L/eZqEO0VQ8aDovZNDEt/A507y
 1Cd4MxbeyA6IFhSEhiEWAVJrR3dcUT7E/rT4YNgFA7VcVlJdsnX8+ERU/NWS8p0WAwJ5r0rGPe0
 3pjpa3mn5BoKcSzgUeC+H+UdYjj/D6Q2B/8GD5y7Z+TlnH5J+fMufKXS9vD8q1Okht3AT5xg7O3
 k7xHrYABK7d/sMaKLbkpqBNFA3cHK9/Fsxe1zTQaqW0oHDkBsQU8fx05vMY3SQuZJd2A5+yq0gW
 dRuGe00G+WAzUBLVtki39fFQH7h2xOAsk5AAEzFGjm536uOlFNKT2iPfjGUQd8SozT6owoqnbmZ
 YZyhdP7/DKcXAxzpMHMaeKeLtuZY4OxMqA3XoNXVBczidkjNudCGgijcKT8OtaNZ4sDhk6Hqp2L
 jkiQS6A9UR566E8l+Cg==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4becf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX/4sdrZfTn7Tj
 GxFfNjH8OV1nyfK/eQiYU5r+iODyJCp8KzRVKZGQgn3/oZsiOSBdjXdbByIBCFU7lvWKSYLYBCP
 DooA3vaCof0qv7JC9sHAH/N8lG1tqoE=
X-Proofpoint-ORIG-GUID: ZA-mrDjCz-JMs7EpcuGF4gcToKSjQUb0
X-Proofpoint-GUID: ZA-mrDjCz-JMs7EpcuGF4gcToKSjQUb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240026

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

