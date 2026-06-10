Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E33749F6
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126121; cv=none; b=gE+WklEjmAe6J3XiMN64y99dfbuY2b3xg4zdNZ35UueRmjFvBX4e3s5N9huXBZ8tFqbYfYscIdCBpFgg2M3DHYT+axdXEzEWOFfoAHMaJmGSS2yzwxkAGNt8EWIG3a+rP8X4vjzU5H6TTt9k+05XrtxTj6u75/xp7KROjvJwzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126121; c=relaxed/simple;
	bh=+3kjodppXc1X4IP7oeoSIR4jJZKI/v7VmoJ0d/Vymzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHYfeVyC1bJBINpYuGsl7QFPSZSvywCNlPaKQ2yVwq/tojHMu7wi8zkqWlJKyOUOMdq8BGYEhmZiTR9U8Soww7wQI65rBJ+zkRZgJUis+PEvPEAi4SWMpvbZPp6yxaaoYEe3Wup56cb8L1nqXQaGM2GvxbqUUHVrZj199VBUK8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBsiYPpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h71wtXHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBsiYPpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h71wtXHD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJioc62491001
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	glU2Zdl+5BB7aU0+/FquWdehxVMdTHFFprBfn6zocTo=; b=IBsiYPpkEZwZ+rOY
	Do1J8o9pnk2OlrCyjHJSYl+R53TXzWXNWLRtpH0/Tld0+WFiEkIE6HJ95ieikDTy
	lZcqU8OJcNaWPqjqS49rwu735T4aqU3ESCghHLFwD5b3OFluX0X2SaSI8cIZi2Hd
	9FCipzGfE6lg/KsbFXrPimy/pLsXmsVAMCGZ4iOaqCMzmKZVuv+eipE0vQQPtzGu
	jIvHqNZfTwL+xeofHuarj2HBr2WX/aWra3/yzPkfZmw8hICibWpV20r/HKwwaKn6
	ngEHd13dutET/uzy2UzlRLKtaC2PRj8nJGD0XThh6QTYuVlCpI1COQPVvn4A8KNM
	AlmFdQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u8c58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so6819156a91.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781126118; x=1781730918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glU2Zdl+5BB7aU0+/FquWdehxVMdTHFFprBfn6zocTo=;
        b=h71wtXHDnHLtQn42sljfc09lUdlgBVudAoAhFjT54cXjup5BWEHR5ui7+33YE34EU4
         69gmXQtH435X13thWxjQct5L9yO8mTX0Sn7bNV5u+KJlE3tciCDjCedrSRiGb/9OBcaO
         d4R9iib+0vS7uqWll48KGNIu/TTe9eRK58k3HGcoO7J5z1eK1+FPxLli7AhG4z/2Mgdb
         kI6ONKselGj6ffbp94v+vMXgcH24pHAgt3oUZxXpWWoWJ6vSVf7cWbzSjqvJxbotD6mQ
         QdvQeOCxuygN7jpB0qGUM7lNI46ctExtLp0/p5/bOdpo8c/iGwqhzgDTK74SntAmLQGC
         fyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126118; x=1781730918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glU2Zdl+5BB7aU0+/FquWdehxVMdTHFFprBfn6zocTo=;
        b=r+YtC4AEtXuYjrrMwKDJlOnmasQJ2D7qpHwWu5PwUYDmHMYDWQbk3kpMUsf7uJDSnL
         TVFvRkXgxLlGjuSvDxodqSRa94roXPINtkWjdH2kEsg6rA5V3ZWRpQjIje3rQkaCbxfk
         hV+JP3N0kM9KV4wrgrLtdrkaXTMUhR15WUli52GdZ2k8OPdSURGmIQwO7zfhoDKzbSIr
         H+Bh1tDhF1/yEbSmhJP/ax3ibCBNPb2LqXZ7+6xzCKoiJZaZx0tNIy/Q4+t/kvegQAsA
         GUFMGPdApSOc5W6sVctfutOUNu3J+of4KYQbHKeaxRiTR/YR4obAl9BPAuIsUsUGt7+P
         w/eQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ifWyYo9yxnM+ud5y9jrn5827VJG8PuwhqfuRTVtry/6B6wgJ6ePUpJvUD58XbHe8Y1QWaa7aeTySe@vger.kernel.org
X-Gm-Message-State: AOJu0YxfuWl0FB8E2FI0cQLlhbglvvhG4IoqlIO/KctFtU/syqn+iZTr
	FnhO6TOq02uUk1m5S5eWpq86hguTz+OdOB4R+BJSSLlGNF27tCtTrt1/a9IZHnqJ4+Ntpa/gikX
	wtTI5Vcg85mJSLS09NuXNCIMW4jDVn1fVuesrMsyA34adzmu2C9mm1vUZOkMYLJ+M
X-Gm-Gg: Acq92OHfZHHNH5M0NJvJ51XMVVWu/vGIKKN8IbzNUh1C5uAKiaYAPecJsEHGWQ/kqhB
	Huh5WyuLY259nTZSOsWZKAnkva8AOCvPB72GT/jmsh1W2TVc9lUG0ih/qyaaAmDwn57zb/dMnIu
	kRYbdkSlZk1tXlERvLiDJTSXc7h4X64ACvo5HFLg6zBjGkvpyVfJLwN4avP3hHz+HjihFb3jyD3
	6HscsFFdIqiCsSFlqyAOgi2xXNjosTjHXxnnMPjF/m88e1IEnnYU85R6gEe5tmG14KIlt/xKrMh
	e34cr9rNvimTj6XrwBc56th8+euxfng8rNRAqAHqQId+S9uXwbkjCyVG9yETV+Pi1kEin6pOiCq
	8pXRKCXD792m2aoxF5rMRPT/SNJmgBASaKkj+E2Z27V4bD7U2tpo9rUqIxw==
X-Received: by 2002:a17:90b:2e08:b0:36d:a510:f908 with SMTP id 98e67ed59e1d1-3751f35bddbmr10021221a91.5.1781126118297;
        Wed, 10 Jun 2026 14:15:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2e08:b0:36d:a510:f908 with SMTP id 98e67ed59e1d1-3751f35bddbmr10020848a91.5.1781126113068;
        Wed, 10 Jun 2026 14:15:13 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d01cc6sm309490a91.11.2026.06.10.14.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:15:12 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 02:44:56 +0530
Subject: [PATCH 1/4] dt-bindings: brige: lt9611c: add port-select property
 for LT9611C
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-lt9611-b4-send-v1-1-42abbcd3bb1e@oss.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
In-Reply-To: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        boss@oss.qualcomm.com, qc-display-maintainer@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX2slt+H9/wS6o
 CCk+U+b2J0qGdEvHvhGAxUHonIp1x0Y8mDR9QDIrJnaanTN61hMoWEZnlZEFcKzpXjFBOBrx/eK
 Z2GazWVYEbYevyJXKtFLoRV7AMBihO8=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a29d3e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SIeAQ9iB8I19DNjXgjYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfX5T6UTsiNrWIv
 xIc6mytl/cf0M3QGgx7DgdLv3MFoxSoLNhoFgthYZJqUC/l9Atud5lEQfezxKzR2ozMLlNR8MQJ
 T+fDM5Y3hWpwSaiGT2Dpi0boJ9T8FoM+p55ojev18UIrezn4mkUeb9PTz6FwIDUODlTgjPmjFvv
 VXfKGh8egKblRBHdR4a8EEJJTImjJIHf9ae4mo92IIJ26Jt+Gabus81jlCJyPG/eE2Raqc4/v2E
 f9k+eGurq+eT8ynq/qk47gCbKAxHPD/qkyH1izpqn5xB2bUcvTmMkOab4hi8ODedV+tV/8KyIxY
 D3+xHqTgC9EampnGmjtT+/haay4eZBbQUhdDN1eT/HakA8LW8lewP6qN3IYOrT6DXkzgcgPTf3L
 UPypOBWm3jNAbS0EDflZoUvEkpimkCeiH9Fq/i2n3vq4hp0Z5wJeG4evpxAmwnyQbZG1rhd8If0
 0JDyO6Ltpgv2wDBD3ag==
X-Proofpoint-GUID: OqK3_RiEG22nO3TbFtoMhqNIRxadWMCL
X-Proofpoint-ORIG-GUID: OqK3_RiEG22nO3TbFtoMhqNIRxadWMCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606100204

Add a new optional `lontium,port-select` property to describe the DSI
input port configuration for the LT9611C variant, which supports
single-port (A or B) and dual-port (A+B) operation.

This property allows explicitly selecting the active DSI input port(s):
  0 = port A (default)
  1 = port B
  2 = ports A and B (dual-port)

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index e0821a63d9d7..77220f893bf8 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -41,6 +41,17 @@ properties:
   vcc-supply:
     description: Regulator for 3.3V IO power.
 
+  lontium,port-select:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    default: 0
+    description: |
+      Selects which DSI input port(s) the bridge uses. Only relevant for
+      the lontium,lt9611c compatible.
+        0 = PORT_SELECT_A  - single DSI port A (default)
+        1 = PORT_SELECT_B  - single DSI port B
+        2 = PORT_SELECT_AB - dual DSI ports A and B
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -104,6 +115,8 @@ examples:
         vdd-supply = <&lt9611_1v8>;
         vcc-supply = <&lt9611_3v3>;
 
+        lontium,port-select = <1>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;

-- 
2.34.1

