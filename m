Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201A36F914
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923485; cv=none; b=CD58liQINGlaN0UBrLZfF/ZCq+uKhiOXjF5YTRoueKEM/UjbbnnVI6/0AKFoRm/NENkcMiO+c6AkESH37v6B/gXWKA5jBcflNx9L6UTix/tLEwFPV0gTdhF+Lm8Y4s5RtEZY9Lirnw181tQoPrweNpjR/dZ7cusSGWjY7vu8Xjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923485; c=relaxed/simple;
	bh=DqZ0FVb0irYG+2K9mAJHPpKEpkKHUKNioC/dapoOlgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1w6pPEPbVQqotBgHiBzZTqdJPwJrs4hj0fqE1KmPbadubvvvlezDBNgEZoLhanalXG9dKorR5FJ+nepRxSG3nCdBCo9vYi4FiKUMSSLHhC1qTu1ehhsLSG6bYcVETnIjDvcbPEI23gVXHjGq6PPlTsi52SV6zSsCHXdyeDmZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANgsB3HC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRkL2/Vz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANgsB3HC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRkL2/Vz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoMRK1513588
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qkJtpxb4LNghBEEDMhuDcIVd+Q4GVz4Bzh9
	sDthSIyc=; b=ANgsB3HCqy1s+OjN3E/XMuUDPxzDNDEq1hcF+2/IF13oTBhGa92
	45IDE95jLuPBgoDLNwKSQxkkisIjRrg3rD/19zX96do8D7JoO+POwONYozZYRHeN
	A936+2D0MT3BpVfB5uJ0ySCPKsOyxirZEvMy8e3HemG98fZBdjY6oFo5OwKOpbnT
	ilx/FxE01ugJq3EtUzAp5kax+0gx/CZs1m6Ns6KtSMidZtcZ4U2UzYt+gPAiYdwZ
	Dv/ijPgHo1MxML+gjgq8r051g9VDUAWiUSxj6+pA6OkKa2V7tFrr+IdHhstpqLHI
	q+vRwyt0XT91F0gDhkF2sVzwTrGMSDkEPDg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwd44j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:31:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a7cbf971fcso111339e0c.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923482; x=1783528282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkJtpxb4LNghBEEDMhuDcIVd+Q4GVz4Bzh9sDthSIyc=;
        b=DRkL2/VzVmDv0KY7Q7nZCg/pUJWEfZZsqZqXSYQLmRSKpSbjC+fX+CkJ0gfPOzEf7f
         PNd6xseq/NEH63VTwfzh8DRw7SdTD6oXvji4qqvXnUAT+usf8xxDCdYV32otbGdkjFe6
         cHIANpobszspLT+761JY14BRyht3T5Fcdj9nZrtrDn0FADXRynqjKhIrMcIckVuKNTQB
         5xk/2xVtMAtcOden0vCGrMRXtzTXFPwgudDRA7PgfeWHX+CXL+Qr8U15P6kcq9xMIF6A
         T4XuTnNHq0uoxwEiSX9VlU6nXxgS4vPkyRVBHfggAGrpBAcPA+SKKXgOAKuHEiVY61/z
         RnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923482; x=1783528282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkJtpxb4LNghBEEDMhuDcIVd+Q4GVz4Bzh9sDthSIyc=;
        b=Ul39v/stYnAf0074xtONhD++P+E0gtqjWUyXtpGLLj2Qi8u2lB9O3da+t57Gw2Ym/M
         n992prF97xELZKq5LFa4Cv0hRf/2rvM9PkNqu7rsk6QfxyCHahbr8XS8fIsAgsXir5Hj
         sSgzbdopsELTTg8vKzRb9ImGhLW3HCOSCfvTI8maXEH3SEFirZkUYISyHKYhae3DVGtU
         fe8ragRTzYiwMc2lo6psl2H9aIeIZJ6hb6HzffHAfsRr+1rkFZ5horK2nu9r7qfeyM2P
         5jsGQrY66rmdboE5xLizl3YkOQnNMhpX3tXlyNgixeQStocTqba16yF8zJPigFOPcJ3S
         aiNw==
X-Forwarded-Encrypted: i=1; AHgh+RovFHNn/440j0YYn0wV8y4G19xCzuTFuKSTB/rb0t5eSL5ir0w1osYn9DjfkKrZ8QflJk/CXl3itXM6@vger.kernel.org
X-Gm-Message-State: AOJu0YxyyhkJNBW7hsrdn2m9KKayx3BC4Xhb6q6LooryxED273EMKW9j
	A6+7ycsx9CXDFXvT98MJrE+GYmNtGlcJvN+dDZRAVbw6vXDrflHU/uL9GJwLox4+7rVeVk8bxD/
	6Qo5ni2jakMCE6nsnZLkc9QKbdzojwLqqvorq3Pye7ajO3VOgnD0iDOEeh9W/WZTv
X-Gm-Gg: AfdE7clLTItR2mr+4/anzfXY4zngncirroGMXjdocrYLMjFzFQasO9TF3IGxviqU76b
	nCZVGfBRgDk/8kuDzTP+CAclJP++4nBTr+CmGGW13ikoGRzFNT05U/Osasqpx4NP8ctly75i5E/
	qHpAwbGMxXnLEJyipF1aRYZXZicz5wRBGkmogbHYG8hwNBXLBUxyJngqYKDxUZNheab3oTqFN2J
	LFTA2/Y4ORed9p9+SpoASH+um7wvByHrm5O9bNx8PxBaAwyMD9sdKIUp+RvYiTD9Dww/tIzZHL7
	X5krrKCkKq6eRDEpaQ38lmXBXROFsoym+hKgV+LnNVh10elGuN+VVlO68v+d+MnpySJaXmTDFnI
	vgSG216IAo4UkpRUqhgD7xVDN
X-Received: by 2002:a05:6122:3a1b:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5bddf554a1amr971916e0c.1.1782923481778;
        Wed, 01 Jul 2026 09:31:21 -0700 (PDT)
X-Received: by 2002:a05:6122:3a1b:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5bddf554a1amr971842e0c.1.1782923481252;
        Wed, 01 Jul 2026 09:31:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/3] Enable ADSP and CDSP for Glymur SoC
Date: Wed,  1 Jul 2026 17:31:12 +0100
Message-ID: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bDydsQh_wlN7A8hziu41ftQORYxXhtxc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfXxyJ+gds0Oitn
 +yr1ULgKjBZX86ENNck5JwBt1iI1TQF0gqjwjI+b9hH/G1RhbqOeyBpLu6AEXJGxq5VjuRjCP4y
 ZIganWSnYQwTwX+uOjJ753KdoXFavc0=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a4540da cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LL2NDXCyZq4GGRqjSbAA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: bDydsQh_wlN7A8hziu41ftQORYxXhtxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX5BkkzJjSCq8H
 cyog9GokS9ggbemoiHkY47OQYLP7EwLDXSQsglri5nV7M9CbmiQDLv+YDLqRjTrhGg4JSHHYkzn
 pCGHqiENW95IPQbrssR3c6mhQLZzwvDERwCmRndq43SaNNPCFoGmpgw0F39J4PhQthZh+GEeiGA
 Kual3prBQeZRQRcwuM85H1NQauets2djYsvEWj6xLmgblqFLIdGGVytqH6UMLa3Ie/5PzCgqJLd
 AFI75ehxLvP+7TYq1hMY40HJpgQ5R8lmKTkf+wh4UTuMLjjYBCErN8sS+RxOc7TO/rE02co0qM9
 XcU6GO4/FAB7nO7M2AKf7PtzAnTTJhQU9PKlw1R7QPvGFmmUNUsDX/dzjumv6ZbqEeyIctBJJLb
 7RULxw9YMHGkgxAqzGCX6yKic+K8EKRUxsbeUGpqkY3rLzR0ythbhDw55Tizj2Wr3sSa85icxSv
 l90UrqU8ERvwVq3QvgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010175

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v10:
- updated commit log for bindings to include glymur SoC
- added vdd-micb-supply to DMICs in va macro.
- some of the Sashiko AI review comment is incorrect as WSA codecs do
  share resets.
- Link to v9: https://lore.kernel.org/lkml/20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com/

Changes in v9:
- Include a binding patch to accommodate the data port increase to 17. [Sashiko-review-bot]
- Fix all double spaces in data list present in qcom,port-* properties.
- Fix routing of WooferRight In to WSA2 WSA_SPK1 OUT. [Sashiko-review-bot]
- Fix all incorrect lowercase speaker/dmic names. [Sashiko-review-bot]
- Link to v8: https://lore.kernel.org/lkml/20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com/

Changes in v8:
- Drop bindings and remoteproc nodes since they've already been picked up by Greg/Bjorn.
- Fix SID duplication between gpr and fastrpc nodes. [Sibi]
- Fix Incomplete DCO. [Krzysztof]
- Match model name to the one already used in Audioreach topology. [Krzysztof]
- Link to v7: https://lore.kernel.org/lkml/20260331032121.1279203-1-sibi.sankar@oss.qualcomm.com/

Changes in v7:
- Rebased on the latest Linux-next
- Split patch series so that Greg can pick this one up so that
  the dt changes can be picked up by Bjorn.
- Link to v6: https://lore.kernel.org/lkml/20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com/

Changes in v6:
- Pick the audio series up. [Srini]
- Pickup Rbs from the list.
- Rebase on top of the lastest linux-next.
- Fix up address size and other misc fixes. [Konrad]
- Fix the ordering the various audio nodes. [Sibi]
- Link to v5: https://lore.kernel.org/lkml/20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com/
- Link to v0 audio series: https://lore.kernel.org/lkml/20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Sibi Sankar (1):
  dt-bindings: soundwire: qcom: Increase max data ports to 17

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../bindings/soundwire/qcom,soundwire.yaml    |  20 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 110 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 263 ++++++++++++++++++
 3 files changed, 383 insertions(+), 10 deletions(-)

Sibi Sankar (1):
  dt-bindings: soundwire: qcom: Increase max data ports to 17

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../bindings/soundwire/qcom,soundwire.yaml    |  20 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 111 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 263 ++++++++++++++++++
 3 files changed, 384 insertions(+), 10 deletions(-)

-- 
2.53.0

