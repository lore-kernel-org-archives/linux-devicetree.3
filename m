Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367069;
	b=pXcbNJ9Vr0QyJFQCnpcxvr7OFzpAuBztTPlviPiWwYfzZPwOJqRPmoRhduSvjGCgRZYZ
	 wkIXcF5PqLEppRYOUy163xnMvUsJoR4OJRWryspe9KddtpQL8VBjl8BHIMofDnFJngePo
	 EEkT6TwiMLf8ixZEl68u4GmW4TZYI5ZqW/pXxM9oWCu+I9ZjHecn7mp9YwascJQ6iVyzs
	 4ZMXDa+vBzNYWvpXPz5CI3/6SEshlwI5Nm0lHzfAdUIJJ+eqi2EvYKRqgEgmGNUYoT3qw
	 ayKm9jZ5GZoVcNzMc08p74/cm847WTLtMigdNfba8iJgnsuuuYYoTv2IqTgPb7J9fxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UR4JTI9VQzJqFZB8kjqpLUWsRrNaJNk6gTj/t7aYhsA=;
	b=fmJ7NcNxqfhdtyKtK3Rv/Ja1AlF9zmv1+HhZYmd387ON5XRyDzQneIIqSYJjdTeTG5+o
	 IyRM0B721PCez/ZeourpMxD+ui4qCtRhmGVDMgjecH18Del/GM1vpCXTyQrs8YGzgPPHX
	 mJg5AKx0NCWfCNUhxDqxGzCWkeIbTDIf1EMjYFYa/GwfOMMvE1UqF0n4VUk8Zzi9juulv
	 1mxKWU5aLMYJxuJtJVCBnInOlNsCvSc5rV3rbDeu4Tpr/tCLdr5I9BKP5YcnPCbdAx3SS
	 c2RnquOpOuDKLyKbh3/pQri4rWATaV7JegKkHpHjOrRenEI4ekSfPMh0IoN7ieBcCbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0lSEniW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYztFpMd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34D606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A34D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0lSEniW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYztFpMd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG1hX2071574
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UR4JTI9VQzJqFZB8kjqpLU
	WsRrNaJNk6gTj/t7aYhsA=; b=g0lSEniW6gquVXXpfOAY99DJUHOYnH1CQYc7zh
	7ilDpSevP4ENGSyIVmlBECy21yYDFq7A9G7Qcl49gOVULsUTr+YHadkD9VoRYO+M
	3vfc2d5QUPcH7S98ssSfvj9YmVChDGDA9Mzsp+1bifsNK2YtrpfvjnwzI1EIZZfB
	pePZ4gquLrsuJ2iHnUDS/gf4ExMnB+l+K17XeVQuFq3HmiYRmwq0RPGlwt4WuvIA
	HDDtPDyhLGxk0t+uJ69g9+o95/DHx76/Y2lPFbS47bysv5cedWtIPjDQgEEbZkcn
	AJzyYwYYbBqdI5dGDOe7W5qWI5aS/LtocNHY5yLjOmquEqLw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3939-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:31:08 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso1183062b6e.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367067; x=1793971867; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UR4JTI9VQzJqFZB8kjqpLUWsRrNaJNk6gTj/t7aYhsA=;
        b=FYztFpMd8hZQdKRI6gGG0AABxaLMRCG+id5+xaVZfEYowaH0zve04S9HNDuBZHbES8
         NkzmuG7vUlHzXydORf43kxd6JqmI9YV6oqrjpkG12NhmMsdiv7Z6wqStKJbYyOBIT/j7
         IgeQIWRjeNyyR5zlsmNbqr2u7pTmVAWh4pNfigB7ZeTtnQbB+lRLIPSiu3xj2CA62XWp
         bWly4hu8DHN2PplltEWTmMBjGFGF6yVz5b2ipIWJazKhh6eK0T035QGjailjea43dvfl
         Tu99RnOVjx1xowk33o86buLuM6Buuc051wrjrnLAC2swZXqGSARAHf8glJIBFAEH7d14
         Bh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367067; x=1793971867;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UR4JTI9VQzJqFZB8kjqpLUWsRrNaJNk6gTj/t7aYhsA=;
        b=WrSHixqOhTESjF8uoiJcdRCOhw1E1RZiOBB3XZrrnNUoHLQN5fcXfmlHT7yB685/KM
         1w8KvI208FZku/Xz5MxufVg+e0/w0N6pTeM6WdKctdvGLoBljrH0OCRHk1uyr1yg8Ff/
         aOPGPCuE9hXs8A6i8UXtrzid38IPsWECbbin87mjOi4tK5mhoKIn60DT9yRSH8DRIANN
         ykp9uq5+XiSRNQMb4jx/2pfkqnpS00QIkOkjLFj2xc0LW0wZ0Bg2YgU14aXfIrbYJqV0
         Ms0InbAL4mIX3vHtkhLXeVbpmBeqYxQd7vFgy2Zqf2g3UZ4tEaUBaiLI7QKedyyJVTBo
         u9JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfYEvotM+JMJY5Ik2xLzQMGsOpxfDmyJAPjl14P9OowvrbZTl9TGajXnzotGQ3A6qmTD8hVCF2PhwG@vger.kernel.org
X-Gm-Message-State: AFq9FYKDRmV62kStYVYJH49sute1yfPbe7QQKzybZhTNAXvYS071uUOP
	818ly9sr4xUaJ5gmnorpUSIrFC31Hwlp2X14HKJkiwG5GgAnhABSViS7uW/cxQc7wnRtvl55zQ5
	d2YprW6cU7qev4pM3sUb+9LKRjo3NelovHiHO0WS/yiTetpmWPOFUW+d6+WuzQzd0iKkdulpM
X-Gm-Gg: AYBFou15jD5hQ6DF/O2IgY2BHB0yF8pV2aUUZ9vPekgSriD5MKgEPKpektDVFOLRgcP
	Sk04a9QbUndx5c1xcX6cG5Yt/LyJ7W+ebxXK0md7lpKCSt1l08FtbDge+Nc4rTlLnAjTLr9wI1e
	6swr3bwFd3WBjhab39kXazghtDBkPsWs62JTmzMM8N/UsuQn6JLunaAkxHdd+qScGyzOTUftPHE
	IVxsS+w7zxfTMoa3exgrjf1GO9f3YnyJPKQ3x9y97NcXWZ/IjbBhpqJHqsPuKn7+2kd7FxMWMfP
	dChJpABMwquc4u6QOK6Hd4ov6MpPGFBlIYPJY4wVUcZP/Logi0bRwEDwc/LOw0+e1Kb5SSE3CJ+
	9uECduFB2XsbdcMs/q4hmJOkpglme4X1Hz/e4fPIToRWTjTc5361BkY173t9TZZIlShQ15LAfIO
	ENPI0VRLaD
X-Received: by 2002:a05:6808:2512:b0:4ea:18f:64b0 with SMTP id 5614622812f47-5640decc459mr1809525b6e.67.1793367067544;
        Fri, 30 Oct 2026 06:31:07 -0700 (PDT)
X-Received: by 2002:a05:6808:2512:b0:4ea:18f:64b0 with SMTP id 5614622812f47-5640decc459mr1809490b6e.67.1793367067074;
        Fri, 30 Oct 2026 06:31:07 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm1590884b6e.2.2026.10.30.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:31:05 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 19:00:42 +0530
Subject: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAGc5GoC/3WNQQqDMBREryJ/3YixxWhX3qOIxCTqLzXRfJUW8
 e6Ndt3NwIOZNxuQ8WgI7tEG3qxI6GwAfolA9dJ2hqEODGmSZknBMzbRiLWe6watRtuxXHLVCJk
 LkRoIq9GbFt+n8VH9mJbmadR8aI5GjzQ7/zkvV370/ttXzji7qTbLteDFVerSEcXTIl/KDUMcA
 qp937/TUFWbxwAAAA==
X-Change-ID: 20260916-qspi_dt_binding-8a1cb7a8772e
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367061; l=1839;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=6+euTVf3GCpORG+HjlXn9bEmx+HYlFRWqNiglrEVYlw=;
 b=mva44UfZGpfgrUarHZzaC7Pu9cJNQKZyiCLNo3tQeYQENvV6cTkzLY9rBi0xaV1uq10Gvtwi6
 9w++rqbasXbD/ZJpziP/1CkivrzIGzMDZy5LMokToF7uFxtSLiuu4b1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX+bOvthGf0bPr
 9I6mRDLI4EagwPiIn/O/Q/mdV0kgwRGg4XAE42xkXwpr4dlTjP1/jKWLmCs5Y9QCvVyTscb6F+N
 hZCBAlKhkh2CqyoovgE8kiSwz698Tj6ni2ViJuGpxYuQRE7T+ZPU93spwthn5JkvJaMiDeaZ1wi
 7hH24mdaxSK74qB3vxKMbutI98m8psALVRn8RpKHq4XGhWgU3mwf7gjY8/aWelLh8Y0Lw6a2a8M
 z3k17VIJHBO/cxoaPqzi/ckIBW7mbLDpHdH47NOQgvQBLdz4FH2xo5xtwTsmp3vKk3O+m4HjxqP
 amZ86eNY4CeD9UBB98sNI8agbLnp0XMaTBXcJk8or1my2DN7KfLPBWjPIdy1/y2qVKToPhijDew
 eKlChaZXwje/BieomFoDjMEaUO+aWTtkUIvKQOgRqgluW77UDUVSAlYpote98V2Q+3gFvo2lOUc
 jOa5y1FTjLlWvD0s9HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX1tXj5DITfZGC
 zuQtJ4j7A81mMWiHmAB3xIX6ZHAjxWoq/k7KuwmotFfW33slMv07zmThb135wByHqRpqqWZUqTD
 yDb7/+N65n2ltEo8/zqgsUT9TNvzmrc=
X-Proofpoint-ORIG-GUID: jAKKUE9Hrk4kDAxeTNJ0t4vExmmfLbJ6
X-Proofpoint-GUID: jAKKUE9Hrk4kDAxeTNJ0t4vExmmfLbJ6
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae49c1c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KUikZgbwDMKjgD0mul4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300053

Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
instances configured for QSPI operation.

The compatible also allows the driver to select the appropriate protocol
firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
distinguishing between SPI and QSPI firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..e568b67d077e 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260916-qspi_dt_binding-8a1cb7a8772e

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

