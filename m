Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA1295DA6
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015157; cv=none; b=OmtksMVh4A30hHT2LkuxjAu1xMHkSs0KxUmHzPqAHpSx7Rrl6c4RojEUFyqlIUF6qiwPniyTWrdg4QnfD1+WViOIeckyWZOvoucqn3gpeEFDY88IHWm6Ofsa9KxSJaeK9IQTOOC2aiHhhs7yY2ddVFJLQ+QbfBVcZJxy114f6JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015157; c=relaxed/simple;
	bh=7geT5bkEq5ZiMOxGkUOHpZ6vimPzI950/l3utWM/ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB5jQ7c63Hvk++rqaiLOrwyxLOQf296lpeVxibtXI0e2IR8DiJtOEOFFmaqCLn2s5GqdFTAZBnhWD4Lcehx1fUSSfshvZW8KNbZH6G6V06bpyusOXFFzsTsnJX8U2mVoFdPiF6vnkh0kn+xfcHPbA1qP3uN/zHu5u2XX+iWdqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+aoycii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3HrYdC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+aoycii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3HrYdC6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4jSU541660
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjHn7Kk5aOTSG3RKTc9qr3CMGxHyzEiq474/PRW5gVM=; b=j+aoyciiQ4vmGyY/
	aW24Pb3A19VCXG5157xJmt0ItwqIHuEoBLq0dZm9LsLNDMISn1iWTxlbH7D6Tx29
	ek+I9RzQZUk0KjG9HYNOzoCUiRt6z2DeapXEHMwP3Rqx2RmCXBr7Up/2KbeJlaaZ
	VEtLJoTDQXLky4jiAuDZLa0aie7rrrspbbDG1I1v4589RXeQeUWkW0P4wUEP6xW7
	qSn7WCyXj0rQAXm4FOltKl99t0zDoEkMMm0RBHqEzdSvyRVRKZSVl5lMtlOGDv4W
	PSYQQDYiWNHq69NTmjlL4YfR9ew+HSnDA54tRpX5dRDcgsn2klIwl9Zzr7gX+nwt
	iN+HXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexftrbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso90902191cf.0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 10:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776015154; x=1776619954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjHn7Kk5aOTSG3RKTc9qr3CMGxHyzEiq474/PRW5gVM=;
        b=O3HrYdC6qRIkrUp/qoi+kMM+8EAL++ugsfPNoCUABIvaC18/zJAmy53p4yWTrWR9eV
         0b2yy2C0tr+Esyhn9UF076OxScuJhk4vgdOUpIraYq0ZNadD3tNaD6nMnssyF/w2+YR1
         lnJHmXZF6o/qrXfcgc5dG548FPDmV7vTA290Bs1ZnRUOe8AkaCJX3YXezND4D56VcS0K
         U4oIE0t4T3OlD/v0JadIJxJs+hL9RGg2w/G8cu7l3YWJ4wMFU+54tHrggylDVNSHVXVa
         ZvHIFfpy24iydK91clKF/JlyKhWWBqxYgAasQiyrukTAd6kekthtXWO+OTNUkkfl7vUB
         Vxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776015154; x=1776619954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjHn7Kk5aOTSG3RKTc9qr3CMGxHyzEiq474/PRW5gVM=;
        b=AtdL/TbJJtY5EjE6LCCWAfr3zjJs16gtjHe6YfzSRozrzWGgGpHE8SJZIGy9/8lTvm
         JBRK7XuiEbh9vTgS8pXYgOWKe1zPGTJkWzf8rlJ1U66q50WQpu/wVNISi4ukbAKmSfxo
         Y7AoZtq5wd7WKSqLB2+MfkOE2DvBMeUVr0u+e1IJVhwdXN9f8xrcmbrRmCqZg3tYU/b8
         pSMJxxDzyA1+OnP596/Yy9eBx3HWiBMaa8ijI+ZJWI41OYNGYHBKer8UtHHagrneWY6x
         O5earknIQLSKcsFVuQsD8n5MKxY3YXV5J1q/WrHUiqopYX31RnKYSl/bWcaZriDeXSIy
         UUdA==
X-Forwarded-Encrypted: i=1; AJvYcCWlKsSMpI/4D1s1r7OgMiEXDRPvY7M3hTyhgg8v2/LLRG8OVSQA0bJl88yIg/fREykYSswDGCBehVvn@vger.kernel.org
X-Gm-Message-State: AOJu0YwKwTsj1HgEnVNhES5/6J2jNp6GZbSv1S+kITIPSshpPHhnA+Jz
	WyV2BFaJ+/syRIhVRhP2ohKiCLY1VRSsrc+ZuVScqCQD1l/rH/dSKz8LIhp+QpXtQ+Pzx/j94E2
	etXC1OgUD0ig9NxD39uikadbuYc7WnE0xbZjxqUbmd3Bna+lUfZN36wSmnEar2+Uq
X-Gm-Gg: AeBDieu9Iwa71o3GeC+j3HmSqbf2raUpVYpF5ZldN4JDHs4Ij8YHvm0BF+yCxI4vjcF
	dnl3wAvTSxUwHXKBIHgeMZAwFBHALeC9GSEurp/K+SrcIHt6raq9qMt+auLvXhb48+h8WZm8I9+
	PofWyJNL0KG71A3P8vjJseHVLGbNLJ1BBR1mCuk3oNPRp+yQe2QRth4OhE9cbI2cn5vnK02zxDv
	Y1RaxhiX4iAWvNWo9btc4kpSIWfe1LsQbWl1A0T0TlBq9D3p9jUBgm7169LEdqmlTjIz3rwKZnP
	mSi7GhZDDI1vjPkFH2dfooVhTjlNymw9ecOlBYdUKIajyAnYQfTaLzDlt/EhR6SuAT8aijSGHsw
	wVNJANBwzqIO2Q7kQjkv++LnVVm1kAieEOG46lbM+DepCnmfNh4dlqEK4cKiRhzoOY9S1OkydUf
	LKAmkCM0kLuYAjADSFBlKlEfITsIm0slJG/ss=
X-Received: by 2002:a05:622a:4106:b0:50d:5d96:568a with SMTP id d75a77b69052e-50dd5b016camr159089201cf.27.1776015154371;
        Sun, 12 Apr 2026 10:32:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4106:b0:50d:5d96:568a with SMTP id d75a77b69052e-50dd5b016camr159088731cf.27.1776015153907;
        Sun, 12 Apr 2026 10:32:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49a4a6f9sm17585231fa.31.2026.04.12.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:32:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 20:32:24 +0300
Subject: [PATCH v3 1/2] dt-bindings: display: waveshare,dsp2dpi: describe
 DSI2LVDS setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-ws-lcd-v3-1-db22c2631828@oss.qualcomm.com>
References: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
In-Reply-To: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7geT5bkEq5ZiMOxGkUOHpZ6vimPzI950/l3utWM/ns0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp29ctrpy9xOc8Q5jpDD5T5H1241M8mBbzDiLZc
 iMKnWu2//eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadvXLQAKCRCLPIo+Aiko
 1dMZB/9925HA5O3DHUQkzNGdjbjr6r8kQWhu7qW2quZT1Fnw1mupJmQKoZdl4dEpzPELDeFa+L6
 MNjurPLE+EmWCb7TleP9Ynv9J8c7eDbBpb8hMo76cx6rdErA/lRhu5WsipJ8OkKZ3BYT/jV5Zmp
 2YtkoRmCB/G/fCrynBBkyEsp2E33DFZEp2gtXG5eZOrjmIuWtuUSjX3VgDP7uVXgQiTDC6gwfnI
 +3a9bxN36Ywoa9Z23jNnPM0K9tQp9O7ne145gm1y6W2/aQPTGpDQqdS2Fm7VceCZ73n+qtLsZ5u
 00l/P22K2hNsJC4r7JLjxCJ6tCimva2Gb/x7hHKxYh4tLJnD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CjZanVSNbSJkGcg57naBjVZbZvSvxE0C
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dbd732 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=7qgZ0iPFU4Zeudp_5JAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: CjZanVSNbSJkGcg57naBjVZbZvSvxE0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE3MSBTYWx0ZWRfX++QWO6YXauGb
 c7u7Nci9hArSVyJUW/t4ciijZ45SeebhjldOG83pszkxihvr3k5rXtUFMCOxqtjOQglhr4MM+pM
 l2hfxGugj5R8vfiwHBUJI+kKIkgy95WojYpTaS6dPb+2zEc8tq6H+/wRWmq7AFxb+GOh/6Too8W
 eSO505YmX3aBKIAzLbFn3Z82tnZwP+y+EzMglf9ZYg2AY1y29RqI9ui387BcDCqhGFgU6il3BTY
 cqn2BU6aZUuiaCMniYX5Kj9nfwL+PtZSwm1UJFA73R9A9UK+HbYIqvCL/8f6rIFmIaTBf9VqfYC
 lM61rBWgh86rVXE7vd3sKRyLnz/UKdwCcG6EBk8Ft6GSSqLGcnprzPVxOTVEbSNfw8rGWidoSCb
 5BtIEMKAZ8LEkWCBMRVWSCGEzW7VM/lZ+CPT2qcpSRTNukxqVHm6pA/Flia0MH1WMiH7+qVTkmA
 fJB8ulhJymIzuACiOyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120171

Several the Waveshare DSI LCD panel kits use DSI2LVDS ICN6202 bridge
together with the LVDS panels. Define new compatible for the on-kit
bridge setup (it is not itmized and it uses Waveshare prefix since the
rest of the integration details are not known).

Note: the ICN6202 / ICN6211 bridges are completely handled by the board
itself, they should not be programmed by the host (which otherwise might
override correct params), etc. As such, it doesn't make sense to use
those in the compat strings. I consider those to be an internal detail
of the setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml    | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
index 3820dd7e11af..4d34a92192bf 100644
--- a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
@@ -10,11 +10,14 @@ maintainers:
   - Joseph Guo <qijian.guo@nxp.com>
 
 description:
-  Waveshare bridge board is part of Waveshare panel which converts DSI to DPI.
+  Waveshare bridge board is part of Waveshare panel which converts DSI to DPI
+  or LVDS.
 
 properties:
   compatible:
-    const: waveshare,dsi2dpi
+    enum:
+      - waveshare,dsi2dpi
+      - waveshare,dsi2lvds
 
   reg:
     maxItems: 1
@@ -53,7 +56,7 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Video port for MIPI DPI output panel.
+          Video port for MIPI DPI or LVDS output to the panel.
 
     required:
       - port@0

-- 
2.47.3

