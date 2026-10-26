Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042304;
	b=CAOp2cB8omaufDV4vAG+ZfvTCOBpGdh/gGOlXGgG+CbH5K7cW5AvPBAvUeH/lsQoewWD
	 qe9MamtBfBHs4FqWFe7iSBa0FKienSIj7bINgPalhfaMu5phvI78YQL0zFZZR5X0RlS2G
	 rK1WjGyGr/okhvv5onKgY+dfOI+80ORO2xL0OcyHW5DF2QH0DmLt6hH+SGOTUiAIpXB2u
	 rMmRnVFQS0zQjlD+HAIiYo1tDp6xCrZvare6/ucqvS7IRnKZ/uYbsgAOkvDhZzVD0a5uF
	 ID+VOAAKMDyAyxwZaQNaHoiaZhNpuqCCJ7RkOMNh04uuI+wMIkbLxiM7P4TloPKEWQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042304;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
	b=mw0oRYjY2Fy50GHIo67dX6avhqRpa6O/fdF1gIN09tFm7f4ex1egbISYGHwKVZKdpMU2
	 1oPydUjLw6cgGkW2SQ4HbaqzVBtDE1DzcU5nzCaOEKGK0BxN3Jvn5eLF3S9eojUEiegrj
	 ZCFE5zZVzEAJUAMk76NQ6r3Dj0H17C0eETUb24Ad+6sHwgeo9krRkj2joZlF/TcrRTTWE
	 Y0xwSkVClH2uGtJta9JLHk24EBWVgdEOSOh4dyofshaGet+5plQW5LvfZ76UMWlGlTsnA
	 3nXm2Db1gzeXM/86hYgu8oGlc/hQMzXcxPItQuTChEcmKwMXT6gZk8Kl97m3FaXoH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FLfzHe1d;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98818606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98818606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FLfzHe1d
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc758830601so2081265a12.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042303; x=1793647103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=ElC0zhOL+ctXzb4A8IvQdinvtSydDjY3op8U9b4j0hnj40A4cuehXgHR/pfNwxBssb
         kSSuwLoEGByksnHw3sDDHsDqvW8MjZkgHgWL0xS8ttZ0pvLVCTzrQI0IazJh0Xw5bYnn
         3uRGcOrqcJDMVpyJL/0PE5NpFHahLPam+szakJ5bw3vtMKhvZv6jlSqz2LOL1PXk9Jg8
         adrV7+Q1tWKieFNM66JPgw+jrXf4lLqqGpFNZVIAdaUMwksvjekesxr9cr969erQz+Wf
         vf4FijAahluNBywshbqohg64zaxgw9Up1hvmeUXMpUphLnyfSZhQp4fP0L9Q8lp8bpuC
         5TUw==
X-Forwarded-Encrypted: i=1; AKwUvByhgBA3lg08hCEFXJlRq/nuix3yasKr1/NRo/4fMoqH8z04o7OduKkHLMrUFN347DEqTfTwQFMBZ6a7@vger.kernel.org
X-Gm-Message-State: AFq9FYJvqoeRocEYAdp+RKV9U1y+dxNNFTeFOII/kiEz8gPl+Y/SbNYm
	7aCgZFg4KH1pKSGWsSHtImQKzCLdTndEdThy5c+yKznyfig1XxTFR31Y4lwgAuzXAF5sCrOREVN
	JicK62CfYOx2EiBWMKR/HqHr9WfuS0drajl98RbRv/1/VFK/cYGNuR2h7HNT2QEO+QGVf6VaTtw
	2ZAGMoD3lJ5WqH77do9A/Z/cHVG2HOem5adPKV2soOr2ZUeYwj5vDEOw2KoEcG+uM6af8zdI/gr
	/HOgNTQkR53liwXfHbO7k87
X-Gm-Gg: AYBFou2uOtOve4+uO3wMn3XFobmwMTXH2Moa12L2fyKiwOExlp3uNrroQwtlbIfdwCu
	kZ/8CdbJVGS6ZMSE4FPIEbJShPc22+qIzOyBwkTyJui7jXrIuQgY4Lluk5qhdolva1RC+FgK5q4
	baMcsjpbfwLEwIdWX/tgBeT3UWR2VzbaTuqtG9H9klWMXI7t8vL0lOKNZWSUKwQSZFKaEnHDgNZ
	TWypyH3lb8CLrpVD+Yu6Riepp16B2QaRkScHaDcH9+y6v/EmmGZ9c1shun9A2rl5ENtxn5uJYEw
	+AA4GtyZktqsziealpLI76pizjTQvg4zPufhcN2TD/nqKmXaFo3o+7EcREZaUV4VfiN6AhDqNbV
	J5XGFLh6YO9xq8/BhoKHkHhlfjZhv8IsO0EmIhy4LAqqAE89Tc/pUoZIRfqSiqSK/z27jGQ1l9N
	BXZ0gmW+T7Rkzn7YEkVn5ZUQnUD7JOOuOs7K3s5o+Eo8A=
X-Received: by 2002:a17:90b:524d:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3adeafdd84cmr6439681a91.65.1793042303041;
        Mon, 26 Oct 2026 12:18:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae404ce404sm357792a91.2.2026.10.26.12.18.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533928ef33aso41733921cf.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042302; x=1793647102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=FLfzHe1djyrgGknLnrbV2iyn0+b7P45ZbcwPQY9TJIge9BC+PjqDclYVFX53hnY/4r
         Z/EDK3eMtxCGXBf2VOcnZMqfR9xiouD/BGIe+aNNV4ZRE7dI/R8iR9Tza07JqWPb2asA
         FSNMuEHOf9KqrEl+KaaqlEpvvvsSlbxB0THAY=
X-Forwarded-Encrypted: i=1; AKwUvBwcYmzisG8N1tXrk1HCX2GVoG9hLEfNVmsS60QGCvfkiZnnYtMcMwvE+HWHiQ12vK010sEvZaMrAecM@vger.kernel.org
X-Received: by 2002:ac8:6546:0:b0:535:a5fa:ee0c with SMTP id d75a77b69052e-5383b66652emr111406421cf.76.1793042301519;
        Mon, 26 Oct 2026 12:18:21 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:535:a5fa:ee0c with SMTP id d75a77b69052e-5383b66652emr111405901cf.76.1793042300941;
        Mon, 26 Oct 2026 12:18:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:18 -0700 (PDT)
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
Subject: [PATCH v3 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 26 Oct 2026 12:16:18 -0700
Message-ID: <20261026191618.3178830-7-florian.fainelli@broadcom.com>
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

Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
remain enabled, but the disabled controller leaves the eSATA ports
unavailable.

With explicit IDM clock/reset setup and the corrected shared PHY
register aperture in place, enable the controller on BCM958625HR.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 53acae385822..f6717ca76aef 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -184,6 +184,7 @@ partition@700000 {
 
 &sata {
 	/delete-property/ dma-coherent;
+	status = "okay";
 };
 
 &sata_phy0 {
-- 
2.53.0

