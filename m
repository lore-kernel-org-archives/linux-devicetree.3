Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B96425CC7
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971858; cv=none; b=GqTD+6XcLM20TxuEFWAKeLtj5cGNLAXyhK5qZ3hXpygTiXzGVSlgkk+NWhvRT8HXGw2ETQ4zZivVxv/aprFT4OvAeIzCw96RKzXCmFBBRfZi0FUCC23QtAVgC0+2qKJFCKkVq5WGsRmt3cJu/G8/fKsZ1OAoyaRIpbR0lw/43+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971858; c=relaxed/simple;
	bh=7geT5bkEq5ZiMOxGkUOHpZ6vimPzI950/l3utWM/ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtcF7r6PWc9S8ACtauPV81MnBq2QqFF68MiMRb68o7/GIJ3Vp0nQmIyQMM8emRcLzx6ftllahhQN0uumM5B7I71BUaOjhZl3QQnKfJrB3quZEAkcF3n1I/NTLF4Sy6PwGEkIDwHitURK9y9CLlVbLLnw6EmiogKGel5yAxuyDlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORtU+VJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIkgy0rm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORtU+VJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIkgy0rm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDpBMN058060
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjHn7Kk5aOTSG3RKTc9qr3CMGxHyzEiq474/PRW5gVM=; b=ORtU+VJw/diHjWeO
	D1C2sLVRbvlbKqpOl/dieiFOs9sexY9X7WQC1r040w3SREEL/rWiiFl7KRMnvp/4
	lyVwBkR4u+dxmHOvgv2df1Jiucgh519cUFWXXzeJo7wHvFpvjFu+KfygXn9pmw7B
	RjetECiWe2oX4QJwQxnG/TUQu0nf30CZp7xitwX30WkfEq7xIr+MP/tFVUacpKjl
	btxByp3EgFFCZclKHeacRkw79nYjWZYo3BGbfLfKrkahMacO7lBOO39K7w52VwXh
	0Zw6m+VhOp25P9/kbAiKO/zS4kesZCmaZZ4l4bsG1IYyH/C+AWobVugHl7QEj6Mj
	r9iCgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahksxyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso74353591cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971855; x=1775576655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjHn7Kk5aOTSG3RKTc9qr3CMGxHyzEiq474/PRW5gVM=;
        b=jIkgy0rmHd6shJzk0ivuvPQDk6ibRD8yVAPgke1xsHXnjHv52w4/j9hf/9ze0ZomrA
         pY/4w8cn+j6+9otwIBKnZSqGEffapyjvfxCCsTXCjJT/KfyNRmNmPbUIpv7bOMsY51dL
         ddU9MzSCLPpR2rKstgCfE4KuJU12tAx0cIpZmsIl89nWVpLU1c+edysxnfKHCtCQwUcf
         NOG8DdDpIE5zbSg3gjfV6e9RROAeLpyzt+VEV7ru4KizogyEvPt8CCMMvtO1aenU4nde
         uLj5VfjYRIxWo+FSYVhQfAZdjAEjCojxqZiEqESdFZzsWWpB2+VQltN1Yggdl7nr+nc5
         YDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971855; x=1775576655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjHn7Kk5aOTSG3RKTc9qr3CMGxHyzEiq474/PRW5gVM=;
        b=A6GiaV8vaNFqLrybudwVMLcq7D9kuuUAXxB7M/W37dqNfAmnlnqs3+q/os0xC+cBEG
         ll8cvUHUPBTYleSUl4gOmoGekaxU+X+7IG8woAB1DhmsnqCRrUuO7jbNWopVSXVe7VcL
         fOdhKdU6dtNVDg1qAhzdS1XB7M9fxsU1H/aTJW4HvzVTj+pLI86nslJvScjdjaqxNk07
         0mpFphBY/ZgNCK3wE8VhnSCGl3l6d8USVyZcFGhZVEU6LyZnf/IBt6TrcpBSn7W4M02R
         bS83G8rDIp9jG1uEWdc3vefvBd9UgQSBvnf8Kln79mAi0Zukr7xNDS9m4hYg0lM3wKgW
         N6EA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkTbgQyJEPVCchOzqKNwsar59KradlauJ8EVdR167dYkf/Wo2Dpz2/5tX7240lvA/S4uCYthLsJBp@vger.kernel.org
X-Gm-Message-State: AOJu0YxsuVBzVic5WdwSh2xky4HoAIMK1Ebfv6SCs4jBGP8hg5r4LxKE
	WAMtrUn+yMK4DJGNdESvq7VN7i4ucRftxiRWiGiZRaW9Wco0UcRKVuC+zYtlbF4s5R3kb1nJzek
	wkzM4LfwxnqtiJTMAdd93S/8RTaz5j6cx9wLLmeFMXRiJB4sK70HO4lAbvP0le+p+
X-Gm-Gg: ATEYQzyixZCWGTdhsjhSnxvwEMGB8BvLODP3jgBCSa1JAxpUUPVukGSC1G+8gAD/6FP
	zRcl0OODXaFCJOXa8sH+GxF7fALwsGViS5100PMukicf4W0hNvR8xdkrXN6gFwXSLgvnpPqARFh
	2TsmTh/iSJcxhsbUkCwiXgPsUVJkq5lJIm2JyIoDVaKOsVaSoE+hUn1a8cFNdqt1PNWUZTawCxW
	/Hp9gpUeYgX/RTm7q2T9jo5BMepf6vsYfLrJm7NdW4ayhEYFcMhYAH9xJvSlESpOwXXca6tQAX/
	36XQYpzsyAOrSdnA966TMUDyok494u53zijeZUdKlElYFQes4uaMOqVzDr/ILM6JXMT/aRVPfeN
	/OtakJdfpC02LMFbWFwoUDPPRd1rKbjN7gwow2IIqm5fBIZJvRrsYoL0hK8Ay6JUWGUApjOMYox
	zoi8trH2e0vCP2McN01bTlEBUYyXqYzP75j3A=
X-Received: by 2002:a05:622a:578e:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50d3bb8e8c8mr200681cf.1.1774971854836;
        Tue, 31 Mar 2026 08:44:14 -0700 (PDT)
X-Received: by 2002:a05:622a:578e:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50d3bb8e8c8mr200001cf.1.1774971854318;
        Tue, 31 Mar 2026 08:44:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm25387461fa.23.2026.03.31.08.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 18:44:10 +0300
Subject: [PATCH v2 1/4] dt-bindings: display: waveshare,dsp2dpi: describe
 DSI2LVDS setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ws-lcd-v2-1-a1add63b6eb6@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7geT5bkEq5ZiMOxGkUOHpZ6vimPzI950/l3utWM/ns0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpy+vKqWkIXCC8n2pqeps0iNjD2ADk2hGP/BfNS
 xB0eNmeWxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacvrygAKCRCLPIo+Aiko
 1TNHB/wNkKsJjn3GwA53zKWKL1Sb2OqwwHB5UsbQNMKN2tscHNPIRYzegnDF6BECXVTn7XvtALq
 kuaGr1UOS8O8trvHt1YtIjRQpC4dMLNYZZg83141Ik7/4eJFYzdduD6ACEoDEAqd4q8OmN7WcIy
 9+XePbFQmx3Oj3nFtDXsn8LZ7L0lSYwkI1iDklgyDInxKdzraiBJ7824VoNDV+29JOTQm9sYOFe
 D5uBpHMgb8ILUd79YutWoM64532wQEzCceaz/wO/axKBIBhmyN7X1UE0MYqjoXBAuFn1aEGVkWa
 JkbSAV1e6DX/Dj3X1FOcg3jTqdxodYZCeR2KcMYKzqIAkXve
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfX6UAQ/fG6MSJs
 tvW9i29Z8DBKMn1T8WszQvLnrLdZJTHJs3wAdEHfA4r4J7wezx70bMTJTn+M5v9z6lvcCtC3NEy
 5qi6qsKX3LIzo/eF86Se33vTgl0HGKRkWlUM6V1owE3JhSHBUIQDnuUq5rRZVWKQQdCYKtpry7/
 xXaf0Ydx138Utv8m62rhpGGe0M4Za4ys91v/wBmK78DNNw7+CS69g12FdKoYCMnNcus13DdYxg3
 1Fw6T8O9IhPCiAAH3iMoqzA4UcbB2iAyYihNuq1T1qSgnrld3IDpaqsm2Nqet7G+Ukw5BJqzTau
 1eVNPNF5CVVPxFvRTRdiWBSqZ+YT721gOaLBFj0BuDDUvYllTyXKXiRvr8MGae2SRZE5LIOXKmP
 4DVCCcK3ViteGTt47CcP6v9sEuKemRj/RN1yXqz4FRewxh9N5cA1QEG+4hbsw2D/b9qObKz2Ktm
 I0HSQfyxB8a3hsOdt6g==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cbebcf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=7qgZ0iPFU4Zeudp_5JAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: ncUHVbUpPmczIcQws8GEBSOzhGl6K4_P
X-Proofpoint-GUID: ncUHVbUpPmczIcQws8GEBSOzhGl6K4_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310151

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

