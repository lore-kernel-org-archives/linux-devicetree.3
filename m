Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794300010;
	b=SvSoJmXe3lGTeqSYmW8fbhqVE8hMFfEgFfMQORlKx9syJ8UjqsIWOt/CtEhSGlwlp76M
	 z4Gju4ZDsVHxiM05t07RThzlRmT6Y0HaJzXoNNt+FcOVSR1zYHpeiHYK5kFtCl3e1Yo8x
	 GxV/pT3eQ+XzX5CjHVz1RcgAVmTwhHxb+f7yM0XnCtC30Qd2nxWGIX8IB0WFmTXq9WJrV
	 ceGNP18OvhMRlkwOFO1BFVbtiSnArnOn61CIn/5R9ehdbE/dY0CBlH+DNhwThUeFzkTWm
	 nxJDj1d3j6jjT99o7IAs0RwmME8dVbWxUZR8JNpih8A8g8peNXxNMy8egG+ood6EdXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
	b=oUDJjCZbRYq30QGc4xLlxTeZ8yjxkvYCQKZdBLm2NLfK2Z8xIoP+6v1ichVEssVerdzl
	 +jy8GoNHdcAnTJ/jlWXKB54VLypJjH4Bw47ETRmiTA3N8bxrrTcivm8aVdVSyr2leDZ/c
	 7I3Tai0MVAUVP/GKZq1qkp30KatfvFr6kpJf0G1kidnSVU+TNnyq41j4H1hmHcrUkjUsz
	 0/qaj/QwjLmL3E1tTXbGN09pQ2dOLZrhk7otMRlvjyvhcGtkVTFARryBUg2jHN2nXkl65
	 RFhdbGA9KxuJ9sv8t5B8tf+e6ypiBAHFyFaj86mwbWpIlNH+OMXWWYF5OBDgnAZO8AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erqMJc61;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E981606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E981606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erqMJc61
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1479be604so1109636e87.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:40:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794300008; cv=none;
        d=google.com; s=arc-20260327;
        b=s4z+vqK84azc5JJHCYDsg/yKH/vb+Hx3iCpuDaIzyN0ScZ9XW4B+IfIV3pZ2Gk1zG6
         44iB29KFq+gEIzXlTdIndDXdJ7i0R2TM/ZF9Z3Orkq6Y6i7a9FcBeljh/je8mZZ9Ra/+
         IO1otWNRVB2Cd4iInPJFD6t2IcmICaDEqkugBHHptkQOVDwxfMOgvyK3350kQGmoOIW0
         MR1E4j6C4s2Nuosx+MV1SgRZ+RzVspF4kfANoJKUI8i3pDHfJjyJKKqgnbdc9Ezr77Ik
         J7/6jMbElGKJ3/hutwByBGlCJQhfA/6eCA4vRy/hHTWwTAx+S5NZaW813o1lrNtiQY7o
         koog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        fh=nrZWK+2CWmyXiRAxUXIJ+Xt4oXhmvlzK1/2Ylwm5FWI=;
        b=aWk/YWV0WOhOxvZm5U/mav29a438Rz8v3OPH0+yVrlCmgqwiHjg6j4lvvY6eMicrOq
         z6RCrwCQyQIaKkxKK2ks+gQUDypNC2g0mAV/zDDkJNG7hh8BFINtIeLOKA88NeWly8vf
         F7QIovGcBQIVcdCXZpl8PPP39nq7nv/Iq/CeApJ/n+JTUW1jOiVUMW5WZpYle8rGTVoX
         QtV1/xJJl1YPJ1iVv93MqYWs1kqMGMjLGr0/PnN9tBK80LYzfSzQHItsu2cp0muUSpyK
         zS6QpcCOMtoVWsDfbaCzBoV82X7Ux1E8idD6g4Aesgtar9zialzIkkjnAgR4RfifmqqT
         T0fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300008; x=1794904808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        b=erqMJc61ecf7vlG4d2tdf2CJFIC2b07UE/t1Hn8pPjq0Vch3Q3SA7exnP5cF4AT4Yc
         dJtDL+h/rB28g2pKXnInKB819XzQLiCkmE2xOSc5SC2tcGr79wdf7AGtX7qMlMDDLeS7
         YYRUCyA6U6zclh9KAk3319qyCV3E+CxNrRuttwjSJ7u/7YOnFskrYT1r2A7Dv5SE474h
         QAy62Ib9cTCs4KdAJ/UltPLBPQ5TqFBhgdJp+dhQaDU1DS1plgG/FkiXTg7FbugqFqr5
         0alUNHmUGIzCXKNyBBobL+TFPAKGftnsPnRHrxQHimZBQd1KEVCaAL8Wc8UfR+2jfNXA
         ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300008; x=1794904808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        b=nfdfloSZJfDiWsCrzn1Iy5J3pZM34hdXH75PyJhNPmhCLksDWjECu38/jntGx12poG
         cGvyxvXcr3UY7HT1Jy4MMLf3J/i/An89Wbtetvfb5yL/5zyWUD17ENYEYoB3fyzG4jjh
         FsVgTZMzwB9PH+DlmUVM0CaxgJtqyO7Ukdh5F+qloSuQMqLSn6QPcBb27nVsMaua68Bq
         uzhMl0G4dgKcCiw+2kz4Ejw+zcIfuqxb5pDgWsKkAON69jVNv5l/zMOsuszZV+Ojp4sB
         Ddz+bbzE3kzhb95GqIzaEOqSRcxIWMHs15I9kj9sn+O7PJFBlwuLMJcIgAtFGjhwsyDx
         RQ8w==
X-Forwarded-Encrypted: i=1; AL+hErHYfrap89N1kbYPG9kWE0dvQdboX+TTDyS2Vp3oZo5TibG58ZYWX/PMUB3rSxm/P/l7KwAPdL5ak2Wz@vger.kernel.org
X-Gm-Message-State: APuU4Z9ehmcYJL9JAkiUPczAPlDDXmwYaC1JVn9NDEEkwgMNRh7V+IRB
	pOcl2zlyAPRDv+dMy8w03X+vUVwxLHNxiqHvMwHWIjCbM+OzIQKv79643IqEWbD/UUx+0gd70Wz
	MrjAJdfxqEZmnKyClI9Es0DKth2928Xc=
X-Gm-Gg: AYBFou19msa09x2fiukSU/lRHHAfioogKQnqjxbQOGqarxdIk6XNzcSKAxNoETNBjU3
	ViC5T2Zyt2S+PefvyXfbt66f3DDtn3AS/3QwVB3qNzaevsIXLmbbO4WNIqZpSAZf4e3MMdWRj/q
	rWOrAeuuekodoX0hM31Hbo98CMMBKhctV1Jgl6CuF4DpDAuy/a5A+BR/0752fvOO9y0bclhMtxq
	xAqDSH8xzgKdMA+iWNhbJIziO5WWv8V1A0AfEuYt/GIl8xzdHgCNzSDDv8JEqU2emUj2zracOvy
	ZaDxI85mgMWZRSranDzmKqcwWyG4s3b9BeM6nrJ7B0hrgFRkn/wZSBjqIa74SMgWrOMCIF6Gkcg
	z07tDaTI2CSr0sh3hYihsCd3v5jsrnM9Wem3Gh9g=
X-Received: by 2002:a05:6512:1090:b0:5bf:c5e8:7451 with SMTP id
 2adb3069b0e04-5c156ef6a9amr561697e87.65.1794300008049; Tue, 10 Nov 2026
 00:40:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com> <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
In-Reply-To: <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 10 Nov 2026 16:44:35 +0800
X-Gm-Features: AclHuK_YmaCFjS3fljYs9klvoSNNKJV2oWD2Es6eIsNEQSomFv3bnXQjY-fu8gk
Message-ID: <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:41=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
> On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> > The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
> > is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> > ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> > dtbs_check reports a missing vref-supply for the LTC2305 nodes.
>
> Can you provide a link to this patch? I am yet to find it on lore.

Sorry, I should have sent it before this series. It is now posted at:
https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c96=
57f3c0f@gmail.com/

> In my opinion what you write here should identify broad patterns across
> the patch series (perhaps how you've grouped the patches and why, if
> necessary) and not rehash the commit messages.

Understood, thanks. I'll rework the cover letter in v2 to describe the
series as a whole instead of repeating the commit messages.

Kyle Hsieh
