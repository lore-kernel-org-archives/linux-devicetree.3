Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536621;
	b=wJENyDlLK5ykk0cN5qa88M9YXtsmjdvsLHRK+Yn9fgRClbQ1qIO4b4ybJivsJ+aXAUmi
	 vqwKWARD+++6J4Bp3mt4sBsG3hyBmNCzPSZw6bib83cieXPjuCLhKv1MAOlMTmIMjRgYY
	 a+xfu0ZOxhcUIY73sLToPWI5AvtUNC2qmdTqfKWjIZRtxJRW0eV1guDY1MdtsnovHOy20
	 BRdseo6LhABeYx//FShO7J+ZUqn92ThlrC3oulZQkDK9dwqGoz50+GxbFYks6rI0LULwL
	 ghUwcu8oWbGR+EH4JS5+RRT0y8xvIuwwygzos8i9h7Ei0AMgQKBvvoyIAcmjgL6PSyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
	b=vLK8cILFJFbbWL7lMXGfiMK34aM4pV3IdwRUi8o+S2+WHjTcBRq4Lu8LVb9uVvf5GCgG
	 962GcMLDNOYJK0V98wSRcUu1bYZ3/hf2i1QDWtbkQoGJKAE/0uVaRVrObsMaknYmZnEl7
	 EO7dOJTmX4q/MaTSxRSc/Viea2wglKWxCdeqrIxmW7EG1j1zWR9BSAx/vMO+u57AEDZFB
	 FhfHuuEW/jhaO0EcWc1EwGaHfY7WocyTRSqTLQWcdpL4alCGHG+v1BN8lmSWgU0JZ0NNG
	 HiMDYRdpPOZ1/GYQJtV/J/s0vp9kK3IKxKp1azyeo2y+dAikadtR8SpBDasug4rdR1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7357F60A3812
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7357F60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso537315e9.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536620; x=1793141420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=XSWdVImlnN+o8KKG+n8FdqZKnJyuYzxymErOsSI8I+mbWj1WKZ6nzidsmjFU9HSrR+
         vqgDumIJaVanwgvDvCQZpDc1+Q+1Yu/ZQdO1TGAiSn7zcJ/EIXO9TapoqBvCQUeYh55v
         WMTSIU2/6hQWr/tKz6eoFUaAalDBOhpk+YSsWqwpACa/+ZoegBs50VCzkKidvsFNvIFA
         8b8xC9l3L0kISRpEfSfybZGw+SDyya9x5tRhhllwkNu3mXQxPtTTTCyYvUWq8HNKxR4k
         1BIjXTFJWfVyxgol7fAchZytRgSIxAlcYIjRkPsePysYOFssUU9c1tnMeQqsBVaXZh7F
         zevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536620; x=1793141420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=By4+NYVnPadZ17Eu0gByLg/lBT/yjR96DCd3UPQWmxLSTtl/2VSAjZhjGIkzvrM+No
         829AP933chU192Xwx2mjjQNtiloJJr0Zjc7TIFDMXLZiB+JxUwScsDFuVcBI2PQzoAga
         UQbcYDRD/tU8OBSd6vl2/vBGgZPO+gTlfQ89+04QB7pKA5NIoi0eFw2aHfzUMeu+aIb/
         Oh6fUr5f9BHzTpBNajZ+i69SlQRAee10jBNfNFqxb4dFWALhnb9qwB7c6N7Q3sMq7Rec
         ClvtD2JZ5hiQ/6OX6dQQN7bPgXCxKDTDwVa68LOMnHwQq4SplBeph/j/52xqZEItgdat
         7fmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9trr5uMpWCw8HHhyX7o1K63xbFWejpCm1lCH9k41Gvp0oLYzGChSed0tRna2nOt2MK9TXmqgcuO0c@vger.kernel.org
X-Gm-Message-State: AFq9FYKg7VN6Pcat5y6Y9XuZbuBZfpmPLb9fYs7ZC4I0Kc6Uo2OsN42j
	Urb+ruWFix+zWgcdb6e1vwkCwcpeViUUD2ZIZux/8UaekrnrCUy6AwqT
X-Gm-Gg: AYBFou1rKMbh5G29SZ8mwooglImndG7nncLpe/uNtCHCb3wgm5te+Ig7WAnvjgjwZuk
	RHnnT0AWMOJ0mQ2m3wDrlcGWBHpJtOLdnooYTlJ1dqvngoTpDHu4tA+DvSECm9ubty/RuGB8ydY
	p36CroMFuxamcvRuWCchEVkLRHv5a3NVr+LiabFDEBw82eBZRtWViDee98kg2uwTVsOv/gQyW1n
	Mjpomyssx8/VJ9CHNKvw0xami86p2X6xRh1CMUb/HGsjJEsB5hlHb3Mx6t0/bRYnaUwcqeHIV7T
	BhLkvgwJY22zfnDzvyW4y5TfaoxdUw/9daCPSnQ/7yywkUu94u6W9heYMRfyDhYxZvsFu/kDJV8
	LiemC0PcygbiUj37mH54p5IEkove1u3GhOzE9NykU9B4yKpJuKH8kRbnoIZYVwfkFIWxUHWDrWc
	ZObkDoUDgZl1siRa5TdtXV/dpwyY/VWKhz+8oBaAnHobdld8dIUIO34liEkGibNEtqJLN37VWxG
	CY6NsasI2WuvTOzwSIjTbdOyw==
X-Received: by 2002:a05:600c:3b01:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4a1fdb04f88mr2783945e9.13.1792536619814;
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
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
Subject: Re: [PATCH v5 10/13] drm/client: splash: take the background colour from the image source
Date: Wed, 21 Oct 2026 02:50:05 +0200
Message-Id: <20261021005006.2341200-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-11-maximpedraza@gmail.com> <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
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

Am 20.10.26 um 13:19 schrieb Thomas Zimmermann:
> Please see my earlier comment in module parameters.

I answered on patch 3: I would like to keep splash_color as an override
for one boot, for a bootloader that wants to show a boot state, with
the default from Kconfig or the device tree. If you still prefer none,
v6 takes the colour from the node or from Kconfig only.

Best regards,
Màxim
