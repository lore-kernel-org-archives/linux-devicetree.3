Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444116;
	b=LiTs630ob0paWMvCkjfEO83S/bbZ8VYqudnamn8Gan618vaQ+97MnrPsig0Z7ngBFcxj
	 HhvMb47deh+766Sg4kROCitpD4r4fT9oyEdkcPATWJYBJrnWrL+A8VwpqgTgyg6E/J7Qz
	 QBWzv+CL5tyHEzAdhIZm1jlQViig0ICJT5jPlz+GCUJguVbusQ8ewT49fLRwdEhsAJmE/
	 5uPBsQ652wHrvYKcIp040uyTYrBhQGFLK42Aw/vk6muHqq4n08iJr4G5rw7z9+CAzYr0i
	 H/FFzSL1v3SEwvJY8OS7aZHcJvx/FKtXJRqnQ1NHbkozgajc5j5dnEMTD0F0pzA06AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
	b=KtBiCJTzTi3xabXC0ik8BD9rzoldZAKQxzumqD67dBgi4LpVL+E/dJrGw/yXJKiMasov
	 9O/rLLLRGHJfv98ES9vJCUTVeq/h979Exw2CacAvYDIXb0n4Wxt/JsZ45rNLRv7e7yY4M
	 69HgofhE+mwe9n1HMrTJHJ2US0aBqa4VIPitq4Fmcbpa23YSnzEKabMDk/c9ueN0mKW37
	 qBMLGJKMUki2ZNY6uDdGFD+zhwp7pjL3dcIl5wYW9nD8uOnyEZb1bUEV8gYfA/N5c8hrY
	 R1JKmsEKE/8TKpMPVDWEvDcjn96gwTo+5cCrsZyEeHT/uR+331tmVx6X+yEuSEQGbmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+5g91EH;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7FD606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+5g91EH
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4195598c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444115; x=1796048915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
        b=Q+5g91EHgP5jN3hRU83SGtVM/mehEbjlOslcXA0EY9AvstRpqOnccc6nOfINmc0yGp
         kiFlTy1irqqjr9NeokBILYSk1nGcBsZkFUz9t9camIWb2Cm+CjSqNhyzXGuWXJ/e9WsZ
         y0BVtDIZ5H4LQliNor2JDt6fzNE0tKMdraD5w/+YunpEV0I+R8zXjo4EGeHJJJ4Ucg7D
         D7ZG3gkCrqGAHMb+X5ZN0nE8JSG85oHdL5tnSnLvEuEOPmfXj4TkpwpT5u9EmwgSN55q
         6EzHCWy9AhICjLUmEy4JLezMIHlnXPX95Uolp6P165eM76SVcHFUSEgM/856UySvStpx
         LMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444115; x=1796048915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
        b=lq8kz/0LuQAuRGZse80DsRaPXXSaPVaaZsROXZtMMoBlN4JrSarDY9nAxsFzzEeeKv
         5F/euzdMU16rqa2MO64T9l42qM+6Rq8eklnI9ycrVVSPYiy/H6lmIN3T6NqHtHf800kC
         XPY6Qlgsw7v4pAeIqhRfl9dQ5h02xuQxom83HDpJi1O5GznadR0NmjUB4CVRnAFmh2L7
         m5f7W/MfM+36TWT03nE17rBjP2ICWVHqbYJZFgEobB8VCkQK9LCNdc4vlBLR5pgsnXaH
         26k2k90K6WDNoGTw2zZD83FEIIYoBpGvqYb0/MNsXHHQBPMvOfpt5qZ/odLZiTko/mQ1
         W3sw==
X-Forwarded-Encrypted: i=1; AL+hErGseaUB8gcFr5CIn0sWpxohxdq9HCc6HBRTNgqkfGIHkLpfFGtZJ6LhsTU7C3NrvG61it2GbyRQ5xCk@vger.kernel.org
X-Gm-Message-State: APuU4Z9MqYLjNPQy/hu57BAFrqbIIsJORS9NedlJnWYfk+JivuRIp74L
	qZ3pPMpX1KHUYDCcNeMDbZ0lFQVxDXhzZBDnsOv1rApnxqYP0dgJfE7Z
X-Gm-Gg: AZFdTZdd7PchwNxfHPx9/aof3z6/vblpz88uKa5VRf2vsAQKI85UsUkQIjnQroPYwKG
	o0RQhAi6vmNALjIA9zruvBbt044DVQ8/dwam68f1S6dUzLugm4v/3K7Il1ln0md86gBGNb5akAN
	mnsWP1pUiaMHYjcwUtoLdkPaAG7VhifvfRWIA+/kVTnMA1NQoLGcyO4XFc/m0U1zR7FUsamFSJ8
	xi44G1Lni0kiQVNlY8MqVXZt9VCxK0kWz+D3dytB2lwo5DfdNT2KmKNgWNoj2L1qJOSREWBtU3r
	WDxMbC8yui9OQ3Dzzw+s3Dm40TzBlVD0Uj6RsHpMN1EVrs6Js7OjDvl86NPtDW2HT5Nfz9vBiQn
	sxTrmwQBMhTnKw9UmqYLtl7nR0F80hgewQw3LzMlHZbuGzl44MxOTQosCjbDBlU4B4qFtpkySxm
	6bXrXX8NZiQpz1AO2BCJaodIvBFtur7+t2LrS/eh3MkzlFead95MkkLWZ6A0JCxoFU3tIoob8ml
	fh6jHiC9QJikAoRaQ0xDGVd/wDQ+3VJrQdHU5DRyNGLoUzPBOkzvEABF/r2KaVi20IPWRTriQtq
	QS4XG8lSGLZ/sbuvfsLYasu8uxrjVs0/02v32evFQDxWnpst+4pwFyaf2CEK2Je+qCQ3eCvs+jc
	wP+asqiBALFYrcfjtabBDEwgg5Nc5bRJJOmCtG2KczLs=
X-Received: by 2002:a05:701b:2810:b0:143:5cb4:30 with SMTP id a92af1059eb24-1b5567b3391mr10290148c88.3.1795444115370;
        Mon, 23 Nov 2026 06:28:35 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm28671326c88.10.2026.11.23.06.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:28:34 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ARM: bcm: support more than two CPUs on BCMBCA
Date: Mon, 23 Nov 2026 22:28:25 +0800
Message-ID: <20261123142203.3860616-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series extends BCMBCA SMP bring-up to SoCs with more than two
cores, such as:
- triple-core BCM63178/BCM6855
- quad-core BCM47622/BCM6755

Tested on BCM6755, a quad-core Cortex-A7 BCMBCA SoC.

Ho Jie Feng (2):
  dt-bindings: arm: cpus: Require cpu-release-addr on bca-smp
    secondaries
  ARM: bcm: support more than two CPUs on BCMBCA

 .../devicetree/bindings/arm/cpus.yaml         |  6 +--
 arch/arm/mach-bcm/Makefile                    |  1 +
 arch/arm/mach-bcm/bcmbca_headsmp.S            | 26 +++++++++++
 arch/arm/mach-bcm/bcmbca_smp.h                |  9 ++++
 arch/arm/mach-bcm/board_bcmbca.c              | 46 +++++++++++++++----
 5 files changed, 76 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
 create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h


base-commit: 21f8531821461fa0c05e4605c01d8d56d28b514e
-- 
2.53.0

