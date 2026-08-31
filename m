Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8953C1D48
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162802; cv=none; b=TcYrCSQcoPFJnffpfez4uPNMFmLzWuUZioSVbfGDO6sndwd/Yk64Nmt+mwGMT9RG0rVwDMHAh09Y91twr19tuw2Xuf+eqNNwBW1u5eXaMUnzewwt9QfI+VWShXKgkC6iIgHk7CRCZUMZ6u5QiXarJZJFqvx5NIOzyMe7xKSOIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162802; c=relaxed/simple;
	bh=hK1ccgwDNp1FnzcsAtdYzKJecB9ZZzZ+gBEbbt719S0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=SfyTIfyupkQsRXyXeIEqS2H6Kaql8vyN+LCW8NfVNvJvSIDcs+RaZ0L1Emrc7EquIPqFE8w8B/cDXLdkueoZ+e+v9JdWYyXjK3EitcL8gnkbmXaOUqA5Ui6MCJ+2vY5kfle/0+zbtAOF+8rDqoG2eO1cl0cVyY18MT2fLfih1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dbHc4avP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dbHc4avP"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c25420fe973so5312166b.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788162799; x=1788767599; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8L251g5odZgk7HDZdrpqhA2gS9bIplpKlO5QvsDcLvo=;
        b=dbHc4avP35WRm5PY3nGdcWm9N5X2pyk72HxyAcfEeFyiKyd4E/rB13RKtcsiwITMpQ
         I5dATe8FgJkZX7ZZgIIKNBGrqb+BeaNVHbYkeAKjO9FdjvcY7cWBaxu7DKl3+2sRDtYT
         JynLrrXsoYuXT0qRAjL7Qz6Qei75w/FcM/PymEo8gHn3Iqy4N0wgVXNhi9+P+aCUo06b
         pxKq1p5MFKFufGSiTE8kP4ZHZKgzs2XYeR2Jg/U8Toh0iVIjT9X0R8DJ27ZbWJAdbXrS
         GxmDoKpf6DTi/YNLIUeyDBQtj2jVy2NLZTdeWHdA/9vvNL8keHdybc+myPHFX6mgeBwJ
         jMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162799; x=1788767599;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L251g5odZgk7HDZdrpqhA2gS9bIplpKlO5QvsDcLvo=;
        b=g0lpfvoRaI0C6owPczPeE7viGRsWSXMJv4QUQm8H1ESlO1FCcanKz3vRgbwBHEL+Rv
         +eCYXoFeHsFit4t1O9rfMBcCfp1FMWuyOUkQWcymhPqVjJ15RcCiey7A4IYHjtC1tHnf
         ByLuvxLbd8JFzEtfB0vtXUstUamhN8+uXfrWuL01wwdt4G5881DlrH2jiIu+vlu6osQP
         ocN0d49aLoCVzh5ku3pOu5s+JYpkuoW2pRgBCDAhXXQbNMWM3vkq1MzfMJVyblApNBMV
         K126qGUEbJOtqvZiG8D9/NfLeOqlT4zJAnfAUQtXhkk7pK3OIC7Jk1XYsMfxh9zCo5fy
         iQPg==
X-Forwarded-Encrypted: i=1; AHgh+RrbOLfiUyFV54hwWJk3FtM6hpuDYkjgppqpm6nT/NOBJgzjaaoGU7wHOlgD4Zdmy4rYLTPuDYnqrbji@vger.kernel.org
X-Gm-Message-State: AFuF++lpaKvOOZ/gvRu+RK1Ca+/BrOMu/cxGE145bvd8Aq5/im+cq6cL
	i0+tRSx4OzYvFt72/MCX3FAJlOHTiQTy3/V9pmDii2fmYG5DHbAtEub4kFMGCLoqXYk=
X-Gm-Gg: AR+sD10/LRa4225tXRNN0NMlh1DtRtD3DrFx/vFNrkZOwVCihrsS7m5xQ9xhbWG+NZf
	jzfbNrMRc+lltrTsBYx6ZBZaBvH1j0PTAeHjslpr7PZLC6866SCcCYdMN8FY1Kuz1AYDO9Mch0A
	9iUZ7d6fn8dVt+1ofBA8/p2pE3MsEKmuGYYD02O3rKSycGZDI+DQlcL6DUYqjvEreGqlAhMxAzI
	hFg45xg99zjgE35+6xUxUjMid/0yt26K8y96ctyPBxp1C5qMUx16YQmhiL3eOpflua/YyRhmTDY
	m+Ex5c2E0iKYb25pgQCZT/PKbU1ebANZ4X36AEHz6WzAIZXGC3ktMuFb4NeS4UsIlSKZNbxuQ4G
	vgKm7QtxLKaU/ZD1sRXNtqilRs3typKvVwpxP9U28NS8vwoLpKobi1ZfmaR+MU9nuGHk/INs2GF
	BlBHFfbdN3N/QMQvDoLPVtEHFATINtZp08+laj1F/Arff3TDYH7aD0prpf2ozJd47a3fikRU7zy
	rnF6T+7WuxclAGzR267TDe3r3NQ8/KKw7udxBr/B7/Z
X-Received: by 2002:a17:906:4fd4:b0:c25:8878:3e09 with SMTP id a640c23a62f3a-c2588784f62mr520709566b.22.1788162798639;
        Mon, 31 Aug 2026 00:53:18 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm378656166b.45.2026.08.31.00.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 09:53:17 +0200
Message-Id: <DL2YT4S4U7C4.2CPGBR94G01FD@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>, "Marcelo Schmitt"
 <marcelo.schmitt1@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, <linux-iio@vger.kernel.org>,
 "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Luca
 Weiss" <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 5/5] iio: light: stk3310: support the Sensortek
 STK36C61
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826175409.326131-1-jorijnvdgraaf@catcrafts.net>
 <20260826175409.326131-6-jorijnvdgraaf@catcrafts.net>
 <apEMCqQXyj1tAMoP@debian-BULLSEYE-live-builder-AMD64>
 <20260828154705.11962-1-jorijnvdgraaf@catcrafts.net>
 <apRGQVfPKWHvE2Ct@debian-BULLSEYE-live-builder-AMD64>
 <20260830201950.63838-1-jorijnvdgraaf@catcrafts.net>
In-Reply-To: <20260830201950.63838-1-jorijnvdgraaf@catcrafts.net>

Hi Jorijn,

On Sun Aug 30, 2026 at 10:19 PM CEST, Jorijn van der Graaf wrote:
> On Sun, Aug 30, 2026 at 12:03:29PM -0300, Marcelo Schmitt wrote:
>> Having a closer look at the data sheet I found for STK36C61, I noticed r=
egisters
>> 0x13 and 0x14 are not listed. Does the newer part has ambient light sens=
ing
>> besides the clear channel?
>
> That looks to be the "STK36C61-A Preliminary Datasheet v0.9" hosted by
> LCSC [1], which I hadn't found before, so the cover letter's "There is
> no public datasheet" is wrong. It documents the -A variant, however,
> and gives PDT_ID as 0x93, while the part in the Fairphone 6 reports
> 0x95. It does agree with the device on the colour-engine layout: RGBC

Just to chime in, the datasheet I have access to (STK36C61-A Preliminary
Datasheet Version - 0.9.2) there are a few changes compared with the one
from LCSC but nothing too interesting:

* On the overview page LED current 228.75 changed to 218.75 mA
* ALSCTRL1 register (0x02) has different values for BIT[6:4]
  (17.92 -> 143.36; 8.96 -> 35.84; 4.48 -> 8.96)
* PDT_ID is indeed 0x95 - maybe the previous version just had wrong
  copy-pasted info?

Hope this help.

Regards
Luca

> data at 0x15-0x1C, a clear-channel gain in GAINCTRL 0x4E, and the
> shared GAIN_RGB/IT_ALS fields in ALSCTRL1.
>
> Yes, there is ambient light sensing besides the clear channel:
> 0x13/0x14 are present on this device despite their absence from the
> datasheet map. They behave exactly like the stk3310's ALS data
> registers and are what the illuminance channel reads. The ALS word
> tracks the green channel exactly, proven by the x16 gain step moving
> both from 25 to 404. The sheet's own text does describe the function:
> it defines DATA_ALS[15:0] ("16-bits ALS channel raw data"), windows it
> with the THDH/THDL_ALS thresholds at 0x0A-0x0D, and calls FLG_ALS_INT
> "the Green channel out-of-windows event", which is consistent with the
> ALS =3D=3D green behaviour I measured.
>
> [1] https://www.lcsc.com/datasheet/C49230205.pdf
>
> Thanks,
> Jorijn

