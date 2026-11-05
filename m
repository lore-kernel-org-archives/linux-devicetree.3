Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876399;
	b=vJDYMWr6x8d30esgpqzkhQlH91LbcZuOgD60YHYJffVgaokll6OScAtDyyqKmwWX0cq0
	 SeJyFyqpY+0GPZqWxsLIVs2ol8MoirOV6Hn0tMdMoVAkJTN7RfYME7WGIIGtpgoLgVsu+
	 agswlXM/6sCkt5m5CWlNLhKcurAit0fhntSW+tVBg9DYLNtXtKy7kb/L+NS/L+K8XSSIf
	 rvOqgUNxYN5/ttWWCn85yADVsc6I0yU3qNTLAuoAoERKKbme0TaTOgOoOmyP594cWs5tb
	 BffPTKc0H31ilaUb2AlE7DjgroSrfdU18oLx4de2A52CZwT31y+D5COpX2GYLo6jPZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
	b=sf+g5k3uZRO1BWeqH+wmtj4SXufBhAqXJSSMZcF99x2O3Rk76Godunlc5h+N1QqVUhdI
	 BPZ4LdSNmOdZPnJ9e/IXib8e2OSqj2lMBUxep+5E5hEhkP1DF99rxiR+zfw/D01ImgWWP
	 QwPsjxVPccGXxfHwLEcVWTeb21bcnoDxrlEAUCE1TkFBujPUSosHHxbkgBDCX5epVaAB1
	 Q4D0ekY8XwhR+blmRZP5QR78hk+30fnEsEFKz+U/2Dzc/xXWvlynhKJYztkyS6+znr801
	 fgBERTApT1TBtomtkLmrjqqq4c9EDoY/M7TttgoQIVP1cwVH6QF6JHnN0sfs+Jzwy3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQr0kFNb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B50606D80D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B50606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQr0kFNb
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c423b145922so246823666b.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876398; cv=none;
        d=google.com; s=arc-20260327;
        b=e2e0In+UR6YszyGVJMfIAs3Qxh2tmxT2/4y9msfnxa+r5STlgLtl+pbp19ILfG8oFP
         /TjzVKpUGtHI9sjcyFy1vsCGWcD3XERFNmHB34tJV1J+aXnwBzSLg2Yr7OObv+WdvIpU
         jz5QTcQCyaJSG1Xd5RS44ymVluZoB+zKwyUA6yAXU96Vi9Jwf8e2eqL2vzTDqp84F7xL
         8OnATG4egv84DGV0+fOIhxrsFn9dOp3v5MvKQLiZu7KIFrZCz/AHT/Jg7h7/DCxKfdBx
         4IOcquleFNQs6wMS3isuK+PoIkzUKkZHIzI77g8TCL/OJ6zF7LP/8ALM9xNTOAaBKVR2
         5dIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        fh=+7K+5BAEKslJFJMax4WRm68YAp4v2uR1aOWZacBhvf8=;
        b=m1Rm7JFijTAPHqzVJYiqyhV0afYhExw/baXqcAxtwjst8tWUsfZEBnM5RmJzrEW+pb
         5XYtmmq3GPRVY/ZqoDQQgEITE7LsPmZVJhkjxYEwl61BZpM0wZY7hrs/SVuv6cfRhl/l
         Lt03E3RvwW7Uz8K1sCv32Nz2vtSZCDt32I85a0gAv9smFuUgTxYor3PXKFtwQw+p4+Hc
         n8+dp6gzba3oKo+zxdt0sk3pkNczeVD93wzHophCH7nmXP60sg8KeUKgBEC6DtFXSyGV
         g8BwrwHe/ZflUJhVZSe7ZhZ4d4PFA4UJ2qff5zEHpUlI0TPGY1iaW/BKlKy8qNtZZUjU
         4W3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876398; x=1794481198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        b=uQr0kFNbU7xYaLOjvT3vxuSmVKE8PdIQlZfkWLManzx8N26orhPmHjSAwxX/RGFuXx
         PLddFBAfJJtxwn/5Jx7nf+SEnmJvmX5oDdYxcR7Pw9u7d5VsUIKpKA3hdUyj0u85HiPf
         /8aBxloPuYO/4udYDkv7QNRPzML8LadtVqffp0cdBWZmMvIpXshDmWi4ZGa0tKzwni/Q
         RCxquIRd4O4SnzD5VxMO2Yp5BO9x4c2GeY83iU8uB2ImfrL9nO5897fueIPLsqewGwrx
         /plSTVyIw8rv6gd5/7a20W8AnQHIBUHo1DUjtAUdCqR7U9T5S0IJ/5mCfO967Y30eNPr
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876398; x=1794481198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        b=vBVkD4tNI8/1FvwD74m6PTAjVHLF2XCYVRif2pqiypJLV5RJXaGwL7bEDtaNmH6bXV
         swsaZ1H7doDkelpKYGa5JhZAQd9yIrTm+B6YpIRQgzKbntY5Be1eKcgZItcrpe1lqH5y
         FC+esPe/mBKAXsPoGmVHoqREtQMWYbI18/cGok3YoB4+01Mxe2RxB/26mILTcg4Tmh7r
         PbirHz6vAoHDmtcduMCRWDP3WtCNlMrYu1Fk7iOcIm0W5wa04oC60GkvPozOhnoVk5tH
         UwcndffQa/p3NrKQA1pKHmCtFD0VRHm7eHYxkl9ym5dwkeQ2Ap31JFCMooWwZj8HAzYC
         l95A==
X-Forwarded-Encrypted: i=1; AKwUvByLfiGN6A0nZ9dilzVqq1VmOy7lMd6R3FFEoe134JsWVU0+Q0r6WSDEW3FiPj9GDia+sDMP3Wd3QdC4@vger.kernel.org
X-Gm-Message-State: APuU4Z+68FAJF+HF1TpQcyMrhYt8JbRxOHf9CfwYlKwsiuUcMF9Yf+AF
	j8ovyU1J2qlAgS4UFWuE7V8uGtzjIytTIuORDOzWk/N1ezAgotAtwJshjiUcIpoS7wMCDsVKE0r
	ATLAMqSIlgGw97gujW62zbqhqaNC391k=
X-Gm-Gg: AYBFou1uJvIR379UBbOzjCzb2epvjR0C0cezAQOJ9Kf6gzl4E65stdpJEpiGo/0kQiP
	xsBqxnjuOK9X+auNcuE3GE3v/LCSvmpXrXNJTBfKvcdGYGjJocrq8d5vBEmZBvoDPl6MBgagdjS
	tbLo6+tMqNjqviEn6sRg0L3Nq3q3ghVAuNFl/5J0iBu2PFVSTZqvpg9if9wBiKAdXUCuT3fQTUq
	BHIJhofvn5EBZH5m6JWGmRAL/9N6kUqkzr8ZWuT3B8XJxOJ1nGHmreIKVBHrYmWz7cBP7/3WSY7
	XxYdIRkyIsou9ckqxvQWW8wKZm65j/YdeEDcYIIkVte62wkS4vp4YraJgLfjCFHkad/RW0wvxqE
	dgyLR3NOLLMzB6x9fQlzaPnaSUgLj1H2KZ7Sy6brYVhSA/wooLi1HWuYPQpP9ld99CBde15Rd2Z
	z7+MvBoSrMrkGT/HFGcdtozfVCNwAk2sOkiPbfAHV2dj5vdehl90ZR0Ky/2RvQp39ocbQBbwBv2
	+FqIhgsoloOo4LgIyh19nWCvDdkTtEMgLab/DpATkp7Rr2DhFZBRB5/41uTjY0I/CmowuD1I1Kl
	9H7ttmg=
X-Received: by 2002:a17:907:3f95:b0:c46:8b87:c1f4 with SMTP id
 a640c23a62f3a-c4ca7a86e98mr1520903266b.20.1793876397539; Thu, 05 Nov 2026
 02:59:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-iio-light-gp2ap002-v4-0-fa1cbaad2ce5@rudorff.com>
 <20261104-iio-light-gp2ap002-v4-2-fa1cbaad2ce5@rudorff.com>
 <autr3DH6UZLY_ys4@ashevche-desk.local> <ed75d869-c51a-457e-9cb3-6250029d4ec7@rudorff.com>
In-Reply-To: <ed75d869-c51a-457e-9cb3-6250029d4ec7@rudorff.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 12:59:21 +0200
X-Gm-Features: AclHuK8zK_VKtp7fvak-P7kamZod1UIl3e5bgYtsqibH1ihAtEl2wIiK2lVgYCA
Message-ID: <CAHp75Vd_Rr6pFsTwpkwBcA9Sn74Npj37zSau4APMad3UE0U5QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] iio: light: gp2ap002: add led power supply
To: "chr[]" <chris@rudorff.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:56=E2=80=AFPM chr[] <chris@rudorff.com> wrote:
> Am 04.11.26 um 18:31 schrieb Andy Shevchenko:

...

> > Missing '---' cutter line which makes this patch invalid and it may not=
 be
> > applied (your SoB should be a tag and it should be last in the chain; y=
ou may
> > conduct an experiment, take the message ID of this email, run on a clea=
n Linux
> > kernel Git repository something like `b4 am -s $MSG_ID; git am ...` fol=
lowed by
> > `git log`, you will see the issue).
>
> Sorry. I ran checkpatch.pl and b4 check and they missed my mess ...

It's not handled by tools, it's for now just common sense.

...

> >>      int num_chan;
> >>      const char *compat;
> >>      u8 val;
> >> -    int ret;
> >> +    int ret, vdd_volt;
> >
> > Don't mix semantically different variables on the same line.
> > Try to keep reversed xmas tree order.
>
> So like this:
>         ...
>         const char *compat;
>         int vdd_volt;
>         u8 val;
>         int ret;

Yes.

...

> >>      if (ret) {
> >> -            dev_err(dev, "failed to sett VDD voltage\n");
> >> +            dev_err(dev, "failed to set VDD voltage\n");
> >>              return ret;
> >
> > Unrelated change.
>
> Yes, but I'd still like to fix it. Ok, if I mention it in the changelog?
> Or shall I drop this?

If you are eager to do it, do it in a separate patch.

--=20
With Best Regards,
Andy Shevchenko
