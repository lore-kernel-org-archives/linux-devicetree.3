Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039380;
	b=PcppZdlnTqJxaqhp8yl1G+zrpjOd09BiGsU7gpNk0EYlzMpkR0YMu8wmG8j1Nn0r1uK5
	 2jZfZ0PTj1YgJuCe/ORhdrrf/w5Hf9BZkOJwE0Wh23OcwKlCSgPeQxwF0PWQiUvJx+LkM
	 SrYC5yWJYjChj6F1uCb1IkLPhXVlfHS80n7P+BqTNEXCW9mMhkyrOo9UHYbnuEF+X/o3m
	 INr9eXrMo8h8Kvd77mjsLSNymZfOFE9+fnF7bTfamkftmKo2a3woAWPxlOU0mWISe4KE7
	 dGAFHFL3M3iO+wd9PJWa2go0clPVB6XxCJAElXrbaB3EVVJDH3yNp6P6YS7XbAx73OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039380;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
	b=EyP9zLfkP80/cFLn3aPb1KCp6rFoymuxCLjqYSTY51nueKaeX06ZwwiY1QmXoCZewvIq
	 ZGY9fxQguYySUXVAYGT856in9sFLqVr2y4AhXtuSbYHrMwwm2Qk6CF/Z9FJ0V6WEaXCVg
	 tUSoPaBLll1iqez5IygxTz8vpboXoGvQrzy6by7oeUweZSqbKUyIZw/VnHTTMUbK8PJ1R
	 YprbQ88QTRx89E/mD0r3TAwkIczoG+ZvX2N7ZzvqMVWgw9HMkXDz9Bchn6WOnuzcD6ifK
	 j3i75VaxaV8NuPoxJXAGcwQgvo596QIbtMb48Y6NUcEMS3yRZAlZK3YVRFXm+SJYaiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WkWvrgmd;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93A606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F93A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WkWvrgmd
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so988517a12.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039380; x=1793644180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=hJERp60YCCWioyqBShDKHbhoKesav074mdIxNLJcgCjHVJzCFiHeSxy2lDpKaws40s
         LiC1EJgixcz2USl9GLRnIoaPU1WixQn+vnVW+/vd1mYWiKd5JVMxdxxJJiGBrqWPY3Bm
         qgQkUYRTBNPEcyHxxaunIZP8qsRgJoAfLDSL/hw1rs5FUHRc1Vw0cU5ppGNZr6vugBH+
         CLL+9uNpOig78o2qcuwNomiknvb1nC73bGc7KjZB3kt7jzTCcldnjSBQSS6Z0kgHYwqU
         YH3lQe3pWDvssAPNJ2mprrXfx+2ofCjMsRDRkBCa0Ls3jBYyz+aI/Jf98C/1bpUAOvEA
         rPLw==
X-Forwarded-Encrypted: i=1; AKwUvByClhzB3wzbuzzI+iiGrxfiyZpNqJuwZzQQmajONOOiXSsMysce/pyHt7zd3ALw7jfCxM9f1OBBKP7O@vger.kernel.org
X-Gm-Message-State: AFq9FYJ04YirKehr0y01qRKCfzcvYc1doZIkASfMa4zbxkNf4RJhDacR
	OeK/n5MapEDJOYFsXNhaCkh5l1LYrNp/u9mu2OhkiXT8hytA/7dxfyoAva34aqB5+R5+aGaoFNe
	xt/HmwkvYrSccXBb0DO8vCJL2UvsiI4U00Gx2OHmsmSXacs3ZWyB5ACOkG2jO/bFPdsJGLdDSRt
	qQwg0iLcYkAsrT5GoRTXMtQj6+fthYW1kep3x5kW6AfRN16NLxvwM8xDvvIRpqSDMTYPC3oNyk8
	YEDCX2lPEU0gN9bBQPQ67sA
X-Gm-Gg: AYBFou0gW5ZUv9iUKikLinbkZWeOh/lQr2WVX2onwnQVXBIKDspHR9lU68sRvCb82DD
	IuU3ageiSiFDY6l3GYmlWC2zpinmTdP79RWLzRZ/MxcmZDrzSp9NZGlBS2olZZnvalXCOvC9MnE
	3LbIaNvIbn6r/F/aV4VQyIuLLNZxnQ/RXQWTaYQs7HXtv4k8FlMDfJ8NJdnL2WEI+rTk4RtfcQ9
	sOjeQ9ZNw/ajP4JqUKJRXa0bn44G5WJHqUj+31hSEITNPiRwRo4J+CKvX1/aG0rAfy11KAWn4xT
	ahXCW1MmfaaHZDZKLpL8qk0eNxCymC4vhLwF9FKG7oyOLuz6RDOASmxxxH1rigj+/qDcZ9zpnFl
	SgXeOZ6J7LfihfBYMkP9Q6rJ6F5QRZlkw26gzkPWbPAYQ0yf1W+z7LKeet89Rj7Mnnv48L5jRH+
	sL6z0VWMP3qr0c/F3QivxYH5UcxGOKb7ief5zkfKxnFz8=
X-Received: by 2002:a17:90b:528c:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adead49388mr6097538a91.40.1793039379646;
        Mon, 26 Oct 2026 11:29:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40619e2csm259519a91.6.2026.10.26.11.29.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so4801765eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039377; x=1793644177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=WkWvrgmdvdVuovyLoQ3QJgYuz1ZkJj9eQ56bDBXGJlNmvDc5/db+VnWwVBgraYA3BX
         5NqUKfVwLYOR5Uq5CWryYRJgPNXZ2AIdqgoaHz2WDjt3tA3B6N4nzczbwzWlzxEZFunG
         U6FMoXcAUqSPRCdf0kOkcjTd9hVjcAYxjwkvM=
X-Forwarded-Encrypted: i=1; AKwUvBw5BXfMgt1/uUFkf2gdqpk6RTPSGhfa0bPJiH77m2PpT4uOW6qsPhEv5uYDtBOOyAM2GQAUKzvTWgFG@vger.kernel.org
X-Received: by 2002:a05:7301:b0b:b0:365:921:8ce with SMTP id 5a478bee46e88-369e84e8888mr9413481eec.32.1793039376876;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:7301:b0b:b0:365:921:8ce with SMTP id 5a478bee46e88-369e84e8888mr9413439eec.32.1793039376159;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
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
Subject: [PATCH v2 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 26 Oct 2026 11:28:56 -0700
Message-ID: <20261026182856.3168686-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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

