Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A250AC0C
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058147; cv=none; b=Ohh9Z/F/afA3kV5H7VRnBtkzp1MfYrqIPUFnvcx71JFnaZpQ0JKkpDrRYHhVLDXZXGZw848peU0cL6kH8383wBnJ6IJ0AgjGES5aUCfhO491k119vv6nzbp+Ivs2P06gEIhpTyCu1Z7LEGEt03DqgxZHXGLfme+5WnkD7ucDEjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058147; c=relaxed/simple;
	bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RKodoFSvC7mz5uKcCugWLoEcmCDWNcuU5O29r4vcEGqRw51IEF2fEi8pmtQjt8idlA22ehanQzfvx5RWpUiijgBZWp1ibU1qPogGp/P1ms0KBosySQyUhefXSNh4Jtz/cumyou+GYVKqGQSRQsNwlV+VqHop7TSDJNGaXng/HCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjuldHek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dth/qEBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjuldHek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dth/qEBF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOT32114165
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WyvZ8qBRw7K7we48lMPQ8H
	aYJ/8IJebU4K4q+EbfVCs=; b=CjuldHekRcv4/AMdaWpM6X8dp+Ef3pepSuvN6/
	piLKWiI1puXpU0TwZ7XLU7BSnVe8q2BwAHGiPWzhccsxHxVqR2HLXaUKhWSMMAri
	E3vt/zpLAKru1qTx4E2RYx+LgMb0SpxOPwMuqK8K6uEt7T2ZWyDDETNbmLsp6MUq
	dkVNsH3ImuRT/H/jBdij1ajJHjZ0IhCDgLUPGDawxFkBsWWuP/PgZFbrPeFzWLg9
	v+CjU5qp+vsp4L9siWAhMuByH1NCRs7/0aY2sAaFeLhRnnWB6VLkBpJq+N1K/HJR
	0qoY31BG33rRYg15D+eQuevIqUqFqoxdpMxeArRhVWJ4U7TQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyads3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-149e8e8ad71so5909360c88.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058129; x=1792662929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=dth/qEBFwA5Xs/YYztHMQqzkx46y0EZWKGxFjXw3M+2fN0z2G6hTWe74sPLIj5of+H
         b1UqFUdy407hRcmPZn02V1rev4yk/SwF3OF1mD2tuhifkLGpj9QTzaJQEtJShS+O/ADf
         9bqwAflUOvFrNGi94iNHGYCaj7HvBApJ46l3glP1QZBFsZX9fHW0UCp/XE2wvk0Kk11v
         X3BegfVH9EKY0yN0wWtNeD2/+OquU9PdXoMqMSs1QsLAvzTqOxITnhtYnEX6LdzsPgEE
         JK5eT8PpJIKrXt11IQ4nuIN6t4nrhWP+1FMxLo+foRfbAdBBlZqTueYZUopiw4K1g7GX
         z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058129; x=1792662929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=f/mKol53s2TCEpyTRnumZFxhPrNL/hVG9vuoq+/Vm+ZnoESo7cM6TWV2AY9b6UfFxi
         AHqiqcaOOySassSZPm8Vx01hG2Ajy536TX1lzBgXictIO+N9J66MGMZSBSRVFLptDXd+
         Kqgj0oviNaERP9BydqNfv1f9QTU2I9OBl9uXeLSardHNTOCTugPL9E9WTX8j+mYeI0OF
         mNGK19PGjZrEmNu6cBVZJAjzSdB07zhoz/Jc4p0T6auu0ElVbRIe2kFVncIAM1A5MJnD
         yvD0K9AJALC2BUQ08q2JJlVVBoLpbLmI9n8Jngs5LoDLRSVaKybl/dmywmlcO5frd0AS
         9PMw==
X-Forwarded-Encrypted: i=1; AKwUvBzdinWL2S3T/ga4o2iG3qUHuGZbAAjCXW0LPF9JdO5lk9sd+WHDJRTok4mfYnMXCFv+Tvf+JhRpGKv9@vger.kernel.org
X-Gm-Message-State: AFq9FYLZNN+eSG28BzsSDo6bO5yUSB3VnKprIYYwbRvQl8Cgga0UM61N
	/C6kAImWMo7imXDdxfLoN1lihPbmvzOw+OpTDsc7T/egTxxZGxDIPG+NGz3P0Y8XkWNT5YFyOu6
	KvqNd0FQMAlpi9Qa3aBfyIt+ZJrWu3/da780csEYdO4UYQ306qow1LagkmYWOb3IX
X-Gm-Gg: AYBFou2Wsc5hMyiznRcf6wx43j/tQXLtsqjAeOSNheNzYz5PMz+JadiCOdd+h44Lsqf
	IdeIdlIe+gKQTfuqLFKoNWflhjm/l0DhbhkmIS834RdExUllrLkgdiJfHfr1MWY8V8+HmqrVCGC
	4qsdl9us/DmZDFtVr5VOWuvP2hpgOmmduxRIAL7kpdz4l56YCbUuI2CQJDBbIG4TbfCpYGmPfBi
	84UFn6ESkPNjpOLNsr54GcyJJ9x970R4yl1IBoQcfmCmb9sxciWkfvKUp2bC0064XZ/42lYJBRZ
	sGHmCR+ZcM2VsPzQGIyKt6lHaJqr2a+djZVSu0y/swJ7tuv9HP8SedkMYW6WxMDetwtBFUhqTIm
	j9NWNH+eFQBIw7kMQrle85yVijLU+
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478712c88.24.1792058128736;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478673c88.24.1792058128170;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:27 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Add fallback method to handle RPM notification in
 MPM driver
Date: Thu, 15 Oct 2026 15:25:16 +0530
Message-Id: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASj0GoC/3WNyw6CMBREf4V0bQktCOjK/zCE9HErNwLFXiQaw
 r9bce1mkjPJnFkZQUAgdk5WFmBBQj9GkIeEmU6NN+BoIzOZyTIrRcV1wanDe1BtPw2tshbnOOG
 FOmlTS60cAIvjKYDD1y6+NpE7pNmH9/6ziG/7U1Yi/6dcBM94butjbZ00WruLJ0ofT9UbPwxpD
 NZs2/YBUE4ZIMMAAAA=
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=3659;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
 b=WTrWPEBOlhihxP5STVHc3U/9SmT+/GsHtaqtSGhtK5ss4NjY4PwYW3OHGhtEapOyWneHym7vl
 VgOrUS5UeqmA5+3bw5BKAmxpZ/fDLIZXaGuUKDGttS66p9mNmd7mwxa
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: r_bLCYU27JRNDejFc3zXy7Mw9gSuIQUS
X-Proofpoint-ORIG-GUID: r_bLCYU27JRNDejFc3zXy7Mw9gSuIQUS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX5S/vP88bVjjN
 EJkuqmsUN31wE2ZRRoAfAlS+kqtUAWKkYGULlbkQm6V48i2IV0Ol5EaYyi4UL50CNMzTWzC7tDO
 jNFwQFESadwNrG+pMWxtHFko/vV/4Cs=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0a311 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX5tVP1DODDccu
 EA5Xb+/OZZ6cJJdhzNHzQoI7vp4fPENRZnSbZUbMOysWQoPfxUWsVjr6CI1B7RSt+O9RkrK1DlK
 WqHQ0dInuHGPzy9vk/gSbBm0suoukUTJATUaxSOUPQMOORPBmw9xYTjck2YpY//y3QWoXY1ShzT
 wyZP3hB0/085Mgn+ZFsscmNVWj5u7kL3rVye/5l8S4Ziyu7h4AnPRnapd2KmIarEHB08gb33Vrb
 OeHwVb60FmuAyR5b+W0t/6nqwmsPKl6XcT2ERLP+Bpn0kmwYHLkIw7Dr1xglaoQh35s7oSXzw4J
 fJQD3UAUlZxxHSXlkpMMmd0a1Q4asQSHhPy9LRD9iHP2jETI6qNMytRlC6a2fcOnmH7oB3Ndn5U
 xMefDLyQG9ZoQx/ntNVzz+8QzKFqlzz52HBR2T6TaGVQdOc0gUkG+eGT/j5JRgTIKAAtE4BOHHz
 S5EvYUKfU9B3MtctSxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add support to program MPM wakeup timer when CPU cluster goes to power
collapse.

Enable CPU and CPU cluster LPMs for Shikra, and CPU cluster LPMs for
qrb2210-rb1 board.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (9):
      arm64: dts: qcom: shikra: Add CPU idle states
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: delay: Move USECS_TO_CYCLES() to generic header
      irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs
      irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM
      arm64: dts: qcom: sm6375: Do not mark MPM as a power domain provider
      arm64: dts: qcom: agatti: Do not mark MPM as power domain provider
      arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster low power mode
      arm64: dts: qcom: shikra: Do not mark MPM as power domain provider

 arch/arm64/boot/dts/qcom/agatti.dtsi     |   2 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |   2 -
 arch/arm64/boot/dts/qcom/shikra.dtsi     |  93 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi     |   2 -
 arch/arm64/lib/delay.c                   |   8 --
 drivers/irqchip/irq-qcom-mpm.c           | 166 +++++++++++++++++++++++++------
 drivers/soc/qcom/rpmh-rsc.c              |   8 --
 include/linux/delay.h                    |   8 ++
 8 files changed, 236 insertions(+), 53 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

