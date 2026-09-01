Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A648A2AA
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283269; cv=none; b=dL3l8kgSE0ZJaf4k5dRt40wpmMi5MNjhf8TmmuEWMavy5s/QyvFht7QsvPDPvpp1vFeoy2b+CRQ6pDs5uHsWJmiaYJsb8DupgtdpLywuIT/YV06Y7riUnAT0BCkbQ3ahrgp63nSWotQMYpigOSp/L2HlTQ59CX+kdx2HWsbkWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283269; c=relaxed/simple;
	bh=00fk2d4bFTlZ83rXDe3waL00PuwEXFQI8b8viicDX8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFrYVEW1bLavqRvyqQ7fdb+alPU1tsdi1ZmRRMwtQRQKwg3RPMPb2XueUikwHxb6//gsW3JwGjBptY+wP+I8T+ZOsvxHlJLqQQTUk6cxQNe9whn7mGqZxU5KHMpC363l5xH7ngMcTHkubC1Kd1pbSNOfBj7QUX+04E8iH3U0lGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=T34yi+8L; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="T34yi+8L"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5218927884fso286711cf.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283267; x=1788888067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPkZSzl2Bkcvu9UW0A3Dp3FDmK7DknZNc63zeKT5t/s=;
        b=T34yi+8LdpSmXJY4+o/sAXpnvV+fwXSpm2PCmZcLD72LaqVt6dIAAQIUC6/HEMyX25
         UPFAwkcLxL0HeToMmArCs1EOSEowOPZpfwgWhZhNG3OY15B+EPOK/aNZhZCAr6YElz/F
         pBV2kG3/Qyv+Pjd5RYZrHuK4/ugrA6wpS6zC9h5Gu+SBnMFFtTxsSb5u3fdQ2/VOxyAT
         zsYUuIzJ/X59hTkuo7oBI7ZXB+6AT09X5ESfFOp6yBqZYz93JhHuMCLUMWGJYOOIAqop
         4PNvJiVcBVXaRvTLBO6keA7A7CSqj9RLQ4F1VkcQMgsOb73n9cw9Kg28UzcDy7QnUMW4
         9BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283267; x=1788888067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPkZSzl2Bkcvu9UW0A3Dp3FDmK7DknZNc63zeKT5t/s=;
        b=dbA1ztHs0bfH8rQez4Mleei54yoSykjGQw8WQASH8GDI6r5T5/ZOtIIzWnSIORfAGl
         XymBY/btl70K7WJPLT7tmGPydO2nmMyTsYcPSP4ggp8iUP+kGqHJLVSJfDtZHsN7BEt2
         ehkBX5/qLMDD5HcsGVPBStPN8YbdQXv7/KNchR1w3iXlYtPG5eB9cRzJboXDGpnkWeHm
         4RdWO/SHA6Fsc99f6ovyWwCuiJ8md6j7YhvNqNi8g5EZA0ecWNKL6EhN0Bb5bio18LPj
         CWvW2gQHGWeGzA4uH8pzAPqfI1CZOQAVDex/IbMVCiEcriRUuu2S7Fkjd98ToWfO7R+t
         4MiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkMnycGIrzUOfeuL6Ar7XSzxoZk5sdNDNoOcmoOyvkjNrTS9KO/XNb5fSoL0ikSixKsy4QmOPy5RAc@vger.kernel.org
X-Gm-Message-State: AFuF++nEExb8YLDvZNmp4sL+95X5pZOXz0WzfaHhHDasDws5469Wley3
	QWHuyoSxByKq8htm7NDcIdfrjuh1OXmurr4f0mbNOje3ZuNe8B/ZGJoaurzNYlX2DZE=
X-Gm-Gg: AR+sD11rm0JKti91/yqig149VH6Fab276UgHx6Ok83nZJDA4m1FFH6L483EkZkX8ekJ
	dMWM/FgwiATm/KYnyk1orMLHHGr792STstSzdcWnxcrX7qGO3CIR0eBdP23Q5rPJctUFQuQm/0U
	qKOZKJYeXxT0anB62hYDRNWkYkLu0mepgHhTsgrNIkQTS9GU842+j6ebKXAEynpTWVohqvx/XdX
	8nX77oVJj07bMsGSeT5Ex9g5rm9eKSH+6V9WOpboMhC9fUa6I9QK8G7zWABZcukV0dZo4DNQppg
	YpgQvphMxQV0XOBJLojuUz536t5WFMKg2zKFrjSvk1l9AYwHSiLCbxwpurXmp08l7juVOAU6uUT
	vbZlvjeDcBN/C+MjqlzkubYe/9DferyejwMia9Pj6GPsfl9KJjDTFUVOixmQdytLCSsatj6FNDp
	Jktyn5oRLLA4A4zKl0ShtOsTzJ8iEQMI0Rpkw2V+agYUQWp7icMleRUsyfFxtXl882
X-Received: by 2002:a05:622a:c8c:b0:52f:a319:da85 with SMTP id d75a77b69052e-52fb96af1b0mr463638811cf.39.1788283266590;
        Tue, 01 Sep 2026 10:21:06 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:06 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev for device nodes
Date: Tue,  1 Sep 2026 12:20:56 -0500
Message-ID: <20260901172058.1512508-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The Monaco EVK IFP mezzanine has a TC9564 SoC, which includes a
PCIe switch with one upstream port and two downstream (external)
ports, plus a third downstream port.  The third port has an embedded
PCIe endpoint with two functions, each providing access to a 10 Gbps
capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..a6e57ec8a1e14 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -117,7 +117,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -125,7 +125,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

