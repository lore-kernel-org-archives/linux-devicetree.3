Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84B37B01E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732689; cv=none; b=dgq3R5FbsCBrrqy/8Z4HRE9G2si35zXl768Qtg4Yoa2HqenIKmeainsdfX7ke4KlBrqsPf4bMU8gEgQE6JurdCfWKbBWnF+BuTwdZwxr1NkUOW1xkTZi7FTb1Km5b4ZXgcnp15YcODB3mAJYhJcCBLdg7KtWBqXC42as/vbQzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732689; c=relaxed/simple;
	bh=Y8zx2w1AIDgfPowWVDAXwKwQkjMhicPcg6v2Sd+OOqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNV9ntjtH1XpIwPiqWQBcwEfV+ZRnL4VXq7XFehyKEdftN/lKIXsfo4asUydY9grX7+/ZFJ6LzR/WrwHZJKZWtoCbro+P0otrtzNXOpspTuJtLry4tEh/Olm15Qck47YzzjHtxBiAJv7/vokK1P6kJ5HPqqNXiGD/5qPknWGNs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR/YvpEP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR/YvpEP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2519b8d330so64078466b.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732683; x=1788337483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=;
        b=eR/YvpEPf/GJCTOdYh96a4H9GujEDhlWcU6R4VCxNfmKreE9KGAL2iq3XEi3/KNJwY
         P8Pz/ML2CAIwzA4ReEDSnZi1NqnfLU8AAe3KHgMFELuBQY4Llu7sDCduMhx+NKJ8A9XI
         wpYwalXiMXUK8BRtxRAUxzKPes34f+uVyTYRx86xVGKOCopK4ccM8aNv1+atkwRkCXKC
         FgVjm0Y1WttlAwsCULc29rCvWmg1iqPHCOgtjgoduJd21OOzHWtzoowzXENJjpIbg413
         0z9/jcrLxELndGZ2tVBzEf8al1f7fcfEkh8sLhSkGew2K4NSxCnSaRHht1xw4TBvI/es
         ETsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732683; x=1788337483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=;
        b=lwVMMFsL89jS4AU/kPzVSnDaprGf0OB/jmxRQj9msZiICypOkohEXtnWtSUL2xJr3v
         ScaOm2Mqe8k+DtDfjbTIvRdrCHfYBmQ++/aqjWY8YLYey8P2PotpMTzJpPBLy7uyg/Lz
         tQKW78mGUE/WKz1VA5Op+LfcylM/SAmgGcKnz/Boc9Iu4xQH4kJ9aKoK8EHauu3zbo9V
         D8LqormlIUt0r2UEfhoBMGRnUQLEQo4uCGEBam+VUl/G0IzYO7Xj0u+Y2Iw+I9vndizy
         DVV6iy+RqAU9H5RYAidnBUGYzn9CIW37PNh2Zad1YfuKakY9njbFjF9ShH+w1iQFWRKO
         d2fw==
X-Forwarded-Encrypted: i=1; AHgh+RqnfjE0SrTvMjgxJPn3+UXhsmRlDVAq/34cCrT5vfP8ThwmqRu489sbU+8ypowJzKtxxHG4yaHBtVTi@vger.kernel.org
X-Gm-Message-State: AFuF++kyuMiEi+ei5fS8k/5AaMAf++Rv0/rseJek2wmHnvBfF5hFBPs4
	Qj0dfvWEB960MsF9eaV85rmL8lGN58tQYTkkaVP4FytiHFZL0bPY2sl+
X-Gm-Gg: AR+sD13I/DfxvStlWWfI/cnHe3Un9wns+zqZXFPYedG5Iup03X1jaBy9FyDLMvxoGdS
	l4WdNua0qYazlV9Hvmh5hXmj+wFtrE659iiCYSg+IZE4uNgPRcByY88G4qEdm/dMM5lAVcK42Kf
	LkeRv99XU9lJibdGpyBWzPO7ysEOqbIJ64ki+OI4/R65js1F3GV9z3GwtKvaJOqyPFu6vdGfp1q
	jy4RN5U/60aG3jPKXoBzeSWir6tQTotYhZfLOkAeQ7BI4OvoVELCtvMI6A9EBV4eZKe4jNEKo3g
	MdW1OdNVNH+nFMJ7+pyGffRa6vrEQH4Z8Rr8sw9j4svEL27+FM8lSUq/urjTBqcyxzXRjZC5KZt
	IMhHK3QFW8KkoBueAmARI22no3pKFOpxBeMkRxFtFlX5ZzdrsjoFgmFvqrKTAxekNch9SR5sUtC
	ewIF5OiKisyRr8cPD0BE5hBS+2JwPTq2qoKnC1eQLUfKAOxOTgC0+0j2RwXtGT7N1I6UZFpwhn2
	9B4QrRZrcMgKDu6kBp+rQ==
X-Received: by 2002:a17:907:3cd6:b0:c1f:922d:34c3 with SMTP id a640c23a62f3a-c250c308f96mr539179466b.14.1787732683231;
        Wed, 26 Aug 2026 01:24:43 -0700 (PDT)
Received: from [10.25.211.251] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d6acasm419960366b.9.2026.08.26.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:24:42 -0700 (PDT)
Message-ID: <1c5e12af-927b-40c3-b682-8f432a0d9907@gmail.com>
Date: Wed, 26 Aug 2026 01:24:39 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, elena.popa@nxp.com,
 cosmin.stoica@nxp.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
 <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
 <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/25/2026 2:52 PM, Fabio Estevam wrote:
> Hi Laurentiu,
> 
> On Tue, Aug 25, 2026 at 9:11 AM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>>
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
> 
> Please add the bootph- properties as well.
> 
> Elena plans to support this board in U-Boot where they are needed.
> 
> For reference, here is a commit that adds the bootph- properties to
> the frdm board:
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/commit/?h=imx/dt64-intend&id=50c0d934698f7602d579ba21262fcca3643c5464


thanks for the idea and the reference Fabio! let me try this locally and will update in V2 if all's good.

