Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E8F35A3B1
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514474; cv=none; b=WOSwLzhBIeNIOa9HoYLvk9ZcRMub+TQIr4SXnou+UblAqRkNyZGPaVc99Q1yO54zYcpi7AAWdb9+tAB1/mcsQ2C/udCcZJCEZsc6l6o1P+wOD5z0pR52WMnauN5IgPWj5F5iXAG0KR0wUKOZwtVAQXFaD0pRFDRcrn1r+zDN5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514474; c=relaxed/simple;
	bh=dW8dtvdOWXTOsuhmDT7Lvte4ZZrHvQEXiUGRjank/6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rxYC1c42lzIQ92AUVAb4wPjADvlxMmg5+IWPegAEzbFfwnvgpg87qjZD3s8io+TPeW8ualLyPULteQOs/tsD9EDj9fDCly0ZaCpZVDBOknUin+sARlNp7o9m38JaL4c5HTk5DWW3w5tdisc5TZTrTTPb8UM1txtMrvcn+WPh7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZ4Sl6wH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbUJnko4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZ4Sl6wH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbUJnko4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG6xc13405766
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VYRnb6gkMbejefOjn7h7dj
	gSzVLsj90Wl1eJ9TYl7FU=; b=RZ4Sl6wHvqWeygvOR/fqRzMfgliUL+/NpVpjy5
	eaeePkkyKGhNFywu4abyYwaAhyJ0hxxZ2GYrpJDPw0I2YekU3H0qJGgIefyThi5P
	TcGzhMTE2N24nNQjWwdqxZvwsNgYZ+c8h3XxW6GBFyk0KyQKWC60VgsNPu1T9r5j
	gQ/d486HgkrEcr4NgDz4ySA91ZD+y4REvTy3eLv5JVG+QzJfNbn/HfCuxQpumaEQ
	YRRryGa8ZzCnnJgqj9U18CjnxjqiWmUPWPytsy2oD7ZTq7kjE4gizl0ykkPG+aUh
	w+uK9skGWCkx3Q90llZKOw0TB2h6MvLRoeXwgL1L2pUmpgCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qvc88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:47:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2423621a91.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514467; x=1788119267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VYRnb6gkMbejefOjn7h7djgSzVLsj90Wl1eJ9TYl7FU=;
        b=QbUJnko4/zcIv3OYplDZvCxpTed4Kra63DguTa48Hqo+c2jG+JCUkL6u3GUe8wWVHH
         jsFf/oN58/pw0X4J5k9qu3OApKqdPr8B2nld4WWqXGSUufNyhLrEvIgg93/1vRu7l4c9
         dcbRMG7/9r9uHA0XwewBi3l5U1gvv6kO/9KaH3UDoAwnRfdKsTv2LO9bIr8vzjwhS1vy
         UxqHdnfBA8pWFfW90Poh8xozAomElT9sOcn9aoWFTdV8qwJMZAvIBAwyi7LQ8UmNy/FZ
         4o1e4vgnaNafppIlAOf9GzvdVKG/Wyv03T0lonzN96sOdY8Qux3Vc71caCWTkxVE9PGg
         yapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514467; x=1788119267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VYRnb6gkMbejefOjn7h7djgSzVLsj90Wl1eJ9TYl7FU=;
        b=e5pdfoUab8f2a2BFp1mnhQEXRFooMeUO0mMmLZvBFHQ8ruzyMIVCgTSpm3pG9TOUWM
         L6lydpjrlfCbVIWnmsyoEDl3N21Xe5XanyteJjANLtVsJUYenaNBHhwatU9Rd8sQ/F76
         0D8muPbeanFW3lBkkCa6KLO9rU55eN4Bnd23MArQ76M9nzUIaHXuL9+YYhE4N9Ol7oIO
         WW+5SCNYz5qG2M6OFElqW36kcf1+7VBthDkXGJzN5iZeVV+GjmOtwbfwLAxIG5wvGUYg
         vf1N2EyUkaU4EUkhNIeO9EJs/fBr4wXjK9+1dK8to0k9hP52ltgSB5gpL8NXNkT/czMG
         upZw==
X-Forwarded-Encrypted: i=1; AHgh+RrDlltGj5ruA4MT/wEjbixqIHyx63XKB5K8o4teYUQjiSH9Ox9CIAfBKV7ugwDji33X8hV4SWierC23@vger.kernel.org
X-Gm-Message-State: AFuF++n/8jLqKJgjmbgojRZFKTuuw+AwLQE2BXiGcdnQlniWkH+BUbqt
	TecJa3S1YqdwQOIhp8RQprTFLn9GnTvruaGyphQUlvE4Sg5mGXlfzjG1IWnMDVhuEzljwmwgt+H
	igPuPjQRzkK6B9gk5zbcdr00h3ro/YToI63xfOTmopzAQeWvIfC6D4OquCiMk+AzS
X-Gm-Gg: AR+sD11mBwaYaJ73GJJyrDf5aL7vW/868FXKn5dwtQHgGyPp1M60tQg457lYvaCAwlL
	YhXKUw4gX7ODXi+AlOk9X3r4t5C6yst4PeZK7+ooe5tH8NmL1iN2H3l51qCd/OnxQKyJo+hBWMN
	mBdN0UHMo/y0TwKXutB0tp338q7mqe5lGhK5PbZ2uSNR01DlllHjGLd/xvasAeXYxS6M9/mupI0
	xMMYlsmQQcMzg0ETeYGKFYb2gfN3wwD/d47dlAUz9y7WebINGTcIy5iBD0ex7fPQ6lTer+dklqH
	RNwmlj7Zc1uu/q5VwXPsJzGyntvpC49o2ylskVcJ69vMc1SIUFjdGk00Rkt4mgvWYNCXJ8UOHmw
	RKavXqBivTz7mkBHvdr+G1AFDoupHQnE60GAj2w==
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr20935460a91.4.1787514466633;
        Sun, 23 Aug 2026 12:47:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr20935406a91.4.1787514466083;
        Sun, 23 Aug 2026 12:47:46 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:47:45 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v12 0/6] Enable ICE clock scaling
Date: Mon, 24 Aug 2026 01:17:37 +0530
Message-Id: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFlOi2oC/31Py27DIBD8FYtziQCDjX3Kf1RRBMsmQbWNA7bVK
 sq/dxNfeuplpRnNzuPBCuaIhfXVg2XcYolpIiDVR8Xg5qYr8hiIYEqoRljZcZycH4gF5DAk+OI
 F3BCnKzdNCxK6oJVDRu9zxkv8fnt/ngjfYllS/nlHbVK+6N21Ef+4kpILLgE9WF+r1vhjKuVwX
 90AaRwPdNjpucdlvK+0YNkzmXeF3EgUl76y2DXWhBq0hNqEIH3dhksrgjVa1q3z4NXFO2B/h/f
 VXlB1r2ZnHEc4l3WeU164VxqsBm+E0f3WUYnnL4Z1nBFOAQAA
X-Change-ID: 20260819-enable-ice-clock-scaling-567c1c9d42ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: sGy9ZtdT-HYLQGxBB3EIyb-g9neiY37U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX3pXp0Csq6ABJ
 VQj6EBzCJrASL+zKcskS14N1xm7bLgOa0lqX7GCgpBodgv+g4ZpNWcsMm1NpJZJVT08VsvjKU/f
 Kr+f7z/4N84eUhNegMA8zvotsqUfWivlJos/0+yMIgIVxJvbvBFq6KCLVmnqbnxZPcRVxyY7Vhu
 WVoH5u1QJ+LAsN+0/0fMR6XQvkahqxh2OSJgW8C+W9KhE0vihQ3NvcsWMCkjOYhjVqzcX2ICeES
 lNAbnD0lY5p//wsHd6DDvTr1e9OaAoeXW8ssyTz2/bucKF98bQxacRha0LGPkt5blDu4/+IFtWw
 +vw0ypgEzrelwemhDSJu9fCAhPLXWnnGwwQUrpXawU9QPwZ9ubhnJfB9J/Qp03qvTM34wOObV8q
 Q5ZXaK3BKzt/tNyG9eKqS2cx4KEA1LCrD+fuLwyc5Jk62YtN4yFNPDh3xk6enZ7Ltk3CBoXK+VZ
 HLylAaCgjziRgqHDLWA==
X-Proofpoint-GUID: sGy9ZtdT-HYLQGxBB3EIyb-g9neiY37U
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX07TUiQLtC4F/
 fPgSwD7h/onhUCNqZfEA9+wOQO2Ub9cLdfKOA5NjpcsLLoEO/gAHeAfEC+EmeIxXqANZU4D5GH2
 i4UCYmboTUH3J380SQ9/Ng6RK6/PECM=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8b4e63 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Exo_CllCKnlFIUbYcS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
using the OPP framework. During ICE device probe, the driver now attempts to
parse an optional OPP table from the ICE-specific device tree node for 
DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
and is invoked by UFS host controller driver in response to clock scaling
requests, ensuring coordination between ICE and host controller.

For MMC controllers that do not support clock scaling, the ICE clock frequency
is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
consistent operation.

Dynamic clock scaling based on OPP tables enables better power-performance
trade-offs. By adjusting ICE clock frequencies according to workload and power
constraints, the system can achieve higher throughput when needed and 
reduce power consumption during idle or low-load conditions.

The OPP table remains optional, absence of the table will not cause
probe failure. However, in the absence of an OPP table, ICE clocks will
remain at their default rates, which may limit performance under
high-load scenarios or prevent performance optimizations during idle periods.

Testing:
* dtbs_check
* Validated on Rb3Gen2, qcs8300-ride-sx and LeMans-evk

Merge Order and Dependencies
============================

Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.

Due to dependency, all patches should go through Qcom SoC tree.

This patchset supersedes earlier ICE clock scaling series (v1–v11) with updated dependencies.
Hence, this patchset also *Depends-On* the following patchseries:

[1] Enable sdhc inline crypto engine for kodiak and monaco
    https://lore.kernel.org/all/20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com/

Similar to patchset v11, patchset v12 is rebased on top of latest changes picked onto linux-next.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Changes in v12:
- Rename ice_mmc_opp_table to sdhc_ice_opp_table.
- Fix typo and remove redundent comments.
- Remove caching of the core clock frequency as suggested.
- Move sdhci_msm_ice_scale_clk() before sdhci_msm_ice_init().
- Link to v11: https://lore.kernel.org/r/20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com

Changes in v11:
- Include 20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com as suggested.
- Link to v10: https://lore.kernel.org/r/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com

Changes in v10:
- Rebase on top of latest changes for ICE driver conflicting with previous patchseries.
- Link to v9: https://lore.kernel.org/r/20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com

Changes in v9:
- Kodiak ICE eMMC OPP-table entry corresponding to 300MHz is updated with SVS_L1.
- Add 75MHz for Monaco ICE eMMC OPP-table.
- Fix error handling and initialization of has_opp variable.
- Pass ULONG_MAX as target freq instead of INT_MAX from sdhci_ice_init as it better adjusts the data-type of
  the function qcom_ice_scale_clk.
- Link to v8: https://lore.kernel.org/r/20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com

Changes in v8:
- Instead of scaling to TURBO in ICE probe, sdhci_msm_ice_init calls qcom_ice_scale_clk for setting freq to max.
- Fix error handling in qcom_ice_scale_clk.
- Fix error handling in ufs_qcom_clk_scale_notify for the call to qcom_ice_scale_clk.
- Move the registering of OPP-table to qcom_ice_probe and remove passing legacy_bindings argument to qcom_ice_create.
- Add OPP-table for kodiak and monaco ICE eMMC and UFS device nodes.
- Link to v7: https://lore.kernel.org/r/20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com

Changes in v7:
- Replace the custom rounding flags with 'bool round_ceil' as suggested.
- Update the dev_info log-line.
- Dropped dt-bindings patch (already applied by in previous patchseries).
- Add merge order and dependencies as suggested.
- Link to v6: https://lore.kernel.org/r/20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com

Changes in v6:
- Remove scale_up parameter from qcom_ice_scale_clk API.
- Remove having max_freq and min_freq as the checks for overclocking and underclocking is no-longer needed.
- UFS driver passes rounding flags depending on scale_up value.
- Ensure UFS driver does not fail devfreq requests if ICE OPP is not supported.
- Link to v5: https://lore.kernel.org/all/20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com/

Changes in v5:
- Update operating-points-v2 property in dtbindings as suggested.
- Fix comment styles.
- Add argument in qcom_ice_create to distinguish between legacy bindings and newer bindings.
- Ensure to drop votes in suspend and enable the last vote in resume.
- Link to v4: https://lore.kernel.org/r/20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com

Changes in v4:
- Enable multiple frequency scaling based OPP-entries as suggested in v3 patchset.
- Include bindings change: https://lore.kernel.org/all/20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com/.
- Link to v3: https://lore.kernel.org/r/20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com

Changes in v3:
- Avoid clock scaling in case of legacy bindings as suggested.
- Use of_device_is_compatible to distinguish between legacy and non-legacy bindings.
- Link to v2: https://lore.kernel.org/r/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com

Changes in v2:
- Use OPP-table instead of freq-table-hz for clock scaling.
- Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
- Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
- Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
- Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com

---
Abhinaba Rakshit (6):
      soc: qcom: ice: Add OPP-based clock scaling support for ICE
      ufs: host: Add ICE clock scaling during UFS clock changes
      mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
      arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS and ICE SDHC nodes
      arm64: dts: qcom: monaco: Add OPP-table for ICE UFS and ICE SDHC nodes
      arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device node

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++
 drivers/mmc/host/sdhci-msm.c         | 22 +++++++++++
 drivers/soc/qcom/ice.c               | 75 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c          | 21 ++++++++++
 include/soc/qcom/ice.h               |  2 +
 7 files changed, 225 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260819-enable-ice-clock-scaling-567c1c9d42ae
prerequisite-change-id: 20260629-ice_emmc_support-b24c84cb5054:v9
prerequisite-patch-id: a229be72d68ce7d70db2352817e078f8d2a6c754
prerequisite-patch-id: f9a5d5c31d614334d5959d64011a38862e31569b

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

