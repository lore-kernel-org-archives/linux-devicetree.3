Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF1F37F32C
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853084; cv=none; b=jbn3+LGZ9hSsHfOZQ1oML4U/7Got3ttuAWgtlk0GRvmZoaP1DNOnLmhaIeYWGPk00w9sURJ39BMijVHdFa7qzhUyoo5jVcbFdI7AOZQVzNisB6wXhn2n4JGHWyd5z7Qx6/y6efFFVJLHdtgvQ7jqti04KR0xr4n56BVRGVA+peg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853084; c=relaxed/simple;
	bh=5X+jgygeM/R9MNvIWMo/5BN6WhjMIfX+055sFgzWCYA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q7xbjmTimipyu8k8kVICfW0o0UZS86zPlYnlRvxZlSUAY+SVHWeA265ow+piLyEQcDhm9vN8+pRZQIgy6Kc549umDxStSiRwaO3HlLS8fTtQ2D0WyDEiNB9pBhanmDcoeQP3h1e0s34P5fhjCHVXb8y1n3Pj+Q7Kn3T8+K2sNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZD67Lebb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWLTWP0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZD67Lebb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWLTWP0I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXqEf4178538
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xgZvAtnkh1TR5Z0rCcHGoM
	jGuVCV0EFXGJ3p8XQKkqs=; b=ZD67LebbZf8qCVux1rp9Y2wNnJkJCBqlrw5ey0
	ep0iMdx7y2saZsArzypCM2sGkxUMt8bSeCb/AawMR7eiG36cFqzvWmUZ4WEV5gsf
	rCeCaYfYK4lb+PwQ/NrwC+IcSGImogKHwyj5mgXOX92nRkqn/pqr/Ug8amNSPFPS
	Aps1Cr2u7HoEDdygr1fXj1pVrJs3ag9+4BAkV+FCDoB0ta78jLp1w5jqt2V6qC8S
	dmd/wWTt+0i7xI2g8xgaP2koiYrtFAFMHfD/Teqsk2FEbOrB8BNDmTQzu1Sa7GGS
	j6awogirQtvB2Z9SQz3qiuUIulmDwYIDI6ptXn4/CbHvk3cQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw11v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:51:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc15155cde2so211187a12.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853080; x=1788457880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xgZvAtnkh1TR5Z0rCcHGoMjGuVCV0EFXGJ3p8XQKkqs=;
        b=PWLTWP0I7kwIZCYTlv27xKFGt58WH2DySclE9BFGw04ppUNVfCL/PXZYgfYN1ZPIks
         3N6dTWNb3q5Zrgcv3U3bcxIENfCCrp+MQWyuusg0Dfu+lgwo2eC2FIzwq1JWUpS3j4bJ
         TjzRnacZ7fzUYz+fi022reaTrPwbQ1EyGCT5EnC9VGoRMUdUTCrJ7LILYMAjR48CFoPo
         0JuLpi2Tm2a681jHadm4WADAk9j8An7dQI84HYabILfyz5NL075ZTZnt7IkpAUIRu7/c
         DyW8mpLysYeMbB49n+vaoRVS+sCH7xm6UIDtmTdlhh10Tw/sSWYhB+E/j6XSGOhotzud
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853080; x=1788457880;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xgZvAtnkh1TR5Z0rCcHGoMjGuVCV0EFXGJ3p8XQKkqs=;
        b=e7OIz8s3obIH8RfA9PYpZG9O7pnYhprq8CLsXZiE4E1TaUo/UyI7jZTOMg4vuvAEe+
         6GwtgZ7wrj4JLNw0+30CnbwZWQqw9axK66Y2bK9458ODUtkg5vEqawn9HYE6GRWZPesB
         4Bzx/KaiIkMnM4rsOMZ5wwN2irIjVTAonmp6sk2nkuT+YLJ41z90cavjt/rVKCeBm4hz
         Sd14v+8lrUYGMbR9+wFyHicg7vG8T9Lo6S+DEGDkuXfbG+N6ZFdRAPYjUerRqVWZMK7E
         Wwi4sNcNsWZoDHLPJyYhfTxES0mwoHTFG5SHH8VitHTWXaVqedCtJGM8f/JMRf31BEZ0
         T0Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrNppg9vijoRillphocfa32EuOG9wMwLbv5di3BP0L/8sgmLTGkKkuY8sqOjcyMO9fvItvHC/oOjVv8@vger.kernel.org
X-Gm-Message-State: AFuF++nP/rGK6aBRILWe1dkD478eDwaqWtHheK7RLD5IhAumexmg/lPm
	xcA9kNP8xVHga3BJc8iMVcAGJDvfSDCz7xUNMx4wWZrYN3g4zFopSvimx48v/vJnsOegM/sVU3R
	RsO2I3Caq3+pZwQuXnNv53NXcW2GorlbO4q8s6WQnoxuxpoa7VBA/9uQ0VmMh0yOw
X-Gm-Gg: AR+sD12hZTnHbXNei0mYqSNxvcBsX/QuuQmav6kVjk8NAs9qSYYTsb8i2ZFU13NWuqw
	/qlpMOeSyjEj1klfnCoOEs5Mawdahf+jAiuGNRLH3E7l5SyCz+JDSxXGL/puzlFWXHJ02Sqsvuv
	NjtHF0smuQ2VP1YHZQ1lrM7vOhmFhts5FSrSGRk2rFsC3kTb9mgBbOAlFL3omt3XUYwNA7XDupq
	wLBOg7y8f+nx4zIiAqyc29JIk1zvMDI2rJfCEO4gCVzxjWoztEBwBBX/9PAmeg1gcGKNSqWRjzG
	GNbAPFcWMb9BY6gwd+HF8fivuG1Bup7G1pF1cuZfuw2k0jmFf2oUywtIDiQxsaYmLI9+sniBtet
	FlB0lmR1ssPqV9yUX73iipwZB7BvTXHDxq//N1TMd2+dTjaNrl6pN4wimzF3R//2YbQfNvubRBr
	b543VPbLfDo7SIbfr/Tcu0cac=
X-Received: by 2002:a05:6a21:3390:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d2685a9673mr866141637.17.1787853079480;
        Thu, 27 Aug 2026 10:51:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:3390:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d2685a9673mr866064637.17.1787853078944;
        Thu, 27 Aug 2026 10:51:18 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:18 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Date: Thu, 27 Aug 2026 23:21:03 +0530
Message-Id: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd5kGoC/33NTW7DIBAF4KtErEs0/BjsrHKPKAsMQ0PSGAdsq
 1XkuxenGy+cbkZ60pvvPUnGFDCTw+5JEk4hh9iVUH3siL2Y7hNpcCUTDlxBDQ29jV2kOVqax76
 PaaDMmbbmyiG0npS3PqEP3y/ydP7LeWyvaIfFWRqXkIeYfl6bE1t6//ATo0ArBHQoDVjNjzHn/
 WM0Xzbe7/tyyLIy8ZXD5IbDiyNAN7qRHrwWbxyxcjjbcERxWKOQtwKUUPUbR64dveHI4jgnpOe
 i8paZDWee518VW81BoQEAAA==
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=7496;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=5X+jgygeM/R9MNvIWMo/5BN6WhjMIfX+055sFgzWCYA=;
 b=8xX1WDF0njWw+gA0gYAOtfXvnEgBqUaS/mBYAmOoDsAEd5Iw3lH+VY1uPWLbymUp84ExSIPyl
 uOu3/NNsMujBKFJ/4TIyxutl+RAhR48MyCmfbPcvcpzVfLfPrJ8zWCQ
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: ifue-sZSU67kMpqAu3zYywTuwjP83R8a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MCBTYWx0ZWRfX/86k3rKSneyA
 SlIJc2GrryuVmpVPVMqRTNB9Z/z6IqFEDINQsdb8exoKj2Dhkyb0hQRCLNvC/65VfZzJUg8H8e6
 ruvaOpojwMixlEk2YOumDBKFekJJzlA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MCBTYWx0ZWRfX7Ocw9oEwkJRo
 51hsAxHpLHi7v1K+fzYxxVJYP1sKSjw+yYtGulwOSxwyGiBOqdZauA+er2ZRBevseIGeb5aaJ4m
 Fced2RTf26BlTpqGJ21u67JRQ3WjnjU8MZythrRr0y6SubsESIOqNhCpwst/loEb1yP530RFgnH
 t8vsKgt9glx2icrp6WfDO69wdPQgzZgqp0K2ZInGf95jQbIP0EWULJJXjvBTsuE2y064VdRrexK
 RK0oXG5vC9C/WzrE9kvpfAHcC2BPylgATvz1o7FTERsrpqyFkxzSA8KXIwseg2HzeN0QtT2qelp
 CLIWHhi3x7M8rLSOAb2NgVABt4AuRy4lM/PSkZRkt+gHrj6fXaDc2Iy2K8sZTfZzpwECVAw3HyZ
 KtTd5EFCDVh9o62rjs15hT5R1uT/g7IvHo+MSroZlM8rjJuyEIwKzbODPvXIUVlyaVZa3l5Ijzk
 Rf225qo3oFW0Fgx9Zpw==
X-Proofpoint-ORIG-GUID: ifue-sZSU67kMpqAu3zYywTuwjP83R8a
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907918 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WLf8-PhWrFoBkVTCP8sA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270150

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
the essential SoC infrastructure required to boot to a serial console:

  - Global Clock Controller (GCC) and RPMh clock controller
  - RPMh power domains
  - Interconnect (NoC) provider
  - TLMM pin controller
  - PDC interrupt controller and SCM firmware interface
  - Devicetree for the SoC and the Kuno IDP board

The soc: qcom: geni-se patch allows the GENI serial engine driver to be
selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
depends on.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v5:
- Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
  (added in v4), so like the other Qualcomm GCC drivers it must select
  QCOM_GDSC; otherwise, in a configuration where nothing else enables it
  (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
  -ENOSYS and the clock controller fails to probe.
- Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Changes in v4:
- Addressed v3 review feedback:
  - Registered the interconnect NoC provider from an explicit
    core_initcall() instead of module_platform_driver(), matching the
    established qcom interconnect driver convention.
  - Replaced the NA mux-slot placeholder with _ across the pinctrl
    PINGROUP table, matching the upstream qcom pinctrl convention.
  - Added minItems: 1 to the interconnect binding clocks property so a
    single clock is valid (system-noc), and aligned the binding
    examples with the sdx75 labelled-node style.
  - Added GDSC power-domain support to the Kuno GCC: the binding now
    defines GDSC macros and the driver registers the EMAC0, PCIe and
    USB20 GDSCs, so #power-domain-cells has real backing providers.
  - Split the cpu-idle-states phandle list so each phandle is on its
    own line.
  - Collected Acked-by / Reviewed-by tags from v3.
- Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Changes in v3:
- Addressed v2 review feedback:
  - Reworked the interconnect binding clocks: dropped clock-names and
    replaced the flexible min/maxItems list with fixed per-compatible
    clocks (aggre-noc: 2, system-noc: 1), required where present and
    disallowed otherwise, matching the sdx75/glymur shape.
  - Made #power-domain-cells required on the Kuno GCC binding and
    declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
    is a power-domain provider (following qcom,sdx75-gcc); the driver's
    GDSC support will follow separately.
  - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
    a distinct qdss_cti_trig1_mire pin function (and allowed it in the
    TLMM binding enum), as the duplicate funcsel-2/3 entry left
    funcsel-3 unreachable.
  - Collected Acked-by / Reviewed-by tags from v2.
- Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/

---
Hardeep Sharma (15):
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      clk: qcom: Add Global Clock Controller driver for Kuno
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      dt-bindings: arm: qcom: Document Kuno IDP board
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  118 ++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1483 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  988 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 26 files changed, 4271 insertions(+), 3 deletions(-)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

