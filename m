Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89017BED0
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 05:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699156; cv=none; b=KTyxMMA/w4fYYrkAXtjzHIRThehZgKmBd7+5YDMmrUyRMFzZ9uCTd/7dQBS3VR50m3pNufc+Nm0bwRoh7qXM/tHsTL1xx8/4SLzz9RIMYnKw1qHJIuWkURAQqeZyxM/sMvR4QUrsA8k2wxEiuzGh44L/84tcx/DmjqEtMw+fYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699156; c=relaxed/simple;
	bh=1ggK7mPsnS7zqgz4VemPVqRPiFJVYau2oDq6ODxaR+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jHKFZhi1W9bw6P4I9HbzWa1WcY02yr2AaOCOjdReWeFcuay51/NRSDR/+A60FQ26jKVsIopZ4fVz4nfml+RSQjoqe7dsz67jmpALFejuEWQLQoBsUn7Q5hCl+YcSZ1WiGcx80IT78RmcHVv5Udl+PCFeBwwsJ+5d4N3tkkJsktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J56Vch57; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J56Vch57"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1160364b3a.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 22:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699155; x=1778303955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrUF75Mz/1le31qBCqb70yVrs4hFKnGVHUNBS1DYUtw=;
        b=J56Vch57McWQ9H9Z3pMHuki7hOTEqvaqC9arzPEb4/OoQfBfUaaLy86RdQb7rc1kL/
         YuGzWLoq5WjIMGhHXTykUTlEOsBjhobaWKEaW937kSBiVYmUtJg89HAC1WH7whTbABiy
         D6fDagCBEAzWZhWjKn3i+mC7xoKTKwG2dfXbQAOF/bTVFTgwOLh9FukA3IDdRloNaPhS
         wovzb3g7vkEkU3Z+AZif7Cuctwqchr4TBy9kYlfwQ2mH6adl1+ETsh0OgmU7brxYWB1M
         U5HZALmBA5QVs3Hr7zoLR2Iz7Xx8JJb0PaJRjfyD6+jBaOp5mgjTTSN4QA7xK/epEHLD
         L4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699155; x=1778303955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrUF75Mz/1le31qBCqb70yVrs4hFKnGVHUNBS1DYUtw=;
        b=pdwwUN0Z22cL8RTpB2GHiq4ZlSZJD7RPMuBYkkvislnt7OgPlJqOfrF3Jhn5fj0I4z
         61Evw2SugiF+GKCi1k9xyxf+5FctpaBtoSX0NRIAbVzPGT15+xm7zoqlUCut+pYjUF6d
         +56m0uIKASp7zdA6T8CCcnvGpCZQD7tQhBhI+UPPPvUk8SSn7I0IS+4vlKcQDN33INMA
         8CRRncPidjiVQT0mC4PAeACBfdM7rFMoRfuZGvYoSEq3l6CbXaObILMiqD0jfk23rIzx
         rsm1YJJNXmj5+ixW0KbEdiuvL2zZ9pgZC8m4gLBNg9OuNH4kf2/68yGNSY5HdZkyD+u/
         PiMw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZgwIvHtMPzxP/+p3f9M35xPjSpd+MuxTMn6D5HdGPTEmeFcoq8ccSt3mzY19a1mtF34UwzKJid1o0@vger.kernel.org
X-Gm-Message-State: AOJu0YylHXQlZ/1qOr3iwAFooYUyEoEPipRsXbNB3Z356GtcgaxNdB4M
	Ft1IBYCdtsd6Z8/RrJIpvYlCzwnoG7vLZcSD1FbIXUwUELA4tx5NNVBS
X-Gm-Gg: AeBDieuTBKXyZnSuiAoiB9mYjJixwbeYP8Nw+kzdH0kw651n/w1pO70bei30rYPuef3
	8zSnU7/3JPKSj4o8LPMlWRuQXX7kDBQUqAUh2USvaPNFoqM/6kAIicMpKNWsw6zHogaDHt+EOdz
	9ynZZxDhaLgUG5i00HQF9HUYsUowiFrOCkkgRRDvKltdBI2ltD+OzqXMuE5riPPkVfendH0iddl
	RBN+DKk7VDtp+dUHjieJNvOnOihmOucWJw8YdIVoWPrv8noDT9Uocq9EaXPT7akGNpepDNOyt75
	BULNa2wYbDMzbdIiE+zcqnNrgh/xTZOGHWDG5TfDDeHX7TJsatTtx+umGZz71G7qIi6gI1wQ5k6
	Gu/NO+hcPEKTO06MHvyoXA1MTpsbAqjeXi+AGTxzdKL5M655lY8S7t1KnaRkXrkjeDcdY2BOg6J
	Rz7ydQDqoK7fZq+g4aY1zDzyxcLIvkzA==
X-Received: by 2002:a05:6a00:985:b0:82f:37e3:ae67 with SMTP id d2e1a72fcca58-8352d20b18amr1983415b3a.27.1777699154297;
        Fri, 01 May 2026 22:19:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 0/4] spacemit: k1-bananapi-f3: Fix the power source of USB3 nodes
Date: Sat,  2 May 2026 10:48:53 +0530
Message-ID: <20260502051906.8160-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following changes fix the power source of USB 3 and pcie on K1-Bananapi-F3
development board.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)


v1: https://lore.kernel.org/all/20260325081700.1502-1-linux.amoon@gmail.com/

v2: Add pcie vin for pcie regulator.

To verify check regulator_summary for more details

$ cat /sys/kernel/debug/regulator/regulator_summary
 dc_in_12v                        3    2      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc_4v                        1    0      0 unknown  4000mV     0mA  4000mV  4000mV
    vcc5v0_sys                    4    3      0 unknown  5000mV     0mA  5000mV  5000mV
       PCIE_VCC3V3                3    2      0 unknown  3300mV     0mA  3300mV  3300mV
          ca800000.pcie-vpcie3v3   1                                 0mA     0mV     0mV
          ca400000.pcie-vpcie3v3   1                                 0mA     0mV     0mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV

Thanks
-Anand

Anand Moon (4):
  riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for
    Banana Pi F3
  riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard
    usb and label
  riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
  riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V
    regulator

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)


base-commit: f1a5e78a55ebf2b05777fd5eb738038ddae609d6
-- 
2.50.1

