Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C13988F8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472876; cv=pass; b=YrKtVae0VWsKjFMc7dw4wdQ7+OJdr4MxQHzjnRc2VuEXRPzyTvzvVpjNz5APRyK8pAvcJ+C+7WQ6pRF1pVSLuDUwSonvFXfb9h084rF7Jbeie49ndYkvAi55N0i1am+S00KijMCquQrR02Y2IQo3Hoxl6L7RlO/S0vOaWnKBfjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472876; c=relaxed/simple;
	bh=QD22M91Nspe/TjoO+S+T9MQpC25p/iGjIdF1pmU9kw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1NcYRTu9yd6FgEQn7cQsVDibnjh/AK54iMX4cGLkMsipmvhHdoTg7Z03WLHsCGnRdDiRnCREEazJ7DPIrufNu8QVWbl0YQLm9PSW5ezouxVuMAZastuEi54AhkZKSkziVqzA0vIzzsMVZ7SJCz7Ym+C8o2T1HjsG0nf/+KTPPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=mUKWjX2v; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="mUKWjX2v"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69d862236ddso6168968eaf.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472875; cv=none;
        d=google.com; s=arc-20240605;
        b=Cl27sLkOioYSKSauhzPl689LRoO7P1njM2+AsCoDTxdrM5tPj/GMGDdXv2pwTwGUpi
         do2Xa1Jid8XjAW9H7a44WpvgReFjDqpplXt5pWm7M0BAXfgvI7jIlzsCbYRmmPYU+pWg
         D0N6je4enNZeZAoJLdmYa6V8rVCmtVkaOxRMPvPoJQ5Fn1xeV2cWu4ZoXnKgf9Z0rK+J
         Gb/OWiuxktBrYLM/Wy1OV32Z1mtPjK8CTDwob27ziSVJXY7J9/q0VytAeKODMPm+DLuM
         jK4Lt+9Owbjx+4LUHCKytxrLNyUEZ2armhxv9bVOXj3tpeRbITr8hWVFgYqiZ5Qy72SY
         gwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+k5HhKFnGY0kgu/yR0YkW0s1E5Nuyc0mTfUNO8wHHg=;
        fh=N1DW/l2/n9GX8/BGKQfvuIDDZxmj0bs2Eksokhxy7J4=;
        b=gMjjPa56RzQsfhKNelmbW9uQFzfvdOX0qovSLjXf7za355cw7nAaX7lZ7GmRu5Wf1j
         RKcJLIf6MNtPa6GRLTGI2RKzWkOnvMYIEvxE8tcKQmpCu75T34+GOP8I4llZ4uIq0O1k
         d2plbO35dNTT3fmcajy5rW2fgUECncTiTkM8tcJw7yxCpkRUNfjQK8Ea+WTLW95nilZz
         PFTYTZJUHSwtvt7eofa8OT88htTgipyEY/Fm0znf94Jp4S95Q6w/YbGn06MK3czY9PnZ
         tNevfKh74qPg7zdnXcEmg2ljKMJ2h1k9GjhCS+FWeqS9KrTcfphXqE5zMyRuQsZNKBkd
         rrBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780472875; x=1781077675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+k5HhKFnGY0kgu/yR0YkW0s1E5Nuyc0mTfUNO8wHHg=;
        b=mUKWjX2vgZG0ySEidbQcSJfDeepYPQ3KZrSVPvcbS1MQhOCidQwqcmdvfi9JAWvTII
         A4fphvDv0FRKkZkcztcaZPWVxKsp5i5iGixxm6Lg2puApy/PU2fQ+JO5+4/oZUjAe/8s
         NX6WcJpywDDe3I2ql0ApzdiY66pCuCGWFgzdRBeGf/soHLnwIK4i9Z/+t1abYnKl2/dt
         6LX2tPmB2uqEftxjnWdHZk3aZv9/eK+r6bR/9z5oaNnatMjyAf0vD8KL0tV8qINTXlhg
         PgzD0VMC5xfzR4bgJFQdkeKRicQRwVd6CPl6lINPMgyWwZ4cbgZD/VRn8aRrtHHoNLXB
         CHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472875; x=1781077675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+k5HhKFnGY0kgu/yR0YkW0s1E5Nuyc0mTfUNO8wHHg=;
        b=Z04vFNItE+P9fEU3culRhMR/lNdGjaOdIMtTXLDhp7PofsfrW5PuvQxCcZMSyKqExY
         S78G0LxprkONlALfyIg+JAwSJTJotkYQDMQf8fP2sB2OaO1RCg/kcBC5Df0VvkS+o/Gc
         bJstlLCmSMLHwtKcazQ+vM6RUDXZrEKRMNajf+rSlVMSnYRtFqN4/mzUP/HYTvMR61QE
         wkVND3Re6uDX0KqNOqUJdH23CogbDXnzFJ0/I8dkZv/GKzZg5gD7jmZX2p4D1lD3nsWP
         NG9BJZNxCGPjW0YDED0hoi9sYWSzSI9lPfRsxUaYPu/I0mod6JD/jtWXUTmbvZgE8HCr
         bWdw==
X-Forwarded-Encrypted: i=1; AFNElJ+Du6EjpKlgZBe5F5jV46WVGYH1kda+iWAZfiezpNq/W1mG+m4eIxTsvIALBI4cQFCCJsoJLLe1bwd2@vger.kernel.org
X-Gm-Message-State: AOJu0YyhDeFwpkW6NaLy+pmaZ00fm6R4Z6wn/Z+64/N4rAjnzW2gn2Lo
	xoR7FWjdNitQXoQ/6PP4zFJvcUw5pupUlfEB/OWBFbLrI0DXqrovhBC+4aGr1UMj6IYDQGm5tFb
	mDkbtQxFRiwUCYJcxEhAxsEzPiiys2QThiW/Mzsbqrw==
X-Gm-Gg: Acq92OFrrqdmqDBla5oNDotAPH5YR72x5xum9fulORRZkvX655fhSKmWvjfP++Zcll1
	UWn1YHimYDnyARqwebTLT/pMRaSqWdXYw+7Kj5wEpcp++z5S/R+FC0FjWxBB1qcMICFYlzSDoh2
	Frmk5vgFJnXD38EPFVzOTFAwT+CYvK8+cRKGweH8n5zxKrZE4AqRfaqsCZlZEyP1sTylv9TE/M8
	G8fEFQkma1c6PSYjXzFH9nwgcASHuEEkTfL++xZJgiAAbQ7D/SI6KxzCQMFyFxMRvIWNyMkRULY
	jyWP0lPj2p7JtSNcGUR5tEMWyIwmvmEGN//Dy+rxota5Xu39kxhUc2JS1Yp5W03oHQCVHuetYFU
	U1guT0Mzgw4d5f/MBB4CbRwChtiT1FrT1miMLuA==
X-Received: by 2002:a4a:d742:0:b0:69e:3e6b:c05 with SMTP id
 006d021491bc7-69e480d703emr947479eaf.57.1780472874785; Wed, 03 Jun 2026
 00:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603074222.593243-1-joel@jms.id.au> <20260603074222.593243-2-joel@jms.id.au>
In-Reply-To: <20260603074222.593243-2-joel@jms.id.au>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:17:43 +0530
X-Gm-Features: AVHnY4JfStX4mReWrm-Zrl_ALhOyuCAG6AKst28Q6jY_1MMSdONlNPi3BurP8HE
Message-ID: <CAAhSdy0VgZd+7x0j5CZTj-9D6n4=UehzKZKp0nzTBpmuJESqeg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 1:12=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote:
>
> Add compatible for APLIC in Tenstorrent Atlantis SoC.
>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d2..d4e17861eda4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -29,6 +29,7 @@ properties:
>        - enum:
>            - qemu,aplic
>            - spacemit,k3-aplic
> +          - tenstorrent,atlantis-aplic
>        - const: riscv,aplic
>
>    reg:
> --
> 2.47.3
>
