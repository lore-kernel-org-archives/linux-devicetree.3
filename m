Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337648;
	b=CmGcM6zbOJcRtTIpCrIUopH4moEpHKUV+9r0ck1ZvAVtkFv7AhbS/Wl4O3bRceKQEu7B
	 /Bs4M05rokxSnKLQkK4imdAGqgYWWHUhwjOaVT6RxwYo8cYEVf1lQdy/MEaMsaUFHokg/
	 /h6EaZGtBiYJ7OYsva9xiZEjBxVEWzOcqiOSdHK8uZUEGwwkYqJFXsW+pNAce6xjue6qj
	 ymhlFaCEdNh7JysB1AfmEAiGMZFaP70f0nSxnhTCkDaB/nSnDYmg+EXszOVbTjHuOgpOJ
	 b8WcOEBTFL97Vcrqqeyos2OExuSIvbV2K0httL6g36lozEJvU3jAXLmav4HJ/30mVng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337648;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pa6VwfvBf/lmyVIlZAJGW65vNYl8kWvkzCZbBuLoYbU=;
	b=VVDWDTjsKCCoufVvZWQdWkonBx+PU3Tuz+Bap86qn050OvezkvDCQEepa3sGOgDtpIbJ
	 ciocbXOuTn/lvCHm9k6u4N0Ar7WvUPcxWIhu+7nP526dwVcrdJZkQeR4c1YL6mYWIxVhs
	 yJ/Xi0zOXZLuo22I4qcFywj7s5NN0CiyLti9/zxKxoDoKbLtAVFmm/MQp5m9POkTHXHdS
	 uzMUJTd3URWjB9nRq4uZhWypvQrBg4vW1f5Cx1TKaXW1LEJpGvfQif1Eee/IGTgLx6W0f
	 ZG47AvTtgA6XqinR0k/mOjjGLBspoCeOuAX853hMYMhfoZU22fAO2Em8nhv1uMaxGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y+qrxaIA;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F21606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y+qrxaIA
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1136598a12.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337648; x=1794942448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pa6VwfvBf/lmyVIlZAJGW65vNYl8kWvkzCZbBuLoYbU=;
        b=G01cnsoDxja4pEanDFUx4qcXMsj9DhT46MoQH1CHCZiJbanVsJfVrSDy/u94jFQG0W
         XGf2+hF7sD1SJ/V3ql0GQBoAYnNyff/h3TVgRYq30Rw996kUrCLKAn3KUPs6KTbj6Z4s
         5zYPjvt+vgq0Gy//Wz3LeYdR/SYdCnEhRfCxw212G5vmUiKx1gQG2hIoPj3kvZ2iWUSm
         A1yGuqlo0eSbosojzqyJX+/9nXywf6EBMJweK/8PB8QYr9Rd+fRxntlQPSNBO0hJ2UMq
         pRF2TWFSGGUyvLTK/bHReBoKd54krPnaa5179xsGNUgsqNGnBkwp7qhrxWkg6ZsjVrjC
         Zbkg==
X-Forwarded-Encrypted: i=1; AL+hErEMgcK/OXlp7hh8i9tK4x9CkOZAz91sAbJiRMPfkkivg70gBVHyLXydlO5JFBDjYkBaCwS5MsfWEBGV@vger.kernel.org
X-Gm-Message-State: APuU4Z/HktmqXSHs/mFgFSYG5iNw4M9z5ZDGuhqDAXLHIhwcRkbH5wmB
	okBELUmKNI+PmuEkFqOo5Sd+eupCDjEuKccqfyh5+7QR0wGOkTPsyd4hPGSMYaiKO5MT4eePgtF
	lBT2rqtEUXw7K1zmAw5+rtCcC+9QubQu37P2YIt3fuA9aUjgl/TBnMzhyFUkvMxip3WgUTycwdU
	m5qj4OWJgoVAFOyR5gAlc8F4hNKcikQXk7u3XF//pifu1AMfzTwK1Ug+rTL8jOi7mxBTLSo/chi
	5o0Egd4+2Jh7BxM43vxdg==
X-Gm-Gg: AYBFou1g8QLH5XIsW1gJtlBDJpcJkGCB+kbtyseo6aZFRUQyEwrV57bULEus0RQznn0
	fq64BAgSVc3JVuTbkQqcOXEBmv3RkXAGFO4Dm/Bgddi0pEa9SZTi4jcIhjBduQJ+vA+oXncunAI
	m6o7AVhpJP2CtaFKrC0bU/rtzZMo39T0fzFhXIlNyujy942JrtjWLBgaYClRu91nf8VnxKrgCsz
	ul3AEMRTdqU1s64D2hmA2TfAmEpkVOGYFRhxDD9/z6X1lS5H2m6E7F6tvhOWW7gdQYSvmJ9Yrph
	UeUA8/pDt30LZGlHujgufc9Zv4zklfo976rWCcgWIekpxfqzwPhQ+oFHoJ0AlzlqyUtFM92gLVB
	jEK+86agLSHg1nEIB72HeKjwkg2EPDmfo7r/eHdw+W0fLsfCWFLDFgpKl5Kiq5QgSsf+mFsNFtX
	YX1klqZNmxn59Nu9DQbqFkHAUKYxhV1SMqcRiLoR58
X-Received: by 2002:a17:90b:570f:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b1679c086cmr2411119a91.29.1794337647627;
        Tue, 10 Nov 2026 11:07:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181c01fc2sm67615a91.2.2026.11.10.11.07.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:07:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91eb3a63064so50696376d6.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794337646; x=1794942446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pa6VwfvBf/lmyVIlZAJGW65vNYl8kWvkzCZbBuLoYbU=;
        b=Y+qrxaIAZYFlLK7IckO5BWtsaYjaXxYIoTgDbVxTZJ0qmNw3/DDuyOymyljx+3G7fG
         8hv7JCis7PJGYKAvJm6sSxQDUx+1QK0Tz6s7fKhSqtV22JXHe+ARj5otX8Qtj19pwKl4
         kx052SsigmxeYTFj4Yu/cHy4jC70QGijg8bRQ=
X-Forwarded-Encrypted: i=1; AL+hErHfNdbafh7Iu6OrBAfJz03IhXt7kITCBQwk+6nmAmEyCNns15QYA2upUOxvjSY5lHo40GuaRJywL6pq@vger.kernel.org
X-Received: by 2002:a05:6214:e87:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f04122ec1mr3192356d6.28.1794337646261;
        Tue, 10 Nov 2026 11:07:26 -0800 (PST)
X-Received: by 2002:a05:6214:e87:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f04122ec1mr3191796d6.28.1794337645698;
        Tue, 10 Nov 2026 11:07:25 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f046e42a7sm448086d6.31.2026.11.10.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:07:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
Date: Tue, 10 Nov 2026 11:07:22 -0800
Message-ID: <20261110190722.2345878-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-2-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org> <20261105-genexis-xg6846-smp-v7-3-rc1-v5-2-4103df2588d3@kernel.org>
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 05 Nov 2026 14:24:47 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
> waiting for an interrupt. After waking, the stub reads the GPIO
> GeneralPurpose register at 0xff800568 and branches to the stored address
> in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.
> 
> Implement the brcm,bca-smp CPU enable-method for BCMBCA systems
> booted through CFE.
> Read the mailbox address from the secondary CPU's cpu-release-addr
> property. Map it as device memory, write secondary_startup_arm and
> complete the write before sending the wakeup IPI. CPU1 is already
> running, so no power or reset sequence is needed. Using the ARM entry
> also supports kernels built in Thumb-2 mode. Clear any Thumb function
> pointer tag before programming this ARM entry address.
> 
> Register the operations with CPU_METHOD_OF_DECLARE() so the CPU
> nodes select CFE bring-up explicitly. Build the BCMBCA machine
> description independently of DEBUG_BCMBCA, keeping the debug UART
> mapping conditional. The generic ARM startup code retains PSCI priority.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/soc/next, thanks!
--
Florian
