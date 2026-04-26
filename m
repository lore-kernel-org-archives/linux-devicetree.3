Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E742F5328
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777240883; cv=pass; b=cx+aDK1vdX8HvGq8kYdqbxYRpDEubr2LtGhOpj0Dihc6tMjEZQ2S3dvhO3ZUYEDDPW/V7QiDL//M6ndMZBSOHZL5gF2zzWPitRMmriV8IHfZOO7rpclzaMwXd9jGgfXc6IcJslLJ4lMJDJzyoViit6U5Xnx7A5mKVsy5S+Mks3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777240883; c=relaxed/simple;
	bh=RoT0FlC8gkkNooY3mtKiEh/Tcw4FrSpEj3ULsGOQBCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0yKA1M4TpNlPw4yBG4QeZKklq53Oo/aTkF65vwZkmjz8b1Y46L7FbBZHRSCH3iZqn4tKukefoKYZ/KVGn8Ms3/+L8YdZT0Kbhp0GtrYYMdAVpOwT3NIHLqZ93sCCWShtLY6sb7OM3FdF1NFujiwFy3eQqt3e/4CSo8JqIyAkYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9WnTzis; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9WnTzis"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38cc8708d76so81595781fa.3
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 15:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777240879; cv=none;
        d=google.com; s=arc-20240605;
        b=XUqjtKPYa43eKK5L2z0k3qZWodd1Tfx7a049vor9SFbu/1OIhd2eWASvrYFP7aW8gp
         hLlhM++y1UzBJc7n+OUO1l9+hRbiIEg1p9XH2PRHkOzDCKknq2sUq75VGgsaN7mKwNfZ
         7f8xPF8JYNdrnk4ZPIQz5eKDRakGT0K59sgOHbSFJPh7zlM4mCm5YllEvKhWrBrrogAI
         k/suXQOR/8MVUlY68nSG70CxEdthTtK2MNirxYZZH1iS2RXml9NvRG11s/oOZIdlAAUJ
         QdzF2TjKksQ6+Uu4IdlXJ3uuIwbVxvJEXUmsCc2pJRUrH4DW4Namnd+fvixS/CQF/Ssh
         RhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=unC3pOUTEhfVaDjzyQfHFJSBQuvGVy5qfgGYkg7iaoM=;
        fh=Qz24+vz4K4zuYuMjAU8l2jYxDg6+D6ykSh++XYdQQ3M=;
        b=fCQgxdQsWoqWg/fb+ElCNotLUTWHh3HpkxKqICGxbrmgWlV1QoQVzQyc+9i7TNoFik
         uTZPss5FhRw2rQChX7+xyH5ID88cQcev/Ku0JH/3iYghVqdJJNIwcCT2yPYCsr/rrE+H
         dQWgzZERzwlLl2QekOqJ7j9V+osW6+0Cdh/Z7ZgSGl+FthzosyTOdmsayMTu0pHDTaoM
         8vjW0lGMSSeRGZ5ChBtzWXHDVIrlxvCGryowTRu0WMQF767MPfugVwEHK6DmpeqX4m0s
         4LhdB+4lXJ+ZaHEYxSRbk5fZeZt0vf165ZuXgokh9m4i8Ym7jnxRiEy0fklkSAQZpTvU
         1vRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777240879; x=1777845679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unC3pOUTEhfVaDjzyQfHFJSBQuvGVy5qfgGYkg7iaoM=;
        b=J9WnTziszKpiM60uYow68ma0QflpBiltDac3uNDKA6uQS0GAr46GX3ktNSCoLm3Uxi
         5qHU275NMbYJnB/1PrPreGzMEvBRyhs20XBRrD6dO2YPpQna4rzGexkkxH5k9+LNQNT0
         5780EuESkIh6SvsSe4Wx82h97GfI2/0nB4aEEtz/CNg2Vk1NTOV1VGGVdMtZDS1VOYB7
         D3aQj7lveKN9HmdTsurLiaCycKhUMXsFTCFeKhV/wvmb7+TTmFFg/ng/r1Mkd6lZ1/pX
         LqtR9R/omqtlqPJS0bRzpZ4CT4sb/Jh7mKtmvpwjkG2Vzlr87ZKIK6GOyjAL57c4BPov
         Cp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777240879; x=1777845679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unC3pOUTEhfVaDjzyQfHFJSBQuvGVy5qfgGYkg7iaoM=;
        b=qLzf7XzZ0GNDXxzS5GfqX5kQr/o8+9EmbQ3zvVI53kRwhjLW/nRNxtFasjxSKZVxVE
         b1x8k4qaWsX/s8QXV+D++ZpQcyn61T+5UWaA0bcgipHyKwkArqNMIZg3Y5NGmg2uj2ZW
         W5Q1BgJtlH/O/G7Hc7KcaLPkylwIZCzcnaoApF7joRotDAyq8ujrLsN8q3OYjE4JB+Dw
         ecGSLnh0fY0b35B7dFeLxkVm4NH38kKq5p88e7XzhIhjbLZAWjqrhN0IRaJcCbnDpQcx
         y9ykQnQyQzJfXioPJFEsonu9Ld7dnSNbuRgMBMMJBNG48+KEPU/QQrenmvNU3HBOIRF3
         B6sw==
X-Forwarded-Encrypted: i=1; AFNElJ9qg496wJRNL7WHlJ2ObvbM40HFRVGNcLsq10hIyswHNsodLwv5arXn0X/H49wBonLBkW/eCq3bOm4Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8uzkWnZ14SHgrsuXGwtGDq8RDHtqAtMvpiMqQMWXoqptOR0ro
	8J68tGHsHfcDzGZF3Un8FAf756tqjMgjHn/U3h0LUeCBXTX/YK3ezJ0jUTrMhd6Q3byKnvZB70S
	YfQRM45dH/iRu+DuxO3OCDRb1Nr3eY30=
X-Gm-Gg: AeBDievf0Y0zYBztxfkitnO1zfP/F4R3PkAhbU86Xkfe0RATfu9YjVu5cOtHFF2mzs2
	fFBAqzZW90CfLC3BMqmWwrjFYo80Sa6Nb3qzKbybq7XolxWMWypru8ugKdTb3H6mhTWEzX+E06g
	qmgsOXZvWS760K8m/lb12TFIOgojPf3PGcultoghEOTr2MTGe1X55CDxG1tCv5WnkoNaWPHwTWF
	8Oi0Uu7ULRCbKOnh2grZi17fKiTOf8cwOl5Rc4EA5TJ+C2T/IbCZKCY2XOgelXEitj038a0mqpB
	CMB86mUoTRh0n0h49XgvcRe6vgddgR+dg7WuLaHccBOFxNG46L0oC7qMb2Hywqj3oVYEOcQOsGl
	l3rMnUwaLSMLKHQ==
X-Received: by 2002:a05:651c:41d0:b0:38e:1dcc:6c77 with SMTP id
 38308e7fff4ca-38ec7b2b156mr114555861fa.29.1777240878494; Sun, 26 Apr 2026
 15:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com> <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
In-Reply-To: <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 26 Apr 2026 17:01:07 -0500
X-Gm-Features: AQROBzC4PWgXisDcKBnew0rBTvlfXoAdNMzrSM-lmHbg-nMJCSxzVxmhKjcHWdI
Message-ID: <CALHNRZ-8r9KSpAEsv6F1YfSjWUfJihwKfzdeDTkRsPJfwr_s5Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 7:11=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This contains everything common between the AYN QCS8550 devices. It wil=
l
> > be included by device specific dts'.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +     // The tzlog label is required by ABL to apply a dtbo, but it can=
 be on any node
>
> I don't know if the policy changed, but I think C-style (/* Foo */)
> comments are still preferred

Ack

> [...]
>
>
> > +     // The arch_timer label is unused here, but is required by ABL to=
 apply a dtbo
> > +     arch_timer: timer { };
>
> ditto

Ack

> [...]
>
> > +&pm8550_gpios {
> > +     fan_pwm_active: fan-pwm-active-state {
> > +             pins =3D "gpio8";
> > +             function =3D "func1";
> > +             input-disable;
> > +             output-enable;
> > +             output-low;
>
> Looks like this should be a regulator then, probably?

Mmm, what would it be tied to, then? The fan already has a reg. I
presume just modeling it as an always on reg tied to nothing is
undesirable. I also have no idea what the voltage would be.

> [...]
>
> > +     wcd_default: wcd-reset-n-active-state {
> > +             pins =3D "gpio108";
> > +             function =3D "gpio";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +             output-low;
>
> no need for this property

I'll start with saying that I know basically nothing about qcom
hardware design and what the average pinmuxing layout looks like. But
I do note that a lot of existing devices have this exact same node,
for example the sm8550 hdk [0]. Is there something that makes these
devices different? Or is this unnecessary everywhere?

> > +     };
> > +
> > +     fan_pwr_active: fan-pwr-active-state {
> > +             pins =3D "gpio109";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +             output-low;
>
> likewise, especially since it's the opposite of the active state
> defined in the vreg node

Ack, this one makes sense since the fan power sequence will set stuff
as necessary.

> [...]
>
> > +     usb0_sbu_default: usb0-sbu-state {
> > +             oe-n-pins {
> > +                     pins =3D "gpio140";
> > +                     function =3D "gpio";
> > +                     bias-disable;
> > +                     drive-strength =3D <16>;
> > +                     output-high;
>
> This is probably not required too.. unless there's a hw bug?
>
> fwiw 16 mA is a very high drive-strength - does this come from vendor
> sources?

I do not see any pinmux for gpio140 in the downstream dt or anything
matching pi3usb102 at all, I'm not sure how it's handled there. The
original source of this dt was written before there was a public gpl
code release from AYN. I do see other qcom users of the pi3usb102
doing similar however, for example the sc8280xp crd [1]. So I've got
the same question as above: is there something different here, or is
it possible other existing copies of this are also wrong?

Aaron

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/qcom/sm8550-hdk.dts?h=3Dv7.0#n1302
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts?h=3Dv7.0#n1175
