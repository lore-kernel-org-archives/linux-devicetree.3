Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988E413229
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482116; cv=none; b=kSZgph4Y/I3rhz7UAR+TDP8JVePaFcFM+Qub4eCFpZ/hX68M/MC/50ME+6EH8tU/HTWpgp0f01CG0swMzyZCp5gN1gdP9ekHGuEGU5BtsjvXO8RJo7ZpkTEXaSZpdfVgJ1OnyuYM/u6u/5u3tQ/1j4SQVShFwiZlHfv0D3biA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482116; c=relaxed/simple;
	bh=SXa4NSNdU/XIj9zZigyMpKZ4wZlS2vJhYXIJ/TlKKfM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nxAbkrumCncusbWF49oS9q4S0WYJeXoH6nx4pv3xOpBsS06ppkRGau+9FrV/B8SZSNXoxH3S4DDxEwo6OAGfEb7DJkISBUUKwJjZGWaXm86dOjWamaaRf2QG1/aGxHfQvUbXDafB08pBUIamq6K2o0Hj1UYFg91bmA5z8J5kXGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4LyWxxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JanxAVwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4LyWxxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JanxAVwG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFOCai1728671
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k/k1EVZf1KXzwkXQ6Y6mGr
	bzNF1yCRYykNpkpO+q6c8=; b=I4LyWxxUTmh0r9izokM2KOb0oFQvB0dtvhRJ7o
	MIWDRR9VzBzl8XysB3O2KrO8R6lptrpR14KNR/kYnBS42GmUM7jIz0zxzKJQC+Oz
	1RgTwQzw8JvYuaWLdUbnLvwLJItpst1NjnQfkypXB7+tmoKgiInklO2/UFRmSBCO
	9XkDwGIIf8KGR8vjFiij/9rPdsNIMcl6+Uu06SScXCWnBmT0/lVDIBKX0bsaZTdW
	G1Gzn+V+dxkfolLR61q7CiUCzTgCJGM6lAyItt7s/r1x9h7lJKysIZ6CXS029U+p
	B0fvC9rsiDP37rr6Z5GXQeGUh1LTbMcJ01WwDtkGA1wfyjUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kt4kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso129545ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482106; x=1778086906; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/k1EVZf1KXzwkXQ6Y6mGrbzNF1yCRYykNpkpO+q6c8=;
        b=JanxAVwGDt0nOhnDWP9fKSbnITdWaTsMh5QkJd2d93RJyZrcOLkk6BNqlCgyYjTEFs
         mUx4lqqTY2OBSU5QaahvJUGF/2DMT9MK3G6w5c7Y5304H93S29rZ+Sk1LipqzCVGtfAy
         u7eZSipUY0Sl2XhrrBZkx1mQ/Kx0jdoaGTidVUumhk7cQw7x4X6tCt1VO/xjvXOgiK6f
         RRgdRBIRtpKG/8VGRqYS66lHSXMabtDLFg9i7+5d2g/meT1fdFRRJsYE3mHUlZS03AKR
         Zd1WkcOj/kbuA44p/AyOpRZzcU0XPtw1ZIuyDB3o4EqcuBWIBTYPkHP6FqWCNAKrZ+GH
         m8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482106; x=1778086906;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/k1EVZf1KXzwkXQ6Y6mGrbzNF1yCRYykNpkpO+q6c8=;
        b=plCFnHsiPVBUSiRjWagGTa1yUkjAigKjG2D9vX6eJtd1KzyAZchF8AJq8dZVrfRwCC
         zxFwXQ3Yjpx0eqQvQO5MrUHHtzGH8STtJAWAhlwBRCWMkkyLPoHFBEgN+znsD34jROLu
         uVKrgk+1KPnsNs9XE8CrC3VTjRhH9uCotArrDu1KxdYkpV0xGIkORpDvOIwwD5HX1ew/
         aGhjt+op8YbG3hvkut3Ei9sNTTkwDKF8tyopNmfV2Dx9PxcEPzT7uaXovHcPAV0yThkn
         ToICeGgD68XaGq9MsMBdtW0gVqKs1RpfvIBZ0vE+r9FFGAzZ6LbT7znNm+l/xJ5aocaF
         hm2A==
X-Forwarded-Encrypted: i=1; AFNElJ9PoYE7deIfnAmzsGHGnHMkk/raEYoZ1D1EQPx7tZjZRwAS5Tm8LJzGiubb6cPYJWdYfRmYF+gZovnR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw161IlfogyHMfM+YeEcxyjK9R9KlYL9pMeSZ/Qp6q0BSF01vLT
	RhMh0RVHA5VGlbZOIuxX3NCdP6bmZg1Qa5D6RhC0gmjmu1CvUs6gox8qoA5LzozUWh77xx/gNfT
	3E0pGydHgcWpIzbjrxvKUgQCz0vQ/WelH2GLQ4HhzUMIobas865hxs4Spz5Zu7wbo
X-Gm-Gg: AeBDiev9EiLfTwMQ7luypYTK8anSPgBdp1OAD8Dpxbv3C/aHLHN+VDAaFGmnw3u3jN6
	SK/VNYZGedzXMubzgDh+ZjG0m9vfrw8RKw//kOSKusiiiofOBhyKnvaAaq+LJ+eHoMRB6J07/MR
	I8Zap0QRvCunLu7NphMb7MTnQT+l3XREDsWjhaztHqX3hrei4keKKXEn54bJAZIzpS8QQLagC5e
	4W0s4RMzDa0Z8jAx/sbdp6hD66RHlpqZJ1NQnoHDpK+MvBQNv4Co5Bct08AuhZSjd3eYVGEvvll
	qo4iKgh9K4gcAqsHNNkFbZvC5H96pBNzUAV0FrNy32+YykY0nF/4hAPZ+etJ2J6Y9qCmonsXVNk
	dogvL/7HYybCRqOwHtYqNC11WvngQakGN5ns43HeONCPbSmNyCzxEz9Eu+UmnoTlvdcai
X-Received: by 2002:a17:903:a90:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b97c4c8995mr75298545ad.27.1777482106112;
        Wed, 29 Apr 2026 10:01:46 -0700 (PDT)
X-Received: by 2002:a17:903:a90:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b97c4c8995mr75298015ad.27.1777482105417;
        Wed, 29 Apr 2026 10:01:45 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:01:44 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
Date: Wed, 29 Apr 2026 22:31:35 +0530
Message-Id: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG858mkC/3XOTQ7CIBAF4KsY1mKGPw2uvIdxAXSqGC0VtNE0v
 btQF22ibkhe8r439CRh9JjIdtGTiJ1PPjQ5qOWCuJNpjkh9lTPhwNcguKSp9bQJkYJ260ojVAi
 K5HYbsfbPcWl/+OT0sGd098JL4+TTPcTXeKpjpfe92jEKVGCNSjvmGNO7kNLq9jAXF67XVX5IG
 e/4xCWbcZ65dc7I/C9pVf2HixnnMHGR+aZCwZXhGhj84XLO9cRl4aK2zBoLwpoffBiGN/39MNN
 0AQAA
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=4134;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=SXa4NSNdU/XIj9zZigyMpKZ4wZlS2vJhYXIJ/TlKKfM=;
 b=G98i6QTKkKi4+Bxo87HTfyTzT+uLlQ1DtZTgTG3Rqj8KVwRYPMcNwYs7f0t9zCiAMDmijwhGj
 Janz0fxJOKyBSKEOOmnZij/ux5QmMrULgiqEALp31RPzvYxkPoLUimb
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX7R75SLRIjGcT
 82+KiXXBbJN/uztit1iJDF8WJ0p6l6+nOwBaDpIq2wl1uc+X3vycfageTHTyekQrX8WxaPqadep
 q2LYGb7PLQpLi+S9/wQWTtC6t5Pkuo1qHgsSfN1w9BMXco+uXBILM6M1o1+wOUbFINn3vzgpmMN
 vrIPD75Yg440o3scKD+z2n35VsPBwnPI38JUrEDKeF4RwkiwS9QDlWum9ON1TVGwbZmlz4oqerq
 n82m7ctXhmV/j/brXXfFSrjF/sec6IqaULqfnsGawETQxGXvB6XCE9+7ggFZWGB7JXqCZgDEPEx
 9yUZC1+hE6+4fFPWWlav5Rta3tPXLfbC05MnvTWX1RktCbm74uw1okOd6TL3uL4o6oqE7CDTeod
 zQ0EzNer6xyrZkghYksD4xfqM+Vnmw==
X-Proofpoint-GUID: twxumcUzOGIsGivxTjldcdYfmyDYHkAo
X-Proofpoint-ORIG-GUID: twxumcUzOGIsGivxTjldcdYfmyDYHkAo
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f2397b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=YsM2utnLYs980cnplJsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v5:
- Rebased on top of current mainline to apply cleanly.
- Link to v4: https://patch.msgid.link/20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com

Changes in v4:
- Made qspi-memory node handling optional to gracefully fall back to legacy
  single-region behavior when the node is absent in older Device trees.
- Checked return value of clk_bulk_prepare_enable() and logged error on
  failure in resume error path.
- Fixed subject line style to match subsystem conventions
- Link to v3: https://patch.msgid.link/20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com

Changes in v3:
- Added missing interconnect-names constraint for qcom,qcs615-qspi.
- Changed interconnect tags for qspi-memory path to QCOM_ICC_TAG_ALWAYS
- Fixed suspend sequence: now disables clocks before dropping performance
  state to avoid brownout risk
- Link to v2: https://patch.msgid.link/20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com

Changes in v2:
- Moved allOf section to bottom of binding schema
- Added if:then constraint requiring minimum 2 interconnects for qcs615
- Fixed runtime PM error handling with complete goto-based cleanup
- Added proper error paths in suspend/resume functions
- Changed interconnect tags from raw 0 to QCOM_ICC_TAG_ACTIVE_ONLY
- Link to v1: https://patch.msgid.link/20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com

---
Viken Dadhaniya (7):
      spi: dt-bindings: qcom,spi-qcom-qspi: Add qcom,qcs615-qspi compatible
      spi: spi-qcom-qspi: Fix incomplete error handling in runtime PM
      spi: spi-qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 21 +++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 80 +++++++++++++++++++---
 6 files changed, 192 insertions(+), 19 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

