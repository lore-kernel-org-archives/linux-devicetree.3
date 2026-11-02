Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654771;
	b=NZZIfDOIE6d9pBi4h29g//YggILJeMH/oGqZkkLlWJYetfrO69M58KvuuHDvHp2hXKsb
	 Zvzp3oQpQqFxjkxHHEwmWndl5ejfjfCyzAV0rocbUwET0tYM6ysEVu2Qy+WMk55rlHtyo
	 +DDvFwhMK7EqOVguv4kHW8nakhfm+ZYt2iHbWp+ROz3+XW/dPlWkngyfFn14h6OnkLyHU
	 poR7+DOjk4zahPDoFdFVtugZft2jCySh39KPH6oUCSVI2eiABZZDBGoFnPDl2+lViwtm2
	 EkkEED/vxWjn8Erh0xAS637L/saopE6B1s3B7jWv6K+TFP03kodkNisSfMdU9W8yI8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
	b=3jmqtTL+BvSiDjW3r9rcqFY4UlLcxrNNxjnvuH8ncK1a3oogDM5y8eaI/pOGBd783NH/
	 jcXfuhuqp9EkyE8lKLMlK6SXIRxGaWQRzc51dxGOuGiDyur+QMEa/BCQAkaRJcTXOOmWP
	 12R4JZRb4OSCbspl00f8M64V8kpcGaS3dWp99qKOKyEqiwnlS/ax04bND2K4gOQ4JtmC3
	 53M73ygJi8hcFrwMkHyHYZ8qfQseSGDixbpslQfUzCHrROZ/zb7SfEoU2fFHhITxpzszg
	 NeDKpYXDu9UxnxZ+r2ReskAnKrN9CggCQvp6uv0lDFdfV8olaHV7XJGonDhKI7nAK7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="EkLVcAW/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA84606A331
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 21:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA84606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=EkLVcAW/
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67999045530so2950509d50.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654770; cv=none;
        d=google.com; s=arc-20260327;
        b=sfR8kzzUpH65eOEbrkwGjHsDkP4Dq9l1jjFLXL3q/jzhXSvu49OoHAVVYK+cfagt2q
         3uPhgN5sxsh6zyJQ9O8Q/TbGBxV0XSug1sGDWGlZdzTG7FUqdxI20UWgDI0ItIXm3qJz
         i5Xd8GUnp8aaM9svL+bEPFL2aLhDLuK3C+r5ho3lNrkQNXeJTHWwo3frzqIq4MNSYcQZ
         OSVFfq3JJbhEuXBmZtNp69/rrsNAsGPIlBf3T5TI+YiQHZQMMgQaMcYPq7D2vBLHKKbG
         GGZ2yv/TY+e0uAi0Ly0nJ0Mto+I1Zj91M4wyWnmpvB5qXR7SAarcjn90i1ybdaANaDUY
         Mq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        fh=kevlCd5uP37uIHz8IlkzVu7Z9Y8GZODIMdaW8qXE3Jc=;
        b=JbFzHw+O08XVdF9+3jqLmxwWw8anca1Ozukt4sGVyPBYmz2NJSvzjDq2edGA568Smm
         Zosg3TVY6yV/n3eWWLzuqITrWHTGkSICL0BtLNVjL+RL899b77BMh1xtxhHpzor6Ohqy
         Oh+YBZneykU2W/bE8ciWK6CA6l4jB2LJxEpIWK7NXI75oxHRdpkGgd4MZkhy6jOfrRlB
         chutx0R/AwRjkEyw8DsEkGq2/YShLEVxEAZbwjHsQkhNAyqKo3G52j3rAcYfrnku3DVv
         f6XXIlVCh9vh7o4pGJTPwXBZYwS/J5Cgu6ZhBLd8X1uReqirU1mc/rxzOt+e4YN/HyVe
         Q5WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654770; x=1794259570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=EkLVcAW/XpvqanW9zxrrB5iSWb22+SlLfvpUHT9FfL+pgsufClU3qSiqvOQVZNYepR
         jpa8BAWzVeNCeYW5jaIkem3eDRMWMvnPpt75liGv7tofCUmodFBR0eeOeFX3gWOwDdTC
         QWsh0QyH7OBmX3p0WzYq4bBbnByFdIjaDWcEzhZctWnqf8+ctAVNt8W+tLWYRUqgg84Q
         c6WCTiafAaBb8sr+58Lhr9saMsrPGiaBm4y4xM1fydrZFOsW8Z7wjwOa2S7sAsLE8JJr
         aVmAtC8DPuKhe8jSjHD5rYwj23dT6Hfvbln3WGMnQeO4dgvVSPvvKfoSw9JdvtgXnyF/
         B3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654770; x=1794259570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEEDJvWLJoTic44apbEZXLE7qbvQMpQqBjQSh5JXpo8=;
        b=pR6SmNBSU6A7KVlDSFLJAzPl21T3p4YfyryXmrKNK6ZOk4W+m8Ib+Mcgj1i6G2xJO7
         KQnhQRKUJZCG+jMGoANOrfuTq13d/MPS39d/QL7I9NJrhDMmizVlJW+4OhwkEfv84g7I
         ZPU7Ca6uRXIoCe9VI7nzJei0OinLxKAdYy1UDmrMm9HEH0JSKBwCDfqCg2alN6YX8mwG
         51UT5D8VuOq7gKDfurufT6QBmnygJUQmBQ4RBYerU2nNblFJs46qFLOUssmbT1ZpJIm+
         O3oQymx+p2jG/jjMeVcVK0FRPjc/14cLI/SziQZuuAUcoaCS6lwkMiclZhkDBsXDtK69
         tAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuZroNlDVxqvUhGEPwILEKYscuIHCr0sak0JULOuvf1x57otlTWw9ZQmwpLWSAk0Ixr0Q2DKScybeR@vger.kernel.org
X-Gm-Message-State: APuU4Z890AtrDuqD1U95t+8F7VieDMaNHcpm317YJaoO+cojzCZ5K9uy
	wmKOJGanzOK/hJoRQoGAB6ciKxwj0//wauuRYWOqLehg9FY8OeYewq8DWNLA/pI6eOCy9oc4WAa
	aYRm37s4RCmK1x4olDzc743O8d1Ga0AQ=
X-Gm-Gg: AYBFou1xFQueY4wUTMh4UD6LDtOf/M80lU4tcbJlrxNFZaRpOr/r1csXDpn8X72x0ip
	Wd9r7fklqpRoEYW80WUuhjmjbIrFS2Uw6bjKSHjrakybTBcsP/uk/wYjUKbGl4+q6sfvm8hA0Lk
	/a0NwvGWWJVDOdkFC/Hxi+wPjlfgxd8AcI2Y8Zxww5M/79ZmzpRQ+fLjTaQJt4bn06Q25aRdW2F
	ClkDRVrN6HObu0WwbICGH/2wQYVGHQv2Os0tVa2pL6J7/Mpj/E056lNACLNW5kz+1bBbaz+puya
	dFItrAvrRtZbjz6jBL11wtFEbv+n6vDj1w2ntSU+oxpVxi8snC8kwgH1X98fv8GHG33ILJVyonb
	dEOFhgINTNdcgaXkNgSgkQYZqFneCebPcKiykt7qrkm86I4QMV+CYcF4L
X-Received: by 2002:a05:690e:4548:20b0:679:8af3:af24 with SMTP id
 956f58d0204a3-67ba4f07cdamr5305703d50.52.1793654770101; Mon, 02 Nov 2026
 13:26:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv> <20261102-ping-fan-1@iav.lv>
In-Reply-To: <20261102-ping-fan-1@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 22:25:58 +0100
X-Gm-Features: AclHuK8ZaSBmGhthz5zT-hTxTfEuu2AtIUbTr5TxRdgub1ai_FkOm5Oe-6lP88c
Message-ID: <CAFBinCB=oJO06YrBGxYBPTTA2HP-xoOCKCivfRSGGryGRf-DZg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
To: Igor Velkov <iav@iav.lv>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Mon, Nov 2, 2026 at 7:47=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> Hi Neil,
>
> Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
> it in for-next. Could you pick it up for v7.5?
I'm sure it's still on Neil's list. Your patch came in around ~7.3-rc6
which is when the batch of Amlogic .dts changes has to be sent to the
soc maintainers.
Please give him a few more days as 7.4-rc1 has just been released. The
normal approach is to go through the list of not-yet-merged topics
chronologically.


Best regards,
Martin
