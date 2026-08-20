Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125747F2D5
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246144; cv=pass; b=leojN+NaZ+IjyVzfIGm6jNwv79A+ZFmZ8bH7Db1qk//tzA3HV4z5p8+StTEOIG8wwjeVAQGWjC5U+7QtGQAKui8tCSHzABgTJMJ9ywS4LgCyOSZDLB/+nt30tFmfByrYxAohM8SkJAsRC5GPhC47EJ/tJ5VhR+8fbTQGo06P1go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246144; c=relaxed/simple;
	bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNBnn2VWUpphj6gVp3imvmUZcWYVvaweuTaMx3Ja5fmZWGqklEaIfLtS2cOCF6qWQTySkGf++eDm/GKgwDiJU9VhlJ9OotWpNzzIGFqxv2SgglHI1xZYQUFRWHbHmgfDHeBMMRuN59ri2NQl5p8rW5G/oSmT0NynhUPLGHDpnlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhlFp3TR; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhlFp3TR"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015b2d792so63632e87.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787246139; cv=none;
        d=google.com; s=arc-20260327;
        b=I0v2L1nSu1jLCAvZstWmaQs579agT5Ajy2nIFZm5x7poR9eMWL0T2FSOR2r7u81izI
         /Ztzzb/sFC9/PxrBPPbFOlQ66vh5X7UO0mvAAt7azKt+19mIbno9250JiQNgxbNnj19i
         U1NZuujD2QipBDXrGaeEP3QdbgHtLsaLuOL7uZhN6GlTio6lvstH8Mn1xX/oHT0TDKpU
         AUtNpAnnF4cgb4kLAIhmFPyHpopxgzIJ1PuT4LG3CLCbM+w+2hKA1HdSEDXwKbgYQqMA
         2d7evcKEIXuFPzfm4DfLUyCsnIiUXV7pWaf4KNxG0HSF6OxXBbW3S8X43ElYy5RvKzzz
         yYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
        fh=Pez3Bhtqa1z17FA43w7XIzYWA+Rgcgo87z+5C5a+VSo=;
        b=c2gVVqLejJ6u/yY4P+xW5ojMQkoxexWzqYIIcLH0BG0G6olV3eH2oiVCkUDozYJAzW
         pw1kYFwM378aiXSXnCLJLbIrAD4Da2ZU9pyrhPFwd8oONhEBqt9/Y/zcQiAUjT8eW928
         EJCf+EqZRDQObcwqJLADdhk/LBwu5U/JcnDSf4xRJojOOBvyk5qzHdXFSG1tx+XQPEMB
         ovBZSiFdRwWNFul74UicA9t9b3LLd+b0hdNgE+jKkU0AnzBtBi2Y82t7AiHePqPORWRd
         TBv287Vjm/60mTXgLszt+8XX5WntlUQljsLECGQGmDA/8RzApG33YmygMSACof0yUSKH
         shqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246139; x=1787850939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
        b=QhlFp3TRefwrLZ5PfMTwM44EhPA7eyKSTgpKlbnn8CsBNAd+6s3hZS463nASuDpHC+
         AJxWvHeeK6gWkaANJOs1Li8zVYb/fJ8LAPNBJW6zoGBncjp3YZXPBeXJl02D4JiR/9hO
         ycHMAUkbsmDiOuee7uP63wrTV/iaI3TE1pEV6msMexdgEaU4uA9feVoFm8Z1cHGdsp1y
         wZNhRoJLmizaB/068ODHC4Udt1Ai20xGeK0V3yREl9YlobBc5n9g5JWd29Zgycu8I7sl
         6CBZuH9NWPt0QyEeG7aaAkiBQHc5bLdWkGYoE5bpXonU9GlrhZaAT8kRnfM5/ZCCmH2r
         xCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246139; x=1787850939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3c721Up4XKT9nSGpOXXtxDHVpHlRP7Uy92JTc+lNdns=;
        b=j019eiDtpnvCAOcxWV2JSU08FRZtuOV/3U3g47EsbxFDvq6pfJDDNxHMWzamrmMPkP
         LooUi4u5ihRtE41l6AfywcY6Jl9Im7+FwdWtjSL7cjqw2bzLxx7+crWobNhvzUGsAZR1
         EgHI5cm33tBlhovC+PtI5RnAuzUvkZF9nmd9ugF/9awncbJuJ9tVyYK9M0OF5qivJJKA
         iIRS4Q39heJcAo5ipMfiT3meFWKeQ14j6AOoQ/Ofj7wcwhouucPRm5vTYRiKVsMuvywA
         quB1sC6DQVkfHOyHruhZbkVyoSDIIjw3wCzqT3zwan6GPlPyweExwXIl2yTJL6sx4P2v
         ddGQ==
X-Forwarded-Encrypted: i=1; AHgh+RolRVKlLjaidIXBCjAOEZvRPBYFhetkdcsZFnJp89yIRmqIWbJnXcS96S/XGSUHCWJPjqPLrr1JyE+y@vger.kernel.org
X-Gm-Message-State: AFuF++lMs/gV4Ig3Gq6KD6ThNPpNtXY4KHE/QT5jlAOq09lqSMLjWeW2
	nDDyDu5YAahpKxxJBW4uJLn9Jee+TB0No0HpkLVlSdxbQQx2p7ljGkR9bIu3UPv4+MOT4hylNMS
	o5cIKy6mAFYuxuYxViR+AwcueKiMDfTs=
X-Gm-Gg: AR+sD13yzWjVx7DtB0Pvj0eU9nrzCZQQQfPhBRmXcB15LZ5dyN4yx3NI9tOpT8CCoyX
	MVwOPl4m7Fk7eB9kWOk8MMGvTazlVd8ADA9obwHmsw/JjffSKHOq6RcwxUUX+DZpWPXxxSXxaA4
	u0R9+1vCbmKXIZx0a5GG5Xbzj6aS0D7ic6OMyE5795d3lZsxauHkyI9jRS8ipeCxnLv156r8mcH
	fsQNc02133TzhrZDjycyTUmbDSIA9CtjJnlJhJwcBZ5kV96YEH7s4eWQkFECVU60r9r9Gamb3gg
	zFKPb2Ii/CSsE9PzC/kbCn8yTsGOnK3k1csdyvMGx4s+AYodCm7ZrLxXa4ZtJE72NDben3JKQKJ
	Zky9DEvTgoY0JB03vjC8VP1oudQ==
X-Received: by 2002:a05:6512:3c92:b0:5b0:bc3:dc11 with SMTP id
 2adb3069b0e04-5b478d1f07fmr4752522e87.22.1787246139023; Thu, 20 Aug 2026
 10:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786746757.git.ahmadexp@gmail.com> <20260818095654.5357db1d@kernel.org>
 <CAOQiBWM57ZBafMcj9MaegHBuM21313O5PqAAGXdHfvmHxHp48g@mail.gmail.com> <20260820100302.1609c979@kernel.org>
In-Reply-To: <20260820100302.1609c979@kernel.org>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Thu, 20 Aug 2026 10:15:26 -0700
X-Gm-Features: AcwNN1VG-G40EWmCjL4DcV3v9ciEADsSL9chtIKAvcClckRaycXWK-AFTAquNos
Message-ID: <CAOQiBWPZg4xkZFsUm9g6XBYz+vixaKPaofdv1rvxGwufD3jm9Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C peripheral support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Nam Tran <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood. I will split the series and send the IS32FL3207 binding
and driver through the LED tree, and the I2C mux changes through the
I2C tree. Once those prerequisites land, I will rebase and resend only
the ptp_ocp board-profile changes to net-next.

Thanks for the clarification.



On Thu, Aug 20, 2026 at 10:03=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 18 Aug 2026 11:12:35 -0700 Ahmad Byagowi wrote:
> > I should have stated this existing hardware and end-user use case
> > explicitly in the cover letter. I will add it to the next revision.
>
> You need to send the leds and i2c patches to relevant trees first.
> We won't take them via net-next.



--
73
With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
Phone: +1 (650) 924 6653

 Please consider the environment before printing this e-mail.
