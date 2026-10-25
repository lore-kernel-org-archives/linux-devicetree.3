Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933333;
	b=3weznK8m3Ct3HSmCpl6HE43Bb3uLbOi6pndAbFFEq/vM/dG9QmU+OU2aefuI2+OkAZQb
	 78UYLGQiyLRHBgRRYsQng0HsL26h1ZDBYt6uyYxmNRQ8na+8HOTrBQWf6T0xLv2006BuO
	 9GoY018ydb++IAE9hswd9A3rgYRhRYO+NqQKZb96r8u5KDjnX7puhtTtz73YrsY0fKfIj
	 RUhUj29M2TCodJOj0ji2vvkTPrxf1vucfrqADzbHvJMEHwUriWM8WJy8a5nWay7ipGKN2
	 Ok7h+Inrb8uGga/nNKda8bjHGkfQ5xoJg9hs8uajNJaW3rZTKyFjBdrt3ycfADj6c8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
	b=ed8W6vDl69lf8cclMqZ/z2dBM1ZwUhBaYJt7z40y0C+xP4C5lzvYHcg94ANTzPeusD4E
	 XFUFIZ3/4PlEP3SI/watK+Cfn821bDS6wKmVaAznBUbKVGLt+1yUubl0hdkxx4kqYEs9J
	 hjeIgHLljCouet0csjiV9/VHjBy/6ZeJE0r1pBIR84/I7gS2tzOd8MP99ohSJmPhbYwxe
	 JCfNMVr10k7iulBsCfpaifOFzobImQYsjbphsqpyMBwocE7k2z9IrWbnX6j35msRrym50
	 XgjctsuTWoDG0S3SFIo8A7gsmfJ0w1oYjo+9Xcn4f5w31pcdFZzWeBHPdETMo4IXuNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mBkw7GqN;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E8606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mBkw7GqN
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987b4a710so16231785ad.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933333; x=1793538133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=mBkw7GqNrc34m232ZMimBrlq1vV6Ys7Pn1+2+EHfXPKmZtX9Nv6aiOtRInpoJHIbhn
         hvZMvHtZWT40zQ62jqcmaeeTa7jqnGUty0ITjrox0cZ+lIEHfexy3B4kf936yV+pCtOU
         iu7FTW7T41Hu52OPCm4xkaeCGFeawmUuJmG6fpiSiikSYx8gEvSvV8gknrF5wf1AwlgA
         Yvk2tma9S5zSkynu3sQYUuLyTvni9xTINkzQeVrJtRScssiBAiv1SFgKznkJSkeUNy+E
         UedKk5tBLIb6qzJGIQimXkPsLRzCV6Z/KK5bYke9if4vZY6cHaFFGRbsUdiCWeFJ+ea3
         DaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933333; x=1793538133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeWhtqurdRURXZzZxthQRkSgg7DOPSB9+FM4Irtz//w=;
        b=QwbnK1w7pXmsjsW+IqFDlPstOwV+sxwizGfahFXtv4YatXgzrfkoVx/M1FNzhhVDU7
         bvUagfGy91BlFeOOUcK1q/nGvKvd/tjuLLJTFl5eNf/fiESdmL7N1pLYrCDE0DedRwAV
         FKffBd2vDEC6wUJDJdaClR7zCVyhJSMLLEN47MmZsoyeFpl4xtLbpXIVdXGVsCYlLo7w
         F0nOvDS5zXKKgfH4gKgtm7JVxfreL2z7UjwDdqHj5KhqetzTSVcR1aCADNytR+OECnLh
         mQwrgAekHji/OXQ6r4EmOUAUFiytWJJnFTAbG2MMYYyAZAGU7jV67jqfclHCl483/3Bc
         Oikw==
X-Forwarded-Encrypted: i=1; AKwUvBwLYe4d38rgn95u7fifLpcmyyNrudS1rV9OMjKoRKu0RrdKs7KB7PRYfnsSJUGdfs2c1UsViTmv/fT3@vger.kernel.org
X-Gm-Message-State: AFq9FYJhbWodMybSg2w3jzLqSqOAPTkLdCS0h4XQwh6WX8zz54CxywVh
	VCuTf+dgud5CX8gGP7zukrpnm5acAijqEQFQ5mDjkWeV4OjvfkFWiNEo
X-Gm-Gg: AYBFou0QTISJBw4tEjoV4ovgdoLZVJjNNet/7vV4NSjv+UKJTFqYje04PB+SrMeGx1x
	DMtr6PumngK6WpTg221/lnNzEo+yMrqlyyuX2Seb/3vYY6cHLzA7I5y9+0qDyvDs6rbqHZIVCMw
	tJH20uEj+GJOF/TAGB9PbPgFoZ7aNW9YdBro9da+sh3KpAx2BdJ1exqDXvUl4z3hMqHTDE2PTPr
	lG4N7ONzBdenJvqjdWRUfipVcekABafM3Cqyafy2KE7rsA9SGaO9Rbf7tJ+W+w/b82g3WnKgj5u
	OMNIuGxbivqLw9EKDY48BVsgAtl/pOy9AMkVbxOdIsPEMtFFk0RIwTY40sMrGeVxWZ8gB/ZDwnZ
	jm00/5JbAvTCR53d8f0Vn6J9l7awMsJgH6h8qTYIKFJW6H5QbocP6FTQkfWDJn/xBvyLYAwSENf
	rsXnObK0r4VgbrhPlkMc/EPBXysz8GEuInuoD6ZjDlKSI+O6hkta0f4wXlL2Q15qRnudbpbmUQD
	qwLB5eZeRnfBE/qhiUS8+lMFrGuxlrwDoQL+w77g9Phf7tnLsPjkLD3kU7ws2C50oSEW13hTh2h
	Ca1h95neTLoU7khw3nnY4JtELaB+NodIjWW6M8BLYxPrfMvHeEfPaF8ueH8OD+VT7RJAezqHsft
	+Ke+nBMv4UY/8HSZr3odk3HrQNm2WX2Zq4IVY93U8ayXdb2Y1U+CxKH5UMw==
X-Received: by 2002:a17:903:198e:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2ea9cc5802emr27275065ad.33.1792933332318;
        Sun, 25 Oct 2026 06:02:12 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14d1ddsm8430055ad.40.2026.10.25.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:02:11 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 21:02:04 +0800
Message-ID: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
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

Hi Anand,

On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> Could you update the pinctrl and GPIO configurations, including all
> necessary pin
> assignments, to bring up the SD card, PCIe, and Ethernet nodes?
>
> Please ensure that the required bootph-pre-ram properties are applied
> to the relevant
> pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> SPL initialization.

I'd like to keep this series to what is needed before DRAM is up.
PCIe and Ethernet are not used in that phase, and their pinctrl-0
entries are already in the board files.

For the boot media, the BootROM has already set up the pins of the
device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
user today. SD boot on a Milk-V Jupiter works without them.

E also asked on the cover letter to keep the BootROM part and the DRAM
part apart, so I'd rather not widen it.

> Additionally, could you update the regulator-name properties for
> vdd_core, vdd_1v8,
> and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> to locate and enable the corresponding regulators during early boot.

These names come from the U-Boot SPL code, not from the board
schematics, and U-Boot already sets them in
arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
I think that is the right place for them.

> I am verifying the changes against the existing U-Boot board device
> tree and configuration to ensure
> that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks for testing. Please let me know how it goes.

Thanks,
Hung-Chun
