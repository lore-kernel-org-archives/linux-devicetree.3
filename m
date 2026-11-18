Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982026;
	b=AtnvNVZWmu5MRPiQ+T0OTlgskYoQlAhA1tPGEwIZJCDhIcTEfCQ0Uj5R7xBSF4Vmocup
	 /kokbtQ3qdOJihXCkNxk9PFAaek5O8LlsxaQGq99LCjPmjO7UBjq3dxP/BqrfFweV5I4p
	 Ef2F1QGQK6UonFyjNMMwSkrSIJVC6JYV0fgBvFn9Q8ASSsJRYW5m/6ge40gVIP/aNUjai
	 zWgsX2YGzdCaq6oBHrJxV3bjDiHqVTltYB5pGJzjTtlCyIiOe13Ca8aphgZPS/C+kzU8p
	 rCLNzhQUAWLhnntEGFFZ6dex7xLsU1pkXz57QkEw4HdTabEncMwa6VbSyMulsL7h7Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
	b=g7dMhg80Bq+gJLpcCNFyeXvpx+m4bCx3PipNmiyoxlSmG2dCWaPgCeze3dpFFIQFC/iD
	 j/05jmYGVPnALL6kzK51lDL+P5I3kyPLHZSMjPLkIEz0kDXDcUxsD3SWzyPH8W1P0m/VJ
	 LxKfAoFptGOx7J+B1/nGkosS6U6m1BO4KI9gb5jY59fd1bmk5afIgiZUQoIBWyec51W7W
	 ZZgk4eLqXLxRESqwBfDUqjjlpm6ZLNYXDdz6ZFNGkY2+fHvQ85ndbJI4bV4MeSZDLUAUt
	 whHy7+plDAVCK5g2sb/bWFzDbt/xGsSnnW5pzl0poQL1Tv6YUWgKFs6QmR+V9HJFCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Vs55J3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E9A606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocFocBd1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Vs55J3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxEL1430549
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yOCQbA2wY5BnvDNCmEwPpH
	Q2C1R6OpFI9nR4EwL4mVc=; b=ocFocBd1+X/sFdLPGnl5ewkR9MWzKhmO8zM35z
	Z6A7DBz6+yIvrTICliYcvxBWbMdLulaXxP8wuOHig/o3aUvET/YjG7pHn+aqHPDj
	Le3hkvPqg2acr5gM3e0czCHTsAYnYcqtShHsQzusIysyYcYMDambB1POfCIyvVSQ
	UZ4v4g0oJyhoClg7KCmeeegBvkryzmBHtoqhRY90cGaaSQi5H6eQH+o8A0CEmPe3
	DG77vGcFwHJFsuxjl5MRCpt3r/AwAr1/5ODFQbZI3ot3x2bTS6E4Vvyb0DLBJNbC
	62sOIWTRa/ofEleMpx0trbiQi90O/pkOe6UhoLR+79KeUmEw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91fu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so651546a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982024; x=1795586824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=L1Vs55J3Iyqg2BbaPOj172i8z3Y5YLke5TrCM3igEkPqLyk7cqvmlq2SyjUwRbEleo
         c5BZJ2uVDHsMI4jtSDg2RzQmEXzHlzbGawWjYZEKUUsxzt1YCUIxj5pUPgjIpF2JhvyV
         xs2U5Y24pd+/TgHLiHTJLnN20rX81wQxwV6NlFQDkyhlmdyBIFaJGswP+Bv9pXw4viU5
         j0zxjiOVMMlkJRqnkT7y/7oMXr/6WMu9A5JrZDN4kgPEDrb6HyWHTFqRFXgfhEscPIk3
         /edmMmUJ60yILsuDqRP6/Yr4rLShRNpgcpqfeipFHTeBfHUZ9BFaPL99+31XYtdXIzLp
         qP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982024; x=1795586824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yOCQbA2wY5BnvDNCmEwPpHQ2C1R6OpFI9nR4EwL4mVc=;
        b=rg25qjf93CKL71ifk4OHxQ7HzyQvYg2h4MkTbBR0OvooFNTXOy5+5cUya/EL+0PE7I
         +4Jy9fqWdz1ZZP04IamfENKbGPUHesZ0Uk9ZXO/8AYgreL30YsFqJeARbpBkNWURB05V
         LKTisEBrqkemn/SkzXaHIvOlBJ9r7eU7sJdaTRxduCgVFcM9nt74R0ZVPyfnFN8HoA3m
         0l6R0TuOBeCtDqMwjg4h+1BwKFskOhty911afIshTy8QM6vqRJqkjtUDbuDDw3FgZUM8
         jYe0XFNA1a6pXRCmQYAaEE5HjmSJIWr0KGR03fTWK3HbqqWvJrz+M2u6aKnh7FcG0URv
         QqAQ==
X-Forwarded-Encrypted: i=1; AL+hErGKMDy98T61qr3Co0WGRxv1Q1UPoJQAFMBWc8CDfep3dhXAXX15hzsJPDQtMjT5q4pEnRBi3AsAPbVv@vger.kernel.org
X-Gm-Message-State: APuU4Z9+dfwfwv7flwneIxuyqi/AOlFkj1WET7qphel1HkWYrIEqm1F8
	6eY0Hn61AuJ4SF7wpxRvP1qj29IbWJDM9Svau5876kGTxst4pF9Of+l9b2mDsAadcUS1nVFRu3n
	xxk7esiUcL4/C0Er63sGT3t+fhkdvjidLQWrJZekt95rH+hhLUSdg1NTlZGFU6Tml
X-Gm-Gg: AZFdTZfstJ5Ackhx6kgJuZG3W9wPbw8KOxLvfbEQSRJQgUvs3s2hp18/w+ttqAEBhAI
	eqwwxa6DNQAhQ8rddLfbJDvz0SrjPE1uTaUwXamqK27mCMfCCA6TH7KkslIENpM9FamNMd0aeNB
	35scu/7zk5R4G9QUD1VzSXu9seb4knWBIVr+jYse+9g0Hg9WjZWgs5M5TauzA6Ndd78A2UYFfW0
	Xg69JzR1H/aV2LLjXq+ZaPyGnGbLrYsvrhxzAbr8yDTkAEIhx8RxY0B7We7GLxYxLEAatlPn0tU
	aSxGwtY1YjsxDFzba47oQHU0cPrRPkkcz2xc+mAoYDtDnVbD3bd8L6izrVA0en5pWXKbr7LRo2a
	Z5JvD8IfaOy33goVB47hYd4NQeuOAOCWX8i+ab5bVYJDiT2OQu2npW9kxrC5lMHEMfw69aRgBKn
	WFWJ8=
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757191a91.67.1794982023767;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b3d07d52bemr1757168a91.67.1794982023252;
        Tue, 17 Nov 2026 22:07:03 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:02 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add fallback method to handle RPM notification in
 MPM driver
Date: Wed, 18 Nov 2026 11:36:17 +0530
Message-Id: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlA/WoC/3XPTQrCMBAF4KtI1kaSSdpGV95DRCZ/NmhbTTQo0
 rsbFcSF3Qy8gfcN8yDJxeASWc0eJLocUhj6EuR8RkyL/d7RYEsmwKBmNW+oljS14RBxdzx1O7Q
 2XEqFSlxqo0Cjd46U8ik6H25veLMtuQ3pMsT7+07mr+2HbLiYIjOnjAqrKmU9GK39ekhpcb7i0
 QxdtyiDvOQMX40zXk1qUDQ0jefIbFULNaGJHw0m382iaBIkamONVyD/aOM4PgFl3JlUXwEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=3315;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=PRPGaYLGmhNCUHjIssf8urCHwf49nXM/4eEJNt3ORxA=;
 b=EOohxv1ZnOJUxvyvaTp6btqK3MNGqfePG9Pi7+5ki2K19SbkUJM2hFpxvgve1ZKveGwU5OPA9
 OJmGKGltEwnAtzn5OiFdoRv3G0qvfPM5LipyJ8DKCk6/jhtN2mvU6WM
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX3TD3iTYvVdiE
 phaelvKuGsaL65NTSVAMPiJXKqwwX7c6VHDwl7oORv44KR9GWStdoNZmZyPo/1i+XULFigO6/sZ
 aXxaHbonGuG/d0+276N3FY8sYtBz5ZEoQaoLRjGUznR6dDXsebv5jOYTlVZjn1063tXO0NQE+ui
 RxhIrdLDyaVtoQ3LIV0MADPZEpY/dLMnlWAMQTLo8VRWhthsIf3Qiari0V/E6JLSLO3017QuTOJ
 uTFXpRsHi2RCLYM1bqT43QVy9FlzviEAbuZ0ffgeOs0b09/NxjzkZwErPORAY228jI3QzXueEZj
 SylMfBUwF3df6+yAuGO08ddqK7A+2R5oFtYhV2sp8V3kRGOd0tuEmNTcs8PSn0fz0EPyChcgTXJ
 Oyd6ty+Wsx0uCnxq0e+nKcA6+YJH1UuyoRTLekeTf1/w6iWbOaf86Cx/veHM7LlHrqFOIVJFA70
 ugZTkz348CX8g+kN/vg==
X-Proofpoint-GUID: RvtQm4m4okqj2WBsC24a0aX_dfVq7I93
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzsOU9JFMOgp1
 GC4x/QxVgpu6EnQfUwVYJHhsv6s2ZQV1cenf7QXtsMrD3Qor12SDNqVe7CiEqokGaFxCUoEsPWB
 RnVeinG7tobC8/jeKmOo9QviR/pulgI=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4088 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: RvtQm4m4okqj2WBsC24a0aX_dfVq7I93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

Add idle states for CPUs and CPU cluster for Shikra.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v4:
- Some code correctness in the driver changes introduced.
- Link to v3: https://lore.kernel.org/r/20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com

Changes in v3:
- Skip timer programming for now till we add support to register MPM
  under CPU cluster power domain without blocking its idle states.
- Skip modifying DTs other than Shikra to prioritize Shikra LPM
  enablement.
- Move genPD/cpu_pm registration after mbox_request_channel().
- Link to v2: https://lore.kernel.org/r/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com

Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (2):
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: dts: qcom: shikra: Add CPU idle states

 arch/arm64/boot/dts/qcom/shikra.dtsi |  93 +++++++++++++++++++++++++++++-
 drivers/irqchip/irq-qcom-mpm.c       | 106 ++++++++++++++++++++++++++---------
 2 files changed, 173 insertions(+), 26 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

