Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998B4266A1
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971862; cv=none; b=EKDLXLGFy37xCpyhkp8uOPdcp/QbpcQ23b3i1RfANr2yycfPTc6TNotGrwXepvQO2bV9VIPlP/ABq9O8SLH4fJM7Q2FUgunR+JScA6s+hhhH9CFkIJ6mcUFcH5xK+8ObXn34EXHMxftt8l5odUFkoI2N7CtyKwvug3URU3k+6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971862; c=relaxed/simple;
	bh=kOrsLLql6SeNEpGZuqe3iM109imXDdNUD6rH11IV+eU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOqrhbj61bfx6vTq5U0vhfXmtfRjaOJIKdQ65LVfyp2z3yjtkDrCOzDEga1rK2/CAGRW/9aYTWIG/Q/twQ54xKe243y5GGl8zZm/i9pmTKa9VCrcfXP3l6XVaSs2cQLotiijgLOFxKEsDYoVXEX7aKABW4axhWUS+hTPhnEy+AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUEEOhSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkZJsdep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUEEOhSk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkZJsdep"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEEwNO2761397
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nESO+7BDMbX0WOtw7s5EKiU43Row0DSXtiOScNm/q4E=; b=dUEEOhSk0MB0qVG/
	DFIxuyMCw+5MU4Wn80Glk0aHehcXlU/VnONIPNVTm9KNab1ujpJvKIANx1c5f6/b
	om6yoHrOCgegWIgpgIJx4tLtpAHOj2/bF79Cd15BT9+BtLbT+egA5ko6vzVqrtiT
	6DcOJ2kSLix0mT2zlIncShJVA3/fokiMLusT+Eh567oDlvdxgBFgBx5lmtJeakKu
	hiaY9SFlcEO6KXnbGtNBQoXz9HW4ahX8QyluSVK8+7/u0EQmtC6AU0jnZgIhqovk
	a7dpa2Bto9fN5upNjE5mWgqT23YVU7Z1oBC0+ZjFcnPBnZuJVw0LezfkFYAwTiSj
	DSTHew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b931u9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso83300821cf.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971858; x=1775576658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nESO+7BDMbX0WOtw7s5EKiU43Row0DSXtiOScNm/q4E=;
        b=HkZJsdeptBwNqtjCbFgqkHEDXIhoLZjR2k4pDqyR6fIRz7LPDI/qDTNhrkvoIU8CYe
         L9MYJQfNx5ZxV2hocT9I0wjt56zRUQwsYlmvZK+gplGOtXzEuvsVBrIAvd1NhWnF/orx
         meELcy4LjeanwEhU9EvzoL9bGCMxWP+YKYMkr++q6XQTT99AyTBvwrnqkPTgss8SN3qX
         U/7BX/IYOK+8fzWfiujBjPFD0gJAhUIacI3kpfeg9q/LSEjGl1p15ghIdRJigYMOXCMz
         wz3cr5oj70lGZy9NFgTdvKCnMrIz3B2fS2KD6856zEIGNEcdiJhqW/ScuQvPZnbn2qKj
         gczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971858; x=1775576658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nESO+7BDMbX0WOtw7s5EKiU43Row0DSXtiOScNm/q4E=;
        b=TyiPtGnjIctfgKS7vDEmFVLW3c5kBWTaUpAx49MMUZMtg0T9m8SYPylG8/x2xG/3g5
         a3xUqtqj3XjYpKLc4s13wHMuXJEcgFj925K+ytnlCSIXUB3/zg3aP8wJI6wOFswaOkoW
         jDnX2MGsZJpp3cTEQ+j8wZprugnEY/TcdIcHRj6fkihDqc8gLBr9QUSEZjGUz7gElFNj
         tIIMztArLiTYW1x8tqNU9HRHY+tUkkV16KHS/DQH+gWCI9EF0V7ZBaskcfz0JfaUmdmp
         ccRHr7BSeEMvDIkv/Ycdg8Nexy0cRl4r6j+T/FbcoPJyY504B7Gz3kgblMWSWbiBOuMa
         pqmg==
X-Forwarded-Encrypted: i=1; AJvYcCVhYuHA3bHOEy2WlIALwmBG2Vy/EwnoeZU+t+7dQBjwu6Xa4nsW2Vw0yIItbGm2sku40K45Xoym88jP@vger.kernel.org
X-Gm-Message-State: AOJu0YylA9WJFo2t8Ax6YrSI9i1FE0Kq7cJfbmeVXj15JSR4+/IVn3YK
	fhh2PnsIjtJPTB/ubUYbXEFCy8WtJ7cJe81Qgq4Ke83f+siE/H72J8cq0OhJECye/mNWNzKN98U
	sn01ugBlibHIryky8mM5DYIzKWc/h65G+K9YVTIXnjMQ4cUUwqHl/dN7c7xkA52qy
X-Gm-Gg: ATEYQzwQ4nJ9utlvj4s7nA0ybNzv233fuJZKT6eQ8cPoePuHLi0omSR/TrNXzMowksq
	F7bz6+UzDoyzaooak1dMxbdQ2vE82g3MnzA/qkZbHeKUT+hyd5DLgxur/ws38LLkBx4FL5adr5A
	PildfjQbG2JUHjT1XDcB5b8W9r8oxW99eX0YKx6+NdmCLEVqqCcyF69w45eoBwXlp7M4gIQ2Tf1
	Htu8mfjOFanmpNFFdQRRYL2F3Dqb8ePfGsjpoXzqfVrteVNXuoLD1q/NWP9V8gD4eARr1J3Wyhe
	jrydgWiPPPgAcQ+gZSMtedFy8Mcqr9muqXiwJscYCiFH/gkkobCYFWOingygEnPt763vVwMcMOm
	HNYH+/iFmwTol3BgBrIgfb+VxSfOFqzgP17Ee3AvpY06SECGh7yRJ9I5B+6o3jf83eQbFTqmoK4
	06dhNOgPNoWfyLl00yCtkyC7nd8XWGxTFDBrY=
X-Received: by 2002:a05:622a:1e99:b0:50b:3e14:47f5 with SMTP id d75a77b69052e-50ba3918d3cmr223748191cf.44.1774971857992;
        Tue, 31 Mar 2026 08:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1e99:b0:50b:3e14:47f5 with SMTP id d75a77b69052e-50ba3918d3cmr223747371cf.44.1774971857373;
        Tue, 31 Mar 2026 08:44:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm25387461fa.23.2026.03.31.08.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 18:44:12 +0300
Subject: [PATCH v2 3/4] dt-bindings: display: panel: add Waveshare LCD
 panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ws-lcd-v2-3-a1add63b6eb6@oss.qualcomm.com>
References: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
In-Reply-To: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2700;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kOrsLLql6SeNEpGZuqe3iM109imXDdNUD6rH11IV+eU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpy+vKTf7HPSFGe/zpHn5roYYMVYpcNcdSULUMo
 KxV5HedoSeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacvrygAKCRCLPIo+Aiko
 1buyCACORV1nra9xC2den1laru8dqfDnTGVIvuPr+Ut16KWuO8UoQ+2Ha9W7/YZMC7yB72ULcN2
 skMmeY3nQlWUDDvDnzg/WeltjfKMihzZkGo6J1PREuZ+MJ1FuUcd1vB96W7rdbaRxtkq5fu4uXY
 a2/0ARDrmw2PjAaS4CmaR/gtyQlEqfsHQdv+pasg4Qp4jKEY76mlntrhWSDJGynsiAWlrtVFkMO
 GFtSlOHKg7An0B87oG3zAjTmNR023KmXHDNDUov3Iw0bZ+5QSsyciqnf0QAFpnz1GoJHU4irFGR
 kteqk2fa7LcHvcz1Ae3Aztauw0Habc1TQy9IpjgW5v6A0T8P
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfX6fWyQB3HmKrJ
 2pEbZXJqNZrJe2ZO/0nb+KzfWhRa1a5sgZEAE7mFzVl2yQbwkPyNk0VRK/u12uDzEDTRzcOxu51
 FohqGR3bOeOBeKtO8fk4H/2vI2F3sdI0T1DlIT1LvyJa9BKUdD89x5hxk6Ms5xuz5Drhfj3szhP
 rWO8JyaWFcYbLygoU0u4YWTpiKC++FAzm6Buw2hmhzUFBdzpJbuqiyGMayJ0Zk2V8JVKl+74FKU
 nO/HlD7talrGbQl92RM5WwzSuupFBzl/m6t8VJpDnR1qaJ772RsPNfP8EHQ1TcuUC5e/2KkbQoG
 8bRy2BnehDCQnXOAY+oBsO3XJINP+NoztvvGR7nBz2cd+H8p7OTxyZWJ/+6Q+E+L5j75kKb11Dg
 6dKBjBthPN8kTGu/YV8vp5ilHII2IzD+DIOh0lXk4XrBJoEA0/klnN/Z8J4ZE+zKI4UTqkjZfES
 ysveKSs6fYy00M80Bgg==
X-Proofpoint-ORIG-GUID: I7Q_Qf1qVcBNic5mUK1HXncGG1sSUr9M
X-Proofpoint-GUID: I7Q_Qf1qVcBNic5mUK1HXncGG1sSUr9M
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cbebd3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ovjr5O5YrjmXieTAoP0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310151

Waveshare has a family of LVDS / DPI panels bundled with the DSI2DPI or
DSI2LVDS bridge. The bridge and the rest of the logic are covered by the
waveshare,dsi2dpi compatible. The bindings already include several
entries for the panels from this series (waveshare,13.3inch-panel,
waveshare,7.0inch-c-panel). Define compatible strings for the rest of
the panels from that series.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/panel/panel-simple.yaml       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 9b8fa03f7cbc..c9ac59e04118 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -343,10 +343,38 @@ properties:
       - vivax,tpc9150-panel
         # VXT 800x480 color TFT LCD panel
       - vxt,vl050-8048nt-c01
+        # Waveshare 10.1" WXGA (1280x800) LCD panel
+      - waveshare,10.1inch-c-panel
+        # Waveshare 11.9" (320x1480) LCD panel
+      - waveshare,11.9inch-panel
         # Waveshare 13.3" FHD (1920x1080) LCD panel
       - waveshare,13.3inch-panel
+        # Waveshare 2.8" VGA (480x640) LCD panel
+      - waveshare,2.8inch-panel
+        # Waveshare 3.4" (800x800) LCD panel
+      - waveshare,3.4inch-c-panel
+        # Waveshare 4.0" WVGA (480x800) LCD panel
+      - waveshare,4.0inch-panel
+        # Waveshare 4.0" (720x720) LCD panel
+      - waveshare,4.0inch-c-panel
+        # Waveshare 5.0" WSVGA (1024x600) LCD panel
+      - waveshare,5.0inch-c-panel
+        # Waveshare 5.0" HD 720p (720x1280) LCD panel
+      - waveshare,5.0inch-d-panel
+        # Waveshare 6.25" (720x1560) LCD panel
+      - waveshare,6.25inch-panel
         # Waveshare 7.0" WSVGA (1024x600) LCD panel
       - waveshare,7.0inch-c-panel
+        # Waveshare 7.0" WXGA (1280x800) LCD panel
+      - waveshare,7.0inch-e-panel
+        # Waveshare 7.0" HD 720p (720x1280) LCD panel
+      - waveshare,7.0inch-h-panel
+        # Waveshare 7.9" (400x1280) LCD panel
+      - waveshare,7.9inch-panel
+        # Waveshare 8.0" WXGA (1280x800) LCD panel
+      - waveshare,8.0inch-c-panel
+        # Waveshare 8.8" (480x1920) LCD panel
+      - waveshare,8.8inch-panel
         # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
       - winstar,wf35ltiacd
         # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel

-- 
2.47.3

