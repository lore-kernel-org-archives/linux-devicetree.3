Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146717;
	b=5YsnV3cUCnKlMvxG04lJtYmY4rTrMeO+TZKaSC68dBH7B0VNnnO2lskVs6p/pLKipIKP
	 4a58xM6wyYolHaStz47c32/WpiAXsK8yC37Rzxo/c2tJOoNoey2z8LRG+SgmZpSpLmmq6
	 eyvbBlilHIq7FAw7RdiL51Wu98+3Ujyd4AUbIvYJS0N49jtelb6EQspPSVvOi12ttMj+t
	 fowgAjLI7Juy1yFS2MNP4nrbxfpyz/dDeTpLc11twYVs1XuddxFEdemUlxhlDcfO22EJ6
	 HCGpxbboj81GVJJcayzdZSpEh0noAicdjPDItvNuhR1UUpp6PLpziAJV42CneXRUivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
	b=eqKxMP2lPQNMxH3OcyI7egS5KS/3tT3XRZt7FKlX0CD6v/MTyzYq2btm28F9FcfLPVuo
	 ZOGMOKJqorPQu5PzKtgGZyq8oLMcOGxbfJDNGAiXdCR0m6U/WAtewyYpOfR6c3Jfwpx/Q
	 PAo7VPkPByQP7gw0St1UDniW8trvtrAPYUSp8+OpL6gtS5Fy7pyUQSLWQy/J/R+4PqBA5
	 PnGvjKKYsdix8LR2xy4nPjw2E1tej5skH9CV/ZvFTZG7p7wBfyGUvh2piiqCDMfAMdq+B
	 PGozxZLpwyPu7fNkeM8X4AQzllo2gogcVU5+1zseaiW6K+HszZ6R58PU8q56g4dSYEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqwhbhLr;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C29606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C29606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqwhbhLr
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so408641a91.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795146716; x=1795751516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
        b=oqwhbhLrke7wU3DhtxDtOl/nykjJS3bA4ZIbNYIXKgTaOVaisx7KuhslYsv2tWIOJZ
         AciepnPCV8zIU/GjpOY+AtgDTsqgocWlalI57xhxY9Jbx82VkrSEZO1csuxDdRiMv50i
         IPwCKdRELs54af3bTeIXADnubtxSBYqPKeFVLAj7KYhg0Zip9AtXkFuPSMq0HUtQ2Oud
         fn7x2U8ri37dOQNZU9CttSiuyeJfv2dGSMjoltWMhBdSWiIx5yUXkyJ7aOcykiW8OPoc
         d+sABrGXOa0K3Rg6H6ddzKZSbPKQDBEfoJBjFF77Tvq1SMTrdNEn+JpgKGcUE/+YlidV
         eH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146716; x=1795751516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
        b=F5eEp0E2vuR5Z64QIH+3ssRZ4BvVWxoOlTNZwUOHSE6jVamxhqz4mCtvvL7RxAQx/R
         xTosqMsqGbWvQ4ecUH3QXnO5rnEMk0xJxRFX7KSlSTGCAGxOQ3Eem4y9tYKv6k20WuoU
         XkaEuq9xAsagV1dlN4wGpMSvnpFa78i/f12uexon+dKjcyTfQfr0NxWZnwJ/HtGf59nE
         xMvdPVPNXTxc37V+OcmxUj/5nh2bwZgV3jTM1wTlW52jGCWHITfvjANNl8ioK6ERt5ij
         fz1/bfG9Zpfc/Cpht8QTMke9qOSFs7EKw631xreZYpRW8V4cLE6J751KJSO1R1OC0t+e
         pMUg==
X-Forwarded-Encrypted: i=1; AL+hErGAAq9Eyrfo715nFshZzn5rSUrkI4tzsebFGASSzN+1ctf0i4LYbINHG7oda2LP3zFDG6CQ3fLyAdht@vger.kernel.org
X-Gm-Message-State: APuU4Z/vCoJ1B8Pg6Y9utsj4kVWHe6OErsQ4EuvBQX+CcLHOe2SnmBEy
	izJKODti9YuP/ORVy4pSHWPrQqmZKEFHyOeqdX6Ts3WsVHIwjBTHoosr
X-Gm-Gg: AZFdTZc5GKwv4Fe2Z4p5BNQISG83WH1+/F1FUrvb8yyxBaNVBEj3gyOcSnddpwrslQ2
	f9Go2/H7GV/rretl3e59DG51usEfgOepLrP36ha3Z7pbBtup0Q5sPUXFcelpMZNv9Rc8MdnFAD8
	byH+4UkIZF3AHSxAHk09Ss0Av6hZaTTxupJzQFLb6I3f7ZyVPdcXgEg2T/qpgo54SBsJwZlxL2d
	pK3JtMwzHuuLd4cfwfD8hcNlB6K748VhdhfXof6Evgl5/M+m/NAtS1V90xxI8JAxKGarVKgFauP
	CjH9vdZB1qQPwTi3Zi0aCa/ZEi2sCiB+laH4/YwZOqKfNJ/cqxYVQ2r3qWY9vHsf/KjwMJe8fpg
	o5dEDQ5I+0D0FkvydBBhKachf1eGvAlm9paC67Ue1MCalrJD+gU91ro5hHqrDbfHUMN7BPuPfwT
	Y0EnQCHRjPuARZ/8fx1zHEEfZ6b+E521XeqBSjTphE/YSAeleP7H/hpPg586Iw09+/YOKkguLlA
	fTDACpx6H4fw9qI8w5OMwYFtuF45Zirm7905rhlqB4SI8jGZsK3fZ9V9oGw0Bqj2fKNnfAo0My5
	nibVLj6zt9D0+9YDfo8iMtDLptg59TUJyeltHLdNgSk1uNWJDaou
X-Received: by 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr1415853a91.33.1795146716074;
        Thu, 19 Nov 2026 19:51:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm4638218a91.11.2026.11.19.19.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:51:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	shaojijie@huawei.com,
	shenjian15@huawei.com,
	David Yang <mmyangfl@gmail.com>
Subject: Re: [PATCH] net: hisilicon: Remove orphan femac driver
Date: Fri, 20 Nov 2026 11:51:27 +0800
Message-ID: <20261120035127.1383109-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104145038.946918-1-robh@kernel.org>
References: <20261104145038.946918-1-robh@kernel.org>
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

Hi,

Sorry to see this, but please reconsider removing this driver. It is in
active use here and is about to get its first upstream SoC users.

Two HiSTB SoC families that we are bringing up on mainline use this
MAC as their Ethernet interface: Hi3798MV100 and Hi3798MV200H. Two fixes
from us, both found and verified on this hardware, were merged into the
net tree in the weeks just before this removal, so this is not dead code
on our side:

  444889dfa27b net: hisilicon: hisi_femac: Move setting of netops to
               fix crash
  d54b21d82430 net: hisilicon: hisi_femac: Stop the receiver before
               releasing the RX ring

Beyond femac, the HiSTB platform push is active on our side: a dmaengine
series for the Hi3798MV100 PL080 variant is under review (v2 [1]), and
more HiSTB platform work is in the pipeline.

We are also willing to maintain this driver going forward. If you would
rather not undo the removal, tell us the shape you prefer and we will do
that instead.

Thanks

[1] https://lore.kernel.org/r/20261106072602.77560-1-mmyangfl@gmail.com/
