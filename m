Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393E3D812D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278175; cv=pass; b=XXXvWigAfuJLeBxcJkChPSfmAQ6ML0a2nRfJUYvm9d+HCc11Qy7HKAcccx7QX/qLMyoWG7uj19w7AQ51cAwFoLFMAA3ngprK8y4YV9gNI3VOPAvmlxxQ7k7SJtE+rgxkYAtlUue9App6uqDvoyINw+32B3fidispXfEqeHu+8JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278175; c=relaxed/simple;
	bh=I4SvhXPS8Ge8iiszZsgMBFDfyiyXtqJH1BB6jNaAL3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqnDTvxDXhaLwY/qfHhOjkjIUuHC2x0vspYb6bLKyttbsOlY5wtheM/IfYRygIca31KoSXKkGe8FKsJH+bkHU/7obyhrPoNnhy0UxvJbkxOpGCyXz74dpPtET4jte8B5l7AbSHqlOkVSftnHIng6Lx8cQd8Lrp0uuO3ng3m3Mw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxd/z3lQ; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxd/z3lQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bce386d5b85so789958566b.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278172; cv=none;
        d=google.com; s=arc-20240605;
        b=UL40hcFb1/r6T7rtKJ3nqV1IeINWp1TEu9jLMqBD/Q/KYzhkF0nSs1ZXB3xPsSCZ/y
         9Ehr1EOrJMJnLHZfRTCc5xT6DlOdjus9ddDt8z9c+mhbwvWvdYOeS2MDZxtS3UpORtTD
         A8UIagZDDMbSpnXlzsUcmKVEEEKvAUTZBQ18gc2CeAFsIHJIL5jgPRcemte5DXrEwWvd
         QoetmgnNU5hhOKe0sJtAIgoupQtreLRTB45tZEzR7gJ28oKqY0LQdgZgkUq+mGXO2J0m
         ZZh4GJ4YXOknPNpLiTD6Nz1XRslRKDjoxF22gOiO7podnAGGG5DesIXpN1r0F7CoFu3+
         4sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6I/A82YX8z6OO2krWYOPssthDRygskaDMocR9Ah5D0I=;
        fh=Ul4ZFJfjy6sMUYHoU+Ua7eVtlR37mFYqimLhH1tG78w=;
        b=Fi7pZ4y2h4j2Eh1T4hgNwqpjc8UVlLHux3T9eSMLrHy+VtyvF7d4K6vGNiwUl/FDAk
         s3Jikgni9pTHtIF6iq9OurPkAWxAnvXnBiGo0wVlZRN0QoS7kzpEFX+65iR8SwnI7fLw
         Qf2KnKcOYmGmNyZlg1lpOZxIhx6ENY1StXkRVAFYQxL8B+JhS4jU9T7EaG+mhh0gvovj
         W0d+N+7FPmGVDpIMCYlkoxzZomCyBI9xVTr3jB+9vjPes1h0vKNgP5yPL1vHEd5xOTwm
         6K6jaZbx/V4ByfHvL2CMpRzLFLOrF78NDnOVyx7Q8pY7ERDLNIif1wOFcbLdDQp73RhY
         Mw4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779278172; x=1779882972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I/A82YX8z6OO2krWYOPssthDRygskaDMocR9Ah5D0I=;
        b=gxd/z3lQXG96sL7Nf7KKBVK7kAW8W+4+L1VThP9fABVfZWixeJoh/mSStTcNFc1tPN
         flv/5gzaR4V0FscaJvWiGF2dnUdbkn5HdusybpI3r5AHcCmKxo5OACkaXKytwQ+GQa37
         W0gHCsIGT65F+XV8Yw61nsQUozH2p+RvwThFHXTbbzEhD5DYJeR98bjhdK8sUATee5MY
         wkglLAQz7Un1flTLxOrOzSf9196ZpJtHrI/1Gu7u27+e4yCPjvVQ8RuiqwKyWexfKWbX
         XC7wsthI/YAdEducWokQWS9g3Jn9426pm8+OcmpBATqq2MG4GExQ0QquDHXapdgxrueo
         SZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278172; x=1779882972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6I/A82YX8z6OO2krWYOPssthDRygskaDMocR9Ah5D0I=;
        b=iD4mVUvToRidPcO1qVxbAYXef8CTeozMhkyE1iDqTTdJUpoSiqmCE+UyOmiYvIKLTX
         R3JyL1KyzHip4DbUQJEl75xDeS8pj9d7W+GwyMd5EuxybbCGymxChNsTNlm+Wlt59hvw
         pn7PKfDeV25Sb18NWzTXeDpN2rfky0MvSxoQQZwreFfYCqJVZHq9nSkmhxLUeq6H9xnl
         uI8TtjqcHe6z5YV7MtzG/6r5G6AW7wiaLc2kF01byqoY5chRoeBbSa1aNueZ98aWeVog
         st198kYRtdGFTqdskdMZzD8hYwXIP9cY3EOi9K0wJhJa97qxTJ1k3pX3Ny3OMIvOq0Ze
         lVZw==
X-Forwarded-Encrypted: i=1; AFNElJ+rAj0/ol6e2zPGOKNpeVzfhtFulw8XLE15xQroUGnootL2M5YpSW8M8ToY7QAkWA9jkmFemyGyqznC@vger.kernel.org
X-Gm-Message-State: AOJu0YwigOYo4W48UEM0aqbknzegJQyrlAsQRkRzSwfBmKLlGmz5U+E3
	f1I2OkcsaMCYZX6Yg6l/28qLhHc6UMZDQSnJUqtAqvm2hJ6qc+O56KlfWuLlYZhNXtOSQ0MzN24
	XhNrOEtLn3Asp+FLnzxKKUo/fZfyyup0=
X-Gm-Gg: Acq92OE8qiTichLIZmNyqwtx70KuuQfpH+sQMARRi7/nOYxclEa/rSo3V1Saer4tb4Z
	VfoK0JcyvuhyP7F8D615+MSrm255+b7Ob7N6orFPb82EhRFgSmflkcyN92CkPKpEnTP2ViWpVDF
	Vof4DneV9jQUCjDxOs+6/KZmt4ld4xOiOB/ZzDcEmpwmIN0XYWjoYJaeP9qfKAbkDKL7kwGqSZt
	l8zWQmKM7evA0X+KILfsQBjLrnB5I8IQ4G7PI5QZ1W1iQK2vYQ8CH4kU2H7YleFkw9UGKXiQYkd
	iFX7ztf/EVsl6tANoq/pvrlVbrctS/hCFtVnNtZX2cTDcIzkoeW8PB7vr0GVbDNhTlQCbkXrjxx
	g+So8z4P3
X-Received: by 2002:a17:907:d411:b0:bd3:897c:7800 with SMTP id
 a640c23a62f3a-bd5177ebb17mr1398529166b.15.1779278172121; Wed, 20 May 2026
 04:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520072843.3593-1-kimjinseob88@gmail.com>
In-Reply-To: <20260520072843.3593-1-kimjinseob88@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 May 2026 14:55:35 +0300
X-Gm-Features: AVHnY4L4aitoKa_0WRF4H0ViCogDLK9J7rRSZAZRx-vweqx6tym1NL58_C8VI1w
Message-ID: <CAHp75VeHif8zzYg-4qKxwA=q3emszTzyoQEtpoK7QbcwDhQZKw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] iio: add Open Sensor Fusion UART driver
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 1:47=E2=80=AFPM Jinseob Kim <kimjinseob88@gmail.com=
> wrote:
>
> Open Sensor Fusion is a UART-attached sensor aggregation device. The curr=
ent
> prototype sends OSF protocol v0 frames over a host UART link. This RFC ad=
ds the
> first Linux IIO receive path for that UART stream.
>
> The first transport is serdev UART. USB, real sensor reads, fusion output=
, and
> production timestamp correlation are intentionally left out of this serie=
s.
>
> The driver code is kept in one patch for the first RFC to avoid intermedi=
ate
> non-buildable states. The internal files are still split by protocol, str=
eam,
> core, transport, and IIO code.
>
> Current validation coverage:
>
> - STM32F405 test firmware OSF protocol v0 UART stream at 115200 8N1.
> - Raspberry Pi 4 serdev probe and receive path to osf_core_receive_frame(=
).
> - CAPABILITY_REPORT-driven IIO device registration.
> - IIO read_raw for accel, gyro, magn, and temp samples.
> - IIO software kfifo buffer userspace read.
> - scan decode helper for buffered samples.
> - dt_binding_check pass for the binding.
> - checkpatch.pl --strict with ERROR 0, WARNING 0, CHECK 0.
> - W=3D1 source compile/link phase clean in the staging kernel tree.
> - modpost unresolved symbol warnings came from the staging tree missing
>   Module.symvers.
>
> Known limits:
>
> - The sample source is synthetic stream data, not real ICM-42688-P or MMC=
5983MA
>   sensor reads.
> - The IIO timestamp is Linux host receive time. Device time correlation i=
s still
>   open.
> - Runtime capability removal is not implemented.
> - The staging layout uses drivers/iio/opensensorfusion/. The final direct=
ory is
>   open for review.
>
> Review feedback wanted on the IIO device layout, timestamp policy, bindin=
g
> shape, and driver directory.


>  16 files changed, 1706 insertions(+)

No.
Split it to at least 5 patches (as far as I can briefly see it's
achievable): base + feature1 + feature2 + =E2=80=A6

--=20
With Best Regards,
Andy Shevchenko
