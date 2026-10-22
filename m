Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659803;
	b=v0fJAxer89ep1IOuZOCv5pS383XTIUk/OaD8Sbs9agcnvY7ZL138D6MX0nNXtEPFydjP
	 rTo5E6fFhe42iQ7tqaJCoEVfrmsGSdn+al/o66nqddMRm+7K59xk9GsOdQn5eCpOG71T8
	 VYVxhuEnSITOL7DYVfWqokGPliDhOvEdc9aXW0OsmrXHz5HC0d+9EKUEAdMw+Nyvn3F6w
	 7YcZ+lmk3XqVTMwrA1P2D88Or/00IabF6Lsm5hT9LWjW2EakUjD67INPSSC8NaUz3c9N1
	 /SWDCL549CtAVjvKoEk6plwYMVcGIXeNmKMFUWJKCD/HKIvhQY3HCzbDo8ZiB+QK/VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
	b=Ru4GRfosh913+CQHUunqUnKJJ78n1GlyZQv+/CY3cH6df7N/P+FGBZyOxoYody+6XQT1
	 ebCybOlrv7X2530wGYe80RYqeEAnhPgfaP4ihVbYNEAi68EtTkttes7f1hjBf+RhO/Cnn
	 SCg1VQOfxD9k/3+y8gaQSTFCS4GSZA3GAn/jvBhUs2M67pzJMF1xA9TusqdPj0GPGNHoW
	 zyeq+4IvzdZTTnkqIBUH0YMIe3c9Y+40EI2tGP1AdwRiwGH6npLbcGqCEyvF7HhfpPNNa
	 7LS+jaWwgkDMcrQ3IjcaibjQrFLh8U2N8hbAN2335jWxagi8mZSYBBG00BtX4z7LWtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfTI97l2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CE5606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfTI97l2
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b10ac6ab7bso16355607b3.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659802; cv=none;
        d=google.com; s=arc-20260327;
        b=eDLIMAfui4zqOkwskWM5W6+ZHMJKnhfS7fAykxOMoe/q3cE9u+Z4C5YzUso3ic87aI
         a9r0ekWy45ZdxQV9oH+W0+UU6BgHyWxPnZMECtFEF+ZHl/DIlhlH/pOiTsk8jLbltM88
         nBRgWQFtzLbe5lXd19lLQXmvVMmitVM78SYQgnoE23rW/XQjNNwE7fKJrBxr/j7PCo2E
         nCuhuOjoQuVTUyA3CUzREolNsvvOz/4pVlQjdP6nb2kTywubYiwMtKdBKgr0WXk3ULVa
         lRAQVhzRmgE0ARetkEqNJ1paxs5Wb+CO+U0H8qpPESgZR/5EwzTB9MYrE3/MIlkSZ0DU
         Onog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
        fh=UoZ6jAFLdj/9nMiPmP3tMdBRoNHjV0YGYVJixEFLXPI=;
        b=lP5FcuoijVd+ycpn7m3FXRq7u03KTSfetOcqEhdtjS3fyPUYOSjfKaKv64TL7LcjzJ
         qfjHCl6C3g+Uwj1p2kWL/TAmgbjY5BY9VH0KQsHtEVHiPRzw0cAzsJbjhliRxc3WRIRR
         fQH5RAGRI2Y7WaNCoYn9msxvdkREshHOaTueRacuYE0t2bixeafEwPmit1oMn6lpjfbN
         sRjiMSMmrc0no8p277Xop5vo7av/Ud9rPitM7vKplY9ybEnO4MgIZ7z3lHklLPUtjnxK
         rJ+XTzrzrjlJKFQdJbzubq/JukgoJq0FweZPbGhyxJrw6TTRiH6CheC9D8ZZ8Tx7HSE5
         k1/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659802; x=1793264602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
        b=gfTI97l2APZ5Y5eb2pvgmBAcJPxPWkyaMIeoupkwpg/G3zfAXg2Wvpvo5JPGquuYzc
         /5JQ22VD07t7duYg/NPJ6sHT6l933oF381drXccv3pbL4Jxn3ZvktZrot6XIgVS5jHPm
         Eh9msNag2p5o0GxJuyyPJ9ptxHfSwnLNOZqoIoOGCwjSAw1asW4X0OsQA8WDL4wK7NG5
         Q45v20NQcvn0tRSbC2qGrNKTTvrHnuAxoxFkS2u3HDiLTr1N1sy55yTmSN6/npq2dQeN
         hGmqwFETCUAalxfq23tyKN89t0PfOuAw+jO5DigPtyXVMF2o5Js0COnPFGz/5jwxIk2I
         F06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659802; x=1793264602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woa+e/DGRt+AU4ivMXmTUiTEYIP4GbuTy3RmYJMU8m8=;
        b=i+hdHGi81ZoEH0LKAqxxQUIUT7urJpYl68TqcssMmHR6LjzcNdoW8bnUpR2SsImx3o
         WYCL1qp98osUvo9dqMTgGbvAsAnzRA5FCj2WG3BSoOXlbXAbVxmOntPriu1Cds53TUew
         bD6oECGYH53K+DA/QdSIrsI68QvTxiWgoUGRCPzuhQD8GsEhkFJ+WVS6XOuybTQKgHhB
         jPWU6HJq4IG5hX6tpWy0On8DcQkH6P4Z5dbHPTlDbnBooap7DVIxiknfpBNVOUNGzT+c
         r55M6Iil3pxUWpGmk0hiIYGAtAXqCvIuSduD2NsMdfrroaGaqeD+XaOMhx975zxyrztc
         EgmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzugsw8g4M0Ieqr2gya3udnVIcFrSwUnxfI6QxkuG8AiKSfKV5wY+0upiO8I53Pd+j8589JFZyuYnGI@vger.kernel.org
X-Gm-Message-State: AFq9FYKJvwsuWNcgdbS4qu6tjve/fFrQ8PClj89e1jwVIW/VzjsMGCtV
	YSlE3Mzjp8VaLi7dB9Z5btGZzZ8Fql2bEoUTwkLtvqTDYyABoHpCm7QPgfufTJkW3RapjBbQkES
	jPW64Ch+cNQOAsn7W6IZQ8VMnvhmg2tg=
X-Gm-Gg: AYBFou2yYN+MBiIOzYniYjMSxcH43p8wSgASXtgn+T88jGPccR7DteKCOgiSw+CquKQ
	6fihAdes76/BU5a44klerc42gtdDp8HVsvrsXEo89IAheWqU30fpQStisASWlCh5JhnQRJNmmwH
	8ujrqbr3wJePQ8u4en3jJpl0pUv0yyfOly7ExzSnnFaYin9UxTKKXHx7Yw4nDdM6+a89w3f9Ufu
	g+9TzGat6qu3u6pROKxfJE4fccLRznM3pDzih8xUi6PRkLFB35FVVkw669AUG1Y/J3L22EnfqDM
	pgqqLpceZDdHi1xyILaQp+Nry/Wp5QQOoW1MD0EhQDb2XFyd83HRixidf/PD0VmgT5fwk+PGxQy
	8UWEWalibEcnrbPVEaY0t2aHM7zexGaa/
X-Received: by 2002:a05:690c:39d:b0:8b0:ce77:8dd2 with SMTP id
 00721157ae682-8b134346641mr26849877b3.62.1792659801067; Thu, 22 Oct 2026
 02:03:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com> <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
 <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com> <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
In-Reply-To: <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Thu, 22 Oct 2026 17:03:09 +0800
X-Gm-Features: AclHuK-9tJRRLKPk2BbNOku5118pQli1dH--Z2N1H902t_ekr0ZNJcjRGWjh_K4
Message-ID: <CAHk8ZdvqoEE66xPJmV_p-2nCrqNj9yQ6RbjD_wTrZZM84bYS4A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 4:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> My reading of Jianfeng's email is that the "Go Pro AI" part does
> not appear on the Acer sites

Thanks for the explanation!

It does? https://web.archive.org/web/20260314171131/https://www.acer.com.cn=
/product_list.html?parentid=3D323
("=E9=9D=9E=E5=87=A1Go Pro AI" on this page, '=E9=9D=9E=E5=87=A1' is the Ch=
inese translation of Swift)

I don't think the name (Swift SFA14-11) on the support page is the
official product name; for example, you can find Acer Swift 14 AI[1]
is named as Swift SF14-11 in there:
https://www.acer.com/us-en/support/product-support/SF14-11
If we are going to call 'Acer Swift Go Pro AI' as 'Swift SFA14-11',
will we call 'Acer Swift 14 AI' as 'Swift SF14-11' in the future? In
order to make the naming rule consistent.
Sure, we can name 'Acer Swift 14 AI' as 'Swift SF14-11' in the future;
then we lose recognizability?

It is awkward that Acer only sells Swift Go Pro AI (SFA14-11) in the
Chinese market; so we can only find it from the Chinese website, and
we don't know what product name will be given to this machine when it
is sold in the global market.

[1] https://store.acer.com/en-us/swift-14-ai-laptop-sf14-11-x128
