Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4366442B0E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455346; cv=none; b=DuWbiFj76U+aY7X0C7/X7Brz1iPcQEkeag/GYCiDpssNJQGw/VcvYUlyhWRcI6wzTaOfvL96o1dmm1yQPl/dJGx98Tcn0tgKWcvaj6ci50FD9jgsrvFHHoGeoGXmmnDyRwtuDRoKd0QRTmFmPjwvLKYEMG5ARk+vdT12lK/0ees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455346; c=relaxed/simple;
	bh=RUZzE80gtVvvkAkJlCnTKKx+nhfsj8rQXX0K4QAia18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R6pZANjfTdgLlZOX4z16rJJnDWPl8IuLtFd2cqq9JvRoYDz1wHqX/iWawxgqdSMdA5iPTEJYl8nLhuZImvs1gzL/C748cAg4IpeLarR9MqYqSp6tPQFj07tLkjrXiFbudh1cFqCuTGKY++68PqJ4ACpcPKB5WtfDV69SC0A46Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTXX7qpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMCqONVY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTXX7qpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMCqONVY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWfhr1317139
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=412pm8dqTDIKSdNF0kcjAf
	v0w1eHHlDSVxenAfymG7U=; b=RTXX7qpXbkeJLjNmSLOW8jYsZAnrRUtsA3tPg1
	iQlKM+UT9vbCmTZT3rLdfNAv/hh9JJxszHw8kpR+bYqt3N61ONRuDFk7E5FU0k19
	vtyFNtwJISJVSrx+i8jLIJ2IrP/bjtgSLcyIy3g0+4c1Co+aGOwIH7+HxVbgEghn
	8LXUI7gt7IXSXGUv4kqN9mtDgHVg+ItKkqOSPrrM+TH76N4t0VVymhmSax9fU4+l
	xKefrJic5RiC9++xwWRE3Qe6k5aPA8c9J6sNLG2gT8w0T6G/PAYfz5RCPjynC5XU
	JMb0nmYARc1bD/QXAwtGIHDqwsvyuG9IPLaK05wIUz0fCPKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk2y3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:35:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso43884815ad.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455339; x=1787060139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=412pm8dqTDIKSdNF0kcjAfv0w1eHHlDSVxenAfymG7U=;
        b=GMCqONVYXWs2QMhPJFDkjAd6slo5qBaR/Elu3KnK3DwQWlL7B7li2RVn3luh79L9u9
         q8ED6JABY4B7qY2qbisul7Z/OW9xeucDFt6gpmwlPm6KMtvihvzr5V8l+IGfEqYX5g12
         9fbOuq8olUwTnatA4JAtgbe5EvHLY5pJv0KBepHf7OwJBsQahoDLxrWkhRBBYOprUxWI
         NhtQqrxG5qc9BYkhHC724VKce43Dv1uCXEt88HV5m3/6q0WuphG9m1T4kP68/BMQz28H
         LknbPcslYJ+C/Ad6G3FU/eR81oRai8sxvsiVPNsrovgAqxyTauuaUwXOFj3T9UjkU4qY
         3PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455339; x=1787060139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=412pm8dqTDIKSdNF0kcjAfv0w1eHHlDSVxenAfymG7U=;
        b=hI0diDKRnkkgPtXClDa5+4WBA9wxdaznS3QUlrLlUJq6oY+CVeFm4fr2W6lTtm+Knm
         gISlshEiCI6WfsuKWmyvg4f4wXZxgUClHg5EZ3I1q/JpL8tWd698VoUhuA45eY2GRawk
         G7OzvqXvFSCfNfDz7dNx8p+9r/qawGz8A2TYd4xVdITl3rS8fqeC8xHxxBTt94COjX4t
         sDkEcVMMQ+bawrLaYfuq8v8OCOeSuhQTe5/hD2W80XB8SQBAaqO9WOu3JzmLyz5cpjTl
         Ii0lni0nej+TkdV/3qtvm6pfAjmlwioQPOYWsZVXklsXXBFUIluT5brOey1sddyd4W8y
         Tw3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYh+L2o9srBpiHSXbtNulfh4DPzphn0f/WX31Fg9qdapR4Wn0xHkfPvDUFgOjqwgayfTKdugAG8su0@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJrV1s4bC7FTLaX+ctM8aAdOnY1ftAf3655n9/WsSvyqObexv
	DdXuCzp+kojJDNP6nv9bHIIrhK+V+DFON1esCMNKm4eXxHyvjGG8h6WOq8B1Wy2bBay69kN8JOv
	8G86SqeBGZHjiecKQqCMkga96ZYoobLbI6Xj/fusczo5nBh8JSNBJi6Mi2RrROWvP
X-Gm-Gg: AR+sD11m9XFmHO8LgUzK3ck+o6FPwqZGg0gSOaKltyvHI+T5IsAwMACw/m4UJuua6eA
	DVngrBuBm/1Of5taimUd+ay+hesfHimFK/CFBGKwrwn4ljx4S/q/lA1xEw27z7NNKAZBvToxHLz
	FOIeZC+fuS1aUQFaHeSDWigbL/MHnXQd5SLR287G2xJ4jsdwvtmq5NJL8oLEJdTIz2XSQJ/zC0f
	CtsUIn+pkwjzqt7433pzbEjAMeQ9vbg5q6k6luYv47VAjrpaTdFR+oXR7SLovEsGDsz5Tt7pkGT
	1BoB0hFBN6GDFve4DVnc2JDPhJAEPuGILxr52vSnVyOZ2pqVoNUf5C/6iXaFSIaADisWa81kkok
	OYLcQnTx4TyYwyNdQ6qllfhCmNiigdNQ4BAHVr1bzJXwHGKgq++pmAkhf
X-Received: by 2002:a17:903:2445:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d3179466c3mr35016045ad.23.1786455338581;
        Tue, 11 Aug 2026 06:35:38 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d3179466c3mr35015155ad.23.1786455337969;
        Tue, 11 Aug 2026 06:35:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:35:37 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
Date: Tue, 11 Aug 2026 21:30:29 +0800
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQke2oC/yWOywrCMBBFf6XM2oGm9b0V/AC34iImo422TZhJR
 Sn5dxNdnsPlcGcQYkcC+2oGppcT58cMalGB6fR4J3Q2MzR1s643rcIh6AGZxETu0UZ8jgFlCsF
 zRKNW1phWL/VuC7kQmG7u/auf4XQ8wOUvZbo+yMTSLbPOSfT8KR9SSl8PIRoQkwAAAA==
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455316; l=6574;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=RUZzE80gtVvvkAkJlCnTKKx+nhfsj8rQXX0K4QAia18=;
 b=EJHp8FCtiS4H+gXCqeU4Td7FyQZ53YvaptkKZ5SxxZoTzqGZUhAssZfnE5WF7jBVUMeQxaF2g
 GtIKA7it10jBMJriezveb3oioCA1Bl6k+2IYA8daYgygt3UyclZUt2k
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExMyBTYWx0ZWRfXxtT08Sx+UWK4
 uXUZVCZYK6cx7Mr8r9ucCntjBcqvZeImuppAalhIJJ9p35Rr1Aeb6haMjNGY44ZwMHaAPFV3CPA
 SuE/kbS5d/4801uhA8uN95bKN31LT09rBPmRG6fG+94M+1efAEEeUBLpaDlQwJk4SWh9DfwzAzz
 tETS51rE2dxZzK23ge0gxS/jS4CqEIH6ye7cop47bG2HQxqn+p9gtdGUdr9Nati073YKh8/KDbF
 5I7AH0zdkcC4rGcRuFYr7MIQywk9olOresy1uONSsEc/oXrFBboUteADk4qsCXorrQyE+zltFG5
 lRyN7kN4ojws4GtWHDjqUQPJfpENIGpMaGf5OR/AbhiQYiSa2k0PG7sQxxy9dRCsSuxtvduX2Am
 nagtGtLzHCfhGjWi2ueejGiNLC93eIrPQPqEt3F+UCaf5KZIB0uey+Aep6EivM7m8+h1bJRfHCy
 B/uO/R507C7C72roG/w==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b252b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=eVJKr8h0iHB_2sIDOaAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExMyBTYWx0ZWRfX1QfmVxFKL17V
 0FmKc8s/6zHb2cZyRVuf9DnNAWztGdYE9uAnl1mwNerOe1nev4kOR1bmIvHmC2TMJ9D2e5/UkqI
 ycBq9Fmp0SxAG6bj3CqPcOh7YLHX5JY=
X-Proofpoint-GUID: -xtNEZ8e-HkTCbtYjatAWYAiSNde7yU6
X-Proofpoint-ORIG-GUID: -xtNEZ8e-HkTCbtYjatAWYAiSNde7yU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110113

Notes for James, Shanker and Rob
--------------------------------
This series builds directly on your not-yet-upstream MPAM snapshot
patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
like your guidance on:

1. Do you mind us picking these up and continuing to extend them? We have
   kept the original authorship and Signed-off-by intact and documented
   the inherited-vs-new split below. If you would prefer a different
   attribution arrangement, or have your own plans to upstream MPAM DT
   support, please let us know so we can avoid duplicating effort.

2. The fixes to the inherited patches are kept as small, self-contained
   patches on top, purely to make review easier. Since fixes to
   not-yet-upstream patches would normally be squashed into the original
   commit by its author, please point out which of these you would like
   folded back, and we will reorganize accordingly.

Rob kindly provided some early off-list feedback on an earlier draft,
which this series has tried to address.

Add Arm MPAM resctrl basic device tree support.

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support as a prerequisite before any
higher-level functionality can be enabled. This series provides the
foundational DT binding and parsing support for MPAM, laying the
groundwork for subsequent features such as MPAM Firmware-backed
(MPAM-FB) partitioning.

The patches are based on earlier work by James Morse, Shanker
Donthineni and Rob Herring, with fixes and additions on top:

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

New on top:
- standalone fixes extracted from the inherited patches (device_node
  refcount, cache-id sentinel/type, RIS index range checks, MSC window
  size, accessibility return type, foundling MSC creation, cache-id
  error path)
- dt-bindings: schema and example fixes
- arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

DT affinity model
-----------------
An MSC node is nested under the device it partitions or monitors. For a
cache MSC this is the cache node, so the MSC's CPU affinity is derived
from its parent cache; for a memory-controller MSC the parent is the
memory device, which is accessible from all CPUs. A per-RIS fallback is
also provided: when an MSC sits under a generic container with no
affinity-bearing parent, affinity is resolved from an explicit 'cpus'
phandle or an 'arm,mpam-device' phandle on each RIS node.

The Kaanapali DTS patch is for local enabling and verification only and
cannot be upstreamed: the platform is already upstream with a public
device tree, and production firmware does not allow the OS to write the
MSC registers, so this path only works on a local test setup. The MSC
nodes are disabled by default, serving as a reference example for other
platform DT authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
To: Conor Dooley <conor+dt@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (11):
      arm_mpam: Fix device_node refcount in DT resource parsing
      arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
      arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
      arm_mpam: Fix update_msc_accessibility() return type to void
      arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
      arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
      dt-bindings: arm: Fix MPAM MSC binding schema and examples
      arm_mpam: Support MSC accessibility derivation from RIS nodes
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
 drivers/base/cacheinfo.c                           |  19 +-
 drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/arm_mpam.h                           |   4 +-
 include/linux/cacheinfo.h                          |   3 +
 7 files changed, 638 insertions(+), 43 deletions(-)
---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

