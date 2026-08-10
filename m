Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D640E8E6
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375393; cv=none; b=FQE9t9CKOKf/zQTKKVaYlgedkrwct65jILe1OjZZUAQpMW8+N03HJVhzvIglCJCUBc0vRHX9MzGo7yGOhvwScpokZBG/gcN/fFksucY2CjRZpahPpFRjdU9BPrqtaHDsmTiz/dzBh1/zEExOBKNzCbKfuysng9YBazoBh2a0V7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375393; c=relaxed/simple;
	bh=eJuhyjYT3zIn1KVjwxPPaUtgmWz93ADhJ8XmuD4rN5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ik4oZKZeD6NLEAK0VI++46+gDjj5w3WI41mdFZZpuaFzdjQxyORwZ2J3FVXijyUmimqD+I7VJgjXheI8DznmTrAFPMLUvAwMHKDz0mlG6pIbSrlN1tlxj3DAFM6a0FrG+EVIXTrc9KouJdOX1hiT1EM/c9+aczA7JVftUjg9KuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwocuczT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZsp8mJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwocuczT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZsp8mJr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjHT21959732
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7i4nOYQc8blpjmLfO+teniGVVZZSDRrlrow
	Z7zCs7tA=; b=CwocuczT4jZUN+FtGk6R2KRwGPCastXIp9Im3Ii+AQyW8RnSdlo
	tUKJvJ1mp0Ng3k60KBdRIJl/SKeQfdqx78rj7WXcI+Qft+XVNTCa5GlNWkBTpzj4
	LtL4oki2tGen2+a3FTlBmOgA4oVsWH052HInnpnfE6JOXPjqdHn0l5vUFqkse9FF
	ExrX0jwC8amy29sz9/t9aH2KZZE82MhiCm5SDupC2gN3VxB7gzsP05Zxv8/HAcJu
	8I9Mu4YgN2yDvgX7UQ6r3kxeGRmKQ7ZGWP4O9AcX6M7injn8F//69nO6NSiGRfXo
	IkHsICfPGm4d007DtyYShMg624vpZ6X5otA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xu9ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:23:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so2353178b3a.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375389; x=1786980189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7i4nOYQc8blpjmLfO+teniGVVZZSDRrlrowZ7zCs7tA=;
        b=QZsp8mJr+3pzUOxmNi6HZADZWfLjcq/z3o+avJ6A51q/c0I/S1hrTqgmFFs+BRwyXT
         JvWk0XsxdZcpFCcBIdkmvDXXWZOl68cj8s4yywNMuXy0nTrjm5rUNI5zR1iQv/LQQfms
         TqIt8D3c7mFYHYKy3NVG3iwQQGtEOVYcLlxqfJT9kT8Kqtb3K+Ijgso7Q6E64lJUkSPR
         2T9cGTAas5+ncTzYOU5HSU1shIUZItpQSc4MjAWwVNNGDd5vmjuQpqrEUZu3Di5lhL9l
         sWWpPayeojJr2Ufn8NtNzpDIOyeUcHqwKRsgEgO1SEabc0F08tDsHNFAH+LTvg6bmloH
         ORDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375389; x=1786980189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7i4nOYQc8blpjmLfO+teniGVVZZSDRrlrowZ7zCs7tA=;
        b=DU1kbWbN/iY1dJJHLxCh0e1MVsK/BvwX5Pl/ZiV2JbcbACZn/XmU7SRKk5Y553PWkR
         8TiMDt6s0YskH042bAs3GGSpZD9C50YiUKnUwFCzOESEh5CUUIMd04MV3+hpvJ8fhj6/
         Eh+DqGMSs7jqMm3GuiMsaefIYQVhqJE5xdgXkX6ifEq84LHQxSiMTAoIgDQqsLmUY9Ty
         kem6VP9NVSDIrdfXiXESqpW/7/uv84d/9iQVPOEUbzcmU7lGDy+rjhnGF4nWBH3/Xk14
         To7J3tUbPfD+oyhh8tOzN2BHPpcIi9cxTP8dHQ3ojVMTcGyERrDrofjvxoo5+50HGKk7
         9E0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0IbRf3Tv341PYG3IwlrHW9j9kpN2xH58U43JYQ2nBd3QY3QBBLDBHcL2BHwvzx9O5isyX59ThvVsd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy473fAf46NYx7PdYvBmTxB7Q7CdA73UwDaKmrlQREOeMQCA31q
	7u+Pgby2Ci+42HJT7PUBhsCDhF5iNWECyodL1w4cFprrmZIhAJdWpDFJwwZsHRrnN/vpQBH2P04
	4A4D7fwzBXIZv2yaouXuJPitEeiBflPqtENqS/olANd+GQxWOHuc/1EutF+LWLBEf
X-Gm-Gg: AR+sD13d3+LNAP8SR4niI+qzfoOlAAkkiYmTaIwawGC7W8Y9REKXNPd2FreS8HQyz+r
	/E4iYJmT9AiKIa3zVsGnzgB6iCDITGp/zrfZ0Pe15oU8hPV3dP7iPBpFqg/ZKYE4Q2JmrMfSdKh
	ss4ypJUez3aFmw5zz3wBPxkj29lPmxd1ZoU2eBfjUBGlsV7I2dzmPT+QNjZ+fhFo8b22obVrzNQ
	wxXeYqCiwQJ9oBODm9HkHxv2ewC7dgPqSIq/lVDmSxf2CQI8nlouf84+82b/fvRvIOxA/Bor7n1
	0wQ66Fs3LOuvOjtHCQj3mukAf/fTGLMAmB5zupqdJ/hFC3/JmgmztdyxWJhPcwOAPmpx+WlsjYA
	28TYrOHCyM9HBWdZS8nAr0tSA4U4wSeCj8NlwdIUYb1DpkBn3YJWpHBIo4GuSAERxRrfV6Ch405
	RGcubyErsbhmw5A7JsEYNb/AmKxw==
X-Received: by 2002:a05:6a00:982:b0:845:3d82:10fc with SMTP id d2e1a72fcca58-84f6926b235mr21437989b3a.0.1786375389360;
        Mon, 10 Aug 2026 08:23:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:982:b0:845:3d82:10fc with SMTP id d2e1a72fcca58-84f6926b235mr21437923b3a.0.1786375388690;
        Mon, 10 Aug 2026 08:23:08 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:08 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/14] Linux RISC-V trace framework and drivers
Date: Mon, 10 Aug 2026 20:52:02 +0530
Message-ID: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX2jrK8yHFr3XJ
 +Wsb8ES0TWzPt5mQRiBFn+cCCtVY3hi7dYSwsh0e1yAwVXHiea1XfNslgHjCWQ2Gg38FSICJ/ib
 asp2UFRDWelvJXLHklbnWe41gVrhhY8=
X-Proofpoint-ORIG-GUID: urt2utxAPqAnphTM7at92FmiIEEcyc8B
X-Proofpoint-GUID: urt2utxAPqAnphTM7at92FmiIEEcyc8B
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79ecde cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=3VGhpSTrpI1f5KnKU78A:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX7oWK9agPn7ij
 HWb72cXdDewEfSbFTgBtXd13ApBMyimfEpmGrj1dH/JuLf60zKhJ20esVf+qjAwQkjVO6FcUEl+
 hejI/G7eNyBg01/pBPAmvUWGK2rJmiF0kMTUqkBkPzSJiyqXy9wpn/Y+tO+iD48OZ3PB4Da7k2Q
 mssTV9dCHotNJSxHM+L1Mm5IzVKOC6jrgiBzUifWrV5KtikloLE3BZXo//jR2nJazesw1KNFY5I
 3LfwcPLZcuVLhxb0BncVc+z5QedR/48lD3zOb0ZSnRsweYbR2YG4Pot/avP0Y1KYFOxjq6syFVl
 aT1RGkdMfnT9YGvTRwD0/rp6CUKhvGVM6p5FpJ0jdtWZnfbDQelAJIM3Qs1ZbrQ1dxB/2NOgLWD
 Juxqk536N+wz/MjWxilKkvMDlpKd4mnUgL2bfEbIAT7tRBb+2xhp0ldQIgiK+MO7Y2ZJ0I0V47N
 aPZ0Jkv586u2wJPH7Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132


As decided during the discussion on v4 of this series the 'rvtrace' framework is 
now being converted into 'gtrace' which is an architecture-neutral core with 
RISC-V E-trace as its first backend. The 'gtrace' core framework has the minimal
shared plumbing (component registration, path create/destroy, path start/stop, etc)
and the RISC-V trace drivers are its first consumer. It should be possible for the
required ARM components to be adapted to the same framework in a future.

This series also adds initial support for RISC-V trace compnent drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The RISC-V trace component drivers are designed to be agnostic to the
underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
work fine. The discovery of trace protocl parameters are left to user-space
trace decoder.

In the future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) Arm component support under the gtrace framework
6) ... and more ...

These patches can also be found in the riscv_trace_support_v5 branch at:
https://github.com/mdchitale/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace branch at:
https://gitlab.com/danielhb/qemu.git

To capture gtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=/path/to/rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture gtrace data
   $ perf record --all-cpus -e gtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the gtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual gtrace data offset.

Changes since v4:
 - Introduced a new architecture-neutral 'gtrace' (Generic Trace) framework
   and moved the RISC-V trace drivers on top of it instead of a RISC-V-only
   'rvtrace' core.
 - Added new PATCH3 "gtrace: Add RISC-V platform driver for the gtrace
   framework" to split out the RISC-V platform/DT code from the core
   framework patch.
 - Moved all rvtrace driver sources from drivers/hwtracing/rvtrace/ to
   drivers/hwtracing/gtrace/, with single Kconfig, Makefile using
 - Made the perf driver (previously rvtrace-perf.c) architecture-neutral
   and moved it into the gtrace framework as gtrace-perf.c; PMU name
   changed from "rvtrace" to "gtrace"
 - Added new PATCH8 "perf: Add gtrace AUX buffer trace format type" to
   define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE which is used in later patches.
 - copyto_auxbuf() and gtrace_path_copyto_auxbuf() now take an output
   parameter so the AUX data format can be reported by the sink
   driver by setting PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE.
 - Renamed the generic side of the perf tools support from rvtrace* to
   gtrace*. perf.data ABI is unchanged.
 - Fixed gtrace ramsink start/stop to call gtrace_enable_component()/
   gtrace_disable_component() to remove duplication with code in
   gtrace-core.c
 - Updated the MAINTAINERS patch to refer to gtrace framework instead of
   rvtrace

Changes since v3:
 - Rebased on Linux-7.1-rc1
 - Use kzalloc_obj() in-place of kzalloc() in PATCH2, PATCH3 and PATCH9
 - Improved PATCH7 to save the previous WP value

Changes since v2:
 - Rebased on Linux-7.0-rc1
 - Addressed Rob's comments on DT bindings in PATCH1
 - Addressed ref-count related issues in rvtrace_of_parse_outconns()
   of PATCH2
 - Made RVtrace framework more generic by avoiding implicit access
   to component registers in PATCH2
 - More improvements in trRamStart/Limit/WP programming and other
   improvments in PATCH7
 - Removed RVTRACE_BUF_LEN from PATCH9
 - Removed redundant page_size from PATCH10
 - Renamed found_etm in PATCH10
 - Removed rvtrace_recording_init() declaration from header in PATCH11

Changes since v1:
 - Rebased on Linux-6.18-rc3
 - Addressed Rob's comments in dt-bindings added by PATCH1
 - Get reference of conn->dest_fwnode and add missing break in
   rvtrace_of_parse_outconns() of rvtrace-platform drivers added
   by PATCH2
 - Added new inline function rvtrace_comp_is_empty() in PATCH2
   and used it in rvtrace_encoder_stop() added by PATCH5
 - Fixed trRamWPLow usage in PATCH7
 - Determine RAM sink buffer size based on component implementation
   ID and reduce default RAM sink buffer size to 1MB
 - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
   so that implementations with RAM sink address restrictions can
   be handled.

Anup Patel (7):
  dt-bindings: Add RISC-V trace component bindings
  hwtracing: gtrace: Initial implementation of gtrace framework
  gtrace: Add RISC-V platform driver for the gtrace framework
  gtrace: Add functions to create/destroy a trace component path
  gtrace: Add function to copy into perf AUX buffer
  riscv: Enable DMA_RESTRICTED_POOL in defconfig
  MAINTAINERS: Add entry for RISC-V trace framework

Mayuresh Chitale (7):
  gtrace: Add functions to start/stop tracing on a component path
  gtrace: Add RISC-V Trace encoder driver
  perf: Add gtrace AUX buffer trace format type
  gtrace: Add RISC-V Trace ramsink driver
  gtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for gtrace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 120 +++
 MAINTAINERS                                   |  11 +
 arch/riscv/configs/defconfig                  |   1 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/gtrace/Kconfig              |  59 ++
 drivers/hwtracing/gtrace/Makefile             |   8 +
 drivers/hwtracing/gtrace/gtrace-core.c        | 744 ++++++++++++++++++
 drivers/hwtracing/gtrace/gtrace-perf.c        | 347 ++++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.c    |  99 +++
 drivers/hwtracing/gtrace/rvtrace-platform.c   | 286 +++++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    | 320 ++++++++
 drivers/hwtracing/gtrace/rvtrace.h            | 121 +++
 include/linux/gtrace.h                        | 323 ++++++++
 include/uapi/linux/perf_event.h               |   4 +
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 217 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/gtrace-decoder.c              |  93 +++
 tools/perf/util/gtrace.h                      |  13 +
 22 files changed, 2776 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
 create mode 100644 include/linux/gtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace-decoder.c
 create mode 100644 tools/perf/util/gtrace.h

-- 
2.43.0

