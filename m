Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101362;
	b=nxLGnPYC9biBCJggtOfNAZtnWhqgVOzPRkp9qIZlrvGqS3F+IyNa6D8DxstBNPK6NBxs
	 XGpsb2tBYrC8bOg2LxOGodfBLtCColIUkjm10Sl4bHu6rlYzNUfqdiJYIcRO9LY/30xhH
	 owir5V5X6DpU7ix/vjXGpVMzdb3uyS0/PR4K37iENKmulhzp5qhXbpcOGsoFfv9+5xnqo
	 61TuRCdLquXS5XdgJP/r5igxzmzlk+K5wYvEnmDrDQlVYtSwDeRxkY0gpo08oB9gmPAX0
	 agRKxQ8Vqjr/tfWTxG2JKvqQHl15e0T45Qw++L+0OdFM8qLAZRdkP3BZY6TY1PYYtuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
	b=XHl8mjExhwvBek9NIe5VMWFnmmG5NJIwIo3TVESnN3hx/YYGz7PVo0i0f1j+KtXJxtKR
	 nSJ1bCWSjbD7UPJnZVt8YcmfVAFL7Mc0+QRZWIHQDHXaXObeLh590ihrxTbFj46pNFn4h
	 RqbIlyV1sLCM7yOaRde9rKg4KAMJTK4SDkAxtPn3KoIYjKmT5Z8mL/AjMLeUJTQcru9j7
	 bVUCbG3gHPDLLbuLQvR2FK6CpaOhNRFiCSY9qtIjud97NMkMmnbEZU+Dpja3fX6GI58uf
	 G5UGg7qfuJIiNDqM7IWgzxFmrqhMwmrdnauUy+6YLe1sfsbX8tdI2+dIFTVb8q+pWLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b="Y/7BXFDF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC83460A263C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC83460A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Y/7BXFDF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28190145e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101360; cv=none;
        d=google.com; s=arc-20260327;
        b=pFUDORdi52KALpl5jJJEqqPlLxE0/2DzOp22jb5LWSbAAWcrP8MH7c9tMtdPUz8Ggz
         NxvmZGyuGglfrjZaMPt8v8yZO6tf93nJE1LuMavdAAnzPQCIQEle6sgyCb7axZhrOFp8
         5lo6JLiJWrx5w8dOGO4Hp7yB8Zl1++4/iZ4hjeWvm4rBMa8Hf5tZGvCVsLc6yUETg7UO
         sAhoNwq0Xg8oTGmIffa8vqhi/xHv5qoUndcC8E22Kfwx/WS9xcDnhXa1iSITuUUBP2fg
         cA04zK0sv80snybtDhnZXqEPKohjfhovjKuJShadwx6gGriA1+4Xqhx1g5WIyPY+bx0H
         EngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        fh=yJWdOOknwxc1/13BYI0hEDrdG9lkhG6uRA8opQljT48=;
        b=hkbk67qnPSgaNZ3ffdzlagcBzeMj/hA3WAY6MS4qUuVNA85G3xdsnAV+VRlaZSR6JP
         7eikSjNZsIT5q7b6VMwRV8Y8haYo2pcMuRJYM8CO3IUKE9X/xBA9dTeOkTFGfOv+daWg
         XMfwHZAHDmilGf+LCngt6ozj5vFNM2QVFuItZb461Xe2rBxIcOLX+4uaLYRVVlKBBIru
         5srdso9yAC3oGKno8MCkxOBrmmpI7ikYi+KmdyQ9QbvKg+pzHv2Rjk4mejd5gCw8wiwb
         UudXYcsYb+TCDNC5UVhgsoyQ2t2leg9N6Duzd8MhzR8oHJbHz7s9NL/mcCOutw+8nNiN
         TfDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101360; x=1795706160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=Y/7BXFDFr1bGIG2x4Lt3VSrQn3Y0/QVTTrA2wo/fUw2iVbTA3APTCRfT40/2q2iQh7
         25IfsocTo667Lsc5CQV/KUBrDZWxk549Zk5Xx71LQOjHZJ43Q6xKkm/C9XGf6MvEvLvH
         lkPsAJv33Gw+AR8f2GypSHuUCb6NWUOkI1KEOvDtA6s5vpg7bX42AmFtXMyTLwuDlztC
         8ORuCyUXOwQGwzMQRpFTPg5s81btq5BuiFpaHHQ9rOF2I3w+gC/FZuUd58+tfa/CELJ5
         McZUFyE+11VnhhxJ7eD0whTebuSxSWbSIlExg3BsbCtiOY4E8XH/UrTfqgCc8YfBLR7p
         d35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101360; x=1795706160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=rtG65/nQTM8mr7au0btHHCJL/2g3OyT53L75tiTdDsa34XEQ5J5xdR7V3r74vnw/jA
         SEuL4/p75WfMrz4Lb6/NuvYMAm8Rpdi2+eiTDsxK3FYAPzoFDozltYcOnh+yaPXqstmb
         i7y/SZrom9RyqWRAay6jKqjbseCjtPNkbE0UEshYzjXEMNmKl5OT0vx5D2VOiJkiqy0G
         f1FtbiGKffr544fWnBp3oW72AT2CYP/tSF5WXJjUBvxcc41F8jLaX3XlkzuxKLT5Batm
         VxfA2fGY2gSzihjBpsJT5yh8tOehUs5RhJcWDeVpBRgS0fQuE79L7bN5w75t9IJQFa2C
         aAzg==
X-Forwarded-Encrypted: i=1; AL+hErG4JWWjRFg9xgYTEyQcCoMnMnoFNE6hq2cG4FWMqGiF9HG4DpwHir/10a/hPzKFaSm80hteIbuA3ih0@vger.kernel.org
X-Gm-Message-State: APuU4Z/IJzaF1YToWqf8PTqOFlY1y25LYryghvLBKQc1TX/8SBU+ct69
	6USz3Km5rQnLqiIZ4hxoG5HaQgffSs0S1QsXxBq57AAYru7uLmhn0i0BkyKALEJGnlgiGwKYuFb
	xRygsClyevJEdGRlqKu+TzFoGVpLA/ESxxSizb0uHnw==
X-Gm-Gg: AYBFou19/SpCQH/vdZZrCKzBTohSPs0+9ZwFUBK/m+mXsxpd7fwzvoeYZLQSOVgsiDV
	oS3CWHc+iIkUzk8jFKavqj3z7hVCH0hVnZKMeuZnOtxDsGbplidczcarp/cYa75XQ58OwLlsCKN
	M7f6YttYClxsuIIiQZpiisjKIOJi2vKb1IshMfZNfQs9vQ5nILmQnv8+SumV2RpclAcg8wUVZTE
	r2zXlKitgk4zJdPiUy9MWmX5WJa0bFfzsRYEHZrM+6xJI7ov4KLq8h5KDH76FZgXWfqKn9tY2kX
	OqF/HN8Ey4xfZ2bYPG76XzpQ4ZL/xZfUGMjg0XoOM+aWGc/2ZFpgaq6ZTppeTwqlj/hTqg0z84I
	kmU1BPzDnOJz5ymC2NYvm5QNU0hEAIsQ0+DPCwdsDh2Xf1+Q7RHI5HoRKT0yEXqWXRYRVu+NEX8
	hY0+hn8T5CGnULXkyy/RpfCf1T+pmMboSj8gyHtgh6aMUrJ/UmSOwBGzUTILC5ggYTxPgoUfUWS
	6XM
X-Received: by 2002:a05:600c:c106:b0:4bb:87be:c138 with SMTP id
 5b1f17b1804b1-4bb87bec13fmr12856555e9.32.1795101360089; Thu, 19 Nov 2026
 07:16:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:45:48 +0530
X-Gm-Features: Aa3M54riNYPYm1hR-WMNehgnqK1cKsrsmx9wlvpLX0ldc8qDneAu48N6AszDino
Message-ID: <CAAhSdy1QdF3rA3bkKsdOe-pPV+JekgUeFB2LOirCTf3L_qjK_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> RISCV CTR extension supports a maximum depth of 256 last branch records.
> Currently remove_loops() can only process 127 entries at max. This leads
> to samples with more than 127 entries being skipped. This change simply
> updates the remove_loops() logic to be able to process 256 entries.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-2-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

I think you accidentally picked "Link:" and "Signed-off-by:" myself.
Please drop these lines from all patches.

Typically, the "Link:" and the following "Signed-off-by:" is added by
"b4 am -l -s" options so as a contributor don't use "-l -s" options
when using "b4 am".

> ---
>  tools/perf/util/machine.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index 076d167380f2..f1efd1120a95 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2334,25 +2334,32 @@ static void save_iterations(struct iterations *it=
er,
>                 iter->cycles +=3D be[i].flags.cycles;
>  }
>
> -#define CHASHSZ 127
> -#define CHASHBITS 7
> -#define NO_ENTRY 0xff
> +#define CHASHBITS 8
> +#define NO_ENTRY 0xffU
>
> -#define PERF_MAX_BRANCH_DEPTH 127
> +#define PERF_MAX_BRANCH_DEPTH 256
>
>  /* Remove loops. */
> +/* Note: Last entry (i=3D=3Dff) will never be checked against NO_ENTRY
> + * so it's safe to have an unsigned char array to process 256 entries
> + * without causing clash between last entry and NO_ENTRY value.
> + */
>  static int remove_loops(struct branch_entry *l, int nr,
>                         struct iterations *iter)
>  {
>         int i, j, off;
> -       unsigned char chash[CHASHSZ];
> +       unsigned char chash[PERF_MAX_BRANCH_DEPTH];
>
>         memset(chash, NO_ENTRY, sizeof(chash));
>
> -       BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
> +       BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
>
>         for (i =3D 0; i < nr; i++) {
> -               int h =3D hash_64(l[i].from, CHASHBITS) % CHASHSZ;
> +               /* Remainder division by PERF_MAX_BRANCH_DEPTH is not
> +                * needed as hash_64 will anyway limit the hash
> +                * to CHASHBITS
> +                */
> +               int h =3D hash_64(l[i].from, CHASHBITS);
>
>                 /* no collision handling for now */
>                 if (chash[h] =3D=3D NO_ENTRY) {
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
