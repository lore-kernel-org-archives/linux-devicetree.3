Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840249;
	b=ZvOWkOvIR8RnjV5NGVork3rYwkWLErtfzFvGFNhWGcrU7MF2sodP5PR0qTqp1iDWt1uz
	 TScVHfxPDtRCd7dxC9Q7FN5fg9E5C5+Ir0DqN3jlj2/tca+2Wjs1XOgSHP3r42lchhVP3
	 ie/CCEuQRn6FgOiXcQo6VKW+yLeWfXD4L/tV09s3Jo+FCCsFpOVlEO/y3aP7zlVqB7Q+0
	 KY0YN2fM3jPIlAL9bgHsoydKdKp6wkXAyl+3QWsSMneMAsbFkyAvmzCJJ/C0QPCPtOHvs
	 wF5qzHZV//Yl9LONUeggLYC4Ow3Q5wk7vvRezkZlgfyb5rr7ZuEWzQV/0E67NwmuKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
	b=ANktObUuiNXv76enlKHQihzbrNXEa7EO3DHJ/ZfkgIO6eCZKAJ0XJOQdUL4nmqtAAM52
	 iLiZB2T2qelqDVmwjdiEfznPCuBTm3iLWZm6VV2UvFc2MYZc0XMNLbfJX4t3EPpVlZYR+
	 ORvqJCyFw+ia3LWBcfOgcLOvwEPutmLaLHZnUBl6o3UYfWNHynmDIv4FHYEeDf3nSIN4y
	 jJvtEG9Hq2AJRbi7LCagih8v/q+gujtjfYw/wo3nhEzxDZ+JuI71IGawlOZtgdExEvRY2
	 6LRJTgHtQgz3kPfW8eVN8/Av+N4jIMA5S6rLKYjaQHi35On5wblWuAbwfGP1dBhnPZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dDxqpyPl;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB6D606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dDxqpyPl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49134c8509fso3482169f8f.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794840246; x=1795445046; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=dDxqpyPlhMnIDKOOdulSkH3iBLaI7M1xknBBwRKdP9D2bShvNZtuYOTZbP+x+jb85C
         m2RQswzPfF2sa+1yR7MRuq+5hy8Nkr/t+OiOkWG+UFljGlXmU0Yq/Djb4egwgEMto8Ac
         vBOxUT94VgsA5Sn6iKR2/bBsvTIFyfUaxwHemT0zsBrGe5xYT6LiwbUAUdDJcJoXE20v
         iwQ6RZFEQdGNf+Emso/3is0/Q7QtOjBLJyi4C2WTxm4YIThFPP6x81jLFCg6HaoJWR30
         6Xi2Ds6WP2qIygmRujvMmqNMej8DmyzoSwyOlhkNMdWcVV3Jon5bLQqT/i2QFJ9j3UB0
         R0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840246; x=1795445046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=gKUh33hliKe0IgSxeHK8Ah1mVfU8zPuYFhyM4xmsd35WQ4Mp1ksY9omRJTfr2KG5uj
         a1ILWvAZIPPN2kdkXc1N1tOL/jkfhXma9u72bFgzYmQ5Ser/mnMRO9WfcXLTRTRnk4dy
         XH3j884DFc2bJ7SdAQ/rRRqhhrUnT2GBtSkXRIWU+AzQeOhaE64S6qZDbQtUPCxkG3v9
         CQeRvsJV7MWslqFm/OrhobnUajeaoo/6+t+i77uwVH/gzvdfP7EC9QIbtw4VE5ppsBEW
         qph3oi+xPBDVYwUBpHJuNzqXwk9hDdRVlmu/u+aivAgGFXvp1puJT8gDimQTHQf6Q86Q
         1YIQ==
X-Forwarded-Encrypted: i=1; AL+hErHfNgDT4s9AcxbVC6jjPXjzx90lI8ZIdS9NUt5PevPztcckmKddEdGYRFm3D15m3OaNS6D7NBXHOJH6@vger.kernel.org
X-Gm-Message-State: APuU4Z8ODEP5fmuh980jnfPcRqoj1cOWd5+cRPUsLMHh7rTdcM9P/x3o
	qIKlXdEubF7QQsF4SBjPzRr7c1LwUN9pWTPhzJ1DDZZDabi2ndkNLlvINrfDSKADpPQ=
X-Gm-Gg: AZFdTZe0jtEUa1LcT7q6MIsStbT1jNqmqIXcNUCpWVO0VSksxYLHxaRTblFMkuXPbJ0
	L0J3FPTzQobudMeM93Fwe1v/KKg0KmnlrdgZDKg5FWlVaTCRR9UKqnPw89P15O+jy+nNCRoM9gN
	c1m2r4QK0EOB3zXxsxGZFylD5X/O2wRcKBDcVmPYzXiv9QlkEUBVtD72XLdiv5raMD6A8lmlhqt
	kJdjYRtBdIhIzuL2RZPm6e6mY+l4VoXi8veuBJmlNtJN2ygwxX2IffL2kx5yHVbSHyYXl13NI23
	4ASyYXmwS/To3G7JEmKuWfnjex75hdq3owezJLJVbhdMAZK4oOxaL+LdY8Go+4eCY0P0m4663hY
	KvTUx6JBbZ35PvggMN2oU7F29fmR2cHFYU0gh1Yco1yjzokgYwVCr4mCrSGWrsGumeqoYPQZthz
	9rZvzuAyR+BOus0Yr/GBCvAI5iqaHbGaynnw3URKu/bD13eNEQBgzEbyRW25iNbTN+fwOEhOq/c
	699pLiIl4d7fafx1UKRFaPq2MAywjjSF1LipQVMIGZuXaf70cEx5i35zsb//3SMWhIDOn9i+Jea
	xbEd/nfkM5hxCx0cI9XpgbnuNd88Pv0sVNWhxZ9/gDAVU2z90HLwnFZwvGoCm7Ym
X-Received: by 2002:a05:6000:46db:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49c73350e60mr16833660f8f.49.1794840245956;
        Mon, 16 Nov 2026 06:44:05 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm24003588f8f.52.2026.11.16.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:44:02 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
 <wenst@chromium.org>, Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
In-Reply-To: <afc3ec2a-90b5-440d-9710-2b3892b01b6c@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <179239867012.642420.15110854236483587234.b4-review@b4>
Date: Mon, 16 Nov 2026 15:44:01 +0100
Message-ID: <8733t0ygy6.fsf@baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Angelo,

The SPMI sub-device series has been merged and is part of v7.4-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10c833da4dde3d9bb19e2092a33abafdaa16a341

Would you be able to send it in the coming weeks ?
We have customers waiting on MT6363 support for the Genio Pro 5100,
and we'd be happy to test it on our boards or help with the remaining
review comments if that's useful.

On Tue 20 Oct 2026 at 11:07, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 10/19/26 10:31, Alexandre Mergnat wrote:
>> Hi Angelo,
>> 
>> I'm working on mainline support for the MT6363 MFD PMIC.
>> 
>> Are you planning to send a new revision addressing the review feedback
>> on v12? If you don't have time to pick it up again, I'd be happy to
>> help address the remaining comments and prepare a new revision,
>> if that works for you.
>> 
>> Thanks for your work on this!
>> 
>> Cheers,
>> Alexandre
>> 
> 
> Yes, I do have a new version locally which didn't get sent because of the SPMI
> series (introducing the new helpers) that didn't get picked yet.
> 
> Cheers,
> Angelo
> 

-- 
Julien Masson
