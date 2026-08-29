Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B1C36606A
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032529; cv=none; b=I3SslBQkGwez1FW711cFOvVtxaIrtF3j3DroR+2WUXPu4zmcBTkZ4MDjuZuo42FgptJs+5roblG/duJEC4Ro1evcaf8gRasp0/uI5Ah9kSUVhIo+zyXx8d0OEG/oS80uvvJVdsfIXigDNtVp4v9NlH5UJOMiMx5YW71q6UZG7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032529; c=relaxed/simple;
	bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHJr1laAK9JD8SE2+YR6/bN9z21Z3lrFamlZ9U5tpW8VO/UPUly7K0WagnYOaPSdKG6pHT6Iz6ma/vTZx5wNqym8rtOjkwMF/jd73IsA/54n/HTwr4vncIzfwOJ1bxvOJu+ZF4NmxndTbijPr+nWV5KUmMjbqZS4LdwOnSZCobU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeU391y3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeB4gmKq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeU391y3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeB4gmKq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIGx5U1416797
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo
	3E/nh92M=; b=WeU391y3EN2EAeWizyqkPS9VYRMrMaNbiAj1iZtZQ8YwMfV6c+g
	tmWEAHFuozPD53FpbZrgWQZ5R9Zkrr4Aa1gtPEbnNSuLuScG7MQtnYnRjJavOaOf
	haOqeJdQCWRelvArqRENAKjM/6+DMPEi89oPoqLxWIf9SLzNupzGSOpVeF/rcStZ
	hf/EYrqJM1O5XcLILqDeZHPHjtGrKKNz+kcioyAqGUWN38e5xQYSNSuEiI9H9O8o
	Cl6P1HsI7idBTp0cl68SJdbHTy23TjxkTAjHrpkEfa/MwobotvqRlWhLhqsxCQ2V
	B0a8mk2eeF7Bgq3Chi04iLHOpERke/5Do+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsgve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:42:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so42881751cf.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032520; x=1788637320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=LeB4gmKq7RGUItZafNlj9P1ZtrEXnix+8FdsEqGiIClPcz3PaAB/p5RNp/tgSzXnM9
         Bq7z08oQYTJgAOPorKFo+eVCCdPPnMocFzKkN7EA3h3pkGs00oE6bd/g6gdorUEbBBFz
         WuKNJqrrVthGJirL53EWT1zRxe79R5/8acOTnaaaZBB0EWd7WzqFGMkh7nzftLX9l6Ru
         3nutiWiHaA+OjvppVpgFoS3Xt1A9EryQ99CKg2hHB1nT2yVRovyEkQMl2+yLfo1AHZrg
         S+ZHgH3lvqPBczKDiOwPpiOXTlLzrv4UjZ+27kCJscwbW0dQQU6GlskPnL542WVUhq/S
         99PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032520; x=1788637320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=QcQhiQ2+SQhViC6b3nXUWd3GujdP/2DWN8s+xjtrtoNPwY8jrFDogOOej0sX3hRhl5
         7uuWULTx+SVD+I73cKnyqVzzlmwGYW0RX2Lktmj54TR7t4MTJcwYQ7DPwVGOVAovYtSP
         T5bKGkkU2YMYYj1AHd8k74jBDTRT56sutE+klhAu2b2ZsaSQ2/L22RpyIDVqGz6YPgaw
         7lwZ7fgyz1BxRkDvVqm1mAIHVWhP9cKB9bGMLKjlOQ8xnFxE/gKFrw/gZHqNYmzarpPQ
         xxJE5OHVp8OclK98GYcxlelDJ+1fTs94vOvRomPXeWMvrOWFQyd9FbvCZRQjn5RHW14c
         npLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5okbDBuQAHlTZk/sGTD8+Z//CAGAzX0LXq8G/euhHo/xzIAa9sWvb/NY/4AO1V2fbhms0kV7nm5oy@vger.kernel.org
X-Gm-Message-State: AFuF++luI3/7CuA4UfdvO5yp0AKgYfGEfZ3HK1jZSYSmSPMHxf1TRx8n
	2r2iQX95pM1gQjMMK6lO6vrexXIRqrde7oK/+o9a81Kc8W/ikNt9rAu+KOgKeWHe+7yi9tdJTUz
	Nog/V03nwfKuz+OIAUOlIIz7r63lZWlVqJPWGfnC9j5KMhbXKST8bA4nfxoD+2FOp
X-Gm-Gg: AR+sD13l2Ds+9fd1J5dhhHln9tca/F3Iq99bIPv7ozCku3uwv6hDChqrjYJvQ+NOk+h
	ujC5V/oEzpSZfWjYubUQ9oXLqVcP7DJi8WOGd5GsP7BBSzf20fQYfcHTr8IV+BK2Yb8SqICZNu9
	X/M9ur77lVvAeUSV9kksfj7pGqX/hiWV2vb02YrYTzVlliF2VSqiHb0RPb9+fphO9H4g3DVKzJH
	KDZQoFUDEF9nxA4qdvy6sKa1PtoPKUmPGZrXjB50CpwyZWumAX6qUB81N0eVb2M0cb/+ZOBBGL7
	HbbAEhMp0hU7llKU9DnfFpK8LzzjrqecgSjyzYgI1k09cYYRcapwlxT8WsbfCRTjskdpqtgM03m
	TeC5y6n0CeWNyhvA=
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668531cf.20.1788032520086;
        Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668181cf.20.1788032519645;
        Sat, 29 Aug 2026 12:41:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm109116615e9.5.2026.08.29.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sat, 29 Aug 2026 21:41:55 +0200
Message-ID: <20260829194154.108191-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzYDrucOEqKbgwzMI9GFk+bfUoET/OAaI0FuE
 1AwPwDyxwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM2AwAKCRDBN2bmhouD
 1yTxD/wKCcZV032FBhJ4DJlVj52zDbEY6vtEQN1S4V9nAb0+kVofU2g7A6V3jNORq72dYl2DOJn
 3PSXvU01Q9j8UAWFG3w/tsec32sPcJCr6jSq9KH3RZwujUqV9JQGgnNLCrblhLe/D7/FLiQqMxM
 sRgXNWFUza8+56/+Yp4tz2nkkkbN4Urx00SaVxdeu+CBAtB4GsE4vtDdx8OJ/B6mt4/jvJ3b2cU
 RVYz7quvNf8Jq1bI7a9Tx7l6SfFrJ8kspS+K6VboYo58UAtxsQ8r+dnuYMf+jrC9Hqk18QiSqnM
 l8FfbDE9EmNt0wh5uTsD/k/KgwBNzMW574Pkbg8bREwntzgSl2+jtxFA3jC3KGDSWH8bm4Du+iv
 TiLa3FDw1UIVExBtxTv1WtmQ/dKUF9dy5rTZPnjzYRp0iqottMCyK45pGv4bRMnC4/f+/gihsZY
 M/0h4BeZzJWe5K1kHF1mHXYU93Ag2u+stShAyjLkfKjgoI6G1q/Juv23mTiv+6sQhZggHSp4Osh
 v7skbiV9MZZV0SeAxhHo1dzNLKHcazp1GIE6JLgCXo45NdxiCxx9sOLfeCPR0M+ejE485U6c467
 RqEfFbtJcuaro89VgPDDLEN9V0zZNFkX6PDHCpREw+5GyKf8VoS1XbxECY9aVh/kbQQFHP4jOfM jHVBKmsQ9gUpG0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXwFbxzYqv3fNc
 MizNbVWamC0CwkjXUMKgpXcc0hod78MECbdnIduWcqe8VOFktGKRlaVOdZUJdHrfghxyTgSdj83
 14QiPIEvQXMKbUELZes0oSXuqPnDTB7UvpTUQAEIgfBO0bmom9bw1jk0S1z2QMSF/JWe0ls16hs
 iXyObzx/7E/KLdwwlqJAd4zoQ1lVfHc+TtD9CXF/Nl8phWnTUcKG3qFAyDurGhBqBMBcicPmoen
 sTD0EhkOrCyZiTNiJEHuncoo36F6XwDjbA32j7bJShmbwi8s9gJcpGQ4qoHgDm7xK9B8y40/2hk
 2t8N+sx8pYec04sttp9TX1KPgRZWgiqkc5nmgVHm0nP6iymR+ygZv6bx3HG18GSYDWefBCI1xlN
 qb3Q4uFWcEfK4pGzELHu9x7p00ycGnSoQLd/qEhIm9tuKAit5P4tMztfQGDtKF4w+0CX5HTKTFC
 tQq8+siMqXyAkVc6u8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXzOaaoDGVt8bx
 K0tK9t0YWLQI216xyXNExQGs32qTVnMyFiKoq6I/Sn/Rgv3IMAaEUZocFNkF+uf47hJWus3SWaG
 9hZUCScM5MukcAOcKlOz8ouL0io6OEg=
X-Proofpoint-ORIG-GUID: 51wl32-M3PrWNUa0ORvsey1W54bVFuTn
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a933609 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 51wl32-M3PrWNUa0ORvsey1W54bVFuTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171

YAML files do not use spaces, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
index dab45c310670..501af1add3c1 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -101,10 +101,10 @@ examples:
         mux-ssi1 {
             fsl,audmux-port = <0>;
             fsl,port-config = <
-                IMX_AUDMUX_V2_PTCR_SYN		0
-                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_SYN      0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TFSDIR   0
                 IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
               >;
         };
-- 
2.53.0

