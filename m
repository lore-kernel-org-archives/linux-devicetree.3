Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793639882;
	b=0CY+qJGVe/8d1Yrxk+uwBUZlQT9XnD8LTp4aQMKUU36LJosj4qk8zA9ZezSgd/a58sfg
	 b5PucR8zyFslBQmS5WlnZUjjdgwq2co5DKMYsCrghdgwGX3NIjn4ojErVbq3zmj0uraPg
	 3qLxkTK95lLJI0yhzA8tREPJK3AErxL+1NCoc7vob5py+CEKOR/sJeGHjy7YMa7r/KFgZ
	 6fZVium5UknH7FOD5vrtQEO+39rzQnPUugjB/rsFihP7q8q7YpVqUiJQCN1p0AWuzRajp
	 R/EEen+e9XoVrTnTG7A4h5WEVgWh+6BfXYHk345OKqGwgu+5qbaKIAYreXSHCpwtglQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
	b=AGGSFGXRlsz9kqkM0Ww3LPSQQDdbOCwKPrNVNAZh8u8mC3KuDe2p1nO8SMopnhVo042/
	 29Sld8jcaThBCqWca652CNS8xN+fP81Ap4dGWea64MvdNEv8coI+U5EGmFa0EFE5a9JMh
	 95guVLMa1689IrYHkOYWKg0enr6ZPuvaTybOKvEOZJLUrsHXvt6CGwwVIBhcPFGuL1UNY
	 W/k0Mqm9NcKg8VGuEcouXtsPRTELo35sOkDt0lM3/QTgnpwQdhauFvaNdfRk2LZlZSxow
	 Uzg2phjZf4aHTR+VhCQfxh7LiszVJi/CjytIoVgFfuN9ET6PyJ1uJtYgvJ+/o4IEmEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S8/xtf5n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.133
Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B504606A935
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B504606A935
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8/xtf5n
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c46c4bbb06fso185151166b.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639880; cv=none;
        d=google.com; s=arc-20260327;
        b=p0wk9UVVF30plmbyCpdAmI45LF5qK2fmX0rqXklYQkIHI9Qrb/ipxBwI1nu8ocjh6v
         6Zz16i2SJn9lJK2H/WH7SlCZdCK7zCr5I8LTYhyn0uBBQ4mti9/K0AYbZJZzCrMdfVvs
         Nzny7WS03SvykBXJbBdYwwsC+ESv2IJ39yAChiQWZwByVU5rbZUBiQbivNM2DPIDxF0d
         mUXaxzZl2tZ6uhFuP2t9RPmhFKGopzxrYDS3X6pN7buPBPx+IpkOb7USV4xqVJIvoNmB
         FjYXogqUcvpaFZ89pVwuN/6ZvAqPoAjofoTWwYWoERSnxyXGLZ3mpbvzVqqvD3+4ENeg
         0dmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        fh=4jg5YMg6/MJ2Zk6nRmiUdUpFDQpRqXsSwDXfc5enbck=;
        b=rxl6Js7Q0+InsZDv17arAZYRzoi0mqkVkhAzJvAslF6xfPazHZR3kr+WD9F9afeIqo
         SM6jyb8OANRhQpKvcjXzEqcVfUlhCFbTbhnul5foIPv36rtoDMdYZv12jgb502YjKFDo
         OhFXCdCod3BuZrl+mDsl0POLjbEPNrhtH0J/g901GdbQ75X1RWDorsDXDz3McAJYNgrY
         Hcjkw3b6vnqyVvpY2CO87pRPf5zOpd/1P534+pm4q2NQjOr+VpT4CTCuCTfZwiCwuZ3h
         hiA9au8OPJ9lyeiU8/K1EphGhKn4z6rIFfMjx3enjZmn5KgH+uS/YNbTLSmNmI4dJzvw
         d9tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639880; x=1794244680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        b=S8/xtf5nI5XN+mtMXHEz1LgQElLtNOZC7vS3uIfQSWokf330we3vOZMQM3xeimF24A
         L8D2XJAqKIbQWbSXNbO5m10DXFZkkB3RqeZvytKJFR9BFHwTVKQWI21L5gFWqxEZIQxJ
         6gdPX43XHVtYTmQwtkCSC8t9g3zDCugDMTn9/07hXGXGiaqJOqGDkjGL+3vlLvUX4r2R
         9l9ulrjadXo2YAw2bf06JBvrDtSF56w8y7fio/f03UtBcCUjCvXX7qdb0iy/4yE1TXZ8
         zkBTI7KBoiL+oC1aKqtBsSiTjCgzxF6m4n4cJkrbenYuuPeNWG5DAA7hXBHmSgf/8nDy
         6Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639880; x=1794244680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZqLgjTNQffm4puDahPJd9/7EHswV3BahHnhljOtjho=;
        b=YYfPadxr55BahgwpqYSGo9aGWqjit6+c1jCtRCPcTFZnHGDXFTsGKNyEiUfXXIjeXK
         HZcXMMQLaf8+a4/gEsNjiMGczltGTyFUadcEfaWZxjD2CgFbd/hif4cF012erxjJc/1Q
         BLxtsI+YuGdjYnM3YjOPZ0U8rJQVzbcaV3zfzwY345ZneCzbdmU64ljbuTpsr8x03m6K
         mo5OLXlFQIxefqt5zPfx3qOFvJM8xSX3Wu+GALlMCRHRIWAVuNG9US9FWaOfjT8Ugkc9
         APnEbycMP8acdZ0ztxHJKZY6Va84ctzqPfffR02Nn5oKizmtfrbu+zf2+C79Pe5MNYUU
         4GkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1dRzNXZi0ZBmX+o7CtE+W/bUx8TZGXvob4yAk4H9VCJuxk6Si8gNZsuk3EF30vx+IBjKLSmeKHET7@vger.kernel.org
X-Gm-Message-State: APuU4Z/TXzpsj9s6wMjOUMZuN3v8iGApOgHseOVMUWhFKY02YMGk0Diw
	jgohvTxZZwPrrlGyvO4ZvnHzinAcaurnI4zhTTb6mj50/KjRzHR5iP2WkG1n4x98xNMFgcfe3yb
	VU/D+Yyci0pzZ4KVWIMhgwwiF+owZs/g=
X-Gm-Gg: AYBFou0kMoQr0thTixz4ysK4vNdkYEj+K7IN1/1eWgpgOM87L4yEfWarb6FhOX8jUH6
	fZ9sGyzzx4+7BUn79B/9p1/WJQWmxmQaddNI00ZqRDnGefl7dyGAI5d/Z3YQHbSSOTNqgeIU4fe
	AH0d0qKp016JoFqJfq6g6wBvKVckJYOT/BEh+P4UhQicI8tVLz/PmkCybc5TGpjaz5dzsJQ96Ed
	kUSAvMdmTIAuoaTmTnT9mExW7IpiMF7TODwauR/+y7Z/8oc4khFaIWuHhtB+q7od/T9bwUnWeMK
	7Zexyy21ZTP4tjZ/4aQkZSnaAYwK4pHqOsr/ZVEaH+3Vg/UnRiWgLhqYfdqLqjbUGgymJQ3uwJO
	aiE9pQP5nr2c9UzpusmRWjf0iV9J68aoo0DHypRY=
X-Received: by 2002:a17:906:7309:b0:c41:c718:f5c5 with SMTP id
 a640c23a62f3a-c4ca7a15633mr908428966b.13.1793639880351; Mon, 02 Nov 2026
 09:18:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101192807.897562-6-coiaprant@gmail.com> <20261102115001.1820171-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261102115001.1820171-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 3 Nov 2026 01:17:48 +0800
X-Gm-Features: AclHuK-cq2cybZ_qtRU2eWVJYfCWRlRj-h4oQeg1rwA7i6-MdCUq3glp_F28zcs
Message-ID: <CALj3r0hU-n_c0QSw8frG3j0bHenDa35-c=WbnYU5QTGS8rOZsQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat
 in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=882=E6=97=A5=
=E5=91=A8=E4=B8=80 19:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > +     /* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
> > +     vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {
>
> This is incorrect from the schematic:
>
> VBAT -> 5V_BOOST / 5V_OUT regulator
>                  |
> Boost_EN ---------
>
> 5V_OUT -----
>             |-> VCC5V0_USB30_OTG0 -> USB3 VBUS
> VCCIN_5V ---            |
>                         |
> USB_HOST_PWREN_H -------
>
> So you should modify the vin-supply of vcc5v0_usb30_otg0.
>
> > +             regulator-name =3D "vcc5v0_boost";
>
> vcc5v_boost
>
> > +             vin-supply =3D <&vcc5v0_usb30_otg0>;
> > +     };
>
> vccin_5v: vbat: regulator-vccin-5v {
> vin-supply =3D <&vbat>;
>
> > +             vcc5v0_boost_en: vcc5v0-boost-en {
>
> boost_en

Hi,

Thanks for the schematic pointers. While reworking the USB power path, I
also noticed an issue with the modem power supply.

For the USB fix, I've reworked it according to the schematic:
- Added a `vbat` fixed-regulator node.
- Added `5v_boost` (VBAT -> 5V_BOOST via U16 and BOOST_EN).
- Added `5v_out` to represent the OR-ed 5V_OUT rail (Boost via D5002 +
VCCIN_5V via D16).
- Changed `vcc5v0_usb30_otg0` (USB VBUS load switch) to use `5v_out`
as its `vin-supply`.

For the modem, the `vcc3v4_rf` regulator was incorrectly supplied by
`vccin_5v`, which means the M.2 B-Key modem would lose power in
battery mode. The schematic shows it is actually derived from
`vcc_syson` via a ferrite bead (B1). I've changed its `vin-supply` to
`<&vcc_syson>`.

I'll send out a v2 with both fixes shortly.

Thanks,
Coia
