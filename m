Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE144DB61
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672572; cv=none; b=kL+NSmCwNEJzEnwyZJMp1QLmvf3gXERuhxDGUWsUa2jceP1TGfi6dKEWRDJJjTKQcwgE6Qf9RJwMLSOAXUDNUG5Ntqg5GXSDEBhDjvQEsnTwQxc1ithwXljTzXWwA1AZFVzTOB095YRUCL7tczJRP1KBdRm9ozbBaeboHCDH8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672572; c=relaxed/simple;
	bh=aShNvsl9/UV6Crwi+FiPnYS1KsTUHaoROsqg2c9hrKo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sM7wXrcsQHwgHJ9QUcdemLdNM8AarGP3AXebP7PawEAPHai/ZLYcZcUpPehjq9ywD7iyUsUz0mOxJMIQqDzGLlF4dQUFs0g/JEigHgVq5U7loTHp/CV5cVeVCUHCl3a39+KvE7hMsVLMGdMFVDSIvnkfpRlKiGdaFcU7gqs/IWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=U8XPoeJ1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="U8XPoeJ1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso1888255a91.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780672569; x=1781277369; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIWsKvi/6lQbiJxe71BS27OCJvhTSW9AzUP/bpE81+Y=;
        b=U8XPoeJ1Xy0VGoPLZbCpBi4T9sa9C8yKk0epoalWMDvtKwYEE3TgWKDQqODCeiTpsP
         0zbB7AqbX8y/nifDtgiN7OXe5NHWc909+0sIjKV66RLZBezPBgDyf/Ja84PPGGe7FpCP
         eOeeQuGbtFbcTV8Uou/H5Q5vSkIXGgVYfhd2FnrHWxU8Uc0hss8RT+fD2QWNM7ioodkY
         LPQypblWOhA/E4SNRC1qZuPfSVh1tUyddpx/Z4+893pY5vK/4dpDwfQjjRBSaUgKGliE
         1baNufm39IMldv+GVkJMaNF1UCezcoQ+vliV3moezH8vkRRHfx28xYw1414lddLi/8/P
         bTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672569; x=1781277369;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIWsKvi/6lQbiJxe71BS27OCJvhTSW9AzUP/bpE81+Y=;
        b=jBDlKvt+p5CvFNFT2F2HLrCTvMfeeFWCO3CKoAMI/Wzcxssq+4C3pTKonbrxlXpQUt
         OHpW3j+f4sweWVW54V/M6aJBPw+9KVxhf/gmS0ykiscNPxhbksRcKeGnIJR9GAPsdiYG
         llMq4pPO+lFpNACscxwbr13xYhMjMNz3k3NpKILzpXlIgN5RSRaL9VKRijzNoFjJ6yEP
         DF32RYzJCDVK4pG/NxzVCFjmDGeb3UDrxviiVaIcbLdUAoZjA55SsZ2wga2dbC6sS0kT
         HNv6x324tlXduh0uCENOfERKvMbmoEaROFf1wzcb90uHktruS5WB2fhwtwxrDirsgcv5
         a9qg==
X-Forwarded-Encrypted: i=1; AFNElJ/XeYK10nT7SCdvXLFvY0mw99jmVlKAph2DsDUML1FYNE1WwUiHt+30USUgZ3p0hmD1DxF3/1L2qaY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjYW2lfU+5fbUkoWP5peDJjCq2nlHddedhWGiZWjKX3PdfYKq
	gA/rigjQ0XIlIYUo1OXAJhc3XDgbPcgYSdpV1ZGH/Dp0BeR+JE888y34TyjaQzw5vds=
X-Gm-Gg: Acq92OEzWuZzSDdtUnqXPCmZMCbly07aufsR+S8lXnN/SB3ttJy2/+9ujjglkXsB+A6
	FI/A8J7nVhZLAD4P55VmExP5DrF3Y6s4GjkZRFrPssqmAJXz2CP3w+no5WAu7qOryp5Ee9BZ2p0
	w7WQ+4EPQHHO0s905zLDWpM8pKmIkVnnX4yOfzekx0WJlTbPoirEU7fiURVP/6iAhTZ3fH4wimH
	ae+1DYON+IvXPAyM9F68GUCaJiw4zbnoXe3GAJoVrVCgnXlziMgLMRudpI9IlBrsJpGnWnQgxaE
	TR0liVymA9nbSBuT44b70drRZB3UMdARIyquDUM5pCRYtDqcviKuzZM5mNGjHO7AbbHsg4XgjRD
	/65OZhF3PJbHLI0f2Wj5cYZReVbGgq1OZkXQwg8xFriD2TShNu09BtrNtsoiqaHWQtgh2esHYv1
	KOJGzUL71zKkwkYTqI+ctuGpu+Nj1o4tTC32US7Wcupgg1dXgA7GE05fUy4WI4MhE=
X-Received: by 2002:a17:90b:3dd0:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-370ef3e4eb0mr4796160a91.11.1780672568701;
        Fri, 05 Jun 2026 08:16:08 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba82c6sm6695319a91.13.2026.06.05.08.16.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:16:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [External] [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and
 hwprobe
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <a2o7tkslomyf43dcs4tultdmrzcjgvkjh736l7lqemasljhs2j@tyixe5krxw6z>
Date: Fri, 5 Jun 2026 23:15:37 +0800
Cc: Conor Dooley <conor@kernel.org>,
 sashiko-reviews@lists.linux.dev,
 kvm@vger.kernel.org,
 devicetree@vger.kernel.org,
 robh@kernel.org,
 conor+dt@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <72942B6A-0B50-49E4-B1F4-E69D1A09288B@bytedance.com>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
 <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
 <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>
 <a2o7tkslomyf43dcs4tultdmrzcjgvkjh736l7lqemasljhs2j@tyixe5krxw6z>
To: Guodong Xu <docular.xu@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)

Hi Guodong,

> On Jun 5, 2026, at 19:32, Guodong Xu <docular.xu@gmail.com> wrote:
>=20
> Hi, Qingwei
>=20
> On 2026-06-05 00:43, Qingwei Hu wrote:
>>=20
>>=20
>>> Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be =
implemented
>>> on each hart independently (at least spec doesn't say no). With this =
in
>>> mind, the validation of Zic64b should be like this:
>>>=20
>>>   if ((riscv_cbom_block_size && riscv_cbom_block_size !=3D 64) ||
>>>      (riscv_cbop_block_size && riscv_cbop_block_size !=3D 64) ||
>>>      (riscv_cboz_block_size && riscv_cboz_block_size !=3D 64))
>>>   return -EINVAL;
>>>=20
>>> This will allow :
>>> 1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
>>>  passes the validation.
>>> 2. A Zic64b hart with CBO extensions but block_size is not 64
>>>  fails the validation
>>>=20
>>> Thanks for the catch.
>>>=20
>>> I will fix that in v4.
>>>=20
>>> BR,
>>> Guodong
>>=20
>> Hi Guodong,
>>=20
>> Thanks for working on this.
>>=20
>> This overlaps with my earlier Zic64b cpufeature patch[1].
>=20
> Thanks, and you're right that your patch predates mine. Your =
validation
> was also correct (at least resonate with what I planned to do in v4)
> from the start.
>=20
>>=20
>> and Greg confirmed that Zic64b does not imply support for any CMO
>> extensions[2]. It only has meaning for whichever CMO extensions are
>=20
> I'll add a link to quote this in v4. Great info. Thanks for checking
> with them.
>=20
>> implemented.
>>=20
>> Since the Zic64b cpufeature support in this patch overlaps with my
>> earlier patch, if you keep this work in your series and base it on =
that
>=20
> Yes, I'd like to, and I prefer, take the your patch into this series, =
and
> credit you properly. In this series, I also added dt-binding, =
documentation
> and howprobe, and make it consumed by rva23u64 detection.
>=20
>> patch, could you please put my sign-off credit for the Zic64b =
cpufeature part?
>>=20
>> For example:
>>=20
>> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
>=20
> Yes, since your work came first, I'm happy for you to be the author of =
the
> cpufeature patch, with me as Co-developed-by:
>=20
>    From: Qingwei Hu <qingwei.hu@bytedance.com>
>    ...
>    ...
>    Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
>    Co-developed-by: Guodong Xu <docular.xu@gmail.com>
>    Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>=20
> Let me know whether this works for you.
>=20
> Thank you for pointing me to your existing patch.
>=20
> BR,
> Guodong

I agree with this arrangement.

Thanks,
Qingwei Hu

>=20
>>=20
>> [1] Link: =
https://lore.kernel.org/all/20260528141630.2741710-1-qingwei.hu@bytedance.=
com/
>> [2] Link: =
https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_an=
d/119631059
>>=20
>> Best regards,
>> Qingwei Hu

