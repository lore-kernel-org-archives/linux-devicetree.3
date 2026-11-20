Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199537;
	b=yDyY+HPdG0Rt3qB1N+lozleaJ5NlxywFN7RwuLPPiAXrZiKfwK4FB9zA8AYXvPRfN5tX
	 YqOVkCEeI5v67lX5Frz6mds800t4QvUg3F5Cn/6udHNsZpSNlSVDR22T7OCQUXtIMWUhx
	 1BdHskOMxFc4UEb5XezASRLyqIKkAke7gTHusuu/5fcDskeMys6tsqXHXe33hlyuMuxsz
	 MMMeQilQbclWUJi75IcDdFIvt2MgaEpAEHj24ZmZc5ErYiPfGRcSqkJDovY5yJ7TY/hQB
	 YfsNFWWNuzNkRwvaffhFF9Dgg1pdYdYLYsnM7iZ5viny6QmSB6xJgc0iU98j3WNffXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
	b=VSm+1QhMi88OrmX2K1MTJlhoYqgv7k3jI52UYdNnCBGf1NNNEtANY6uW7enZ2M8F/6gv
	 idhWSEFD840ythX+P/ioAToT/meaww6KltNfafSYhYj7Vjx+ocmq4Rp/cPnQY6JMAILw2
	 trnjQwRDvj6L7eyWgXlLvKMwPgwMknQ6tyCvIsx8tZ+k8VjCzBfzzhKEHm1ccU5xLEhjH
	 /xE+QsT/zEHjIiyip1OaSWpPG9WLCRY6zFIdYDVeqPm521S3vFwJV+uhkfW3PEwgifw/p
	 LcssDMX0bn37bYIt2sUjc0n51hUAHIjtE1LnJk8XQmSgzPQXNlEzV+LzIt6OJYfO/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="pRop/DES";
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32686606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32686606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=pRop/DES
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-571888655f1so466929b6e.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795199536; x=1795804336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
        b=pRop/DESQLuxP12DPijGnblLatGbW1DAGt6p9yKIMDbz8ts2P+L+xZkdBsiH/xAPgz
         ZYhsgVYwJU1B057IMpG/BrtRjVgS1bkd+Fmld+8SUAcOTv9LYJj7kDT1GYvINA2DH8k8
         XO3g84acUey/R3/xpXcenODNsfzjHb24PRBNRLZYFeN3GHKxiVSKpKUAaBi2JMHbxu54
         9jKt6Of57JdmQcoJAhCaSfymigMZj2OkVMpiP6ufZlPzVdkB6gN/k9fTcoHBWu2bsQS8
         jCy5lF1rmzBPe7J50AnAXZSXV33bj6GvwZ3f4MKY8el828ois1u1DDjvhNbvQrSXYKiT
         r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199536; x=1795804336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZzAJOXnaWIOq2H9M30kWpYCCj54bYL5bDJVJVQmzco=;
        b=zpR0fvO6QEjPWenxo96OzYTzp0L/2GPnJ3Ol+W7ETkahAXJHDkDD4eRTj5hBcJNwN7
         3Ozycwhl7awa4Bs4cqwJUJJ5sQOuxA1fRSvMSDjdt4FHfuEijFHDQQreNsPpRi8uR4HJ
         KgOWHHX5H1rly5xvcbTN29+Q9NTLRYEvbG51GLvm6VVlbZZWO2pRisQO54toSc8hC0NR
         1mVjH8Ri8rZKnsswkXs3Pu31CrWDDZ4DE61T/C3oPrSjtXBB2+UGj8cuxBU4mQ9CMoxf
         j4eiPtLr5kTocFprMwEzcczsDzQdDtnhGk8tNFYmoKUo0mbQaLUwhWTSeOraTJCnJdl8
         zIEA==
X-Forwarded-Encrypted: i=1; AL+hErGcqka5+kL+4MVVMDD7hCZ5VxWPaCprAVLnd/+FC5wZfMQRx+GtMXH7PomcFtQi229D9tJ0Iiv7LKmj@vger.kernel.org
X-Gm-Message-State: APuU4Z/n1yE/4xBDvGU73pWx2jlqnq70V/YmRNmNyhIQOONjDEaM4eQ9
	jRebjZkC6BCrasXoIRBzvgXQ24JGsDe8CyY2UQ1qGuOUSmW0rWvV4V42ehJxkW7M0rvwJER+fCv
	ISc86m8Ik/w==
X-Gm-Gg: AYBFou1HNibmTiHC0yKqTQpUiw+70neV/4+Oe/IZDyO4p8yLFSCK1yhCRQjE7xsq43f
	i261HYtyVC/n8ahXbEjW7vPgfTsrfiHOFAj0Jft3mZr25CytK1zIL+rHsMaF5Hu8uEiV+wzsp2Y
	U/ckSbPo65ObZjw4pUv/3Wjov51aBTs0exiYCp+CTMTswvrbSKzqi99FjHvtNxSymadjFNHcRFr
	w5ubbjYRk20O7zImRhIaIVi9rxt+22ryrvgAGQ8lXMNgiflv7dkQ9uiasoijSJg4vjkO4QzOhea
	DcJRwJPkP/M4gz3lbSdsUXnWekCHgVir0gJXQMdVuZaWoHNP3fM0hQ8JxhF7FYc9zcNtlpNueeE
	b/J5e9OldsPe3Vc0PvYTuGuK5cfe3mov0xb+avFcEFIYCFsiooY2IqDhXaOtaqLXQ0XjiEXJxqL
	1nXZtjlxMDE6r35IVMkxj9b6HRzOQQVxKv/qbvEA29zMBMvCALzC7gRXAgv7WblLd3fFzU5G6gI
	6isqAIcV8xpBF9dhI/uIXf0D5kqe1/mmqThVmM2mFOWj+OU4z9mmt6Nz6jUlTibDLTIRMz/8BoK
	e5BsiNyr/v3+aK/bEBDVNx2u0X1cU7/lyosi
X-Received: by 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id 5614622812f47-57a0a93940fmr4840248b6e.34.1795199536081;
        Fri, 20 Nov 2026 10:32:16 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm2619940b6e.12.2026.11.20.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:32:15 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: tc9564: introduce a clock and reset driver
Date: Fri, 20 Nov 2026 12:32:09 -0600
Message-ID: <20261120183212.1264522-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
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

This code has gone around and around in various forms, having been
included most recently in a series that also added a system controller
driver.  That system controller has now been removed.

This series introduces a devicetree binding and single driver to support
the clock and reset components present within the Toshiba TC9564 chip.

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC, including the clock and
resets controllers supported by this series.

To avoid any confusion I'm only going to refer back to the "syscon"
series", which provides some additional information including links
to earlier versions of this code.

					-Alex

The previous version of this code was included in this series:
  https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/

Between that series (v1) and this one (v2):
  - There is no more syscon, so its devicetree binding and driver have
    been dropped
  - The clock and reset components now have a single devicetree binding
  - We no longer use a syscon-generated regmap for accessing the common
    range of memory used by multiple drivers; specific sub-ranges are
    instead mapped
  - The clock and reset drivers have been combined into a single driver
    located under drivers/clk
  - The config option for the driver includes COMPILE_TEST, as requested
    (last month) by Jerome Brunet
  - The help text for the config option is simplified, first suggested
    by Philipp Zabel
  - The driver now names clocks using dev_name() rather than trying to
    hand-code a unique name into a fixed-size name array (also suggested
    by Jerome)
  - Certain functions now always return 0, which simplifies callers
    so they can simply return what the called function returns
  - As suggested by sashiko, a counted-by field in a flex array is now
    assigned explicitly

Alex Elder (2):
  dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 clock/reset driver

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
 MAINTAINERS                                   |   9 +
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 501 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  50 ++
 6 files changed, 642 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

