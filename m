Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805366;
	b=LP6ZN/PJReSSW9BJ6YhJWDosaixwwlvLQJyLMeR1QIeCrSYXFzsu2ZbDJUNHNJzNvwbO
	 PYEw1Fu1wBmc+ybkGJ2U3rFZl+KJHbaM40nrxbI2ruxrbOLDknBNjEr2UG4S6uPkWcYJl
	 xZbENuJ9Qsqh5X37PXPzUg9nsXo/coPEj+P285vPD49UTCqMV9iirvtpbUJI2U+hyQ+BI
	 Zh60on8fc0t/2u6WuMee5oae8mmcur/MYpZ69hwaUayIuHZI5Mrcw/sX68RP7QpfM1epV
	 AIIeIjK553B40SwHz5Jlu4mtTdejV4AhF+ciV4Isnu3+Pa4Nl4H7pBXT6rJiC0Gsudw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
	b=1se3W3EHVms7XhiMc0D9xN8bTEewKhj1HnK6ToftjMcY8b65M5gF9cGZlJP8DQlIOjr8
	 6zzUG20c22Y+2uPHsG7qfu1GYn0WAUMW3DOj+1S+mIWZYtVEPVi9TnuOwYhnUHr8cuy+G
	 w5W/mR8OYnP5nzEJSg1OhpWWNaNB+8JDn6nK/up94b7MF9dT6Io/JwU6K2TT41UdB0Lv6
	 3hV6TfEVLC1AnLXFROdFSD/8LELJwY87F6XTovOt419GwkHSRRkMHjUwQDYfCpn0Sxf10
	 RrD2FLPN5T8esntf2hArqUpRoN/HkiXms/NGwu/7baPPY7wJQarF9L8eNz/lv5jtP5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+gajlXC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.138
Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8A606EEA9
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA8A606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+gajlXC
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c4064596f05so60541466b.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805364; cv=none;
        d=google.com; s=arc-20260327;
        b=WZ4eGtWA4H6Duez2ERpJXR0L/6Q3QYzoJ9cGghKDr79BE4Z5W3l0HZ25olN5zsoen+
         2LAdOWs1lyR0PrNbnW81qxyvq5ohRYcpnFqXxLiU3HTq5EwTc3H3ZddnLB5Tq2xXBTcx
         iDKI1byEOsRRaWCk3RuIkITR/fPfbDWkd3HYz44PmVmZNOzxsrzdbtB/AG2RdGj7eJpP
         6F1MyaOALww7U4t2/9hDmjcrA2Eerz7KzFKbAH2Qcd0p/YkcdJzuSc7YINyplBQKooBG
         4bWV+ryrsaC2dBOr3Be2F58Fxv+7oGvrCOEMFShmVKd7qIG63CEKce5q7sII6b3Z1Zuq
         G0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        fh=79Wr3R8MGGPwpVx94ZxiTjlp86qA0b8+kOvfRjTV1D8=;
        b=rRMXDFfaFFzs+odKViAZv8tkgSzbcXcq2MsPjOn6YJ8SsuSdGqFuXT/lmn8eZ/Usmn
         Tz+If4C5QRlTk3+5Gbu771waQqRUBeT16MB73sPtdmWIEQ/O2eO1bt3mjKcFsgyyu6+C
         qYLyDKT2iMre5oq8wFOyBzIhuyso3IUyJWDtB1vT7q9HNCwrrLJwxgWNyzjp6NgGDJxS
         lvhosU/ov/yAP5iX9tF5gPvYEB6x1AHWGcBnk9kHduj8cw0NcaRUpdshuU5a5A+NF7by
         9WQEO6fZHa+dcFWfMDdxHqJmCx+AQKDRCVKzLwi98Htnx13y4fHaQSFXr5u5P4KlNXdm
         KzSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805364; x=1794410164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        b=u+gajlXCNeu4E/N1Rfx9lpm0Dt1PdqFXsWin8HmGWdHv0m5MS4a36qkhEun0FbEaen
         br1BcgqE5tp1xVLHFtz9cWTPjgdy0WZK3bD8tAT7OkV3sgeF2IFaTjOeTYwXcuW1zOHL
         +6wVkSucFztQJhCk5DomsSKNt56EAFiJO0qfWWadtQC6Jlv9GzpzP2D45N/XuOYPPaCG
         uSH4Rhvv4a1yQIcjZP4deRe2if0aMY5PEMFlZ73oZAM8r9XmM3EP1MOEzWV2wMcnsofd
         3AOM6FEOgnGneOY1al3Q3kK7DIvdYwG2H2GLtQ//96nDGpKFnHOXJbu5uPUlbbH8fonV
         WbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805364; x=1794410164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        b=f8M9q5k59pvou7aLsWZhg8Fnba4fA9jUPtuI54OMbrDV+MUWRSmYXkqPwJMs2/Fwxx
         EUNYTB/rZrVhI9cgav3i/d2gCccCN68Q3GCFuhx0w/YEDeIltqPFPk35HCXu0jcJhn5g
         gLIq31qpL3LCCtZE65WZhEKtOQzfVuPDsyvgZ6kA50Z7Eh0NSKM9UOlmvLmwXXM6/teH
         lgmuEyK+nRf53wLuVHmBVplKASEFsoZSq8655nA54ULtrhY2SJCy8kfBIuwiHfdUNpl2
         vd5psjS01Q27VtHbP6GEXyU/osatpDinblxtZMmXQiP3zyGczg2N9S2dc61kUpfTDIE6
         wC6A==
X-Forwarded-Encrypted: i=1; AKwUvBx2ELGcpx/oVhM0QHmAMmBkH2wrMXCYVCDot2wMd/RvwKm4HSNZCnNSE78sfOrUHKgvJLRSd8Dtao+F@vger.kernel.org
X-Gm-Message-State: APuU4Z/T/g7FonoJz7ghWU0b+HmMaaqIG0dvUihf8S36peaEZ0YHoXl3
	NodqeBUZFWIJG/Z720OLdTWRPt5tF4ykchjSwxvXjOfxcW6H53x5c2PWoA6DITMeGD4PGvSHjh1
	O83hpv6HHbmrWl5foefUoOJEzj6/A1yc=
X-Gm-Gg: AYBFou1sX6qmeqSyx0Ym/klLkm/sktlbp2TsipTv7RtgIdoAzd9FS/CMzS0BTf2ww4U
	9bHUOAk+rAGV5laKG8PaGLQDqUWILTl48xk///74v8R0Ux59Sdo1LXedylH7FFDZqSTYTazM63E
	o2Eo344LX3Z1O5I3cJSL9Qto/K5DKi6wUtWElth+1InTf/Ud3hpRpKLiwSyEbQbprfKzPwfk01d
	hsyi+9ucbCFDBgLMpCjNFc4/7PninjTxBaM87lBcxpX/AL26btrFUCmu3XEX34gxtIdtZ9OaOuE
	bYcwhwrx68tO939zPL4Rgl1A6RoeD/u2fj34xwyDWnVCL2GaBa8CpNu70Eq9bjWnrVVSVEjvT+Y
	bBfH7fUV2RaFUUEaoitE3cu0IezA1FTz3LSmIyJUzYgE8y0QxWqAbSBU=
X-Received: by 2002:a17:906:99cd:b0:c46:50c6:f737 with SMTP id
 a640c23a62f3a-c4ca7a8459cmr1547068466b.31.1793805363810; Wed, 04 Nov 2026
 07:16:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102174450.3000397-6-coiaprant@gmail.com> <20261104124020.3546166-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261104124020.3546166-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 4 Nov 2026 23:15:51 +0800
X-Gm-Features: AclHuK-zeYM4UdtsZyf6UCuVcNw6qYpttvJKvduU9hQNxft_dHREd_O22uUfBMU
Message-ID: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=B8=89 20:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > regulator_5v_boost: regulator-5v-boost {
>
> I prefer to use vcc as a prefix for consistency.
>
> > +      * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
> > +      * and VCCIN_5V (via D16).
> > +      * It has no enable pin of its own.
> > +      * Model it as a fixed regulator depending on the boost converter=
,
> > +      * so that VBAT is boosted when running on battery.
>
> What are the benefits of doing this? This is not a real regulator.
> It is the same path as 5V_BOOST. D16 controls which channel the VIN
> of VCC5V0_USB30_OTG0 comes from.

Hi,

Thanks for the feedback.

1. Naming: I'd prefer to keep the names as `regulator-5v-boost` and
   `regulator-5v-out`. These match the exact net names in the schematic
   (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
   mapping between the DTS and the schematic, making it harder for
   anyone tracing the board power.

2. Regarding the 5V_OUT node: I understand your point that D16/D5002
   are hardware ORing and there is no software control. However, 5V_OUT
   is a distinct net in the schematic. Keeping the node makes the DT
   power tree accurately reflect the hardware and clearly documents
   that both the USB VBUS and HDMI 5V domains share this OR-ed source.

   The `regulator-fixed` binding supports modeling always-on fixed
   rails, so this doesn't break the regulator semantics. If the kernel
   later supports multiple `vin-supply` inputs, we can update this node
   to list both the boost and VCCIN_5V explicitly. For now, chaining
   `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
   representation.

Coia
