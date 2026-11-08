Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794174945;
	b=tXp0JMHuONqvGxiTjtaMMNx4gaHYX1n/Fl67G5VU4vLRqUDOMchhpESL6szUD7htYERw
	 dL8jIKkM+28ikWYqBImGqmqmU+kLgUmk111s40ayMsZhtOvD8PXBDeUyWYTFk8toAfoZM
	 V8JX9kVv1Jo9MBTdraSo8GZwFPuwa+P/NsfqbWZV+Cvlgm1ksz8E0zpXeDotMkTAQjkEM
	 DWodwss1yOqPouaQmBIk4Di8bCwiYZRLq72IAxrayuiTKDU27yMXrHTM6VcbcwmHs85Is
	 ZbMbk/LOmUomaofWcoEa0NqxCKU0Hy1jYK67OkJzFUnlGZKKh35JSVYE4khHl2OxEUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
	b=E0BCIwqUgQq0c3QGcHZQtm/DVEn+DbYvr4VbXJ3fmNeo+hfY6nSn8EpwlZQODAaXbkst
	 tXzQTQ7/ZXhal7ipJsYffYlI0Mhkxvr1EcSgYm4o8R/8lKiqyaO37e6FZIK05ZGnqu8A8
	 Lwg2D9gJid25UL30ZyYHtXkICsc/RjagAJ1jCBZKnyD52RuQVJaZJVvD1KM3Gu3zYw/V3
	 fcXkdorjzZLgmIWtATpZRZkTwZXsI/Fk5ZVeSgqFhgH8HUOvkP0KwNE7ZWTZ9Gv9y20qy
	 FBL0I4uoooSizwmUYIG3tmE+lMpON78oQJMyMajpe3D9+ugO4Ser4yy/iJiSiM9WyPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAaaw93y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4A606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D4A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAaaw93y
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1109565eec.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174944; cv=none;
        d=google.com; s=arc-20260327;
        b=R2f3nv40FwTKCLPk1LiVfNthGA5nxUeRNh2UOHVwj0jlNwK/+UyosMFps63uvjsqNu
         0CYp1BFhCmyDlNYVJSBgZrv5T1OoXb1NARE+DI7UaSgvfSl/VXHNmPvY9XzuhML7+MK2
         +vulGUdQaX2yEyQ6vmps/hGrTofY+eF4Nh4lO0FQF2sZ9m2CIGyJSunLuAjx18LjHQII
         PLUReZX8Pvcu7ZKGqK5thKexF0KjogZx4QPwhIApeRQXr/pGmaGQBQ7YAFDzjTJIcI9x
         KrExy8u18X4Fd52EHptPMc5zqkwVxrq0TUkF5y+TMFF7c6OaCnRyr/U06ugNW8mmwppR
         /Gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        fh=OouK/nL5xf/K/iojbOV5gV0XnVQwKRfsS0L5vkunbIU=;
        b=AtESIy1S/YUf/Sj+BNJY3GD6rhVerizYSgb1QffrPC8LxLvVPcywd2zi4i4vXDAc2K
         pXmoms3y52XX2H6gZSdGclklE7gfCrgIkxVq5Z8Rs1bCvoH6HfRwmNp6fGF66//BfwYy
         VV09+K3Gbt4er1hK4QhmowUxrZ2v37+drU4hQdCs2zGqg5mUCg91aLGaKxx2EaPibB+Z
         BIP9lalbhJ6/YmgTkvqs6kzOYXdtSoQxriJMb7hpXuCiuQSkYhEtyWQhNLZmlyN1hZlT
         eaGqNH7kgxsdAN6vjWjsOejNSyKyNHjmeNpWNkAFkX3Nm5O3+yfMisFc0R4KffsB2X3g
         K8GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174944; x=1794779744; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        b=aAaaw93ynIf3qzV6bFMeVV8YBCH8vLZqLwefUSTXJYbag8UMqZtLhtu3dkeqhn4y/G
         PC/jDS10kd9v9WjXbRDG+BsZs9wc6IlxveYW0FeXJNr57B/U/yXdtUv3X0tqASTQaDFs
         LW61Th2YoBHzSRvmRoqGd7prkZusyj08+EMqanHKAyv4Mt4zY63DsY+RCBQmC6QeyTDs
         3vTSj3lBfNI30vKbbA+uURfzme6p8cevux/4fK2Sg0uPriFBuGN9ok2FSZe5Lk5lFtHu
         15F78AIvoW0suXCCQtXw8q0F1S61Od6yMT8dzY4hJYmp0Msw8YOjVsCNDuxJVQMlejfb
         D9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174944; x=1794779744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ALWYb7mKLT0vzfVw1EoQilMmnTZv8rVfaKixsBK8VA=;
        b=rq68IG53QX36E2eeyuU1sJxOP0c+veNXwqjNnWZKNd0+LYQ6TiGqzVWD7Z8dE0wZJW
         QFW5ByJiJk6xtBUptLB5srpse1HBMLd5APQMvL0RoXgVv+dNI0tNtQdi37VvbDovb4+j
         /aIMsEN8kN0F90x7kii6nLCpmN3Dkecfd31n2lDitR+kulZf5YJiEPDwJZEHS1jeMuJn
         GMenNoNf5/MbviezxlLdKlDtt05SMTBR4D8BPofHzwLmbIeEnbwsl40XRBCn2U8n2G29
         2Aul2GTrGMVpZ16NMY5V0lDOFCnwmRx9vkuQaBLegBZdoG/N92szObu8dCiOOhwU8sja
         vQIw==
X-Forwarded-Encrypted: i=1; AL+hErEsUCs2u2nyRxH2jTpWAjmyIQyfEILc0F/g8zIKMRAzD/B8Hg+Pqs7fDsoxLTURgCfx0hBITu9xaK5P@vger.kernel.org
X-Gm-Message-State: APuU4Z8OFPwrwUlcBLexck56dlu3jYzX3D7FtS5tfiucyYwVNCbeJron
	18cRLy6RI50wezAYnufPSCQc2LZ6MsuKNtbMzsdhnG6JleVsLpWWTRk6Zi7IlikDiY9ggKccTkh
	RJ1lyH6nuNf9ANKWjM+0TLllvzhJKFS0=
X-Gm-Gg: AYBFou2oVoRkIvcwyeFueGzFWrH+Bp1aSbh0e/2Kwb/aQ4lkA7UOWeIRMLRxLtzTPz1
	qrmr92wjwLG9n/3PcCO8hLc51qPTLmPAPD/uRxS6UFlnEDv6cj7OuNFegDt8qlL6+8wRIItJLTp
	uy9KJowao1qFwAexdhglGLu1z30/6c9/+mrZPIHvTAmEWECJSkETdHimsBp3ILuZfepnxWmpmyy
	yF/SXsU1aG0Dfxt1q+wQvCgmOqek751y+gamO7ar4AKwPuonyMGFTb6H6l82FRPESvqXJAt3hIZ
	WEPJJI6ql6AC0vD8sPqiVT/RKf4kNbqYBsCRa1H7vo17152u6yr/elZBhHHIhI2IbKPtTYcNUW7
	sulLNAB5kbZseaVO886QLugb9+9HeFoSPCA8u
X-Received: by 2002:a05:7300:ea87:b0:36b:d3dd:2e9d with SMTP id
 5a478bee46e88-37255b4c438mr4848268eec.19.1794174943698; Sun, 08 Nov 2026
 13:55:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de> <20261106-tumble-hurt-d1a0be3fddae@spud>
In-Reply-To: <20261106-tumble-hurt-d1a0be3fddae@spud>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Sun, 8 Nov 2026 21:55:07 +0000
X-Gm-Features: AclHuK8qDOv8Crg02YP_zjFhxJU_hbwgG5TwapP7lp6MYqanAg0FpXCbz5Gu6Qk
Message-ID: <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: conor@kernel.org
Cc: e@freeshell.de, kernel@esmil.dk, conor.dooley@microchip.com, 
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

You may have missed my email on Friday at 21:12.

I think E has a point. There is a separate red LED on the board that
shows power. My confusion came from the net that drives this green LED,
which is labelled STS_PWR. This green LED has no silkscreen label and the
schematic is ambiguous on this particular LED.

It is probably better to drop this patch. Apologies again.

Owen
