Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8423A38424D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305551; cv=none; b=b7sgccqViXatOHhsEvl3MRnT/lrIDDf58/fslAE71Np+1kD1DQc7Owq4wi9JXDGZ4Vf9Nq+vI0DTx7bYGWuV4RXs53sAaDhYvjEmq4qoJ7luNEoc7YR9xS9UbjOgw2HpDholxNoeYSrWd7Tm5otr+GNrjYF+2dPlOKo7NWhaRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305551; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViC2U4UblG2GypmxZHGSHDOc8WxIrUPXSJJnywMh4F6UlYoR2efyx4JYcDv7WrJD0wUFZU14/5BBvEw5T9LrPnuHqGQS1QYOPq2FN24bwcHA2pl3u+Qdit/F+6iwZUIDsIVQhNnK1DBJE0CWlztbMTnPz5X4eio6VPg/xKVF0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiVQExZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StIdLYY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiVQExZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StIdLYY3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqrSL3934924
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=ZiVQExZU1enGt0QJtVH3pBGfkz7
	AfZcWpcNZ1MFuBqIH56MA8oQ0jvA3Fa5BVDD3cw32MGreuVJdKCnE/9pXrAc96bA
	S5NiMfNR4w/MaRiCgkcQUqHk9uXcfPwxwg+eZK3qbR80aXTz0b3QtOUGlrmb+qLk
	AVlFoShZJVkoYrFzCxqzEGzkJqaQDX07+Oy+Miz6m/AKj7V6Auh3J5rEVjD3OC38
	sXDtvAlcCeWmg7WAIBR/fM4lUdB0eMSuA613oqW5sJteWRy9igPtsPZMJStp5dXM
	MNvbGI4bUgl8Lzi/DWzTMO0BHOkI3xf9B98Ffjmjami8yX5c3ki5TuPQ2wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0hkc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b6f869676so16130641cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305546; x=1774910346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=StIdLYY3+IUst2PNg0r/dFHDYqIl1a/nt4g9TRcz0V+ZNmJ3wsNjJhEM/xKYd9aLeZ
         GefPsVGN22b3t9e/38Fjbdcj132CaMLPK0jb8x+PC2CQwhkF4mEWvWb5kVrU74RqQ808
         mGKbiSjZUdQi586bDyuW2lteW1ysY69CemMcK5MGz0r9vrY2rhzV2sb1leaiTKu1CW3s
         Vms34URiYKmZiXvRk69RLHpOeGEIScmyRplvmoG1x2FVNFzkMavxNaK/PMX4mtOfRMAH
         OlnuQYl19k0nePKe98+FA8VQW4MJbXFWx5rUe2Y1UyIEhFZ8PEyy/gkMvT8Lzh2jmHev
         hg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305546; x=1774910346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=Va3HG60yIP3HY/pc1PBTsdQv9Alphyw9W5/xJio7mVX7PCUjOluZoPYH87ZDqjx3lx
         VebTM+g31gnnX/sQNWsxD7Sou/dYlLOtx3mYruSihsf4zCbTwwNyekmcmuI1G0iaZ4YR
         pJwaqnJIvTOsQ2xwKacU1MEUCnHmQ8t7S0KPYxq3FW179f1TbD/tJzz+asw3jO6ceWzF
         VwocJXQEkG8Y4b4aQwwhHSVtRo83PqjUkLPF3+9oMKK3vgwD5lGHG90S+og8Tiery01X
         1kX3JPNa/tqC8VkWnv3Ib0Q6ygqRR4fxEfDtwJ2Ydm1HPFC7818wS5aSYkITX2Adlrpy
         VdNw==
X-Forwarded-Encrypted: i=1; AJvYcCUfY42Br/MxBw8E0Wb5VkhAQbPe3/zVQDSdyIXZ8q4fNGC94LjatB2w/A4yosv2yWJ/JQkfe4E/xK36@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRoLNV0LUiggTFv73fVfy2twWXAS8KSuGiyqzi9Kppeiea/Vb
	jplmD2Z+79zkt2DtmwvWL8vGQkLZDV0s3GY8bNjuKm6aCCTihARLQpzQAIpfdhSgP0kH4TsBk/Z
	iShb5c7/WwRz7zGjoik+trb3bg7IxNX9pbQia44K/GhXX2wIt6BGEuRo7Mc6U1Zoi
X-Gm-Gg: ATEYQzzWt2iOD52aYo62KI6zQjWCIGZgzWx0nuKU+xdhEhimJRaKDzu8re/zrpHgrcr
	TInDkR6WyUOu6Gwzf7EhP92oKr9QOouYKvfhfeb/hCBqeuoLySjzfCslXR5Jj2qOFbBubEfkN9A
	Wq1jT4TZ4W7ixb44IOiHKrT7GmkMLvL3kgMOU731Ik7f+pWzq/A5zSOSGUU1sxuY2W46/kAr1D8
	rhDmDmjP6o4jSCpIAjO2GvarTh1mmGv0P/ezavVG4b1zqk2iq4vwVBigewdTBnC9/LorWF4eJOg
	YwJPwnZBZFfElq2j+/cZt3LDINsfqlL7j6BoLVhjGfTlgpc+vtGh7NhtpjCT01ldEPq2LKI6+lH
	kr0dZh+f6NVXYC70utTaxtJbWdGYdKYy7lL5fE/rGjTBcX4JOM28PNyw=
X-Received: by 2002:ac8:5d4c:0:b0:50b:4001:ae11 with SMTP id d75a77b69052e-50b4001af81mr186283961cf.57.1774305545736;
        Mon, 23 Mar 2026 15:39:05 -0700 (PDT)
X-Received: by 2002:ac8:5d4c:0:b0:50b:4001:ae11 with SMTP id d75a77b69052e-50b4001af81mr186283741cf.57.1774305545284;
        Mon, 23 Mar 2026 15:39:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 23 Mar 2026 22:38:38 +0000
Message-ID: <20260323223845.2126142-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1c10a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX9RjGcSOb8P5X
 6Ia4lLxHM7qjAi2ILIQhK3aS3lETkZ/OCoGpqhVnKvX0/J18LuL2m8JoPdbF+QWSQIOJSfkCIYJ
 GU7OQyHsHNomKESouSWvHlTkuGOl1YTaLfoF2xko/6Bw+kPr9yblfXar5G7/Qgf1+em2RGBc0et
 hJNqqG53wC0nP8iqoTWUuL1XPfes+Djdlt3PxuL5Mc99fAUCWlYHSaDmtJzx8qodDVS4K4zRCUy
 1jcipS0TibfdsVvWVF36nGtuynf8uuq8uUu5RUJoSiKMnP481O6W4G1yD2N2H6CkqJ+2wgRbCHZ
 rX4cBZa97qpw+4mdzrO/h7D0m0M1EKOkGlK+167Kjg1hPl6bCjow5e0B3rcbUdzxS3Eas5gWGDY
 B1GuTEqPm9nEuZ9ZmFxZXo0o/Wti9Xs5TBE2oYTgZCRd5n7bzI3YdquE6xCN6MDPAA1qFy/Zpdy
 fz2rhxQv1O+Stc6jmmw==
X-Proofpoint-GUID: pB7Kj97EZwZnu_zSwCt-Jo8jEvgFjaHc
X-Proofpoint-ORIG-GUID: pB7Kj97EZwZnu_zSwCt-Jo8jEvgFjaHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

