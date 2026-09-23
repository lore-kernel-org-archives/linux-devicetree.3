Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D7286425
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139475; cv=none; b=qUm4y2aLSAYifkICwbx9CMrvT4JcYDSbDY9UXhw2V1djsuO+yKyCswzy/9kQTxRpQfdgnLTUH04GbQWjxn+Ej6LVUZy7pf9EM6yHkr7nHULrnJB5iSYcla67mjqYVC23jFJBwGlnxPFmNT0I695hYa9jQkFIVOmYI/KHSC+f3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139475; c=relaxed/simple;
	bh=BTOJ1wiveAXpZtw2XTXq7Nf2MHakkYTzq5oPmpfXG/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L8YckyBCrgPM+3qodMMPZPdIOXS/kHMbLLkPUK0wFOs8YktNJxCtx9Z+z+pbcgRPbywmTzC+pBuU4Jk9I9618Q0XmVCD2KR+2ZKwW9MoZ21arK85DvpM2HJXJw2zzLEjCz6+G2nnzQgy35qjqO5/qOYB5C+wLRTkcwEoLLdZ5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH2D82OE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6kPgaGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH2D82OE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6kPgaGx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ii7V1425413
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LaTyrJazqCQrK/3v09odbP
	4gZk6HlHmaWeeBLbXZQ1s=; b=CH2D82OEL0l6CnABHHXq3jtam2KqlgEdZEWm/c
	nmdGinjGc3XRiLyENb5GU+7ug65NyForGlJKuygmzKkoYRYzkSJ+0eOQ1XPqo3AW
	iQ3YR6HDMcn9T3fusWwWc7RCTv1Mc81DE6ZSnoMkZ+XBGG7p/JUgaqcSIumqBxfh
	PAcHn0WspZ7hN6MARtudVDTfuVVtSTz/Ab86YKy+mnqAtDQZs905DyQFmPB32zoK
	cjNRRNUOvPdcfucWl3t73SnYANAEPgujIgUBE4wDV6bmCpt9l0Yrzn+CoZ+Vas74
	bxbqrm2SNWJuhwI9EWOvlAVSGvzENpp6raSYaNvySTNgsNIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c27sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:57:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so753301eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139461; x=1790744261; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LaTyrJazqCQrK/3v09odbP4gZk6HlHmaWeeBLbXZQ1s=;
        b=K6kPgaGxMoidXGR7Yy7k0S9ffeHPhR3oNjE2VLjax3tQxs7nZke+eSE7U9XMRnL3kg
         GGMbLiyBnJsuYLAwxGtnZ/AMEKOm3MrfIhv6HlB23Zazq7lw31MNOTA0d3aeAjdjs5Uw
         AKbe+P2q6VRYobeFQkevV5QZz8Eijknt5pLjYAGpOIRdq6W1paOHUpfq8ELnU1jTCqnf
         /A9+e5xctYx2fHLEuQAFvgtXTtO+bMu7cdCiiqEA8t2R5mTnv5u63LayORJMOFEUaupX
         uglG7lsvgoQ6Cd8CPHLwFXwOdsrWVVmuE41dZ0HXeoz8mrOFThXsHO5IgS7p1KmTSZap
         qppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139461; x=1790744261;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaTyrJazqCQrK/3v09odbP4gZk6HlHmaWeeBLbXZQ1s=;
        b=NyQIjbf7B/ZiCiLuO86CHcY7VWLo3xEnsIORgzRNiHFxjvdHXSZnwDWHMhgqYEwXQj
         GH/2PlLZvn8Okg9snyy+KB4tRe0Gbqkbb+d3/GBi4sawfCdANUj0VvsFyz8PzbPw2jGM
         JWbxDUAbq9SVZZVXfOevFMejC2xQr5x5DSf+pc+Du9zjEY0dMN/+Lqcr7BKTZOfuu19m
         g5kj5b8qakwwfrIpyV8LSl/LbJzNACCQwzgtAkkxZuiFhIg9DDa363ZUhNlIlUhphnJ5
         Jhg745wVVMz5uNhaN3IWip2kS59fHdNs4rEAfHnVhJhOE/4+vtjtil6UvGjwQ01QVwuF
         A6pA==
X-Forwarded-Encrypted: i=1; AKwUvByDKYiMrbzgXAzoJVNVwhxwOSpIkNJ5ifgDKcKP2cItV6Qxc6Xu1fzME56OOPI/o+VWUHz5K6uNrZgH@vger.kernel.org
X-Gm-Message-State: AFuF++nqJlZrFZZZuh9M8Qj3ySz6BIps8nJx9xTMA5jBwxTnpNrCdCLz
	DT679LqmKKO0R4lqxKeBmwOo2fxyb2E4HCQh56IFSRwly8JI1ItGh4Su0x0dEDMDl+JCB9Gxe+N
	IRps3PXJkSlLcDu+cW6sELpEoGRbaINWA7BmZngJXp/xZ/AYh00vJuW1i/p3u6i0/
X-Gm-Gg: AYBFou2GNzJW/wPUg5hcTIR4L6r7Jha6AmnMnr6kwNIS1DySts40+lGT1CftGfHeAl7
	2ArFQpN3aqJd5wI3u0cZwvxzAedV8IgplNYmFhdGqe+/cyDPhVJBms9XHyHJ2rDERDbJPGPxqTQ
	Ar9j2qCy7juD8b7FuUTdME2hKvqzXyLcBaNfqgK/WKGkDKpWvQqw3hSu/GnO4sfI9c1TDyosVVp
	/kNyg8yUI0ZeMXItl+sdRduMhNyDDLYi7WMYaNlNhOaTefPAjdtZD+zMjHTJfRA65qHNyViXW5A
	oyVgp6XkFtH+ojtJftVDiiQ+gj5qXzceQTZ052VWuiDilsOS1NP2KPprmw801L+rP1yXodu5lIF
	/tAe24URxgKdRQotnV/sfMAfvTj9oUw==
X-Received: by 2002:a05:7301:170a:b0:33c:4cc:3a32 with SMTP id 5a478bee46e88-33e8bc73ea8mr1469853eec.7.1790139461308;
        Tue, 22 Sep 2026 21:57:41 -0700 (PDT)
X-Received: by 2002:a05:7301:170a:b0:33c:4cc:3a32 with SMTP id 5a478bee46e88-33e8bc73ea8mr1469830eec.7.1790139460681;
        Tue, 22 Sep 2026 21:57:40 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Wed, 23 Sep 2026 10:27:27 +0530
Message-Id: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdcs2oC/43SwW4CIRAG4Fcxe+4aBpgBPPkeTQ8wQCWtWhe1b
 YzvXtQmethteiH5SebjT5hTV9NQUu0Ws1M3pGOpZbtpwT3NOl75zWvqS2y5k0KSQEl9XZW3wff
 s17X2l4n02XOmTOQZiULXJj+GlMvXVX1+ueUh7Q4N398uu+Br6nm7Xpf9YgZGQI5eZrRJaWSBI
 mslnDMQIgvDkUBT8N3FWpW63w7f18JHuGJ/djtCL3rSGCVbNujNcrcv893Bv1+en7fjyh7lnSJ
 hxynZKPbgFIUMEtxyW+sIpR4owHFKNcqCVdpC1jaKCUr/g9KNChwQhAWjMExQeKcMqHEKGxUDq
 pAAI+s8QdEDJScoapRhTdmFEHQcafX0u1VW4DThbQxMlEW0ZqKNubexYmIJzOXnjCKRI3n0PEH
 ZO+XAjFO2US44dCQlcPYj1Pl8/gF50SikWQMAAA==
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=5770;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTOJ1wiveAXpZtw2XTXq7Nf2MHakkYTzq5oPmpfXG/I=;
 b=EmPMgmb3Us8EvsrZlA3s2nNjTIZPp4ZBqm+EIgIdr4tgP5n/X/WLzWSU5xU3LGg103P9t7jhq
 OrapwiEVbI2AIDOHU/xG75gF2yNsBARX3ceGpdtKPjGdEfkygEeChgn
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: ziNEhNR35hNODmMq0-e44KoqZTwO7XQw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXyipzFWQmQSg9
 zLbYojSpVcCAiK9jLEgJ+89QTO81Riuy93eE0uH34NnOVQb/rXccJolKJ+4OOay2AnmMWVfl0Vy
 L1Xy46BVKoCugudJD2qgQG9K+nXwiGw=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab35c46 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ziNEhNR35hNODmMq0-e44KoqZTwO7XQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXwZkmhLelaBps
 geI+NDqQwRGY6JL/GV8hO9IZoUcPsjivCRLLbGvjqx5fXYqrzvtXW1PTLiLg2oSRFwPKKLUC4Js
 CMpGehbRlG5RRnaoz3s2wrtNJ4j8CeeLgsL5Br5Lsc6OGi+6ve1o3MmDgi2sRhfwDBPokiKU1wA
 N+3UNdrx7rQZwW1KbEK4uWcp3NAE2YFaisstiM/Faye1unx4xRoxwE1omoJJqrx6R3yB/mETR30
 nrYtnrcFE3S2NKYrbAOxQ2EpbRYpTm2BeksJ9KMKosv33M12GABp6OVbR2lb58mGMqXt2H5Mrsb
 VpGzhV/C9OVrtbU81CXe14fkEIQe9bACFnEDccALZNd3lQhmL2g7SnIs17QU3aPrZikMV6c7XLU
 Jp7LvcfEEQXMzjLdfv3MSzU1r7eGgrqoDEx50kUWf5XwXNG9/h99bELMY2aMK82v1PyYz8VeXgi
 4yeQQEhFbssGsiQUKow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v9:
- Use suggested CAMSS CSIPHY port labels in the DTSI and camera overlays - Konrad
- Collected Reviewed-by tag (Konrad, Abel) 
- Rebase on top of linux-next (20260922)
- Link to v8: https://lore.kernel.org/r/20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com

Changes in v8:
- No code changes; Updated patch subjects to end with "for Shikra" (Bjorn)
- Rebase on top of linux-next (20260916)
- Link to v7: https://lore.kernel.org/r/20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com

Changes in v7:
- No changes in patches
- Rebase on top of linux-next (20260805), fixing the conflicts.
- Link to v6: https://lore.kernel.org/r/20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com

Changes since last v6 RESEND:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  72 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  72 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 4 files changed, 349 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

