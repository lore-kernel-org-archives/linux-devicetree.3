Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DBA3DEAC1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369260; cv=pass; b=H9Tnsq2a7RsRW9Fv/3MftLrdxRaB+HP2yQDB2zK6ZR+jvWpAMXWKX6lscVVtLS9pTnszyXGIdBv/SJanRHgYc40Ef9Qgklw4zQ28c5YGpvxXpC+jL5ot12cMEt3VHyOiRessYQzJJrAmPtl/fsNYGEJkw/zE8hVK8qsksTydo6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369260; c=relaxed/simple;
	bh=eS5TkT7qd2I3BCx0MUnneGkbGVAZPGy5EUGW/yI4tzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCiKSqoHgTPHiHG5r5FCVy31rFVwbrZMy+BC9J0tIoU0eYBw8OinRFGBeWA7K7dSpAeUQIC2codboEaPlvF/bpSp5DApSPGI5WLTBtpSQl+ZQ3OOuI9eUaUvj29+Am3IM6CAwaX8l6nifo6pTOhpgNxOUJ3dlS9PaCO+ZB052Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MB8JW6s9; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MB8JW6s9"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66493875766so5167601d50.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783369257; cv=none;
        d=google.com; s=arc-20260327;
        b=j6wn7Xe8Ya6eDJlqho4hksxLvzFGkat7X+CwwXEz59dKTSF7HYq0XLP7Na/491xAjr
         UdG4MEntHE4e1ljhm77mZ9AlaTW7x48JsbWBxTAUueX/I2C9JRxkXT19VPPxNf80bhnY
         luojFqapmhx2YlXMMaj6aeEm6Q42LpHKz4xoka2cwCeW2iHIoispI5dnSK19DS17xHQO
         TFowyhvgofSPTX17MVDvstlLUpBQG0FFSx56W4CxZ5QHFQwmvGI0OuGhC0+I4xsiSDjs
         KqnT07DK1NIZoOZ+b+W9YqAAxGfg/O4OFbcAwpj+NeHcKicwYlqN5PfqFJcOMxl6BV3y
         28bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EpTQylrI0HEDEkwiSngg4lcHSD3S7E1Gj/Vv40Rmdd8=;
        fh=E+v4DDivnh5QKq6lDV2tBO0wOenZy4K0vArpbN1DDJc=;
        b=NnCNErkoBMaWnBHDfVtFkjE6JCMXlB/xApzOu4xxTb70p/kYXkrvg+phGTpr9C+wV0
         Rd0UiBbivZzL8/3KkZ62gEYj2ZPop1pMDI5VnD1L+wBAo/mxkOxV5MadT5z5Qo8KZn77
         XrcPo227qNvV8xvBQ8A35gOgmhZZlsTDNij4nYahwPcsr/hKb5CwQTukP7meYVMNDBYG
         fyrrwnRpLfGaJdTiEL4KP0+yXPaiK9tkx5TuoqRsobmkFZgU935oqdt1hxduF8XgW1kV
         I+Az0Ms36kLy+Q63LoQDfEv5uqBQv6j2TrqWZLV5J9tK8xeGNto1t0iWuNJ6lrCkZWBj
         4uyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783369257; x=1783974057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpTQylrI0HEDEkwiSngg4lcHSD3S7E1Gj/Vv40Rmdd8=;
        b=MB8JW6s9Vw91lgS8qh0RvF1i2nBMPDJL8VfsROO8llRuRlF0GUSPcsfo2qBmm8F5oS
         OxUrVgEzgzE8npYry8i+qPRM75QrPsL4dc2S/P7kl2TYipfQGemA3m9RPHdpQg4JDte+
         ADqNx+MD92QCJ7t5/Nci0EvHNn1sB8L07GC6k+JcO+BXGSmHycLVau3qQP8H2wpQ2SnB
         ZGMqtM98afpX7EUJ93LjY0fudNInztuGeIi9RWX6HyMgdayRMbwlnBAi4EuPGcx/7rB3
         Pg3Cc0+nNRit2iClxtM1f6GQZjo73BrRsk9L1nIu0ZOXOdDyX49LD8RkMjm/2HwOQqnz
         2oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783369257; x=1783974057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EpTQylrI0HEDEkwiSngg4lcHSD3S7E1Gj/Vv40Rmdd8=;
        b=hGdvmty37Q7tXFTctUh+gEf3BD5Fq71lPCiXr9xqVD/36nucbaa62D9BJqFJZmMNvm
         cdTLondsDfB2s7+pfVNIwoZ1FlfcGtx95jLWGDuWZY6tLPpBQ81PKaQL9xUnxOZSNW6O
         kCLVtLihPQ4s1UEhi+dpgUsxxf8uHvNr9vcEWa31fmzrS7pZJeBUMOiCME8w8hMQDGdF
         TCGkTV+hUZCWBoiiuT5CMnD4V5EAQeMike06Rn/cbtg9ggKMrsPrvMgT5NVT6a8pPKVn
         J6f+PTGvB2RYWp6mqd5K4lH74DQGfcgfQwEXGkxCchFCNL7J6mk9vLJ/mcJAfE4om0Xv
         1oHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKHoe3+feuO54iR5283OGSCWlXYL4pTXdshvxfFqsMb1Uy0bEbtdMtR6I1iLsCgRpsUuRAj/b8Eu5/@vger.kernel.org
X-Gm-Message-State: AOJu0YyIO73sdG8KqIXZGkNyGAfXlMNC2UFVtWbAUoH1g7ihay2c4U5J
	JzrerwbHdqT4DrvMpfmliOFkZLWDf/P8Cwkyrmlo2tcQEVpx+x/gbxiVYsqum6J/YpPs65h4LOy
	4a+DDPXPm2fJglfPzilA2W12AnHRAob0=
X-Gm-Gg: AfdE7ckzrzs5ULZyTb0We5P5qQ7aY4a9iOfr7Ee8AA+WKENvr504Hs8s5E4CFT/m7D2
	7O1qdutNETC+bG8ug9motcNjis9bBaLWzvNHjtLstsgUf3PPcUT/QXBc7qCBpbraNJI7FrK+nOa
	NbOkO/KDmTeYYHXBKR1GHH2Zyp6lYkPhj3KAjUSdag0HMwBLYWUlV6jpVD0JTnrF2rGmv5jP92m
	Z/+J6OXfe3E8Bs/zWHBw8oRSWtd/hWxZyc8ab5kYzkzyGAqVSx0XFpml80DSdPaWB1kdDEAHHKM
	TxXpF0H2OFSsdHKDqZgpDIJw9WANll5H8UUmVIB9be3xumRI7DPnO8GZag0=
X-Received: by 2002:a05:690e:4806:b0:667:84e0:d9e0 with SMTP id
 956f58d0204a3-66784e0db45mr432516d50.16.1783369256776; Mon, 06 Jul 2026
 13:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
 <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com> <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
In-Reply-To: <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 6 Jul 2026 16:20:45 -0400
X-Gm-Features: AVVi8CcybGfiD02-Luzbn1df7ykWAKEIqVJMVtGzaJ6UGd0Ku3B0xQXNIrsUQbk
Message-ID: <CABBYNZLLDMU1agbQJfL4T4GOTinkRyM76NDqiVHk_4+9KFohQA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi George,

On Mon, Jul 6, 2026 at 4:04=E2=80=AFPM George Moussalem
<george.moussalem@outlook.com> wrote:
>
> Hi Luis,
>
> On 7/6/26 22:36, Luiz Augusto von Dentz wrote:
> > Hi George,
> >
> > On Mon, Jul 6, 2026 at 1:27=E2=80=AFPM George Moussalem via B4 Relay
> > <devnull+george.moussalem.outlook.com@kernel.org> wrote:
> >>
> >> From: George Moussalem <george.moussalem@outlook.com>
> >>
> >> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
> >>
> >> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> >> ---
> >>  MAINTAINERS | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 0b9d7c8276ac..60f7251d1a16 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -22289,6 +22289,13 @@ S:     Maintained
> >>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regu=
lator.yaml
> >>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
> >>
> >> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
> >> +M:     George Moussalem <george.moussalem@outlook.com>
> >
> > Do you work for Qualcomm or have access to their specs?
>
> No, I don't work for Qualcomm and don't have access to their specs either=
.
>
> I'm purely contributing in the capacity of a volunteer.

I appreciate the initiative, but we still need ACKs from Qualcomm for
code directly related to their hardware design. This is especially
true nowadays, as people seem confident enough to send code changes
done by an AI agent for hardware they don't have so they are never
tested.

> >
> >> +L:     linux-bluetooth@vger.kernel.org
> >> +S:     Maintained
> >> +F:     Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-b=
t.yaml
> >> +F:     drivers/bluetooth/btqcomipc.c
> >> +
> >>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> >>  M:     Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>  M:     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>
> >> --
> >> 2.53.0
> >>
> >>
> >
> >
> Best regards,
> George
>


--=20
Luiz Augusto von Dentz
