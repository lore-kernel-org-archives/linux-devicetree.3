Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B89493657
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787418116; cv=none; b=M+jAp7V+3GXYzZevJEuuDL5LsLT20SzjTQ5EAsWXcN1QrNFrQYI93GaYGBfSYhnqZ2S2np/EGR3Ka4Lbh24m7eDnNxpH6P0Us25L/WNnwcmN8rWu/uKy+AVFOKK/kFnYn0QaGlyqpctiRBxSNdW0IGe/3k3VPaRtNixEAZvwpsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787418116; c=relaxed/simple;
	bh=7rardkyifAR+2AT1JfxqXWVC4DUlTbqXtnaIiP3Z28I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRKZoYs0nB/AIBWTeYmMW4ZxmVRNV8lYeJ2RRLwy3FQP/Ns5P7nYIIq7CqAUc4GygpqUIDNpKrsRIbXpqRdrC+yx6Pk6p9OdXQc/uyWGuXmlGURQtj0VFRgK07To5GccgjNrGcL9+i4WTyeTiq1cGaCt9v3/tSQ2L27BzWFCX5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVHy/nRX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmppNe80; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVHy/nRX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmppNe80"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MEMiQD937849
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 17:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=; b=cVHy/nRX/fwPTMrK
	VEYj8GtgiZehApcNnPQxTfCnhDtkHRcjHmCeDp8NpHxUPnsejg4Qo9nHmDO97Wq1
	clH2tfTl+vvfZdHm1IHeaWPw1ZWmxdg4QGb45hngv+96gz9+yu9Xf7HZndF7bYuA
	eeI0qHbATdwUI+spCH+FjbUgOXczqqJzpJKl5RCC8WRLOXGmbl6QzrYn2+MUz4Xy
	PuQG+OxZ5A3YLu/oCJquSOOuYIqkHoVujNpK/yEKecC9LPdhpXG7zX9Dd4NtYa22
	iy73NHayRI8WDzeQZdpmLoy5Wsu8LqfPD4nZ+R3R5dLrYFdEIn1QR2O3uVDCqMOG
	U8BqSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528hhr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 17:01:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d58262ffbfso5487855ad.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787418113; x=1788022913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=CmppNe80sUTClIueNmPchJkzQ8x6GxB9ll4aDtud1Af9hdylj0TK3ZgyrbvtVYolmN
         FPqiSqtdqd32UBTAHT1uu7c0hf6ivwg29o01KmDcibyNzdPzS0/nNm4XbSSjc7njxOvS
         tWvmX9BE9IZ7/yTjFWDOT2IBsLB92mLi41ANTr5DzV2kanSikYssfRvK6j5lAsA/yYNk
         rXPsXuPEE23vjrwKNMqwt0OI0XepHqy8gEK8/opZ++5BI/11w5K0ywM1mtKXEJLhjM5M
         3MnmF6ULBOj4SIrDfbtG5d0UYeLb74tK6MiICnIfWyTH6zD0ZzF9kmbFZwXNyL3uezsX
         86Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787418113; x=1788022913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=ie7+de6jbRmquKNBEXICYd9q6Xc3FE00Gmf+P5QbEvobLb3e00GIYx52yQcMjFobJE
         Vk9cSrcbMGXLsVtbclJ2H7agkT86b1Kb+AtPqixhqYooljP0JVJPvJRqSAN8iFBaA6yt
         Fql0gpp6TPQ3h/ftEEjwIJ8TjJ50+39sO34UGCe1w6nnwNS1IqEyLUIUfyuq4WeGUifi
         i9rU0jwc9Wn/HcuSSGGUZD+Wz6TUE9frMlLzO7nXMfS4CuZQky6uiGElbunsy4OUk1Ac
         WFxXolYol34NaVjK4CRv4sifCAcpjWQD99hl+ny8JFGTChNgvEYcB82LVUZ9HypEaPiq
         uCGw==
X-Forwarded-Encrypted: i=1; AHgh+RoLX/HrTwreveB9Uj5N7fu7ezR5c85n/gNiV0QmVqJ+IQ5cZ11lOYQr8HkgxbhXshQGuMm0MXEzK9DM@vger.kernel.org
X-Gm-Message-State: AFuF++msHuIITedVleOjmMAg9OxCsAABFA5FsLCXSE22rjQL9aa5kIE6
	e41NR15E4eAOAG7SrRplx10/ywJRk4uJCdQ5Pn39Cw3Rcj0yN1NJb0kFIOEW4keBsX5EIxRxoy0
	0ZqapztOurqsQeF9Pc7CGjRItEdoy6+N1f9IZTTU80Zu5lw/u7FuF6mvEl5KJY1Ql
X-Gm-Gg: AR+sD134EyA/w3UugUeaNl5MfCMFkQGCXBlzIuvL5zxnDeT1q7C0ULdVLoLMzVjmCtr
	9RAmRzUxzpp4Hm7cxhuVbjOvT8F+pguxpuoUbxAKfaAjBm/TGKLcmexgRUBabMHT4VjV8oXs7BU
	6s/jXGVVmR1kQV+YKZqwZ54wsCoUSo7gYxPaXQWF5zD6XIdKImzDtZ2SLVBuX5Tk2Y4NmAsWH6/
	/cVWmXiTadnB8U2qrlBDmDIY4FpjeHcjXXtkbJ4DsvpYTcGzYv2UqNk2xNXh7nP1JvCJh5RyBmq
	HLgGaBJobjfowOC4ZQ7l/ZSN1TUgx/KVz5CDdEaOMyokAUspgnu1qaFYB6nc31Q5xvQOSAjg7rC
	QfzfryldWwPEEV853Yufoz4LnVhNxde1+o65NIbWY3XqWa9QPdBEmXuxhhUUdtYk9cGMIbyTM46
	7GF0QmrPUUJoSM/swS8Zjw
X-Received: by 2002:a17:903:120b:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2d64b049900mr126446665ad.3.1787418113115;
        Sat, 22 Aug 2026 10:01:53 -0700 (PDT)
X-Received: by 2002:a17:903:120b:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2d64b049900mr126445985ad.3.1787418112656;
        Sat, 22 Aug 2026 10:01:52 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9099ce7sm7760562eec.5.2026.08.22.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 10:01:52 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Sat, 22 Aug 2026 22:31:33 +0530
Subject: [PATCH v7 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-add-lt9211c-bridge-v7-1-7dcf567d57c4@oss.qualcomm.com>
References: <20260822-add-lt9211c-bridge-v7-0-7dcf567d57c4@oss.qualcomm.com>
In-Reply-To: <20260822-add-lt9211c-bridge-v7-0-7dcf567d57c4@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787418096; l=1545;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7XMiXr7D3fC2Of65x2F+DhMxVAnk7abheQMCzBYJB9E=;
 b=OccMxKSRoYBvcoaTqsctySdu1Y3kL5I/zp6FB/1RPE1kJxqBuJjQwXiIV9suYg7oEnbFpOhx+
 9T3SEpe48VeDg/ZqkA1QO5MeICSEGWtQ54XAFvOhR+TwR2hcu9wIHxh
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a89d601 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: LY_RxYwyBb5JhVJ0ToNuCUFWlZbUNcHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDE0MiBTYWx0ZWRfX5u8ebZSZK00W
 /ud/QzBbIuHCDKKC4ORerCFczGXr/SS3MfoXVIrDMPp25bbpHdQGazcndJl2ueeJj9S+uK4V4EG
 r5r4/zmZByDSbAwjSa6C1FxqGBrNIHwIObU0ULjLOj4UcrCoyMrOT/jOWUWSHpn+d7TraVRqviC
 MoEuyFDKFApNm8P4mOjCiYrEVHUIUjAMX+2wA7hFHimaAQnnxahyuP3EpIJYHXtEY1F1UAPPdRo
 pvWLIQ8EogKVAUWuEasjMtWV0kAai41sEl4zvVJH2mvIagG+l2DpXSxqvGy7o7HUci+AAvLOv1T
 mhL4PuIxVgJM28jqIBJ7qHJRfDun0fZEPAsZCYU9Xm4uS3jicsj1dDFW107XWbNk6FdE8R3x6JM
 CUhoYyOkmOs4w6MecKyR0Dg9BdfmAW64tlFUV+/LirrssBPQ2cPKJizqBrAs6DiVHyKEfFX/ZvM
 qPcO12n8z1sGIsL6eTw==
X-Proofpoint-ORIG-GUID: LY_RxYwyBb5JhVJ0ToNuCUFWlZbUNcHF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDE0MiBTYWx0ZWRfX4T5xZusFqnbQ
 5gWYQT/4/zrnBRiiWEGh9yExsyzvFGprUpHAStWEfcM37sd1PlJblV36uEmKypp1dHHAExrXgS7
 ZZ2wo8KO2NMAmcsI2BGI8tTo6B90wVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220142

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 7cfe92a8bcd7..de61bda09db9 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1

-- 
2.34.1

