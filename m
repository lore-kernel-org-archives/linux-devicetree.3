Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93035F188
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295068; cv=none; b=tCyGF/w2D7G5N86iTMs8advvPigWu6Rw1GJxFpIj9Vd0sy+YNn1cd91tF+9w9mFoC3Ry9IYOBTYXKc0cgZQ12Ktl9WVy3ohw23Ip3TRIykOiev+ut/exPFjWN+HXXuo0oOzDCtj+HsopOu5Su3APnM2tt3iupXBE4SNlNhzEoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295068; c=relaxed/simple;
	bh=aUrCSeofNzu8/MrUBwZdZqw4tYqho4z9B3oD2u6iUbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XklU0UHXs8H8oGe9bdRfbNii1PIASOb6WMuCUjcQmKeumVvwDnWPzOaQWUJRd5tqFKESoFlVud1Y501xYSML7nNMkZkT3XJ/AUHKMaVWeVU5KS+s1pZq5o8c89bpWDzCnjL+wShpoxxrUvXlnPbCoPYUvtjwCeNB/KXBdyM212E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZp3EiGu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZp3EiGu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab39b111b9so14127515ad.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295067; x=1774899867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WarRcioHs25DGPZf7FPz++9Cb0BrMHjT45zAE3ZKzws=;
        b=jZp3EiGuZRC2M7USeBxZ0Jd93E0Ds/1UIZOI8wL8N/77Y5sCasd4WzrR1zxB9St0vi
         JF1HsCtBR2ZWiA2iuyHaDx/kWlcooH66NynVOPcAmKbQkyx/nztaQfHOsE4Q1UiiwlB/
         wXMhn67Ql81lAhY8q0YXJOBN0SinBGrBbk9zh5AmI/dEFCMH2JsIBxB8AjoHtDhlXvWi
         obuSV0EO86yseiX0PeGPM+nJniEFfvFKbXlllQ638tyG9gwkVRY9XvEAlTMChacOiQHP
         M+z3kVhRo090xrGHcTcBwKfOnQC8hrfWyX+tJXCZI1RwKBsCUWIR0oq4k4g7IQ0mIBdd
         8gOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295067; x=1774899867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WarRcioHs25DGPZf7FPz++9Cb0BrMHjT45zAE3ZKzws=;
        b=K5ncsrR9o2O9MhlJ9pSEEFTbWlZdl8OnI3kcZkyQZqSL8MsuBCdKK9pq245PTTc5OW
         te+6FWDlcSB1bwfFZrUglIbFqrKiowgUjFIBZAEdZU0pmG9REcsgo5VtoQIlWCvZcbJb
         X91G1A7EbuuXRY5SwzLFRv4ga3svXsEpm4eXDejz35P4hA2laqFzg8i/LQBeoXg7BWBy
         vFHKxjP1aoZAOejsL/VTmQYNb3bded/2GGYMbpRxMfdJ5LOSTESia2Iyy4g1ckSDorQZ
         UrykFwF/79tfvN5EJC+5xd5F27U7nzgNh/Bc2Q9YLWrvdWF+437aM8Y0hbDrytGt0+vG
         d0tg==
X-Gm-Message-State: AOJu0YzR4ZHiocEd3cu019LJEcZhcgVllWYDbrWWFlxpQ7aMUAFUrN5G
	FMPrvZen0nLmkIeM7Vz7YHduKWJdPvuLCIIooMHbr/cOOOkoOIk+iDf/Iqp9+g==
X-Gm-Gg: ATEYQzzIvE87S8EyRpdNb7rqS51nXAiU0LVHOucqazY99gyl+hibNOuo5EZHlbjkTP7
	kqlxGWG0d81CYoNKTkJayPTxvRRipbvePWzWTGgr5TpFeIgF3W69D4g/xOTbxUnlo+xc2UXy4ys
	bY7O6Lta2COejeoWz9nQB5IgVuNmoT6Ja4C0SP8IfUW+nRY/kObr/907CotmGgL6BRjrX5EMTsU
	aJhvxJqOKrc2KjeIQRFxnKy3zGBG3wwOqavg+X4zOVJk8bmCPErp+hBIRQTnoge6FoD9UGxXSSB
	+5T+OPuUuY4A9rJ5ZaCbsDU88vX+KaDV3H1JmnEAn4i3KxMW39EkYI+Jfp6ktWQvsyhj/HIzg9j
	fIlCc0L6UBNac3mLqAO0cUuVQRLr2naj61aY0wkp1WLMXi6mgNj575XKvvyDthn1U96wuQpudlF
	LFgPEdRGsxn2nwJhfbvzTvnjA=
X-Received: by 2002:a17:903:191:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b0826ffc53mr120406955ad.9.1774295066862;
        Mon, 23 Mar 2026 12:44:26 -0700 (PDT)
Received: from arch ([2409:40c2:5005:bea7:1ec:aaa7:ee5b:2371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm152080805ad.60.2026.03.23.12.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:44:26 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com
Subject: [PATCH 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
Date: Tue, 24 Mar 2026 01:13:58 +0530
Message-ID: <20260323194400.22886-1-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Hisilicon dw-mshc text bindings to DT schema
format and cleans up legacy node names in Hisilicon board files.

While testing the new YAML schema, dtbs_check flagged the hi3660, 
hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node 
name prefix. resulting in warnings.

Patch 1 Convert to DT schema
Patch 2 updates the Hisilicon dtsi files to use standard 'mmc' 
node name.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
Note: this patch is part of the process for applying to GSoC device
tree bindings conversion project #
https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

- The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
- It is used in following
    /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
    /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts

Bhargav Joshi (2):
  dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
  arm64: dts: hisilicon: Rename dwmmc nodes to mmc

 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 111 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 ------------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
 5 files changed, 118 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

-- 
2.53.0

