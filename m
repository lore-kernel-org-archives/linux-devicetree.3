Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6A4DEC0F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551634; cv=none; b=D2HR3kUGqwqkoAYon79EtMiouRvvb5k3ttq0y0cz/iYTDWewzzEQ9gcGAaM4dVRARQOpQMvux+bfUueF132LBu48EwSoaxawf0750kPa8A1VAPBnWQTMqKkSs8COfE9rWtA7+lYjmaubDmgwZ/109X2ztMzaoKK60/bOWtLEf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551634; c=relaxed/simple;
	bh=NarMphwKJZWkeVrjUE2NXGS04Cgen9YQEU6D88mCGUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFdWTXHl+mKbMiK7FHEW9QvmBiP5fNBrap7WRHAki4UcQMiYqjnn04aCI50JRS0Q5Httq1ktn3O193IcEwmSiMHCwLWJwKEiTmGC7YxuO2vYcWvpHwRbhtjK1r4YoLnv/3esQ8g8GxbZsw+Ph0y40U1hrluoMKT5KyPxSpzw9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3b05VVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHBZvfOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3b05VVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHBZvfOv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KFuD906806
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKBZJnXgmeKva9tYHEU3hlo2mDLwoeHX/ZQBXzGxQxw=; b=h3b05VVAmzCVlbIi
	rQjDVb96YLJ8WBlsDa+LV4G8M6aF9KvtZUwgHrmY4FTU5483dIkZr0SrvBzBHn5L
	vTssQ7isLZts7TRaPiFOrjcFmtACUVZHsRnqo290/cT8vCVcYP7tNwRVC0BsuTUK
	t6xB3PbljoFMOu/2AG5KQI11gqrlWew75h3geHyXEqEe21bBwDjbxqGVJFlParO2
	Z8aMspc7POLXT+avMn2kG7toIlGZfXJ+GyUkgojAYczsy6qoGYfE2/JTmmkZPMSD
	X8B7JvRpw1OIq4rWwDnl3ziov0BIQX+YiVl78w9Kacsds+0ibpWDsxLJNGqPg1O1
	P6svQw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqut0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:13:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so5037900a12.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551631; x=1792156431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKBZJnXgmeKva9tYHEU3hlo2mDLwoeHX/ZQBXzGxQxw=;
        b=dHBZvfOvGvei1YtUiWUD6uB19ydvCWFeEeYHI+QIOzWNYBGDSRMVMs+Sbu5ztStcyT
         RPxwYriNoKcxalrrhVGCpI3fmu5t+sTnQcj8smM0GTaj9q/9aaP3fM553xMjM7UJNWDZ
         06Ih8e/lwQCMbbgNRl8C9jay982XVAZzimcRZ2qB9skQxp4c7rCin4TbINy48rn2+0jl
         7ox0gAQAE73lli+ymB8TUTVtzwjTACKlrBfBtkW2hh9ksbmDXgT8ZLrfz+N/XieavaCy
         Telg4woByrMZVfVm1cpO3i3XSNC3+fLiGpAxV+axhvoZUdwIsGiDyMJn4xSreZaOfG7c
         DaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551631; x=1792156431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKBZJnXgmeKva9tYHEU3hlo2mDLwoeHX/ZQBXzGxQxw=;
        b=hxtwEUVwTLWEdF2FWalEv9bIGZPmCJMFVeSU9D00kZWw9saG5PaTiTgXjNZgfN6eCB
         RoqIqFvG+jZXJ904z1pSEvcgohqPozL2tL6oVEwTfY+o0BU2B72682ShsiiodMWz3dnC
         s8Q+SCd1M6nt/md1LPO24Yvj67s7w82wrtEoDyTDmHCWwjYQLN6pcAsjQ6XpyoyawyUv
         6LXURmmKGvUYy1R5CdfQQyHyGQLT2D77Jot46fbioxaqMVkYsxVCoWZIa8XpBSccKorO
         zP1vLsq/IyQcdzCi1TrABlJXlJAzGX61A2RR1VL0l70B1KCUgwtEWzaanOzYc6TiH2S5
         VniQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3MnO5kASJqmrHcCYqzZgKkjNZhXa3a6mDkYA8QifHwubri0eCdNz+iPd+QyTT6bW3ypi4aTjF1/5O@vger.kernel.org
X-Gm-Message-State: AFuF++lwzdXZGJ5ZtD21TyrIzT2mNJWIYw0zj7OoQ9WIXdC9d4anIDg+
	CYO4tKVxrpOWF6Ly7TRPhf6ULro8fqXp7VswvSv6o4Nj6f6eHBRsmUxNAHv/Qft9/DdP8dJRrZS
	5bqiC31MZaPfp1vt4ckbuVSnLZGkgPlOw/ElZBqt9aZQ7cRzbCSpqcEAUgiWB+s6N
X-Gm-Gg: AYBFou1gsruxnyRd22b6UeCua4/8AH/M28k1kfp3WBi2Kr2nzOGRaQrOm8VSfWM6iVJ
	n6dkEEQS03CrKGBNrh5SwQEC42uEROpHVG0cdt/gBB5ae3i7yyBpxHL8NOppdXs88fgjIWgo8mx
	vCyrFAGhHtoONHtR2Um58l2GmI6Nu55Jxa+KXHvri74SsPxfS40GMARqEU2HGzSaI+tb4Qh0Q+5
	moVDDbY0DqrmdeyqZl+4TavAN5eE76G5SrZLj1yCyswCXrPMFLgogbiW6xipBbEgw5NeyB1w6fP
	Sez39334Fj0RYYxlA8av778yUBFmJOkFVgRG8mkqY1ma8WgaXUc5LbbR5Y/2zA6K0y3tcuA39Zb
	syPYnpt6PC53DmQb4oZwvwwc2MnTuKOrMO7Xv
X-Received: by 2002:a05:6a00:1c89:b0:891:6721:370a with SMTP id d2e1a72fcca58-897c634d4c3mr1381613b3a.29.1791551630995;
        Fri, 09 Oct 2026 06:13:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c89:b0:891:6721:370a with SMTP id d2e1a72fcca58-897c634d4c3mr1381596b3a.29.1791551630549;
        Fri, 09 Oct 2026 06:13:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:52 +0530
Subject: [PATCH v3 6/7] ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-6-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=1004;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=NarMphwKJZWkeVrjUE2NXGS04Cgen9YQEU6D88mCGUc=;
 b=Kae51AgYtFhP6GXyOV87zMR0Df5elNwkzvmdCO3SW3HnOsa1dYCHWLcl4xj2mF3nLnUB+GKxq
 2428n5ZfYbVDxFyMXHxlqKFiQD5PLUqHHPmZuYvAXJf2VB80+lfxl/R
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXwNu1X9Mtszxo
 WSACpw8QbDT+OYC0tCa99Cuu6cQCgswD6Bo4gl6ovF6Ig8OLwoBOXuIdOJySv7LnE/csdedj0ED
 ZdGPw5Wmu9qV3nHXyttpOimRmWKmlms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX/f1OIEJB0onr
 zRby6al3Vt7ndiKAW1Rru4Rx69ewpd5gOgJtFb/e4foTAUGlSXGgCuSKN7BCmCHOsh2UlQED+Q4
 yBzBwdyT7phP6KPKFk6fZKXG2XUfUlAaEkm9sZVCxsHSOjjXoO0w5G76DmG6eVrMrwU8YWaP4ck
 3cw9YtCR89+hLVLM74gTw7VGJtPshPiNyyvbcE9wNd+j0ck9gGYLnsc89+cRuK1cUmvc7V9DJEf
 PoQMm/mznEh//C6XFYQxvpi2W9T0mVlfNmh1jj5ZEuQN5sYcpk2nA18q/FI+/vUEPVDPiKqncy/
 fzUQ8H4oZsMX0JpD4qBqMWVxwu11urX1IjbyFp7KqjMily1sxLJw4EWAZf11HvGeuvxSher+FrR
 Wsx1Q0jXEjx9A9jJeiF43I9imAKHO8+jPUHNGHhsA278vlWh4kKFXUjp4nopDEjg6ePG+YXtrlM
 9Y+FsK1D1rWYbDJh5OA==
X-Proofpoint-GUID: lQ3dK8erWW51JWtVaonZW8MulMyRZTXi
X-Proofpoint-ORIG-GUID: lQ3dK8erWW51JWtVaonZW8MulMyRZTXi
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8e890 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

Document the bindings for the Qualcomm Nord sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index fc7bccdac..372919ff9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1

