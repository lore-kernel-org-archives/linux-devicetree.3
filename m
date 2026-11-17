Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922888;
	b=1TJUzLmvv4NizkR02mFW53il/nWP9GICCoWYagXuMS3OqD+yqnY4REjFYhED9Vu0BVTi
	 cPtRKPp7QeDi4Fpm+uapgauVeG35//aZYoEdeyu7Lyc7vPGKQbiuutbc4jW8ODiY0QQke
	 fEGNF7JgkM1OkPhTzuAJuHqJQT/dEzlMwGdS1STly2ZyN1YhZmENCVUv+zlA3ZrjxjZpR
	 3VbXUR38qnNdoLxOrAmkPgrAZR624tZmBh/BINpwGMPZpTzwa4y6E8RurmlW5t38aoss9
	 xliVuFAobEmdA/+C3g3lu6LjVipDwbNFF2ayxK1dT0AX8D0QCniYdzCmmgSGGuj+zPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
	b=5dwBgzXmoPeYRlsCJNAMZ9nnahUgkXuPLKj9X/PxRLQ/EzswmlNTrii2Q82+DSVFxTF4
	 7R8eHQsKE7trgkmXgGAv04o47I8TaaVyGYWcGQ8L+jG1/7etAAnaqRjXf2nPmJzl89AJZ
	 THWAzofx7oXgzELx2hLssQNOVkufFkz73VK6emdYkuA+/xznxrmdbFD+zbEj8I29je6F2
	 7j8xbsNghBHRfDsZLfd4JJkZ9dYRssnWS6n2yz2V6PIiNAe0m5I8wxHayyI+EH3VKatCT
	 DBT+OmW5+2Z5tQQgYPEOECqZRNp2p9VtykbqRfsLZ+lDystWZmBk4KhyQ9BgcBmODsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF78606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF78606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so5171301a12.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922887; cv=none;
        d=google.com; s=arc-20260327;
        b=p7zPIUPYSnI2RcgZvDwEhQ0ApVF0wic44UbIsXTrA02j/yOyC04RjW+VycQnRAeYJm
         81XBvBJ1DL2/hjlkvMmeAPihPW9+Ch2EsGEqZ/SEqATGWIzDQsP4kBATvhhyEkiJhZ/v
         km7WzLUaRVJEKqoxT9n3aqiRStQM6+bgx1TOiZXwOM2TQ3hKHlV19/rJsQX66Y+Fue+O
         OhHc+LZLwVfMGUQuH0/5nA2V1ICVbBKTATlUorjp/S+kWPdwgylPJjl3dU4rkelq1fXH
         7Ly70ww/0EB6UJZH8HwQa/yyREBRx1fF6Bql5OkOXEdAWnWxlVKnl6U+r73vEzje9UvZ
         yaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        fh=+CagQN53lxReBuHmlMuvyOOz38RD6kNFQ0tFOMgHyps=;
        b=e2xNWyhXGEYswypPOvNUjrob8DhwOB5bINMLTMdRrhlEwJo5khDqDwsbDmFidAQOuC
         J9IFo5fHMBzVM3VGylP7XdqC04Oxbs5Hxac67l6Z6mmjsqkChCZAiDw3e8OFdzyspuui
         si9DiQC4fqrFn9xWElp30yaCHA5kEmHWWQfGlGa1h03BbAIivq1GISfYZlN9/moXG8ZX
         NOjzcLSKj6QjWR+P4i4mkFO1gpleclwg/cHF8HLRg4VGtTnXLmyqdY0CES5AJyTfFwW9
         jk6o4lyt3VzbEpfaCpZia7WK3Ly+qz3IVFnNBnlqWHyse+9PWLXdaOgBPEWIDl9BqahA
         HKlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922887; x=1795527687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=HXZD6+bOfJsqVWxCIDhCrOX0w0tZU6Qb/j1uDssVapw+Ww7+0R3+poAelpj8hd30Uk
         NRHXrhn4tct1eSaoNp46WjRi+tv91i99TN22b1qevYVL8cvYI0iyYdiFa5yTKzolgHGk
         8sMne0X5x8cIw0Bn+YjBIpGqXPeglmO0o3KddQI5WHKRGiS6xUDAvsFwtqDTgSDDmUSL
         MUkHm4nVBccOcAud4fo/vDh8WhsTW0pzO74y9BjVQkHMK8lO86VC/EoMAjY/vl22CH/Q
         ECbYDcJOPfeAOCjCZgumewFmNWl431+UgM8dmy1CPsxOhFPEuqJuAjaGLdXJ/yTGpMMN
         GXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922887; x=1795527687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=yEqkD+b4CgzYJTjk2xw9rV8KV5YQSqqei9v8WEj4kiBa4cYM+CvEvl+ERtr7Glxv1/
         FTdche8gAV6zbAeGHRW254SI+DmhmPGFddvJG7/tEy7z3Z1R7niYoDTzLTZQOLNHBx4A
         1wU7AQFSzYoO14FpK0kUNlHCFQqDNwB8CPKy2IwXv2NjyjCTYQpb7HzO5zDOdBtQqT/n
         3yzKDx9a3MbPc2CwvtlsgOzTy7r6QWgsh9Vh0L9kQAI6KlKDuT+DMi/2tnYd9U3Bl3v7
         txJOGEOPLGrIeEUgcb1Sk2yVcMvTSlePxk/aHT+oiDgHHld44Tq1E5UEPb5IrZmrY104
         zNCw==
X-Forwarded-Encrypted: i=1; AL+hErEb9OK0DDEbrBpSg0OrJc6HbuQDDtmGp9ja+X3VARAuhWzXEb84IFoFJ+ThKOlmJV9Vj2PVYg+1NtUB@vger.kernel.org
X-Gm-Message-State: APuU4Z9LrNlHs00xueU1QYCJP5qNdWHOPPBJYdUYX7gqi1Z5REP3wFea
	rZ3B+Cb5siT7hJBe7+mMYWqOvOkN9X4f6t/t2RHT9r8bm9MbH7txjtD2iVyimrEi4o+rVSOQty0
	p32qkm1ejOpnIRe3M/3BQcIzwp3VplyM=
X-Gm-Gg: AYBFou3HWtAzJqTSgR9pVTblr50YI0tBeIR15xleZ9ZzwlSe6OGjTjLW0esD/yg7YPp
	CLaZgskjT8kNFhAe30vCze3Ue2BnGnG6R6sWChy6AMdPkXLy4W+aML87LF9JqtWi0TDE5fxGptP
	XvCo2H+T6ADQJlWRyG4aBd+atZ8zt3DPo2l9dlNp5zPXxDHT2EkCGsQyqwCj/Ib/6EuMr4Lp0vO
	v8jFAYnD1oEjUK3BZw1sarKt/BBxro0XBLf3wEUJrHVhPzqWEmdOJAwUvPDNaDC4gV8i1Kk9sm5
	xd9DXL8p7nbbAPR7EHZejD8mD8S4DtV1NzMASITe5QJR2w9yzzp8mW4k10nDfEe1DYzeTxozcgU
	D2TPzWx4OD5zgTau0EsEeUCZNhk9+tk+EprP/uA==
X-Received: by 2002:a05:6402:22d0:b0:6b6:966f:28c with SMTP id
 4fb4d7f45d1cf-6b7c0bbe6f0mr8200959a12.11.1794922886352; Tue, 17 Nov 2026
 05:41:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
In-Reply-To: <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 16:41:15 +0300
X-Gm-Features: AclHuK9B7NyGEv7s06EQ-PBXvC_X_ioRVUg7CDZFlHxN77tZjCz1y9ac7S-od64
Message-ID: <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Nov 17, 2026 at 4:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * LED_COMCON force mode bits:
> > + * bit 2   - FORCE_EN (enable force mode for this LED)
> > + * bit 1:0 - FORCE_MODE (00 =3D OFF, 01 =3D ON, 10/11 =3D blink mode1/=
mode2)
> > + *
> > + * Only ON/OFF is supported.
> > + */
> > +#define DAP8211R_LED_COMCON          0xA00B
> > +#define DAP8211R_LED_FORCE_EN_BIT    BIT(2)
> > +#define DAP8211R_LED_FORCE_ON_BIT    BIT(0)
>
> Given your comment, this last one is not strictly correct.
>
> Otherwise, this looks O.K. Lets see what the LLM says.

Sashiko said only [1]: Sashiko has reviewed this patch and found no issues
For some reason it replied only to me and linux-leds.

I'll fix the comment and make v3.

Thank you.
--
Best Regards,
artem

 [1] https://sashiko.dev/#/patchset/20261117114432.2794961-1-a.shimko.dev@g=
mail.com?part=3D4
