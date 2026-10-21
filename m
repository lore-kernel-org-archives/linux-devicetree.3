Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536612;
	b=TxBisJLoPsU+NjU0RJFhaIJ946A4IP5v2QJBJ4cef+o+GI8O1OU4XxYqrKD3Ym5+n9S4
	 6rkNykv3t2DEQ2Edig0eSf4AaFR4+SpJJrSjwzDP4KbrWOOMzr06PbHnmR2wXbWG3gxJJ
	 p9UBh5O1IAY+ZYrNE4bbaDKAv9aOeXMSkQC6M3qudt9GvAuYj+nT9H1h2I/1Wzl4OuMMa
	 BuP/bu7Hl1FtsKnC0vLxRXgq/JjENVIhmMP+7h4GVq922cuCTDDswSe8C7RdGvQ8fwWqs
	 vTLB455TaJOHCjgnpGnNMBTX62b+ktcVBvri+WWy1sZq5G9U5aVAlSqty5Q8SRpCXMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
	b=RRTCynexwdDyD1WHXuG+f8iIkqBZF070kVULXY3skOXZPeJHV9VRKzTW7fVnQEU37txz
	 oiPQmjvTMXp6bzoGgrKPIMxIfnxKomFSkB4XMU+3aKr3oHzY7h1Gd5GY8rClpx9iqfb30
	 Xyg3h+v5X1aNcXieI92OsTV0dPbsiQTDQJuDOqb0XEOk8Eag9mbcFy0hX6WAZr9B+Sgid
	 yLSgKi71KpeZZw532O9lYnhZhzUjWtUDnsY0kQwqdo0fRljkeNe0o86ZMyMG3X94vlyia
	 X6LaLylYJsqlP3C4T64d0pDtHhPmRP3We5NikRjbxnW/ITrK8Sgl9W1YNraIaU3HBuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680D606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9680D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so720635e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536610; x=1793141410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=oMGtStFfhGsL+mBjIIOXSVYiVGOUixhfa02bRsi991TkgCyk0GIcCTt75OwAWONrt3
         XyxUVpHQ6hS5K1bIte6yGRRfPJrwKq/BdNHY4/MKwW98pomtO8eR32TcUmg5eRs3vT0j
         4vfj4Qati0/E+qbSKz2TDX3+AUdBzroKUb9HFKxqMw8GIyTxIZfMV18nnUmzSg5hXoWw
         By4JWTOxBRV/qp54N78Use+YIBtMTyBYI2FcGlVPxD5AjWw10AE1hZ7OeZPBF9JSBynK
         LIMboApvT8TOGuMsl/r9aUKdQNAAF7XKW/RY7q74qIswfthHsRlqDyb2ZzjsqPp/ZYRr
         s8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536610; x=1793141410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=ccYsUp12SMZgqyM1uVoZiiVkfVj4WxTtXxsforGxDZ0EuyBTp9K92iya7PbcQy/+Uy
         m8uYeG/agw1aRbRAdtV3J2nKB22fCua0WJ9zj05DLBoD6L/D6JI/zcDQWO7pYH3WtOho
         3pYAGKF1qgI1Uq4AgI0rMT+b/QXjp4jr/uxXzyhPlJWZQM0ja7GTz4UgWDEpwnWwXAdg
         Nel3qObNPvbkxeCuKIL0aZDdqN9OZEn258RTaFNqcNYI0HCKHLgVMSqfcS8RIDd+K/1T
         1jvfNdVpAziEbHWtRCmIDHs0bjJ6mk5LM6tiRC2zwPFemZHz6yPhv6qvV4/VHVEUvh2c
         TDGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmpWyTU4lQChlA5ZjOQReMUBV0CddzyBdGeCO4y3MvGHSkfbubUwcwT1DGo2ZU0r3GgXQm6aEkY2Tw@vger.kernel.org
X-Gm-Message-State: AFq9FYKi/Zd4ckQkFixw9U58OuH4paaoGHn7InCeqr8uJp5hQkDtn1WL
	EbcT7FusE9KDqOojCrZKKsiVjDTHi7DOokim+saiDmW56drrtkV/JIfC
X-Gm-Gg: AYBFou3CKMhd1krP6UJ/4NMNdgifYP2nGRYzs5oGKjmdTvU8csBVIzGY+9bZYs7qmul
	RreDjWBaTawtGYvNwprzFt88AS129+vZTyA7Aif/8NVDe+1dXkO6vWNsC3DUlWR7PLAy4oX/Vbx
	twW/93HCqXyKThrlQON6LN5ufQ1OAoYN9E7jesNAMkzmOBk/z/c/g7y1khJBPVDceRUM7JRXqkL
	pjdZ9JNQjJv9o3MEOLrfSv4Al4WcQ2rB5expAO43+9qpmnCcwt7Oj3i3LgtiGlVdINpNjP0/AFO
	tM/KfNoq10omrxjU1sstQjyArvFw1pPe/AcMzMcjlOys57v+str7uv50K7LUym7Yd5jx9L3y1ac
	Ty95VYP212AdlPAkgObkz0S2dgdzUgB81pO5NUOJbKFFtWFaRFDFCgp85pmdMbZkQx9COgC4sSw
	FH1GVoaevyVoVbIHwajqsS8VUIjiGD4LRxoFBB1zhAJFdMDe47oOkwWJV8DQW8Vec3o6bypww+q
	jMw7gXAg4GCWQF6oYdrqXoY
X-Received: by 2002:a05:600d:82c1:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a1fdd20c2amr2908965e9.8.1792536609700;
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/13] efi: bgrt: add accessors for the boot graphics
Date: Wed, 21 Oct 2026 02:50:00 +0200
Message-Id: <20261021005006.2341200-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-3-maximpedraza@gmail.com> <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
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

Hi Thomas,

Am 20.10.26 um 11:13 schrieb Thomas Zimmermann:
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! One change since v5, so you know before I carry the tag:
efi_bgrt_has_image() now also checks that the image address, a u64 in
the table, fits in phys_addr_t. On 32-bit kernels without PAE an image
above 4 GiB would otherwise be reported as there, and
efi_bgrt_image_address() would return the truncated address. I'll keep
your Reviewed-by unless you object.

Best regards,
Màxim
