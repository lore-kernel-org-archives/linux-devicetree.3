Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621773E44E4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938366; cv=none; b=qbbGm9NBHFsQXaYVyH+POum18uZQu590zATcAQ6e8ckxTaO8Mgx2maqpB92ncF+u053sJoOuKLdQujbNKDrF7aZ+/lO/p+6VUaSvbjl2L+LNEmsQrBBghxuyMYIl7YRw2kYTVLHUMfvUz/BqlqA8jyYZLVnH7i0m4UPox19JLXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938366; c=relaxed/simple;
	bh=WvCg1zYylDOwQ0hqrWZk3Fnkj74lOE1ILJ1fp/Cq0Fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lxmUZoAS8wSW9VM4TAL4REtCM91h8GioQxSywrDzdtgYAWJpq/5G0rS6W3b20p51dQcVor5mr2jdWf5nuVKSsfNMqGmE0TpD4IP5NMw+AhHluwOfjMdcNhyQZ+i36SDtJJz6VGJcvXYi8WysUy9dNY/+zVMhjhpdrjMiXes13BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpFc6CcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iy9iilsS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpFc6CcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iy9iilsS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nkll507299
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dvxFWpBIUKl297MMvlXgvj
	gG2qnWL6hrJmi3MQ7wPJA=; b=EpFc6CcBgSP9T3Zgrli4pbhUqfUk1Zrv/J4XiV
	oBJWJclpDAVVFojxPCkcGY4ULWi8/XbbEETfCP96qyAgrC/lFNqbq75DX8RUAfXR
	BzCGZNOFpuPtWmDT0KhWKqyMdfQEeYZ4YeRJd6S4g87EOM0YxnNclNMQBLGPwORi
	qTY5q5AoKE6Dzt6Dxg79/2A5CGHjQKbhr6zX/93Qeaa0ZIjykckRNEC9JCLgblCn
	DRTG1Vc7swuZ9l7J6lGNpbyBpiA6bsXjCR5iOnJbPXEZcP+F6L89Gp7YvIvXKb2I
	k9a+H1BfMje0EtbSI8p7P1LMsQ73L79+o17NZmCnK3dZ1w3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h1nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4265619a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938364; x=1784543164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dvxFWpBIUKl297MMvlXgvjgG2qnWL6hrJmi3MQ7wPJA=;
        b=iy9iilsSc+P0tGEyn30W3dHdVUfnMagagrAq0ITsLqzIPekDgNhmMSdgH+q+Ee8Zvi
         WtVJHZ/C60eQWj3EwNZkEG9MpYV5ww8KIajR+v6z3lO12u9wxBnSiOOixZn31pO2Miti
         6o8UGYQgPaMGrgMQI0rsrCdDf+hFr/CNiY+vPXfLwGr9/5bnf32TiBzTuNaFoT8IJGUc
         q6+0okude3tZ2g2Mi3iIShRRnBSZITdR5tQDDS/WL7tL59xZ9XrVIRNMUppTdwPQC2zo
         RkVGMvTEH5HbgKLdoVd+fpJlTrX2H4YI4lLKfujShGqbG4X8YT+qoFlwumMs8K4JFYXT
         5syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938364; x=1784543164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dvxFWpBIUKl297MMvlXgvjgG2qnWL6hrJmi3MQ7wPJA=;
        b=l8J7SwvXdzpgZWMsP76r3IvJiLq1YFzq1/c8c/YxLgB8pBRJSxsNkXpiLbQYB+PPLy
         ZeMgw+xsYzrUNr5xdXraO3PBH6C4TRjaUNEmYknPS/DawmzrL8AVavsRhdSr+SemcKAV
         j/oSmDTPFvifKeVRXTnawyCm3G99sYd6DiCroQwvdr8ZCVMBF0kvR9eF6Lp2/nARB/cc
         GRgGz7it1QdYatfxtpga1A7G/T1ubk0j6oIfY1vhFdXrnZlGMxQm5z/EnHbZV/Vy47l1
         n/qR6EZ0kygEOD3xkvvCKoEDB+xz6R37JAMnznXumv5MI4ejFaEjUXk7k8WX7JN9x2F0
         ja9w==
X-Forwarded-Encrypted: i=1; AHgh+Rrp8MY+/X4hicIOZdp5qS6ZVnWv2zTTC0x+1Sn2qv2WZ5umZNu4NuWoG++r9QwyT+0h0syARtLmeY+4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19YThzFnUgeBQ+oscGU/iK8vK5SypgXpAMFT91MI1IaZV2gNM
	OK8ws44GCNxqR6KALU6C6mBJoKPAD8RUfqD0TC2B09QraJWxxdFBXHLlkja1eXKMMoSB5J6ohsa
	leXAZguHtpKtwLlEFpRgRuHLZKgoCCTGp3PRkyiF+SFuwJjcplcjiOHuESQAvVXrH
X-Gm-Gg: AfdE7cn5vFFEOvR5u/S0KiwN3kx2mLkle2FMs6rr8ePf/2+E+Gn2hDlwHPFGcl+GAMg
	zDha18DbyadB/yXKmdKniTTn/rppjlCr5dvh7wXtIWVZ6++5Uc9OL3T9xxTcT/+MTEoZtw4NyE7
	ITyQ6hpK5IlyCCIE2jHHUaCurNQFXqZus5ySzunaSqzExUy6BanPuY5WWoBGudchXZ9U5K2b3Rw
	mamaWuUxRLDyX5ko4VJNyy9rDzI4ER2l76qOGe0xKeH2oSCb0++81TCBF8t/CyfQ21zuJtfftM7
	l7FoKNj0aRsxL/0P6zjO++gNJnCp+pSHsUSJWX7MY+itsG7zcucy4Avqusfn1wWzoNzmwpoGnFC
	43pNonbKV8NDjT9znfrmb1gjweT3s2zsndt1Fb6wp
X-Received: by 2002:a05:6a21:9f17:b0:3bf:e2f1:1b14 with SMTP id adf61e73a8af0-3c110a619c2mr10200339637.16.1783938363745;
        Mon, 13 Jul 2026 03:26:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f17:b0:3bf:e2f1:1b14 with SMTP id adf61e73a8af0-3c110a619c2mr10200308637.16.1783938363337;
        Mon, 13 Jul 2026 03:26:03 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:02 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/7] Register MPM under CPU cluster power domain to manage
 RPM notification
Date: Mon, 13 Jul 2026 15:55:40 +0530
Message-Id: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACS9VGoC/x3MywqAIBBA0V+JWSeUhD1+JSJGnWroiUYE4r8nL
 e/i3ACeHJOHLgvg6GHP55GizDMwCx4zCbapQRZSFaqsha6EX3h1OG7XPqK1fCciKmy1aaTGiQg
 SvhxN/P7jfojxA273/XNoAAAA
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=WvCg1zYylDOwQ0hqrWZk3Fnkj74lOE1ILJ1fp/Cq0Fk=;
 b=Zh+KYJtqq22v5gJg4D9UBcr+AoShv/hjkNuuX0iIBaLMDLasPPNxyDg54DZX+b+8o6IP6Z8Ij
 9CmencsD3tSD+AGGm1TPBpQCZOqW/x393OYcj+/anOdSd4k9NxgnGZg
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: _VP4SEkl4xbm7UY-N_asVVeEmoLhz_SV
X-Proofpoint-ORIG-GUID: _VP4SEkl4xbm7UY-N_asVVeEmoLhz_SV
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bd3c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qNkiBxRVe5u3VoiZqJoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX8uhX6AlIEUQW
 puO7QzG9Fb2KVwn5QbTKtGlpDOcxFmQMsG4dDvpLEvBsqPLTc28g4eyxGxpwSEe41f6eJEEYj0m
 qiDZn8co45SOdUSGCXSFMShIIsQCSRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX9ukC+UWJxSf6
 ncesi4cpwk7RoF9P+bgrYGNXx6+MjZoRmc9zp2E9FZnH+M7dI6Hll34VuZwEHykVt5ZrjGioZZ8
 4WvIDx4YPAifJLPcNNA70CJXwfkUEY73oRZOqRs/7me9rQsnwQuXypsnfTZve36Na0izN3sEnDz
 SO0L1xoIzUojSSbi1S22D6zcj9q/slkJJMAbcsfAI1ljAJQElZMxMnEc6hllRXQgBIt6ueTvNcM
 Z9XcMeRmN9QxK7Z4WAkquZM6g/mbllW7K7qq9YFwcVV4eODQgOHZ35g1HnZ+qnv/3+3+qoySXRB
 +P/6lLHmNt/Ni1R0TmOsjzClsfYe8171aEOl3KLgsTDRUI67M8hoV5KbsEey1Qqov4KmCM3B+VQ
 blCAhFC4H7vmABBtcjFDP3zrw4qT/8po80aEPCNwo3DE5Rko3uGo3+mzqPn6LxEmtz0nXhUMN1v
 6Ilk+2/2s9KugOobwNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation introduces a hard probe dependency between MPM irqchip
and CPU cluster power domains. That is MPM irqchip needs to finish probe
before PSCI power domains are probed. MPM irqchip can be build as module
and can get later inserted where as PSCI power domains is not a module.

For in-built driver cases too PSCI domain gets probed first and later MPM
irqchip leading to failure of CPUidle states.

Detailed flow of the non-working scenario:

psci-cpuidle-domain.c probe
--> dt_idle_pd_init_topology()
    --> of_genpd_add_subdomain()
        --> genpd_get_from_provider()
            --> fails to find parent MPM genPD provider
                --> returns -EPROBE_DEFER.

irq-qcom-mpm.c probe
--> of_genpd_add_provider_simple()
    --> genpd_add_provider()
        --> MPM added as a genPD provider.

Now when psci_cpuidle_probe() is called to probe the CPU idle states, it
tries to map the states to the mentioned power-domains.

But since power domains probe has been deferred, psci_cpuidle_probe() too
will return -EPROBE_DEFER.

commit af5376a77e87 ("cpuidle: psci: Transition to the faux device
interface") transitioned cpuidle-psci to a faux device interface.

faux_device_create() calls faux_device_create_with_groups(), which ignores
the probe return value, and destroys the device if dev->driver is not set.

This will lead to psci_cpuidle_probe() not being called again, resulting in
all idle-state devices failing to init in SoCs setting MPM as a parent
power domain to CPU cluster.

cpuidle-psci.c init
--> faux_device_create()
        ...
        --> psci_cpuidle_probe()
            --> psci_idle_init_cpu()
                ...
                --> psci_dt_cpu_init_topology()
                ...
                -> dev_pm_domain_attach_by_name()
                   --> __genpd_dev_pm_attach()
                       --> genpd_get_from_provider()
                           --> fails to find CPU genPD provider
                               --> returns -EPROBE_DEFER
                                   --> return value ignored and device
                                       destroyed
psci-cpuidle-domain.c probe
--> dt_idle_pd_init_topology()
    --> of_genpd_add_subdomain()
        --> genpd_get_from_provider()
            --> finds MPM power domain
                --> power-domains topology init successful

Below are the logs from shikra SoC:

[    1.035164] CPUidle PSCI: failed to create CPU PM domains ret=-517

[    3.651715] PM: Added domain provider from
               /remoteproc/interrupt-controller

[    4.129563] CPUidle PSCI: CPU 0 failed to PSCI idle
[    4.149294] CPUidle PSCI: Failed to create psci-cpuidle device

[    4.743389] CPUidle PSCI: Initialized CPU PM domain topology using OSI
               mode

Currently only 2 SoCs follow this method - Agatti and sm6375. Agatti has
CPU cluster power domain disabled, which is why idle-states are allowed to
function there.

Move the RPM notification handling to the GENPD_NOTIFY_PRE_OFF callback and
register MPM under the CPU cluster power domain.  Use runtime PM to report
the default RPM_SUSPENDED state to genPD so that the CPU cluster power
domain can enter low power mode.

This will remove the dependency on probe ordering and allow individual CPU
idle states, CPU cluster idle states and RPM notification to function
properly.

Also enable CPU and CPU cluster LPMs for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Sneh Mankad (7):
      dt-bindings: interrupt-controller: mpm: Document power-domains property
      irqchip/irq-qcom-mpm: Register MPM under CPU cluster power domain
      irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs
      irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM
      arm64: dts: qcom: sm6375: Make MPM device as part of CPU cluster domain
      arm64: dts: qcom: agatti: Do not mark MPM as power domain
      arm64: dts: qcom: shikra: Add CPU idle states

 .../bindings/interrupt-controller/qcom,mpm.yaml    |   6 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  94 ++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   3 +-
 drivers/irqchip/irq-qcom-mpm.c                     | 185 ++++++++++++++++-----
 5 files changed, 243 insertions(+), 47 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

