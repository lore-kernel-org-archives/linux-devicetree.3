Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C803F44DE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337528; cv=none; b=YBHrls6ZNMkIHtj2tt1gaNYcKbTyfJ65u3dmrVjJwVS7KXEQGKUR07FT9yc1Zkk8RfKpMDhqGHK1vMycMuYprpr81BDRO61mmG8bJtpNzlxljY8EdYst9ejBajB6aP2U7Zbk93D2O4sgeBY55YRkLOOfWhkwXDaLsnOVY2QWbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337528; c=relaxed/simple;
	bh=wsN4Qj8nyQ40xLi0czEZnpsh/82ufhgYUDoGmikiwFU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j+1h/lf42+lcQJ6xqKhWiApN2vgQmHdrfXALf/ebHe3qkHMUKn8VIQh/ytkN4xUdd6X+I9sVrde/DBRa181f+ltqtDiwCbW+7px3MmnwywYKbePTLVsfYsYUfXM+rLugCcxxUZ0d6n/iSu0r5mYF7OvfjpN39HJouT0YOD+jyjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tbek1Em0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP+9AxC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tbek1Em0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP+9AxC7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666B035l389752
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E7Q/PsRxa+vqndhp+ONNBD
	gCCG74mkgHXpn3JzjDtP4=; b=Tbek1Em0iDoveqt4PIN//nwZwCzG9x9tf45bR8
	7S6fGZRNwr4irn7E51jjoFmI3ew4rAib5eIETnV0ddNwIutLjGuSM2z6C/4MRN3H
	p89q+j3Wp/eJmIDj4jQ7cAAmEnMXUP1EG/w7k5cH/OKrMEqBoy+fn+qDyBDebiUL
	xu/IvVi0N65DUpgXE8kur58+T4tvLbY38agvgC1kJeqL76C5uaP5UqSrX0xVFXel
	TLldE4XuugJIOZ8N1rOMZG8EpaFgGwM+/LwS7OccPgQ3ZsGmUXgzWNxMhRSE6cVa
	FrYzoU6eKgqxw1LzpaUd6xKOIeHZsi8anLpAJkGCybZ5S+jg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0bsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:32:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so3051950b3a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337525; x=1783942325; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7Q/PsRxa+vqndhp+ONNBDgCCG74mkgHXpn3JzjDtP4=;
        b=DP+9AxC78zBe3nn/B3hB38fnNNP3FwLrXh/6Yh13JTqjwwlmI1clAKWNyV00PbdU85
         9177LmyogORdEG3jhPTlYk2OV9QFV6sqUvMPbyyatEDYL1iqlqzpDzM4GSNv7ZModItb
         bBgREXG+7HXZejX9ZMsWfNnfoyvJWk/n9RQgHwk0oFa/M44SvSo/WzPb3/hmydEx9w1K
         ugbDBV5EcyHy4gyXev+QvXJGI5kFX+TxVh6/imiiLaP8qlua3qH2VeZjcSF8Ledh8Abe
         tCANGkcs7TqRbxtBpPcx3rvMfs7Xjq9Avz5d178I9vfBvHsD+HgbBmye+X0nG+CNUb9R
         a0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337525; x=1783942325;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7Q/PsRxa+vqndhp+ONNBDgCCG74mkgHXpn3JzjDtP4=;
        b=HuxP0r1LbeiDj88BJJOG3xQO9o4qPDtzUnlLsJBEWb+zil/N1B36xjkgh5ADpNpi54
         T5kGaXhMkH8J50FvGIp1/sWpzQ4qwEZK+0Qj+VJYvBWePSOUb5N919Mc1QcpsV50OLIj
         i6+b+IQZ1zfAU/Q+jllJaMtmRVuMZcWSI63HQyblA8cpnjJztj0Qef8xvTPDT9ykYlHt
         YPg42eUzVczxeTFkhkdjJFqW/TwjYzliLfluCHDK8N4cfPc/x7ozn/pe7itbcJaArSh7
         kvZ2rsE9Ot1JQr9iDjk5PZWwQNDRgjJgv4/1JT96wvsB9B4iNmRteG8Q6N8X4B8hU3fw
         hH6A==
X-Forwarded-Encrypted: i=1; AHgh+RpsaNh+8ER8Nek4luvucR4XwEUHbtY61qiTLFyOMWRTtoGzEN2yZhJv582ixmLuqnZL6+AAmUaTBk3n@vger.kernel.org
X-Gm-Message-State: AOJu0YyabTPJ8ix94XL0Z0etkfHKCyPDWNNRQip9jJ9B4XZmmjMS5FGQ
	37CCjlnRTKTDpJRTBhwihqnH5i5QVzYpOmj6UaVZ4j/9JUpP9UAhVEB60qBmXXQ9g0QnjpBFcG5
	Li2zIgJ3IRRNy2z2D46YGR/q2rYLoEVQyaS0Pr06FEmu4qB6qutfdoeAgtfcxIJqC
X-Gm-Gg: AfdE7cl4MAQrbznVjXy7Oyx51oNKEYzNjdsfERcIOKbDkUppEM7tEmwsN7VYOpmR0Sa
	qVxKhGxqZPEYFNZGav5Lx71sWjlvfDzx2aOHkYZriMto/QeuwiR6UFjBFlElcOYOv+JY16YlhFU
	6v0hUOA6K0FaDHFROM1156NxKOzCpBWUAtVY2NIeOQM5OeKF20prwGj3cvIhWCz+h7t6PYhbl4D
	mhIcQlN0n15wpsDndg3VII2sUtkpCZotFq9XU4EagYbSyFUJeVkYXMm1yejR5WjH3gm7V1FB4Wg
	1SxawSx0A+Ulb/07VNPl5O81Rn2BWDqK0q0KjXHLwahbIDbUbt++XyHftvwhClLJ43SeuXnNKpl
	vhHy+vL9Fd74wfviWRBGN38tZEYILoC3tQZABbCEZ+XhM
X-Received: by 2002:a05:6a00:929a:b0:845:eb88:3d86 with SMTP id d2e1a72fcca58-84826e54b7dmr83356b3a.48.1783337525090;
        Mon, 06 Jul 2026 04:32:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:929a:b0:845:eb88:3d86 with SMTP id d2e1a72fcca58-84826e54b7dmr83320b3a.48.1783337524574;
        Mon, 06 Jul 2026 04:32:04 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:03 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v3 0/6] Shikra: Add DT support for ICE, RNG and QCE
Date: Mon, 06 Jul 2026 17:01:28 +0530
Message-Id: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGSS2oC/3WQ72rDIBTFXyX4eRY1/ksZo+8xRtCrWd2WJlUTV
 krffSYZDLbui3Dk3N+5515R8jH4hPbVFUU/hxSGUxH1Q4XgaE6vHgdXNGKESaIIxZbjdAzv0bQ
 QL2Me2tWWPO6Yk07YjnArUBkfo+/C54p+ftl0muybh7zwFscxpDzEy5o908W3xQhG/8mYKSaYU
 MEBGgDi/GFIaXeezAcMfb8rD1qiZvYDU4T9v/PMCk9KquqOdUzb+nDO4Rfvtu0e/Xkq18lbIdT
 7lMx6nX31uAZJyr5TsMt4lgvZSrBCO8uV+rPp03KCOxjW4AC+9X0PbZrGcYiFpguNGiY9VVRZL
 e7TrCmdlp+Q91VjQPOac1dLLhSIRmsiO+W0d7SWjdGWgAAuSsPbF7p5RyMHAgAA
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX+p5a+j+KQRAo
 PTw5rRjKy5x3rrQiHaRDQwqZmgqqD33FAMBYFQ/Lm98gLccJ4Y0EgDyWt2XZ4UOczvG56FDCPoC
 RKj9S4FpbWalcv6lDvTJ0VAj/fv3V4NGN3LZ8HnK6D28xghUZQA3IulsdRLuyrEUTUnsHL8W6XR
 taR69Ix9w2QPxZIDuSEzbhCKyJ6QEkGd/AZKUNHHqdKdHtJSXBd4vLn6llx8k/jfYHtJ+QruYPX
 kIR1K+P2Nn8/v5dG0QIwPuIHY4G4RPjyYA3t9JqkFEWCN+aWIuE/T4Zi8AlQ/wb96XSTDpKc/ot
 3U0tBAgW2RlmP3CitYpOzqSh+BvFMrrfGOa8jOY0z/rDngZ3T2EikDuHrPG2QVQVbYU49QNBVyy
 x2cWJwFpLxiRG6s8knR/dmywdACpip2BN07boOnN3Cd9fHvMog9Ifr6ZaPc5l39dXpIav7dYQef
 Y1iJm+8XHGX0npdtEOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXzschBu70Jgd5
 atpMlx8v5lD/ZqcpJgKLg5AGYjFwwHCrdkjLEt7TUk9SNs7x9ckUWx8v5SM5t89n99tkMjwilQ+
 cHeBKZFafaHxg2JUWrqThv40iUcZM94=
X-Proofpoint-GUID: zsHil25zC2HRpgEWvWtNFqCbhDAx-r_O
X-Proofpoint-ORIG-GUID: zsHil25zC2HRpgEWvWtNFqCbhDAx-r_O
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b9236 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=psUvNacZHcIMRI98aYkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116

This patch series enables SDHC ICE, RNG and QCE support on Shikra,
aligned with how similar support is modeled on other Qualcomm platforms.

These DT and dt-bindings updates were previously posted as three
separate series. Based on review feedback, they are grouped here as one
crypto-focused series.

Previous threads:
QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/
RNG: https://lore.kernel.org/lkml/20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com/
ICE: https://lore.kernel.org/lkml/20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com/

Prerequisite series:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com/
- https://lore.kernel.org/lkml/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com/

Validation:
- ICE: driver probe at boot
- QCE: kcapi tests and driver probe
- RNG: validated using rngutils
- DT: validated shikra-cqs-evk.dtb with dt_binding_check and CHECK_DTBS=y

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
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

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 24 +++++++---
 .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 52 ++++++++++++++++++++++
 5 files changed, 73 insertions(+), 7 deletions(-)
---
base-commit: 9ac84344d36457c598806f7d8ed1369a8b0c5c45
change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5
prerequisite-message-id: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-message-id: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
prerequisite-patch-id: 0118397958b85e4297b47d6553ba4bf5b84024bb
prerequisite-patch-id: b6724798e8b73fb2182d11bda2a7aaa58976c7ea
prerequisite-patch-id: 4101033ee8eb0bc79c8dbc4a6c636cd527bf3bd0

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

