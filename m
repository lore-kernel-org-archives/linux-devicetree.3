Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D73A169F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117508; cv=none; b=HNHv/RjV1FF7h9ZxrinV6yAmCc+WryzykyE2uSaWVnDilcKp/kVzc9NbbzTVzgjKwU3ATlwnTIsdAB9U/udBjMYpa+WZfl1C54uEzDwodv+X4tzd6B8jkCT+5hcf40Rm0IJywOBkN89gNV801IGjepj5M0i+ehc6UhUmg4GVUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117508; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jx0mkuxz7xRzGBqrzjYMwR9ARaT32fvxetSdYkuPcbrORM6oekXjpJrgnPz4+y7GS8JyrokuKRr98yPY02jHYsTQyNtwU/sIbIG7MDpu4I31Xeu5cyVKIa0xtGASiMcg9glFCWc0hrWm/e0bgOSM1mTMVCLrin7toV7BJur3/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pq/benq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVwblm7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pq/benq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVwblm7l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63271Emv1964872
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=Pq/benq1fMfs06rJ4mb7MY8GXf6
	fLcAdWWZEd5pBl9orliEbPL+kaBBJb+VwJAI1s+uohaSUVJBylRMT4w284RhvVzl
	9DOptNnzgX3KYR/IewWDTqbUk4lEZKtz/W1LC7EHnxcWszoMkO7pD5kVfVINOW1V
	ZtejkiYD6DlT5Q1GmFVv6dgZBAbJrCegVxqWsSjRlqrDtW6+6fqQvNPocJgq4CGC
	QHMEruQ5lB6ae8AmiY9qoFlIJaPp3pUyBBDgg/vxkVv6cYPBYaO/THWyJj6onbaj
	8KxJvBGdww4bBHdcOqa6qmhhJqQyFCStYadk/bo00OeFsjLqTypY7/baeMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h238a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so20775191cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117497; x=1775722297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=iVwblm7lin8s54c1pQp70VXfrqU7+0p3TcYvC4nlwDPEc3IU+XsgLO9Bkr4T6LiDTZ
         pG1EzWuVUo4/KF6Ju1+mB8TpfrgwhfRt1SOhtb4ozn8l8Vjq2xrkQ1AU5f50B8LBrCJ5
         UKozP/wQ5rYnT4SS46Y/KlxmaattNzXvUKhZs9C3a2uV6YoKpvVoL5cT+ORC7mGDoy2I
         5YGPwlExBQdLAh3g+sQtad0eh65WImVvF7gkOoK2HBNijBVX1Jy9Q7hHF0RFHO5+075k
         dfQrMpHeBmcROSxijXn6+jWDr9sQbAfml3b1OdcF6UH+nbA5OvkpaGUzQeNE26MKYqN8
         p0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117497; x=1775722297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=omvD3akIhtQddpwwdx/9L8B8vExIV2UTRUS5YDyb2uhgmGYkqCGJmWoGOMAEvQo1Mu
         POEHqAhrk3GfZP+H+BBFGrM5qsqiGmRmklqYGvaJhagHdkQugSoX0pePKiRryqZ4S4yA
         qsJcutfFQ0v9tc+DoJvTe6+iIFOC412GMqkHtOWvJSxaZZHtlMQ7PkyU5+bVWsIbtCwj
         I0ZBOfsuBTPJfIevii7kLsj/AhimJqurV2cAklQP0d8oyrkb145ctbpXgA3npIK/euuD
         NIO91HOBGhHyQnbk1WEz3TAKd69Mak3D7qXI+CQh1jSPHynpQ+6VJX2sNXt5LiU/TeuV
         Y3/w==
X-Forwarded-Encrypted: i=1; AJvYcCWC9V1Tha+/7O6fJnV94X2axzS8pmI0Hulj83CzBd/632mvKhuoE1yNJWPUbxCOWJDPHfr5y+ulMrk1@vger.kernel.org
X-Gm-Message-State: AOJu0YyiDSTn3D8y++rgBD/JYWBETulXeP3uDR9bLAqVHf23H5wtxJc8
	A3T6n6DtV4iG/KFCj0lxRs9zrQF7JkoikAiERy9k+Dd+8MiqtSG60h1eyh9Ksg6iNlMBANE07hW
	cbJklNyWepDQtjph7Q3u4yT4gQMEcz9jXITE+MLRKkx5IL29y7i/RNNa0n2L3uAcr
X-Gm-Gg: ATEYQzzmM1U9wE32YCCFBRCZZBFps1D3Qx0qfn3COKrx8R/rkRtH878lj+5KdCRlQbq
	vMXLTsk9zvM2SmEL6SIVxtvDi9j8CGIjpW+4ZxBp8TQ0jYUycTmLNPjbGz0nCHJp4/r4UWHDsq6
	uTarVUJQHKErnt1as9QHHXIYfEcZOhXjrqnQcdgqRPuwffSD39Gg/7CQPov+GX6l2/r4QMbgBuq
	RbQo5gvHCJ2ktfdGf/SdfJh1bcW2IMPRIbv7zLSpjApVqwS7+nFXjLwEQ8D2fhNYYzV53jBqpm0
	TtDeH/wORS6l7MaBcZAvcyktbRHSNVEvtcx4L8hJ6h3fLpXYCcyB+b5GiQ3mNGSm8chOLRzLr6M
	p3fpYiYJBW0PCAD4zHiV0xfgAVVJFtmRN3cl1s/WeGg6rPzCPEqqC/kU=
X-Received: by 2002:ac8:5a49:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50d4fc18047mr15913611cf.25.1775117497413;
        Thu, 02 Apr 2026 01:11:37 -0700 (PDT)
X-Received: by 2002:ac8:5a49:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50d4fc18047mr15913351cf.25.1775117496978;
        Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
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
Subject: [PATCH v9 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Thu,  2 Apr 2026 08:11:11 +0000
Message-ID: <20260402081118.348071-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce24ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ku4BcRPaRHnGg6VwDIPEiqmiyNbPaHpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXy4qfkFTXUppt
 U6lPMywhbRVkWlPXOmF6Mlr0zB4on4/eh+2kdX2KWxwaiCKT0o/mWk3JG+UbG8qc1uo704ciK92
 NvXnI/sezdfmX8gOXvBbO3tsdQ1N9EY++0i8Cd7ZbsKsEl8pTNfBFlZPHqtZz4O+uGmlPowbifZ
 sLecLxKVpzWApL3sxp5TFrERfi1Pj1E6QOhTWNB4tIbJTQ2aW8lHz0deNFGHbb1SM06vg/ylWw5
 ToJoWNagzIjyyT1BMz2HR4+0AnuMCy/hEeiWWYjTC/K5x8x6zDo4oCxWiFZ2Gam9JpkT02TI9uM
 sMYC/jCo8M7b9bBsDlkkEuUM/5pMg6rRLQsxU/BB+vHuG2SWWCSOBRs/AlHCdn99VSp+ovy+hlI
 ENNRb/D0heoX98FciixEnYzPa9p+hno65r7mmfpmH44hqQBUOuKoP/wrLaBlLjZPOom3QLaRO+g
 +qD4mgrap+BmQP+IFPw==
X-Proofpoint-GUID: ku4BcRPaRHnGg6VwDIPEiqmiyNbPaHpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072

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

