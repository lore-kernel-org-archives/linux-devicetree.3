Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794590724;
	b=qIaWcrW2AmLbWNFr/aWv98R2GaBTc6exIFAYz4rJVLT/w9R3+lf9bdpl6ruDmVPdIrc/
	 la1hUWEjK3aIliMJjaA7OJ5aTiSCO+E+Sm5KKcs0hpFGl0X/WYboBSPZ0mPjXVmeS5aq8
	 WU0x1z8uHkatq4nOMOS+NNNmKiDE/heDSUnEmu1BdiVcEDRkB1N3iHwGZrSP7EEpefZ9k
	 rO8f4RTwbZENLZPMSdsgSG5dl0bxDqTAjXScnQ0h8883rWZ5+rQSccBKA3Xr2x6KhXEfK
	 9mx+aUTA7C7CgQxzay3xguq9zZvilYnWrXkdPgv89CMVw+ecP9JPs+wdkQe2TWov2Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
	b=Hqh3PmLUb9mj5p1bmArzQrLeCxdDPaEnpin3VcbbkeiKZpiUcG5dhM6Rfh93I/u5JJtR
	 VDDFh9AbTuNyGXXgUSGuDXMaloY5g0QkcjvR3CjEas8o1Bno6R3D0TF4Wv81Uoq8T0ymC
	 u3eb1jW7k408OfXSOoBs2ux7VLYQER2FzOWd3goAMA4ii4KPLsMvMDJPv+n9e2H93oyib
	 sHC7D3flArXAnKsuda3Vf22zrw2SFcIrFYU1Kbx7G0kzivfgIDq1l6pvJqlOoFBwjLHma
	 CCw8/GWDC3njuFJM8z8GdQ4fzfonile4miJ8FxiDkTsFn6re+Mp5uMiSB3QcMXoY7pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C4UEmLeg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE2607A5F9
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CE2607A5F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C4UEmLeg
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5383c97c8cfso473591cf.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794590723; cv=none;
        d=google.com; s=arc-20260327;
        b=dKrzsVFi6TDlVjZQgpdPf83R9yVsUgwBUYsst8bu+Ut4D412hWAq2gWu65d4sb+dfq
         Ehzgxsr0P0HTwd5nvNpPA2h8rYaNmYruYFSRg9dzDueakzHVSaLAUyjOPEYpAtMUMM/H
         iXaCNm5JHz0nBifYtfOSLyFvQU5MKjVothYh4WvtsyrX7acfb5pdoyXChwDx+46uYHm2
         QZy7YuAq4v8czGYrkINhdRKf7V06shJB+VtCIzMReSZNGj7u1LvffQlOyUmT8fkUESih
         a8eSrFuPWtCX+J1IJ3LSL80XFdeaA4DgSwf5VhV2RhmXmq0efPGKNAwNRkG4Uvd+p7+t
         OwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        fh=3uZ7WwszuFZF1mDETp2o7s/rasd3xX1Cq1U6DV5b2+s=;
        b=AdaA7w7rFL0w8WjQicLoUDQHiN9XJh2v2vevPaHlKD1Vd/NZxCweekhe3rlheZSrDN
         cZk1fUASbPBPTfBbrp+r/r7Ey+U1ER8l7TTOlpLydihM86L/dMqUpQnonYA4nQd4yqOy
         A/6/nNTERNdTrCvtWM4SxDI7NofqNuhwukUobp1VdIa3xQyAC9RWFbVnU4rmoYYwIBRF
         JYqg5nWHsBv+JYFEIm8LWYiDNuDCMpqigZc6CT+W1xdhRZCkV7YJ0Uqiaw+ou01F2Dbb
         AZoSnY+B6yMzA0uHOU+v0eOQTf1CI+JqvadPBWANFfJkx02p5nBaW6z2bzVMFcWP34fB
         OVqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590723; x=1795195523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        b=C4UEmLeg3DogONw1DDx4wz2PheLHQTcZfoRNys3wCYZvrYOY7yTwu1rM6K9zytWBHB
         wepUHEUNef/4sfhmG6DOmKkATR/R6+gjjoIP4DnXD65vYkIN2jby/jkBVuorBrR9G0AD
         vmWlDuSED/YStVIm6dny09ahfbvPVVY72xN1/sDWOVcH8T+fqs7P6ITSGuZQCdQUYIQm
         o0HvcyYmNrnvyJ55H6ceOISbHrsz7yCegrkSzVt8498kQCy5UTmRC3KriqxdMQJbh6ct
         9wAeZpKJNf3IyEf2pOd6owiDgFeT5Mg6pa0S6No6gpHp+cvYRdWDrOPXH4R3WJBXUdhA
         +hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590723; x=1795195523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        b=2zeXgZBm4TuselSWSUDpQvRTOWrzxhtG5pugx6EOIeUUeJrKS1bqXr7E0iNUxo5Awg
         RssWcLvMktqJea9jFM51cDKL6W0d/miii+OSAI9IKmZHJFqy+zJixLK4jLQx5tpSjYCa
         9SbWGM7jZcwsJOv0kFiOcuzzog2faujpuZq1YHZsHhJvcl0oorwKFYejtHRNWBAFFmqD
         X0EO47pmU1RZ3c8urksqWvySggaDk5a1jMrXUTt30/YCiFboLymzchpjDgq42R6jnWJN
         jeIjaA/xVwAgVpa/lNYgPseVxHIGMFi7V1TMoHAa/3JFybe9xh9OSW/DHkXxsMktfGJh
         vHJg==
X-Forwarded-Encrypted: i=1; AL+hErE9NAW7vXDRyOZBkvqRE2cYTU3d6znXSbeHFr+GAw9rth3WzKf/YjhC5GQnpi0BKnVfiy8XqWkb0ur9@vger.kernel.org
X-Gm-Message-State: APuU4Z90t/tX/8rcLgOYMiIf1P0McHZ+QMnnuYYnl5jMaRUPTejpBR4+
	me83wZV5uQ+2VLj5aLLYM9coF1pScbMw6IXX330L5WRykIwuoKvF+H9bpbhOv2AqJI+rc+hL4NQ
	bh14rdvUrVrpElnaeFnDmdYXgZUoFTI6wPsJ0hDMw
X-Gm-Gg: AYBFou2hLDqx0Dgdcl1NGek/HSClREi8bOyemKmOsp5kdBXahAWebVWL759sQMqceuy
	9MNPTy3uU8CqjM5fTsFjpbT7xekYgAONXO5wMW87D8VzInP+TbHcgk+Mv9/KwLbHBIJjISoTw2b
	U0HwLM9Q28YgEa0itBP/jENUI5Tc1h/oMjBe7PXpoXPyWimkj3C4f4Y3oLrvRSheQYLDKxl/T96
	jy26whsbz71JRsM8ur/RtMPU2v/bFL2XgsZT43JNX0CY28w9S/7ACAFi9+6hXabEMbER/GJAPXs
	qkz0W2eJXrEBMNWcDko6NNeYxUP2vutcU1EvsHDN6UNg93K3K/vEbYm4ZKSH0qiX9wXtyOXTcr1
	HPHmlg41h+zEk150n75G7MXTzq8a3dRwL+Yvddb+L5Hz+/4SewZthTSFbN2GRsCnCCOejQcDopr
	1nDP8XaaAclsgZoqfdiWRHW3K+
X-Received: by 2002:a05:622a:1c16:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-55afd32373dmr16424331cf.13.1794590722631; Fri, 13 Nov 2026
 09:25:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-2-vamshigajjela@google.com> <20261104-rebel-kind-rook-abaab1@quoll>
In-Reply-To: <20261104-rebel-kind-rook-abaab1@quoll>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Fri, 13 Nov 2026 22:55:10 +0530
X-Gm-Features: AclHuK9IMsUAoa9IqlG448fs1zfhKtF22rMEISKsShaTjjacHR2eqg82hFisGkY
Message-ID: <CAMTSyjr11ZBqwhnnKpmw2tcRirvEctBOkO9AQeG_sVUW79Q0cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Nov 03, 2026 at 09:56:05AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
> > Limited.
>
> There are multiple smartdv companies with different domains, so I guess
> you want smartdv-ips? Or maybe all companies are the same?

Hi Krzysztof,

They are the same company, the IP databook uses the legal entity name
"SmartDV IP Solutions Private Limited", while the company operates
publicly as SmartDV Technologies:
- Website: https://www.smartdvtech.com/
- LinkedIn: https://www.linkedin.com/company/smartdv-technologies/home/

In v2, I will update the vendor-prefixes.yaml description to
"SmartDV Technologies" while keeping the "smartdv" prefix, unless you
prefer otherwise.

Thanks,
Vamshi Gajjela
