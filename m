Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08DF472F8E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962014; cv=none; b=h8ySIhol5okIG3XUnbUY76Nd5fK3NGZ2Qe/cWUZBlxvkzCt5u97OEZ2VhYvqCuOgoaE1FHLL5o/Z3P8ict1LXl/YkBj0NB+bbLSE4muRB1hh7zhr9KOTRhn/nigLBkWPTtkveUvRCeEEk0ARwQ4R/B5pVYYE61JevTAm4Z5Yuyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962014; c=relaxed/simple;
	bh=9mrSsHPa4bXpKYKfhljS6kvWhI06svtBMx4uFYIpfjk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=A9mESyne/msqZc71RCzBnBCYlIbY3y9O4EFNWmeuytkpdvLN4j0im6geMe/6yupto3cJt6PIu1Lrrd6X66oErAx44t8PF3uRfpmuHx9momQ1/Nd642aAGk0z72qOae//LRS7hNo5NDqgKc3imBVW2P6/nJDUrlrWeqYRlPLMNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p2VCxDwt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p2VCxDwt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so97131666b.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791962006; x=1792566806; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjC7NwRckRsBLSkDSstLxhiqg8sLruOR8jtJeu7RHHA=;
        b=p2VCxDwtL4cRd0Mklx5vTAWIWN0lL6qyf/uwatMmb1Ft6tpb0LWvc1tqF9hzUUMj5f
         psHSrVTE5dYHj6A4n1hPI0geeq9pShLwBaG1yq/gjQsZsMRD3WBo7sUSyWpKqyb4+QPf
         kv5TMdbqYQatnOdRW6Scvu7KR7r4xTYEP2DwX2SNl22wtLzMzBfAuaU5iDZhl5sYqvfS
         4LcZI9/4WuorKbwbL13cfy+pz3FKlcl0BcMIb57Uc4bTaCvpAfZ0QdbDq7QN4cl4zXI8
         UHHsWjhTnGeNJ2WkGE/ZogpHU6CkCpdTdnOoBzmSWVWx+36Ccp8hg9J5MRTSJMY6giSI
         aOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962006; x=1792566806;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjC7NwRckRsBLSkDSstLxhiqg8sLruOR8jtJeu7RHHA=;
        b=VgBZnCv4ogUCD3wurRibVCluXp9PX0xUtb8uK7eWNckQm80e9DaSUdBO4whXBAPyx5
         VPsn0qvqVwk/wEpkdohuPSa9YckpPNQETp06Cz2KoBjSGnUammtFNyWo2MXdGsShVq33
         EoT61iOr4QGz7nIOWuKj5AWzA8Utn07uMHoYyRNYlEZZWjuglLdAQJUTvHY/4Ru9GY5I
         +ekkTqqej2pSRMvo/JeQmvQpH44ZGseI7qMqS7jCuTZ24gUlIXZJ8Ux/I7DNHrhHhah0
         7MpiMW5hEI/D7MYFJsMPAuXXJ//Xlta/YKZbbrsDUV63HRZu/S/4nyVkR5NSskEpAOR0
         oi0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPHcvVReGiBpu024dkGP3R/Ll9ZxPKsAxSrO1sPAtN6kWliRDSBo2WnFegfz1qF0hm7EWW+78PvdBj@vger.kernel.org
X-Gm-Message-State: AFq9FYLUR3J3/CiwN9XIc84WfkWi3h+i1FVWBnAR2Lw/SjJ+XVI4J+Mm
	nzLQKxfAzonwejMt6CXmHsL6bcu3ncTqM4Ddl2z0/sgzHSUIsok/IKxGXKidyB9ZayI=
X-Gm-Gg: AYBFou1h8o0OWq2wRajZPSBMKl8hsFQLQ8k0zrHi18MODGK0EwOwmfneoInaioDPFFB
	/FMVfQHWK9k42GBtDjrXtqy49EgiMtfPiPmy96fmWUiVjx5NQH5UJQ/VZgy1YpIVHeroJUAlish
	k/lYks5bDrEg84I6Nd62Yr63J2m5rym1aODnBJqdjexVh7I5GkG5E63WVXd34cFMF+TO+GQ/+xv
	jQhRh7hcHkbc/ifnJ1krhvWYid4jzN4FCNE1Q7exmtSKSvX/IaStnnMg7iRNQE8rO5hMZlwkyPP
	ZXujdEw26imYXIKrCrdm4AljDguNZAGdkgrHaGRXDVzwRdfSDHvB1QC3yYHrydspl5gV8bM8FLi
	qku75BwK6kpefYwWlU0G+d9nXZJYiVrupXMrIljhsbn1MDW2wiDv5fPLyBk9aGEcS3n/ChJOtis
	vgwE4FEHWfEp8cPCXLu1Uq65F0oY0HrRDvt7Y1Wc/iip42KulYTsFuXudad/SamukfvHEsgfMsm
	8zgpsFRiq7rJukfUG9okunW6reh/rOTLCa6kPFHG3M=
X-Received: by 2002:a17:907:3d0f:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c31a9ff4c22mr1294994966b.9.1791962005877;
        Wed, 14 Oct 2026 00:13:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34adc25c89sm346173466b.45.2026.10.14.00.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 09:13:23 +0200
Message-Id: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Douglas Anderson"
 <dianders@chromium.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
In-Reply-To: <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>

On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> > On 10/12/26 8:11 PM, Luca Weiss wrote:
>> >> From: Jasper Korten <jja2000@gmail.com>
>> >
>> > [...]
>> >
>> >> Signed-off-by: Jasper Korten <jja2000@gmail.com>
>> >> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
>> >> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
>> >> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
>> >> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >
>> > Good to see the Lucas are in agreement ;)
>>=20
>> :)
>>=20
>> >
>> > [...]
>> >
>> >> +&usb_1 {
>> >> +	dr_mode =3D "host";
>> >
>> > Does OTG not "just work"?
>>=20
>> Is this a feature one would want on a laptop? On a phone for sure, but I
>> don't quite see the use case for the laptop to be a peripheral? But I
>> didn't try it, the USB basic setup was done by Jasper
>
> Why not? It's more or less the same set of usecases: USB gadget device
> (which can be a networking gadget, serial, etc).

I can give it a try!

>
>>=20
>> >
>> > I'm assuming there's no pmic-glink on this device?
>>=20
>> I'm not quite sure yet how the USB stuff works. For sure from
>> observation, USB-C only works when stuff was plugged-in at boot time
>> (UEFI?), and charger also only supplies any power (but not actually
>> charging) when plugged in at boot time.
>
> This means that something is not 100% correct, for example, missing EC
> support.

For sure some bits are missing. This laptop doesn't have an EC per-se,
it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
of drivers handling EC-like functionality.

So e.g. already for battery, we just talk with the sbs-battery directly.
I assume this will be the case for the other components on this laptop
as well.

Regards
Luca
