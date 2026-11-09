Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201066;
	b=KlpvheWuMa/qDI/SeKGgCYUU8QCN1+yKls8aFGcFITRbBsDs+KsKqIAZmGLuN3lfImPn
	 sQoaQj9zRaQu0ynnWq9rRI94FxjxNtGCFOb7wiWFVrfYPs0BTOqIQM+ret2/5lHp20Nec
	 1NQ1Sy4JiSqvt8JRiUZFB1S9W84TMia3Fw8Z0NShg4ed83aneFq+16dXQ/8aCgyX3J5a7
	 SesZMw8FAfDaVtdXyYCrJTYJupj9blxPEQIqZobnn1mHcwpbkT/JoCiAgPh8h+L4rjwkn
	 g4jiwpds0BEtvRkcW5dT6RbIVkisPPdgVD95cPsreUilTnX91vdiXqtMtGczIsx0zYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D449LhD7l/M4eoG2H1IqG5sJ2LKkyD1oeJVEusqP6Ps=;
	b=WsZIyvTX8hn2qHZU6pGARB6liuqujR78fwqcgDPGjCQPNIL+e6EBJMDCLQxjYYuWHONK
	 YLab94lFYYly9LFYGb/n92lW2y5D6Z07KGpXVMjasYUkuOt2LXEGoZcsF0AjGXFRzxRpj
	 EaGWlrcNZuioCvbQO9AGrStviog5hfF0bxxKDxQxX3VlgBiJ752PARbI1eq096nc+WDgY
	 ofBaeExiPJHfnJDJxus882RDwgilgtw5orWT+VC01t8muCqyfauIpp+WlLIGC8mpPq8X2
	 Nvb5HnXRYW5ZGRATV9AJSVWFxjxGf+NXTMKHYf6M/jVZshnfQOiOVyKElY7Pf8pKBOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyJa5hpE;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AC606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyJa5hpE
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso265031a91.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201065; x=1794805865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D449LhD7l/M4eoG2H1IqG5sJ2LKkyD1oeJVEusqP6Ps=;
        b=YyJa5hpEIXdMgbpeV1xxQVdCC8CtrlC1WbyDBJ4MfUUhWTn8i8HSvLxwyg5k93wo4F
         y3eiPEE6HX4tPuK6STjamWxUjGGQdimhloZ2mAS18tAbxQ7sKrIm8gnvdYK8y15ejRHz
         YCmiBCi49lDadfQYkR5jL23NPUy6bUIDXpzmYZ6hZxUK7UIszz6uHeIO758XIPUDARbF
         Nt/7ux8wkFV6iw7+ORYuzoe77tii9QoVmEIXW2sGWeiTnZfojEzMki6nYs/1px3Dkjiw
         0464N5GKPVn3iMWr6BsDSTBdHiNgbLySzHHULv0RoqBzQoj2w/cI5+kBzS05OF2zPAhL
         n/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201065; x=1794805865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D449LhD7l/M4eoG2H1IqG5sJ2LKkyD1oeJVEusqP6Ps=;
        b=xa9m6GzKU6ecYjzEOxpA5BIHLflS8hfAhTPKavcAj8oJB3bD8XwYHEtAaJFKpG3ogQ
         +/VuwWo5kV+YI9n31ndlv8ZCG2uGCMiM3NpBJZcdYR7Jt5e/c+DfL7nhQusmmBYAZ7xP
         XzuqGOnG8OufNLP4dizmuVQpI09Iad8yXTOKDWCFROHDWcfFNKaGDQNvWvBFZnGbWY7K
         xvQsfhEP0/KLDh88uskfjpbO8EaamAU5bgFg4HReTZKCC6dQXGcKFMuzy/ZOU5WxDR+o
         HiQVyMe+VNF/xUlGVOTGvr5cLRghjDIyZsVfev6pAIQIqCuiJeiGd8wl1WKnPbx7eUjS
         QF/g==
X-Forwarded-Encrypted: i=1; AL+hErGAv5ftoPTxef/HwNq6ah1KvG8xEiPBYJZBGg7SeIHU7ruQtve3RHA4+b+UPcZ0hgbtbWDKO3nazbSG@vger.kernel.org
X-Gm-Message-State: APuU4Z+2uHnDFST0BHxB6ET+UsaJJ/i/XKHDmuD0VOYwmCDh8iDDIIjc
	atyyZwlQcyqbDJ6GmM8irpXtbWbbwfailEL3Oi/3PaXw0OEGK0QizGj6
X-Gm-Gg: AYBFou3Q9CjyBRqNyRMvtKYc9/hz+RNovAxWm1IXNWF/PJOPLr+J27O6U0/anda+BnB
	nOE7q60CrBkqYT0BdDVn9trC5yKn6rOmsabXLUgmiyX64Kivm68BKQZCGTK/7SHOxbzV0O/N/mL
	XLRce3/4n+R21ZUcjIZi3V/PGGkfPY5qGRj285uI3CLWD4XCL6CrgA4bztyrP/ibCpjp/ROVIu9
	/x+YWWT7wPgc2qd+AjSn1tQ1Plt91j+LLthijfxriiyVEnYOayjWcQBZ11jbYTXOR6TaIzFpBsv
	G75xzVmb0PLVxb8OIwtvBoZ5IC0A+5YsTrB26lZ6IYBUmRTRxHHF6WtiMIFRZkaEpbeC1nkbh0i
	Yhj0m4uggLmehiZbhEzMxGYigJr6fNrQzgul4NC5k3AJIcW9DLp4Yq9tOPAqPIfWTuqLLLYFfXy
	99fdilb2a9e5o83tdf6xmRvddYG8mrI2JbUlP7B4mBHzfrsdrUJd/Sm5KRwl9nCEYN8ihVd0HNc
	7SDUkFQ3ZgOvQZUEFGy5MU/50VqqTKNA6IrjhSy4fiSZcBYwcUarbCCUIBnOa0yuPT8F8D3mSz0
	LFDGiSYMUgwPPnMOt1mpOYUnCLS67mEcSS8k3fI5OIb9yIsEQBux6793IKMWhl2QKqe3nIUAygo
	AmCufbthIWw23GXVFaj7R2LXQcxhGW7SRdNf3ZalE93K8fG1Z13awhZaISA==
X-Received: by 2002:a17:90b:4a52:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b12d43ef09mr3289122a91.47.1794201065020;
        Sun, 08 Nov 2026 21:11:05 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:04 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Mon,  9 Nov 2026 15:40:40 +1030
Message-ID: <20261109051050.105623-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
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

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART.

Patches 1, 2, 3, 5, and 6 add compatibles or extensions to existing
bindings.

Patch 4 adds a binding for the aclint timer device, with a new rationale
for including it following discussion with Conor at Plumbers.

The series has been boot tested on QEMU and internal development
platforms.

v2:
https://lore.kernel.org/linux-riscv/20260604143957.668047-1-joel@jms.id.au/

Changes since v2:
 - Fixes to prcm_rcpu and aplic dt nodes
 - Drop uart1 clock override. UART now depends on a working PRCM driver
 - Drop bootargs console=ttyS0 in favour of stdout-path
 - Justify aclint mtimer bindings

Changes since v1:
 - Rework mtimer bindings, fix reg property, update compatible and use
   priv spec as reference
 - Drop Drew's sob from bindings patches I wrote
 - Add Drew's co-developed-by to dts patch
 - Correct aplic num-sources

Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (6):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 MAINTAINERS                                   |   1 +
 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  56 +++
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 473 ++++++++++++++++++
 10 files changed, 577 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

-- 
2.47.3

