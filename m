Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0FF30EF8F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436944; cv=none; b=KnXCV+4T2WffCsQ/PqfisRNd5Up5VIi6/kapdaQtie9/wrYisVGnJtamW45IZ5IE4PJi6GGRPPHywoTfbclkSRiN8nnCO2D7sdEEdKFSqkFNjj5O3YnlS45Sx38+tq4tzhsdOn2yiTiBluBdCXUDzZ+SNbegZEZIMjaAYRBbSz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436944; c=relaxed/simple;
	bh=wdkRrMQejqveISkL2MxzQ/V+fR3t7RIyzxSBQp7r+1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdExhdQ5SAmQq9geFPF1Pl6XxI9Ql/2GAVUjEVIaE4dkk+IKipB7SX0MTSZlLlGvKtJ0usz4UzigGMaUZ4XfVzosFbjyHLXB8ahqszuyhFnMpEEe/qmEv+oaV8A10GrZlJuqMHcHaDE2XChfIH7OqgpquI2tRM4djXCBBMdJUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdnTDT3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Anuf9XKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdnTDT3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Anuf9XKf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9DRwq3057321
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1AfWKzTwtok
	dQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=; b=SdnTDT3ctcNcmQk3ma/BCd5+BJU
	AAGXaCFMIAgsSSIvbePj2oeG5CQHxMwTfYEVW8waM28g+P5X+lgl8me0bMgDk+vf
	WkpWSWsPT3yhZPfsi1s6agEDUFI+5/gMFQwK+1jD/3GJG0efqzey0XwhT4ZQUDgH
	G0Tn8rOutM8pDZe00LhM/8L04QoIv5iL3VRR8V6xjgedV8+JN+zgCslQjjH4d8g5
	mBpQHAr75hwr6Q8qlk+8rz4WTd24HoQ+dUQXZkCGsWNGaO0xj/1mFFKcd3RqRXwH
	tq6DlCBk4rKzAFnvl8rdWtB9VejZpiqB56W6ygxBuvpjS5YIOS5RuVrEmyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1rk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:09:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50939597b85so294743381cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436941; x=1775041741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=;
        b=Anuf9XKf3/ItdIjM8SnhgVcp/HN4nDife6hNdNA8mBpfh+LkP5HdN1MtF6yFFDyisb
         5CEa8dj8dVwRS/xVMoquXbg1chOmHHV6PkjxYwjWapjVxtH1o5qT2vbNwOJib0ge6BuM
         dYFWsFLs0fdSjaEEulFvtB/YjfV2ZxZiHuVhXqtPicpw0HP2iQUVWWHuoo/8KB3ph+S/
         z4tv9ePB+uS2K3f7hz8k6cTHL7LYlqzyXPYJvjOhemA3C2qQo4U+ktZiIU5yMD6rD9sY
         nR4CVpvlQ6Vh7F9jhRZ7ZGiZCSGH5BP37gPRXDd8QHWO8YNJp23TneLQonp0HbwIcT+u
         xLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436941; x=1775041741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=;
        b=W0PNm9N9b0IiWEoe8PbnXkvN2H0BUavt5vo3V2T4eHt/iXdcLvg0L4P/3rBb9dxU6y
         BVni4eEDdVpeC+6iMAQee0huXLd3bn1x5vWoqoZJlG2hY1QZeGwueiXXzemFUNOeEmRl
         WRN/fhnxEFJKx+Yj5OTF3xxYACALPp/CWV29ImkNkJ/9tuUbYDEp3xSVtFUXMDiOC9ZQ
         AlZ9kYCBpdadUTyr7p9mKMYE4/ZSp+mU5hXMgh8FhlSimNLu4XU+6i2Y8R/pDSjl0luK
         FGh+qR+43lFPuu5z0kQkya/SYHYxd7xoz2BT2wPov2Pd9x68x2djDJZ7ZzFszM5q8B9m
         1rIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFDCMC6unE81xzNzDVsmIiaitaF1By0CBv7sjjfd/peuH8GnQJy/iw/YfDpbS7E4NQwpfKhL0AQm5q@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGlZGCQyiK4pIw7Xxm7LbKBmdTwk0j7eN3v6c9wiOsVpqAelw
	APffU9vtxckkP4p93LWE4zJrL4IItGEfR9H6JlqxFDpyF5MxCe/O0AWByCSVgAdDRSYpLoEmc+g
	JBLB5QX4yBInwELbKfyIW27Vzwp+qD9SKBeBpvt0xZBprNJKkhQ60wwftCgpYOryR
X-Gm-Gg: ATEYQzwWjwulDWR+KR1F+tDxpMekHzQFwHoIu2yWOQnLK5BaASrf4rKTtZambYAPbrW
	BzHdLK4JLwkhrNc71GEhTsHgfJKEKewiGrFn2/YIdtGjso9ID6Yni4DuYUSljKQc6bSTy0i9VDE
	DJGE4exGbdT7kdGlnjoN2ZsNS59/JndtySdlSo2zvEGqGoJypt8KBQEOuOPhHQNPd2wgYul5vnd
	6SqaLckkMLFvr9UnoK36HOwcjLcoF+dd/wznLrTqHn/LAwGLUjlZnvtjXeg3N7rp67X7qafHpDF
	2jCoIrUAoeqq5i6kzQi7K9pPKH2aMdAYk+bU5nnE1FG39VQLSdlKT67EflGA3zkvXUR2/dyM7fs
	N6jsLlVc8OvlW0kH0O0MubLZpu9gS7j/EVpON
X-Received: by 2002:a05:622a:41c6:b0:509:764:2efa with SMTP id d75a77b69052e-50b80e6a7d3mr29556261cf.59.1774436941349;
        Wed, 25 Mar 2026 04:09:01 -0700 (PDT)
X-Received: by 2002:a05:622a:41c6:b0:509:764:2efa with SMTP id d75a77b69052e-50b80e6a7d3mr29555851cf.59.1774436940763;
        Wed, 25 Mar 2026 04:09:00 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm47619447f8f.3.2026.03.25.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kartik Agarwala <agarwala.kartik@gmail.com>,
        Maso Huang <maso.huang@mediatek.com>,
        Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: mediatek: Adjust style of blocks placement
Date: Wed, 25 Mar 2026 12:08:51 +0100
Message-ID: <20260325110849.127051-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wdkRrMQejqveISkL2MxzQ/V+fR3t7RIyzxSBQp7r+1w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw8JEXkxKeo16S0aSwyAQP21odbjBYOyBed8EY
 /h19F+MUMiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPCRAAKCRDBN2bmhouD
 125vD/oD9fXoiFRcGa1yPFEthz/pVBn7++KkN8GbruINBqIbRX2H5ZSWD7m7hMqzWZiFRdm4Ebo
 My9Wgdv2M0Mubtm6RgMVDdaa9t2y9c+4n8Qz1q0B9KyNxwxBuQuBQYvdezYOHRDYXBSsCKeC7Xi
 qq5usz5cTNVfxKtVwnf85rpOClcYfTk7PxH4o+SxU3LePJdHF0KCTPlrGlx9hbb3Q/9lDArQWec
 qnanyJhBFCkRrTa2cHx6V1K8lhPjIMUk8yG9s/vq5chVpXR4kq1lmj2rk+Ht/GnwaA+qXfTnwkr
 7p0E0HZvC1/Qhmman/avtqrYPq/GxfcscilC3lRdoGGDH38YmIpv88Cj4hA2giLwdZzCbVd8U6M
 oSkyKv4QfC6CTwiKXes8tsm/0tvyaeynYqtQ+VKtqA5SEWPPdAtczvYBiwWL5zn8/efJ2oB9dqc
 hIjLglg2mTLHHhq63ykYm058FLWqAdAWSkkGu7jQJ0kRWRU5U4XV0l7F6MasgM26P8KNIXL2r33
 4/NzFv/cmQMalF3qKYPJrmEkrS5R8AYO9HW0Y561DZ6eo+tyHziEgr6HegIr2THB+1x9lAx8JF5
 n8HyTvh9ik5npRr2cEOFbCjAHiGARgyxFUqguGqB1X+4bQBwCCs/DhXSloC2xBm4KLfg6xd5enD 0mP0EzORS6NhEtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IB8vZn9ZcNc-qBfeJKXapm428iuLSqZT
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c24e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tdU0VRo1b7d2wqM4LDkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: IB8vZn9ZcNc-qBfeJKXapm428iuLSqZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX1Vv7uO8dOoXL
 8s1L10CeefcJwlEHysiEFlEFUcVO0gFACJuWOzZsqfeLAFnrEfCH4e1er85rf70uJBIj88JtNy3
 gaQi+fFCLTsLPMf6TzpqxnKtdxAEXomyFN1CruFZittUsPBvKw2OtOWdX8OCdJvGTp236JD+7wF
 ocfzqSIA9rGzX1EmlvcfIiOen08rtVPkckcQKmFXBD/4LxHjxTYNv0trcAWgLBfpybUSSJOrRJe
 vu6YTtPj0TcpVP9bKnuR0708wvloVXvscnBdNDJ0DGU2UGECUmErr7Mtyn2h+tnf9IrqvVL8KZk
 pdHbM5/ipSh5LxnDmwxhSftEe2Ukm3yjd1CWvIZwhnGbmZU+eKsHivGy59un2nXoKgRXD8ovlhI
 cwqmtMcCkRgK0k6sdSGRbMihYMAqopzcST0x3LuBYw9ROyEUovFWrZlD3z+uoOnsIo3RgCKSCjG
 ImSnFOVqheNSdrFrmEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

Convention expressed in example-schema.yaml is to place
"unevaluatedProperties" part just before example.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml     | 4 ++--
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
index 09247ceea3f7..f21cad4bae15 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
@@ -36,14 +36,14 @@ properties:
     required:
       - sound-dai
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - audio-routing
   - platform
   - codec
 
+unevaluatedProperties: false
+
 examples:
   - |
     sound {
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 7ba2ea2dfa0b..539de75eb20d 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -105,12 +105,12 @@ patternProperties:
     required:
       - link-name
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - mediatek,platform
 
+unevaluatedProperties: false
+
 examples:
   - |
     sound {
-- 
2.51.0

