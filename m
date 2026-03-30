Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C03822BC
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897766; cv=pass; b=sCpqYRoQp6JZ44VbRzDpEhFzyHg8ThImOWClax5UCzBACrZZ6UnjTp9qqRhwqhdPAfPI9UTDVtCwFQqVnyY7eG3r5GpGcJS4Bs7/cqJFiASLhAp+pZAuI/SgFLCspyzAYXwoIgozN9dN4XimX/Jw0+QPNObonByk7lSs23VgF7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897766; c=relaxed/simple;
	bh=tB5UvVyyaW69TUSaiIcWww9fyaZgzM+cWqkdUMUA8D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyJ4e3aZWKfYNg19w5f4xgTTxlI71DkmAZ2n2jVXfDmw2AbycUSgu+m7UG+mSU/ikrzM6+9zHu9kbM6BgpRBOqmpNhs9Ub5CTaSRTruaoeVhv96SSbTa6rqPsFn5CJKcln7X7rvSLgvh7OR8skbvDJcBOmwT+EZ8s+Di2GikeBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQOGhrm3; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQOGhrm3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e4989dacdso3943317e87.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897763; cv=none;
        d=google.com; s=arc-20240605;
        b=YyMyqZdhBMs43vM3NFSmbYq+hZPPgsI6wzguhlyLt3sfFc9vLGOoZAaKBA8urmopAk
         ZX4/QUNf6ML5n1FQi8H9s2vLtzQLmR1qFl/q3k6pMNOARZnxeB7fRFxREPPx9bMxRl9P
         slyu8FQqvWXMjEKB7TcEijU404CSBaVmB16ndvgPBGR5USfGopHSrnG/5TshqtFr2H3c
         i7k0k38/m88J0itmwyasqg3K2KW5LWt0Dl46MnxJ6656Q/Qv0N/iQyycr7oDxUNC+BCT
         kGNb1pufdVPKyn9aITKLkvTYhWFk0hFn+goEkJAS/a15J+/jM/0XogstaMa0WEJItl8W
         QplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncDn/XtFsN7SCJcACGkW9Af70bOhZca63Df9xP3DVOk=;
        fh=+bltIJtppUg02N2WN/Qq26mLkmteWubzJufcm1P7H5A=;
        b=Odqy/DikctOoG10QuqLnFXFoh4SvQ2IiE/SzCMFVXecKArTDUcYyE4sr15CCA1CXz0
         PN5zVVPgg451rs38y6lJkMLbCg8h7OpsC1hBszTvl/DKPDRWOs0NVHMkMYJPaYVQPezM
         hpfRyDtob9c12P8hMb0cHdUQ7vq0lSmQ+bKUCYNJqawwskK1ZrBHFhnFT5KFnQ6NMELO
         b27eBmB56x77pZmMHTqHBJ0UCx3ToEl5gKtnsPHEn8PgI+wl1/4Sro3URozq7cpOIDD+
         gZLSuOR0yislJFTAMqyUbRmKO69SS0Q4kqDXMkkFnq6UGXi8OtVRf0MoMMwO3WKXvwta
         McpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774897763; x=1775502563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncDn/XtFsN7SCJcACGkW9Af70bOhZca63Df9xP3DVOk=;
        b=sQOGhrm3oLWEwGZK09EbqIiO4L5DYmtsOONAIoW+dg06/IZjdiW56Wi93t4EFxmLWV
         T9hgNwuOQF7922eQUGK1A8g0rD9HBpd+T14CLdnhc2TevfBtIrINTDDbh4pezY6UrCLT
         G220r2td0n63/4c9S7YRcso6+hTgpOFVK4NhW6LzOXz00cwsXpvx5hP1FOiwQAPIhWzI
         NQtnyTVdAkxjQMVIvUVbgbJwHSCWwtieTuhlliAXk/u7sVAcc4TbbE5Y5N7uHVs+lC14
         11nLR9RjHe7qgOp8dvLhV9znxiTALj+K6vfAXm1bx7c9JLMuTuL50YjxvnceybTnG27N
         ukAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897763; x=1775502563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncDn/XtFsN7SCJcACGkW9Af70bOhZca63Df9xP3DVOk=;
        b=AEkunzy3h14ikgxDxNCFX1RIpPnQEkfp9ySKYSsNMRtoGskbvbF/hDh+5FtOwHg2I/
         s1G4rMVFldvaD4DGP3igpMpQI01o/tLtDSRHQs1I9t9xm0em0t78S6SfwTmI4TUtHfu5
         KcfSKb9MT3PmY1kQXLCHIPtfa2QtsD1EsjWlKSn1coQg14mBbGi2HC5orR/lH070CHEL
         7pu8uYhfHO+cgYhznx7al3eMfzpIPaedIkKGf2G/aCwMOH/yFnoClBXtQ3bNj5iJhsZe
         AfTo1bDzxGY26I9Ff2lTsnCZ/xLlvtv8RxcVgI+vpQJ82iS1465AlH85IX5R0PUKe5F0
         3bDg==
X-Forwarded-Encrypted: i=1; AJvYcCWxn6/c7TBg+znDlRCQQIa7iK3KuR1sdcy/KP4RYmj5AJvQfVku5jbCyxXvaWILDUOiJU11C5t5/ldD@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpJ43mvnAwCul+8IO7W7ELb4wT5S/WbIokVkh7r0Pn0KviYlH
	lf7X/AiFu2iNv0pFPfzkU+TM4ZI0xhOnYjbJz5LiGcyrJ7EHhdmg8aRUaQTm0l7XGq7F256uBKF
	Mxxj0SxMv3dEUw8OV2PF60ofY1niA1YI=
X-Gm-Gg: ATEYQzwPA4n0v/fvN0gMy9pUewSwwx2AZt0sIVfOOqJnE8IZgFDeFlTFaU89HvyJu7B
	9WoNzz6AmkHMLn3O6m0j+kKVPTNpo9bfy2pi4Q63NNYL3UJ/vuf/ODIrxm+4n8c4vKtT8N6y/9y
	MSnjp1VFE5UvGFbqDJmxPE2NROzp6fcUdIRIK6oRRSVLJxTOhgpLE7f5dzRjM1TP92IROTddWXP
	/5lei2yBzGQ4hu7y+LDPGDYAFnrvOFZEAa1tepf0deZ64WmS31dqIN52yJoNe3d78erIrPrz/uK
	92UwynZbgutSM76BcavqORC/0Rt8lod+WmqnSMdi
X-Received: by 2002:a05:6512:2252:b0:5a1:3bd2:7330 with SMTP id
 2adb3069b0e04-5a2ab7e973dmr4325669e87.2.1774897762975; Mon, 30 Mar 2026
 12:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
 <20260328-hidden-secret-oriole-4dddb0@quoll> <CAEjBr-aoOhbtZWdYvq3rQ3q+2SKUEctTXPdYcoS4mJyrPf-Yqw@mail.gmail.com>
In-Reply-To: <CAEjBr-aoOhbtZWdYvq3rQ3q+2SKUEctTXPdYcoS4mJyrPf-Yqw@mail.gmail.com>
From: Padmashree S S <padmashreess2006@gmail.com>
Date: Tue, 31 Mar 2026 00:39:10 +0530
X-Gm-Features: AQROBzCe-fvcq-uuVF6744K-oAtwxP-D31BDOlh2wjZ0d72FF1zcLp7Eh6-lIYc
Message-ID: <CAEjBr-ZKhrh3-C+xYLamQ-+ukg12u8McWj+MbUp4QnuOUvRi8g@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: k.marinushkin@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 12:28=E2=80=AFAM Padmashree S S
<padmashreess2006@gmail.com> wrote:
>
>
>
> On Sat, Mar 28, 2026 at 7:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>>
>> On Fri, Mar 27, 2026 at 05:49:18PM +0530, Padmashree S S wrote:
>> > Convert pcm3060 to DT Schema
>> >
>> > Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
>> > ---
>> >  .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>> >  .../devicetree/bindings/sound/pcm3060.yaml    | 42 ++++++++++++++++++=
+
>>
>> You sent it already after I asked you to slow down and implement
>> previous feedback, so this has the same issues.
>>
>> Please run scripts/checkpatch.pl on the patches and fix reported
>> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
>> patches and (probably) fix more warnings. Some warnings can be ignored,
>> especially from --strict run, but the code here looks like it needs a
>> fix. Feel free to get in touch if the warning is not clear.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pa=
tches.html#i-for-patch-submitters
>>
>> >  2 files changed, 42 insertions(+), 23 deletions(-)
>> >  delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.tx=
t
>> >  create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.ya=
ml
>>
>> Filename must match compatible.
>>
>> ...
>>
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  ti,out-single-ended:
>> > +    type: boolean
>> > +    description: |
>>
>> Drop |
>>
>> > +      If present, the output is single-ended.
>> > +      If absent, the output is differential.
>> > +
>> > +required:
>> > +  - compatible
>> > +  - reg
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    i2c {
>> > +      #address-cells =3D <1>;
>> > +      #size-cells =3D <0>;
>> > +
>> > +      pcm3060: audio-codec@46 {
>>
>> Drop unused label.
>>
>> Best regards,
>> Krzysztof
>> Thanks for the review.
>> I will run checkpatch.pl, address the comments and send an updated versi=
on.
