Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794555911;
	b=mMyZUkvwiOdkF2USzTDhSD2cp652J+i2L9+dgnplZzvdgqdMHSNM3Pl81jL+Gx7fwZeI
	 +grjF/Ez54TJ8n3MMhXhIreo43FcW+BlnGcVhxkiwdUxAw48PDMG1N80xdh234lzV0i2v
	 YXcH7NWaA3bKS4ral9BvChsc7/Cked8LW3OcsuZYHsWbCsEZ/SBgLEYy3bPK7QNvgNUki
	 k7mMTmxlkuxKOvJxNSGSKj1wCNxDCxtim/devQns6++c2U07sTka5PRkA8a328qAHycoA
	 OT9GWlv4qSaCTX/ns39oP+FhljPabBp8x+6K2GupPEN/MCMqRTuXMbybUuugmb/cCiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
	b=NXUIk/cXp4jNn0oIRb5ZcNKETSdaqIpbqG/ELBM0kr42LXAVap4EXSQ/g8uWqtxe9uhq
	 h9FsKWI0ymduyliGGT/MiUky9xrEjOde6o4OjuG/COGMb8p6XQ4+w1xChoiuQursncvV7
	 AjQkpSF1+zztx8ohaQaTuaToN6Qds9j+0sJjUA+cttZ9rSvTGpUYTphyW33aCKpUGZssn
	 LqjpNupmKa6HBvdMxu6QqqWRiatJpRtgJG/3igYNwkyCnGVZA3NyRlXfim7ZUqQU6/Efg
	 98Zts4aQEVqwNtnzRgLOcxIn3JJBRhjTq3Ks2WbS5El+J51mZ4eJbatI1HwudmvrshQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX0fe53t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D720606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D720606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX0fe53t
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00c727a26so53064e87.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 23:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794555909; cv=none;
        d=google.com; s=arc-20260327;
        b=DBYQ19nJphMokEjClQ/HiRiM+WcUUdj46o/EEjE39+NQqJnKV3jvt3/HJS4JCdI5Yz
         xlpQBuDbQzCbVhl7rDCyBWX3JmkH59mfknIsnJHUxv8PYliD/cwMsjOOeJghHVeuXCb5
         DkUDHB1p4F90Y+0sDO8p7XqqgrGlj1KT9Gq/S5Z0iZlKatGKhO3uvmosma/RPL22Qwml
         uSppAWsH85Hpw+U4Xq9gBO19pTSqUFfF5mYSbuciZtVtB2eBXMdiu+1GZLwq2WOr9D6X
         b5dhtnf+7EWiTiDDjPH0OWU9ZpI4pFm3ztzrS8sJc9Tzgw8ThJzmiYcEkZ27256pudMZ
         A+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        fh=jdSFCsHlrlg/tPPeHsIGtSxjaCBpmVrFY3s/N+cdpxU=;
        b=QYer+9KbGuU7RqbEvKhkAC1fdhBgCaEzrSyLZ5i4gc9+RNoUuVKezYD00C48SQ+yG3
         R1KIamuGLq2g2Cxf0LBeI8fh0HECTCrghHCabcwV1LwX11gLeTw0ypSreKR6uGTINmHs
         SBYZTmAGeWvtsnmOokUKd4MDfVTDMirCfrDgwP0MIRw22DZTC2e70gprCtFOIKBeWvaw
         AthChmxt+8lYrhCrFYrE4CwvzJ36KMy1WS2+WK08P3vXKVPkDbcvn6IVzFHYHpZfgbX2
         XkyuyGGJjSExyhQy6BfBoeJV0HoHH1dqODuRZboRdy7jQGcOucHZJ16fv2YtGAHvK11k
         +KjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555909; x=1795160709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        b=ZX0fe53t1HxoVaTOfHuPsA1VtFhkn+2so1yR7DI+LDkXXU6ame2LRcASeMlzlxOS+c
         kaJhJiAVoGD2zmSCW/n/nevzDSpeqRzrkKkkOzBc4+wQKV8Wy42mORne4zHXrr3VWIuX
         tD/HGaQ1rYvUV5Q7Ozp0ma/Rb3vGRtPfP4TOmLi4jZUxwZpL4GcfJg+Z9fswK+yNsmi4
         x0j7HW7eT/oJOlZvtaeHaLGyeRkBjgtg0axtMvAWajbnLflTxfVl5eiGA/TZm4eerbqW
         n6vmLn/3pLI3x9jW/7Z8iB+eZCuNTgbMyd53fYAElPbUbVxKjLP5xjZebNGznrVO0woa
         NtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555909; x=1795160709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        b=UoAWcCJqeeKiHl+BoT9NsIgV0twv8JkCwAkf2pI5ymyjo1YNtOgMDuhJQHvf/ms6wL
         EnsQ1XoWFjTRgBZvXkSU6ngeaEx/R9ghnksahtcX0K8L3mxQAJSrVShREJ4qsH2XIaLw
         yJdZZOEs2OQM7jY025zCGsiEEvkoU+qWyAinDuVfFMGaIS9Ep4Ukm8WQDBTHj/W0+/Av
         1+hv3jJ6kJoyG4NsSEkIizjubeg6SpYR5c9ehIBEgw4eRbWC8KKicX/CMiOAvKABclhe
         YpZlzCaBj4PjhPXeS5/etlfnQJNY0RdDfmZixgzHUyZiXi2JRF4sYazw+NCDSzUOTvzf
         l9hg==
X-Forwarded-Encrypted: i=1; AL+hErFUBtr3Pnwmy0lzdKT3+9YDCJpa6NBHj9mY/prUHonoab+Sv1E7C2paNGkwpbHLzCZOXWI72PZAH4c+@vger.kernel.org
X-Gm-Message-State: APuU4Z/5F9V2wUKsQYYeqsiwtsOslpouxoyDvqdiXq3U7WJ/ZBMa5d2X
	VfmS1b8z2aW4pTQPH0rp87Y1yLMQh+eyrSOPQmX3V8s9Rir+cvu8VlpmOeMl5HwuVPJsViX+LG6
	17jmGan7v1heeWXrJGb3qnUmuFlF81S8=
X-Gm-Gg: AYBFou0N1zlY0ex2B33sHX9VV4qQUeHRKCyrauYvFzOIPhOtT8xXfvG/BFOYdHSezzJ
	wXKuckMX1kjJowKe/GKjg9cUcH8RUyQb7SD0h1rBaTy3UfhiFP4ngIB8pPgCKBh8bfcTQEP24Ot
	k3xoijnQ+TQd7+iQVlB28iT1qdPsq3ZqsETAC1GVjqDvKVAh3ntw4Iw+pftvoJJPbZIV3WVjVzc
	8M7Bh8HT+7cR9NqXKB+egNv8anyMoQVktIv4EqsFFhjTRzlpdeZdlVZ8QxSZJ0c8vdNwdDZo8tM
	AHMeeL2KZOOpJNOixcaaSxFw/GpVQgdc/CppIA5FKrazuYqgTzGoUb7jEPcjzZnpbTB3BkhnVdF
	aJg1pz1Fu/3kPEEDPkIgyhEGROEWIC2PH7jeApUdt7WNVKmpNaANNURCV1ZbaQhqzppLBjqUpVx
	ma601czngYbE+emuMXig==
X-Received: by 2002:a05:6512:3d0f:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c170771fabmr758264e87.2.1794555908550; Thu, 12 Nov 2026
 23:45:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com> <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
In-Reply-To: <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:44:56 -0800
X-Gm-Features: AclHuK-px0U6hKw50ELPgjTts3juNb6KJSAEdMlgQ9nDhQ9zdUWQkc1yUvT3LMY
Message-ID: <CAEy9hNXiBRaj-JtjOAy4de_BQV1jAKUjUCkYzSpksu605HTNZw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C
 port self-powered
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> As you describe this as fixing a stale state accross reboots, does
> applying this before the tcpm patch degrade current functionality of
> the device?

I don't expect it to, but I have not run this patch on its own, only
together with the tcpm series.

Without the tcpm patch the tErrorRecovery wait at boot ends after a few
microseconds, so CC is only open for a moment and boot should behave as
it does today. A later error recovery opens CC for tErrorRecovery,
which is what a self-powered port is supposed to do. The warm reboot
with a DP cable attached often fails today, and I expect that to stay
so until the tcpm series is in.

If you prefer, hold this one until the tcpm patch is applied.

Arun
