Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCC3D4132
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494896; cv=pass; b=b01T6xLQ9VFC1PcRFDy/EEcHxaEUQWwQ6wUhQ4u+9JeX7HsNQWa84rL43zKNl7kJGzq0wEtOHz+q2wIeXYuFs49f9HAKWiTWFxxL8Mr8igpqLTjVT18Ty775qT05oZ/T5uTb4tr40eaQR4fLYYgVn2QEpf88da5ZrzdaYfBjREs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494896; c=relaxed/simple;
	bh=dkEb+Wt3jNZ7JLdXZ5Wg/1bN5QqwrP516+C9eqWt/hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI32wzDQK2h0bPUvj/qLCRONMiEaDKzVq39K/e0AbFchXu2qQDZbyV6OQE7n5pPUnGw7MZoyk/aSPe3CqLXTi5hYYNcqCXOfwPgCGwenIywG87S48bVT3RUpFpI9nJiakVETPfraDwQvX4uU/ow+C4MhoZBvh3daOR0XWb3DxKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKlubvpx; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKlubvpx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b9705613ddso24918555ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778494889; cv=none;
        d=google.com; s=arc-20240605;
        b=ajC9Gv8Ie8TggpRNmFF29GMTZT0n3aA1JKbL4eQnSP1NYcz0ItyaQuicv0c7mHWxvQ
         aoevQdpcnCRBiu6y1FbJPSfDzGuKoorLTXB5fiSjG2LesR7mdLv2j3DHceDKTU8ZGDBw
         6MdFdjOmLBXZDUjipSJbj6XdSxjrVMOOiesZ9MpJyg2+Zu0f3AJreV91d5mIxs0omUKZ
         IkVzDYoqUOFRGTWImAZ3zkpTgkhJMdsJY0+vcwmsbsLTTwCXhzjQCsDyxN4p0zj96vzB
         +760TkzLoR4goXUB6EpA4uHDcxfTGU7ah6+APwqp+K+RzhGlbMu/7GawTxAgrWcOc524
         EUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        fh=XkGbKzkFviEThlr4vfSBh4NaOsQbkv7Ab5BkY83/VAo=;
        b=hATO4loydP2TJ+ykaLaj+fDYCJIcBPOHRF9A50VQ7gYcHfBzcOnTMb234NDElDbc5v
         A7+0brypuvofTdaUhgvzlPgnNMDqSkV+UrI6UyCg+b2XuuwHoQFtqa+gcu+8BNzUwR04
         rkth0zCU3PgqWDVG/rSMjdMKKZhqHjLGmNlDNXIo7QOHTYdqYwR8BYYLB9vpqUlBro3y
         ll0NpxtwSzAmxu38proIPxlEWcuVJws3+xt3hU0XsreTH6hcA7QzJDpeOuLQ4U2v2xNZ
         44CV9Cp2rIeANScPrLsVtNp72DxFHhKC9rcDHZPZNrUHpUFre9e9jIR9ZSP9xh+rO04u
         7iWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494889; x=1779099689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        b=TKlubvpxaacU4fCHJVBKa3ddo/C14LWWPTkXz0YQ1WZv0ZfDtbn1Nzl2OG9reivtVy
         NQe90vTscyd+Mai28pboELuuGMc33sGakLDnItGb8JNi8r9RU5ISHpKZwGFZNR2wzoB9
         yMfPu0CMMTZTn+eN36JC+T+Y+O4VrD0pnYl/ivXE+qxOCqXnUxiF5coTp4KmGKKfBBT5
         Z0j7giizMjPtvDi0NaCK7E1NQH4yRFIjfv8dnkrpZexAlgGpN8bSVp9LnKSS5RlzVDMn
         K5YbUhSrWUubD3lrBziMvQ+0O+beKBCJEoo25BccFP1CyoKd1IZOoCObfP7ZKYghitqa
         WRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494889; x=1779099689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        b=MvKzC00Gk2gygftiHtkmnHeQNkvq17Lo6o4Ogezk2CivxY4m1mvpcNo8mafwtMWv//
         DiLfnCcsk9/8yaJ+v/cE3Cv4WcQ6wkeJHvaOvtpMCqj2BA1xj3aaEOrjPYrhWcNZWNgl
         nfj3oyf1gNw8lzEADcchr7gdxcODK7TAUfagDBbP1ITwNLhs/PiuhZcdDwloyeyuewtj
         rkoBCwp8sqgskfbtSV2kaNQjyObFBrIYJh+D1wNgtz8W8fTfu4s/gikaAxSAnGl0UtIa
         3yIMJrBllqTrA/d4TWYN1goO8nmozg2qHk+zEP6lhdshDFuYOw1uRWXPD2bioBK7EgsH
         2u5g==
X-Forwarded-Encrypted: i=1; AFNElJ8h2hNvNgvrtT50k6JY6N3wKZvGHWjOs66s2JwsI+O/wTjK1j/GV/UwmQlNzeyF8UazfcQ4uRzBcik5@vger.kernel.org
X-Gm-Message-State: AOJu0YwqcewMAZWBKMoAmxZhEpPMBIVOSO958736H8QXQeFjxnkNzSgI
	X96J6j3puteAZdbMLfvxWuPCCUMrCYdbMDSfEIgyuB7GnQFetG7i8aL0faGboOKXwe/VftogWzZ
	77G+pVIXRuGr+5TC3hQ/m07dwSo4Chsk=
X-Gm-Gg: Acq92OEy88gyXgqE9mfDagjk9ML0XjFUTx6QQkiRWoDE2islHDis5QNDAZGRXt1wSSq
	fUh5t7TRk31kil7la4LhzjVEn6f+/Pzqn4y/WoYFXo7C6zPoBgsp4h92C/dL4Lra6A3FvxOZmDW
	+mCKVJKON7roD+fyDn4uguu3XcaX7Q9q0BT1wdjCBnupksn4mMw+qQ3ceN19QNSav93HSShpdEj
	pNPBdHg8oUeBxGh0NAzyqt64mufBj4D8wmb2hKt73BthcXNet8HU6R4GBPtk33JlRQeqGRU+3Ta
	gWmcz37QJTedpjUUi+PKvjz7mXz9I6Sn6sM8Fw==
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id
 d9443c01a7336-2bc8634c747mr87342615ad.21.1778494889207; Mon, 11 May 2026
 03:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-8-phucduc.bui@gmail.com> <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:21:17 +0700
X-Gm-Features: AVHnY4J2_VlHnQNv7lKiPmK0Inw9w8zGI63uUFFjO1owsEGryveB0MVa3vPjntE
Message-ID: <CAABR9nGx0gSfL7itmG5WYiqUq_SN0GoVp85NerZ=MrbYncq76Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Morimoto-san,

Thank you both for the review.

>We ignore the return value from fsi_clk_init() which means deferred
>probe won't work (as well as fatal errors).

I will update the fsi_clk_init() side as follows:

if (!master->clk_spu) {
    master->clk_spu = devm_clk_get_optional(dev, "spu");
    if (IS_ERR(master->clk_spu))
        return dev_err_probe(dev, PTR_ERR(master->clk_spu),
                     "Can't get spu clock\n");
}

The probe function will also be updated as follows:

ret = fsi_clk_init();
if (ret)
    return ret;

Do you think this approach looks okay?

>Below parts are clock->xxx cleanup code, not refactor clocks initialization ?
>Please separate it into cleanup part and refactor part.

Understood. I will split the current patch into two separate patches:

cleanup patch: includes the changes converting to devm_clk_get_optional()

refactor patch: includes the remaining changes such as updating
function arguments,
moving the function call locations, and adding handling in the
set_rate() functions, etc.

Best regards,
Phuc
