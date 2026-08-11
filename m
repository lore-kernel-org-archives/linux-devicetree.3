Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C944838E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457946; cv=none; b=s9p/6YQ20C0ZiV34BkIotBYtrtNkx+0LUi2xmiK2maZoD4k4CUo7mlxCY6OPUJeldx/J7mUuWPUKqyS5GEluEMwxZ/36FvzC7p2JkuZDMJw69mPKGHTF5qsGjkjBZr120R5AmrRfPVtNuEUaG400Ih6r+agEpYD6argKj0AYBZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457946; c=relaxed/simple;
	bh=EU2mOJRDMryXAF2GipiHgUijQAcU3CIfjX/H/psne5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jH1FDKHSpU93JaBu7oNdlSfg2hHm3WjGSaIcmeOKVImHxPUANQKy2VgiSFAcs5IcRVAQ3Um1C+qLYa6l/+v7JDZdczf5Z0Ug9HbdTarkqvL0Eq6ujfsfLMvlTnmt0jSdtLMK3G7g3jeP1S22M9GRd5PwT69522Ju+B8J9tprkHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ApkliKWB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHk1IVfM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ApkliKWB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHk1IVfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786457943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d1HU6LBDnWtUkFmucBW5pIeZXLIpgzR08eamvaDcYUA=;
	b=ApkliKWBX+EY71+pK9Q5Gfx4DOHnMUqANIke4Zd1+No97U7q5RlzgV5Lj/v/zH15+GlVJ3
	fcm7jaUJRwiOppz9gVHXX/gKuapHdQzaBdOwTejvcR9eZ8WcOryLynaaIE9o1OcvzBkIpU
	bt/inwonVEfN0+y+YCqw14/5ZBxLm0U=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-9XGQg1WYMXOPNw2FjTM4RQ-1; Tue, 11 Aug 2026 10:18:57 -0400
X-MC-Unique: 9XGQg1WYMXOPNw2FjTM4RQ-1
X-Mimecast-MFC-AGG-ID: 9XGQg1WYMXOPNw2FjTM4RQ_1786457936
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5131158a91.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786457936; x=1787062736; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1HU6LBDnWtUkFmucBW5pIeZXLIpgzR08eamvaDcYUA=;
        b=bHk1IVfMfhFVNY/vlvSSKCOVrebcp5ovP4l0Dg1GiVhXoB6hzTyXxVBR+pLKQ8lxqU
         O4r14Z+zW9ecFo9XKdFF3h6+mPuzSTcpFuM1JICOAhrzoh3ADZ7a+ZPRntVMujf+57wg
         5bJUKACm99oQpVUak0x+MsOQx11ZjJdIqYbQNhlgvEh3t0WsJElDoT/3ILOZDfYjJnVJ
         rC2vFRKx4lx8lGP55oZD7U3hzhKtq0RhUcGoJKZx5oHpBqaGc6GDSllNUUicYQ5Qlg9K
         VAG3bwK/zBubX2VNbX2J+8owj//UumZsmSXAO3VM99U2mw1rLgG71Yg87gtiLZC49bf4
         NLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457936; x=1787062736;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1HU6LBDnWtUkFmucBW5pIeZXLIpgzR08eamvaDcYUA=;
        b=PX7aWnIgZ1eGAfewNHwdfdzya3sMLuP2zvHUA3kor5UeXJfo+4aM9Mec3MXFd+WaPb
         K74XsmzD39otqYSEV+xMo0/HhNsP53bH/XvBKobIP0Mz/nIFhUF6ceRBYR6NoMdYMAfM
         kEFN6Vg89wgrxK77A3buJkM3a71dS79ZM053k9fJslANeRjCo5xZ7jYD5+uxzuAZ1vNl
         DR5pCV7hJtQAsTb600Gi7VKze8BdyXtxaT6nAMjyw8+b7O1hzqGvMj3TYZJU4N69Dlcm
         amXOQ2YUdWL1snZGBL5nmDSdJfD7R4zexUTcYFZYvr4/lAoE3r+j2ZY+ZMzo0CFjilSr
         wv2g==
X-Forwarded-Encrypted: i=1; AHgh+Roo3XPuXASP4LaA+OZWTqsK9hgpr9JaQII0XouQkwwjHQt+nmFLMpJZzqn5AubwudPzw1yyJB1qud8F@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7YRaM+J478pai36/I0qBEjRwLCzdOYqqi8jCPXFfH1Q+m8uU
	Qm053ew+gJXrKz37M9s1PoxQp3EipbsX3iInJYGMjOAXS2TZu/oDB7s1S0CzO6Ma6Rvakb6r2t+
	Q1FlTk48ySjiCF9v2kqIJgIJo5SA0x0VoM0qN0hhaUu4OBDuuNsXnBrwphX37Yng=
X-Gm-Gg: AR+sD10SwVc/JHwKmBjFDydbuGEO/Puz4fGGm/cC35xBNJo1kMOm+Id68qUR48X8QQl
	aYbVOK1uNOEnb24uzFAemJSzmbWmlpP9XomLBQOa04zzamTIZkEp0JOl5N2gHPYt1IBKh576rqV
	jg0TbLjZ1kNFHAfqELe9M3s9tIfBuzdN5roAcYSqsRfv9zwA/5R4GZV2EKgGeHbsbJY+3pTWwTc
	8f+VloM+ZTW0J+SKD6XcrxHCGATtLPssI03H6T+WYSes73Lmo+w/TSvJRBqedAp9gNwisMqU+/4
	1H0OqNmx+apU4O1i4fxLpNiYjLMP9QlIzCr1eUHfba6+20Tr9DceDuyesVG/vlZ2gmcf1HPEcPw
	4vvUkGX7cd9uRz4crzEfFfl56ZExgxQ==
X-Received: by 2002:a17:90b:39c7:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-392ec5f1516mr3991885a91.12.1786457935632;
        Tue, 11 Aug 2026 07:18:55 -0700 (PDT)
X-Received: by 2002:a17:90b:39c7:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-392ec5f1516mr3991746a91.12.1786457934885;
        Tue, 11 Aug 2026 07:18:54 -0700 (PDT)
Received: from localhost ([181.122.135.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf67912dbsm42228eec.22.2026.08.11.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:18:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: airlied@gmail.com, andriy.shevchenko@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
In-Reply-To: <20260811122603.30773-1-amit.barzilai22@gmail.com>
References: <20260811122603.30773-1-amit.barzilai22@gmail.com>
Date: Tue, 11 Aug 2026 16:18:52 +0200
Message-ID: <875x1gpwoj.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> Hey Javier,

[...]

>
> So for v4 I propose:
>
> - Keep ssd130x_write_cmds() writing SSD13XX_COMMAND per byte as it does
>   today, so there is no change to I2C or SPI wire behaviour anywhere in
>   the series.
>
> - Still do the ssd130x_write_cmd()/ssd130x_write_cmds() unification as
>   its own prep patch, as you asked. It removes the duplicated variadic
>   loop and gives a single place for the check below.
>
> - Add a bool cmd_params_are_data to ssd130x_deviceinfo, checked after
>   the first byte is sent to decide how to send the parameters. If it is
>   set, the parameters go through ssd130x_write_data(); otherwise the
>   existing byte-by-byte loop is used.
>
> - Drop the separate SPI transport patch entirely.
>
> The comment in the core will be phrased in the core's own terms this
> time: parameters go on the data path rather than as further command
> bytes, without mentioning D/C or any other transport-specific
> information.
>

Thanks for the explanations. Since you have given a lot of thought of this
I trust your judgement and agree with your plan. Let's see how the patches
look once you post them.

> Apologies for going back on something I already agreed to. If you still
> prefer it in the SPI layer I will do it that way and fold in the 0x00
> control byte change, with the I2C framing change called out in the
> commit message, but I wanted to flag the breakage before building on it.
> I have already implemented the fixes for most of the other comments
> locally. Once we settle this, I will submit the finished v4.
>

No need to apologize, I appreciate the deep thought and willing to not
break the I2C devices already supported.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

