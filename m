Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403122;
	b=z6aWjD/TbS8Zx9mf1ojR+F4i9MbwYg/Ntoybfe4skaRGBK2OKYOa4j7rWJP38VK4bHYT
	 SWBKMVzpFyG2RQGGy/82HX8gsGoe28XDK1YY3VpNFnHRmBWbf0b9wldGzY7sgLpNkxaaA
	 AGSka8O7NS1fB48MCbEeyNVr7A2/X45bfe0bTJ8iV5jsShNbQPEuL8FXxRaFaKO+kWZR/
	 mrAwfL7V31eF/wnOIZsLeQgP7xnUKZVpaOLa2eS7eLa22QrsMjIRMgjj+YonRJreV/n1f
	 tp5fan6982hfKMfDjsblsiq3tlHyQqpLo9mZMyhYfXT9DoYCNQO1V3bHcsP4t5FhRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403122;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=0pOTAEaF1tQrXqyVBDxLQv2TF31m2JyoR8uXKcyw9MHKD7Usz4gPHmJTKvNPD/i41SMP
	 ns/NpgHazKTiOu3AWFnw5VH6MH9OUZdYQN4rsqYUplg3GpZjvtQfKva3BEbiMlI+DSHQG
	 Q3yE9qT5Z+KuDkL/VdMxwpT4XO1bIEfHnkqA+xDRQOLat867TY3rSrgH8heMXJN+zdI0e
	 0IBxkNU4MMwzIFlaPdPYOu7VtPM+uVHIteUEgb6Vht0yvtd/WO785dlnSopWSRLB7TFMG
	 S9a+viKyaf6597esInMgVJHJmenyU7p7RylcJ27ZT4Wcsnd48Nv9CvpqQ0qamlK5OQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RqC7PlOQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FCF606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FCF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RqC7PlOQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794403121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=iQq7dU9qLnoGNYDWDjGkq2hu0UGzL8U0mU2PJsT4ClAuEQwYNhuhD6lbU/L5j70yCdSj3/
	/GrODQvBHppOxWr5r6zzBgSrz38hu3YXFAWjAaXPwSspLjuvjMHkYMML/7f3qhxJCiKfAN
	dqxY4Cs0j+KVTOfLKNu99AiyUax7GtA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-EZSBetMTMR-sPmVieZjtoA-1; Wed, 11 Nov 2026 08:18:39 -0500
X-MC-Unique: EZSBetMTMR-sPmVieZjtoA-1
X-Mimecast-MFC-AGG-ID: EZSBetMTMR-sPmVieZjtoA_1794403118
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so9198835e9.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794403118; x=1795007918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=RqC7PlOQLpcRLVRN7+MIGQGYiMWNxZug8Tju31tvogWMzrAd4tQOCCnLYEDdGQmB1a
         yIU6J7qsALFakOeCg3rFjyozZXyY1ZY94vDoAH3zrYpWMWqsW3rzMAnOcfjV/MD/Ce5a
         3f99wOl4BA2vgj6J0+xX6JkVMkaI8VW2NQwwEtIGyuKrux76g4GlnDaBC8w6s7sAkLTX
         CbyPtn1OpCdhcy/up/0BM2RXl6gZXXBTuguwH77sMuZ1vEM2VZaG1zS2XaIhSTZfFi4g
         T87PD7H2j7sgEXpZpzr/Wf2M8EuE3/qGvVuSuZ5CP4DWg3BOX2f1Bcv2x7cLi70juUtk
         CoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403118; x=1795007918;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=NjecDKUTTpuLmLC7L1WrvoktDuGQjOR0II8iOSUjfnvAS4qgy3TlEZa36vKrvG1YHe
         7Tj2RPhAvWAbqsFh5N+HN6OxIkQ+LM7ojhD40LzHttBNitoBO7cQCj9tkSBbdS+Q106s
         V20rEHDuIEJJtQKhf7oWbNNhnjUIpyb8GAok02/bBb/2jd2qoRrZKQJULq8TS42THC1q
         SKODKdCd7P7PMRUPBwc5q3zAvYS1SjLF68hWLRBIwkgv/Ncli7QjOPMJyBj6K5LdQODm
         ONWCx2K8Xl4unlLDmFt5vZ0c+QJi2ALv6Y84ewsGq4xxmB13XAZdzKcdhw7dmJxBgAEo
         +Riw==
X-Forwarded-Encrypted: i=1; AL+hErGBCVHujc5P9feVFhW9AIxgDrIoqt1KLbvSeEAFLDcmW0w3kW4VAthJIOxwBY8hnNzUWt1x9oSbjR0A@vger.kernel.org
X-Gm-Message-State: APuU4Z+6bq+wF1ms4XhM8F4AtpXpCa5cKVQIew36hmXq8fHvBLrUpu6W
	hBjw8KHXZ0Dm/u8dZfhv0fkZFZrLmqrbDsRaeng+nG2fqR3bP2Q2DUNPDLqhSIGckp/53rMU30w
	aGaOL6q0JoYLEd84Fy6d7TUt43y3w34SFOc5UWOlS9IaiMPsyPa4QjA4Mg+2VdVQ=
X-Gm-Gg: AYBFou20UTLqt1WUEfaFq31lRGmzEVFEd0KRYKvE5VL9WEuda8ksdP+sD2a4bLAxhs2
	lRlZlzmf9zmF1YAnjuwoJqucc7x/ociFR5CgyTcvCSgtiSHI6NPRYwNpoys4KvXnJVokA052zt0
	PEmw9XiSSXVlQFBF1PS1uXyhJCWjYMCKUFUaOg9EJsjdumleVzmy3zX0AJD575JUkknc7cUPT3+
	6benEanC9I7S1/hz5wUf8PaxJbCjWdtcy0kkCMmxoyDuyjX1g85gFHKXJY9VEpwRcKAma0j3H0B
	yNW2jvBtYs2/EsMMLLMlrWnx60Bmv3pMgVGpFC/tC6MmZGh2IVEXD8k+aGjxmJ5VvlNbVBG4jGD
	dajb54ax8MbbHtjQbHTLnDFLxJTURBd35pVsnlqq1RhCcuPxicmLSpeQom2Lgk6Ba2AFrj3KWAg
	EfLzv+IxQN6p0q1Z/yCbOUb2u5IEohGF68BKAHUoQ=
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40825535e9.16.1794403117585;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40824875e9.16.1794403117057;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498811fa70esm9733692f8f.19.2026.11.11.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:18:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?M=C3=A0xim?= Pedraza Padilla <maximpedraza@gmail.com>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Helge
 Deller <deller@gmx.de>, Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, Sam
 Ravnborg <sam@ravnborg.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/15] fbdev: efifb: move the BMP headers to
 <video/bmp.h>
In-Reply-To: <20261027135342.2003632-4-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
 <20261027135342.2003632-4-maximpedraza@gmail.com>
Date: Wed, 11 Nov 2026 14:18:35 +0100
Message-ID: <xlv1cxsba4lw.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com> writes:

Hello M=C3=A0xim,

> The DRM splash client parses the same BMP headers as efifb. Rather than
> keep a second copy of the structures, move them to include/video/bmp.h
> with the magic number.
>
> BMP is little endian whatever the CPU, so the header gives the fields
> as __le16 and __le32, and efifb now reads them with
> get_unaligned_le16() and get_unaligned_le32(). Width and height are
> read signed, as the format has them. No change on the little endian
> systems EFI runs on.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Assisted-by: Claude:claude-opus-5-5

Please drop this tag. Has been obsoleted by commit 1e035297ffda ("docs:
remove Assisted-by references").

> Signed-off-by: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>
> ---
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

