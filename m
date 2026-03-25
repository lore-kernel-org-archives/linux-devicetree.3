Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E646A2EACEF
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410834; cv=none; b=AbEvCxKbFkmPe1Je1b42DuQEV0XF2dzYCRPr90k/cnl2RnjwDclnoBcacvFvlESu4soIW9AmwLv6xVEbAnc2N62JTio52azflVH5AP9XB+khvUrLZvn2sOeiSrUEqmhntx1Cl5H5bboVWdjE6WqP93AZek8+Bz1+OAwlD/IJsWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410834; c=relaxed/simple;
	bh=mDV121ELhEZSnYhKnrHW2cQwwTPWEQEVd0r6IgjIIl0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jrUiakJFJ3dG80Hdq/mntoc1EdzbDjFwtJoxxaCmXfdkjDvndZ0nfUkyj6CinCxTDk9iFNeg+lLeeXbtpAWsHL7fSRDyiYiFGaLtln1YAoq2OoBb2P6tuqzravMYcwpArz+BCazmcswmOKThnfGWrgfJX1gO+bxwLB99iE13RjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hG8HmLWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXX/U3+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hG8HmLWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXX/U3+Y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JHLH3057532
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=28PMbL2jvquYr9ww9Imwe/RUFpb6JBePIL5
	+Ewjv8kg=; b=hG8HmLWYLHq8hViQWi94tCFrHkP1CzBBWZF42wbEHLc+rcgm1wI
	FbsPJACY4rGrTsfCjT1SvIcAqmRYyYyeP7PjVJ25516/46jWMqTJb6cksWKFpYAK
	2nw/IgzFxSXnvQX/yuDFOP3jZRa7YoCgme/J5GQF8XM+Q1k2pfV8KE7JqfZZ/wxi
	U9HGKUXXaEo3rhqibj17fcQQkwp0hUKWajFi1u2v1PLNTwgm8doOEQQ0pFjOca1S
	vN5AIogOWW0+f8agZ3r5hORjtk0hhG6FRqff/asfD461aimzZBkvQmkxTQnHR3bu
	VazcLBgz1VYLmOUAO2BHXeBYZuDsJcHgALg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp08sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:53:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7414179cceso3002929a12.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410832; x=1775015632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28PMbL2jvquYr9ww9Imwe/RUFpb6JBePIL5+Ewjv8kg=;
        b=VXX/U3+Yw0nmORyc9zJ8Dx6aaO935PB79EK/opRsAwUfFQYr7N0AbbXPN4resdnkq2
         MdhSosNjJjxwwjnUgIaz+DfJqrXrtxh/esWDaMnOyMNHN5wijsmemVP1q44nXaaMle/5
         8hNYWtX215dtO6L55usGmPyzMlcmoKXEKf6i0eQrf5YgQ0KXrSXQAXclk1LI+5yeE49f
         t2oYjWWNeOthoyGPQOKG1sxhYpJEsl3Q9p9L1I7lfGi2k/2uftb6LT0JI6QE82Ku1MS+
         qdt4M+dHyRstrtuQ+EgH9xL6yqEj6bz6lvDT/FrR1M1nb224BxHswGsB7xcHQ0hk8Ed4
         0QMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410832; x=1775015632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28PMbL2jvquYr9ww9Imwe/RUFpb6JBePIL5+Ewjv8kg=;
        b=I2vBse82jN+5L1VgpArWk5c+yKr1NZNE7XBQMkqvNqtSoefxhRcxziIyeC6A731AAV
         amR5b/HNUopvRuFTwe9OXcCX0N52vqQPjON2DupUNewFMZkfqWWU+aVe1vQR6ylqBc0Q
         OtGm24FM8wXWCJ5/rjR3yqiqEEhy/7R8SlDFyWW9zE9vzrdLZJCSE7pZ5tnTjNsHetBn
         ycNhQBz+LZyd4hA476a3WUiwU3rJTVIv1GQ95bLfwf7fMCYoSry0IK+iZ/+05x+VY0PO
         s1/ww4t2LmadFyptpTsVT+61ntCdGokmrTdjHXJwDGAUoSxRuS9kfAvbvBGkPILZNqTw
         nZIA==
X-Forwarded-Encrypted: i=1; AJvYcCUA6xOpb88+GZCMMkfV2XS+LOCOeu0kYq8/U0436icZ6lHrLboWQUxu/Yu9QhG1REPT2L3xp2X8oIIA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3KJXNcjKfqsdZSRGkA3oFLbX4uXzaBj8k+cqTWujS+utla5ph
	GGlkDf7zlMQagku2ZdiHQyQVIGvCHOz/GixY6a4qvY8I8vrrUeJdtxCIsWDFeSjnlfk28o9tsCW
	0V1/7Iw9bd0uamOoiCAh7d6EXv/D1OFhFLOexseyMLUFOC0S0ztxjI77PZDRSPK8L
X-Gm-Gg: ATEYQzyQUjIa6Ie6mgftdZkFxnmbMYdpp/ovK4vnZ7agLGpGcvYj4j2oYufB8D1Wzqr
	/f6+IwCJZ7IUx23wQrrzVg0Rg1bBf3V0Ur3rrAV07/3cnLLuACAZ4FoZGf144HLyNjXEYiy2hst
	ENSlOZI0nDaQrTDqVVnxun50+9WudTrX3J2JdM7pdwHK5U5hV80tcVjw1xJc9qKSa66MrYO3QQi
	G9/NCF79H62Tuvjzq/gjt3COwPoW26Iuijh5xOHTq+b1sO+DO39jX/+kFaZfCh2pR+1c2wFe6Sa
	OqcWfDxfryaPUs6nOUumSXwwRTjGXaJN9rAvDR5WHA+eKs8XKb7HjGAr/Lnc1xxQniQj6ONP7s3
	uT61TV+lr4Xnskcf3gQobPBJ9ND8jG72TKfjncz6TFwqZr4N9iLDPnCCqb+aURLgvBnOEo5sCrd
	T6CI6mKZYXyydUqJpGuUXpIp9HJcwUlSJpmuYl
X-Received: by 2002:a05:6a00:3d0b:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82c6de8582amr2084373b3a.5.1774410831388;
        Tue, 24 Mar 2026 20:53:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0b:b0:824:188b:c173 with SMTP id d2e1a72fcca58-82c6de8582amr2084349b3a.5.1774410830885;
        Tue, 24 Mar 2026 20:53:50 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:53:50 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V6 0/5] Enable ADSP and CDSP for Glymur SoC
Date: Wed, 25 Mar 2026 09:23:33 +0530
Message-Id: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bE7Okce1I3zzkRAwHzVNcs1bSlqu7_z_
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c35c50 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9v-nsc7hOUgGWHzJVNoA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bE7Okce1I3zzkRAwHzVNcs1bSlqu7_z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX0sueqevMMB2r
 uBRMFIUU37A2HPJ+5DLyg44EQpcmKeywDqTgTHqxmUjxakAEL8Zd99XqOZgnvFHMvJBqJDvBvgl
 TwRPsKERw5WY+PSxjndPGfbYceoqbD0fJYNZZmmyKb5OV5zgZFH4K3lzVFxubpdNiiCs596L59g
 +8Zv2oM3VHZc+qCIMxuAlv4MmCXDr4/BzSkffbfMj9o0rYAVFmuhkIwvYfztY0tvDnjxGLRpuHR
 JtJ+01CI4GcHCIeoo7o1z9QusbVgoBbTp48clYEM0SajDyoUwSt8FI4eZZAQFu3Ajb/7IAU1UFp
 dgZ9VoqAxTjmkYMdsPbBnNXO3+zXncihNimuIHqgaPU4hPqyeYlRqJMYn/AwNlzl11Cst1ZmeYl
 0QSR/D/YsPqAt5+xsd9D2QGJqh0bO22hJGxSPEFTaILOOmR2HJdwXkXLoUYx1zrvFoIA0Krse3R
 +7dVgMamKpZJpxauvnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023

From: Sibi Sankar <quic_sibis@quicinc.com>

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

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

Sibi Sankar (3):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
  arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
  arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../bindings/misc/qcom,fastrpc.yaml           |  11 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 124 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 549 ++++++++++++++++++
 3 files changed, 681 insertions(+), 3 deletions(-)


base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
-- 
2.34.1

