Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30684FC32E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675325; cv=none; b=D1TJL1eu7Mi7Ttco4v12Sv61VbWDZclSXL2Q3INugFDAwi5fhVlR+bX9E9ew4ST2cv7rKhg2HN5nL8XfNk21hSZW++npqUi/wRF7XYucRzACdYERsQKDPSYG7T4X7NQylECipMB3hYbJHrudArXjTry2xx0fC4ohdWe9mYOOv+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675325; c=relaxed/simple;
	bh=wpcklggz//RM4632A+rynQyRCph9z7v/W5D75CnlKIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BeRrYuormPB8rP9b4RfQ86oSxGzsQmT7zqtCm4AiJU3gIfk9ICakJJ3zMfYgST809r0U0eCw2e+73ie4xPxVeVpDUD6DQZPOjuAIO2xmTCrEIjvb2H06LIXJ3Ln6ZZzEs1OPryH6B006mTi5EgPL5bKQgcSQn4pRHqYMnIlcdJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVF35kP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V99Rx+BR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVF35kP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V99Rx+BR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tha6761151
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GVK2Q3DoCZlCLt3MThyL5X
	hWVbt9wQAr3FM0Zr86Pbs=; b=KVF35kP2kzzECKWgHRl1UDNVqS/X4glbm9XavD
	JiMJSPPukdt3j/9f3H20CHczBZ+/KOCWZbu9iCELfILBUZeFw+w+owFsuVxl9Jrx
	2fPNfObP1PgqhOUmjwoX1UITYWnAGKOreDBNbkjR9RTCBCwJa7ytrActbuVzzo4I
	csLDEBW88WO5zoexgUPoHijEH+NVCrxSTkO19ahEHoMxu0icFKnsTUsDxWU/bQyI
	cSUv/kMYI4fB2MJKYo+uY5MkvH2IZhDvaK0WoabS4CPQEHqwiNi4j8z2dG4Dlc0X
	rCnX5CMY0+zeE7bj2PFIVYrBJJTGUiRcqp7B33iMQs4QbtFw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03kbnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342b66c0b06so837568eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675321; x=1791280121; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVK2Q3DoCZlCLt3MThyL5XhWVbt9wQAr3FM0Zr86Pbs=;
        b=V99Rx+BRw/qC9+f4GksDUMUxTMRzm2j/PX2uYJGp40Rasi6d29GAYi+eGwUZO8WBv9
         gPfzxJ3X9NG+D1so439r1gmT5MmD0ItVrSlQvAZQJ+4RylS3/XaSCWRxZ5tBXkYvAI87
         zdfKGZbCFSuG+BICwumb4ttFLLrDpPtp4PtjHfW9ON/oBymFNck5sQJWvHJM0WMhPpb4
         yqLTcQ21DqzmNLMdyNEFE9ksKqg5fFBGqWdJYAGrsnkt9wkHo4VrDEkPNbBx9fd1hFAc
         KocsPcTcrsXtMtfY08ZFguBupdhszZgP3vZD+F1Fcsxw03o+8lopFW3d9cbhhlyGS/Kg
         OSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675321; x=1791280121;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GVK2Q3DoCZlCLt3MThyL5XhWVbt9wQAr3FM0Zr86Pbs=;
        b=u4ZLGS/sDYIk90CYceMDhOuXxraYqODGTfxmjr1wz55JBfL11GBK90G2taGvaMWNCz
         EQIKVpkNi8ysNrAfR0bPKnM0EMW8ivv1rRs3s472bn18jgoe+0UXU7widM5nYDqGgDQg
         3J4cmmbkTMweqmNzn9gfnsfc9FgChnWJigV0cVnEiYqiOnhBM5aNbGOW+2wPV8EsVYdY
         GPXI1k48YsIF2P/30Tm51jqldQlUKHwKPnbvIYJx8XCwVn3g7sU0gxZ1fybHxrsCE4T9
         7sAghsJ58HE4acwE5yQjLmvAew26C+O89xFiyQUB3RiZf2shgPhVWn+tBq/lQbgs3b7i
         f8dA==
X-Forwarded-Encrypted: i=1; AKwUvBxUr2EuAOHtWD6AgevD4qHA0cMopOxyHfC3lq0B5AzUqcpsGXZvCjGfqotjwzyr+9qFUGOHRVevreCw@vger.kernel.org
X-Gm-Message-State: AFuF++nJVvZ/XPSXOl1DOZysU3aa5joEC4vp8XaKO8iLniPFaKrzFPPV
	BkjRR+YhhYNNVB1DAdiXcdYr8ARWAjcmOPFnxJaXuswDrTl4MJrC0ANLOpH3fFkKsRaFnchw7oR
	cJL5dtuzP0BA8uA39O17Xd2sl1uxl11DLNx8jD7agOkE4pib8luPjjKVmj3EGb4hG
X-Gm-Gg: AYBFou2TniWGMW9NtYbO70TtPUfkDsFzc7GFI107+tRvq2iqcZcw5ukQqLLIUDqj7XV
	2boV+A9yG/mgXPPcnKe1nMHbcIHFRRmY9Czcy7MJRZB3WWoWeG11ysD48mPkSJABuE+Y0asDL8v
	2HtdstbSJpciUf51CMbtCP74AD8scbG/Sj/fgtZCx5NjVzhsXr0Sl0VnEZzibKMoc3Sk255iLdk
	oEeNYbAgD4T2Pn0ojAIeG0Y/Hil1GakZ9B8efk8vRO4Aztqa0R7F3jMPpG3MWZV8csnWJeh2rMT
	/9AFD+h+dTUwFJYkPQdUJ9WNyk3vUXViA/GLlakGC/gobC98no3QMGtj1nn1Z6XrIAsuACQq/HU
	blGFyivKTYCRecRJoRFt3MR8E1mnNnqAn/jaAqLlJ/rAXR738w0ueWVlpIlh7kP1Jv2py0SUa60
	qU02fFtpxwReoa6j44zQCRNKw=
X-Received: by 2002:a05:701b:280e:b0:147:1950:8b70 with SMTP id a92af1059eb24-14b2affd397mr2382716c88.2.1790675320674;
        Tue, 29 Sep 2026 02:48:40 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:147:1950:8b70 with SMTP id a92af1059eb24-14b2affd397mr2382680c88.2.1790675320044;
        Tue, 29 Sep 2026 02:48:40 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:39 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
Date: Tue, 29 Sep 2026 15:18:05 +0530
Message-Id: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWJu2oC/4XQzU7DMAwH8FeZciaT89Gk2Yn3QBzy4bAAa0rTV
 qCp7046DuzQwsXSX7J/tnwlBYeEhZwOVzLgnErKXQ364UD82XYvSFOomXDgClow9G3qMi3Z0zL
 1fR5GyoJ1LVcBwUVSx/oBY/q8kU/PP7lM7hX9uDprxzmVMQ9ft50zW/v+4GdGgTYIGFBa8Jo/5
 lKOH5N99/lyOdZC1i0zv3OY3HB4dQRoo42MELXYccSdw9mGI6rDjELuBCih2h1H3jt6w5HVCUH
 IyEUTPbM7TvOf01RHBanrLbaNYHYc9esYvvVnRRm1TNloo/PO6w1nWZZvuryTWzECAAA=
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=6159;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=wpcklggz//RM4632A+rynQyRCph9z7v/W5D75CnlKIc=;
 b=/QIFMI+A7h5xadLWVcBAVTuauEJdNbTwcSXplp8c+HNYYBjAj4co5o96PDl3NIRagSQVf/Wsv
 zdB+QlTAEP5AaVyAKKTcrJ81F3rdOvMjCbKLcVOcN3dqg6awO2lVJpv
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX44rL7z2WaccU
 FNsAGhwO52h1GJqDGE4Bj5GK2m/9jH7BzCVo7lVaqVBgxZW0PnySrfF0rPKLhGK9yce9+kMCmZ7
 xusAlRFrpgidh2lbnzkrQnFF5QBGfiE=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb8979 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8riaqLHWwNYsoh2d4OYA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX4Wda1/1i1/Wz
 DmCrkfffl7nURI+I67y1dDHAkcWFHllaKgmwh0eBNVPA8o7V7xe1N88ydGUpfPRqFbtsbLjJ79N
 eHjWhsUZf9ScHdAnYDPSjT8xqn0JRjxeTq2ko09Sord8HUNVCxOPtDqttjA6zJP+wVm1p+E7cJs
 gbi8hr3S1uWstUEFdHOH9f///xLNLqOGAHLne7bGxoMUwrSvMBs/lNhOnAsq46ZxJQ/WtciTlW4
 N1X85pnK+FwOPDFxWDSEtMqU09tMewRa6Aa+j8cJFBJ7yDA5Y08e6P9fX1wUqIXLye7GeyD73wQ
 6GT+7yjwdkX7WwCNkDBFDWFa4n03mEa3hRMiIamWkPm4MCajC7wEI6aMFDqe2xXKwTeSIlamr/6
 KtjyuKC5TkzaHxnx5TGRQjgva4XCPb4Tezkq29No6Eys3JNEs9XZMGWtJ1hoR8PkjQKxnkrk9r/
 IR40KMXj7MRa/LK0U3Q==
X-Proofpoint-GUID: z7WqaXMiAsRqOShdgPMMiZdn_uCdJKVn
X-Proofpoint-ORIG-GUID: z7WqaXMiAsRqOShdgPMMiZdn_uCdJKVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290038

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
series (bindings, GCC, RPMh clocks and power domains, interconnect,
pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
only the SoC and IDP board devicetree, plus a small geni-se binding
update that lets the QUP wrapper use one address/size cell on 32-bit
SoCs.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v7:
- Addressed v6 review feedback:
  - New patch: allow 1 or 2 #address-cells/#size-cells in the geni-se
    QUP wrapper binding.
  - Switched the QUP wrapper to one address/size cell with an empty
    ranges, instead of the explicit 32-bit window.
- Link to v6: https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Changes in v6:
- Rebased on next-20260928. The rest of the series has been applied,
  so only the devicetree patch remains.
- Addressed v5 review feedback:
  - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
    that all PDC-routed wakeup GPIOs can wake the system.
  - Added wakeup-parent = <&pdc> to the TLMM node.
  - Replaced the explicit soc ranges with an empty ranges and named the
    node soc, matching the other 32-bit Qualcomm SoCs.
  - Widened the QUP wrapper ranges to cover the whole 32-bit address
    space instead of a 16 MiB window.
- Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/

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
Hardeep Sharma (2):
      dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and size cells
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   4 +-
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
 4 files changed, 472 insertions(+), 2 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

