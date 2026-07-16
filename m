Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B73F5BC0
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192587; cv=pass; b=XZWQMedxeAG5ZZo+qf62rakoCNEqZK8wC4yQ+F3dH/U8CicdMkwVVk2EojXtYXfqmSva90+Ht5Io4cMRVEueS25wUZcYH/kHVqVydQU3NWvbSpVNfIePE/M7CXHzD1ua8/1/L+AmuGI7HmKtiaoqHt3hmkiMms3Rg1p4kKEIgVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192587; c=relaxed/simple;
	bh=bNvh6K3tTGlbGjn6CYSJVxYE1HxUWybQE0Sbqd/a8mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3bi2o1cKH0IlQnNTlUaYAdPHFLuiiT/986H9HIVbfeX/YVSRo4ixZpMn15gJNX/mUrZe41MYozpYvfs2BIl6vC+8hwsuK8FWXL/18O8ZjltkMEfXhH00zjPc7FUasuTvzjACxvoRynCHATx6vwc9u1r+P2+XTGMDs3EZy6ZAg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIH07EwA; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIH07EwA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848595b338cso7449279b3a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784192580; cv=none;
        d=google.com; s=arc-20260327;
        b=Su7NHT7lUV5aIy+z7TGRlqjsLtC/pK3HSvEB8JQoMrvYFcLVCAYpGmVDjg3W4ASSyL
         BXIPN5X0cf53X+wVAxkYpf3Lryu+tJ21Fih3Ppzq01ahGHLid1Z5lC1qjVsmb/MX+wIW
         xX8k4n6bGIz3bq9N+N3XaLukFMD7XufC4Zp+vMxVSpb+X5krfuizv0oMDS/xqu3oGwYj
         zeT8Tl6yhEkaasFe+JJxD3MahhxyJ434yTpBAuF2pIo1JQEi0kfUlsQVimwwFUGs3IZC
         EYrSZ1RnJpvCJBZpz6jVTE5uuLAfZzJh9V2akStBm5YFqKZgnLlqFYnrEgrjsDP+SV7a
         znxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=;
        fh=yYJN3cimdxayJTSx4P5yRx+/RL/RZEs4QXYnNS6r78c=;
        b=Dpy6OwxIY7Nf7+h0btQDa9Gb47puaLMiXAyg/HJGvTTxK3Q8SHPoG5+DUGxEPoiL3N
         ViAwHVplSBv1tO9VnCuqvJePj8cGe3HBclMmSsth5Db8XhX+NK/Ps069pgs55IAqsdtN
         XosCRUppBTI571XkEbnGdwPeTJoZN5dQ58lY78ORMsKj3cAqhM4EcjUOSHd1poxjKXiA
         bIGzZgPwkPjoru3m2cv+Alm6BJEXPR8ITr5FSzLnoVIe9Br3Ojppvij5gKmIHlUO/ANg
         zDhsGdPztc9VGhIvCzpdujnS9Up9QtU+PtOnBv0BUxC0HF9zuOMzGtjbSBHtTF09QW9G
         +JIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192580; x=1784797380; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=;
        b=CIH07EwAVx6N3cZTERwYqnipbQCYJWTIa3GW2Z/RJRZqJuQOs4CcJ2+kbyiu9Pu7SO
         AavRQfADR3zoOK8s+6xCcVdURe0P/1ZffHWPpSgmgJoJasZCoZ7JVmNG6Fy0L1uotBSM
         0qyia57BpUttYVaGOnVgFYcoFc5jPWvMoQqo/HAYFK3sBERuY5KzPcWYh55nGCarvSNz
         mEYc1lQHuT72XynvGHXrhEiLSbG80aUB2Sp5qpvyE66nw2wV9u1aIM2g+bYKXvH6jnMQ
         I+uucxN+rORt7+aFddKwn0Jgt7wYXzeMPyjEgXQ/z/sgfskoa4NEaxLTKZUN3iecmXMy
         tLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192580; x=1784797380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NR3lXQ4dlpKV3WszMatO8sscZD/DgmWD4Yj1aUtkeU=;
        b=Nvx5Vhd/jw9uWoCh+v44SMSiZ8sIpEJSuWFqXxmxJcJS1WzTOUCfo67i2vtr+J525W
         9LHI0qtb0hNCBhjGhehXnT1crBVYjvLg4qKJtZtt/zjWfIOaZqpthNomGWikgrQfcVc7
         2wfs/HwgM9+2TAmkEkjedoCFU24zSAqEFI45X43nw1L9NsAZUmeV49I+rON61Ye4+DHT
         drY5ext8UGmYaazDpcRX36gNN+YcFYOsWDFha2qDTL+tm+aK3muraUtFZibb0jiBag0K
         AMaGcLU1ORKgjPbjbNiHcXbWw4AP5ldv6UCcC5mCguyZd6JYg2I53u9yJxDGj968grJh
         eaqA==
X-Forwarded-Encrypted: i=1; AHgh+Rrbph49Rgzdp521gawEqGwlOHy2kH215HB1dg+i0IIB/HVmbudh++XKyFdKy5w71RvtACQSXI6yIcXr@vger.kernel.org
X-Gm-Message-State: AOJu0YzFx+AgeYE2UiTPeaSfSr9gc0N0CgYeVvYMBzDVzRv4y6tluM9n
	0JQTxFovrw3PZdq8sjp1imPt6PMfMqQLsEgIM6SBFOSu/yO4s5T5TkIELONVksLQVMchyhn+GKM
	8OIGlV3vOY/UJO0bIfPyqH6EkzCjIf8o=
X-Gm-Gg: AfdE7cn13PRrnyNkFbkcMykQF+Rlx/JdFirBzM1waHmIxT157OsTKXHyN/t7I7GoYt7
	X67AUjj1tI69NsNesUUOIwi3eRUim40A7ldrnHQjN4gHDEeJGGhzKn3lCPXmOSvkHb63JJ3kecF
	X4bm8o8v9LW4IHiLKEJMCdU/bvCACyZ1PSSGkHBkGH9t685cwT6WusHymLMDYtNpBycVtwEn5Hq
	+HA0cWXw0QvTstfddkWY6qyLHN4UEOUziRotU45Toat/NaxjUNTMYofz0wXPL40r6sranbhkuAQ
	juozQVHUN51vzOjzIUKlz5G6DM/bu4nBV9ZbRS1YeuM=
X-Received: by 2002:a05:6a00:8006:b0:848:4424:2b83 with SMTP id
 d2e1a72fcca58-84a5598fd50mr8757328b3a.77.1784192579663; Thu, 16 Jul 2026
 02:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-3-227567ffc5dc@gmail.com> <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
In-Reply-To: <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 16 Jul 2026 11:02:47 +0200
X-Gm-Features: AUfX_mycY6mvMh4gra26LhowY8uyLV9WWyka95Odu6j7B7QABexJfnpfhGVC45U
Message-ID: <CAPSPb=tTbdzBZFq9NE0PCiD8+7pbWhErauhOfjjkp0DnhDwvRA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing pcie rst pinctrl
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	jonas@kwiboo.se
Content-Type: text/plain; charset="UTF-8"

Hi Diederik,

On Tue, 14 Jul 2026 at 15:02, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> Hi Joachim,
>
> On Mon Jul 13, 2026 at 10:30 PM CEST, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > The pins are used as reset-gpios but not reserved through pinctrl.
> >
> > Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as parents to dtsi files")
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > index 67e284a15c35..8df6e1a21180 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > @@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
> >  };
> >
> >  &pcie2x1l1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pcie2_1_rst>;
> >       reset-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply = <&vcc_3v3_pcie20>;
> >       status = "okay";
> >  };
> >
> >  &pcie2x1l2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pcie2_2_rst>;
> >       reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply = <&vcc_3v3_pcie20>;
> >       status = "okay";
> > @@ -420,6 +424,16 @@ rtc_int: rtc-int {
> >               };
> >       };
> >
> > +     pcie {
> > +             pcie2_1_rst: pcie2-1-rst {
>
> ``pcie20x1_1_perstn_m2`` to match the schematic name?
>
> > +                     rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +
> > +             pcie2_2_rst: pcie2-2-rst {
>
> And ``pcie20x1_2_perstn_m0`` here?

Can do.
I see this used on a couple of other boards as well.

Thanks for the feedback.


best regards,
Joachim Eastwood
