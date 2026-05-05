Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4243AC0CB
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966820; cv=none; b=V0le8E3wD1/kg90Jq7r1mr8atmvDlVDoUutM87KalC7cOgjBDzHqfnQrr8M3lA6ayzF0RD7kA/7gzKH02BkCMMejRkUrbmK5MllvzPFHd3KalpJBxeNKJ1+vb0DwAMJ4yOXo7BOK0bJwnrkkuIv3G9wuZ07dpmQCnN5terTYdog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966820; c=relaxed/simple;
	bh=9E3OacHmTVB8D7ux+zDqkIeotO8TVKvO/ccUe2RipBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HmgprTxNPvErrRNMFDU/LisKdk86p7DKonAk8r+Cfj0LYRXtmqxXFjponJm0zjVg/Hh5ogbHDKI/eZMzZoa4VMSrHk4olHzBqrKtgasojRwaeTjxnAft76vsB2i/X7JX09UsUKuNzogxzYFx4kuP2+40mPupSqqtmty+Hr0uYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnO8C7/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4Q5c1QY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnO8C7/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4Q5c1QY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455I5MM1150966
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/gzyaxfWTLtOuS6e3Kze5F
	roF+EEMqB53OgKWTH9cqU=; b=CnO8C7/lTNCWdt4VeUZBwdIR1Oew602qf3Iefy
	UC7eySqUD1Uyot7J+0XOjg9WZP2BI/x99KC9hXXr0ZytiXHdA2QGnVVaihxm0GS4
	msgSf87ZLLEO2REkhP7TpQ6jrG4nh6xJXe9ux9nio7kGPIXx1DX5pO8Z9HTykfUB
	dI/8RHhsPgqjYTYccZCI5SWpIoaE/yv8Wyjb5Mf5auB80U0VL8yzIMPFA50oT7Qg
	+INQ5c/UuuBaquQIRcu+GC4hDcycZRygt2pj2X4bLUreWl06cBR4T3pggz5evugw
	NgwVi654hv+g0cnz6O9dVPdxCHi2jXdp+t4M4syYewZ8NcHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscybyjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:40:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso32046575ad.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777966817; x=1778571617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gzyaxfWTLtOuS6e3Kze5FroF+EEMqB53OgKWTH9cqU=;
        b=j4Q5c1QY4Wek9fLMDe6LhIJQvvfHAXxygCcYKgTRRiOQKE1imJv4o187wck92Etu2c
         KoUgAFtEyG3er2Ipt/ckw13b8nSABkkkZJjlCGLU7WQPfkEQhT/xCW1gstTLsVfCx4op
         gD0PzoWTbIG21cTnEDnkepWTzG+Pvtb7zMIBQrPjHFB7uFmv0EObP0NO9AzrTVvSQpde
         rRFynhcoTf8SP1pupIZjvE1gAsLtDsO4dcPgUxh9QLXGoK0UJlhEXTt9yqSQdnQqr69n
         batIdrSQeVg7rY0fOhZGUpfoW6Gsx0WcHVuae5g1jM902lLSlf4rIMSIyrsYLVLHkNUP
         dKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966817; x=1778571617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gzyaxfWTLtOuS6e3Kze5FroF+EEMqB53OgKWTH9cqU=;
        b=CRZ8J2pXwW9dclbl1qqCA+FuP9ZOG3bT4LwTtlaU1XApohNixzwil8Vl4zQsAZ/se5
         qh5Kgn3NkTPGct8rOuV3kUu8NI+fiLWhl1f0llXue1XuFL85RUkd8NSUiGpu/JuxvSu2
         VLWroIARX83JiFW46/YDWaaSwOjh3w3JIwshORXx+Icbl0T3c+fXAgNAUqSsjtxQjZw+
         iVs9CSyXnJ4QZGLoKjYrYUM0q59io8EBlLdMYULAt03T+Nodp1IY6VysrMcJxokBqu0o
         AN/m7SXhbGOY7+fXGQgn0rLQPc1TU4NA/d47IcZR0py3826/dvE6Ij/O0C5EtDhdx2K9
         1OUA==
X-Forwarded-Encrypted: i=1; AFNElJ9j0tQgP3G5xJNyxWVXgVnqQiHdnYxxeGdg5jDW+jMs5geqeGiGASOdDUA0z+VkKQJxHm9b7nxQMUbG@vger.kernel.org
X-Gm-Message-State: AOJu0YwR3Qbb90/9to4kjrQ+7F1Gru5JTHb+fQcf/7KfeagEj10pCVFC
	xu5tVNSSMEn0m21gxsig2KO0k4p7blcTQe4OJT5lfkjGUMjcZ/O7M5iv6nhBg3YTo8MDmQzjZwl
	XVrx+vQroeDE2UtyhXWWzIhPvwj2T3rxHcY6osA5lqnkNy7OQj/UyjJzer72n+YRu
X-Gm-Gg: AeBDietkm/+jTrjVOptzg1N3CGIfbGkV3Ayg+Er6U900+7/w+oQmDdTtWo3Aoe/DTNe
	mIRdnwqj+2WcPYWaCKH9bnxWLfoWFnoXGBcd9FCpg/rEeXGnPmUdGX3TxLP2EKgsCj1QHAeAcrU
	s1Eu2fEJudApp3qH7DTHCDtjfpyjiIZfbcFlWJd4DhjuNp2TJjkCsHZdrt+1oarhy/gmKdwyU0x
	YymMuuaNGYVrYklE9LqQVDEEeujKRlfRiZLugU4tsC1p3PAbLjmG87bGjmmvX5GUFhaJr3u+3Gj
	AVz3aS7bwxTRbu5HzYL2T2L3+NfD0+YRLg96EMNHnIl8uEcX3DsmSSsvsbYo17P38JVSFCVijDn
	89v7Die4QosBdNbzmguyTEVDcWeG9yDPJQmVg6yVYPJBK2paf2hstsfSB7Q==
X-Received: by 2002:a17:902:c942:b0:2b9:a5be:d2f6 with SMTP id d9443c01a7336-2ba531a057fmr18912635ad.0.1777966817328;
        Tue, 05 May 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a17:902:c942:b0:2b9:a5be:d2f6 with SMTP id d9443c01a7336-2ba531a057fmr18912335ad.0.1777966816872;
        Tue, 05 May 2026 00:40:16 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm132663405ad.20.2026.05.05.00.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:40:16 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add Crypto Engine support for the Glymur SoC
Date: Tue, 05 May 2026 13:10:02 +0530
Message-Id: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKe+WkC/42NQQqDMBREryJ/3Ujysdp25T2KiKZfDZjEJhoqk
 rs39QTdDLyBeXOAJ6fIwyM7wFFQXlmTAC8ZyKkzIzH1SgzIseSFKNk473pzrXT7stqWTNfPpMm
 srCccBo7YF3iHNF8cDepzqp9N4kn51br9fAri1/4hDYJxVl2pKm9SFKKStfU+f2/dLK3WeQpoY
 oxfO7z0hscAAAA=
X-Change-ID: 20260416-glymur_crypto_enablement-be2ff022b429
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777966811; l=1011;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=9E3OacHmTVB8D7ux+zDqkIeotO8TVKvO/ccUe2RipBo=;
 b=mk9NIiydb414qnGS6cWhu6nl5OJH6Z6WXQubHyeO51mgF+NJSZFXkEMpRME2zUUe+Pjs4Tpyd
 NXwiTNh4E6BAyWsPuJPamfDFfq/8KNj8usVU8fa7UhEE/z6sw2zNSfQ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2OSBTYWx0ZWRfX1AioiXmWScgB
 +4klpNGwMyksATEqURvq+dZGj5F7NYnoAmFPv4G4k76seyv54psIE4qjPixOwefsYeaeEwZFbj7
 vJVyHGXM+/8+UafsHZKZEzc8dhXOmDqKeCenvBi6ifP0GBA3belGsuiGUTu5qKELf0z6vDj2sfh
 ttRggkyPx4V2O+hBi9xJ5mXcpS87DfJU3RPurZPj4Km4PMPdAAkHu4TRhflRUZe0J+9R8cpmfnC
 QPdvCqBiJ8inIoqG0bnX8Wp/wJmZmnLkvEmtDFChzTtvMH2T8qXBV2+/XRE7orUWGFTgWLE7QKo
 LJyTMmd3GHGAKcL+o/7lTLbjwwwwf6c7aISKLzC2R/XQH00d/j7wuhfpi4dfyGKD/kQBcvWN4V7
 FeS6pfAJ5jUZvvO8rrZYx1hAXEbRtuB43fkdsWgk/3llFJ+cyeU/hIBQ9Oh2KfiEI+ypIZnf35U
 4mVdL0v9tTY60qgk/Eg==
X-Proofpoint-ORIG-GUID: mLcZr5jibTvh64PArS_vFQkg3Kgo7ISB
X-Proofpoint-GUID: mLcZr5jibTvh64PArS_vFQkg3Kgo7ISB
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f99ee2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RuLhemBIKpjh240wRt4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050069

Document and add the device-tree nodes to enable the Crypto Engine
and its BAM for Glymur.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Fix the incorrect SID pairs from <0x480 0x0> and <0x481 0x0> to
  <0x80 0x0> and <0x81 0x0>.
- Improve the commit message of patch 2 to describe the purpose of
  the Crypto engine and its BAM module.
- Link to v1: https://lore.kernel.org/r/20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com

---
Harshal Dev (2):
      dt-bindings: crypto: qcom-qce: Document the Glymur crypto engine
      arm64: dts: qcom: glymur: Add crypto engine and BAM

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-glymur_crypto_enablement-be2ff022b429

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

