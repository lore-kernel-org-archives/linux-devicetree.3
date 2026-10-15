Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F9534443
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074383; cv=none; b=OmvTvhOUCEeaTIqYEMWTm6ZOSAYr8RA898jLcFJCiICyGwBhrFaOEaW8koHsFL8jzUvJLBwTxXEr1imeWbjs94mAN5BAaXNUv8Aun6FBY8/r6HwBimro8LwP7KSxy/9S84ecv2eBTId/yTfxf7aoD2EdQhWV/mRL/4NB1hyaCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074383; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8URsxnxl6rBJj06OYta5+55WfIK9Yfh13CRXUyantdmdY7uKkqm6cHaZEG/UFjKLt+37HrTF8zUIJ6mf1dXewkfRl2lY6BEGW1sd0W/pZqX6fuVeXPkhSBaTzdvBUWex4JZ1IG1mJbWFNHGKVngleJpoN4Nh1X3wR4AXburxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOuhrj7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8BWdqYd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOuhrj7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8BWdqYd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQLp91596905
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=DOuhrj7tQmzO4se0
	B6M0VuzNCKu4xPUlNYRkUVEipt1H4GDlQTqSqasCCFEfdXEOCTAvOHwmeBt7xSny
	IBDXPVOSQAnY5mZtoH8GNx4LJ+MvpH36fTfhY58bWk6ac9WP5TIR5RxMjqWVAHJk
	/x1I3CCjKd/DuPET7nv8ZfOTOba1zWBrgYhPw6ISNbuYfUfk6EiNk593eU6l1WEQ
	8G3HM3tTmc86SOgFP9HJ+HRRcwL7vGgSTIxhFKae1Soxq4C606Xq62uTF+No20Oq
	Q09M/QTl6S0WxXyxRPjBn4KlDBvlHdfZPrZOC4r7S++kunKvuFyIV8mZiX8g+yeC
	5rDfNA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8x7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:26:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907539aff7so540135241.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074377; x=1792679177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=M8BWdqYdGnAH9S9NQkbKu3ciH8vBFTtO4N0mqEwNcwetBw5oPSSiQY/dhbdmLksM/e
         /XYtbzpu21Yk3c+IHP+hjUjq5w42I8qjyUFfrza3wezWqcN3hsbbbSVSE3Mos+azVkST
         8wwottc+jUT8m9P6DYAm6FwV3/uFHNr3JDRkXl+19tTQLnWsFrOSgwJQD7NRY8MOjOZ3
         5g3+UoqyNJ4gpvucOwxAvjUbaRx5Z6u+0AbmHkcV2+wxc+2PNIffuWv1vgx3C2mK30OD
         YR4b8CcOERa5dIw4bhEAxhFyvzoP0vszFFscpKbbgaPIbwQFXiciCHJllDbyC8xbBaW8
         0gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074377; x=1792679177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=U1FnAh/UOqcmWGAvvoaa5lh+Z+LSO1psAM+cR7pTQSEXnYxGy7mS83Fw9qnHTR7JQY
         8XP25VyoY8QMHVL5K7JHIq5f3JE5DSwiTV7Q61/rzyodApvzUO7tfnR3XTAkuOClhpcb
         sIvjShmsJxbsA2SXBidfvkHAtk9H+Y/q+33luvkZrwL6qoqvI+j1UWoZ6QO5kWc93W5u
         otoxkh/ElSa67pUUjAPsmvQmwSPxbwxPTadHam1jisPlz2dqg6ZUXyckfHeF2Q5SA4LV
         Y3wW/L6CoKYTjUvHaBNOS5LaCKTehXwXH+jfcTBfL53egb3AeTcmF9dEJMignysRzEkV
         F4Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzXT7doUDFmvb/Wz5KQoEgLpQPRgTQ54D3mvjaAq6ANNkr1Y9mTF3p05N6XF2DFjiMsk7yZc/DObLNC@vger.kernel.org
X-Gm-Message-State: AFq9FYLmJGCcOnfK8HYEWvMC61Wd1cyts8di9qE4qw4mEE0vDvJRsROC
	aOr60jCffeGA0jgAie2Jg/UJsiQ0RVJTAlFlbxyEmnIjjvYXUTpdmBqZNDhHivkCHYffCKuj2ND
	OncoqoKwLA1MUZ2MSNhwJK/zKhcxtpIgYV9jDJGMs2lwzgGlQTiYFxpnOjMlEZPPG
X-Gm-Gg: AYBFou21FbJoZvQFFAxwjelCGSkqjrKY59dZoSYeBzYVttrQtFktRFf8v9qza2N6dCi
	TsKNPvO0HdmjCYKWPblUMTxMFLyRNaoQ26kKN/sUjCws9p9/z8wTzFSO1+JqRKao3Y09B9qixp+
	LnqsY+Vv5V+tPwpIP7sVO+Ri+/LxmERASX9TGnF4Vah2RdhbfYBxHJCeSJ1+tHebA4b9i3dSe4K
	exkNOAdCGr+xIg08ErXER4alYS1FJUGDSM2YgAwh/n1YXWm2S6fL/HyXJU8mkKC/gwzPvIyZ2Rv
	s9ZJBIfQknSYph03ksHL+TpgHmpjHHRI5sIXGyOtw7tjAlQTEmpRx1rm+uGu58s+dCvEG7Rv1yk
	+VlDQ/espoesRhKIX1sStEhzUjxbFLbUsakGZro51RZ3JHvscyi120nkWK5p2yVOZkeKQLtG8TK
	pEFY/ff3s6DnJEhY8JejByHBYcxb1iW5YmzeDy1NX/NE5TyYim9CI=
X-Received: by 2002:a05:6122:46aa:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5e91f4dcdc7mr6746927e0c.17.1792074376575;
        Thu, 15 Oct 2026 07:26:16 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5e91f4dcdc7mr6746873e0c.17.1792074375948;
        Thu, 15 Oct 2026 07:26:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:00 +0200
Subject: [PATCH v11 1/7] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-1-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXxB1ORYmxTP+2
 dBvpxFkimuE+UBzX2rD/cmT6QgRbHp7slOWOhusH+UbakVoPBg2Uc5GkNEGVvWxUABUb2XvKTnJ
 jmWCtC9r3/lnek3Q5QLKyQN+IzDJEvS0C6eH/Wlt/PWc8ENWghKtS2bZbFxZTFDqhmRvy0Fgu9l
 HtS88kpwFMpL7sacUi/Jtgr3VFS6dPBMF0SrqCCb8Lyvkp12MvYSoT0RwKpRMXX5931ZGn+aMlv
 nRgs1bSbP+MUgb0rIsaV12RoS1FFh4TDFBNzDtZ9Fo0wKD8hx4We8DtebGntPn6jv2DUWxE/wwq
 sXOpd105obKKIh4I1rRWcB6xlekQF5eD8efJI0bAyS9U9WkPireXNPvIachY859PKCEunGeVXSe
 rmWYd/C4s3oYzkHUAJMSL6EhDKGzDqKGWBWHndj1g/ucsx4CuuS0EC1quaBJV0ZCZNdIYTzCDgB
 ldox4B5d7/w9fxvO88g==
X-Proofpoint-ORIG-GUID: ybTw2HeX8m1GhLgRztg5RAQOIrIxqm1c
X-Proofpoint-GUID: ybTw2HeX8m1GhLgRztg5RAQOIrIxqm1c
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0e289 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXxAc+3wOZSQkr
 fI+svc9WtAXDMlxsMlxrWmELh7w9yVQJXbHFOT5ZEkWp4KG9u+4lA7TDBiU8Fe5K4+lvKyDkH7P
 Aq3rdshUq/D98frPaJFHYP0h6/rfC8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1

