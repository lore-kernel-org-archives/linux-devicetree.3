Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279497;
	b=sb/it4Yqb2OqR3Ap0D69hhg+k9a2uTlBUamCjtuuxvIomDnQRgCArkLTWs4/p0LmsuTs
	 mJJ531TZmcy82L9Lfti28Bwrs98i1/SXlb9IvXSxHohESlON41r3YPGwU14uerJ6m5CA8
	 v/J3IYKs3s1W8KewoiafffVzGgBqYkAdQ4ccDeDFdGVN1eZKE2YddtaKZ5uQMVJV2yXab
	 AEYJmVEP66dVsQ1cQdP4QmM++0kxvymik+k22tcmh762Q6xVrPWf3sfWYdib7GWWjYkhB
	 0msg+RYalQjZHbNm2m/x852jz3sFgnSKEFs2kgoEzt0ESaJqHUR2hpAaknowzb4C/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
	b=OtZHihQ+9OPL3NEYD/Ysx4bh8viaa3OhZkW+aheoLzw9EYadjrslJQUUnhpox4aBw4+b
	 dFNGCwaakETyZMXDjkgX3fw3CmXzlaUWqzharVeX1I3t/WceBl1tvLdSvFUjcHTGMH862
	 jL3K6ayYwaQCuVRzpInGEHpBzyoLkXX5re4p+5SgWjmz4Tl8EDtK7zUey1c9txszShKjh
	 347KFmVuLe/0OL/ktzaAdjyUtlQFmYeP1Og7z4UsqHMO57TUsZ6So4BAVKWf4AdtS0Ocy
	 FZpBFspiiJbZuxYfRUh6G9Rxlgy0g46hFllGh831KC4BfdT3F1s0vfUmnjjx20VmsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9sT3yV;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672C606A335
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 16:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D672C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9sT3yV
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so2323699eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279496; x=1795884296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
        b=hz9sT3yVPSsdmeXUzzQ/OVC/OtIFzaPMVXX0ckbqhQbtpL+VG+LssjROz4BSKZt9JK
         cdWDsaKEMuY1lyAqQeaN7+6CYDSclB/TsmEnXzMnrgNaz9GOzouZBF8sakyd5gXyqzsB
         Etp5/+yHAoTCBrW9dKobmkzg770jwKN9wJGyM2lEp+Y+/4mVArdhuebn5B6ahstfGnbB
         EXkoTkHe2aAKCiC7P7vcxii9Vt7ef0kwbdY714wM7sUFHW/64uwK3vDHooaZVrOiGdFL
         eUE/kVmyW9uFt6duKhmvb5w75l6UlHrGCycn3VNVmeMfHJm/TU0RT//F+qH/hDHP0HLa
         Cfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279496; x=1795884296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
        b=WJQIP0yxc6lGxmlrGhEAc4U+7jSwB2azJtsAr26o7r1ocVZLtgUBlMR4d3EMF8BQcv
         dwp9PQ23SKriKJC+/RqLLUoBNkKcyxY4an6MYS9ZbfU1kJKZ6PYzeYwu2aGVOCtRhZp+
         wlzsQ74tcHDo+Mae6GW8dmfSdEMyjbU4IFR5ni51N6Ra8d+mDagYOxFppKMxqYmfyhVe
         YiI7DNsvW+kpdjKyxBSKB1Nn7AmkyeGOhQRyGlJcuHdP5Om5VNaPYK8+cXOWxynYDdbH
         ApdXm/7JXvOHudZ8B/LeVx+KeMyzXcOontTgbbbBpXdAfP5zifNLlsHmzF9DiG8R8/kl
         UAZw==
X-Forwarded-Encrypted: i=1; AL+hErFaXtD6Ziw3eoL2rDf15ex0qjme8YDmEFkVWNXKljY8wJCNMCKOX0UCdRxrzhx0ediqERH+ivFC4c9O@vger.kernel.org
X-Gm-Message-State: APuU4Z/x9r5OWyi8D5PBKbzeNNka84GUol+xK2n6q2t7bSp9fC2XPFg3
	r7BoibHb1Mb3O0dAjrT5vG8w6aDk+/mUg7BhVhPXWtcR8JDJCNXubv8K
X-Gm-Gg: AZFdTZcqKVN9m37PtjvZXUcczqujZHvf5uYTT0MYPj1MgwuY8lY1yROeqHoEYlZUdsH
	TAgg1imf9Grpw9Q3CAhdxQLZvQNkVEF/m2juIaFzCciAlAqyGxsRvGForwfxKPSnn5aiBn/2EsD
	w+BOWKkKD02g3mSjTwIIOIvHAw3gAypGCJOTxKLD/Rfv7WSd9e64FNyhobRmgTBclulgvbJ1xFO
	F45TeNYmr2U8/+9hCWUtDh7NVbKu6kGpZmfDhhpV3OvEykyo2pPjWh2Qp4o7hCOJIt2xo/GSDBJ
	AeVddX0JHT/n8rPSJ6O32cGowVHnUeOK88Z5zQXMFahfMvmQmhG4ckAjY3svnH/nrs3jn2ldSJj
	iWBDBOWNs21eWBeuJW57XzZqNvg+bMeTox8XrKULZ0Oj03YJProK9jubV4w9YGoeiMqMNQHTusj
	2Mo1OPu4TzSvETU14rF+E7bIpiMUyARQyIWEMTL6V3MaaYOaQR8sa1nb+sxLmqX+NPGvml3jkSx
	N9QDDXSXbS/44v/EbuCN8zLo3chEAxmIVSFPQ/N0Ke1m019OGFO3w/daychDpqpV0ZcOAYKXskJ
	By19W+CNRxAY9aJutSOkBgywtpIU4K4qwSNIoQ==
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr8320187eec.25.1795279495752;
        Sat, 21 Nov 2026 08:44:55 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm18791440eec.15.2026.11.21.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:44:55 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: kaanapali: Describe the UFS MCQ registers
Date: Sun, 22 Nov 2026 01:44:53 +0900
Message-ID: <20261121164453.26-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

The UFS host on Kaanapali supports Multi-Circular Queue (MCQ) mode, but
its node only describes the standard register space, so ufshcd falls
back to the legacy single doorbell.

Describe the MCQ register region and the ITS MSI parent used for Event
Specific Interrupts (ESI). The region has the same address and size as
on Eliza, and the ITS device ID 0x60 is taken from the downstream
device tree.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this more than doubles 4k
random read throughput (fio, 4 jobs, QD32): 186k to 431k IOPS on the
first run after boot.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..c841a1e1e1f4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2536,10 +2536,15 @@ ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,kaanapali-ufshc",
 				     "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01da0000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
+			msi-parent = <&gic_its 0x60>;
+
 			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_UFS_PHY_AHB_CLK>,

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

