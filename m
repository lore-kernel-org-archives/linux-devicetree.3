Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D7043DA4C
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926667; cv=none; b=pblZiHZUs9i0w86IQ8DSM3Ipw4hIXpOdFqPysSaHio1R2Ero3W6xvJ9RB8tIIhaFWj0BWJUEbqBb9qiKBn6FgKoFB0oeA1a3OKyl6j0gk2lLOfC4VO6u3FDqTD7yY4c5zRKjwer0DN9TYIRXCGk9dwnEqfDQoQyM7f06B+ytGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926667; c=relaxed/simple;
	bh=sYAyqQ6f9bRmVhsxj1veuLunk3nA6ckSjNhuKUxpq88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D6j38sXQMrn/8e2r76UErRYuBWrMd4ui0csCH27AVu3zxdWHk20/IYg19qvRDIVKgDHMx2aEAR+R1XKbqKvlal3ZYZPkkvoZxRb5Q0ExFWT1LCU6ncbPDnZ8lCrtywm3wpeM3tH9h/0Zmq7r/Ag9fzXe7OZyVW57Phu7slSrl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fr75uSse; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeYoPVhP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fr75uSse";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeYoPVhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790926664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
	b=Fr75uSseE78QEevNjDaCJCDHn6m5AQ1oX5zD4I5MD8TTWR+GpRdxsjzlSDyLEs90THi7oe
	JKbd+kn5oX4JqwQKujYzpGFd5IBiHczHxAHDLRRdGazRH2nIlN62zlcqF0XWjMsSM6+1rS
	mQz8/zpuvNMftQbdPo++SpBtd69m4HY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-sHup7mD1OeCClIJXzemE-Q-1; Fri, 02 Oct 2026 03:37:40 -0400
X-MC-Unique: sHup7mD1OeCClIJXzemE-Q-1
X-Mimecast-MFC-AGG-ID: sHup7mD1OeCClIJXzemE-Q_1790926660
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so27696955e9.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790926659; x=1791531459; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
        b=ZeYoPVhPeBCYI4tJMUHvSWBzHL0JWHBXuNqDLibDCcGpPKpg5NROpaBTSMW2aFKpPD
         VyDJt8AapoKubq7MHS7dqoQtIK/S63mb1iOI7J9my9KagNLCVPGJ9XSlENnUADsA9VLB
         ivMtSeQu5WY0cJYks46WVRAnAHSAR/3d5wC0YssIgl53Je5G0e+aJW20mAt6NRUwvnZJ
         +WntoqaX+z6IJ2zJFYXq0pe2C1/TCnHeUQjVWFEDLfz1Mdqkrl6hUcIwH49nkiyOO28J
         8lnKYe1WRTA06/znEOoGrvxs/vKv9DqYJrAyjDIof5stnVC3QMU7aVUynEMf//T/B7Rl
         ia1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926659; x=1791531459;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
        b=2hscLHfV5ydSVlxu4eyrqNKvTzSOvwNZAaHw1uCMmW1h3wL12YerkITygnxMuXeqaN
         wArd/dy6hNhW7ujzwJ2yJt6MyXqS2Ig0yWDsvGFiluPkH6/7NDnWTSb5GU9gQVrw8Jvw
         q7yXBmWGBegphqVEW8K3GUMlzADceqC5aNdAUmIZ6eOPjUgjDVmYYhKv6Vj+yI5tMt0Q
         M4iHxgKdd/9KEVREYTfMshJiP7azFw6QwoLyWUo5tPpNsYAfYQ0Bvg6jHRxBbF01bcpD
         Y9hxHJdexJfnirofZNj4ltZhZAG++TWPIVO7Rtnx2RbvWtWRXq00zUpuR8KYA+4DrBU6
         ddSg==
X-Forwarded-Encrypted: i=1; AKwUvBzOU/NZElusXMtaXFD/ocEX5MR2P4QMjbbMjATC3gJHJ7cVWev48/EtlVWdv4fNXwWcvu7za7CMBdLU@vger.kernel.org
X-Gm-Message-State: AFuF++nrAeiBVBpq/jDQa7Pzb3tQemM+53NirT9qiMaxQjWPwwi37aih
	VreZbt3CeYeU2rggB+KWNxQ+zLouQ7DnMXCiH21alFLwkm1kB+WucvQQlnpUnIAZawnEa8Nw7ut
	8/2rK1pVYy+mAwkSa1veDcwmth4SoliUS2Kv38Ow9pTeRTtG5ktLRlmektJeodX8=
X-Gm-Gg: AYBFou0IwAy/830ERSP00F4bzT+O37YnQYSQ1iwsSM/emsme5wbEoRvkf8rS3p2yJ9l
	1wHl2ajK13+dTQaCPj07tTyqPy7zyQO1N/FjsyIOVfVUt9g07yCOgdzBja0CqyHuPotI/ps8TdI
	lcPLf5cIMZ8YwTBNIWJWTyCY27l6oKjkhVXFNkjDMwDpBOD5Y5wzuDtnuofT5em6JQuSLpY/SvS
	8gS8LtD3t4ZWQa2Il3GvvPZ0c7YYpRvInISfZOTfUsJ0fUEr3L9OxgEh8Y78JupRJ5bb7Y8giA6
	EutVVHX4WB68M9hj++7lMPKCxZ49dxDyNj+hXF8r5mGODgDTXcEsL6g0AOamwIjOnW3iqRVdWAh
	cYGcRMrIxj0LUEmF1lJ/WDaS/KrJChCj29mi+XP7BsGHpkuuK3UDn2nZJGdjOz1C3+A==
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34251295e9.25.1790926659507;
        Fri, 02 Oct 2026 00:37:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34250535e9.25.1790926658971;
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm63581875e9.0.2026.10.02.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 02 Oct 2026 09:37:37 +0200
Message-ID: <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Neil Armstrong <neil.armstrong@linaro.org> writes:

Hello Neil,

> On 10/1/26 08:50, Maxime Ripard wrote:

[...]

>>>
>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>> really cool.
>> 
>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>> you can have a built-in panel driver that works without user-space
>> intervention. So this is not a topic of discussion anymore.
>
> It will still have users-space dependency, meaning the BPF files will need to
> exist in the fs when drivers probes.
>

It doesn't have to AFAIU. The BPF programs could be built into the kernel
image, just like firmware binaries could be built-in as well.

> Neil
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

