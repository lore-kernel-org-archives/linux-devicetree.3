Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28791470106
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039006; cv=none; b=f8K7RugebDUHbwoJbu/3T4jmrnnvx2ZAhN662Dl/H3yGKPDH3D4ztpzIF/TlzIlVz+my2G0Fb5swGaPNhPA4R0LpUBn1xOryyY32i7hNP22QgNGzmLZo3T0w6hvdtQNq0Oly+1/To13bUhhVkKeHTrH338RK2Pch7LXaZ45eJxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039006; c=relaxed/simple;
	bh=3mKwbfn4YjIE+VWDPlC8zmPXXQTCvKwQ1pECjxkRi78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dEM1NWXkgZr8pLN45M58CraW5gQMc8Eh4Xu9uaMTeGthU5GPhkwB/uj9r2b3bDHKcE7KJfnZGoOo8Kvw0oX9yx9bgQsC+H3ij26XiCwLON//UNFw4IJHrKw3uswJ9N8OqLWKrtrAP5cukp7C6Nhb3OPeaGEQwfPPPsv8op6eFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ux/PbN1a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9F54sqt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ux/PbN1a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9F54sqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mtIFV5PhR8YaKeQBUyczM0xpE62wYImfp+kBJSJQh8=;
	b=Ux/PbN1aDtKF95DpY0GE1b3wdjEfzSg//LiQ++MYX3qoEJ/x4ZNBAXyNRq+Iwu5WIlfaA2
	RNercpMKMFMjtmGudRdrCMm9ahgYulJjvLLIuB7VOkluMjS2Eq0ua9gFTfOUmYytsQIWoP
	ns/r2pdPctiXQACqZN9jUx+y3oz1ST0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-RH4ajMSCPBm1EZY0EJ1GVw-1; Thu, 10 Sep 2026 07:16:41 -0400
X-MC-Unique: RH4ajMSCPBm1EZY0EJ1GVw-1
X-Mimecast-MFC-AGG-ID: RH4ajMSCPBm1EZY0EJ1GVw_1789039001
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843227cfcfso414977f8f.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039000; x=1789643800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mtIFV5PhR8YaKeQBUyczM0xpE62wYImfp+kBJSJQh8=;
        b=V9F54sqt6wdi2nQF1JHpkEcq0sWEY85L64brFoLOEGOxS+p4b8zSJ3xnSDVbHSTDTr
         ovzTd6q1pIQBhWfcQjqH2U5SBpXPVeuYQTSbfFz/13XZrGchPm48GvEj1DifG7Re8Ohq
         +qTeE8d+NgS4uGdzXCpL9GIfrTipmd6lZyl46YGNUXN+N+RGzdmYJu991NWwRHO1fKej
         ncuzHm9/DyTSpQIdfZQ7K3QC+0Y5w9TZq6EEs0TyeIKaa6rTonPpICAtZ7a54uHfQA+R
         dMtcUPYAJhc0WJa4LYhXVLl2SITUgZR3YamXsHZ4+zfQOQdaH/EVggY4v/bLxQsP1Bbz
         4CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039000; x=1789643800;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mtIFV5PhR8YaKeQBUyczM0xpE62wYImfp+kBJSJQh8=;
        b=Y0AL5+BQPzgVil8D5pEgLoRXdbGp5QUE47kcNuf8HyMTDNz+d2SU3cLir1OjTGhAvX
         g6aebcDT6eNsnw6NOS9zcxxJlS1ZEUfYltleJpRWrbJG7LQy6yqzQYGK5zWrctPCewJO
         QshOqwgtQ4YW5m36Ho9xuUusAx6y+x5BlRiYHB3jRkt7AMoADYIJ3lZ3Dya3O1QRDuGQ
         vA2o3fUk85Bb0xf8DRH8WfXHzJP8YLCGfNQA1vy9KKGoBGSWcXUr3159hrUw6ix/4l/x
         IGh2/mbmeF14xgcCET5QXS+LVpSdWliGf5vngHMkunca8JeGQvkHje41fJirs1KvaFeK
         ARaA==
X-Forwarded-Encrypted: i=1; AKwUvBwfrpU1SEFMRm8p+Bao2TRucF7W53/vNzqH2b5Vx40TruSvA47e4S2sWsms10x+y53pHxffhS8f15pc@vger.kernel.org
X-Gm-Message-State: AFuF++k8eCXugme069ZlREqV+ZMVCL39gEyeiE55xzN+NYVAA5fXnUNZ
	PgeZi1qhDeHX+gNqpHeVT+V+cUzynYTW693nEd+rOXh7NuJhEAwio5QItsjZqVnILVEt2FjPdOW
	F7YKA7bGz3DtGdO4EdQLc9Z2w+MeXLlFeEt8SfOzA+w5Q4wTy4eYyovniX9LQiIHSgFafBsY=
X-Gm-Gg: AYBFou3NxZyLXNRqkgtBfC0GUa53ETYyOuYDvdmDoSaveAb3Sz4QuCzkQ7yyS2ZD8u8
	D6g308Tptd8n4H3lTTvYLzTCkAQQBBj/LZxIp0id975D6ld4Jq+ZmUAo6WghOOrprG6Xz9qKAMF
	PM8qcbMf3JgdBUeqOrBijr5P3+pjTZzi7h5xPwxMQ3YlGpCy/OHRNvOzHD6Iu0qgTwqAb1L5GH0
	C5ubiG5iTMREIQ5gHfOQVpoNkscjnruA+79yUG/FW9IdJJkG22rGCox68B3RJVOr1jCyIrY13tP
	1bXq3BZkfq7gTRXW03rQ5/ixDaY3V8p6sr8WP66Qw8DcGgUJ09tb+/DU8WgbXa+/tiKAv3XBk+k
	2DS1HlSTScDQRm/uMGRcPw0BKtFnnqGn3GV0RCQb2+R3oNo5foz3ONlCGiA==
X-Received: by 2002:a05:6000:1801:b0:485:8226:c698 with SMTP id ffacd0b85a97d-486e0f8565fmr3043547f8f.23.1789039000672;
        Thu, 10 Sep 2026 04:16:40 -0700 (PDT)
X-Received: by 2002:a05:6000:1801:b0:485:8226:c698 with SMTP id ffacd0b85a97d-486e0f8565fmr3043528f8f.23.1789039000339;
        Thu, 10 Sep 2026 04:16:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm34310512f8f.0.2026.09.10.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:16:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: sashiko-reviews@lists.linux.dev, Amit Barzilai <amit.barzilai22@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260823112814.896AE1F000E9@smtp.kernel.org>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
 <20260823112814.896AE1F000E9@smtp.kernel.org>
Date: Thu, 10 Sep 2026 13:16:38 +0200
Message-ID: <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - solomon,ssd1351
>
> [Severity: Low]
> Should this properties block also declare default values for solomon,width
> and solomon,height?
>
> Other bindings that include solomon,ssd-common.yaml, such as
> solomon,ssd133x.yaml, establish default geometry values for their specific
> compatible strings in this block. Without these default values, device tr=
ees
> that omit the width and height properties will lack a schema-defined defa=
ult
> geometry.
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959.17=
029-1-amit.barzilai22@gmail.com?part=3D1
>

I think Sashiko is correct here. Let's include the default values in the
DT binding schema to be consistent to what is done in the other bindings.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

