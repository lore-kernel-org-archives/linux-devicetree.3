Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042298;
	b=rdRAhhE77ml/03tmp0PJZzVcPZIQjMdPfdP/1TlwnPJ3OJSAJOzAi1vPV06FlzTgAvnS
	 +bETePCsb4yypZpOr1sEBacfEgu2nQsEfpxoGYwHhAD6SBwtR2+GMI1bB3plzSpCR0zRT
	 G8+/kUHWedtG94kdJy/FSrqMB+Aae0KRta6kogx8vEXyHBgogxMRtXsixgHrxUKfGqARp
	 7yGgqNr9et5oyXbjBjR6Od2sr47Oy2PwLPltxBnxT0SDLOR6jpOj3jsN8Hf6db+9sGfPL
	 qjJx8HyeVUOFISM8KMN1LLBUKl57EoObnQTo/VLuUrIw5xACu5tm33nFHXI0PnA92Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042298;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
	b=EDtep312hqWnmq3GKBirhvkxZGV8Td34Bvw+WHhZLxmLvCGUgQ6Li+E6reEeVN2v6UHw
	 Vs4aKJH50h6fUjvGV93JvURzbRpG8jOkh4LOrayGcsQkhTbVEJM4/VJzd1o+O+ZbHaGXO
	 rf5myDkO3+/yoGhTbULI3PDxMm24jgbLI4//99c2v/fDlDa4HGSVAg/TRqwH3x6XFmJTx
	 SpLIyKM9y9gkySvt2lQIaxSUnEh7S/NR2OMQH5/9+T3lDlOgDaCpwkvXG4hir3m+lozBa
	 pueV7EMDuPr1+wQkAkr31CI8w4OF3q+NL2H8bLI+W5R8zYScCmBgn5xop98Q1bj2UEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S4MriBoQ;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C09606A33B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C09606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S4MriBoQ
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2304496a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042297; x=1793647097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=vbeLiqZ7lro8mePCvAr6UB1G+0+M4JrlOdhfwwxQ4QCa4wLs445V+/qyilzk9ooqcC
         8/hGpTJfAZ020mc3bXKLHZJGb+3eY3BjcYHu/PE3SAmHOLxNdVZ3pnsI32TT71yZq5gC
         7UEPqFiXDu5WDCfsJVb7ZJtDVyZ3ZKUfe/hpYYyQE9N4D79Kr3j8ycfr37bptHqttw7p
         0bxx08xExFmwVlSQJ28ZwZfmJXElNjtJM4F/xc5jUj6jYpAWRz4yeR1Y1l+u52kvSa/G
         I5msgLs2nAx11QDoQNXh3Rc03d105+vDJbPRImNwgamyRmYmxb90d/G59yTFBsHFUaLE
         Pghw==
X-Forwarded-Encrypted: i=1; AKwUvBwhOb8xY0eTlGzywtfjGpA6aTACOsgpvp84g3zp7b8YQS730lwdNz4zVdXWVmcBfTOqAi5yRtnu8ylj@vger.kernel.org
X-Gm-Message-State: AFq9FYImhWL0XqLfAnS7eiJS+/Deh6v3jDVEnvpg49hA4wQtq3ZRTDUn
	Ne2pzqGuDeS9OPT7PfyxcuhJo5cGI6Bo0DNmUf5vysqxMsC1USaltTjd/10Fs/lilatCYIOl6eL
	zpea8WZJ9JRO0tJCeoGnuM8bSUsQ9EkFwx8kvvo9DvQjc3QR8oLYGa4wT20Sq4kqTdBwxCwtnfJ
	8zRBR7K2J0reyKoMsKmk2LAS//ON5gP62Qdk5QqrBqeXamDspfzS33wSZlSNHjeUySjBayjaCU/
	Vztdwtbd4s6BPi0POlTvB4e
X-Gm-Gg: AYBFou3EQdqppBylIqNzQvmjx+FmUTDxLCzEMFaso2pCm8easyNtHIH12JwAOtEdXOJ
	lFj+WXLWhftrnDU92iZKOMWF5VOKWsxJXdE13QXKHuaSC9fOMC5tluyVfk/iadFa3r9MAiuW+DY
	qEQXmbclU1Ar/OQg4g/FsrOtbR0AHiVA7tdm8QvJs79B4JBijcSiqOxOmK7nW/vMkGYgc7b75fD
	++JdCLF42HRXP7T/bc+XSXCrFxYNREhw6y3paOs/S/KaR7b2Thb17TrbjS0XrY6cUgqjf6Us1bx
	5a29HlhQg2wpZjwG78LhyMjQEHWRFe5EU3IPfaFkfIbDg3JBCUkxNp3scOWHcMqBIFGqthgPGXh
	AgC10xTrYlcSfnUopkuM76nqBcfQoT3F4OQmt4zU4wR7SX6H21HD0tdN3QgIfSPoC4c2uOtwwWN
	wiQHmhtK3n3M1g08KN+dNJXqOKm/K3DhSn2ZZbQts/
X-Received: by 2002:a17:90b:518d:b0:3ac:8897:7ba9 with SMTP id 98e67ed59e1d1-3adeafd64d8mr6164988a91.56.1793042297558;
        Mon, 26 Oct 2026 12:18:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adeba45ee7sm3163205a91.1.2026.10.26.12.18.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso608265985a.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042296; x=1793647096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=S4MriBoQogvcAb9W58quK4VocXvh1bDHpCJk3q08cXXexUn3fBk434Wg82+eNpQiby
         yFHxjeNQuy/NgTN4tvwsUt88ezHzUJI9mIXBj06P4LjtBjOhipbyCqaRQYWkuP2cv40c
         tZGDBmIj/X4B9gh/8VwWDu/XTmG2lT6GdJLDs=
X-Forwarded-Encrypted: i=1; AKwUvBxSnk0GBa4axm1son+3ZIgDCnZOjBgNLNFGDahnHOJOKXS3RxdpdZd9qLUzYAYofQ7V5t3BetvbBVyq@vger.kernel.org
X-Received: by 2002:a05:620a:4487:b0:93c:29b3:3525 with SMTP id af79cd13be357-940ef8e9ad7mr1116010185a.36.1793042295591;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:93c:29b3:3525 with SMTP id af79cd13be357-940ef8e9ad7mr1116005885a.36.1793042295194;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:14 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 26 Oct 2026 12:16:17 -0700
Message-ID: <20261026191618.3178830-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0

