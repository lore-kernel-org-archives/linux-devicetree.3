Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398994;
	b=qiQWm/9XY7fcK1LBvcjkjYg9oxMKGWSCjnMOg1qlJ7Xi4JrIq8vO0QSNANnUpGn3eFe0
	 b/wdmPUiX73OgYiGo8wx6H4W5w3/CMwX19O/oc9fHYzr4IzpcT8YOAv+WrYkkLdlGCqfR
	 0DwNTrHkUFiaRE1FKX1FmouVwJAgrKdKFCMN/kN7+PP/Gxu7p+jOgZA8MIJaJyBwOhSml
	 gZzqEEbruSfw+v5WBRQRf48smDdwBrJ88DXSp0qU7bPIqAm3qCpocuDxzp27KIrSPtR/v
	 I9YjxWLOyfhA1l/BEHKNISwVn21yaEGuDZvxNrTjIjr/XgyIu96JBYLR/Huo7Y0nIxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
	b=d0aHSsVjHihenWgAAhhKePNqiXzCIUVJ4gLWqZ5yL9H0ZBsq9krZX3HTERrKnX9s01A5
	 b4UGWTg9oLQU75eQ7I2qJ9J5mcwL5RAchKiptgqk0IUO414BGhm1T2zNIwXyKKJOevREv
	 9KXxEU7ad26D5S4hbTN+aCWEOZyNwnFVbsCZN06Xr/g2UFQPKFlc1D6xOKXDH7H+S7U3N
	 Ft1C7IG+OiaBDv2DEeHAQhO4mUizptibuRMlDTAz3dfy6jQxbYpOktO96LVRsl61UNf+a
	 OJA/8lKVlqzy/7HayewuDK5sNdx6B9qGDj3KxUVYbzrvPUHHHBO7+UC9fajW9qDf72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzQgpPq3;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6F606A893
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE6F606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzQgpPq3
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82380b0f55dso1405987a34.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398993; x=1795003793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=NzQgpPq3wUl1i3FkFxZ5E4mkj9nQ/Kty6du7nwjR+DbkrZWWhFf9Am+gxOfno3pmNC
         ufRqkQsZs2L9PePy2dgVEohJv2/tffYzvJ/Zka7wR7NRp74XVmgCIRmBAdJPrRXNaGJ6
         wHXIdlqyE/z575W3jia2OhOzq8f+qxTdyfC0OIcHD5/VkKgv5d/9oDy2qFhdNnoTkxDB
         YeJLeZANeJI7zdDDTkGT4v8SQUu8U0kDIrwzSd0QLGaKdEtw7sPZTU5yplO2Tzizcp+E
         BfixZzdaZjdOB4e2BmuJ6UkTHTtUrcwmWZXZuYeDZwOExXSw7yC7bPCQkhxbB97OXVGB
         gRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398993; x=1795003793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=LhpRnj6NfhN4PUrk3m3vQKFjenb2OVBdOP+7+qeteAMObccgsCOD31JHDHA9V7oGTT
         /WBYUFWIpQbzi93AXV5k8UON2nk9hjW2hWvNf+Z8cILtEQE5Lq4cbW2CTYnulGdh13Ht
         CC6358067gbjc7SmRIjV96yDAzdjOoJWO3XO3K68Q3dhONGK+dAcuwSGDO5QB+6DdbPq
         dj98dB1IdlE/vcfbH1NYe5xtOlSn8dU6VrJMnNWWfRigdH1VTIHj53i+JVlXU8I47ggk
         +Do1aJ1tKIcEc8O4ChGYfCdn7CMdY9fuNCqBkJVrWqgRZ509pd4Tt8MKnt3YggQ/Zj6e
         Ez0A==
X-Forwarded-Encrypted: i=1; AL+hErFrF4b3L9azEU9MquReth1a1KzJsCgNbE2NNNlGMmsRU99TaIaWbvTrrrgR+/8BnidGeZ8EwDPiC25o@vger.kernel.org
X-Gm-Message-State: APuU4Z8ELbiIfTMpozyhSms4mxo+p4g4PAADvAc9bOwzBwiZyoGtebtB
	Viq9ZPHiMUTrVHY0aWIwhbhX8y2RA79bmOf/Zwr6EocKU5en2PDCQVE0
X-Gm-Gg: AYBFou1JW0yhFT3Zop7cku7Gtd3b6wvCgpIK0gWqr77lKtLsV+3j8O7KbIZzWfv7zsW
	DLmTyk4zpfz+AYih/9kU0ov16L4xw2VrVh86WBVwBKm2hv6uFLJ//XCQDRFHXsOFCRYH2RVyNZx
	7OY327kV5Ta2yaonzaXIP01d9y7h16mge0HKqFLFBuKktLyJECK/5x+2GfduoxmecFEVSV0T0WY
	cqmuMzjklQtwxS8kSzCNidY+fHyX3R3tDppaCJ/F21BrXJNn+K14Gb1NhjEdZXnoB4eTYtL3TJG
	lAUOBS7G/qNGp9r7ceFzECwBf0SuHL8ueFY4PApesQWQy3La02JgpnJwQV/PTBboSrBPcutuMoQ
	IhtDNi/Vr6wxcS6YnXFTLkRUP9itdrRe4Tj575y4LlGT/zIc864+u2rjy+RHq/rMPqJQoU7Itoy
	AhZTSJNjy0aUSdw+mvMqT6Ck9bd61B2+LdoHQ840R0rkgcYRJfPtjZY2uqccZvCtt130Fp/zawz
	V4ncvxKVx3YGTZnRIMOonI9EeXuu3foLaPLNBcz9f1ScRyFEeax3siaG9+kQmFY1oHVc/SKxKtU
	+tJ6YLixzKJEZ7jyJ+zcvOnHCJBcVRiruAj81ic8znXNNY1pFV15Ejxj0nvVSyBkWaBlhcRxMLY
	whp8ax3dx47qoucb3blAbPnhh4A==
X-Received: by 2002:a05:6830:25c6:b0:829:8a9b:de79 with SMTP id 46e09a7af769-860f268b747mr1620889a34.4.1794398993361;
        Wed, 11 Nov 2026 04:09:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dc85a9e8sm4218356a34.0.2026.11.11.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Wed, 11 Nov 2026 07:09:50 -0500
Message-ID: <20261110-a7s-dt-v3-deps-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

> [4] A733 8250_dw v2, patches 2-4:
> https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

Correction: the runtime dependency is patches 1-4, the complete posted v2
series. Patch 2/4 needs context introduced by 1/4, which is absent from
v7.4-rc1 and the checked tty-next and next-20261109 snapshots; all four
applied cleanly together.

AXP318W PMIC v8 5/5 also needs a context-only change on v7.4-rc1 from
sizeof(*desc) to sizeof(*new_desc), introduced by b53a09c957b68.
After IRQ-bank v3, pinctrl voltage-mode v3 needs its hunk context adjusted
to the IRQ-bank map; its voltage-mode change is unchanged.
The older clock helpers are already in v7.4-rc1; no other input adaptation
was needed, and DT v3 itself applied with ordinary git am.

> Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,

DT v3 with pinctrl v3 reached an initramfs shell on one Cubie A7S with
vendor firmware. In these boots, warm reboot returned to vendor Linux only
with bus-r-riscv and bus-r-msgbox marked critical (firmware-clock patch [5]).
No card-write, hotplug, 1.8 V switching or other functional coverage was
added, and no new schema check was run.

Thanks,
Enzo
