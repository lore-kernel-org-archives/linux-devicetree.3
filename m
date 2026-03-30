Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5068F3D4108
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877162; cv=none; b=j99pk08gmWcl7OmvHHHg00UsiBhO6IVTzO4dQjKvChZkosFBuxs4d3ytfST9MtBCXkc43pebaIdnbBqZT4rSrL6KiED9TEaTrd8RXkT5nlOALwniPRjvXeJrsiKdyV7kFdWjowvCZno7imz8QxRPLBclBF4FXdfeWURfpRNo50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877162; c=relaxed/simple;
	bh=ouDXFaaUjJn1+iIsGngHc0ypDFwzp6Hrso9rgz86XKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJgU161/vSshmM3+xM2owhiBjcqeXqrWZTH6XfijumG/DYW80ZhSfveXAFHHLEoNx8fykezi2PXDq0hz7Y11bFedZauyLlbfjRXc37nGI5rH9T9e7dZf8gUbBVr+Q2IIoF3SwKv5CopvDbTEvHWvvYUFpQoTrP4EUMT0o1WvzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njZ/rAto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuHV5rIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njZ/rAto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuHV5rIL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA92Vi3031490
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCwpBauu3iYoI3hicaYioIEnW8HRt8RtZyYBQWtLKM8=; b=njZ/rAtoKtoEmdsd
	lX6WFMhFx0aLY9LJSG3DcrPlo/+uUsTvn1PT50KYM3yLkwl20g7TO51NFXGpwB9F
	r6D//vPAOrAw3zquP0CVDovenWEdGtClQhZxVm+Hs2m9zZAuLEEaJ7CDshzs1Sro
	ysD2IENVPOW9pXBl0+thgswXIktlKkSdCnhMIC4zg5EMkFmC2MDQom/lrQwLpEzp
	KZY6EBzD96QD/tp+Y88MHd4yHE5dWanDbiXtnE4feLemEIQqk9yjBkweW+Ba44hX
	DnjrRu1qj6LjkZiQl7ZceHfMJdbi3alqvtomCjYqVWYxrYhSC7TUWkxvA+lwgESJ
	pNgC2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqem8yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:25:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so58636831cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877157; x=1775481957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCwpBauu3iYoI3hicaYioIEnW8HRt8RtZyYBQWtLKM8=;
        b=kuHV5rILoE1xigGRPiVwXfWeSYArauIP6TfLTXDE0sPlmCXOhei2qTKv1KCgEvJ42b
         +8Z5OUvfsj8CScw2K9tB7GhzoRQlBs1C2CJn/K0BoByHyKu2LP2FKugeKhyJ2Jp+e3mo
         1dTeq9R7XTqE8FGxmxOcpxe+CcCTRyfZKbvp7IXGSqFifkjCK+KB1Jj2q8q7vseYJaWk
         oqRpNRYKt4zpZR5rjOeqG/UziFqmrM2MnqDXCb0HtZZBrBD289q7Nd5UxqyRhHeIFQaC
         hZxbgg86rWFqZBOsUvI/IMPC9AMtWcAriqMT1uH3vjzDN5izIDSezlpemMw6aDbyGFHU
         wUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877158; x=1775481958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCwpBauu3iYoI3hicaYioIEnW8HRt8RtZyYBQWtLKM8=;
        b=RQbyzcfoL4ChVsQwaGcoRVTX4g8alb931cxyENmo22+47AXwDRadVUGf2GD5dKlNNq
         eZBNNIfM4F94pjFMEAnOvp2bfCS+ltZbsK4QoTOh8XM/4lfQzVteCTVywc9nbeQb+J4F
         qV0d0zYnJ/mpqVpByAMfStyCfI8pPNYkoDlkwGW6GcWMrCK8aPnnrlrv5W0xjJpwCBqD
         xRwC8svpznLiChlu2yQK76EBG0+ALUn5AhOvpr4P0Hg/3Ljk3d7v3e7gQrH6W1AESinb
         oePXSFr5SjWxc619ewgiROjXJWC3Z596TRUn18M++uBwKxUlRADQVrbFlB69hDAO+VTB
         3I2w==
X-Forwarded-Encrypted: i=1; AJvYcCXzqpehNp010Fen2h6HixOE9yD0enl4o2zOpDEOCk/Sa60n7LV8U3ASGP6WiHc7HNBZ22+7QUrUzG0j@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZObRd29qNXdT8WP3C8ab1PeXlzpMTKuNO9eFSbB9l1Uda4sF
	9T3K9fs+YxC3VRi/MSPPCuZxhMNdQzhQl/QmsLqncl6fw+4ESB+qTr6g8LHO8RRGK+Yi9MH8C1u
	V1TbNvkT3dqH6t4O6S2BEuG2ECXjs6b8oVcB5x2IqvARYk/egV4WKRujle8hd4msq
X-Gm-Gg: ATEYQzyaZxx8bqRVKuxt8j2Uy11D+WKMJ6ngJxRiq/NSHkQ0xrjxlwbfnSxOZXWpzZv
	w03fAA2fozBKDBC3V0KWJvhOyRKEj5EqOgo+55KoLb518JEqSiR+2541vVe8EBVJ0dSVwUvYS4e
	OaER48s6E9mjt9voc2BRcesSAmQ4hjy/9656LZgXAw0s1TgEUWBb5pQoywxO79XvjyxMq3jtnw3
	f4qJ1fGmfsQchTMJTF13aj8pbyBoN5u1EmRhbP4FPEuy1mEO9Z43q2VfbIyCUdB8pX6o4ZbxF9H
	voak2Ci/sMuX8153+q2uOY/ewgfXBi1kwbmW0MNg3X0JpcrgoIgnCrTQzwbPWisUCSFKucnOxMl
	3HQWa8LMSYT7MEywmVHseEr3qZXbv8/OrUwj21Dp5JGIx6SG2FJ08Bf67rqfA4a6LQphmRe3CNy
	qMfb/7KRpaAJwpqTr6MD+4Am77SxTb4gXx6cc=
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr180552931cf.26.1774877157475;
        Mon, 30 Mar 2026 06:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr180552391cf.26.1774877156917;
        Mon, 30 Mar 2026 06:25:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm1698928e87.18.2026.03.30.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:25:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:25:50 +0300
Subject: [PATCH 1/4] dt-bindings: display: waveshare,dsp2dpi: describe
 DSI2LVDS setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ws-lcd-v1-1-309834a435c0@oss.qualcomm.com>
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
In-Reply-To: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ouDXFaaUjJn1+iIsGngHc0ypDFwzp6Hrso9rgz86XKE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpynnhLg6kfY8szxuKJe4l2Xaet8UnW56+BYex0
 dJGKcTBG/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacp54QAKCRCLPIo+Aiko
 1cJ4CACNcmBd3PEHCCr/tDaa+U39r/NnefMNdubzsUHVh3fKAWbckV5aPO915redoOYqXqZ0L9g
 LlZX/TsY8BEY+mFsvOfsMqMDek84Ip6kBPvyCZJcYScLgt60iOC/l96n1HdbZzjxOb34VqIey+g
 FndNdvGOJvUzWdkGOVVFKMW/OriuKeiGZFmnyd7KuQOPzQMeqcdEzuN3pE1zRe9rzb1UFWO3H0x
 WBZRfXJbCwKwgVtVZ2p+fkxst5rxe4gSpupEcoZpOqScpajsAkIKnx3iLqPOAIP6I00AIM0cikU
 9HtM/5+VAYBGP5DFZAOF2PIKY+s2Dpe57jIzJmLcyKBjpQ5+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca79e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7qgZ0iPFU4Zeudp_5JAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: uidYspI9tZ2pdLSsn-8tV3PlJ-s4_C1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfX7UeAL61XnMsW
 jXGGXtrZ/lmAKEM4KJvhoLHA+dMzWQkSEHubz42eZqQ+9FF7Uffwtm49Kit219CADifeO0g+gNy
 tGUVY1HwFd8wT54b3ihNOFwNgrTikj5OiZUoIlgWaCXr1vKCED3VybVSRrG57+SYHqoawMYQA3P
 aGTzFhR3L6zXENlJzDr2lN+/GihPvKgA07buPyFaFdiaDTr8JECwg0lLzpDGy/oZw/oXNuPLrR6
 Ql8xFlxJ4pIutViN/Eiqsb7bsaxBQ5TA2ND1DCPssR45zDCQjf50tKl7UXI10yg+PE0uSJXoava
 KCdnCJKBd8tOBJR+qIV8SJnYjx+LUw7QHDfAThVzYGuqmkZEqFUBgiYl3+4d0CMVRKyN3JplYZh
 vS+zGP14GbZdzQtBPUBfORkw4wCRcttDVGzQTnyNZKwScvjn2Ia5rBlfPR04y9NalmrdXWWKbVy
 z6+TSUjcamu5Du54Dxw==
X-Proofpoint-ORIG-GUID: uidYspI9tZ2pdLSsn-8tV3PlJ-s4_C1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105

Several the Waveshare DSI LCD panel kits use DSI2LVDS ICN6202 bridge
together with the LVDS panels. Define new compatible for the on-kit
bridge setup (it is not defailed and it uses Waveshare prefix since the
rest of the integration details are not known).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
index 3820dd7e11af..0d9372fd2ff9 100644
--- a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: waveshare,dsi2dpi
+    enum:
+      - waveshare,dsi2dpi
+      - waveshare,dsi2lvds
 
   reg:
     maxItems: 1

-- 
2.47.3

