Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC544963B8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189720; cv=none; b=ho9k5Fkae7VTxxPWL/noqDuJlz6E/0WdWmitF7CjtWI/ndbDoQ6VAIhxUA+T0Eih5xDu9kk/kF0/nZKhuK7lvM/T21rR3je2Jt3Vqy0rEMnW+gM2Ux0ieRFFGAkhUpgKSs65LcNDwy9kTH6qLvWCLzJ4aSUicuzdkbNDsbgEpm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189720; c=relaxed/simple;
	bh=/0gH2RBKVFdECZHy2OYb/vQdn0W3A3ypRR06Nb2Te8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFqI3KvYt0akqAi9+hhRjHksOoUhLX2vD/iM8pxbXjkNQu0ScZk5itG1xoeRcbDvIrY8shmfy/2W1f2dR55OwHtxoTmLg4+10DHLjQM5H+UDEf53G/ChPXJuMwboLRUaxjfeXTx3U2FPvUfZ4hAmiWzY8vl19CTIJXlpah9SqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMvil/hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZI17VQfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMvil/hN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZI17VQfJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vF081055038
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rZhel/ZfqNBkxZ73MGg6Xy1kCPJPWKFenIAB/a5RyI=; b=HMvil/hN1BBRUAR8
	oqc+IZxzY3iqmsWqxZBRrDVcknoA8poa1f0jhWVnaGAxlxkJBdFEsVJqaVAB1fDF
	klE80MHM7rCWV+GK2H3dGAOuDB58XnjcXiowPKxqLDy/gahuMj49IfWILauTOY8x
	uiLgZvZTG+EWU0YxOZcVbV3OHYeEGYY/5FTR8tOAqHJDhDpXclOX4eGkHvzFs8Ds
	bs9L0M4TaPM5mF3VWva+c2CQC3pECmrdXv84rhxv3Y7A5FGqzT7K0/CY0NLOjchv
	sr9CdjY0b6UHlSh3hzk03JOy6g73ZJwp90UTa/Vd1PCfzAuudDuRxcQxlXmZX6Ap
	a/fz/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npara93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:21:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so85617175ad.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189717; x=1779794517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rZhel/ZfqNBkxZ73MGg6Xy1kCPJPWKFenIAB/a5RyI=;
        b=ZI17VQfJoDa9EslxqhTBDiRFMKC9a+Ku3VQFn5tNyP6V4hhn1c7yXAS9/yeUuA1MTX
         +hzfqzWnjRFOofN4ULvaFjiDOFSLAKvWbqYKAq08c+jL66Zj7H4+tGehbhqvI1LzqlYk
         CbqRSri+ICPNcRhmICMlR+TNpegfA+H2xrjZLC7xDIeTImC6E0PWvXtEYknEBcCdW2lQ
         bUBugyN8fRhTbzhL52bmhb4yhglHlK6gPIPu4SAlwQiWifgE7pIPzCfaNjvUHbOsz4cy
         tICv8KtwLBRRYIicWTvbO9YYDVpUBUarjtF6O28ffcs3/29rCBWgeOPKWyuQ6nKiXgid
         Beew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189717; x=1779794517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rZhel/ZfqNBkxZ73MGg6Xy1kCPJPWKFenIAB/a5RyI=;
        b=FXJ9KdDt/Vg8n1kYP96RUkSv1E93eENBETgki0dRfQYU+yaNL78esiLC80x1fb6KM0
         vpLZJuoABVbdriaJ32U5RK/qNO4VEL8kOPHPneu46zs/20FzAGEMoHiWDYsJfDO8SyPL
         patJ/ETY1wIN9Sejrn5gveIMCSEk7+591TRADheSgmYvUltApVK7LosVc8LxZK3w4YXZ
         ukIe4zb1J7ekRL7Aab1q3rurnJloFvUowucDsodjwN3lRm3T0xVJdXmyAFk4etSsG842
         rWkAGan5Ed4aJ9HmEbgv7F8VTHzgdFVY76ulBKnuld9mSUoeLKJJn8qUmzbQOn318nqG
         CruQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fJT8hNJYnFEivGsEqT21a8DmbC2Fe/0a2yBrlV5hN16phJpmJSaILGE1izuGGZoSFsfTmbkgJV4Mc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03Lzrr3b9mJNsC0Zs0VOfAcvXJ4tvoehHzYPJCB3ugzEJyij3
	wh/CVFBOm5852mV/hAwiNLmGOzfJudn1KbC5DDqbIHXz2AWpQByxvPnfBBNfHetXMFdYlSznfeQ
	Hzu8XwRtFGxs0v7ktpCtChBT2iI0G9tXhv77w61/4KxJ78qFFfuuq9HF0NB22IPZdLBZJ216q
X-Gm-Gg: Acq92OFghmyCrAsHUhpiPDBe7E+BxPXyzG7xodc0H6bt1FZ8SyjmgVpYl84B56qZiNL
	oZSyvpUsnXquWSHaSySy9OPL9EOe9fpySzvMwmnRfsEUfBwKsSlqU3X4jqivL6tCmiHlKcDi3ca
	6C733kQLpq0LrXFmjw4LilPXvfjuvkkctsiSOhyCBZpc1nZI8P3E0QoGbsXt6j+cHUI1l39yCIU
	mEaErIxUf7KxJSZCbAI55ah0xaS+wL12CD3SGnSuHqSeox5NXklEHNvYcS1ZmrxwhWaBXQMQlYB
	hcSdQHHhsUuZ/PIK0QUYRb9THUPb/+4ef+x7cmfed10CDP8iap9A7DWWLW9RNus7+HpGSgALEXo
	5nnzp8a5zroOhx7Hf8JZUF+ntxEQZknc4BvkGpz/ii7zkxbQ=
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr209580815ad.18.1779189716772;
        Tue, 19 May 2026 04:21:56 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr209580425ad.18.1779189716295;
        Tue, 19 May 2026 04:21:56 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:21:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:21 +0530
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-1-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=1683;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/0gH2RBKVFdECZHy2OYb/vQdn0W3A3ypRR06Nb2Te8U=;
 b=PeZo0W2eoXZTAKaQ7d3CH96/n9YjlCZSu4624vjdkgZ/G37ljAl03mfE6/LXplfr83jlvOKKM
 nx25Y4zpbIPDL64JQ3xSTflLvSFIXhnySbIgsVgRVUC8kQV7HnIv99X
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX7TgfWBpzIcff
 FLCk71+uAZj+p55devPS8/W+pJhj3SwfNLgxfjx7qkrfBa2P2OpwMBwL2sq4mNa4/c5VMymNGwy
 VdkNJBH+AZzAZV9GZ3PgLkg5PDSui+kV9BUWmcNbwBLimV3uIGRMIpqj/Jp6jBqEOng7VTBgmSz
 qKaeXBgYqDF+mm1CLktne8As0BstgaBNzpQXAYxD1FwRW1niHkUDQK7iPemPWAYs0yQmVu0AcSe
 mvD6XtmrCxWes6m5Vu5JIiSA1PcdKrWUHaVlcD3gegyx3kcyUQ0VpCyL+Sy4UC/7iM5vATSWsJ1
 pizSH9O2XFqJWUz7QWf7UaSKuvX6Ytvy4b8vmCeew7zf2f57/uS+2x+tMMMz+svUygib2yU1y3Z
 qohUlslgtnn0sslKQRMuek/bknMvowGrl2J+p7789At/Q7BmdgSgVqYnCkj4QRfarXjqeZ5Nxgm
 oYu+U73Yac+LK7h+J0w==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c47d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -YM7KBNL3PVJmfKgcjcWMfIXIsLJ4c52
X-Proofpoint-ORIG-GUID: -YM7KBNL3PVJmfKgcjcWMfIXIsLJ4c52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem
  - CQS: retail variant without modem
  - IQS: industrial-grade variant without modem

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and its
corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index af266d584fae..7c5c5f4fc30f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -968,6 +968,24 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - google,blueline

-- 
2.34.1

