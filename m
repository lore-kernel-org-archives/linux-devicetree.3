Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995739E9B0
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955311; cv=none; b=Gw516bUtgki7v2hZai7PYXYuLXeIuIp5J73+M4PlHkBqzGoF9B/malp0eQGPu6r6UKq7FylvarjuHjZG/JIhDBr0PB0xUU6p/C/4Na0NTxGaQ3tLPEpXIwGNm/xn5/yWuigct3e/RMLFNi8OSfS2a3GW0doZoe9bBldvAZUe7HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955311; c=relaxed/simple;
	bh=nrZYGFzr8IZXyxGpc+0LrwJysh3RBadIt+2SbXWBRFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fEPRgbrTf1Uv9KiwO3rjKfO0kUiiOe0IiUWLgHLsxcavNxuzgE0lPbd2HLJb2AQpsA9iQ0x5zzdKOUVaWJ0vWnfafouKq8y/sZJk94ulydeL0E3scUV+PRNNVH9Q8VOFa4Cc3C4KxKB21JuioG3Hazwv+9yOlXy6nrwx5MI5PvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBlztbs7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QkoFaI3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBlztbs7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkoFaI3B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwSgV326748
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 21:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mWq0AU9C6OVh2GLgy25XjU
	THhsURv6Gged43d7dQWE0=; b=nBlztbs70DC2R/M51nK7Xzg6vEIthOhTlk94y8
	25OzwLfxMsC9m31P8lVB2eDarAtkJ9zLTSjMYXEX6upx661np6EnSdYlz/FAC9PN
	Ou8wlRrvemqKYia4siIQBCTm5E5Da+nfI3R3h2pRK5TDzBCA13We61ZOVKVB12ns
	A9gcj2FgBNED/633ubQnle0650HZ9C9qdhJB3e47LpizJN6yD8omQcavIQepQ6Jx
	/R6XAt7WTZoYzmuazQpt7iYYiq7jZgkyeHJ5uZPk6dg3BJYpeQhK3K6Q2VY5ymt0
	cmwpuj5PNwTAdb/tmG2WWogm2hu+GBkpisXokpZbCKdUUhaw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8k3gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:48:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f544944so3554862b3a.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955308; x=1781560108; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWq0AU9C6OVh2GLgy25XjUTHhsURv6Gged43d7dQWE0=;
        b=QkoFaI3BJnZ9kvBapxruUNDhAYmaXDj7rNK9UgEAGuQgZOQSiXrzeb0HF5exiRsBZK
         ZvalEnofafnGT8gW2QqCrrVO1qXGe1gnlyFY33z4D5e0YThNe700Q0sEckBoeoWmB+NR
         h/1AmG2Nd6dSqxoBl0LD8pp6W+liNtQrY3nV4H3LxyuOpKqofaQ0bZTTBgjUqik9fi3X
         YTIT5mxijKMd77MABlbvQMNNA3rbe2xxfDBrBOpkn7ED7eoOMvox7hqGjz2fhRWr/P6r
         YkqCbg57SoNHDez1CNW6Y8SbFPPp2BDu3u61btWBs3NmVkwFNe6w/489yqv7HxZ+1001
         dnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955308; x=1781560108;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWq0AU9C6OVh2GLgy25XjUTHhsURv6Gged43d7dQWE0=;
        b=SomPR1BtEqTrAzvgd5yYBSaI1m3hA1ChuDZWu3bPWSZ0qQxub6u+I+86I628Kjf4kH
         SC14ejcDI7y77Z9hoAh2ANeIWbaXcS/7G7LnLp9Nzk1P6LPxbjKK5r8R09LJICNVqN/H
         xwm6GzD8fJkxKd2KTPHVdXZeRqT6HpJ4fXgEzdN9RfnIjq/pP33xtDs+VcumZg/tAckJ
         5FYNBZauiJ8MVr0W06TfGA10UFq6HXmOqtfAOEsT0y4PwF8G8lKWO98ayrq6ieQJPWdG
         CUa6VrYXsQdF5qCyonZXYOLMX3oBnxCu2IPlq2RJJSepclJIufE5KDqFCNb5eCQtpkgE
         XTCA==
X-Forwarded-Encrypted: i=1; AFNElJ+6r5ZXTHT/uAiETCYqtMdhNvPyTDqTObEWW15SC61uDVeUbWz03+0Gg+UYmdnmeUUBq28eUzFtHzAM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2gVAWbLBQHVlOnFT3ZN/j8Ka5NCGh59MVVkSzo1WbCfxkes3v
	AwjoTFMJiAvZWqu13joa71UacAxmSkdfRzeAH4H50UsywOUeOvAXLI7h0kKrEFwgoGJJbroHbJ0
	ID64qq+GZY8MQM8fFlmKWpHCb/76HjWkwDb669WygozQWilHdG4B3C+Mcue+uU0SW
X-Gm-Gg: Acq92OGeQP24+ARoqGjwAJSR4T7WtY533JAA90pnz4LLWvAJzuEc3mgKaL07uihQ+8x
	e/zao85PGHJ+ZrXcWSwth9eaLula1+hbaC3MXnGD6zQ9mOn7Nytu/ld5wSOFAKvgZwa1xSsFqv4
	FCHOJoy4+hCXqlVT2JdGvfFA/srO1EJGXYkp84KFncHbh7YCBzQ27VMBXesvvDFEas2jVP8yl6r
	4Bpw0SysPFQ+xDuwETiZUO65TPx853nAjEt3RyNXvOpgdb7DsLGGxvXE97XeChf6h2jwkrfyTHv
	f+luX8HIaPnG5OPkrZ9hScDMxrlu9u2bdDBIR6PImRD30dGtxYUfYiRY1awz/MKTl4jyWt2Av+7
	HDYLpuxewcbFbcDuKN8VdcCj+RQV3Lqaa9kkOoJ0Gtag9KlWcDOdQaP/AsM4V/bJhEZ4CRw==
X-Received: by 2002:a05:6a00:9506:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-842b0e8dec4mr17991709b3a.20.1780955308242;
        Mon, 08 Jun 2026 14:48:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:9506:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-842b0e8dec4mr17991672b3a.20.1780955307717;
        Mon, 08 Jun 2026 14:48:27 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:48:27 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v11 0/6] Enable ICE clock scaling
Date: Tue, 09 Jun 2026 03:17:22 +0530
Message-Id: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGo4J2oC/32R3WrDMAyFXyX4eg6yHTtxGGPvMUZQHLn1lp81T
 sNG6bvPSS822M+NQQf50znShUWaA0VWZxc20xpimMZUCHGXMXfE8UA8dElgEqQBA4LTiG2fVEf
 c9ZN75dFhH8YDx8r6zhaqAKlY+v42kw/vO/vpOdXHEJdp/thHrXZTb1At9d/Q1XLgriqMUGQdF
 eXjFGN+OmPvpmHI08M29irgC2hA/QMUkIgttKWsCqWVNr8Qrzf7M53OaSPLLQNrMSZaagpLnfk
 SvRXYOakA0VqSSikg5yvdOtti19myAuy2TQwUI+6brLP73aISIITSusxVUWmQXPCRaMaXPE5j+
 OHogX0/R53tjALMlq+hYXDNHrJJU8OSLshJWK+ME96hrleZEl0/Acgo1lHrAQAA
X-Change-ID: 20260601-enable-ice-clock-scaling-a89fd9434023
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfX5zPYmxlvW0DP
 pOlQdncPKFdlVCbejK0NPA368dabtjkWHZ/YuWPWSJfq9WJVCwdfYPGW+9IPfAsguawUY8O6UpT
 /kPMdSTBf9j2PDqO/ho6h0ksgxOiySUm2kxb/PkPXIG98j54+bFAliJ7ouWWSpMZkWAZ9/+Wau0
 z9866XTBBUT4R5f3e5QPoxU341g67Zh7dZaVbk/v10ujwnpYnn9HYfEqa21sT2c+g6c5jWq5+jt
 fTddeK6NqjrK8ShaGhD+lkTotft4FEIROzc0OGRR1b/q8ug2+k2DHHOPQCmK9q0DcR02bZT970I
 RbDo/FgGcCoinQJWMzT/elKmRxxSzD43xqL7WWBhGTL6OJTntoT0lLjIdQVZ3AO5js8kmuQF7+8
 QsI9i3PuMX3HhARPvvPyNedxkD1RoU2Y8U7DGkOxtdtIEaa25P5QmjGSU044vgeCtSAG+DqogKY
 4b0SWfuwgfVoCvN2yKQ==
X-Proofpoint-ORIG-GUID: 0pgpPv5p_kDaGepyWkZNHifqXwYHXUTa
X-Proofpoint-GUID: 0pgpPv5p_kDaGepyWkZNHifqXwYHXUTa
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a2738ad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JTaF5VdYB-lleGVfvUEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080199

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

This patchset supersedes earlier ICE clock scaling series (v1–v10) with updated dependencies.
Hence, this patchset also *Depends-On* the following patchseries:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

    NOTE: This patch is already picked and part of linux-next.
          v11 is rebased on top of this change onto linux-next.

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

[3] Enable iface clock and power domain for kodiak and monaco ice sdhc
    https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Similar to patchset v10, patchset v11 is rebased on top of latest changes picked onto linux-next
for the ICE driver which had merge conflicts with v9. Conflicting changes includes:
1. https://lore.kernel.org/linux-arm-msm/20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com/
2. https://lore.kernel.org/linux-arm-msm/20260520155704.130803-1-manivannan.sadhasivam@oss.qualcomm.com/

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
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
      arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS and ICE eMMC nodes
      arm64: dts: qcom: monaco: Add OPP-table for ICE UFS and ICE eMMC nodes
      arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device node

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++
 drivers/mmc/host/sdhci-msm.c         | 24 ++++++++++
 drivers/soc/qcom/ice.c               | 93 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c          | 21 ++++++++
 include/soc/qcom/ice.h               |  2 +
 7 files changed, 245 insertions(+)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-enable-ice-clock-scaling-a89fd9434023
prerequisite-message-id: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
prerequisite-patch-id: ab9cc8bd28b2e1e27df6e44907e8d758dfeee3df
prerequisite-patch-id: 40f239f7f06573ed45452249f444e54e3565ada7
prerequisite-patch-id: 59129ed0aeba84f6b50f42261d51fe323806a240
prerequisite-change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5:v2
prerequisite-patch-id: 5b6a436bd949a93e44f912d2565103f6bf0ef55a
prerequisite-patch-id: 7f9ff2b708418a77578e154102f72f0da243eb71

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

