Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912854;
	b=3+2EuU3C5wDIVKMIv9l4j2QWDciUkyOBAyheMnq3n1p6xsPafpPS6eFkMpr39FiHIOFW
	 YRRDxHLwQCEGEfqlqhVf+fauS2liBlnZFoZ9pq/GHmjW3BikBiArA9hS4oa2Dby8TLLPw
	 Yf+QOdxmUJJ38uzwvr7J6d7aL0rBDnEewhpDmk9j5lSXCXVYJnexHkUAGRsfQtpmYvJlW
	 PYCnjTq3eZOIcmtYMGLfk/HRx3U9OGfY3qKZce6z2UpEbkb5mzFgq5zEU8drsFI/kejKq
	 bN6xG6p3Ge1JExywttGqV4wG7DAw7MEZcIppDKxiEMae52omX0zNuGI/4KYDHkuqzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
	b=Pgko8WNK3vDbB5bJk0bvLl3lmtpWwmciwzXknuI+VVFEE9Am66ciolZb4PVahGvDJNsl
	 2NiPrhYJldDuedgA+q3vF3j+BV+jFqlWzziyjZozqqe7hcpeGKhU4y0upFdyB464UXTWc
	 mwNhIqBGaArk7hxam8u7UtHUAULqOx6LhulD4KJupVPqHSdozwTLWvIoeb3RwF+D4z3cC
	 mSlQJAKc8ZxGwOPWj0xXQbT8K6t3xfDghslRFWFbXSvJYNbrWA7/wOT2r8FArln5a+n15
	 SvlW8YxK/b2RN44O6dckdTJlo+IgpJoDGg1dWPq+IXBDWsXfUrCkvvA1byBfv3YUYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxlwCrFY;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F87606A33E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F87606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxlwCrFY
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so3824093a12.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912852; x=1794517652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=QxlwCrFYTIvEOSIKqlQmOXncDSBqaebeZSdZVRlub4HCltugdpbc+UMQodD7xy/xOK
         7S9nFw45XlA8fprwN3Y23VdZJ5pawxNq+HaZL9CA+skmHYV0XPa1jPKcQZGJxjfP9JiZ
         4O/wNDG9imIGbZ98esJ2npOY/+o4riac5mLzPcoCZM/hJ4ri+XNp1NQ3DEh5YFXblU9V
         Y6+++8P/s4Jkm/af4CRfqQ4dmFQHPkI1sdW0/y8ktYs3nc11d+pXXT9yPY4fmV7POCXH
         DJdIzpkeIHKWNDUYleiIgh77HiPfvtuQEuLl+FEdlrTdL4bnxWkCDAmZ9I2CC9kf8OG0
         3AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912852; x=1794517652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=BzD1cYix0Fa2Jjj9pyhzpUIX46vT2Aq04PXP0zVCrshJ7lPmICbM5vruLfyMpsqrjV
         6URMfcM3oOSx+uDQOcsu8+vqsCd5HMPYEIgkcKF8xO4bmlCGmZLhtEbeUIPefhOEYdBy
         BZOn2xIYGVScfKUlTFAbh0KtCx0MWnYzig4lbt80zqWei5NpZQIXSP/3SnrLzhpDQyip
         1hCK8EGTEf6Ip/s7kBRARCSOzR/eMXfvYj6oJabncR9vGqbinXIgq/H/81EAnlNxT41A
         WXsLN05a/qtcfUMNJLeENJ9a9uKXKZ8ufJ62+9pZq2L0n62iYPVdeFydrhsPop+LYm+3
         w2sg==
X-Gm-Message-State: APuU4Z/+s/WT1RcFjRAiQqOUfoCIX9mBsToZT6xi4bAqvN9NNvnseT35
	DEq1vCDB9qXZS7KKllnTtkLiHDl+r04w4SicTZKHP/DS0LjJdjWHOjpE4tQJfgYo1SO7djSJ
X-Gm-Gg: AYBFou20EC6YNN/59j7xPcNN+dJ46052ayomHxXhUPKxXvUJQtzhaSv2dILW5Mkiwxq
	DNBtrIqzk/tcCkb9CwZSTHJ1fEu8CL/9186Tw19mMaZyjOWr6FJVtAbN9oCLxU2HYdKkt5/7QZt
	m5mt7s6WwC4JrGbBqRd5qEJmPz/JUylBM6KFrcVQjodI8cVjVkPim91aSGDwZepVhrTIsS83r6H
	jktmBXWYR8iu217wGZFInCH3sCDdCPnT1fTC6TluSqLe/JnuPSHjj3/ssBW6/ZvKdZy53gPj5rF
	SCo8tAtXPCH5JUrqfT4wlqaEKCVi4DqalY3L0ZmQxgl4bsCPxEGnyyVovNlqYwiNsGMopGOZ37Q
	ctXJhlIz6Y1F7jmL+j4XnuynJIxMvNdLC8kyf1Ws/sAVt5Y7dpyHmLYnr8AAiTfDk8a/8R7rPs9
	4Z6w2Q9579vD6Vnd+xzAYml7IpmeK0qBi7AHifWKDBQuI9nHOwxtGiNx1woiXut3MTJIJMVh3y5
	NKRJHVZwJ2JxJfHR4PG5nPdJ5qtNI/JMOFa6LDqk/kQkCz8BABHljrKC19I0ynboqWcggPmIozC
	a6k4oRVZshvmmmsh++Bxxw6rkyHnt6HEmRiexXW8kkpxlBHglA==
X-Received: by 2002:a05:6402:13c2:b0:6b4:c971:589d with SMTP id 4fb4d7f45d1cf-6b59780391cmr343744a12.13.1793912852256;
        Thu, 05 Nov 2026 13:07:32 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:31 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: mediatek: Add initial MT6895 and Xiaomi Poco X4 GT support
Date: Fri,  6 Nov 2026 00:05:58 +0300
Message-ID: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds initial support for the MediaTek MT6895 (Dimensity
8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console.

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The ramoops driver probes, and the console log survives a watchdog
   reset. The last 30 lines were clean in the final run.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

dt_binding_check, dtbs_check report no issues. checkpatch reports only
the "does MAINTAINERS need updating?" warning for the new files,
which are already covered by the existing F: pattern.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261102.

Alexander Letuchiy (5):
  dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
  dt-bindings: serial: mediatek,uart: Add compatible for MT6895
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
  arm64: dts: mediatek: Add MT6895 SoC
  arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  |  46 +++++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi      | 166 ++++++++++++++++++
 6 files changed, 219 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

-- 
2.56.0

