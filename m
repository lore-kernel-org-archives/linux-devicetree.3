Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886435C1A2
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338954; cv=none; b=O2qBFtt3mT6Ezs6+qMeksGGGavRt7xAtEnXWgo9GUrDx52b+0amzkOoeKPVnxbqGdwu8Z3QOmuGXSkm1k8EhNHNzt38YgP+m/9yMFIrSZszxt0637I2YnxXgr0rXv7tsJ9gH4vX6pU+IB1SIqXUIuoR7OUfKZg6purjlV/6Zq8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338954; c=relaxed/simple;
	bh=sVVLRcjpRQbfkQhkDa3vSA5KAE5n6GGfeGlTpUj4bbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q2Hn4nbWNLgfDNQHuaQkwG0GVoOjuHtshoz4ahzrfh4eTePN060XADk03Nd6AJANTd7uzDh9h8wCdMY2KMRknGwamsw3EjZ4UyPdfRumFaiG6YkhBeTSLOB+RUThXjwRRHJY0qAW4qbXPi7rMQlj3TGb/9nYYEbgzjv9y6rl++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+fYxkZ0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jHPlHviI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+fYxkZ0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHPlHviI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
	b=W+fYxkZ0t38JufSqJ2XbA9/qW9Y0BLKqLzcCEm3IXYJXaL23JHQc+0xFkM6CVULZ14tke3
	+eAizVllQzfQJTf1ff4Sqre6QtgdQRi7j4stF+dOIIgkTPZzdMjTxO9sQTAYoOJ4ZDkH+d
	RNI7WmsJ9q0SRWQvs29U945Y3vF6gLA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-5OYyg6m6Pu2p34frJqk7Lw-1; Tue, 24 Mar 2026 03:55:43 -0400
X-MC-Unique: 5OYyg6m6Pu2p34frJqk7Lw-1
X-Mimecast-MFC-AGG-ID: 5OYyg6m6Pu2p34frJqk7Lw_1774338942
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b3c9568a3so3854187f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774338942; x=1774943742; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
        b=jHPlHviI9irHXD3nDrBI0hixaTFPIZ3eW3LMUFHQ3yhDLLcneylNIJUMhSpU14Pv06
         wrpeHMOiOfhDcdCMneQpydawUZyicacsL+eFZFXXPJFOskokVTtatD9HOGMNThpVN85w
         4Sd2d0W+jxDINV7jEDyV4gjGzHY17I+dWnfIyvFreyiDuknIGZhjQ1M4cbSr48NyBVJa
         G5oSffX6nbBrhP3emIgko0TQ4hPOEuc2TIaRQGMFDz6kR3P7mPLiybH9r5JW3+VMPyBn
         QEyjrsGSe3nrIXHuoHiLm1XoOtL3ITunblIpNMzYYBhbOJKr8oOAa3coXaX1PM4oLWYJ
         6hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338942; x=1774943742;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
        b=Zt+0YiuOSCcgBQghDjJtZrjioDuJSElQUHVSS+VluYWiQXOV/MNeMY39L5jlXJ2HN4
         sUytw1Vi7gB80hEtnG6aGwumRV9dU35uP7Oi3Ka4ecpHUraSMa45xGOrmyzwwe55dgVW
         9RGWsObWodGrjH/0ec2HkFWE16BmPjk4lf1Iw0gCihLUM2gXiqZnJaUUd5afOryI+J/Z
         iDoPv/zPGhhariv+PYl2FgR7lloS8tg4tyDpjKv2o2ZRHqArLDT7jQQPoZeSyJ/LboL0
         Dqghqc0MQDzLvz+Jq9Gp+E1Twq0mrONLC84kfCUspQii8+Z2ylivEBgE1ulYLpcOu1Op
         WETw==
X-Forwarded-Encrypted: i=1; AJvYcCUCpMc/0ZC7ImG0SO3Do/ErXdIpSfSkaLsk0JE51w1GdCPHhsIO+s04/q2yvvLwKz+WxG6vgZFxFI3+@vger.kernel.org
X-Gm-Message-State: AOJu0YywwTFi5j/Zpvo5m7ED9PoD7suE98RF8faPWnL0a75PIyuyEJi+
	hVVpB3xGzj9L/he184YqwPtSzeeLgUOqRS4i8QQjCBiALsfXn4h76EJGAaK8nwb3z6VdsTnbEi3
	gzk5BUcjOPJZvC//VkbJ1wr3kjzMyyLJA5b0sFw1zBYaEZlP3xY0JtD08+YdTpoYe2oVFFEs=
X-Gm-Gg: ATEYQzzXfVqREYZDS1p8b771O0qCZlzSNA7bbVMR5CMbFlJI6Cw81/X15DzlyBf+k+P
	zyDbiF/s4KM6fxyw1VI3mTeHrTwfQ6wmhiYqN+M2pMP/fxMgyWwkdHcQtP5XxJ7L/DKgE3sm78y
	2JYTVvKaacuHjgCltz/SAeBPTySt+lgyt/Jgyvd96PFgqOFpHEvIDr9Yamvezxyfz/vC0ufIDrq
	fyzdPnAuuVWGKI456skFBejj4LpjiUxZnifE2sCGwWjothObVDeOwbq8OcMQr6CnPi/Bq+PUckJ
	1pfIyjGr8YSVTQip6o7kX/3/w/oAIUT/RPQgF8esVanf/zx7rnXnj9BY4AO3nCpZBsdAoBuQF9f
	A//WQglW7YQbxIAUdVBaEFZERREcrMNK1izvgPVFWfciHzlUHImhxLKzX9l6EdZZ3pesr9sQRLA
	OOaDng
X-Received: by 2002:a05:6000:1843:b0:43a:580:eb02 with SMTP id ffacd0b85a97d-43b6428976emr24163904f8f.49.1774338941584;
        Tue, 24 Mar 2026 00:55:41 -0700 (PDT)
X-Received: by 2002:a05:6000:1843:b0:43a:580:eb02 with SMTP id ffacd0b85a97d-43b6428976emr24163874f8f.49.1774338941179;
        Tue, 24 Mar 2026 00:55:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm34387215f8f.15.2026.03.24.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:55:40 -0700 (PDT)
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
Subject: Re: [PATCH 2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-3-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-3-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:55:39 +0100
Message-ID: <87fr5p8xvo.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> The Milk-V Jupiter board includes a 24c04 eeprom on the i2c2 bus. The
> eeprom contains an ONIE TLV table, which on the board I tested only
> provides a product-name entry. Expose it via an onie,tlv-layout nvmem
> layout.
>
> The eeprom is marked as read-only since its contents are not supposed to
> be modified.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

