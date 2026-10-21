Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606047;
	b=AhIDUbyScg4ZB2hPwl2dHEZJ+9HIwtMdgn0sZW4/p9yI2pqYJONR+xi/KmxQCCOSIg8w
	 5QiH3MQlH7Tv9ZQk60M65bsodOuooxiSBrUFQeWNCj9Jo15zQ9xZyE4+/DmUSAswhAJkk
	 CnIBjO6TGdBVTgGZxnCaOt7hesIQEy2a4Aq/U0z45HhopfHH2RnZQN0hWJVhlHaLMwFyq
	 VcTVWvG7ntlZlAhcdUHJu25wp1rfN00jiddcmxIAISY2pOxVK2z1qKOgK4AfRopROB7ds
	 NbgCraYCtwKFlNz8yT86ub//2pFLjGToraQcazRhw54xgU0BeWHElOe2l8cvKo+MoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
	b=LwJFwRe2s/OVuCau3tUSsCc8m3bHvUyVqyIKur/za2nNl/0vRPZBpfiCke91C/aRDFse
	 vQM5dTTjJSpMrpkaO7NjJiHleEXcNbqttJOCm9vup5WyJ58szVyMxQ/zq09j8Mulh7cwj
	 Jd9atMK7uCFrDB7+noPEm3ac8Ka7BrXTt8qTOE5R18XBy9HyqSCJUwJME53M5rCdYthk4
	 jRK0SxHQVD/9Mq5qjmGG9eNCZgWIUy2LhR/S7yMkYOsv9eV7CPS9ReFtVf0x/eCtvveoX
	 F4oCiiuM6K5pQuQLaT34aO0HJLQbKESF7bZtgNcdeQABH55fpZsMqF4iNNCp/PyKtzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmPuaxZx;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540F606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 18:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9540F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmPuaxZx
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so402640e0c.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792606046; x=1793210846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
        b=jmPuaxZxGSuX2iUAkX5etUFc8l3rPMvgto8XSo5wtZwb/bT/7hXZd5zXz76Q3zTryw
         AHoQ+fHEfCnELueNC6j6PX5Fnc4K2VpLXakAFunBe+Mpc3uphKEEaJacETiZEaTxZZy+
         e2sKCGJviofNwT48s5JFb8OqqmXNunlx7Ty0tftUlJMIVauQaexhNpF67R8w8uEvVXIx
         N8dG1+T2D4Bp0ksb5ZmHMTflDJg4/I5YuUcP/iAGYZeZ0fdISC0jX82sJbCMoU0xlxhZ
         OqdwJicC/jegzyXcMpNBV17k1XuIQq3PE6tqJCnMnD1ulnQ7w0qBvYPGCkJ9hV+PjTge
         loxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606046; x=1793210846;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
        b=2KQ/MaYLNPFAt3u3FZOVKovV5pr+I5rwC5obGShSUXVhpLdvSasSWuh7WtOczaLKKl
         TKNvzdkarDsA6N/06UeZo1ByhnDWPWI9Ddl5PSTrb5Vz717QkxYL8WHKC9lotDJaW6yQ
         4h3MYQO9bzJmjW03weqhfJmkIBu4iOTjrY3FB1S1LTHZHgxArCQpZoW01x76/rulqFX7
         2cvL1QA/+fkpW0nEdfuceRTY8N8MHSFje8+F529eqa7+vJ+URycZ6fR9xz9oHbYyszXb
         cjgSJV/GMLZwu1ZtV0IX1cbc9H0+jQnA2NV4aIRbIJCpdubyT4kL1wvF99tGXIZY9D5+
         8BMg==
X-Forwarded-Encrypted: i=1; AKwUvBzRpYpJKTeeFf6rIAbye2hn6Sk7Et5WNaZQLJRqXT7Ez8po81n95WGEkf8FVbQb5vjrts5HbbvkvdsD@vger.kernel.org
X-Gm-Message-State: AFq9FYIvjwCSQwToIHWWJfA26xoPKRiAzh/7Jl6vgCdkAa3Zov96iUf0
	/o0NsaU0xFU8lg9cqUwRTdCerUvuLajSA7l5t4ndTzWSVUbQRtcmvIBl
X-Gm-Gg: AYBFou0ZBIY0wmesxPztAtE0Sa+GzcKRpV3iits6w0OCFBJnqFNqb2gIgRoMxHZ5YaN
	FHRI8U7C+ENJ7Cm9Wr9Du5HYQ2ncbEvVW6S8ItIGJ1bDZisNOzP/PX73qQBPwC/kWI1YV/lLNmh
	scIDYorn4czl/0qT7PEg/0Hmzxf95xcs5X98jsspdlx02uE40nYuidWX0oHGEiylUcW7bgRUKFC
	N6iTH5Gc80l+g0LIZGPKESZmtMtd3E0sN86OmSywCOQEYMPut4993vrmPDYskcArU4uYS+ucH3n
	gB3cP4YCAHaDqVyh/csZI1ThKPUzAbMW9hOIAPZsjbEllusIsXlWqWb2ZOPKSGjnyZ+Tic60PcG
	wuypWFY/Gb20cIcbkl3F9hyxXQN91w24jZ8xgBQKxbAeMu01PqgsXte89a8J47y708GcIyZ2XqY
	MZua5rIYw7B5P+SWcRMF/MAPIOadhSsUslur/N7e121iWOdBKTYEMgx3i3Dty2wDpQaqsPu2d1B
	nhjtU9t4orbHhhEXxIDiXm69/xl7ygNQ5uTBOJwEtZ7NXh7IN2qXdY7VxL/HLmSo1wMeEb0l5LP
	sd/LQVn607T69ckwoTF3duCMQk7r48lHLlw3DR2UsxdRgjXDEU5xZUgEMUxlGKV8
X-Received: by 2002:a05:6123:6d:b0:5d2:4a4c:ad83 with SMTP id 71dfb90a1353d-5eaebefa0bemr1334431e0c.23.1792606046270;
        Wed, 21 Oct 2026 11:07:26 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9697814sm4054490e0c.1.2026.10.21.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:07:25 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 15:07:14 -0300
Message-ID: <20261021180714.473749-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atj0iRFTxHKmhxVG@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local> <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com> <atjqZPuAbHDdaexv@ashevche-desk.local> <20261021170403.2052449-1-vinicius.eduardo.pedrosa@gmail.com> <atj0iRFTxHKmhxVG@ashevche-desk.local>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Yes. but is it only a single device/platform affected or a big class of the
> devices? I assume only narrow part of them which unfortunately use DFL register
> offset for something else in their RTL.

The A733 is the only case I've seen, and the false DLF is what exposed
it. But I don't think the BUSY problem depends on the DLF offset being
reused: with a real DLF on a UART that isn't 16550-compatible,
dw8250_setup_port() also replaces the BUSY-safe setter with the dwlib
one, so the same path exists. I haven't confirmed that on hardware.

With patch 2 the A733 no longer takes that path.

> It all depends on the outcome of the above discussion. Maybe others can share
> their opinions, but I lean towards a series-as-a-fix rather than a bit ugly fix
> + proper refactoring on top.

I'm fine with a series-as-a-fix, and with deferring the deduplication
patch.

Thanks,
Vinicius
