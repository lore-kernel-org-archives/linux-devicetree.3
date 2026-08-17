Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90A4418FC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982562; cv=none; b=grIdwmni/4C81DduNEAYdzaVNCpcoCaeYDR8Dxpnmc6GxIKQp5ZbojCNe1KzJOOUFgYM90xwkR0XlAQXMoEZaAm6+G3O/7aFVMQ6ntEPeQCMZoeFjz5qxbw3DZEKU4SwC5JQVmMdJ8RAWyQdef0AGWgO1vaq1dDhxRJc15wwV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982562; c=relaxed/simple;
	bh=eKbgGx3jlC870GvaTOCcW9Jj9cJ5SYGFymmxeWq3AV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7u8oY2RJzcEJ8ua+WwZu+qPdKwbaMpo8bu5mpsqYvOsO7JB/lcbAhQHv0hcrHjlOW+OpHPTiLE8QExaoGyXJwWRbuDsc65SnJqht46J+LnuxNX2Xcl5wCpNhLm++cHrFfCBCRXZ1KOBp0yrWjpD2ZMUo07NJimlQfF+g4xCD7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PosSKHKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKncAh/t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PosSKHKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKncAh/t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYvsv1530549
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdK
	z5MjuJng=; b=PosSKHKv5Wk14m5PM6r3+D+7nUkYhx8jJ8e9DVlT6gx8JSle5Mk
	LGVFcaraXw4j/vw8ezxa4tFzbdA8gxMczUe8gqGTt/D1Dmf+d+eEzd4JfGSgJA9d
	cA+gIMqf/XbtebnBfHODSLV2XS7zsaSFKGemeQuSBEAiFEoWGj/Ww7g2ZIw87VKv
	E9LMKF9lPg8Vd46HHHaw31rpt6mT7ats6te6hFV7CcdDOqiMv1AcJwESaBvVA2My
	iFbp8wt3aF8B8CmMYws57xwSAGd5xtWbrokw4xLi5TDvrSRAp8VlUvoygFGeIB7Y
	yU1g6aV4nVt8+MBtUtiClIwN3gJV+jiGLWw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke2529-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:02:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso4793077b3a.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982559; x=1787587359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=;
        b=bKncAh/tY1tLEKk0+9RqnsmKW4tEI8A6WMeljFjetRmkZPsaAtU75dQ+6QynMfFjXs
         m1ktmHySekeSN5hvVyPxYC3Rgkv5mqF3cBGXoXtkG/qHmGF2fMBSG1GfxD2LqeFlUymz
         Y4sMJf2bpb+TlYgAQzHTQ3gRT5JzhINkK73pU/Mj5BAczZNKQiGKlqTV5BFzzL3PZYtl
         laaCvdZv0NhU7nFeDU7fojEsK9oivihJv6C7EaA/rHdxPVYbchqnkrZk8AMn6FehEP12
         PlnaT9khn9yMnEpwJaNbpyJGN0nMx3qQwqniox51Kin5Wsc6qONEkdqiPgpmz55fmDbk
         xBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982559; x=1787587359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=;
        b=MFxkbijEAU/v2UPWtDbccmNPZ/G1yLQ9EKc/8X7yq+4XjSaJw67o4f8oOS8Dn2c8UK
         fw8DjXnLM7gxMCYSFeJvO5NdP88EGQJ5JVtvo+OQn2PLxJB46l12AhmyJ4OWAMcM6lMb
         CZI+C7LLK+BjTAmWpzMUo4SagYsPQM1RzVlFPmZCWR9GCWg8v5jbxwAzIdnXwbadQXYq
         SUb2X8/262SXoxPR9Kx2c6Mf06v0eoDvrh8HiFKNozRnDwj4/jW8DyORuN8TpoPNS4TS
         BXo3g144/oKWEP7Ew9P9ZKAEpT1VuNKD1IlvsKmxNJ8i1I0siobkLMxfZufmwqgpv0T4
         maCg==
X-Gm-Message-State: AOJu0YyZS7uPEq2sgx3XynbZh0Zcpm1vQkWLe4ScjT+pyrjd9sUyxDtH
	dkiA7MHNny1ltvNkW0mI2LQVq8wMDxGc/q7y+4D5Mfh333RzdrmQomuIC9Cb4cT8WA2K/eo2pZP
	8ooB9FUWkScLdvswJGRY8oz9tbAgRJ/sEPZha8Zjdn1tMVVWuzJJYOW11NKmpC+h0
X-Gm-Gg: AR+sD13Ri02NuzifXsFg4GCyWoUmh1OOzy7wreSglLp6oCksw/HfRSZG4gSX3eiBB9j
	KDkcJND0kj9I49RJUNntMou1LPP/usEeGZbuqI1yGowoJXkXmiC0WJE2CDJsYqm59+yeOJlAbdX
	1ji3qeWz8jL/iNuOtvRWmOZwSzlh4vZPS8LA0ImqPl+SU8UB9K5ii2s2+WtDV3lkfNldyI5zrBE
	8GDVsGP/o194176PA9rtH1EUJef+XY7CRV57Ak2YalOxL1VIH+dAvhmullLgVZMqQCi23RPn0HV
	ehBGWVHerwopdvF+RC5rsf2tEIdCbr8nqL3/DAY10S5dCCAlGKfUTvp1WNtoJkD+jACGZcMO0wB
	N9nE2MGVXzt17h8tmVSRPDIEWy4j6H11c+ijt6N7tUwXUWHqPbJ+Bh/5eXnobunwZptrE5wG1Pw
	D2RGDp/32RERMAFsRsrJC7i2MNhg==
X-Received: by 2002:a05:6a00:a219:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fde2bb2camr25464882b3a.35.1786982559204;
        Mon, 17 Aug 2026 09:02:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:a219:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fde2bb2camr25464810b3a.35.1786982558539;
        Mon, 17 Aug 2026 09:02:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Chiu <andybnac@gmail.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor+dt@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        Guodong Xu <docular.xu@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Hui Wang <hui.wang@canonical.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Rob Herring <robh@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Xu Lu <luxu.kernel@bytedance.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] RISC-V Sspesa: Linux perf precise sample attribution
Date: Mon, 17 Aug 2026 21:32:16 +0530
Message-ID: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXw7I+7owM/Rbs
 13sayw/HpE+hH5GllZF3IWpSTLkHMOOz8KWbg6IvOZ5Ncb1dVDSmio8ZD1sNHvD6GqZxATQtBzr
 FC1beuN7g7Jkx/4GcVnYZbjEhti0HrLCL2NThd6cUDnVns/wPhEWoaWm95sapP9PR2++4oWteZU
 7NH5oSdsrCHx+L73jeSyMELQlVpNlPpPKabtILlcujS1K9Z3baI7cMuCXnk/6HWniFFL0SrwxT6
 xy+O4zRV3qu+KvAk1xllpH0ZeKbjdbP26NzzukZp+oBJO0ouD447MSJvrcYufqss//gX8S3Jmcn
 KrYwZuOHo/c/qBSq7SrYamjAe0TZdIlIWugLhSPJ7Zl/Nam4LSdwFfEMdGmqxqMwVK494xpXww6
 f+GjjEmwYpWFV/lkyUaP03FSNWLkDGAzUGxH3Vt0coH3qQBzF8qOMR8YvG4mV0BZcmlOBK/6ud1
 ArmQSgIw4vb9xloyECQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a8330a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=8ilw5EQWc8m46JC1U7oA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qSMsIlcVgBTr6PAb86fLMP5q1fgXU6s5
X-Proofpoint-GUID: qSMsIlcVgBTr6PAb86fLMP5q1fgXU6s5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX0AOcT0o1Soo4
 g7AiXyHXZF6HcoVTuZvyn31mHjrpCZPpjLFTlxWPSTuvguvGVpOT8kW+cMCBpWQECrkeXXbjh4J
 nPOyLn4boYWJbWm+PA9wTilvqXSiexs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123

This Linux series adds kernel support for the RISC-V Performance Event
Sampling extensions Sspesa (Precise Event Sample Attribution) and
Ssplcofi (Precise Local Counter Overflow Interrupt).

The first two patches add the DT binding and ISA-extension detection
(Ssplcofi depends on Sspesa). The third patch uses shpmspc to report the
sample PC via PERF_SAMPLE_IP in the SBI PMU overflow handler, and
exports shpmsdata as PERF_SAMPLE_RAW.

Reproducing the full setup:

Sspesa support requires three projects: OpenSBI, Linux and QEMU. The
matching branches are:

  OpenSBI: https://github.com/mdchitale/opensbi/tree/riscv_sspesa_rfc_v1
  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v1
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v1

To test Sspesa, build OpenSBI, Linux and QEMU from the branches above,
then boot Linux with:

  qemu-system-riscv64 -nographic -machine virt -smp 2 -m 2G \
    -cpu rv64,sscofpmf=on,sspesa=on \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

With all three in place, a counter overflow (e.g. 'perf record -e
cycles -c 1000000 -- <workload>') is attributed using the
hardware-provided sample PC (shpmspc) and counter ID (shpmsdata)
instead of falling back to epc.

Mayuresh Chitale (3):
  dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
  riscv: Add detection for Sspesa and Ssplcofi extensions
  perf/riscv: Use Sspesa for precise sample attribution

 .../devicetree/bindings/riscv/extensions.yaml | 19 ++++++++++++
 arch/riscv/include/asm/csr.h                  |  7 +++++
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/kernel/cpufeature.c                | 12 ++++++++
 drivers/perf/riscv_pmu_sbi.c                  | 29 +++++++++++++++++++
 5 files changed, 69 insertions(+)

-- 
2.43.0

