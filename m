Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F573B6C0C
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877168; cv=none; b=Jy9zwrkk9qr/8NhokYs7sx+uoSoDllDDcDYt3twJSSjgDkg0FzEtqvSRDoCpnal4DesZ7j9huz9/wJAwvmR08XQX/nIMJAvycqdP4WHMYmbMv1AnwTBywsL3L1PiURpowV7S7wKlpBhEaZYrGOlPfo/O9rdpThfjvYIcZDqV0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877168; c=relaxed/simple;
	bh=t7oE/LGtGM9qY3XFIxd2mxPEpMiWlH0VxyF/hJPnMIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bfr2kDz6saKFvZvqYYnXgn+1L8WL066H0LkBr99QpcNmw9ZWVN+/GWumb229mwPrSfUamvGDhXoyCwAfdFWF/+H6Vmo4nY4Cf4vHEE7O/lcebnRUA+44v/4SfRfd9F4Lt5jKRRXm9auDsqTpe+ahp1fzvPuFCKBz5wbS8E8hytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lriG9LOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBhPbOE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lriG9LOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBhPbOE9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDCK5Y2458333
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0lmJHLyCa2gJV6punxS+PEpzIl5sA/7C1F38pdskqA=; b=lriG9LOj2pSHjjLS
	oR+ZkH32xd2+mtNd/87Ke7f6fOPESWEsSLkGwx6PrrKdUsboa/Wsio3+R6PvfxMt
	EFwkYqCrnesqLKMuIXT2Xsyg2CU91NYXY1Y58zGcR0ir2/OFHK66s62QKYKfzmwF
	zL9W69WiU7LFa52JVg8dXYY5Blf+mAdSSCTNSA5481GsFwILPzJvgYkTc8iuBiJb
	Hcd8kilW7O7ZYF/Dyfz2lzDv+ma0xFBlxdW601j/yh9JwombQgWNpG31bAkTrZOB
	KAW4JXSb1OvPNwOERWJz5N+ZwFZBcM+/EijTEtBVDDsR+l+KB7E97GqZHodmhFk5
	nzIM6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnms8dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:26:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c40acso8095081cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877161; x=1775481961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0lmJHLyCa2gJV6punxS+PEpzIl5sA/7C1F38pdskqA=;
        b=VBhPbOE9qKgg80dH8u1ZmvQkQI457vIza8UMLFloXyjV6ZZKHKwnzgcuE/OtGwwbRu
         qW45oXHNFsFTze24iL+75HpblxQ9wq9uFeKp53Ky/b92VlQoqlQ27Z/3gv5vmoPtlDz4
         Li3spR8/c9KgAxl1EzzPONdrRBq7GdY29lwQnEOk9WiSBZfVd01L3EY36PQ/JTWW+EOY
         a1EeC7CsaBvn3rT0tCLFDXSqaFeS0Y4f+8vfMh6FaN6hgbEnLTteZYxeRWB2an8dG/o/
         rzexskbp7Rd/NCgW1215sslmyIhIg07auhGfA0GsRgZCfX7lHacKqHN1GYkEA8kFJOTl
         56QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877161; x=1775481961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0lmJHLyCa2gJV6punxS+PEpzIl5sA/7C1F38pdskqA=;
        b=NwCl62z+0qy3s3d51bF2fYs/2y/IMJrB99iYz0BrUQ9Nis6YLEG0ZEyvkEl7MNcvEI
         qclmpiFP67Sixu889LA/3Pb8IIP0KqC1/kvLbr7BLf6Ai2ZwmZ5sYaRWmTS8PCUF5Vq0
         NfFkxo4+mjrhzLsg67K7W+NYWKFxYZnEAb1/5LohwkQTtjBZGjV28lwZMHWpVb3QbGJO
         PJb0Phk9oCisEBRiaeLgZJqD84nUari4yLOFVqgoywZZYQPR4F3KrKYYVUXF65P6zylT
         ek8t/kx+ONVrZM8eAhoHPyb7QpUFiytkLdDqBcLcxl3N/bB5SEJ1xibzGt0+/e8umXRD
         HJQg==
X-Forwarded-Encrypted: i=1; AJvYcCV/xuf0NHXI/E7rZTuc0Q6NrJRKWAHTZHwGhZE3hSmBHKgo33UhRKZGASHGKSr2k+yoi0ernNZwvA6e@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoTj26wXRVMNNnHYX2pMkYbO8W2hda1wwYuA78c2+jA1tmP7c
	+pT6mpTlyetjEbwfIuvqh3SjEZxv/TT+5jVrdwaHel5BTBHgY0P2wRSVsIiH5jVz33GKH/3indr
	WNOQKLrjnd8nzTeKJDOrZTNzitGfXwNQUJdPVvbMTyfTOxWyKqHkDpX87T4U+uwPg
X-Gm-Gg: ATEYQzwSUjoyq1iAwImcgmWYS9P5j9m3y87kY8csgKlz+kn+PrgKwESLYwqGAsxs8Zm
	u4FE2jye8hJBbxk7WoIMJ39zL8ikrNwckWmUrlmtyDmGUZaFWxg+yo0m3kdsb/7rW3/zRPDkD8B
	ds1cr5W31YFaiAI358rKLMZT9QmDzyhMIsRCEdS+HBACI2yd/OpuanqEhlxQNTlJljymZvp4Ag9
	D/fAkWk2N01S7Lu58Y1NaWPOjC80zpkgNv9IBTZMXiZFbO/NaIrLcPvDaV0Jgq5gj7jdRVwxC8i
	etccRqcAYeWH1QiQuLcmIzRSccDs2sJCkH1QE6FwY8WU36fKbyDHlspJGpJ76CTye5ZHkDFUycZ
	70VHg+zRr3cGiIVMh4hxrpTGkZij+yPLItpa8PN5zFHgqT/eOJAU7+RVbffCNBPaBdSBXOvGsv3
	skpiBgTWOWP8uFvVPljCeIKa8ilACm71bKzEU=
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr5460721cf.0.1774877161392;
        Mon, 30 Mar 2026 06:26:01 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr5460091cf.0.1774877160845;
        Mon, 30 Mar 2026 06:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm1698928e87.18.2026.03.30.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:25:52 +0300
Subject: [PATCH 3/4] dt-bindings: display: panel: add Waveshare LCD panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ws-lcd-v1-3-309834a435c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t7oE/LGtGM9qY3XFIxd2mxPEpMiWlH0VxyF/hJPnMIc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpynnhG/fUKFsTXCxI/uYzrhnAcFTn1guihhEuN
 vm4wNy2rruJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacp54QAKCRCLPIo+Aiko
 1fz8B/wPUb9mHiKuVWEnm0YCxclyhve3NULVUNG7gTr2MpnLa26VaOdTnPLD44BYJTocDThmt2R
 QtgAVanyYNaJztf9Jwa2jxKaX12/UkgYjNJPWetk+SIRwPAoeOyWm9lFOBrLmPRDOZYSiUg8bo+
 uN+ROhs1LLRtRIMCzliEv0fjQkiygykoBeGsDaGig6RFXd5jtGm6AnA/BBsnESRgGhDA3PzeedC
 2Gt0WQTHcv6tVaxNwJxmfzUUr/1BYrwppetZQ9JWfFMZB85WpQST95k29a6bZlOIl26nN+fKfVk
 7uRJ1n64MsSr9WFhiFQu2/egH3oDqri2D1anBCH9mgToUtSk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfXxxtKah1F+wht
 WkxJwNvzbAZqLmrWBgbSVEhk6rTlXBGv8F11evOoZ48Tpdw6MLSLdV1apxBErmW3MJPX2971C1a
 IVL1KaudxWEk+o3X1e7DjNSkTwlJIA7d/kLUjfDhe7tVe4UF8+NtebC+7n1BTUjAKbSJLrP3L63
 VoV/Duyo9r2EHEzI/pUHqJ/5tHLkl0sDrGnYaX54yr0YYIEJkBA/wXs3es3YdJ+RsIWR9lWzmW+
 87ThQGpiCihg9bGCaAyctR1wVIfFj4TDwfCb0yPeBgc4w9c++Xtokk2bl7vIZRG6y8xvrWB+Whm
 OzQ5nI2O334ytv0V6+TfO1PTZGFGf3F/uLVlV+uiOHZzTD9gbqt5Jip1QhNu09sydtw6OVVZklV
 nUoXdOaP7k5GQEMghz5Ru+km2HfHKNK88o+uR/WhpE9fryjLckqEESf89bBnGT7DTm4Xpl+gAkb
 AIC4OFGiz1NH8XZnTSQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca79ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ovjr5O5YrjmXieTAoP0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: cOv_Jm6MjXpnNumUuCDoo9DgVaEEKrot
X-Proofpoint-ORIG-GUID: cOv_Jm6MjXpnNumUuCDoo9DgVaEEKrot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105

Waveshare has a family of LVDS / DPI panels bundled with the DSI2DPI or
DSI2LVDS bridge. The bridge and the rest of the logic are covered by the
waveshare,dsi2dpi compatible. The bindings already include several
entries for the panels from this series (waveshare,13.3inch-panel,
waveshare,7.0inch-c-panel). Define compatible strings for the rest of
the panels from that series.

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

