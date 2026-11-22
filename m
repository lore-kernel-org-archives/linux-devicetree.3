Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333983;
	b=DXZCdPDDTQpMXJZNqHlM9WK46N5WCm+m/E/t6X3TazsjUBTbWaZ7UvMa0rr9NAYSzcRt
	 Y9e2EdXvv9ZChf7B2nf72tc0xa9RKSpxpZA5fgUoQ/pf3MYMPJbtoAp+n0R3Vv8dwUYl2
	 ImZUC/COvifx24LQc+qZqqlbdgmapjoppRzNlKYRL9gPcVKCJx4EeG0QIr+cmbiuDbY3g
	 /5Xvh/TczamiHxZIoZFsmZqZncb9DwxQg7pAvaFdpzWIWkT1DlUaEr2C8bEUSnI/fIy+j
	 wxlipnxwuW+KSCOt8tueaepbJBetX0PKacZSjKrjoQW/ddB3LAgyZ2DG2qQ//DPCxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
	b=sPprvoknVYtpQnsHg+jLrbv0a7WKqcz0KaiPDmqsyiNLZhKwZpFs0fyiiWg8pFmjlWix
	 GW4jqClozw9jy2eRQOjl4K/gheCeq/oynQn9W1AurOSHgLDF5ccAciRdZXOK05h4h0EMp
	 s5OZdq36kRXoudvu+6ECvjqIWAnTlOSTqX7nR8ndQb0mMOu4jTOLjfp6ddnBgYcXLeFDW
	 w9pnXLNUl70Ui7lNuipx4bXbYdHVjbg0UmEEQBz/Zu7N+I9zAlMIjnfL19R/IgJcBCkC9
	 A0vr+IRHJ3/Ym1h1dkQz8UKMt6abtG6GTt0OVZeUS8oAlrIUw+hSiNSDTibAnxeAcLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+PoNCJ0;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79530606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79530606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+PoNCJ0
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3311029a12.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333982; x=1795938782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
        b=h+PoNCJ0JWrepuHH8XR98IvmKBVK3jVik8a77/KXxcdI+xho07fAPKtyBE92aKj9tn
         GWDIeT5DmnM1y4lTMxHD+riQmVoLL91OSnvno9BuwNERToIHSP9ucObNFPkySX4gtyWX
         540MPWlRqpcsRxF1qwudcehjnTwQgvgqaRkrUHUvOSSMzBIEJ9rOTQW31zP7ES6QEZo0
         gidNU5nhtmKgVnJViP2550SwqgkxpCkiW4lkxy40aAyfjyv1G2wiXJmaOk23ixEcWesd
         gbcKP1zqZNoNIpp2MBP8o8kuvJXkcEtlpdjR4cxUcXjmWTY0O7R4zYzVFROqp56VcklG
         elPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333982; x=1795938782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
        b=IX1RWLzSRG2l44fXPs+2uqMVAdifZdhyZd1ht370w0bdiVddSOypOR5FHgRfKV1ILu
         YEDL+XJ0L2O84FquNjuuXF3x/p85rYrQjAl456PaKI0bMRsQB7rfpKVzYyicDAEzTyS2
         iUQsBKgR/cnpYnYAKCLCkR3yDAwShX+86lRQ3hpEBT3qlKHpUuF9Is6fe28odN5/O+JL
         lqdXw+q2npmKWkSJ1OIedPOBERS4jU+dgNKtBUzcBZVnBQWz9ocMpZfAGhCobvecQu5+
         Jt1XORClcE/f822JKa+tlJlRjPQ53DqIZQQsjGoa+NamDGKO/n7ruNRYzGkOXEWCL0Kk
         brow==
X-Forwarded-Encrypted: i=1; AL+hErGxKD46OBpEeLWg5MbiYnxe9XciozIZ/8Kad7oozQHl9Apc/Ia5IIOW8cGYTjiw0utVq6x0/TQNJJPO@vger.kernel.org
X-Gm-Message-State: APuU4Z+lJPnleuyQr/IzdZa2an23y0jP6Kl0UfQ63P6DD0KgnvKjWXyW
	qi/ugTwd58JVEeWVqj2IUy8WF2QQ65Uy+2jo5RcKkLK3vQgxWZ1AuOzo
X-Gm-Gg: AZFdTZeo6wdqP+eYriz2pZUYjthXY+mZRY02gvBfexvLZJ/JO6cdDo3wqPcxtDaC/W1
	rE1ui6FIjmo6usgT2uwXt83R3Ai2kt2NMr2BWfRVUa+17QSKAyldDLCtpTWY6jKVNzfiRhWtAa7
	mDNtSXM4ELqBfKnBRqkr3no9XY25uW4/FGc2c2AYjgIYmggOpFtKAmqMHLW0t5pWpAcm/zszFIL
	+n/Gi6y7ls73vXSWdsuJhED7Zx8hKix3uln9WAAo5w0OYbaEEbQM80ZvNT0IN5/vEN5irO8fSgH
	i8GJVWP5MLsgGYB0r5jNhc4tA97kGRqGKfL0ey6hPfnB5AZ0KYV4u1b0yyKCNUT/8apY11lf75E
	+Loz0DGhNsFdsLgDpI4t/2/LwhzoxlNhqYUqjujgF/thKWcLEAxQNmblrQwKKzNwdTS6SMN7pVQ
	xbOUgJ+BvongvOZNtK+KIrYMfjEiLDC2r85KHEvTDucOYRHzFRTteiPM4XjUeFRepYlnvuRY46a
	UI4+zgHzoU0+9UlBaS1e/tHKcTp/ennX5+5N0unAro7fFMk7vSp2ktXPhrV+MfifhCqqMnnEMFr
	RpcAi8WCMYVCcc+RSAGneTPWOEE=
X-Received: by 2002:a05:6402:1941:b0:6ba:7be9:ad85 with SMTP id 4fb4d7f45d1cf-6ba7be9aff6mr1735125a12.29.1795333981628;
        Sat, 21 Nov 2026 23:53:01 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm3668837a12.5.2026.11.21.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:53:01 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Sun, 22 Nov 2026 10:52:58 +0300
Message-ID: <20261122075258.2919999-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
References: <20261117173319.1852638-1-tadilhusrev@gmail.com> <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
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

On Wed, Nov 18, 2026 at 03:53:23PM +0000, Michael McAllister wrote:
> I've been working on the Moto G10, which uses a DJN NT36525B panel. I
> have a local driver, but it'd be good to share yours where possible.
>
> My panel is 720x1600 with four DSI lanes, a different init/reset
> sequence, and DCS backlight control. Would you be happy with follow-up
> patches adding panel-specific configuration and G10 support on top of
> your series? I can prepare and test those.

Hi Michael,

Sorry for the slow reply. I said in the v4 cover letter that I'd answer
you separately, and then didn't.

Yes, very happy to share the driver. Your panel is also relevant to
Krzysztof's review of the v4 binding: he asked for the compatible to
name the actual panel maker (ours is a CSOT panel), and whether this
belongs in an existing Novatek binding. With two panels on the same
controller, I'd rather structure v5 around per-panel data from the
start: mode, lane count, init and reset sequence, and backlight source
(external or DCS). The XCover5 CSOT panel would be the first entry, so
the G10 can come in as a second one without reworking the core.

If you can share your mode and init sequence, or a WIP branch, I'll
check the per-panel struct against it before sending v5 and Cc you on
it, so your G10 patch can go on top. v5 won't go out before Nov 27.

Thanks,
Adil
