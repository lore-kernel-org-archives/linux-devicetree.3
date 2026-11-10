Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314366;
	b=5Ty77qXozbPux91AVbAZZJta5vZLhSIB5EwhYLOEZLs4FyuieOsT48yV/jKKi4SPu8Bo
	 ZAuAwZpRrEU8dWhbcwqk6D4yWiiDKBzC4OwJCvj0VfjNhhdkScPTMRVFjXNhe7HCPzxz3
	 sZ3cvmlW4+/zCs6mUKdNC9TYO47Tv1gjWxk+Xz12YOHLHZO5weMQQQvxpA2UOmha0HxjB
	 dq6VKBkmRNVVwUyfueOqZkrcdd7VbqM3FsBCAIolkACcx2FUWsO7rVUn+TnmcyD6P0o6b
	 OA8Vw9+9nRE+06IJ1X7TA1D3aUYEPVDyVyo2x8+Aw9zCQsYhfBy3nC9O7N3QQcAuQ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314366;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
	b=X48kRiDXuKScBCxVzn5uGuVqLnrxXIF+58L9XVlJFw8t57Z7NfOu9qIRhRVKT8cpM4S8
	 xI70saRiwwjSksyHz21cwj5n6ORBA5QhWgrnzx4qokRl4YsAj1co+6hunmBsvXn/pJns7
	 hzTRxFlqbZoAcvbXMqVTVDPSSb7BKlDozZjhvXny0+llCsWLzq0I6om8b2whA6kXjtlCR
	 rwqQUFihxoWfbL+GJu17mBj8kNnlXMNDdSOcu5/zLBsuwIjntuJPGBnzPXtQobvPguZCh
	 DQ7W4Uz6iFjXbCx2D4wNYQr/2Evi7ZB7gPNW8JrJlXVl0Pg2W9+hG0FNC77Vr70XR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cL359F03;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AuX5FvWj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097460A3825
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E097460A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cL359F03;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AuX5FvWj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794314364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
	b=cL359F03eNTqNFOVRuhDGFzbdZpEw7Q2bl2VY8e/7Gpd1cRzmZ2txxwaRgVxKWa7Qe7vPE
	e2ez82P1BSir9oMjMKX7QJhRQ3xI/3A9fp/WDvmWyE3rM3WVf5kQ8PCM/TKcBUmrABPP5H
	Sww4o+6MHNeqHM2v7JCY/MFCjZLSfEk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-ZIEfZYWFPgGIt_2RN_CwFg-1; Tue, 10 Nov 2026 07:39:23 -0500
X-MC-Unique: ZIEfZYWFPgGIt_2RN_CwFg-1
X-Mimecast-MFC-AGG-ID: ZIEfZYWFPgGIt_2RN_CwFg_1794314362
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490d2ac331bso1716911f8f.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794314362; x=1794919162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
        b=AuX5FvWjl+Me2dms8Ev/mdJ8tZDZAWDAV3jQ4GVnMddEGpvyNd+RFh9Xn0zO1objDs
         DurEA6siye4zmPHKbmiBlmglmVQwMUJxdPOn3BaIwCAGfYbr7J/C7C9k2yULMzOkcGbF
         890ImdV8BtAOiUZg4A1GP+se4Y+CXhg2uYeHpqttxhicPe8mudvma9AXrkcesp/J770e
         LcR7eDA7OPq/HGKt9iCXB5Kq7DLz7acfpoHDsQCuJXFq9zzZWcQS4cqegp+CermqH83v
         IlS4wmntcWrvna8oH9ef+mDOBbPh/LqUhwiIxC33gWW1qBvKNUTD+sDVlj3JnrnI4wJm
         YEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314362; x=1794919162;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
        b=DskZds0UuB3/2ObQf34qCj5kM7zHb+4P+63XPPq2Vja4bxqAgoiwzq+rJ6YWRPFhyv
         +n3fiT72wdnFMhjvFYzs/E+gU9EAiEC/I0SOxfd2x+FbruUu8UiZqZI1pJCWKUF+cE/7
         Rly/3mzcXYcx9v1Y2MDhmtvfRSbKNcbuLeRjHS1thgEtZdxBVY41tHLEzEBl32MNp/iB
         ry37zJVeZtqbNV5qLIRggelE7Li9iR5CvPMe8zNOQaaRzIlXV1viZR0P8IlZ+EqLhL2o
         wDe0Dhe7w4fjx2krLiwGSiw+d4KshgIF8uuN72heL9HjJpTau0WWHXo1QJVR2nVjVroe
         92Ug==
X-Forwarded-Encrypted: i=1; AL+hErHv2XDJjwJeVpPTTLGoqw6TIJjNEH+7ZcQxnG12p4yBEr8BjFI6cklT8j/KHpgc8E4w9Q2eLroyv6wg@vger.kernel.org
X-Gm-Message-State: APuU4Z8HhMK8ojNJUSBrm7SDsnpvCXY2ayqR+qlI4rBtT62yIlRBkTMS
	tLHpz5YZy1J/zEwlj09Xekr5THw0uF0WYAZBVXhPKx1pbFlZNHK21kOF2ywCscs8Rw+fnDZhqOY
	ZoaIqeKGreZ5HsNTGvGc4ZNXTChF/0U/Kg0RQqm3d4L+ab+/AAu3I55ru5efR1xE=
X-Gm-Gg: AYBFou3LWCXtWTzyIpDvbqO03NSBfAynsia2hiRlXjkqUGXLZ5fSOtE/klqIqulJe+3
	rEaMRJVJGARS6nmMOSAFBbtpzvQ0h+DemwPtCLbni4TwesY8dNKkIwFDl52J/lirnhnQKsEWg/8
	PO0FD64YAvc/RMWdEPNbAs3zr6Wuef+fcdXzBviCQ2WUfz8bE3hTZolr97dNnd8OvaAsUsHC2PB
	HNP4YzjbMKN6DWKmJpftgtJ8Zc6RnIYO2YfNjQvQO8mdfru3IdjUbWWJlVDAUEoqsNiOtSxb/tm
	Pg1k4FXYkayDo5wx4vdGKIIelozmmh7/dBawHEzrnHngqKiO08uvR90l5Dw3PWf+1eKhCPtEKzv
	EMiVlN9xxRhT3kE6xS6VSaZhbWyy1I3wNf4r+pcZhhsshl8jiXVTNSJuew/K7mDTz4IBbKU7ESh
	fwv07xRBkI1En1h+V6h616BYFskdx1Fh0ngtQYRD8=
X-Received: by 2002:a05:600c:818d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ba023584f5mr45491465e9.35.1794314362114;
        Tue, 10 Nov 2026 04:39:22 -0800 (PST)
X-Received: by 2002:a05:600c:818d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ba023584f5mr45490665e9.35.1794314361627;
        Tue, 10 Nov 2026 04:39:21 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm71937455e9.6.2026.11.10.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Devarsh Thakkar <devarsht@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devarsht@ti.com, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 00/14] Add DRM driver for Solomon SSD16xx e-paper
 display controllers
In-Reply-To: <20261019213726.4145532-1-devarsht@ti.com>
References: <20261019213726.4145532-1-devarsht@ti.com>
Date: Tue, 10 Nov 2026 13:39:19 +0100
Message-ID: <xlv1o6bweu88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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

Devarsh Thakkar <devarsht@ti.com> writes:

Hello Devarsh,

> This series adds a DRM driver for the Solomon Systech SSD16xx family of
> e-paper display controllers (SSD1673, SSD1680, SSD1681, SSD1683), starting
> with support for the Gooddisplay GDEY042T81, a 4.2" 400=C3=97300 black-an=
d-white
> e-paper panel driven by the SSD1683 controller.
>
> The driver is designed and architected keeping the bi-stable nature
> and low-power requirements of epaper display based systems in mind
> along with having adequate flexibility to support varying use-case
> requirements for the e-paper display use-cases.
>

[...]

>   drm/solomon: ssd16xx: Expose refresh mode as plane property
>   drm/solomon: ssd16xx: Expose color mode as plane property
>   drm/solomon: ssd16xx: Expose session management as plane properties

There is a fundmental issue with these 3 patches. They are adding custom
device-specific plane properties, but the KMS/DRM subsystem requires all
KMS properties to be generic and standardized:

https://docs.kernel.org/gpu/drm-kms.html#requirements

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

