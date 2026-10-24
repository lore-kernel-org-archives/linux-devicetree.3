Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792803559;
	b=DgF7euTmEoFmkVOxeOkPrtWnIlZfpn85yE4MjszXF4qp4eYtxtqnxXgWmmu/td+Wdy9U
	 91YMBroU7/xw/PPaQ1qEo8TGEKU1MWa+Nwb1HC8VPOdJifGprHc6ggxCYdFyet3+cl8AM
	 L1HlxT6VYdHwdgDLcBMZ0lqcJ1o5A+69FsqNRr33cWVGKMZXk1fUuPFdJeRsTugKGFLAk
	 TC3eNT/XnGvCDiSIGkNF8xCRs2yiH4Q4yQdQJFYFE0igDFj0wXGct+qj9ZtJHevOnV7s4
	 Q+I0/Tk2lYt9yYlU6XZ1O0IH+K4ei7RMnKwubKeeYTifONeB7+hDRFT7/d80uzNCUrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
	b=l+W3x/AAcx2f51pQApQAyshhCXh2dfUFwJsktNszw7SDp9SFW9rcoj7r6gqYiBNgb/uj
	 3NmEIP7yyJbGxqpAlDkPkTxxlWOxhj9FTRMC/T5sj6PXejjDXvFEY18Rz0jaSynOTc3eA
	 x3dGP/Arf3R/RR5S8wU4y3nlWNBqKYldZwa4oqeMXsewrbjTOLQU4ct2YzDMwXWlnC9XB
	 omHUOppbeNOPWhvjdfx/F5BNFMERDE7TNwgqF+vDYn/L1dtlr4A7svoz7x9ZnTA/gq9Hg
	 aYS/YWmOlQh4n4YENK86UwNty8lhEeO6qmEXeW6DDqisHVVgaHYXfIOPS87csYQ4Z3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvNnJ2qJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE78606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvNnJ2qJ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-16079d54c17so2916708c88.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792803558; cv=none;
        d=google.com; s=arc-20260327;
        b=rkS0yHK7w8gr9V7JDri1nlOfR5cOHF6lgcGB276MYUiPhqY7ISzWSfHGVlUisVoM9Q
         Mk3RrqKOVj4gc3iUg+44CDScs353a5Y7BDEhtaGW63j46wprFb7/9q/rQiy64AgrSAFc
         imxmUj91pwGrPc8IXpN0CuPrE+ElH0lHRKghe670zolUa+hfHCcyCEap4Bt0cRDsMY4s
         7Kt8WPewQAUJ7BU6I/OoLRd7WMOGEW9Aiio58EyqmHO1m+kgEhQnVFSh1NktMlZ5KTNS
         b/HNYG8omKehF4ue9NBtPxgHr9kvOpfjC2ez2SJT8nJEusNrOckxWxWc4V8eqUskuhyF
         lA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        fh=zkV4CXec88BzwpmqRdj4lN6sZk98PmIplvOJ6uU2Kqg=;
        b=b5I5zRoBsag2LFw9KOyIrfD0hF38R2xqZXpthsMxTyvkcitGfFQeVGil0/3w94Osyr
         EObjNLvRI9jGmOXJUBICqw2wzXwVwi8YApBeHKDa9y174ponrEPbWJt7FBH3sKA4Gqhv
         k/Cs5UfN0OFfTCs3KeloVrpdvehmAnfSIBSa4IJ3W+z3Rv2pXOASD6l/xbkQivCUfy2i
         5/dhOPXMp+Acq+D+NPZD7uyUfZQgVfpY1u9OXy9lR98k8mnkt/Pe1UZoFz3LdodYN+e0
         iLNArSCiVKgEDByyMvMZ+9y5VGkqzAOybNOSXmE2JMh/4P+h8t+QV3oU3tdjBg23AdX4
         C87w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792803558; x=1793408358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=BvNnJ2qJiKNYx+kMqLstZUfLbZO3SWFMHIFNvg5PlmWaoOBd1ZXExM66HZnXjTCi4S
         unE6rjajRqY8/A7SPEfI+4LBAuyuJiZmoG6Q0Fq7Y+tQ9wmZa108XB9h2/Ng2vW0Xp/b
         AuD3gZTSlSYuSougzvuYb2iXNty1CyVxCSA205hal/Jtbnmth7kFubu1V8Iv8Z9fKKNc
         jNTDfuf7/PVrPtMco3654bq7gxYWtmwWshbc7A+9XOhzjwvfjRy6RUeLptR0GdzXx5k2
         Z19S16Xi3RX+FXqQpE5fkAoh5JaAMd13ZeR4cQZkBBCyl5sEOlwgR5aS2wARVCM7yyxc
         16ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803558; x=1793408358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=t1TyMYE9D/O4mf9pehK2NPbYTZj8KtwT6tqBitjEomocG6y/jsv6MbxV7U+VSUuEbj
         vmVwFazXnvKw/Smo+0kvMjM/Nn0YDueYN0JvCGMMIJ3ndB7wYFEUVYHpByqDl35op7Zu
         iyImCZL//uM/1F3wCWlFXOpQqAoq4wykVRhS2VY00TPZmvHyTIkdFyvzFrDmWCcokns2
         tbb6xd1QLBjomAWXbVF6UshwtJEJ3cFZ+UKGc2v0kYFMncO7xBH2P/320o/CUbMGo0KZ
         gXQVixt/EvcAQQIvILmEWb19k+5XYgIeNJCd6eC3jnEzxWI5CztPWHg78wqPHxwh9afU
         dQsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmuJL2xgvVM02eGwkDMn9MGWogyrZ0WmvoAxrvvsIW6oPgE30mRYPir5TGQnhmnR8rJu54bXciTmVu@vger.kernel.org
X-Gm-Message-State: AFq9FYJvDc8TYkYQOOJKPOcrop57ysyuGRS7LMbLAkzN2vLU4+WGQ4Mw
	eMA2qxlxgqP4Zqiw6B91C6Xm9tbg8iKin52bNW4iO47yWbAiiOw9sBzx+H3ykDjCVJMnPmXn4J9
	ecGTSfp68gq03AuZNB09HvSoLEKCE/3M=
X-Gm-Gg: AYBFou2Kt/JSElyceVbB98i4NKFQgm9YIkv1zuhMKZw7uh64DwE+HKFoXgZhnrHa9r8
	Tb1KGX4Yc+aW99siszkG76ZzdtpDkNPNXHaus1jDUmXT5TWme/Kya0qjYEBDkCdUUC+KVvDr6Ky
	Q/edujm9hSwkcoPLQ47BnUF/8iUjv+yZx2PWT0H5ZmnhJY+9sXI1M/+UYh/OlOAy4fBjkIQ3Pb0
	JR7G7xMYRd3dMIg33ydHwahWyR/aBtWKuIh2VSULjga+AiJhvHEmUVQHXLzG+WqYA7TJEoZmNvZ
	CINCqTZlAPrvz0BDiv58AbPnFlw9cZgV/BDYUH5AJb65yt9umkJP95wGhCMryG/oC9qC0MkNN89
	rksBwAtT52GJwr1jp7gfKMrSq07QkUJeshRLw1Oec9ppDtW52sjauOstd9zEpqL+QAg7y
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id
 a92af1059eb24-1992a250624mr874553c88.1.1792803557836; Fri, 23 Oct 2026
 17:59:17 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com> <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
In-Reply-To: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 24 Oct 2026 07:59:06 +0700
X-Gm-Features: AclHuK805OtpEX04XfOwa7m3QcwJPrF0jSlDAfdHBuylNxB6UZKJYqAFi9tMyjQ
Message-ID: <CAAq9HC7EdA3proF75D9kKa0QFJswV-bFp284u2vUfJi-dcj2_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:14=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> > MSM8917 is a single cluster SoC, so powering down the cluster means
> > powering down the whole system. This causes two problems:
> >
> > 1. The system becomes unresponsive, even to common interrupts. Waking i=
t
> >    requires an interrupt from the MPM (MSM Power Manager) or scheduling
> >    the MPM to wake the system later. Linux currently has no way of doin=
g
> >    the latter, so the cluster may never resume operation.
> >
> > 2. Entering power collapse blanks the screen. When the state is entered
> >    and exited repeatedly, this shows up as visible flicker.
> >
> > Even if MPM scheduling were implemented, the second problem would remai=
n
> > and it wouldn't fix the system being unresponsive at idle.
> >
> > Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> > is less aggressive and can wake up from conventional interrupt sources.
> >
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
>
>
> https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.=
qualcomm.com/
>
> and
>
> https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0=
d5638@oss.qualcomm.com/
>
> are in flight, you may want to integrate/test them locally!

Thanks for the tip!

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
