Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA75FDA7
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785579718; cv=pass; b=cwtlgzmn6jucRyETWMqDuMo3Q+Ku8o5PpK4veuDfkTYn8gt/7sA4rWXoCKUK/u4BeE+LapG0caUoYHIdJ/8mCo+/tyXWLdyD4IA15w5kigRdi1fehOTiZzTZa2xYdG/kTdclOIb3B/Qhwtzo1xi8HALVA4PKzaVHCAd/+OjUKhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785579718; c=relaxed/simple;
	bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgFCKgaIWIVvqXreWM3C77c93ZRMSkbzPY1vLItY59tPmNRK4ahNnxjZsTd6ZIsuvwshwUq101TGOhNxD5f1sK/Yhnuavuy6CJMeNZVoYaBKp7PldNjs6wWhmWvXoYE3VTs9646sUVAs6/4gA1Dt/YmsVmCGAs4FV11T3NDo3EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfsJZ9EI; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfsJZ9EI"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9061a795d76so16152626d6.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785579716; cv=none;
        d=google.com; s=arc-20260327;
        b=aDF/phuiAKW96tfEII+QxUdUW/K1L368WZfG4bb57Dq0GHGDBaW8JDjROck53yxc1X
         /B28y7kwHlXP0fU2olIMLGs1pGFKpcGLqh/ChZpoJrocAFZ6JgZk6Inn1RhK9lBDPXTK
         QbqJiRnsfJasRA19019U2byiZ0NYspbdq1tZgi4rjqv7bjhqLxeDUn2DtOV8xYeCEdh4
         7uObWfSfxBQPLypQWE3eF2bBkz/F+bWdb/8jcfK/E3LqCeKqYzIq1ONjh4fKV8T7kXyl
         wbBeNX4r+QdGcA1ZCCSGib1MCW5n+3BOWAHpY/PHzv/unDJBl6nRrI3Y7cGGuV/oMiL5
         VBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
        fh=84IJxRCSsbZ/MprZ/FvfGFd89Bvz0liD9pX/myU8JGY=;
        b=MarjVwsMpn8FXsk7T/s/jqqGbC5wx0bRu+mTCyeiXh7mC+6aPjZov8sUHZN71Gaqj4
         tNLMrzrk+otseTDoehKGakQt5phpnx8aTfVqOV3lhVQXbLFdhVvDM/WRA7toY6i5VRQ7
         vIEsiwrDTgbEDOds8l11MjR6uoRyVIoEj30O+cRivM+Wm0Y1aor5snmVRGxMnTZly/Hg
         JZDcR+zXKxZu3yg43W8j/DvPZULuKWThpikLzxZvyT/8SFDlcKOGYKro/71l1RgSqlHW
         WJ+ZZY/NjLpxpv12Ho5iTx/EujmmaT5yJdg0s8JSS6Ejiz33K6IpEbVrI8FD02lNm+co
         XEqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785579716; x=1786184516; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
        b=HfsJZ9EIr5gxDhSbOIxLuBD7M5x5j9fnFRsvEk/8K9BmwWhRX9XeZb74+FFLgoFr0f
         8je+vUxGrHLniZF3SJ9IpsdOfP5yV90nMDlql5Sy5CqgAMbgcmdKwgPvbczGqlmnEGjH
         oYIb/PoMKYdO/CRVLTlQFtA2buw8hpAkr3I9vzOEpRyooSymT6PN+JZg4ues9Y8R0G1f
         gP5Atdmr56pgtOhAVVGV3r9YHAKfGRkzPn+Ho0/+UXxF/RZ38Lp8QYztsd2T8fJH8MlU
         iBq9qznj+SOzF/XSrn2Doxhy79XGmhA1x2yPEgeiFPF1R9h5whoawF9fIITHHX8XvQJ6
         /KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785579716; x=1786184516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
        b=MOIpR3a+7avSvGzWJ3FaeKZkwosr4py6xI+6EHmcOPyx0nhRb7urfs84TV3HwiPVqh
         qADmYxOHmkQAuJHLBC2rvOERQlPNe5aaY7BRUEuHfwqFktc7oggP60vwByHYuEG+EJYx
         Aci9lEamu8b3G0O88LHymhcrrNw1GvkCRpKN7ySF5f9eSz5iT9LKrYeouFRBpcMtD8r4
         3NXEvCOmP7isRyPLBWnp1PIPmczY4tkjq1h0JHo6ZWubboh19RHJJvCo3AWS3XX/OYVX
         ELk77cxmV9j7PWMQILGEBJnSUsqD8EyHd48JTzwO8KTGOrumIBgEVqm/Z1JoHU97w6gL
         IX9Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro9dQv045jQuCl/P3U8yX2d6HQO06Lk2z9/Ik/9hLw0ydm18kn8P7267es5rzVV08y90glWdY4E40pS@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3syrIjdarD8r/3aqCU0djcT65NpJdY4X5DXlAiyZYps/i5Xq
	zrIN4YKbN3tlgk48L5ujEf3jbs1BwC7c8keXVu9pwAfgFTVRj9um7Rw1PGN0ElbGC/8JLV11IYL
	r+i3gFlNMLymGauBqNfSZscqFt6bzMZM=
X-Gm-Gg: AR+sD12XaAKMfow67DKBv+/ObTg0TdPgUxAj0myCriG6YAvdTBmdcR2QohceggIYPjk
	NyVGmIDMCrz6d+6AnGXcKW106lGUFSpfyruz7SGF0S7guDs/9GgUW+BM2QVmHtaEBN0YsnxfIkJ
	T3vwWmuJP2ylhD8Pwpif1yhvDwIHhqmnGm8Chn8+oPljmqgxrUGNNznonXeJDTEZEk+W4Lz/8Pz
	bVK9i1dL852ENZPz3RCkvhuv1oQW1eINtBMzFLDUaTmlSSSAkGctKVoV3W+dc4daF8KL7kk0nYz
	SDua6zH8M8tD0n7RTeda5Pd/p0+hj2eZ3veqzU5qD6o9e5ujEmWyHoa98CIqgGSLnrRNaMxuTyG
	Dg2i80SiI4GdzVgkxvvIQA1vm5PYuCk5Z6Lz+ZtCvp6+If6+UJscdtiYHxD2OI0NI8hP5n8saEA
	CZUYOsLfiVlLjATh0a40GeC4E7AhzaeM1GPkouMhd3rlKlA4zq4PU=
X-Received: by 2002:a05:6214:21cc:b0:8e0:7d6a:480d with SMTP id
 6a1803df08f44-9084963fd1bmr61334226d6.20.1785579715978; Sat, 01 Aug 2026
 03:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924085712.1040284-1-pbrobinson@gmail.com>
 <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com> <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
 <d27d0ad7-687a-46f4-b6c6-f34f3232f1c3@broadcom.com>
In-Reply-To: <d27d0ad7-687a-46f4-b6c6-f34f3232f1c3@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 1 Aug 2026 11:21:44 +0100
X-Gm-Features: AUfX_mzDprPWyjzafLFHPRoNUXXUuAWXNY0wf_WYB9j4gWDemmLGUrxrU_ekU6Y
Message-ID: <CALeDE9PH5BcoqwPhEcEf21u-_Tn72A0D9BuVM0xVQFjCHNyaHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 21:44, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 7/31/26 11:51, Peter Robinson wrote:
> > Hey Florian,
> >
> > Not sure what happened to this, you said it was applied almost a year
> > ago but now I dig I don't see it upstream.
> >
> > Was there a problem, or did it just fall through the cracks? Should I resend it?
>
> Looks like it fell through the cracks during a rebase, sorry about that.
> Would you mind resending it since it no longer applies cleanly? Thanks!

No issues, new rev on it's way.

Thanks,
Peter
