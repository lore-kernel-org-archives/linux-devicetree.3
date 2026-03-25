Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5013596F8
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444820; cv=none; b=BKjfpWIp9YJRKE+mu5tXJAI8olu4gAi4MAWK8ohmqahL/ShnLKlP6kXSVaCF259xjkjzDVdPaPJL/ZXMsgtZKc7DPeSifzKDx6tEYuvpvq5EAFE1lzx3zbPixkaemBQleySFzqiaPYRlCBRbRdm2OEX+gKM3svL/prBAAkDgdyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444820; c=relaxed/simple;
	bh=8OKtuZUHYMcCm3anyLFXklzdxMpproKBUw/yLg5vFyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wm5bW7len64/DohB4u5815cZYT+lDafpf805YYkWU8+Jf8n6Wjs73d27kX0etTyNCIZcCYrRUFVbxf/4eGHcWeleVypqIwYZXEZgMoWFrdQvFV3pfKgi2LpqIteUV3TlRiVX/jDoP0w7MMlchrP/xP1OazcL/Y4WLQx4CRYqUto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1SmFz9m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmMc829p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1SmFz9m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmMc829p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774444818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
	b=g1SmFz9mPgaXM/zctv4gHlp6KJIrpeM2NU3NpuIOegAjVmZruwf/Dj07by702796rj8oXt
	Ght9uOhg8Y6CgmexVsRoX5g4guoGVRRpdOB1DXJzxx+zbNetylhQ26yvRTauAgh38qguIZ
	EiiPKajjxjG2v7hoK5F/srmy0d7tikQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-CILklljWODSO_oRIgdHj2w-1; Wed, 25 Mar 2026 09:20:17 -0400
X-MC-Unique: CILklljWODSO_oRIgdHj2w-1
X-Mimecast-MFC-AGG-ID: CILklljWODSO_oRIgdHj2w_1774444816
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b8cb800f5so678999f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774444816; x=1775049616; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
        b=JmMc829pnBiTz8NUjDuEmMSTiaZa1m+/cs8WeJ315xfylCAA2ZEUhFUqS/FPrZN7Pb
         oNTknJyHqaFjs/XlKEX6t+foc9XLt1Uxc9fUNLZLsZKieBKefhBP3f6RO02cBIUnim1j
         Dy6jN0Q9JberXcojueS644EDnds9IpXlMVEAiVC2EO/d2NJ67eW/JGYQNXDPMvWwLSE0
         VdUYg5gzCnWl4NyfuWC8q+jAajtPN6AEjEV+m7nfRwJ66hcNY5Sgpf0WE5NhOlu2adFa
         z/JsTjaZun1iPZObBcLXudcghnjTy2pGD1fc8hcH/+o0PaOWQCa4N1xzn+Rm2XqeW9hW
         z0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444816; x=1775049616;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
        b=YPvePx2ZtxIxXUQmxzIL3v1NuIMzfdiy5aGFC/Mk2vNrU7kX464gLT3U1G76eyUVgg
         MW7jZ6cZaYrrxFxpd1r2VM2lBDUH3AiYo3WmsmF2bBN0wfwaOiw74MTHBIikHLmwdvje
         +KuJ0/QMvQUT+7R8/k/ZgnR9tHZiodILmaH6hbgtd1hQ7UtJm0hcFhMn3WRmIJ4bcWqX
         TgcIewYX0ThnYKtTeEwHl1YVbKzII/mUMpLTCq7D8sjsBS6UOcwOIvGaowPeaqWZmfdU
         jPxDuc43yAA9jCTEq+t3GOhJ90A45k/u919iMIXV8OLKYPf/djxiUxtt/krLyug0aK/I
         mYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxxQFXXwfPCLCnm+3dSnT1Cqf/mEvVIE23sBSCnHvUBd5CtefkE1NB+sf9We+IrOOpa8KWcbN7aqUp@vger.kernel.org
X-Gm-Message-State: AOJu0YywL0/N7rD9q0uWi8Yc6bwsIP0X2JBD3nfZfZYW+kGF0oPMgBQP
	hMpbSGge9hazgeheUE7x9gYKisPRmeADN3LIXA7Gpl96vX7ktp+jdt2tXXuJICjq9leoRSVwwL+
	5SxCRu6cp5StxOYySMCgBiKOdTOlmCxFuSGeZ+0FmHutZOq2fIIDh1ZTtjROBp38=
X-Gm-Gg: ATEYQzxBRVw1tyUBQPZ1HzLc4TFLod5MOlyU1y4w5AsGGfdjA/1m6zdLAgnht/jw8kG
	Yp6JaH+B4/B/fJgo/6AHIiIX0O0XG5cTDthrA4AIsgRe4QFO/pUw4AFXYlj9PaEjhou1d4JQwqS
	iJPNgCI5fxY1ZattoA7/MQkdqIdKAcmT4cTHoRfNEjanmvO2+WJD5wHHjrReyMnuB18l2AUtryL
	1ieLEv09aXUDPa6NZdGrEeKD6Dql3p87SJEa4FKcDolMMCLt6DlFlXpZaej65sLnXTz43R2QJ1v
	hmz/zi/rb1vxmjXcrD++MRkW467xrssjfEkCJtoXZO4RN4/0QoBH9+XZ2tY6uTGyNhNctXlLNF3
	5iPsAOvBtBEJJqy7ytt9zT2WKNpQ3Y5Fv8Zndiv0SB4gzZ8N+GADgiWD1y2NjxV3GXcmTSu93VZ
	q3EZ8q
X-Received: by 2002:a05:6000:2dc6:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b889a872bmr5150956f8f.17.1774444815991;
        Wed, 25 Mar 2026 06:20:15 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc6:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b889a872bmr5150862f8f.17.1774444815376;
        Wed, 25 Mar 2026 06:20:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8567b2e2sm11278629f8f.33.2026.03.25.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:20:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
In-Reply-To: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
Date: Wed, 25 Mar 2026 14:20:13 +0100
Message-ID: <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yixun Lan <dlan@kernel.org> writes:

> Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> which use same I2C IP as K1, so make it fallback to K1 compatible.
>

If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
used in the k3.dtsi instead? My understanding is that this is the meaning
of compatible, and there's no need to add another compatible string for k3.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

