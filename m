Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8C3502B8
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338989; cv=none; b=ReHvilENroLVxCQvxlSlT99mj8nnjIFPB9hNqYQoDQL4c965PCbAA1yB+WDN63L+eA1WeKT69AcxrI2OpTxfSM/SYipQwFEGcLiNsEL+mSsAWEnUj/yMj7rOnb2ioq0qjoCQp2dqhrqe7H6MQ2ReTm5SGfwDCB3O7S3UwiRoAhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338989; c=relaxed/simple;
	bh=JztfBpnQgaPei1/wTdcWLaVfhzVof/rGEWlo5CNrbpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uRKTBbPNGSUb7YuQTwtL+3ZzwlLQ4DAvOzE4Wbf4oCdRJwGwuqWFuWU6ZH+GR+Po8yOHbjYqC0WRnjDSzp+W/lOLGhuI9L1up8zrc9KeNCUbEijBMiLYqwoiExnZ/dDVueaCq/b4CkZDdkV/JJL0doadHRugbkg98LP9cQIjZUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ei/yW2Rc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U7slJ8Uk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ei/yW2Rc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U7slJ8Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
	b=ei/yW2RcqtcmmJKw9rAFjrWdGzRZ1k+kVN0VkPVjyHYeHg8EqsHO1t+UGbJ9oMuREpao6V
	WzahmXfavG7RotLMnQIFvAHN5MEhriy01NUbIXWGXEtFfeWpB9yEJuwxU/7FZMwdouj6FD
	cFK6yeKXYhAULgRff/emsO8XECu9LF0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-CblEsS1lO-ahqAg0LKWcSA-1; Tue, 24 Mar 2026 03:56:17 -0400
X-MC-Unique: CblEsS1lO-ahqAg0LKWcSA-1
X-Mimecast-MFC-AGG-ID: CblEsS1lO-ahqAg0LKWcSA_1774338976
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439c794ec8eso4025614f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774338976; x=1774943776; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
        b=U7slJ8UkAj7NKUKZH7NTBjWc0EEhqJPzpIccVhXDEKXPkEW7ZdCC3yAr55B5qP1OQ3
         X9v+SHF40FFXIwbgcNdfyswfUMktc6UBLEhVZh/uTnmq9IsB9A4+0d5msdH/0dbDTdEF
         gjbKDraTMnSpCKwDMoFp83y9hy1Z0nLj6wFWaH4Sri8dMIANBXT630W+6EEV2+1afT6x
         +sG74MHsn9ApSzRymwe2O95Lzobh6Tu4UznN9IVl5GX7COpt7k9rPyJ3N9S+stlzHzWJ
         kFIHR2jDYKA+QtpphNmUK+FXI1vdKSCpoSGVls25/v+oXCmPTHTPHe9p83P78Cip7cDa
         535Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338976; x=1774943776;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
        b=cAwxWnDhWTzGwgDmpiv4Dx6V6Efh6YPFepyNU5B0eV1lNzcuhI7Yujs5EKcXvnjGH/
         7l8azNSWb91kOumWj3FIiWHaCbU15JaNndnNwAiL6Rfhy33GS5zdd92KRugNjYZABoX0
         H67spsI8gn4XfoQJHzlkG7firqX/u7qdF9HuEtWLU478RnX2z237S7qNHUrakWFHV4nW
         xpCKA4zNO7NnOSSfpGHoUoZjEDg6MF1Jb/6AQbiA6U6Al4SzrcbT4QxxnVQsCGETLB7w
         C3oDrVbC1YLYWExyRQgHWDTy3x09uR/dPLgfTsI4GQPx1u9f4Nlc/oWjrwV8shhUPZ9o
         Y1BA==
X-Forwarded-Encrypted: i=1; AJvYcCWbhvOxyRKI6B8GwPgNBgfgcioIJl1A2XGST9XFW8/N2nx2OBTZ7yKCnjtboHX+tOv0spPGKkppQnwI@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNv56pRtQ6ZcUFaPNO2Rcq13BVtenJnhlpB2PVI1TvVyL7v6t
	bHEMkdAQsn9cUNZn39JETL8QPqhkMgI1o7MiC9n+meWp5y1D01Eou/EWdOy+v+kFICDEqs5l7aK
	eVdhwtU/gI9DimLR5nqKSzq1ePTZmVz6teVe4hqbD3dXrrEUJam27WQFr7UiIWao=
X-Gm-Gg: ATEYQzxBDLif5U4xVMgMkza2+PNWKy1UqlMrf8d6fIeqCxkEgVLDvItDJqk6koHhWJs
	el1ATGw5bkW8+jaGQvn3oakFx0XnHQIX1fg1tNy6IRFka2EQW9dyMoH48BHCLUE8pMV4HOCpbkL
	udPPijsnt1o+i83TuiRMG6ElIry+uJPFxQOe+XgAci55RrETW0+zs54L8v8xB4LzRkaUdpU161i
	axEdpDH9rTtzXr8KoJZ0SKzqKYh/CCLUdo2AuRGqeqigporawoGgVOWlckTi/PBEZ9hkmkfZxOO
	5gx8XWOROXR5plp2y5laVqI5nWz0MWhmwl0GM/ZqSje5Him7O7CdWV9i2Xc5ixF8522NtLz/b7q
	GK4YvQpb5hcEsCUBE8U3wjwN8CIneWlX81J2aXWMwWAqL5aTxd+HYm/g2eOEFjKkujBHCYOV30y
	1oe1Zk
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2989 with SMTP id ffacd0b85a97d-43b6427b212mr22640523f8f.49.1774338976184;
        Tue, 24 Mar 2026 00:56:16 -0700 (PDT)
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2989 with SMTP id ffacd0b85a97d-43b6427b212mr22640483f8f.49.1774338975756;
        Tue, 24 Mar 2026 00:56:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm34390579f8f.15.2026.03.24.00.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/6] riscv: dts: spacemit: add i2c aliases on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-4-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-4-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:56:14 +0100
Message-ID: <87cy0t8xup.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> Add i2c aliases for i2c2 and i2c8 on Milk-V Jupiter. This is useful to
> keep a stable number for the /dev entries after loading the i2c-dev
> module.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

