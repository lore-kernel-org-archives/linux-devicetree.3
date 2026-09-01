Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C52D483811
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283265; cv=none; b=QuwDi5NOJe+euBuPjeGS8/8sAwS5EhezT5++BnIhq/KS9GRieKbVXSMKplyNLP3HN0a6lEmufxT2/zuoNSYhO+TO91imjYStqrPQXGVUZWFyTd2SKG8UfuQUapez+rXKdJceKnRcO2cDfFhIX1E7xIwxnh8llQWc99D/abGz5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283265; c=relaxed/simple;
	bh=cT4BBpHAqxNuLzOsErL2ZK2QNlhFAr9KUmL6LjbhLBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7Bu8neQIOhjXQzFy1YIcNWy2BRpmA8zG0HBXHbfMc1W5UGWvZ/xzQfycW7SpT/II3k96hpgyZyNHfQEdSSQhLy6VX0Dka9X2RCphGEJBmD49yrRHzoO03vzURfxv0zlC2TbzO6tncomeicuMtTsH7pw6lpmUAP+oa/Y3z9vhds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=L3O5bEdw; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="L3O5bEdw"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52f9e79ed93so191021cf.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283262; x=1788888062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1Kd6YHXG0ln8QPZUcILiAmOUtQjXjJoInkmnIaSZS4=;
        b=L3O5bEdwGH21Ke2FJ43ymyG3L2mxGq985ZxmFo0AorcOwf/tz2Fn0rHpDxiScstRWA
         M0mPU6xkUoxiRGct+2JDbA3/pDfn11VEG3QEw5ibirbMq4VAldBvRzP6oykuVedubmrs
         +z10Unb0jawsgYgP7GpTPRwWg+Yvbfllgj1yRHUXp/SmmHE1dnNUHte7fIyLV7GCiZds
         8Iif2kj/3dkWkInlyoLub4v03z0+7/4IeA6qWTQQe465x+3tFxZGidTmd9R5sbk2I+kZ
         aKPNdl3CT2DUUAzel5H/vvZYUysxdcuc/Y3nZFQoiNuZxCqVMR6BMTylpKbnD5yiSiGO
         3jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283262; x=1788888062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1Kd6YHXG0ln8QPZUcILiAmOUtQjXjJoInkmnIaSZS4=;
        b=Nh7Ac2wjOixBRq0Bza4Y8R0PxBsQr0b97cKdGH+3mCEpFR8fGVc9RDXhjAoDe064uI
         zoOWdPjOoq2nMGyjCzXYZhbHDTBMV7xsIIeuWcPKqJjOzWytRJfvon44GhRJane+c977
         6y6xdwpXxv4DjhXQa5oTOPRMMgs1JZP3QXTSe1LLNwU6eXTz9V6rnp82GZovT2zVjZh8
         qDEKv6cGxbARx5JrgV9BEhfHZ1OVcC6JTKGbwdjjVEMZNQNXEqhiXVvhXgk2BhDDGj5b
         hVkWSb0eZT2cRyAEZDai5hL8bDD48NQOKuTPgErZr3f9ctjmToKk+z/IdbycdocvnEp2
         zSxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjXlQcYSLDGj7sq+iw0BLGrpbWWk8qPgNXpozZphmugFPfMbBW4natPe5zbV7jO8aul6bixrRSmSYz@vger.kernel.org
X-Gm-Message-State: AFuF++lnm/lnj6X+wT8NgTWLRsgDvdHLu1i0m/SDHGqeRMMzLnU4HVZM
	Rz3xI8REaIR1L72vX79RY1W3LU4a4dIKUcBnNzXNWqWdhBmGTX/cZcDonZrh0dnKhTFGBNZLpJX
	Ue/oRK20=
X-Gm-Gg: AR+sD11aggwfkODSbTFUSlMIkLb7EZqeDx3j6b6+oz55GCvfIRj2tn2Vtq7/BIx37qS
	GKuYtGaT/Zmr9g2Ha2HhD5lD5TqzFgC0MZYm9toMSIJhaZKibC2yDczz+7/TGcRt5tF/OY/JMUH
	vEt5i76xKcsJTcH3UCCQny5QXhpTKfxElntsCPdye8DVf6uenGMkXxf4c0QC3++enBSR/S5Uu5x
	QPoY0Q2igBOqR42R9E+6ZHYNQmv3IB0F0Ccuv8NFb4k2Ghi44s330rgi78F4llP0U6tWbYNyQqh
	Uu9XXHQ+OVCwhtZt1Ex2j/i0PKQYGyiqmwCTk67OCG+DS1geICYUue4RBcH7hsdtW6+KaZ30e8P
	W78+vuHTGCMFGjzGsI4jDuLNNrIGPaXdY5wxu0pZYrwMzMJGMdiQ8joi9zfBwKT7V0WQ+HADcTa
	EPKHL8eD022JhDi3DI8gN4g9mVESuxKmfEdz27GvU/+J64jIgAiTtCq+o0IvxS4Ydl
X-Received: by 2002:ac8:7e82:0:b0:51b:60f1:689a with SMTP id d75a77b69052e-52fb938d2c6mr424963111cf.7.1788283262313;
        Tue, 01 Sep 2026 10:21:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:52 -0500
Message-ID: <20260901172058.1512508-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The TC9564 includes a PCIe switch with one upstream port and two
downstream (external) ports, plus a third downstream port.  The
third port has an embedded PCIe endpoint with two functions, each
providing access to a 10 Gbps capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

This unfortunately changed the way the devicetree code treats the
nodes, because of_bus_pci_match() considers any node named pcie@
that has no device_type property to be a PCI bus.

The previous name "pci" matched such nodes as "default-flags" bus type
(defined in the of_busses[] array).  This series restores the previous
behavior for these endpoint nodes.

					-Alex

Alex Elder (5):
  arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: use pci for
    device nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci for device nodes
  arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev for device nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: use dev for device
    nodes

 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 4 ++--
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts              | 4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

