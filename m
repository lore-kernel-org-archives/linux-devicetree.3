Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630547;
	b=nYuqv5otNgNzNk2OIXMMYpMlsqBn+qMKB5ii54ESw2ru8YsVIixEmPCFtqEZscWMHSkr
	 rMeq2IpKe2ng2xSVSERIZDjE5evrqpIjO9HLtyoAYFGzrSzpqrpkI7wPvTlPXoMThYysR
	 /noc2aNv+ACVtLgVh8f+xSHXXYIj52IXxmpaZ7e5jUgsFFpD1qa0Bvya+IMRjl0mSYJX2
	 JxlBmN7KxhGhf9k+jZAKSj2u/XiXR35bjIa6PUHr3iCvdr8G8e9xldC5cTPkfp3Lj6Fmi
	 rWUggOL5wX5o4Raj9mYve+ElAiMGXeyJLWCmv4MzQkeqfsJnoA+kYhR8owdLnVP3erw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630547;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/Zs+Kk5nSaDUNM5bX+GMTRHIICGM96JFbOkvqqbygyg=;
	b=dIb6Uqf00/dvGK1FpViCkOaM6kFDeE0/TZDotYcyeCShmIBMe9Xn6+ERSy/tup1aquuS
	 gahayV8G5m5VBCJWSC5tCh1OnS80RzKjw6XsciTGQ2/nJMao5DCnczY/AybT9yODKep8V
	 bkjMMmYIXdxyAQZSA04CfZL7V98xFsSCwg/OpgdWlfBe69UkjPZANxprJMcOJx74VdSRV
	 bXjzLwC4+cM6fF+OTYDXTn6WV1Ob71qWfrOii1fz7y2mUiymjkQPaImoL9On4sDYq6fw9
	 iG9X+gXgGCIOF2c1wdTrcDRGi3UNnT67TFLqVCgCfEmOGH6ujb4srUAkEqIp3c0LRLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMGzyTb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E83606A337;
	Wed, 25 Nov 2026 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMGzyTb3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630547;
	b=vwFQdQWAvpPp+I72L+L67gKJxxXNzuRekfLaptHR5rft3GFq+GTsRicL4tXFGRwjZHq/
	 knrKKsIyOCHveTuBkl9j2XE0KzgRxvkKqsgSxu53KjIsYxYG4/kgtaePmsNVGPrwpATk5
	 q+sPeB2j2+uk5eUWzmuOonoWdDsUvo3arjyLM9/eRt4iU0npd9hMg903xa77Fk8QIRr3C
	 nFO3flAIWh8Vk5VkdVNAtjEeIbOSxyE2ZnpPvAASjNls6k1xvJj20JZbtOifOCskWlTKx
	 oP//m/A3VZG1QfExdOmUYY37Q7eLS99BVk45jbMJ4V1A9g+41ViAex0IsBVsbx6/kSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630547;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/Zs+Kk5nSaDUNM5bX+GMTRHIICGM96JFbOkvqqbygyg=;
	b=ykfxAnFWJG+0i1Dmeq+C3sHtnefKAwLIqi3DY2U21t+YPB/Y744oFK2LkKbAijXca49u
	 lNhMV+sXPhAnmSvVHIQdCA2tsY5vP5EllWLNH9BSDsr33R/wq/3rmrsxJOMurmjeV0wF7
	 nhlqRCUO14dpBMRwjVOz4vwLC0/SH8VMkPPdrN940p+R4C/LeTlMs8RlsO6x081qjsut1
	 L2QpvqZ9RvXl8oWuT1GdAVL3EFQJuWQmvapaxGjlVLXXJ2Dt8tNy2VjzMLmiw3gzzYkAL
	 lvdrM0Hc8syqkztxS2w+iZzOINXOqI1lbK2RM6i5D4yBprkG2ahvgXImHv8Um5KdAhg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 152171F000C6;
	Wed, 25 Nov 2026 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630547;
	bh=/Zs+Kk5nSaDUNM5bX+GMTRHIICGM96JFbOkvqqbygyg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=aMGzyTb3A7FE67YC3nxmDcw/m2mNJJ4h5z5U18iYzip878vlbHUaBV0qVQDrODwS9
	 Zor9jCjgGdKtLap5vynJMGe0regks4Zk6r+Ue3WcVRgzP6jKc78P0APxEQEfXA8m3S
	 1A6hrUlF1xgqvSdyZ+p5SzAXKvZ4GpWC0rr9Eiou7jvswOVc0P7645NK/w2dlQl92e
	 1965u8r35HXYYXBQtVBYqH55VRUESm6vvf4LU3qJUzhGwombbT33dcCcrMijBxNyG6
	 LdAoNIBU9Vl7IoQjD7eDcegAOtzx+9HEGJSjlKXqrOS+9/QJQkGNA58UUbGWo4fJbM
	 cJ1mY9C5lx/sQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8491F4CFBC;
	Wed, 25 Nov 2026 18:15:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] Add Cortina Systems CS7542 NAND controller support
Date: Wed, 25 Nov 2026 21:15:27 +0300
Message-Id: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBQFr0K6tua3BUpZeQ/jAsoHaqSYFhsN4
 e62uHGjy0nezFuJR2fQkzpbicNgvJltBHHIiB4bOyA1XWTCgZeMcUHbnGovi5xT29iOVlIpiQI
 ApCJRujvszXMPni8f9o/2inpJlbQYjV9m99ofA0u7n/HAKFCpkUmlgTHkp2FqzO2o54mkeOD/d
 R511akeqhKqQuTf+rZtbxP7tc79AAAA
X-Change-ID: 20261123-b4-cs7542-nand-87997e300079
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795630527; l=5154;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=FxytYVQh1Bi01rQ9dueEmTxTm7lLV6AVOQ9uoQMr0ck=;
 b=ETC/jJXYJFGf9J0x7cJw9IJcjfyyNxoX+S+PdnQVFwhN3n3mnhF8wlsUudz0e7tD9PuvsqTME
 aqd2yTEZdKFCWL01PuA8JBQCRRLnND7tsGx4S27ZXCV48KjEVKiuxZH
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Add the NAND controller used by the Securifi Almond+ (CS7542, two Cortex-A9
CPUs). This is an independent binding/driver/MAINTAINERS series on
Linux v7.4-rc4; it does not depend on ARCH_CORTINA_ACCESS or the platform
series.

The controller sequences complete command/address/data transactions. Use
exec_op with explicit capability checking and cached ID, ONFI and page reads
for NAND core's split operations. Retain firmware-initialized bus timing.
This version supports large-page, 8-bit NAND with on-host Hamming ECC using
256-byte steps and the existing OOB layout. It uses programmed I/O; DMA and
unverified BCH modes are deliberately outside this initial implementation.

Validation:
- Full independent ARM vmlinux and modules builds, driver both =y and =m,
  COMPILE_TEST=n, without the platform series.
- Binding schema/example and strict source checkpatch pass.
- Actual decoder functions: 292 boundary, address and sequence cases under
  UBSAN. Address packing: 655360 cases cover every Almond+ page and
  two-row-cycle large-page geometries. Actual Hamming correction function: 20485 cases covering every
  single-data-bit position, invalid hardware offsets and error propagation.
- Linux 7.4-rc4 booted in RAM on Almond+. NAND identification, all-device
  bad-block scan, OOB reads and SHA256 of five existing protected regions
  passed without new ECC failures.
- The real UBI stack created a temporary two-LEB volume, wrote and verified
  two 253952-byte patterns, removed the volume and reattached with the
  original bad-block reserve. All 14 protected partition/configuration
  checksums matched after returning to installed OpenWrt 6.18.64; the five
  original UBI volumes and normal reserve remained intact.

V2 adds 630 actual attach-function geometry/ECC cases and repeats the full
independent ARM =y/=m builds. V2 also booted Linux 7.4 in RAM with a single
read-only partition: identification, bad-block scan, OOB reads and hashes
of six protected regions including calibration passed, with no new ECC
failures and automatic return to installed OpenWrt. The previous UBI
write test above was on v1; it was not repeated on v2.

On Almond+, I booted v3 in RAM with all 16 NAND partitions read-only.
I read and verified 56 MiB against SHA-256 hashes of seven existing
regions. Raw and generic OOB reads returned identical 64-byte buffers
in all four banks. ECC reported five corrections and no uncorrectable
errors. The fixed controller exposed no manual sysfs bind/unbind
controls. That run was read-only.

A subsequent Linux 7.4-rc4 RAM run used the unchanged v3 driver for a
fresh UBI write/erase test. It created a temporary two-LEB volume and
wrote and compared two 253952-byte patterns. Between the patterns,
UBI_IOCEBER erased both LEBs and flushed physical erasure; reading the
volume returned 253952 bytes of 0xff. The test removed only its newly
created volume and restored the original bad-block reserve. All five
original volumes, reserve 80/free 0/bad 0, 13 protected data hashes and
15 configuration files matched after watchdog returned to OpenWrt.
The four LCD services and normal watchdog were running afterward.

No kernel image was installed by these RAM tests. Board integration used
for testing is kept separate from this series.

---
Changes in v3:
- Honor the current interface tWB maximum before polling R/B.
- Suppress unsafe manual sysfs bind/unbind on fixed SoC flash.
- Add actual-function timing regressions and repeat ARM built-in/module builds.
- Link to v2: https://patch.msgid.link/20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com

Changes in v2:
- Reject unsupported page/OOB layouts and incompatible ECC requests.
- Use 64-bit arithmetic before extracting the page bank.
- Reject invalid hardware error-bit indices, preserve DT labels,
  use the core OOB write helper and standard final-read polling.
- Link to v1: https://patch.msgid.link/20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (3):
      dt-bindings: mtd: Add Cortina CS7542 NAND controller
      mtd: rawnand: Add Cortina CS7542 controller support
      MAINTAINERS: Add Cortina CS7542 NAND controller entry

 .../bindings/mtd/cortina,cs7542-nand.yaml          |  66 ++
 MAINTAINERS                                        |   7 +
 drivers/mtd/nand/raw/Kconfig                       |  12 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/cs752x_nand.c                 | 814 +++++++++++++++++++++
 5 files changed, 900 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-nand-87997e300079

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


