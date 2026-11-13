Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545742;
	b=oDFtJkpD1VrgvQErVwInehBecf6NsMZH5Zr/opFypdDW7lpeKvbHxPehkNHVCPT1ZgU/
	 ZHwtG6Lk4/8hcCmWkzwANZ6rKhe9vGaLe07x7s9VmliwZ/HgopIbKKbL8WUVv0gReKvKn
	 XnKBF3IVWH6Y3FdQwsnQa4IxunTQqtbl4VgHp0XxDOBypEdP3lY6ZSyksevVE+4P+W1LB
	 dgUEiltUkYB8kFHIcvnmsbBDDxRyQ09g5I3e1bLDr0PyOp+wcS7rexPuIyyozblPU3mIt
	 C/+WLkgzHefDuvKL7pqyjf76w2AtVxCMz1tFbovG1/upSlRL7BXwo7FMcVlYlzHynQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
	b=PIP5U3bgtBwgPakzmnj2t9ZnFHvJbQ5rxswoOvQiEh2KMlki0ZPdYar6KJbKvn+L1XQo
	 79JHxGjNeEbWpjkw4+rU1kzsQin7Ilv71jBlS1dfV3Cia0Sebh3NFpaX/NcRyagQX1MNU
	 kEqh0BMSrfGddAe6nngI5USd3pPLDLLfkdXPUuzR/V+dMW1R/IR6lryAs5P5es919XuNq
	 HXBts4X/T0+9jNaqKtA6LUPuIlokezVGJShmvU2Diq6rRoWGk4uH6HsoDcWOkB7zTzV2H
	 qZN3CKBgPtjsZvjn0+REe2T1CUvWjEMw3WjgEdNueshLX7rc8dG0qDrtEj5OfvBOMYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daFS2vY3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4yh41oD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B0C606A331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B0C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daFS2vY3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4yh41oD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K4lp2843225
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lIx2CS6fCKzreivxpI3mpR
	mL8+uVjdMEVbrcvV2S/hc=; b=daFS2vY3tyzzpbHxBcyvg9JvBDBwIna96I7QNn
	dVU7jaOdRvYClEabSoM/8bNUlcN7wh/N+vteKMT0XKmuHqskSSUKRUmxmK5iWs0r
	dApJaVx00VcJFk5fvqKzkRNGudCO1LCdfj7lIBcEqihTkH+UOrVuNwIu/wqq4NMY
	Kl2jiPf44mW7NyAFxPmTJ4FvTtfVHH8xKsxCGrrYcmpVtUuSJCTfPPT1SxNAeoHg
	nWwBsfQzypRYZh+n63bQ/6CCZB8/ERTL/h2N8lGNSIHNkevWiUFb0XyLt0oQW2aY
	IswJEfj1AcGvrNX2PwBqBEtGP18Oz+vnewkiBQiahTOs+lDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4upp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso457224a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 20:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545739; x=1795150539; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
        b=T4yh41oDdiXb+vsbtQO/66WyQmqt5b5xUQLtoWFPViXMuLIvZw1HoHSBrpudbeeNxK
         Xiq7boykSSH+VGapAFcnT9IX43mbTiUTcgI7PVbK1xwkifUhw+d+QdwjQeGhTy2tUVXS
         F5eNDV2FvyIaxT1F+BHslptbqsX4ZZJv5zTm3LApoPkd1uZpRqWOPPmgRKBO2o8BzfnV
         wEs9sUQPuEECBxtYWlSy2DYHB6ucq+uG8ydVA10XKOUD9qhLImLpfmseyPbnp2tuVc4j
         x4AOkbBqiLPU1b+DtusAombiE7KXN/rWl/Mx3aUu0eGuVkVRwDC5vyVIwPh6OKeS4SS1
         qQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545739; x=1795150539;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
        b=ppZBZfFqpqVPs+0BTFc9ivEkIkMk1+TN0SErvnHA0rpUQA/Wr+6A4CpmMommxEyrJs
         Eqghj5IzNhmyKuuRJmxTejbKUXZjG2KL1ApLHb+QTvPHmJq0HXhXLKWLzqm54xZ3poIc
         PijGilcFXuL5UVAY+brH460VEaF80pMAroEC1MqJIF8pE5vqRaqo/JU+TbqnkjaNpb+X
         or4SBZRG0sa6QrXkK2AUQFTfnvW8Nz67jmb36zdq2YZkNTzRGzbFyEUlAvRNMbbpRxZO
         dP0yEtajh+bigAbTuHyVZXhskSQSgb+yXi27Z9jm/WQALiAFji6/s9KQqltjc32PMI59
         teCA==
X-Gm-Message-State: APuU4Z/iWxhOPRqZJUiUi8YjH9wM+aXEW5/CbtGjTrL6sPsba1mHmduh
	jHxdUQsZq27NLpkdczodJMtJuzSI5Oow4Xu3a8CAkrtVO2IRntoQSHupXhd5yp8rPslkTuJBrnZ
	1NGiEpPF0GB3naK+ZqwGxL5h/kzRkp96olFRAknyo0k6CEuWrx4JIjGZmRvGObMKb
X-Gm-Gg: AYBFou24jQ4zO6s1TcvRhPY+gbRnQZkRpLbJkhV5xp2UQz69RFXxSByre76WYvWx+mC
	dtGNggmirmkwszI/aA3DwW7O4CP12j61Dhgsx92HkLwS9FSTH5p+/dcWZqHkZMFs/h0dBHcYzMQ
	pzVG6fS2/TOYCDzRHqDWibm2jYcMY4b+LEDko7Lf+tK9bO8+XRmkKLd4oMV1NYsWk6SUTIlL2BY
	8aup0X3XV/n4BG0yOWyDVVUhsgoUXwOMa9unGhYpdJOs5CB/5taVFSluvATm8SKSUYUEpZgCdcv
	rJusFkzJ3s7SyTvt1yd0DR1ELI2gK09T9pan0AUDIEP4J1npLDvnmuZ+NRZa5OTtMlFq4tweut9
	9IWwhi4UfCfWvZUF34XbM3CAXeNiDkQZFsdYih6KMrJzLpuabPFYKvw1Tq/npUoa2KIdBSNs3ra
	Vu
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr902240a91.36.1794545739326;
        Thu, 12 Nov 2026 20:55:39 -0800 (PST)
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr902226a91.36.1794545738813;
        Thu, 12 Nov 2026 20:55:38 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:37 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pmdomain: Support system-suspend-only domain idle
 states
Date: Fri, 13 Nov 2026 10:25:24 +0530
Message-Id: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADyY9moC/1WN0QqCMBiFX0V23WSba4yueo+QcPNfLtTV/imF+
 O5No4tuDnxwzncWghA9IDkVC4kwe/RhzCAOBbFdM96A+jYzEUwozhinKHzbwxVTk4AqqaUxxkn
 tDMmTRwTnX7vuUn8ZJ3MHmzbH1ug8phDf+9/Mt95PffxXz5wyWlnJhFXKVVqfA2L5nJrehmEoc
 5B6XdcPk3VKo8EAAAA=
X-Change-ID: 20261001-s2idle_state-6484bbbf48fb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=4313;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=h+OJXS5GpG4CzdSwZr2uBBdlCOkcwJ/oouQ8a6ggKp0=;
 b=LBVhYye/0VIMpScQ4j/tbHUueTory6C/vc5CyqmBBCJSAl7K3uo4+SgPfL/7UrvaRuaMMWByO
 quEhUuqYTk4BG0yCSI9mcz4hRWer6Dh/K/K7oSJedBU7vYB4cM+RImQ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: MX--pUyJ-RyF7hKRUw7HWpS_yMR1LDtW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX0o/UlH4mbNWu
 Ty9D6sudASSbjzycEx9SJn/8uOXn/zEIuMh2JBpLYOVFx+4bMaEUutN8MHfqkZrVv3lNtbGhmUC
 7+bJlIT95wE8y2d5pBbEyCp5cJlWh1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX7W5F0bhHMPBe
 2ZayOZT5ZvMAVaLPCcUB5l+icEJ6mY1bicOFk7Ac1AS87RPr+ele3USN/gv53NOnEKuOLWRPqe5
 0ZecVojhTs3EGdIBfVskVq88KJeW+GB6ZFAk3DCbMYt9Tn+pjfBF35ctNUMm0+Wc7teqNKElWDt
 0+w/vd0Tl6WNrPH3Hf27YvckNRxYY8q3EAvx3e4plE/DfL6YY7D6CuuVt1+BJgW/uzBSxQgkqpF
 TYDXtTOq/sjkeqvpZ1KMyiTXPNNLssHQ34MSAbOc5r+4X0QTMMgFKtqzXjERysJLTFKBYrF++HB
 7mR7kyLGnhbQx77YkARkU803QCfF5bd/YUkpgfpkW9DsYN4VO5o9xLA1Un3h1KXGfT13rqaI3lj
 9YfjNp9vOHYGgwZo3xgRUMIZUgwI8Yx84HRkXf1MRHtZA0mvRFG3fWz64XBe31jTRWrw3u2F1VM
 u2byN5jbfDSn6q9Gsfw==
X-Proofpoint-ORIG-GUID: MX--pUyJ-RyF7hKRUw7HWpS_yMR1LDtW
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af6984c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZTPrOM7BHbsZ8Di_hkkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

To achieve the deepest CPUSS low power state, which can lead to chip
rail power collapse (CxPC) on SoCs such as Lemans, Monaco and Nord, the CPU
subsystem (CPUSS) and the Safety Island (SAIL) subsystem must be powered
down together in a coordinated sequence. The Safety Island (SAIL) is a
dedicated subsystem responsible for safety-critical monitoring and control
functions, and can operate independently from the main CPU subsystem.

This transition is divided into two stages. First, firmware requests SAIL
power-down through IPC, after which SAIL waits for hardware low power
handshakes from CPUSS. If an interrupt or another condition aborts CPUSS
entry into the deepest low power mode after the IPC request, firmware must
bring SAIL back out of its low power sequence before any CPU can resume
execution in the OS. This recovery can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause
substantial wakeup delays and repeatedly interrupt SAIL operation whenever
the CPUs become idle. SAIL must remain operational during normal system
activity, so this coordinated power-down state should be reserved for
system-wide suspend such as suspend-to-idle. Shallower domain states
remain available for regular CPU and cluster idle power management.

This restriction concerns when SAIL may stop its work, in addition to the
transition latency. Idle-state latency and residency values alone do not
express that requirement. System suspend does not eliminate interrupts or
aborted entry, but provides the context in which coordinated SAIL
power-down is appropriate.

All domain idle states described in devicetree are currently considered
during the regular idle path. This limits which states can be described in
devicetree. Due to hardware constraints, some domain idle states are only
applicable to system-wide suspend, including suspend-to-idle (s2idle).

To allow these states to be described in DT and used only during system
suspend, this series adds a boolean system-state property to domain idle
state bindings and a corresponding system_state boolean in genpd. The
genpd governors skip these states during normal operation. The system
suspend selection path remains unchanged, allowing these states during
suspend while retaining the existing wakeup latency checks for s2idle.

This series applies to cluster idle states with the "domain-idle-state"
compatible string managed by genpd and its governors, but can be extended
to CPU idle states with the "arm,idle-state" compatible string if the same
restriction is needed for CPUidle states too.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Explain why the state is limited to the four-PMIC Monaco EVK and is
  not supported on the two-PMIC Monaco AC EVK.
- Push binding example and DT latencie/residency to the realistic values
- Use lowercase hex for the PSCI suspend parameter.
- Link to v1: https://patch.msgid.link/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Maulik Shah (3):
      dt-bindings: power: domain-idle-state: Add system-state
      pmdomain: Add support for system-suspend-only states
      arm64: dts: qcom: monaco-evk: Add suspend-only power collapse state

 .../devicetree/bindings/power/domain-idle-state.yaml    | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                 | 17 +++++++++++++++++
 drivers/pmdomain/core.c                                 |  2 ++
 drivers/pmdomain/governor.c                             |  6 ++++++
 include/linux/pm_domain.h                               |  1 +
 5 files changed, 40 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261001-s2idle_state-6484bbbf48fb

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

