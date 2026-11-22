Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339777;
	b=INxrZIIFPOhC719QhHvtso4mLfGkeukelXr2plmbIvP6nNe38VyG+SmrV4YEuLUsplAe
	 JJSMLhoiOGCJn7kyfaM0SqcmTcmk3hGJBwsz2dtfC0Tsqn36y0pgV8nvBgDEa3rGifXNX
	 Wei4xhjV8gAfm+IK9hQs8Q68q05VGZSAzO8H6zCiVkzgQs1BqESYkHQ/ktkuf0jmd4iDG
	 63RHMx335EJr7gI1/u0sS8qLnVL66T3ER2QZk1/cgYoUb7CTVik1bs1PFbGl2OhKeIbP0
	 xLFoeyY0ifR8dnb4PXJStQgm9fNFAK0z+j6t0lEHpFCr4v3QMhQTzOiG58SfaKoK5eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zSbBCmopfe+MoOiR3FcwmaTDcDYdusoQxsQDuT727wI=;
	b=5FpF0CtA5umgV3qmC1hRipaz3MYwrY3/pcjGIU4EMJWCHtP2IUQYMnmzcTak044bmKAr
	 IU0TzU4HdPVTvEgbNwAONaOmtR/a5QsJv7Z7rmcw5fPqPiBkXji9Gm40QG3Q0zqKqYQNN
	 ob9DowTtOJF78B400Xv3kbzzQJ8O+2ZhRMx0d5DzNQsHUEv/acuhUEDdFqAYhDL8zD+w6
	 5H7FnWK34TyjAHaNTdMa7SpVY3p39m71Ld9i/mRMtju7xBDBYGGAxshK5U5OYjrxsVC9B
	 wUlDz+gdl309r0stA4PWd+wwdA8d/N08lIdUj1/d3kJVYz9ZvDERAjPfx15Gw/s+dHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZjzK/IYF";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E15606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E15606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZjzK/IYF
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2240195f8f.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339776; x=1795944576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSbBCmopfe+MoOiR3FcwmaTDcDYdusoQxsQDuT727wI=;
        b=ZjzK/IYFDbLKzv8ES3IISLPHkNxTDieny3WEcqm04h8LzdPKW4dWZpxh4pHbUGIs5t
         zGbec0ZT4Dz+AWsQif98zk2F4AQAP4M3lfD3+j7abeaiVSVfNo0LHihJAOICISHxVUzr
         XEt5Us3s9qxLkWb1WBHG95CPsPrl+pt/qIfPDoTwBufQVAa8vaW0yhEzrJnlo1flngRf
         jM9G6VEIQ6g0V7ZU8BVReeof0Xl8HehLNfLvxLZV5j0vd3jUbRhLkdNso0JlAY+k0YrF
         Umy+5fRoEmb0JOlQ4tDNskYR/qwSmVOAPhP+0XEFIWuYPHo/WGGa104DlkO3dJ+XXnVK
         U9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339776; x=1795944576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zSbBCmopfe+MoOiR3FcwmaTDcDYdusoQxsQDuT727wI=;
        b=E9gcT8ozrYaLNFCVf2nii7p2kZNbVFzUKPByNHDyV+FGUn6Tl1s+IVHGwigJKgd3/c
         toKcU0VNlWWh4Ihqq4xA5XJzaT+2aUUrRL5++LJmerNyl9F5OrVDUx4czCEOBSn4oipD
         34xrsG4w+r23EZWo91PEqWdDGBhBkjvx6i8m279zMc3SVH+gqNNGLZ5LQXlhGcNa7lvy
         8eeRcAgjR2DpVYf1rRwusj7rQtrb12vBhzxKucRFdfICONq0flLQWk9qT4bCAzbtgoYI
         Cec5hC0AQtV4tBJtUuCKHePR42nFK9RZKiZ7y773cR9HuXJzyc0Gw5qgVIwRga27vx2Y
         rsLg==
X-Gm-Message-State: APuU4Z9Z2mj4Ssm+rhDntsiaiODQjusCr4xuK1FOWIkPorruxP7q4296
	FJf441f+WQvddCJVZ6Xe+5RFuOIsSgIMbU+dR+WzHeFms/+KgTCFtfcY5Xmx11FA
X-Gm-Gg: AZFdTZfibsQItdv+avgiEzS/GznZTbtqsAeSSIGm7fILTcvTYx4Bzb6bc2fOgFLGCw0
	Z+CjUpxB7p9KXy9dSJPYl3qARSLdGH42teqj+/IdeBetrCS4UMgIsCSzM6C0QdIl+lgFs00Klvj
	Na0zCNdFv+zIcnDdE9afNxGY57z7TtUEtu8xDCFMgZWdEQ3EK5HAunYYiLu4zNJ90NhzMJ6SBfn
	jw8Lhv8HfcBpdJzBTRbDFSE1XrFRLapz6kRuQVwK4sZ4riYqO/N5Q0UCSmmEuuUfxwGV3YA5SOp
	cV60uU0hXQQ//pI3AUZUtagu1P637dMtPV3nwPGGPJEiJWHG5FHEpHGhISyV9OQZUMxkvdYTqhn
	9i9rQYxsXmeyUpOiofvj1nz8hl7jPLJdOMhA8rB5l4ZFxc+DVtPFHkBC8QmtpVT9uTQtTeQgPly
	pSXlblrqcKluYjdtt3gdWjJU2g3C10ukW68rhXRH6HpbrK1adBdgLABUZA3Io/CtqVpgH4soKc9
	WKnwVF9cNQlZUtCoNcdDF7jVzshOcs76jQczyduKKI61iBpljb2Q1XqXADQaaLz3Mqet4arutQ2
	Q6G6czwEWwxEEDy6r6a92B6MhdL99eI=
X-Received: by 2002:a05:6000:2c0e:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-4abad5ac62emr17440322f8f.5.1795339775896;
        Sun, 22 Nov 2026 01:29:35 -0800 (PST)
Received: from [192.168.1.224] ([88.80.252.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm16020359f8f.52.2026.11.22.01.29.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 01:29:35 -0800 (PST)
Message-ID: <15b08e51-cb7e-4512-b477-ea67d837417a@gmail.com>
Date: Sun, 22 Nov 2026 10:29:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Solution for rk3588 with suspending and wakeuping at Radxa
 rock5b+ through original power button.
From: =?UTF-8?Q?Attila_T=C3=B3th?= <tothsoft@gmail.com>
To: devicetree@vger.kernel.org
References: <3369e728-9af2-43a8-a25f-ff107ceb34de@gmail.com>
Content-Language: en-US
In-Reply-To: <3369e728-9af2-43a8-a25f-ff107ceb34de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Also with this dtb is going playing again of mpeg2 from dvd at kernel 
7.3 good as at kernel 6.18 era.

Dňa 22. 11. 2026 o 9:37 Attila Tóth napísal(a):
>
> It is going at Linux batocera 44 with mainline *kernel 7.2.8. (*There 
> is also not going lan wakeup, isb wakeup, wakeup through hdmi*),* DTB 
> is in attachment of this email
>
