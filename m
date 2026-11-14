Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626847;
	b=MXb1T2HytSpGrrJYyv5Bn3UL/K5+fcUre1kMecRp7HdeRvgwLX4mA7Onsq70g8Azopop
	 uTuGHpWnRH8rlPFpUyYKN6VQd36qrRQQqM/NFaeNdP/I4o9iubsJ+AQnsCyyytXubZypR
	 2cYxlr0fpD+qwyCE6vr5DIkmSZQ0lg7H3zwUtpAJxnIp2F4OngY/7IjbM0NR63JhAoCN3
	 OxoB6TnXe3EYron0SAMSCGJmvYER58iRgysn1pVixkc+9ROraE5ojKSr5mlHSXZ/XcFKK
	 403RhiNlrQU0WW+cBlH4ikl4kL0MaPX+IXLi2uAO+rAsm236MhvvWmubqAHzYYjF+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626847;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
	b=bX031mkO7qjrzBxZgpwFGU4cflFPmQO98M5c963UauNBM9dJo8iWe7k/AsTpncFAxYBj
	 egjvJchLnYQI16b94KXY/DXfG1pdyDuC8T/7uJP+kxd00BJ8nk5Rz8c0ZsNEDrvXgAKbJ
	 aZZc4kaAjmuesgQiKcKpOB2W1fIdkzmc/UdEDQ91ybyzcHph+KkCiVpgNZch0EhECCu8f
	 MR5fqQxkIqM7i87XRf+dQsMXZEHOLiAy73S1Td58FCX25gUrO3kqzWiNMxYJQ9umR10qI
	 raGwJDYHaEpzbjIEnNJTZlLfyt69MDk7UVK3HKk92doW9Vby16S0osoav3veiHCZ4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HUsTsgB7;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D84606A334
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D84606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HUsTsgB7
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso859907a91.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626845; x=1795231645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
        b=2HI2q6QKMGA36fdzfewbjS4fkxhFzZxQwLf5yXOvyrlAu5/b78ADb/bsID8e3itXLX
         /4tXMaUP5KBJ738lZMy4UilmAY2J/hvEVH9UEi3qwW5fl6UfTZw3VMi2R9VBMd/e1WOk
         7yCYrKJGu3/TcDYDrDn7r4HROGA0+PDQv6sVJhsvRfLMW5PaIESFu64v97RGMKSrTT2/
         xDJTLYj3PqcLr3uw6Ow8E/JT203ogi36oyw/SdBApW5QpuDysDfkooYOP4VgIyqiEzKA
         nHaYU6rmm9YLQWlr4Fq+oBSrfIH4yxyX4B9LKV1cMIB70rNDkNAnAcFu6tjj8InlDmri
         Z0IA==
X-Forwarded-Encrypted: i=1; AL+hErF3qbGBLCfXlPAHpEFj9sXI1lQSNT2w++chr/C5jHP9zahGRq4jfFT8pGZHKBgGDMTSYaV7YocbYP8m@vger.kernel.org
X-Gm-Message-State: APuU4Z83P7QFT2xN77XaioY8GsZlXTvtIBynQFPZQ9c6eM09wWFlu8bk
	OqciKoHRAfNQanNXaRPMX3E38M7XJGCp2vkpnVMvbcbmCa+tkKxtWQCDvD+nM6YYL7CIefPEohL
	8vk6rcYaMaGWFupBiiDsU5z1xdKC7CNyoxVqIFIO3WSCq2t3anO0t5vrHcL9GrJ83Dg/63Uo5qB
	WWTXBQQMHpdqRoW4DDcrCq91KrxdvEsgaAnpE26Px1/vVDi2CQup5s+dp+jW4Io22RoV46mTQT7
	xynqegWLQ/YSW4uZqgoeg==
X-Gm-Gg: AYBFou2eS4YKXjjpUQ9DWSUextvYLZ4RHNdz5oQO6wiKxCZJxDvlnRPr5sI6jgZW3hN
	+b7CVO+IkcUpZy/Hp/b4Cl3LRZzD5AEbn0eyYkHAn2iZHA4BpUVk9Bi8OH1zi4DbFkoRSJ/jISP
	pj1tjLIHlD/OtPnt318R9/cnIFT5SwgEUbEHN9dhbi2++cB56L0OhadGk2p7kmhIx0QwnAPr/0E
	+V6rDxeNjyxhwXAEWFR/Xy/f3M9MUWwGpIhcGapRraS36va8Bp7Y97LzfzckurxfzGYI8cDa0Hz
	rjkaqNVVXMKyxntsrA3DB9wCmZesxTltbyp6k9CWXEPz9TsAsY8IaNrERJxeVEhtVd4f155z518
	jMOeCVRKAl1DmpEDX5yPDDVtwBru9Zqr539TxOpNa9jHkwYqFJUsG76XSqR+AkfKnbUGf4kDuKX
	D3lV2mmpD379uHt9IsmKc0xcHmh4KCjFB9gOZda9SjbzI=
X-Received: by 2002:a17:90b:2682:b0:3ac:9785:4c32 with SMTP id 98e67ed59e1d1-3b1b0b5001dmr4109982a91.30.1794626844597;
        Fri, 13 Nov 2026 19:27:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae81cfa5sm6103127a91.0.2026.11.13.19.27.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:27:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1658583eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626843; x=1795231643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
        b=HUsTsgB7MDdLyo2Sl2kxHXmLWXkUIHCdsvMHsa8bLjWvywDTosyXi8fJrvk0e7D4cv
         NTnzgXRJF2bYsUBom9QDymjbpy5oamK7CjcNQgzVA6SUaXhPTQglqcdIla+mPMXTpCAD
         qi4nd7E95pisUxvmOAx8hfgBiDrjBRIhWMEKE=
X-Forwarded-Encrypted: i=1; AL+hErFFuZ+XOm1hTR61OycLB+gdfXzq98P3aH4nriSTPI5B3UYFvtAOU7361LdPiGhtUK30pbRlABPhw+As@vger.kernel.org
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr3851038eec.37.1794626842663;
        Fri, 13 Nov 2026 19:27:22 -0800 (PST)
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr3851008eec.37.1794626842041;
        Fri, 13 Nov 2026 19:27:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm12186736eec.7.2026.11.13.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:27:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
Date: Fri, 13 Nov 2026 19:27:20 -0800
Message-ID: <20261114032720.874249-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
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

On Tue, 10 Nov 2026 14:00:12 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware allows to set a reboot mode called tryboot
> that allows to try booting from a different partition to allow updating
> of the boot partition. Allow reboot mode properties by referencing the
> reboot-mode schema. The firmware allows a 32bit value to be sent as
> reboot flag so restrict the maxItems to 1.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
