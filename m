Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766C35C1A9
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249760; cv=none; b=pBr+/GZj4O10WdClx6ZWA5jChGqsONRmFKpIzIjxKNKDEuCZKtaEGamIh8Q/YkL/IAmC+uyxcKa9K+kpxV+P9zpS/lHRZNNcNoEAh+8/VmehftEP+3VakGlVqlqa1JZAXAYYWfikCxat3Dzmu/LyMNiRTsEX1av9Fmww80yd34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249760; c=relaxed/simple;
	bh=LfhOttPBzpC4HpX7Dks65cQPMdKfxFqe7WD/bPC2uQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvGp1bRAX63ut6kmLRJ1x3mf+9UY7cl+lXBeBhLQrdsmwmB6QrH1YGM0aBQgeZ316vAJqWwi9WPe1Jqb1rPXtp7PvNvEtPBv5rmGU/HmLL45nVYhRpKv32V9y/3IXkZiplBUgINz07WMu8kHyoKHL6l11m7QI4m73esqruMWmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpUH1Gae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbZPdOqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpUH1Gae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbZPdOqE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MMOagY2241210
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGpjuuynPwJX16qdGkdVckjT//0sIw8TY5KE1UMUWj0=; b=QpUH1GaeHs1Xsf0E
	aG+ZlT3zgeW0WPlCHRhCxBvh6M91qlABmRsGi9drJQwEmrjjl5vHF2JoJRGhIntW
	DG6wDPfAio5WtFxLF0y68+as4CbF8tClxBjZ0RkAsVbrAJwJsEC6+KO/xDJjTGKu
	41znBpkxfp/pbLkGQrMAjh7jO8ZX7q/+iHyV4uN5hI/bslDZxgYudBSSzOlKicZh
	B9nngjDu23GUE1U8Ia0HBRPzAdOT4E8fLidnp/FI2T1niOyYROl1iiMCfpoe4MBT
	hUSXOx8tIDqfKHugZJRt/WaY7DghPoQnz3Y+b68aY3dlnBNtvJE5pFBdkrVpo6ZU
	qPCZmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cv37e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b901d542bso3197357a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774249758; x=1774854558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGpjuuynPwJX16qdGkdVckjT//0sIw8TY5KE1UMUWj0=;
        b=cbZPdOqEUSRU3i7/eNhoQ0p697wZAB9NOFNNDm8Tatzsicf8Bs80obEwKec7T9+vbo
         f3wSqTGTua0t0NIy3dTUEWeFz2XpVzDJvXrMCTcZ6W5Unu6M0qIKk6FAgdP7yr44nkDD
         UR32ns4PjX/Hxs9/sNniVmXSqauokdX/aQHzpliVFD26fN+z3Ww3HRcHQ2QIQZFLkoYJ
         gMirDU2pYnZNT+WjAXhfm3Wj5HrJARJNDEveOA6esYyzR8L6TayOj2cmvfv+JVpmadD7
         ABl08koVf8D+aVFXbBdDJZN1t4DAAirLqdaKKpNfSbT0t9b2SUY2pY9FWg8p1TmiEOqX
         8ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774249758; x=1774854558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGpjuuynPwJX16qdGkdVckjT//0sIw8TY5KE1UMUWj0=;
        b=tAkalOvfFP3AqPuoD3rPamWR7B5kaGoRzh9iYNtkexARAXKcou/5tYBMKZf56qXtBR
         Y0u5ttJwIfmOlWyj8rCRFC9naWOPks8RZXldUm3XPgLJYCZuFhMg9d5uS59dzRfmCaPf
         IVUAQ78C61mN/onTULsy4jKbhzFuLXO2sEdl0e08iSLw8dcg/vdkxmWJeACVOBim1Urx
         OPGm6ZzoQrpiInRm+6gH+buzS+yg3ltdowgrOFnNnxg65pEepiwuNffMm2aqq+MluqlU
         nrnWuOL6BHyoN9JABskJeirWTEsJBihdD7IzvgD8cEhZCsrZD6eXC64j3TwG2SBNwdj8
         5T/w==
X-Forwarded-Encrypted: i=1; AJvYcCW9Qx8MqvJQDO1uUQqVK/PuZSvDqUNC0amBNgedZ3ahap4YxzX2Estq/QTolFC7UJYFFaNd6LN9lY15@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/RQoikR5eXvG7hCNACnT+oLiE7EBzrQ5jgnbQO4R5YhfQ2qLI
	a1ckXgXuv+a5dKI2OfeuDb1gTIwE/Bb8e/ypmjhmnC5K1afOlmu8LxUXOzVxOjEY4t5GTPHXSlN
	ypA4jYn2gkcoQ2AdJwizZeqH8PtWqL3f4tmfwp8XGdEjjp7z+k0+fZPEEoaE2COpm
X-Gm-Gg: ATEYQzyfMGvZm4PyJ/IoO2fLX7R7iUbpbsa/DUQ5VWAtR6m1cv5sRbABVvZBtmeSL7z
	KfGVXXzPwCwcLqVw58RiavAD+N6fo0PkXF1ZUSO8gyUD3TID9aiJxiHdmP6Y9yEF1IatN8gSgKA
	d0wxJRW1JB2e2uuYPBulk6VjaPcr72+Fkeep+OigKz7ndTgc1747Nk15PABIwpszvVuRfZu45Kb
	cmo27jf5diis8MOiSIkND8bdcW70qcY1L+Sa8nsviKTegKglVCdOu4tjAAfwfU37ZGxI1r+7Lnx
	Ot/yOdZIfuTMcbGPWG5t6ylAfWTc5q6VJ1h3Ppc7FWMhN5oMsPhUk7P3SWQeEKwRarrytHIMvuM
	lc3riMSzBkPxDT2JhZ6ywWyzLvbP5f8imfoir4qTiS/Yj4nkkl85oH0LgGEHbdA==
X-Received: by 2002:a17:903:2b04:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0826f6ce5mr106544975ad.15.1774249758035;
        Mon, 23 Mar 2026 00:09:18 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0826f6ce5mr106544645ad.15.1774249757546;
        Mon, 23 Mar 2026 00:09:17 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm133118795ad.42.2026.03.23.00.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:09:17 -0700 (PDT)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:38:52 +0530
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-lt9211c-bridge-v5-1-9c63bb035c17@oss.qualcomm.com>
References: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
In-Reply-To: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774249743; l=1434;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=y3BZBNP7fsKO4ymCdRcD7Ne62Tg4ATJwDjDqmdLWJ8Y=;
 b=2dJthIMUQedz13rkgvhq4xuh/Sz/CzWarePFvtsxYSukmBOR3ZrqkBWjj+FCBB5opwJBN9Dni
 jse2CrYyywdBUuK0SYgISaSgJDOCi8xTPtTN/OtQ6WWOcCgyhxbNugn
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-GUID: DBhWtPqmYyf4RtyTtoLCl-hk9vfQj3pD
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c0e71e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1MyBTYWx0ZWRfXxkvJ0h4+Qdys
 z0oJmh4cfmxsENA6JWQQtCZizVQl7T3QmRjEJ1yab96peb48+5KU++5djhzfu9oIyGCpmhtNuWb
 N2LwiPHeTc2He2uYBCIaKnmiDcJgR5bafXNrbHTZPEGa7X+hfjtNS9D8uYD35/jeXWlFufn5Xhd
 msUn9tatuJvXRrrT1Ml3GinW53efxGmsvj5GDHeIGI74x9PA6vkwOOrfGGiccvYYBhX0kowsnt/
 YdNMM/wPODQ2Umbq6bqmtYTkl7Qea83ovf0LkhNHRsjGN23s04jRLOOtzAb9hMktfVTYwvEaLnD
 lHSl/+ijKmi9t3hsxkcfh733N2M41tuCxvhQfjHh38jWb2Swv2AjEnc4JmKV09rw7OOWg3Uv9+Y
 OYV9RUrQKQOq29djFCmrIOZsnGaYuFs+Vwxm0KU4YbH9C64qzi59XW1ryps2fiEWp9BaQatxy+H
 XYUaDLF/QKMKoI1Fukg==
X-Proofpoint-ORIG-GUID: DBhWtPqmYyf4RtyTtoLCl-hk9vfQj3pD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230053

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 9a6e9b25d14a..8df90c014064 100644
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

