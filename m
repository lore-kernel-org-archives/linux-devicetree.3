Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505372;
	b=PuRI6zUKjpXCsh0h4ysEa76e0AzYlWZoYYTXPH7BaP4rFx8xD+KLnaSrueIzsPDUY5Wz
	 TBjgqkYjDWEHKp4CFIJtvmbHuU1aZKlc1eLvfN2calfpAbPqLXmBulfWhyQsfFMSt3NsW
	 i3qdlusUmICm53dtd2cFFMYq+yzqZuPwZf5jKRwDd1DMWAtVwlvDjwhMKGkHes3lDwcOa
	 Ac21bhKBu33mOwEEmrXwDC7NHyuEXykPSsC9BTyMMQyd66v32/2Xs6wGNucWKWiF+2WNe
	 /Qs0bX02lthW6zkPlg1klSNVioB02MhUQSMioWwaY+2J0i5f2pQi9lwQpmDbQjwowdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
	b=B5eaD6qCX3la6Ps+nhShHT4a3yU/zQmREhNESD3ya1BF5hjMgI9AeO6FPtY8Wwvl0Jb2
	 8D1Ohfcpm5zF3ox/xOsNo5zxntr7qNJ4D+SM9Pcj7AHT2XO5v/O1GuL/QljWzkbv5ZUqM
	 3ntOnPkm0FlexqtAQVCrrgN3h8jDeJp7K/+vD40ldoi7ZnOwsQ57hQ/kA9/h29QYJAfsl
	 ysn4fFCIN/PRDJwxXf7/vhp8q4ZgJS9flpU10VaP/Fe3/AyxljRl8QKdA8WIcelyB5aIF
	 4XOMD12A+jex2y59Iy4TWsmxtqk9hWUuqW9MFFgGbFI657Yzz4iKbQDBL+gAEdFZO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axi1U87p;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0C2606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC0C2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axi1U87p
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ccca948203aso3459395a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505371; x=1796110171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=axi1U87pEVbP1X43tCTM2vbccayBtnw4p02G/pqB7/99068i1ImIQcW+uYL5f+f5kA
         fjP27j+9kNvNSsEsvibdTg+lPLYTH4oXuBgsM/hBPywyoSKDMsQLlhltWh96ybs4LcCo
         HuzQMxb9Bzo3PI6N8oGbtJHX4vpg059UOsC55YukHXyhYj+ipUk17tRaiN5n0c6Q9g+z
         Uo/+0QlrU23sf7pgbHS0HK0AHcYNPqw+K1GDCOjeb2isWmHMLZoYLMO5fEUeMODU3Ke4
         MwMvREpjhKFXyY/Zb12wP9C5j7LMdp6jl3LWcnHHwqNFaVJF0KMyNAkNx0BDzN8JTBz0
         +yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505371; x=1796110171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4eZKwbLyr5C9ZRawowrZ+u9z/DgLN56Wne8sTMpX3A=;
        b=UFKJI6V5Th7IQejrdSVCi7Dq3XdiVehW4NGDkxSqdLxNt2q5NH+RDmIJMFKWacU4g3
         2lQwmLxtrYfcEV65+yL5w76sFLVWUAwl0bIruirai9sCN1AAkaLRS4ZuncUn8irLU8+Q
         TarlOt8kxNbUXgWsW9oc0W8ewqzbYVhXOj731vRs6e8CW7s7DL4OlrRwAFlQUtHga9IJ
         YTidXcuKO6YsgjWQirQ+MSv5ufMSwEIDrMZ/B44F9ohufwdoF+y8EBAg+95hGztgXBWM
         +juKJy+wwXvFmaUpBo3hkgth+zgx3Qabn+I7nnTBj+GyJ+RMBmHOxB88bIyuEBgq5kNF
         Hu9Q==
X-Gm-Message-State: APuU4Z/qAsVykLl7fGKMj9VTrSboWICt089myuugfzvl3OKIn9puaOWi
	ePP4G+z4pvXf0HXY8+g1B9l5h0YsQbaPCyElXXbrfmsMnDDSjAeoi5SA
X-Gm-Gg: AZFdTZd4mriJWguhgPZ/hKGUCaA7Vighyy6peiHABwAfjyjuG1Rimart1GpFnDomADJ
	/lVASGBUME5W8HUZCnhJeAjUOFOL9YDW3H2Mo5akylUpfpIJMmWcJ8jWndEV3cjcPSrtggzWNPP
	DpYNthM5nXtAp1RdwafMq2v/YD3VEG8A5hL3FAMIH62RzPSjK8MdGk1SD2YVPTMIBfRoGpIw7c7
	ChGTvkaID811cJLw2TuT4HgIyV/PP4mUcpgiYLLkkQpxKlr++9b4u4f24AyxR86yONxlWS5/lAz
	aaShX4IRvPCAHfFruyiEOB1OKpDi4NITe1B3m4MsJL+e3IEMxY3KzUMACwCJYALEINPzffe0+uy
	RlYuWnPnfpb/YlX+ppRn+Qtp6zgabnepmzE9Jb3/bZjknMAPXkIOKqP7mJV0FnMK9gDEglLwc+X
	g1QeCCuBECIFaBEZYtxf4uyDLQeIpC3NXLyb5Go7U6joymSrNuC3fMc0/ajgLArX6bfcguXQyeX
	XtCac4+UqaEv61c2m49IxLn9o2XjhZGtHFUPG2HoJMwWwabo5ZeY+zzUjig5I79KieqD1Wi9wrJ
	i/PKIMrBr6RcBYsH6mIY1Nqnnw8=
X-Received: by 2002:a05:6a20:dda8:b0:402:4f40:c761 with SMTP id adf61e73a8af0-4024f40c789mr8567537637.37.1795505371142;
        Mon, 23 Nov 2026 23:29:31 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm6519888a12.5.2026.11.23.23.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] Add SG2044 eFUSE driver
Date: Tue, 24 Nov 2026 15:29:20 +0800
Message-ID: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Change from v1:
- https://lore.kernel.org/all/20261014074516.240247-1-inochiama@gmail.com/
patch 1:
1. Remove clock-names minItems.
patch 2:
1. Fix wrong buffer size in sg2044_efuses_read().
2. Fix return type of sg2044_efuses_read_strip
3. Fix some style error on the driver.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,sg2044-efuse.yaml   |  59 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 176 ++++++++++++++++++
 6 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,sg2044-efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.1

