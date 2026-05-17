Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45872566D3
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039212; cv=none; b=ry//E0Lby6AmtmTIj0VzESdsy6Sc3FDmYlbFwz528FOkl0XByCAeVyFBoCVRkztg0BmI2jRqGHgYB+3MyOlgyx/GwAGsXIIXYFT9n7PN4mpStg4kBaOjgwyZhlAtYTHBA0RIovALMTbxOHkvJgBcDD5lMMJ6X4CaXfn4C6aNQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039212; c=relaxed/simple;
	bh=/AeskSQAB+GvkvpbhAQK047uAob7kM+wJqfSBgGdkZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqrSoLgpaNxlMHbmlpJ4dmimhCpjPXUH6bd82wBoNYRBGPhRZXOVf7GJDNg6U9PY8FLSXV2MSXNuID16iqMcNBs/ya/T888nnD1O5MKGsfLmanqNntEdI0DxiqXBsjuCjm48Owg/ffySpOfw3MEoJdsZtwvPQarkFeJK//VVFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOLCIXrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ9y++I4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOLCIXrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ9y++I4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H3vkkl2748445
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CtCk7wO3QRicdXUPJEyQ9R
	e7pEma9qkfvLI2CfxWtzQ=; b=QOLCIXrb84Hn3uklDwafHLKU9Rpl6Z1SBiDbXk
	afUXnDQqT8Qr30pa8qYnL/JOQV+g1yZ2s7SsNbWBhgM9A7GI4WfbIS6MBd0B1OF5
	9ICnhfyvKZI1x8A6w2LdKkGpgX269MvQ7q37P92i83dAlnqjk5qwovLo+xLkbMF+
	dZRlspMLp5+GvCaxeU9uUimSZdyT2mulqmg21kVA6MZ9bCXjZ2o7VSJQTiD9/A9u
	o0QKBJVNPTQ2g4EMTGq/UbqsGfOnhWcnXQKoniECzW+pryFKAN7ysuSzSNUbuUM2
	yQ50HiM08WezK88uU7jKLhvSAkuDdOOCSZxtCl8q+pdJSXgA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01k9wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:33:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so898669b3a.2
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039209; x=1779644009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtCk7wO3QRicdXUPJEyQ9Re7pEma9qkfvLI2CfxWtzQ=;
        b=ZJ9y++I46HDLu3OsTAdyCi5ykmpjlt19YWHEColO5KzfhxonvEI5g8kzDoDHGf9xQb
         D4Wt/dCcg84ps0sr9SLwCcii8pX9F8TbYEjqkvKDQmIRa5y6vj9lxEB9xeCg7rukL0zC
         jN7FKemgAdfQPDWMDGPnfnqxbpo4AOIItnTTcDQOVPOOjCNXDYocQzkQPxbzlPRToDzt
         ytxeUNGmRD4G7NV+fVx+VWBJNsrUIIcE9JsFgFXQFhj8rsThc1pv31nG/Sl3HsK2TI6B
         1lZ3JLlF9DKvnD6Epqi257f56glJbzFMzL5+/ZIYLwLH+yG6EF+G66NWTH2gtyzE6LSk
         qEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039209; x=1779644009;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtCk7wO3QRicdXUPJEyQ9Re7pEma9qkfvLI2CfxWtzQ=;
        b=SjVnHY83J3J4QVsR7ZUI1YiF6dM95GUpscizUtqlVAIixO8k1MfQLUya7+V9/hIiMU
         86vwuu+nY1UBoK8TjFCippmUSTqZyDPq1nnQ7e6epQVC+DM69O6FCB/tlsVJ4hDq5BT0
         72Ljim9JNU4YNwm4NklCDc6R2eSiYO5/qPZEmYseO7gTw2jjzJ/XuzHTS8RsthkI+HYZ
         RW0TaW72WAaROoomZvkX2qUzgjaQLikClNjHBdXlKs6qGvmC72DvQ4IHGxTxEVZsR08V
         WxuUV/9skBE7G0L/pbweHBuOf5VV4bn7/glC4O4FFbuJHG+bd+gce9LtCqBxMT9PcooM
         fmyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OBG2bAxXvF2tAaN6QZf/2sdGRRcU16xQjrYNzIZEP89bWfkq8uKUaun++gK8D9m8nqHUyQ2myFTJn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2M67SMNUUwQ71bxsefoFvfTunhvysB8xJIS0Leg9+GkbsdTEQ
	6Wsr7qe/SxvqutTUE7CysUrD8L3w7RkRKVym72hf3oeVdcF3CQjnsitx0OVX9ivP91VdiF5fc5n
	LU7bCOVB+ffZqZ+pB5KEc5FOgThnNGL7Opkfe9iRw5aeF1505BxKx09qa5nKd2rgM
X-Gm-Gg: Acq92OHUyO+e8H3lloP8wOdgL0aBuMRTy0358ifVKavRc+IV03Tktbh2ZYeOfKtsIYs
	be7xO296UXRlrOIAw6TnEpMQI1injS/HrkbMImnq1pziBN4XoGs8BAhXNoMm2QD/cUlHxdLBocw
	v8SUasZ8I0/HEDftxBMvcTT11fxKB8qZCrK/WkHgry7Zy1AluPJgHzuguILs3ZB8ns6AWKfWzV3
	6uzw0yRtXXWTq5MPrpnLpbYsv/9CVgLFx3/Dgo90PgCgh3xdo+6jBqXkeTz7HEbww8wvn8MRuQB
	IIsWXH9KCr2K8GbBZObg4jP5+ZGox+g/fBDhtvVQNhyBuIXiz3hOsDYzc5j5ZMyYBbioL5PKoE/
	pxyyB6W2/9/2uzv+NJe0vjv64eMLIcdQRLKhZPVQEVvvLtW5x0hyF
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr11947013b3a.38.1779039208601;
        Sun, 17 May 2026 10:33:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr11946993b3a.38.1779039208116;
        Sun, 17 May 2026 10:33:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add camera clock controller support on Glymur
 platform
Date: Sun, 17 May 2026 23:03:06 +0530
Message-Id: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP7CWoC/3XOUQuCMBDA8a8Se26y3dRlT32PiFjbmYN0taUk4
 ndv2kMl9XLwP7gfN5CA3mIg29VAPHY2WNfESNcroivVnJFaE5sAg5xlXNLzpa9bf9Sq1poiCGb
 4yZTCCBJPrh5L+5i5/SF2ZcPd+X7WOz5tX1DK4BvqOGUUN0axTAE3Su5cCMmtVRft6jqJg0xeB
 x8GFAsDosG0KA0vpNzkxR9DvI2ML/8Q0VCSF3mJCFL+MsZxfAK0K1HBNwEAAA==
X-Change-ID: 20260517-glymur_camcc-e230d1bdf3d3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: JzEiPIHp0XGAH2naRvOlvEQFUZau7kgm
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a09fbe9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PfRGEEtQfDBBo0DW6aEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: JzEiPIHp0XGAH2naRvOlvEQFUZau7kgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfX0rvYkCmuFr85
 rFb2dU8oRVqP4u/PKf5n3rkA5a0DhnHOWQeV40E5Q+Lh1kmBPuMlSpNM4lbxim4syImafePa+Si
 vLeUU5OkYzwMao8kVL+TGZ7fIamuHIINRUtByyihXpjwW6XUHS9M+S+QhBdgRm67O24YXqQYVbR
 bbekBds+JPQw+Jq57fvABPzA08muRbQ7p4dQUU5mvXFvcLoQ7CkaJgnLA4XpfJ8M1Cv6ln3SrP3
 WwDkwxHp/5QUB/eStk/IV6LMS4Buc/X6WwpFM/fJ0VsvKngG1iFgswsiqzKBVMHbZLiR2NDb1+z
 3Q7slyDfvX9nRUtbr/zYa3aTeknT1eD02mFB5slm63gktxOipv2YdaoYwHBm6pRQQ2KNO56/i6t
 +MeqcBNEwGIpnJGPHl6VzDkBYdktwmwkx65X/h+vJ2zmZPympKlYxuNYcUg/yCYCBEXhHebbaI8
 FgPqlhzWi5xoRLBsZNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170189

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v4:
- Fixed parent src in ftbl_cam_cc_xo_clk_src to align with it's parent map
  [Reported by sashiko-bot:
   https://lore.kernel.org/all/20260513215441.E17B8C19425@smtp.kernel.org/#t]
- Added R-By tags received in v3
- Link to v3: https://lore.kernel.org/r/20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com

Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260517-glymur_camcc-e230d1bdf3d3

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

