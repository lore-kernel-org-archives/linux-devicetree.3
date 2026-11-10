Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307017;
	b=SfiYVIG5WmcBKu2ac/FFufZNffytB/BfW9rcGsL3Cs9IKoaG2mhJO1kT3JrKCg8Z2/yS
	 ToLDOEi1JQAuLDUVcxdBg2/ZjsSMNsT0ZjRx2MPvWIFbIOwfYRwJj1J/VopK4SSlwB56/
	 A7kqrkWp2fxyjafJne8btS2+WeJYir8UVTsD+3nYHB8LockZTh2UpG+OlVpRr1jMthAeD
	 NJZuQe5UjTLRrDKY3RBmaUSijxxBybRZ2G1sZd5HBhv4S9MdcphavfhxPzEcRn9h2A962
	 ZjLu/FeKyZn0NmU3RVUUzVh8EDe1E2Mj4m5QuNfo8RLdpwm6D5Pcxc0DpRKi7tq83PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LOElH1vxD2BF5QjJ4dSWC0zMCWPZ1/SGqr8lDSB91pU=;
	b=h+O99+XRkL+7N8MDwkmiSHpWlE1YThs2x7+7+pSQ+BRj/YHAmAenUVtxLOhZq1Jz1+oY
	 fNLZ7t/An+JqWnC4hRkYkzm7NZ9uTONjVr/VvJ4pXU5FuPFHqWaFW835hz4C9AM8CE8Wu
	 knqGUuu8KOUFSH7z/6GrM9IDasZ6vEcs7rdwapHDWhySIVu4axpgbtunwaqg69no4oWSu
	 0QY2cW90grHdKLHVR4Bnmc9J6g+isosW+m9qf0zvyv7Kqp7TdP9pnVubNDQ6/v2OvS3Cp
	 8vRM44a2coMME73o3BMPB5+77mbxMMB0b8D8kVUlAG/doflK8ofBdeuABVJROBj525Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J503BMjn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1020C606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1020C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J503BMjn
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so15137271fa.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794307015; cv=none;
        d=google.com; s=arc-20260327;
        b=OVnq8fBk3+iZlvV/T+JZwJUg3X6MNoK0Axp1a0gFv+w8Kv95NN0ZaiQCpxAmvQ32ae
         uUseqAqCy1+zNFt5lxfu8Oae551gVNuwecC6HmgOJ/gnbs5z3ZuLh/BPmJlgqYVcJpT3
         zYiT+fmq+CkV2JSyZScaXUOpqcG6jF8cZsro3rBPm6QM1P+wzhbsJFFdTYiWFnbDl9HY
         saH6fxSKDLmI+Fs8zsHBPrcOhWYCMj1GFZyepOV6L9jEHUHsJ2Vxf5yy3JYbVwyoG/KZ
         5nWng6jS4ORD8fmxU2aDohw+BGVu4kzFkT1SOROEzLfpcNrnXa5BklFAo6RHTttY1YAW
         eqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LOElH1vxD2BF5QjJ4dSWC0zMCWPZ1/SGqr8lDSB91pU=;
        fh=UmnuYRNjocVab7PpFyOeZjr94W23RKmvgsRE0+sHWmI=;
        b=FfokxQuEuUL93awB9qOOzwgPWdcLrnLAwTcbsQVy3bLmXNLjST6zh/7rJoCwri0CKR
         Bd/30EQDO3KesC4WIGFbG86+U/Zb5OcXo3FOsDUMHeujQXc8kHgd0ihAjCo1URJDNUeV
         6bgYSAcJaORrnW80FAZIXm6pY5V43VBduXJMxXSZeZx/1gDeetT3Ae2bpaI8EmWXyxMk
         jmDePX4Ef3M+sqkef/wtVCyO487LBet/fjfBfP2TpBuV8nyAtNouaVL99awRHQ0p3WPA
         Y4bn41xE4cKRWGpJIopbURJxSdClPcoQkVFE9LiT95hlsKFDxSspq6Wo19zCn4H9vqht
         7mfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307015; x=1794911815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOElH1vxD2BF5QjJ4dSWC0zMCWPZ1/SGqr8lDSB91pU=;
        b=J503BMjnaaTggjFgc1Y7SCm6wsh7qUldbVRgkaLJ1xleeJ7jxprTqE3gkXFoElz9SX
         xZF5uaSzh7ZZOdFwqMFdAHkUfYjPKsZCI15iydMd3nQ373fLjCgEbIh/Zg2876eEftEc
         hlMSXum/NZZbtiysKeO4D+tYs1hbA8e56EqcvPS/UDGdOwnMknyqg2hy5Vy8bp1uIjvd
         /UoMltf2T/4xD01cihAPn/s2foFZ25U3iurhWADk93onEd7pc2dHNIGVPTXKiit+ReHQ
         JsIG02HPsl2Z/JWZvG+/g2HjikAwuDmsOxOeyCiIOy23gUly/ErGhSLtoUPmMoPUbW2i
         vgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307015; x=1794911815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LOElH1vxD2BF5QjJ4dSWC0zMCWPZ1/SGqr8lDSB91pU=;
        b=iSbaxfY2MGeA0M5S/xP3cfL3xRVgURA4KN9ah1fxTI4YMAZaoIjZJFyxgHiqDq3HQe
         hXC1N62ga0OohamVHjW17iZqWf7JdtVxT0hexpAvNkf108ni2k1mbox465/+8H6by38s
         WQxUDyxgCcpC3M8aVVCwFEc3X6DomhSVPmk5W25+1VY0Q9FCPEx/RFp0PHfO7wZqnX7e
         RNpJGkBbRF8nI0hMQ8UE98ABNUdmMQuNmf3WbX5y9YSQtgEqGejQM0DMy5cQyCuN5EMe
         NeLiM0wX0E59V3rt0jlif5B05TKaxikIg5ffH0aGLA13jfzmLE7JMXyXtkkCh7uaSrWG
         fhbw==
X-Forwarded-Encrypted: i=1; AL+hErGpe7kxNULj+8gfYZY750pFu81Gp2iNrhLE1+DcMV5xlbWpzITaXRY/kjPlLS8tHL9rWNhLLXIB6z6Y@vger.kernel.org
X-Gm-Message-State: APuU4Z/aCHt/bWAxzTiPzJo2IJE3ATSOrXirhGPFLOns/8sHv+YeYuTW
	tfEC/eHAarcsuXNKhcXW9rQSJY+VpHykUKV54UJyFAiysAgT4177hmRvRTIFkBJCy2M3TUJGBW9
	i75p66d/GAsWMkckwqNmo7K6eXtfaTGg=
X-Gm-Gg: AYBFou3OA72tTew3hq2BVVlpa1i2kVlrMrgUZNQlZwECO6/922HS3EeqhN1njG/IWfE
	o4D4VZ3Is/FQpvMpKUqH1GOScGv9MKw4zzi0wQqgheVl3B2/QklrrGJoTU8qM8y7nZnaZcPK6ej
	oIjGjx+NZiG+XDcn/I/2T9vYNoaYAMxguChCym2bhOSQ1ETkiNn2y6jHJpz1ojVFZJqn9YXKp3x
	pQx4/YX64OuYlSpkrbusPp/7dqOocHKxbhI+0+VaMHqeyqLRjIrMweI4C5iq/dh2KATGh9t/g5S
	A4eKSz3Ispk1Y/A2fI7owJp5d1/d02xMSfWpNjkJcEflDGIdFCiBVxD40NGqSnpw45SW0SkeCH5
	KfCV4ENmPZ3Begd8dKIuwJ6CLpIYzNLza9oREg6Di94YU0+NyPbxVggX9kMNHZ7VorX59cpELH1
	NbnGABWbD8WVTCrUkVIx1H+r+qEbnDn3ZXoXfhbjgTayU2fS8sN81qgI0z+INAsM/13xxJxC63l
	dfw8E1skkDiu5QCf06+cldcbqN+i2hIskz2
X-Received: by 2002:a05:6512:1090:b0:5bf:c5e8:7451 with SMTP id
 2adb3069b0e04-5c156ef6a9amr665923e87.65.1794307014867; Tue, 10 Nov 2026
 02:36:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011154556.155831-1-kieweg.leander@gmail.com>
In-Reply-To: <20261011154556.155831-1-kieweg.leander@gmail.com>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Tue, 10 Nov 2026 11:36:42 +0100
X-Gm-Features: AclHuK8uvc2i2P_Jt29Mbu3rg5cUM-90uDWt_jYSqLTDdxYVxLIh3qQpLucOIBo
Message-ID: <CAMwcS0i-RQgWGHTUTVBwj8_is94siqwLg4mjgbN6qAhvosRb5w@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

a gentle ping on v6 of the GlandaGPU series. Is there anything else I
should change before it can be merged?

Best regards,
Leander

Am So., 11. Okt. 2026 um 17:46 Uhr schrieb Leander Kieweg
<kieweg.leander@gmail.com>:
>
> This is v6 of the GlandaGPU DRM driver series [1][2][3][4][5]. It
> addresses review feedback from Thomas Zimmermann on v5.
>
> GlandaGPU is a small VHDL soft-IP 2D display controller, currently
> targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
> been tested against a QEMU digital twin and on real hardware.
>
> Hardware/VHDL:   https://github.com/stiangglanda/GlandaGPU
> QEMU fork:       https://github.com/stiangglanda/qemu-glandagpu
> Userspace tests: https://github.com/stiangglanda/GlandaGPU-userspace-tests
>
> Changes since v5:
>
> driver core:
> - Replace the custom glanda_crtc_atomic_flush() with
>   drm_crtc_vblank_atomic_flush() (Thomas Zimmermann).
>
> On the QEMU device ID: it's currently a placeholder from the
> experimental range, since I haven't submitted the QEMU patch to get
> an official one yet. Is that fine to merge as is, with a follow-up
> kernel patch once the official ID is assigned?
>
> [1] v1: https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
> [2] v2: https://lore.kernel.org/dri-devel/20260730173643.256052-1-kieweg.leander@gmail.com/T/#t
> [3] v3: https://lore.kernel.org/dri-devel/20260824195418.17707-1-kieweg.leander@gmail.com/T/#t
> [4] v4: https://lore.kernel.org/dri-devel/20260913205007.118552-1-kieweg.leander@gmail.com/T/#t
> [5] v5: https://lore.kernel.org/dri-devel/20260920193944.110983-1-kieweg.leander@gmail.com/T/#t
>
> Leander Kieweg (2):
>   dt-bindings: display: Add GlandaGPU binding
>   drm/glanda: Add initial DRM driver for GlandaGPU
>
>  .../bindings/display/kieweg,gpu.yaml          |  56 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/tiny/Kconfig                  |  11 +
>  drivers/gpu/drm/tiny/Makefile                 |   1 +
>  drivers/gpu/drm/tiny/glandagpu.c              | 634 ++++++++++++++++++
>  6 files changed, 710 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
>  create mode 100644 drivers/gpu/drm/tiny/glandagpu.c
>
> --
> 2.43.0
>
