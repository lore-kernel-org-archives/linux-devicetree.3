Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C554EED8
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930517; cv=pass; b=duTUQAYjgo3X9Iocw+SAmjLIcgQi1lORDnkTyfbQe1ui2+KdbJefeoVKhvDKuT6ygf7HXQ/+XJrS1OeuJbjaGdFEnIos9TACzSLz1xkkucUjl2Ipe0xtHgKJuDWG6YVW9LuUkVyIqtcawshbKrCXYmEWgSCLMztp53nSN/YXxbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930517; c=relaxed/simple;
	bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qliRskJBKKNMZAoqlxTy/KwcWnVA20zhJ8LeWqeFSF1NlN+i5eLhk97lCbZIw54VGnpMPrwErmh/Yfc/vtawpuETUdDnZXD1tcOxvDoNDeeqzaA4kBFZceGwvkim1k3lD25Ru5n7jJmmla5LXB4GsnS4rirnc7ifLo8mghL8Ui8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DUSXHq6a; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DUSXHq6a"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8871ada1a26so3650717b3.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930513; cv=none;
        d=google.com; s=arc-20260327;
        b=Mwn7SQ1CXYH+jbgfhv9Gkk1pas20Tfo1lHA2XNbvmzNoS/t6LmL2AQQlHePbX29YmP
         XjpH178892lO90/DJL1A0BglQt1YwXzzO/W4kk7JBS58ctoipE00Yf5oRVhF/w9sdb4r
         6zEXFESgygxiZkssJwoAnGrqws01fenqvsrrUlFMLl8ryylRdsrMAKpuaCDB5qmcEDnx
         ZonQcjpFZJgmUuIKYbFyrRtM7zc6QTUUStlkFZIy84o8BeM03SXlDCr4cihKhaX9F7fZ
         jrS8iegRKjs1/Kj7N6AdAsr5Rd1gXwjR+10pTgs8UfwX2xH5UvhoUl/6qwm4E5heKBju
         sfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        fh=TLWnbHAchwntm0jmTt6fx+i2gdlxg7Qd462u0ID8gjQ=;
        b=HATiAaLS80IRJjTGDN52C1gfDaeANDudMDVFfo7UrpZ1ITA0zMM88JHEavV4WAPjPC
         JhJlwNSA8eV4N1RN14vPwVz3OBe4NgBRTg8/8kwxX8knE4tK+Sry68JfGPil9yLiSe+q
         yKwbJNhXFotueo6GT8hL9TxfkJ38AqHob+PX4elxShwdrl0HiUC/jZSF8rpVeGFJAhSf
         zxrASDfqGO/9WO4wclyJtELODAAGd+XQ4qCVxxiNf6sa/yuLydFV3AzH5ONnlvR0dZlp
         vIO2Zp335qobyYqUU6PpVEymWX1NP7RhfukyYH2eC/Y/h1M08LneFyTa+SpwlDKVZzBm
         v65A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791930513; x=1792535313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        b=DUSXHq6awOXCzmeM9lLEMtkMS1ys4ectWQNADf/Wr89M6R/5Ao9JRiZUqGyXDjy5T2
         JOT088ik4rp9/uXTDrLqf6AkzM5NhYBRpFSq6CIRt5rO/4hPnJUQfk3MHN3eJIe9KuAR
         U8PSiCTpeTfIdCGG8YfydaxD3paJQX36Q3vqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930513; x=1792535313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        b=ssOdR2wrcdnva0RA7nW+YxNwodRUWlj7zmv3snw399cxCqwHSyNbd1h/ZHESVe6QXE
         6h/grBVG9oKtcktPnLVllzPJ+nFCfMLku8nvasbIDRICyQPTbeS4kT2TLvMj+jE+KlGV
         mbqzFV8HVNBGWSuaWLTcmupV1vuuQk0qz+QFfZLW+llEw/v+WT/yTl3N6Z7ASjIgBfR9
         3dK2PJptoBGCuMlyPebfYiHNQS0J2BTh4ClLXT12Go9HFrJor32NUQ4YSGIcuNCtVIDV
         SF4lCzncp7RHAmc3BdXUZvXvFytkAILAXaTpEatcQn14gpGGlqv5+8WyKAAsQ4xcykEp
         MBRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxrzkXhYNMIl/sJr0B9rW6jeSvi2wNKKZUZW2cfA19CKsj1C5uDxjbRFCbe9sRnof3GsUB/VFICHtl@vger.kernel.org
X-Gm-Message-State: AFq9FYJzF5nOOp7qpjVkd6Q+785O82izy9qfWVXJzkeBqia4ZmsjWkN1
	T9KXVJOX6Jv+HWuEDsRXKOMIM4cYp257qi3tnDvnqhFPB1FoGwVIqpG6qTvtYF35KH6HD0tJ3gj
	8KvCyvdGCPaimKqW8lmEZi3nkH7b3RD1FsXPByhc1
X-Gm-Gg: AYBFou3dQctN4posHsnCDVy8fAl9NrRv7uJfGxsApqckVz2MppyF+DO/dGJhsfor/+q
	tzTRcblhcdHHy3uJITizlq57mXA7B4Otf29FhaZhvO5vaNCqplOiehPUQdGOfLD4T1xySE9igY8
	xAKZb6wpY3wYFPMrReFfTcVaFZHPftlxD8tFQ7+pBQNITZFN/zp0ON9QSlowT22BxnlPTD1WDNT
	H4Y1NdbbKduuZUrgJXCLfrHuaJBxI3N3JhsVMDOJoTniP9/Kq/aKWR0yozN8iTrFHY/b1kj8RcA
	nbWD1E6m4mu1IeXm8o4gCmbZ2VtXoRReitEq+xWrz05SuKcRtfT46rmTT8c3SatyFFVT5YKQlXY
	nR1TrR/alTKNaugiVtO9z
X-Received: by 2002:a05:690c:6603:b0:8a5:1570:a298 with SMTP id
 00721157ae682-8b07edfeff1mr40474577b3.50.1791930513249; Tue, 13 Oct 2026
 15:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-9-384af01da3ee@chromium.org> <998a8c7b-82e3-4370-b0f4-765deccdb348@kernel.org>
In-Reply-To: <998a8c7b-82e3-4370-b0f4-765deccdb348@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:28:22 -0700
X-Gm-Features: AclHuK9UE5fFXMlu7KAnmwYM6JrldO8UdUyYtEVe8VXlPWtvlfdV-v2OaGNZ5vI
Message-ID: <CAEe3GZEuB+i2XS-GnGsmHaaULzThPL2wKT4j6QdMYbCCz47q8w@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] dt-bindings: input: Document hid-over-spi DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 11:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 10/10/2026 00:25, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > The properties are common to HID over SPI.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> No, fake test.

Will drop the tested-by tag in v6, thanks.

>
> Best regards,
> Krzysztof
