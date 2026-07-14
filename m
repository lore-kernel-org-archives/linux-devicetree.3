Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4444336308D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023543; cv=none; b=KpKB0WTrPu4alMFo8NSapcxDfUFlE4rpQh5TXzvr1d4uQJc8na9m6TUoQzXEf/JvQJDCmI4blrBhCetxxCG7wytZlfoR9iqzF8IQoWwqbQI0e30ruaH61cLVOd5BzYW7Bz8x/7j+cGABCTcggUEf6r1S6EGNk5qlheTGi45miXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023543; c=relaxed/simple;
	bh=NQruLk/ObqYkO2tZ+lmnjFjQK3S/7P0PrPBa4cKxzzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y74/wsVL8/akegAGYmpOg6QjYCgBkhXPzMI7IieOUinLDeqVO2aBuGiCDko8xGcvP2PqJ3rFN82x9F3iv9HOjoGcG3/XkZWn91/pd3CDntqlKzQOx8DFh5cOA/Nytk3AAW11p2PxrIo16rUlUle8gMS8yBqBB0774ys/OWo9i9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPjOKo+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxxjfK0G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPjOKo+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxxjfK0G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SWSr3718349
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XbCHcSVsCTXwaDdxV9iQ5J
	AMAibIMpvYz9V47nfKm1c=; b=PPjOKo+ZaimbN20wG8euX1Zjbl194RLn9x7TfI
	rSAGbYg6cyPxEh4ZxUEyeCFngg//NN80Rhnu/KpIuYldyNhmTr8VRoR/Om5TKFjs
	tvaPHLM1mUB5MPW9PYMfWLZzbTbBC25+79BH5oeiSmKPMQZ1Oc46CmtHdrCrmyEA
	F6JIspWQ11L/YM2Y1FxIAPaxjiyDKRZf7YufUDSEKMRMUsUQXU3Qztn5KdTBfPEl
	kDgT3R3MLnVbOA1kmmK3Ev6xYYTUS5cVXCqxZ8ZzAVKnycexRcZ1znWnTEdIuqPr
	6H9O/y9gQ9NpcoDALZAxXzRhyHfEzmWdGcQh8EmFuFcDT48g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvjdjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:05:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccafc5e82cso10132885ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023541; x=1784628341; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XbCHcSVsCTXwaDdxV9iQ5JAMAibIMpvYz9V47nfKm1c=;
        b=IxxjfK0G36H0WIBK6IwLclM+MX9SCzDxrXyDHJrFtPPBYIUh/LIB5VzwmClvHxPhaS
         duOOTvtPv7sgjiOsRicNR+0bPWN2tt2r74zs6iA4yD827RyT4H6Mm3QsPDH/pxYKGslS
         CFGHDiOct0vclKBQvmVxE005ezCeONQ/Eb55VNuT44jmCU24GdKMBOgrCBy9VZdfvx/7
         xSgzvopm07mcozPhUnXe+Vn6Nx2e6+UVEFs0INNDAqfOreRVcWc8Ox+wsjdK+KBcFym/
         Z2JGolRmB6Xo/iz0eTxBj0V7tRTxJhYHqfjX60OwdU8/aV4tq9ZD/r0Jd2HfkdHD4WTW
         QiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023541; x=1784628341;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XbCHcSVsCTXwaDdxV9iQ5JAMAibIMpvYz9V47nfKm1c=;
        b=T1KI/2XaTSEqfl134fq//RCaUsa2deWN8oStfipsYAndV7n8/rZ028xxza5RXvF9We
         jGBDX74CY9ypfzDCt/53Six1OZW6BvHhWKIKgpoOV2+E5LJ7TQq5aRf0XhMV+XKkDcaY
         3ciyIyFjCPnK5FaBvbGmPeHTfePkyoawMBW3b7NrYG7qIIp06pesXv+FTtqm+Tqm+B0L
         kjV35FfGstzW6sY7ga1Gk1rxfKcwAv7sqUZkVwNTB0NA7DDVQrv+BEiuQoH+tMs7XLWY
         456YfmRByvBTqTdAwrQYM7RLgKvRN02kAKSS5bbTp83dGLmQQIzAH8FCom7jlC1ILK65
         a5kA==
X-Forwarded-Encrypted: i=1; AHgh+RrURsmcIpxfUtAoQjdJyuP+IWsrVdqLOtjog3Bhl63b+CmNSNf6WEBHsqsRHqhVJFqOZriZmtc5qZY7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9M5v1D/F+jvzKetsestIGbTmPsrSWQOw04N3OVAEHq7hbU9PF
	n2aOQAlKGxArgtPIs0c+1XdGkw0o7IwcqAqJRxWJorZOPPN+wfzRmw2eCPYmm6prVNjZRt6hW+I
	Ux0D/sb2FRwFqINQmQNJblrGwfVc3n6ilzIDkL+tUi/tedGjuUU6Mf9O2BzWxub/N
X-Gm-Gg: AfdE7cncXi4PLFgaEyp2nPDaGp81jxOM3rng79YZdS7dI18gaeMSwdAjSTMrOhVYFmN
	85+vFZ6+wauVLgpDbJxWTC/x8KZjXPTPYhaUEiNZBErpjOutmaglhh4X4qTLTbVuyaRfNtpIeGs
	HrpEWW3QvvyA1KBinrirhUKMnZVnBV5Uf43m2jakw2i370Is/IcDZ6L/OGrv3jVkAlOHp5WNgBD
	p79W/IsSLtc+zyFw7xDiWd7YN433MMHPqnyRgNQ87JrK01XLZT2nFHT6/xlmjLzv2cRyakM/xwu
	+GoH+f1WHl0ndZrnWtXuyw2D006TpkmhLHEtKkAu9feezFcch+x5sL+Iz5FUc1brev8Non/nPvP
	D4LNHzavMOrwqGEP4VMyabTr4EDB1zqQxfMHc8s741F2u
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr122463765ad.3.1784023540802;
        Tue, 14 Jul 2026 03:05:40 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr122463565ad.3.1784023540366;
        Tue, 14 Jul 2026 03:05:40 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:05:39 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Shikra: Add DT support for ICE, RNG and QCE
Date: Tue, 14 Jul 2026 15:35:11 +0530
Message-Id: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANcJVmoC/32QwW7DIBBEfyXiXCJYMDg95T+qKoIFatokjgFbj
 aL8e7F9aA9JLyvNavbNam4k+xR9Jq+bG0l+ijn25yrky4ZgZ84fnkZXNQEGimnGqZU0d/ErmQO
 m66X0h8WWPQ3glGtsYNI2pJ5fkg/xe0G/va86j/bTY5l5s6OLufTpumRPfPatMQ3wJxkTp4wy3
 kjEHSJzft/nvB1Gc8T+dNrWQeaoCX5hmsHznyeoPKW4FgECtFbshxIf8MRfnvqHJyoPhJUIrJE
 A+sF/97WL5Iextl3Wgog19Xw2xVLb3wkFYiedcdoFpRC0xFZpA5rXNXKGBqxtK+z+A90eyi/CA
 QAA
X-Change-ID: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfXxOrsgPf/Li9a
 GyGCX44jFzj8e8pVbH+jOWnUPZft69q5D/RtgTuqkvwYkAwkCm0wA+W9JLSA9WoNb9WBHFbZzRU
 nCRfTZckHx+pxlVBWgTz7A2I6x/G8/aqoUMlYOsSffYjrjAU4ErtxZpsYd2+aumB1pKWTWS2a3j
 0fDQvJXd6YLmiiuYiJTCSMzO5UuphSVZ4Ln1OT4pd7V0U7/oDfoKO8F/wKXol35Dtpnn8OeeR/b
 ymU+7YBhKueucv5wlRphSp3dw81lFXOO0D8scvsU5YSt59OPVcXe0lPMLsBoAzUtrd+EQ2D4DVC
 bjN9vJ3VkX+4Px+xgH0XvG6qeBaDzHOW1qwaQq/L0ZwmH7GhGFVSdJ3rlsmidJ75ZoV/idcIuoe
 8EGKKOt9QxfdntW74p3hGI+3wahm/l89OBjS4Tde1MSjmOPeYctWLiazRvS4zpiqEH2j/rTycBo
 Nl/xAsdxl7yfEbRDkVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfXz6qNlkISVNUO
 3mNUhhWWbL1RN2avfnMdCPJQ7wuertMeH7ifuFpR6yjkkuRtqv83hoK2UvqUp7LmWZDZFALbhtz
 F7Xnh2uydtZXuf9I8maaaDdo17wuXnU=
X-Proofpoint-GUID: Vfo1Rk8AaNsXAuAOzhNKE2nS8VXaaIu5
X-Proofpoint-ORIG-GUID: Vfo1Rk8AaNsXAuAOzhNKE2nS8VXaaIu5
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a5609f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=psUvNacZHcIMRI98aYkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140105

This patch series enables SDHC ICE, RNG and QCE support on Shikra,
aligned with how similar support is modeled on other Qualcomm platforms.

These DT and dt-bindings updates were previously posted as three
separate series. Based on review feedback, they are grouped here as one
crypto-focused series.
Previous threads:
QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/
RNG: https://lore.kernel.org/lkml/20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com/
ICE: https://lore.kernel.org/lkml/20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com/

Prequisite patchsets are already merged so no longer tracking.

Validation:
- ICE: driver probe at boot
- QCE: kcapi tests and driver probe
- RNG: validated using rngutils
- DT: validated shikra-cqs-evk.dtb with dt_binding_check and CHECK_DTBS=y

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v4:
- Update Patch 1/6 commit message to accustom hawi special case.
- Collects tags(Krzysztof)
- Link to v3: https://patch.msgid.link/20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com

Changes in v3:
- Fix commit messages.
- Collect Ack and Reviewed-by tags.
- Link to v2: https://patch.msgid.link/20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com

Changes in v2:
- Add fix in ice bindings to specify 2 clocks defauly for non-legacy Soc
  compatibles.
- Update commit messages.
- Link to v1: https://patch.msgid.link/20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com/

To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dmaengine@vger.kernel.org

---
Kuldeep Singh (6):
      dt-bindings: crypto: qcom,inline-crypto-engine: Fix legacy/new SoC strictness split
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      dt-bindings: crypto: qcom,prng: Document Shikra TRNG
      dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine
      dt-bindings: dma: qcom,bam-dma: Increase iommus maxItems to 7
      arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 27 +++++++----
 .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 52 ++++++++++++++++++++++
 5 files changed, 73 insertions(+), 10 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

