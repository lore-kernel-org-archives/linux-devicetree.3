Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989621;
	b=LatwQO24r/1cCw80Nj7y4r7hJeNks9naOMGi173+8CSbiRSkEFb+xC0WJsd45eB5Vu+E
	 LKT7bT9/6pcqJ43cN/auGxtxnQLxAL6QGaIPsH9i9YpVaJYA369ll2UK/LnN9MrJrJSHW
	 h4kY93spb/4ewbge1jPJHTWJXNRGJzpS5T50UJrf6cxWl05RTLn0o9hCbMx/ednOr9he4
	 eHgUIRAtHH68lA8+9rDUYJGOrggGZaUwZ5KUfUcvmvH2xR7w5fzu7UKnmrfHvy7VGKxdl
	 Bz+HABtx1zOHjbs4x0H0ZmG4sCs8tILamcJJFqqX7vzKR+l/6zrYlcMaKJxjg3olUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
	b=EpWusl+Tykq87AMnt3sY5stUdJ23BjvFe9b/+CE2oM5oGImDmlNsy9z0IDidz3BQT9fU
	 vrB4kEY4HsOCCacJAGHyScmvyPFd/ygyAXljIAM01blgmBgx5LjdjlVTKjxgK5hD8ITiI
	 IxNnhHZXqaM8GRtZ64giCXBAkgTeRKV/AN4fCpdg7Qo2T3yety52mZ8yNPRCNVlTpZuag
	 2JKoKvmrkQIk6asjWRDVejmiOf/sDJ+RkOvgMZ0fbnEp50KQVOLtTHW2t2CLFyXtAvZrb
	 xL9dHd1c7ACvrvRmsg7jFc8NNgLKvbdlmcdX5T9aF594wZt1uLq/P5UP6YVs0W126Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TThBMSZi;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1534606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1534606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TThBMSZi
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso491378a12.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989620; x=1795594420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
        b=TThBMSZiw+PvnG1b8LSQGrJhYWQLRlegUJo62gfBKApKXvwtolZ6O6Qr6A53nqBwq2
         LBzovfqsF64ns6YJeynIyYQZElNYUVIxUpoQRkgmaGeCzDInMv9y+Ps6WUw9/y6tlMxY
         bO3xaiqwqwT1NO6cQ0wS/2lfvQDqAHLd/6wHctWZB+oOvpHZDOuDdoGsApmRGzmBwm0p
         /Vu45GoKhe8VGmWQMvjqcLn358ZZfTYdLmxeW9eBLLeepQvMy0UfOXBjeqBtYa/0JpVb
         W9yb0cj2CSzzDSJikBrAana++PjJ9XMaDcFW/xj9f9DVcMR8vIa5yHB+l3di9arMs6mS
         5Xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989620; x=1795594420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
        b=kJmnKa1lJdM4jHUgp2dkN+nPpozEN+nqg4CMeu8ehNJOpg5t6Ir3jSJJkr+Q7wLbVs
         v//XfhKRR2q0NGALPH45TFa1x/8xU9OPFhMUddLre7Vl9aS3kPn9p3kkiCni5gN0cj8N
         yKTwPFGgm5XGASBOSsXTNUjEcIIcTfbFhnLJJmEYj/IIqWWjuD/gJIinpnR70IvrtyYW
         MlZVrYOVqT7JKpF5Ej0+Kv6VBn8iH03bqkDMsk+tzqK6Zu83bNOtKCS4KXsbGdj5U+Xk
         urIQdAmagYuPXSKaS9uhqHc5xvdEltWXz5ssO1syyAFLR4NkGHABPibxFUME38DdDKcJ
         Bt/w==
X-Forwarded-Encrypted: i=1; AL+hErFtaTKnZEct+GE7mfynpSg+gQyIsKnqXvWaC2EqlKQ7LrxB6gTbqv5EsXIERGfXNU2ffyMUjxpOdGej@vger.kernel.org
X-Gm-Message-State: APuU4Z8XLgOT0iRDrMCyKV31tIAq3+3ZKFo8q2/PY6eQDYxM733fzNKs
	9IEb8DBU+eyFMA31pjpAfrN+QBQNW+PcJHTS2pPEGHBP1+I170e9hBkYLxSEz+2QeAQ=
X-Gm-Gg: AZFdTZeek+pCrJEtbTqTrH7M9Ahso6s1OBEtuKLKBMWqUXeJlX4R8dA1rkeBbJ4TXt7
	NF2UBJ0mN0q/7QlTrPkts9hWSL7P6ATM9YizH0TXkmk6FX2GvGnw+ku7U7hdXHLhxHzBi09AqLb
	FQDWqG4y5jXgz03+0Q3+ZCx0WgUoU/G1S4K+nos+YJOTO0DBj6OyEo+cmzPsnu5538QC14+TLK+
	V1gozvQIh03Hjswf3vXoq9ovlUj+43LFU3P3Dze1yvBACyl3FnmwTSSj37MOJJ6J9IgOf3B/Ndc
	01i0mZPS82fuTSFLUIM0gjrAwUiNS/xXdWhH6iBYqdxk8dnkGaKRjLUuHbDuaemuv4cxKqEt8Im
	0Kx2soHeFl0tdaw/WiHBoLvkSFcpQwcRRda38TejuVaTUiuTOhvpnG1hGy/a98gqw3KV4qY0MBS
	DUgCY6WIsMtLXUtifoqkQFJ6bCZ/RuZrInwVWtpUpAN4Z9ItQxwKCoBkHMATcyCqNrYip6yVmlt
	KMOJp4abkQwF3ZEanOCaRLPMJ+suF8+ZS9rQxmtq4fHkKPg/cjchFd6b7+CXUT34xOqZOWcay7p
	akxmtqztXf+aCFV8WtX59PThG8hLFSOApSgm2hvtXsLpqtBFkyC7uHe9hILPNg5acyHPFGx2AK/
	9Ivn5u2A=
X-Received: by 2002:a17:90b:2642:b0:3b3:a982:6e0d with SMTP id 98e67ed59e1d1-3b3d07da366mr1810223a91.61.1794989619995;
        Wed, 18 Nov 2026 00:13:39 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:39 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 0/5] RISC-V: Add perf support for PDIS
Date: Wed, 18 Nov 2026 16:13:28 +0800
Message-ID: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC exposes Precise Decoded Instruction Sampling (PDIS) as a
per-CPU perf event on RV64. It targets the Smpdis/Sspdis draft at
2de60e18118ce78e2da82ec33296345c94d8560c:

  https://github.com/riscv/riscv-performance-event-sampling/blob/2de60e18118ce78e2da82ec33296345c94d8560c/modules/ROOT/pages/spdis.adoc

The draft defines two destinations for sample records. With MEM=0,
hardware records samples in indirect supervisor control and status
registers (CSRs). With MEM=1, hardware writes records to the PDIS Memory
Buffer. This series implements the MEM=0 path and reads records from
the sample data CSRs.

PDIS selects instructions with its own counter and delivers records on
the local counter overflow interrupt shared with the SBI PMU. The
driver samples at a fixed period and reports the recorded PC. Each
event selects either host user mode or host supervisor mode. CSR
numbers and the state-enable bit are provisional. Probing requires a
matching CPU node and explicit boot opt-in.

Open questions
--------------

- The driver registers a dedicated perf PMU for per-CPU sampling. Is
  this a reasonable starting point for PDIS support in perf?

- The model cancels in-flight selections when software sets inhibit and
  clears spdisctl. What sequence guarantees that an old selection can no
  longer publish a record before Linux switches tasks or events?

- The CSR record lacks a privilege field. If user and supervisor
  sampling are enabled together, how should perf determine the mode of
  the sampled instruction? Would it make sense to include the mode in
  the record itself?

- The driver reports the recorded PC but rejects perf's precise_ip
  requests. What guarantees about instruction selection and the recorded
  PC would justify advertising a precise_ip level for PDIS?

- COUNT can reload several times before software reads it, while OF is
  a single sticky bit. What should read() on a PDIS perf event report
  when the driver can only estimate the number of matching instructions?

On firmware supporting SBI PMU snapshots, restarting ordinary counters
also requires the existing counter_idx_base fix posted by liutong:

  https://lore.kernel.org/r/20260823044337.517125-1-liutong@iscas.ac.cn/

The reference OpenSBI firmware uses the non-snapshot path.

Reproduction
------------

The matching experimental trees are:

  QEMU: https://github.com/bows7ring/qemu/tree/4ce5dec939149ccef78358d68ddc15df1fc0c55d
  OpenSBI: https://github.com/bows7ring/opensbi/tree/1cdbbd84f83d80fdc6d62ea3347a4417b388784c

Build generic OpenSBI with CONFIG_XPDIS_TEST=y and Linux with
CONFIG_RISCV_PDIS_CSR=y. Boot virt with the resulting fw_dynamic.bin,
Image and a guest initramfs containing perf and the workload.

Use these QEMU options:

  -machine virt -accel tcg -smp 2 -m 512M -icount shift=0,sleep=off
  -cpu rv64,smstateen=on,smcsrind=on,sscsrind=on,sscofpmf=on,smcdeleg=off,ssccfg=off,x-pdis-regs=on,x-pdis-sample=on

In the test DT, append sspdis to each CPU's riscv,isa-extensions and
set riscv,pdis-test-model = "csr-v1". Add riscv_pdis_test=1 to the
kernel command line. This setup uses provisional CSR encodings.

The test ran the following from a CPU 1-pinned init. The /workload
binary pins itself to CPU 0 and loops over a labelled load instruction
400,000 times (one load and one store per iteration).

  /perf record --no-inherit -m 8 -a -C 0 \
    -e 'riscv_pdis_test/select=1/u' -c 4099 \
    -o /tmp/pdis-u.data -- /workload
  /perf script -i /tmp/pdis-u.data -F ip,event

On the QEMU model, perf received the expected PDIS samples in both
user-mode and kernel-mode runs.

Zhanpeng Zhang (5):
  dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
  riscv: Detect Smpdis and Sspdis ISA extensions
  perf: riscv: Probe the experimental PDIS CSR layout on matching CPUs
  perf: riscv: Add PDIS event and counter callbacks
  perf: riscv: Deliver PDIS samples through the SBI PMU interrupt

 .../admin-guide/kernel-parameters.txt         |  10 +
 .../devicetree/bindings/riscv/extensions.yaml |  19 +
 MAINTAINERS                                   |   1 +
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/kernel/cpufeature.c                |   2 +
 drivers/perf/Kconfig                          |  13 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/riscv_pdis.c                     | 558 ++++++++++++++++++
 drivers/perf/riscv_pdis.h                     |  23 +
 drivers/perf/riscv_pmu_sbi.c                  |  43 +-
 10 files changed, 660 insertions(+), 12 deletions(-)
 create mode 100644 drivers/perf/riscv_pdis.c
 create mode 100644 drivers/perf/riscv_pdis.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)

