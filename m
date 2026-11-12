Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523154;
	b=z2cRUK3diC7KrJvrWtSOAAvrFdBLFDKy9WsBRGA0vnmyFOiarhWw7Es6mr0W/+5Wg5qb
	 mtEwdEgHzYGSu/2nT42auS6/Ss6OIEt70Qk9kQw4X9oh7sC5La2YhBJSOp1qdru5KfY31
	 JZ0yY4E3ibJ5LlHDWiDJX3dBNZTXXOSjXxCdo6HId7OL6w9+ruMcIE2T6JyNifUj5/vHq
	 D8nroteNzSUNegfQWhSM6CU2u7JJ6Wm/5pgmxIFiTzWa6Wt7IYw3oII8sOk2zOJY7OXEA
	 5D5u9VWPsu8ZXAAknk9GJ7pqMmGPG0k/qpNi5MH0RFxzHEsdWY27qofy5vfHMY5FgaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0irt2JVoUcjvaIoAcVHgoPFhj7byHj/beXrI+kj/NxU=;
	b=nXEZYrYnLx3uFTfjXjg1mk6hopp2/aSULeUounxot1wysXCJuxrILC6oTujrWUtsnXiu
	 EQfMMoN0infnjWDPzdHy4jmDcTqVNKEeLRvlJGCgWOGyczvQxehzZzu7jhF6EQtaLSbbB
	 bMuaxiiNPNiKw2a+ea906GxiusCcbOJG8d8KszcTgf2ZpktNiiNeOkcC2ZZSxB4sANHCT
	 XordWwRy6DqMQu3obbz8fjY3QHfCcASGancMWjNGa4B+FxjZRMGnsJ17QMd97YQ8IU5rj
	 Bz696VpNWa54ANfPV536O6K09glxEX7rYWhrF+Iz85iPUWKy5HJhPAkyl4DvM3pXt8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6tzjKRJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CI5e9VbV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B19606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6tzjKRJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CI5e9VbV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZSdq2118320
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0irt2JVoUcjvaIoAcVHgoP
	Fhj7byHj/beXrI+kj/NxU=; b=M6tzjKRJ1lKXpr5qON/WFgt6xquIyVHz6SfhQH
	rcsErQJDsLKjCGMrUn2SUKf9NcDztWYXBHQf8C6B8ntbxBP3lfUFx/3zp53T5xXx
	x98JK4p4o7BVezJP9k0xgXzK4ZuJt7Jk7ob3KEDrPhvOclGUbzFy/QDSA2HlJ08A
	qtjNcSmklDzD4A+2bGBMcjTpv5o02N2jK4ODAMcDMN1vdOf99dbOyFiQkxHvgzV8
	9WGUmg0V6uj10msMTmGv9OA7ShnvqmTWozYj7J1e2fcjKRLOIo1V+JkFOtKC4i4S
	hrFcCUzqC6Rjddur8D9I2AROVSFGsJzP9/DQTB7mH7A5dQVQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdgkjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso295495c88.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523152; x=1795127952; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0irt2JVoUcjvaIoAcVHgoPFhj7byHj/beXrI+kj/NxU=;
        b=CI5e9VbVFcdcTTzvhoePS5UXqDXyZhZyaT356/iIYJ+QgpfYAhJSxohOu6eZCriItg
         tpCnKqHiMAye0YDWzeqWmUN7gXN+vORhx0pG9C7oWF0cSIYu12iBr/cZLO1B7rTgZVs/
         1e1/P3YYt6tYHeCEk2+QrCvQ1Otwt4QCu2S4Xd2VBfQC4zGLGOVL/JLJ8ZtEsZqXlQnp
         bHKE+jyWVVB10lCHEtmbwRHS8GYbaxj/qH/O57w3L4XKW/nyFq3ldF8i49KhLCaAdBw5
         1qdJNkmTJOMnBd/CNnua9wLUvhqI0ggKSNA6oRH5FzRbqjydqr+ncgXAqp286QqdTZlC
         SDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523152; x=1795127952;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0irt2JVoUcjvaIoAcVHgoPFhj7byHj/beXrI+kj/NxU=;
        b=ooVv7iGIuf3cnCGuijDbflUVqo+T4oWMUnWnpHhuPR0eQ02XEqBumFeaTNhCH5Mm5D
         fji0swvDvdtsstgt2e0BodWT9GHjh+vzDuLjnYdvDU2vey0lt82WKljeeBKWW/U1gkX9
         RdnTYZPSJvMtTo6K8ziHe35I8jTNmJ3LidlY1cKMGEpOI8ojY3ssj6DJ1v/6kOgsv4qu
         zHg5qaTPUcZDpVTgb2fztuG5GG6TbP8c0hra+QYx2SQgabSL26h5Q5x47gktKigIhYMn
         rHof/SwnsSbjkC7TuZ1Ny9rzzvb7SlOfhBorkE3SND5l2M6w7PklxzqXCa/dl49PkXb4
         brjg==
X-Forwarded-Encrypted: i=1; AL+hErH5afvsdb8V3QuGB8Sbaq9fdfN978SMFWt0GErXs6epF/sGictg/Fk/IeMlBL3sIqO74KYGFSJOkAGS@vger.kernel.org
X-Gm-Message-State: APuU4Z8p0e5XN2JjldHQee+80GEuHtWZso5S7lpNXRtewqHLuy9fOsWp
	6mFZIB9m/vluh2+REueica1XGuANWEdXOUG7qpX1aXbAOIFzYkKuKrrgtC4CyKF4g1AgymnwrpH
	FwuWYvlUIaOt+d8uwPCnNixQP/AHR9EmXVo9mGZgSKLKZzP72R95fLjahAWrBF94D
X-Gm-Gg: AYBFou3QzWIp/L/3xjAgpXzKGi8YknPecF+bON0ILp3cjFhyzVLsHtYMN9e97Ik1/C5
	I4VPBI4Pu86U+jLkre8uXtYqIpXHAmOgFd64i6fTcF3SsMuwY4DUgP8Vm7uuPm5X79sEzNvoX0Y
	23CxEPdbjKVnEjMDjutyehCx0vrXBk8sK5rCiClDO7s94ukxNUctOen/7tTfAFvUd+in+E2zAqZ
	/stqN8/2hTke8zA0qYCgJn8xOtWawhpt2sO1DWd9T+zGPJuTzQYx48LDCQBVwQQio+LINQ282/9
	GPqRxjdSU067qq8WBqFHirJ1377inWxyWQUslB/p9kUf2QL2S3MITLTiSgn/DHfusI+0QFDwmt+
	cA6IB9BUscJ9j25fB67u8QQAlsDOOftS9SbYpDfGDO5jDNcp4psIFbbCet5/CNLXvJ1llsKCF2v
	4UNiRKmNUZoQ==
X-Received: by 2002:a05:7023:c006:b0:1b3:a87d:a6b6 with SMTP id a92af1059eb24-1b503163eaemr788147c88.42.1794523151783;
        Thu, 12 Nov 2026 14:39:11 -0800 (PST)
X-Received: by 2002:a05:7023:c006:b0:1b3:a87d:a6b6 with SMTP id a92af1059eb24-1b503163eaemr788113c88.42.1794523151200;
        Thu, 12 Nov 2026 14:39:11 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:10 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v13 0/6] Enable ICE clock scaling
Date: Fri, 13 Nov 2026 04:08:26 +0530
Message-Id: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOI/9moC/3WNQQ6CMBBFr0K6dsi0QEVX3sOwqEOBxtpqq0RDu
 Lsjezc/+S8z7y8i2+RsFsdiEcnOLrsYuMhqVwiaTBgtuJ6BUKi0lLICG8zFMyUL5CNdIZPxLow
 gscFmqLUmbAW/35Md3Htznzvuk8vPmD7b1CzVD29WbFX938qXgIAHtZdD01Y96VPMuXy8jKd4u
 5UcolvX9QvD/vGQygAAAA==
X-Change-ID: 20261113-enable-ice-clock-scaling-10505f466c08
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX3hWZippb/lTu
 7pYdQnRVjiwwkWn2ArTL6w1vbJNBHejOrahmGXFGM6BoVXNusK8SA/+V9YO/cKv0KiS2hmuq+UT
 X64GfbFa1igWSJmO3aN2hQChRJ1B+10=
X-Proofpoint-ORIG-GUID: hRH1ZwrFD1I_Efq9bZh_Wh10cAYCyWkt
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af64010 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Exo_CllCKnlFIUbYcS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX/kx6hcyw2jIB
 vk1+Zfb8FqFHaGUee5X0kk5OjLH0XZVP9zwXBYUH7tLdXzmzP/W1jkzgiqvCcIt/FRL7rI4Lt4I
 FfPSqsnD78nrJqQsCei1ef6SvoJJlMJkLEkVAwz6xQ4PV60bxrV8YLWPS3wE8BfmtZIXEcuBAq8
 /WnSmeTox4RMAbeDwX1dLKJRohe2dsd6JR5Ub+Olt7ZRqu04Bm2EpG3p4Ze/KgJq29Lss7cOnix
 N69fMemedRa1UEhHZEEq6wy0QGO8vEXWb26em5sinhbqoCDZC10wpe369tjYPKf9feknFlsu75L
 ruDxmDBthOm8cDXBfsPsp3uzeLU4n9k7ZTcFz4nTLhn2FvMKToPiZjgaKVdL9gf2QlbI+6Jgmi2
 E0pUhU0sOcX+V5ygNR9CUQ9uNHnZl8au+v7+vMGpefQ4iqvqoeIbend/19whvNlD/ZIdBDyubRl
 3Z3kM1P7Uljg1duQ6eQ==
X-Proofpoint-GUID: hRH1ZwrFD1I_Efq9bZh_Wh10cAYCyWkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

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
 
Patchset v13 is rebased on top of latest changes picked onto linux-next.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Changes in v13:
- Rebased on top of latest linux-next due to conflicts on the tip.
- Link to v12: https://lore.kernel.org/r/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com

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

 arch/arm64/boot/dts/qcom/kodiak.dtsi          | 42 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 26 ++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 37 +++++++++++++
 drivers/mmc/host/sdhci-msm.c                  | 22 ++++++++
 drivers/soc/qcom/ice.c                        | 75 +++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c                   | 21 ++++++++
 include/soc/qcom/ice.h                        |  2 +
 7 files changed, 225 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-enable-ice-clock-scaling-10505f466c08

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

