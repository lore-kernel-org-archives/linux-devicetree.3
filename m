Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309144;
	b=2TpEYuGt7Hiyb5biXrbpaX1Iws68bRuhgw/cbLv2Q8COBVf5pOdsm85kMt4g31qDf7mM
	 qFViqDwPwQZnsauxjfYbA74Wei+PYh7pXLZxkEsAF/xCouUnVbfuTyyDYUOTzPKGYiVZZ
	 c7QjfgwT+nf6UmcPzIxJaUC0bfjpZsv6MXh+n7twICVImop5bXHDuW38FXqoVye/1NGIA
	 tDqRIHrBewheo7ktoEoL5GyTwwoJkcYOVE+dgoo0ZAlw7katUExiVaNV5uHvI9r7WEZI+
	 ydXTaqAfj2kMzJqcSpJUYSi6whvFqSaUamRbtJgNWmrdJq0qmKbCsCFHIcdaIIT3zaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309144;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
	b=un+JcHyDnRfjkCqAKslyRB8FBPNKbra7RJQ+NoSpI4w32B0kNBWltl96ODGhUGDiCUr+
	 MEYTYoXRCC9kh59TRA7IVGd65zGKIhPTvqFYB0t3lc288ChdkjT1wyvsXmphVXq8DCA3Y
	 Or4WkMC/uMlrlhcgwN8oH+jthmpW26uCwPM184F9L0OI8wPJm42ZKCuTdYYhP3i8ULzeo
	 Y1BhHZ7QYqSeKDCFttlug8nNRkAH5LmVoikDdooV7N8rADddkIJqTrjp/V+dE3SBP85DL
	 I1feimvG3/ujI2DsR9ie2bO54SnBSYF3b6vgVIgFRoslngnGmSRK6+LQPwY+/zWDZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Rs2bK4nk;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8A60A2603
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE8A60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Rs2bK4nk
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so5261a12.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309143; x=1793913943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=U8JEWpt4QuflrDNZgCn9pDd6anNjtvWM28d2QxK4bmdgNm7pv3GZt7V+xRZgNhRGJQ
         Ev/fZG5LRH1NfJHI23P6b9VsCT8AtbSVDuISXlrKtR2qSqvgxwiLyZrCYQTZvA6YpJcc
         mmf9ixN1W9LryUR5OuoBuWQL/ntCLaBfw1D8SdSI4F0VrMRwurAufKV6qY1QWflQJwLu
         4+KIEe0PsLRhCX6fKNfYZ7ILgZ/Neymr5TcRuyygW9STrrUlu+kkgxxBjNlmG2IR3uFq
         /0m0nuKxdW5VWlsD+CN28rBcJlqs4ZZhDaNevTipCuyj+C2tnIu/+eFk2RSUxTHCwenf
         9OSg==
X-Forwarded-Encrypted: i=1; AKwUvBx0izzf2k3+cVpuldiTYYCqNUE/Txk/NGw4ahEWL2CXSXIUBnFbGfF1LvE2tqBPaegC3ntbiUAxhv4+@vger.kernel.org
X-Gm-Message-State: AFq9FYIrPhLGUdKP3i1bexOMCCSJCOf28ruqUm96/KAthmP6J3h7LBGN
	37X3By+m6no68GhJoR++AkP3ygAR30kR9ERYKWLaHct4KzJT0BRXtf5BsZlflaa4HX2ZJJNF15o
	eX0Q5A5vtiyo5Sbc6f3tIhmMu5obrotGsaGYQDeOjfyWXJboS8EwDosnYN4Xv0V31FUuwKdwIvY
	wgiBjITeyn0sl74CrN6ONmub7LKDyqm7p4yrzcM9bbKW5BfoCLY77uR86tvTT82VYDSv1SDmsmH
	x5v1qyYP1AEy2hjB3OGOC9a
X-Gm-Gg: AYBFou10QBn4dsKGGCMtOeTaz/TFHeah0a8BFobzvTB30S+BUrCaKZaOkxt0FXYIwYg
	+DyvVJoNYXaiKoMzNAZ3A4Vqc7Pn9nOZjdwWKw/AxSP6gTi7/J0DNrm/D86rx+MFK50XhnMKeFw
	zbYhrPxFdazPCseRBG8cHif88VInMpoLxq5HMnLABZrvJ4jcM6IWg9DHbZdFzMFSJgM0b+OJaL6
	Xf+Dq82+olf5Du4IfL/YC8qyw8iXjp8/AFy3NAFAa1NOhX1P5A1fb2xHh1suiCWNabE8dMfSvN4
	GqGl1q4qvMI+DfKz6fFWWHExH3bud+if/ZjTOux0D1BPANG07OFpGKzQTLynnJxaUWgk4vB01y1
	ryaAUl62brJdMCbr0B4tZhuxOJnTupLtAVDoJ9vaSv3cn/Q6oS4Sg0ybn9vio6Bgd9BMpEvwtH7
	KZuUg6RogoKiJXhOCMoNbw4dStEEwVoFcfqQAyw8Ed
X-Received: by 2002:a17:90b:534d:b0:3aa:fc22:8aac with SMTP id 98e67ed59e1d1-3ae898386a2mr187754a91.51.1793309142860;
        Thu, 29 Oct 2026 14:25:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae8444ce5esm627505a91.2.2026.10.29.14.25.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338c215ed2so43350361cf.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309141; x=1793913941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=Rs2bK4nkBOivnc52MHFqCl1oW9Lha/BFHMGDBU/VMkaLsFOcAS5QQzdQwc4x/CTH9D
         upkYTM+uNILLD+eGTWWMIm0I1s/60qZ538/h1SE5TxsKbE7G4PftioJKnsEXnd3Ctl/G
         ZcV6iLeiYXWdGpYBAWrKbMTsiH/V42F+C6PHU=
X-Forwarded-Encrypted: i=1; AKwUvBxtSO3U0/GsiZGA3ckt8BQdjpiJY88Kt2oESLSDCS19ikbB2mOULVktIF4ch/sqnUEVrrrN4MWUvcLi@vger.kernel.org
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr5567231cf.27.1793309141404;
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr5566901cf.27.1793309140847;
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
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
Subject: [PATCH v4 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Thu, 29 Oct 2026 14:25:13 -0700
Message-ID: <20261029212513.4126083-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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

