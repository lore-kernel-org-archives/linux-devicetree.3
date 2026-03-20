Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0E378D63
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 23:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774048009; cv=pass; b=eey6FSjU6HYdlPICuIs/oTi7c3DeM/qEuWVYNoOT6GuQt6bRrgKmlJpnqpcZWm8zndRhy96HkWi73or5hKbY6wqbYZO+IbWUdrQPjPcNwipR6iqyIMyDS4NKJSfG/BeZUyslTYkZWNzhDPfywB+laC4Yio70QsIPu0WelG+0An4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774048009; c=relaxed/simple;
	bh=nmf2U/fq2NkwdoCP+J+jMD++Sh2erXOqhI+iK+kF0zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOHD6hQvwKAjHCyTvP4GONzX3rPJ5i8RB7CsGGoeVuGmeuHVaQOg9qrIX4j+8fXBDPkh8mFxwjN5WH0pQW6cMdaNj8pzpQS43Sr723gTCMY0xF9LZZ8J8rr62jmGw2Kmfi+Ng6iwtwPkp9ivW9cZdbkueWg774sRYQRFLuA6mqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=junfN/nA; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="junfN/nA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so315738166b.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 16:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774048006; cv=none;
        d=google.com; s=arc-20240605;
        b=hSILpuVS2XzUHpfvjaL9+HAGSHwnYHZ7bTWmr/0rBs1MbZN36OmK6T2NIgnfDLg0Gc
         YhKEdnG/k1V8uy0JgBoQHZDTt2JkegmY1E8zXNVRRQNRF+xDLuXZ4oDU2Zf4X/NDU50w
         ru90ay5aRnIVlr5hYP+q4KCSWO80kGB9agNDOFu+b8xtvQj6cEMsuE6hEB3MlzDbAQLm
         CEamd90G01ipONxgXsFBFPXGZJ10wcsZONTAPV0tW7Vi3dXt63/+uWfkUMRlNL1pPPst
         KGCBR8lTED/IUX0psk2TKL3ImdyJ5wtIdRjuUSjmsgB40b0EIN0JpwSC2pjRRXI+OshC
         uUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=;
        fh=LUDUp6kystYAd6+sGXHHcom8a6eah/CeGcyBUouT6j4=;
        b=czKl3+nBAcPSxzYaRpoyQ9M2lzTZEzJAkttDmSZwrDNPrTzf+NPM/VX2PV5w9b481f
         7jCdbRK5/WumGDg6IcYFVVvMgU8VjZy/Ek04crXnlFfnBqlb+pRUpTf3LmAG6REy1KO+
         PQBq8dI4rpGsWGsYp2L1hNu5iAmfpGUHHkRjg/OL1WEuKHC6cbPmsNXvHX4r0S6PUc2u
         EAeD5DuR3fzILJUPHtA8m/Ufd0elXOWBO9aMcYy+GZnbeX8DTeG47yzwQ3y1W8JnuNPG
         qFD0QvKk4BiFDMz9rJs0HmjcMBaJ4hhU+YpfZbq3V+nhEdDMuvKDTxv8ajRCafjhiPCT
         mvKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774048006; x=1774652806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=;
        b=junfN/nAr4LXNmEcuSXJReohPnIU1t4z5YYB7VNe92zoATU0SKURUCImy15DV/TQj/
         Ql3itvcZxY8tqy6Qh0kwk5ryd3fGC+b7Go3Y2T10nVhwbUGSJbOZYFRQfqqJfnx0xibx
         dtwZ8A9fphNfcspVxq21YVTuaAUHkGoQiWnmKW8irQRpX5xLtE97+WcEYCc5E29GvS/h
         J3hqwwJzkxwTa7hXypKRmQasvrOn86sw4lfeHVhmaHxtbysiTt/nHfG5tsIJfP5mcslu
         VU26IH8fROcsD/UvlDFb20jRQTvndTAze3UOxNnmfareQIKE3cUmlS3nrR3akWQheifz
         lgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048006; x=1774652806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpEl+bjf7Se4KqKa8OldWT2rsgy4As3qV1p2NkGwJiE=;
        b=EVL8eFp5R0WIRduxLHLLL8lIV6YhCkqQcybpAu2uPYlonS7/+SvEBtJvriqmcXe+Bp
         0tRgPtZV/jzeGGhjSgllqmwctArx5/SSNq9kBPHLMtCV+f/aqVGHBMjhBG/c5557q5yh
         /N3kiBqYKpsNYCWrp4Ifc5IaiMn/lUAn353XBoKsHr5Y9btvOU4LgYrGP7HNq9cXydGC
         9T0u9I1/0r+VLxFFm/0RmVcrsBWcRju5S1veRKCyh7hvdHA2FDVseSka0L5U/yJtGpoY
         wQ+uKdPILg76dJRo1CoUjnD9ps74q0OX2ZJWM+xM5eOnDX858GqSgUcIv3VAaxnTAok9
         xpYg==
X-Gm-Message-State: AOJu0Ywcc4zMByEmPoeVdYTaW9dcA2KxyMdsqkvQxwTWmsAg7/Lsmdcd
	ycTBcsmIX7YUtdz9bq8+p8ZViJFsjBw1c2gUhLZhaM1WrXoTY8y3BmgVIV0LiQxb8yB+R0y3KbM
	SXmQ1oMRXutpOdD60z1qpnsQzdDh4OeLkbTlMuBE=
X-Gm-Gg: ATEYQzxWYGe6Z8Lp7XiqgGX6oIfji/p4iUzaSEkx8BTDCxeCpwVpdzYXYG/VzqLnDGQ
	5DjGaiUJqoismMpEcJGnQez9NgXB+rOOOYB1Qkvc+nlmjg2lFgL7zjTmESyStl8OuO4s5/k3qs0
	6ACElHrc9yegQ/UM6ApiEMwsdv842XZJyjsreSUr9GWdf/T4OCo3PbTfjUdk0il5OgkLwTHpvvt
	tJseEX6lq8mEeTbA29omVUvAXeor0o+/ytwFwwHo50ISXYFmY5JltXJGARfS5fPLfz35gh0k7zl
	qYVurXj26QKY5bZPAmIYLsJxHDiHwUfB1/PQ4aygjaEPh0RJaIomGwmrMV4LHp1Bj4LN8Jgmyrd
	HSA58QA==
X-Received: by 2002:a17:907:d307:b0:b87:965:9079 with SMTP id
 a640c23a62f3a-b982f1ec9cdmr353416866b.3.1774048005909; Fri, 20 Mar 2026
 16:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-5-rosenp@gmail.com>
 <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
 <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com> <fb4c139a-1abb-410c-950d-97b1ed44c9ff@broadcom.com>
In-Reply-To: <fb4c139a-1abb-410c-950d-97b1ed44c9ff@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:06:34 -0700
X-Gm-Features: AaiRm50XMMvY-ZjWrkWG_HgoJNYtwJ0GkH_RFkCpOeL6_sKDraQYRQHZTp5lDU4
Message-ID: <CAKxU2N97s7L+Aph62qgtZZQUoVtjydP18ryTh=vSOXFTV3s_6w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 2:34=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 3/20/26 10:29, Florian Fainelli wrote:
> > On 3/19/26 17:29, Rosen Penev wrote:
> >> On Wed, Mar 18, 2026 at 8:53=E2=80=AFPM Rosen Penev <rosenp@gmail.com>=
 wrote:
> >>>
> >>> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
> >>> some of them for proper operation.
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>   .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 ++++++++++++++++=
+++
> >>>   1 file changed, 50 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/
> >>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> >>> index 617fb55bc52f..7b1363aa1144 100644
> >>> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> >>> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> >>> @@ -93,6 +93,56 @@ led-3 {
> >>>          };
> >>>   };
> >>>
> >>> +&pcie_bridge0 {
> >>> +       pcie@0,0 {
> >>> +               device_type =3D "pci';
> >>> +               reg =3D <0x0000 0 0 0 0>;
> >>> +               bus-range =3D <0x01 0xff>;
> >>> +
> >>> +               #address-cells =3D <3>;
> >>> +               #size-cells =3D <2>;
> >>> +               ranges;
> >>> +
> >>> +               pcie@1,0 {
> >>> +                       device_type =3D "pci';
> >> There are typos here. "pci' vs "pci". Should I resend?
> >
> > Not necessary, fixed it up while applying, thanks!
>
> Meh, this was not even build tested, even fixing that gives me:
Was build tested on kernel 6.12: https://github.com/openwrt/openwrt/pull/22=
223
>
>   ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make CHECK_DTBS=3Dy
> broadcom/bcm4709-linksys-ea9200.dtb
>    DTC [C] arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb
> Lexical error:
> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22
> Unexpected 'pci'
> Error: arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22
> syntax error
> FATAL ERROR: Unable to parse input tree
>
> Please resubmit patches 4 and 6 since I dropped them as a result.
There are three "pci' mistakes that are copy/paste in this patch. I'll resu=
bmit.
> --
> Florian
