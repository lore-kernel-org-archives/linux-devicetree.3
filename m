Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC137FF58
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526522; cv=none; b=Oyt+3PEbtSh5ixqNSTYtoU04QmXi+8l+7VObEA/8t+Ce2UWZpPn3wEtDmpBivWAqh+1+wnF6KdMQ5yw8yteVYI1pAtaMj98wkZKoSoge68GUwdO1IZP8m0CRYOQg08N5xmNuT9wc6ZPr+T1Hn1Nb5BddwKxSbgicIm94d2a5pXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526522; c=relaxed/simple;
	bh=xc680dM5PweEhoRtY3qXfnRTWULbCwzK9xBhcVssxNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=snejWha5phqLstTVJiNAMeXDAOjBJOvPuZFNefrpxQYqeBVvla/N087gAtHdFeqE4AFo/dW4CW8WSVBhCNGNieO1mG0eQRY+BvRgv0dGqKSPQaORE43wTvDU/quntqB7JWSgKFG/kx+N88XsJBPy4EpXe6U8WUSVrmv+I3pstoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL/CBudX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brTCmbgj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL/CBudX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brTCmbgj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N3jvS1735549
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8vCAQQ4HHKc60SHHB56+Atg6iiA4OSc5bN2
	Ck42SV1Q=; b=hL/CBudXJkgaJPLqH6h8kWw7xyrsxNGQ5ejBBBCauLcRKkFjX0P
	FIVH8X92JuW91CIJupNk4c0+wDoWQJFpMxi2f9lZCUQJ/vG6Af5t03Mkor/LaC8E
	dSBaxS4TUk0IfIm3EJ8exrO7o7Za+5lq737COqArWfXDdgk2kT35jANtLJ2z/J0J
	kxvlXM1JZKWyGt34Elpy1VBAcAOLwtLH1O4ErEdKDjvwVmA3ZUJU4qSgZQ7weHla
	OK3HK5KOv9yeS7iuC0JwM4AnAc5Y09P1Z2nnmRXhKNbSU6NCoITT+ICXtOnk5khI
	Qn8Rfs+wgatDcK2dbTsCPqfimvVbhKdnAsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7ggc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso146341495ad.1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526519; x=1780131319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vCAQQ4HHKc60SHHB56+Atg6iiA4OSc5bN2Ck42SV1Q=;
        b=brTCmbgjCyIx5K15e25n801HX3VsF/Kqid917qtedq3fEBHif7RyGV4jOrbY/O86SK
         cHtQ2fSLUl5rYizt+7BvG3w/kcilt9Sn97BWSBdcaSdZcIw9fULLvbvYNq1/5AGeU5OL
         FX7OEfc36ylqnfbK6TJgx2vHObBMGbMvdBgqAC8wXfH50HAAUdo/DvAZAowUfPP0zc3d
         T/oB16n3iezT40AV52TL3K4yYiyyR8yKPoT7vdvH2Fnj0TBai+9xeRnZrHv7n/EOm8Ek
         EKGh+cJaHnKJCrsobmfdVaOxC89oVEkqfAesbUvggPovoHDh4WTjpxhWOlXNV/Dyyz3M
         /YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526519; x=1780131319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vCAQQ4HHKc60SHHB56+Atg6iiA4OSc5bN2Ck42SV1Q=;
        b=lwwRoMt+PW9IMGQhfBe5trsc3TA8Ip6ExPxyOguKM8jE7no+djv3t7qRUO274XVW9x
         aXuh+Drg8ZAyvj/d6e3wU3tLg+HQKw4WIu9QarDwq3nu4/tYAIu4CEsFIsOQf1h4WmDt
         CMXSpwygWORD14UY6hBPOQfSOhdqeI8d/xZlEYJGf4O2y8n/lpqZw6WFwnh5iJESfRyc
         NuNpDbr7T5GnJjDwv3lvCei3W/6P20dVl/A33rhMBCy/PgeG0J1O2kH1f/YUPHZl0xNs
         KT2FfJwtGqvt7upiEyzNhDCdc1f65oUPxS/joBBu1WYxmCtZd3sweCz0PpwyTrnTMaBI
         Zb4w==
X-Forwarded-Encrypted: i=1; AFNElJ/NC4w6QQbO3rlMiDrTpO6VylAO1PdgDZ53mjy6lUxiu+JAVfFmU1ZcpMsV08imNv/jbY74B6D+7cFy@vger.kernel.org
X-Gm-Message-State: AOJu0YypR5V0ILtJhspkDJlD1vIa/hYl4KqskALnXMPmKYWZLSC0cUeV
	A3Fnx1ir5wN2foI6By9NSKSmqr6ArbLO7L/aVQvm0D1KRjFyx1hcbvwd4cP71xi1jI93Qd47Yba
	vpr8OjlG2FE2TP+g+ZpN4hENE5kTYCYdUk2Mwu3m0p1xeIMuLDwe7vfMStABqN8ut
X-Gm-Gg: Acq92OEqobyhp/4FGjYjj9w4g3RVf7L0wLj2l7ixYumG2dOV4Z67LsFlZZ6UAo1kg3l
	3hGyPFKfJ6/jrdqdbYLnyzLZ0JHRfH1XSciDh3hDGLPo5IDrU3RAfjM1eNqYgP7KEDu95ErywHW
	6/efW/15EJ8LF6/9Uby1ZWq/sPv8sNW1ivec82lQ8KYk+o1JR8Ztdi0Z1YvU1INVNMiY2xxcMsu
	KjZw8wfXQ7zkAo3EYXZH8ZaBQXIzx5ictkk5ZUWEuqjDs0PJ6OZrSeCEkdaA+C1/PbcGIxrFVz/
	arx+MEBI8CuQO09gB02MObllqO8qJmC3fbPJkXGS4O7iy5PsiDRywpnYcBWv2XKzUPuWK94Z7/3
	Su9c4AhadyyMcXx6/82Vcs5gu5k7+bIY8mX3+BpHefTLLNoXfCtqLkteiCeTOK2jloXHJ33n0kJ
	5r2D91xi+yUWsehHxtEf5rsPCvWPWCAwcjcldl
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2beb07001camr81491065ad.39.1779526518869;
        Sat, 23 May 2026 01:55:18 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2beb07001camr81490675ad.39.1779526518344;
        Sat, 23 May 2026 01:55:18 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:17 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: [PATCH V9 0/3] Enable ADSP and CDSP for Glymur SoC
Date: Sat, 23 May 2026 14:25:08 +0530
Message-Id: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2LR4m3KTH_GyI2HfCIMbnbax1x2nNrZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NyBTYWx0ZWRfXztezArMi2ngM
 2fHzjyIHV2zWsiPOOZqoP1jaNNtJf7MJtnk0tyUYnSe4B+ICXaS79tVJ3I8tqE5ZvV1gyc2CHCm
 nyamyRuzfbd6YB52y3VaM9h6SOtYqPHLt3DRjDC+i4t4F8i8fDOZmBhLe/8hzuhOt66kLNMWEK2
 8Cq5lkYd+Kc6POBT3x7Usth/PuSOzNgDq1xq2UKboNTkvTD41ajf29kGdFiGmaYlYv/34+bCCL+
 XCOCN2hLV3u0W1qqAWrG0ddxjlsvnZeqRreQenqNsqRo6BmNwV0R1GbnVSswvtN5lUj5Wz/BmqU
 rh4jcOWEK9EHsBMT/6xoZ/+/tA/gICkIGElU/PALL/OMMw7PDPczDQf7G5TjcaAeeyWj4VUrFYQ
 Xy7bln6sp/Nqax6M9nC67fFjGz2+f1KW5AZ/UEuggCn+DFBfhVR6gZrYKVvwBf4bde/ZXTdfabC
 V3Y68GoL9LB/ZfK1jpQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a116b77 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pC0kQTKkh_gLwOHhAVIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 2LR4m3KTH_GyI2HfCIMbnbax1x2nNrZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230087

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

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


base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
-- 
2.34.1

