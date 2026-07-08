Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230003FF893
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498535; cv=pass; b=lOU/AKOVokSSlBXY3AauBWu0GPScuMSocfnR/rRKPEPMxN82JHJg5niey5MUQryaeiCr+Anurzr2YIPxfhlSF6w7z5tjmjzoyDQdms8h7pXR9CD3J9/XEd9R72PWJjqNaRfLQIP70zMQYFCKyOwMtttLqd9TWjMwDYDgHRvD9eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498535; c=relaxed/simple;
	bh=SBdP80+qg9PHllpVhiMYEuOeQwxwegXT4UjgSLiThb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X27qm/6DJNvJZUfomyHQzzFsgZJbYjUeKU7+nImAfgFcbrZVzCO5qYIRgK8LwUQ17tElCjikpRrnvsoU9st8BLqbOO3eSKRtDVuYpPhKKrgGu62xGS283tL4aqnMmao0cYSiS9N8z+Kl9cJmVNZSUtQYZreyYmI/JhkHeSmfKUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nvezsvl7; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nvezsvl7"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664a09bc459so557707d50.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 01:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783498533; cv=none;
        d=google.com; s=arc-20260327;
        b=GpzLUj+y/OtQZpecmEtG+m3nwuKSJ103Rn3fle96sWmJjtm6L6bcTL+mIQgzd5N+CU
         AHBAikwe8knPy+o7gdaCdFk8g0fk4feaUnYAP2yi8Dvxg8PgJJSNrlhT//nZCDygcNNl
         CQ5C9pyDwW49GGqZB2S5DhzKj/eAoBAE7/vNa8ICeiRV5o2hNK5DivWdmXYb2HE/qlYL
         a4GBc+7yyljM7x28ePFvzhACfBcY6R/t2K7I83luHrr9Avh7gwIGJP5eaPRzNYelVb8n
         cjNPAwadsotw/QAbRsY2l9IXPQG1sLGsVAkRSsCTVDfLFvyN8GcecjjDu9+kv5cgmOxo
         eJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=;
        fh=f+yIq8H1bRJ41IwmNa9BHV7hJPRlKUstkri2VAn3QYE=;
        b=GGBbZHKq4MaUtkKoiyCmhPlj1bBdkPW11RbBVkqMts1QI2DIiJRs87S+eRi9fCypEB
         reWGTBlvhcbWIIMfz8yLz3B/FmaHNnokSVsgXP5/crMSTMJLwa2ZsfsLEXNcCnJjo6nL
         FwGg7rUhY1PNfi2r5MMf28IIeSPrEFuQiA8Vje7xbsO05POK1NgZqc7U2f9l78LATE6q
         OlyERFbYOZalOIlbpQ8H+IL/b8ZO0IgH+jknjbXKOHjJG6G2YqEm9aaLvOiRDpGu5axj
         j0O35RfFXmOnvowvrRPoMsVCnqRhRclSkzKhsYzXVqomBZ52oLX9mP08px5RFAjP1GZi
         M9hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783498533; x=1784103333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=;
        b=nvezsvl7K4ktz17rvgq994ieTvqD1c1DbCQacMjVrrwNqDAZSjIkz0IsA3s4Pr4gPK
         s3C5Dqjye3uNAi4r+G8F9qPmBDDgYUOemEIADaBBbKdsVa02dQHdLsM0rtzoxHZFoEcI
         pd73O6qUCFpVShmmrYP75gD/dhdjDBMu+eUnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783498533; x=1784103333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=;
        b=V9AH3746pDdFswT7S2UOml+F6thiwKPnemloH9/cQYyWpGiKs5vt4/AtOlqkJUqhkz
         LTx0qupT6NaRCKG+IxOk/rBBLSFYAuvubiIGX7wI7I2C49nI4y+9koR0ppNmeyqZaHcc
         pFKrHqXLvnauLHa5Tr3OkCmie2tw9dWZ80oZ6Vx0Ccw4YXX5SB5C2UeBFK6d3eUGj/uX
         3RZKOOZA04Mjz+3HEl1g9HfQi5gemXc+Q7Cxc6HngmoAFrrKY3c9eFIhoFKf7ij5tkb9
         wiFxmnIAXrRdY8Vw5lduzdjSFjr1phfC38fDBlyp6cgz7lil+u6DfTSBaLUWjeRAx4Az
         8zGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG3HV0N6rOjr7LjCs8BNF+TYvsX82dvi2MplOQMkqwfql+AFOoY5tqiBHgK0Njl4g/zNNrnF4TCg8H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2PJWWl9wgzGOsmPF9CMi4kr2Dsw/KDQ+3F5v9umZr5QJxq7ny
	JKZrbyOYinWySJuYubYWa41vJhy3bxkr1A54gUzgsa5YgsD4hydfymj5n75hWV112VA0OiUAVWt
	hXl/PYiWCcKtDjF1j6PIEUvXn1ITX5JPKU+axpXzejN4fp2G6mouCPQ==
X-Gm-Gg: AfdE7clA8KNImmhwbzGXMAcPQOvV3iuwHOGg3I5BiH4CCHphdbY1WD3neqUXSajSPii
	20Qspz1LgnR4I57Zvx3endV/gIU784rAzcSelJKCqoQCfRygLpnigKa+CziszxD9AEDNsX57Gmo
	IVMFFsiiVBWmioy5OsaS8VbAoYldYX3PHukef/2yy1o0XUwDupH1PdX9kymJ/Wpe1rvo41nzAcC
	+54nRiC3n2QiY24UCONJVGCtUCo90/TzILjt660GeYNP/1/D7d044g0Dc65hbTXU1JcTxBmuFdK
	WSHIT5detJi892yrr6j4EZrHaqI=
X-Received: by 2002:a05:690e:438d:b0:664:ae6b:b48e with SMTP id
 956f58d0204a3-6679f1bd123mr838906d50.67.1783498533057; Wed, 08 Jul 2026
 01:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
 <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com> <CAGXv+5EsWVbLtUP6b75fvkDVSqUDoAOA1t3hPO4cA9sAA02=WA@mail.gmail.com>
 <2834aca4-916f-4d3e-afb4-cd2425b035ef@collabora.com>
In-Reply-To: <2834aca4-916f-4d3e-afb4-cd2425b035ef@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 16:15:22 +0800
X-Gm-Features: AVVi8CeOUHa5MdrVz6aDKyiGOSJ6AaGRjTGNLqqbDw6HCk8vEuopNlJIo0CvBmo
Message-ID: <CAGXv+5F1JJ0q_7yuGbTLbbi11E5q0SJvLAX7n=P7UjFLyJjBoA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:02=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/8/26 06:25, Chen-Yu Tsai wrote:
> > On Tue, Jul 7, 2026 at 7:24=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/7/26 13:08, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> >>>>> The Geralt design uses a MT6319 PMIC to power the big cores and LPD=
DR4X
> >>>>> DRAM.
> >>>>>
> >>>>> Add a device node for it and hook up all the supplies.
> >>>>>
> >>>>> This change requires a firmware fix for the SPMI bus to read back
> >>>>> correctly. The required firmware version is 15842.175.0. This is
> >>>>> included in ChromeOS releases R150-16700.22.0 (available in Beta
> >>>>> channel as of writing or stable channel in mid-July) or
> >>>>> R151-16721.0.0 and later.
> >>>>>
> >>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>
> >>>> This is a big problem then.
> >>>>
> >>>> I take it as if the firmware fix is not in place, probing the CPU po=
wer supplies
> >>>> will fail, with all the consequences.
> >>>
> >>> That's right.
> >>>
> >>>> This means that with this, we're breaking all Geralt machines with o=
lder firmware,
> >>>> which is not acceptable...
> >>>>
> >>>> ...so this needs a different solution, or strong reasons to make me =
understand that
> >>>> I'm wrong, if I'm wrong.
> >>>
> >>> We can drop the CPU supplies (they don't matter since cpufreq is hard=
ware
> >>> driven) and just add the regulators. How does that sound? If the firm=
ware
> >>> isn't updated, the PMIC will fail to probe, but since nothing is usin=
g it,
> >>> the system will continue to work (with some annoying error messages).
> >>>
> >>
> >> That'd be wrong, but less wrong than not having anything described...
> >
> > Yeah. As I said, it doesn't affect usability.
> >
> >> ...I wonder if, at this point, you could set the SPMI node to status =
=3D "fail" and
> >> have the *new* firmware override that to "ok".
> >>
> >> That's the only reasonable way to go forward, IMO.
> >
> > I'm afraid it is unlikely to get a firmware release to fix a non-critic=
al
> > issue. We were fortunate that there was an actual critical issue being
> > fixed that allowed me to merge the small fix for the SPMI controller.
> >
>
> Yeah, I know how it is regarding firmware updates... but you know, I *mus=
t* try to
> get OEMs/ODMs to do the right thing when hacky things get in front of me,=
 and I am
> fully aware that many of them largely underestimate such issues, and even=
 close the
> possibility to fix those, which is even worst.

Well, it is at least possible to land a fix into our tree, but it's not
going to go through the qualification process for a firmware release
because of resource (cost) reasons.

I think (?) the firmware builds are public, but that doesn't really help
the average user.

> On the other hand, I know you, and I know that you always try to do the s=
ame
> whenever you can, so please, be aware that I'm not complaining about you.

I understand what you are asking and why, and I would ask the same if
possible.

> > I think it would be great if everyone could update their OS and firmwar=
e,
> > but I understand that some devices never get updates, such as those in
> > board farms that never boot into ChromeOS.
>
> Unfortunately, this is not just a ChromeOS problem but way larger...
>
> Anyway, I'll stop here to prevent myself from going OT too much and being=
 grumpier
> than I already am :-P
>
> I guess then just add the SPMI PMIC and add a big comment that clearly st=
ates
> something like
>
> /*
>   * The mt6319_buck1 is the cpu-supply for CPU6 and CPU7.
>   *
>   * However, this device ships with a broken firmware which needs to be u=
pdated to
>   * at version XXXXXXX or newer in order to workaround a bug that (descri=
be bug).
>   *
>   * [blahblah text so that's why the cpu supply was not assigned to cpu6/=
7].
>   */
>
> ...so that everyone reading the DT is fully aware of what's going on and =
can act
> accordingly if they wish.
>
> How does that sound?

Works for me. I'll send a revised patch.


Thanks
ChenYu

> Cheers,
> Angelo
>
> >
> >
> > ChenYu
> >
> >> Of course, avoid having the firmware adding the CPU supplies, because =
that would
> >> be rather sketchy then. Just "if spmi status fail found, change to ok"=
.
> >>
> >> Cheers,
> >> Angelo
> >>
> >>>
> >>> ChenYu
> >>>
> >>>> Cheers,
> >>>> Angelo
> >>>>
> >>>>> ---
> >>>>>     .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 ++++++++++++=
+++++++
> >>>>>     1 file changed, 66 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>>> index f382f90c48f5..fea52c377d88 100644
> >>>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>>> @@ -4,6 +4,8 @@
> >>>>>      */
> >>>>>     /dts-v1/;
> >>>>>     #include <dt-bindings/gpio/gpio.h>
> >>>>> +#include <dt-bindings/spmi/spmi.h>
> >>>>> +
> >>>>>     #include "mt8188.dtsi"
> >>>>>     #include "mt6359.dtsi"
> >>>>>
> >>>>> @@ -241,6 +243,14 @@ &cpu5 {
> >>>>>         cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >>>>>     };
> >>>>>
> >>>>> +&cpu6 {
> >>>>> +     cpu-supply =3D <&mt6319_buck1>;
> >>>>> +};
> >>>>> +
> >>>>> +&cpu7 {
> >>>>> +     cpu-supply =3D <&mt6319_buck1>;
> >>>>> +};
> >>>>> +
> >>>>>     /*
> >>>>>      * Geralt is the reference design and doesn't have target TDP.
> >>>>>      * Ciri is (currently) the only device following Geralt, and it=
s
> >>>>> @@ -1156,6 +1166,14 @@ pins-bus {
> >>>>>                 };
> >>>>>         };
> >>>>>
> >>>>> +     spmi_pins: spmi-pins {
> >>>>> +             pins-bus {
> >>>>> +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SC=
L>,
> >>>>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>=
;
> >>>>> +                     bias-disable;
> >>>>> +             };
> >>>>> +     };
> >>>>> +
> >>>>>         uart0_pins: uart0-pins {
> >>>>>                 pins-bus {
> >>>>>                         pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> >>>>> @@ -1267,6 +1285,54 @@ &spi2 {
> >>>>>         status =3D "okay";
> >>>>>     };
> >>>>>
> >>>>> +&spmi {
> >>>>> +     pinctrl-names =3D "default";
> >>>>> +     pinctrl-0 =3D <&spmi_pins>;
> >>>>> +     #address-cells =3D <2>;
> >>>>> +     #size-cells =3D <0>;
> >>>>> +     status =3D "okay";
> >>>>> +
> >>>>> +     pmic@6 {
> >>>>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek=
,mt6315-regulator";
> >>>>> +             reg =3D <0x6 SPMI_USID>;
> >>>>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>>>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>>>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>>>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>>>> +
> >>>>> +             regulators {
> >>>>> +                     mt6319_buck1: vbuck1 {
> >>>>> +                                     regulator-name =3D "ppvar_dvd=
d_proc_bc";
> >>>>> +                                     regulator-min-microvolt =3D <=
520000>;
> >>>>> +                                     regulator-max-microvolt =3D <=
1155000>;
> >>>>> +                                     regulator-enable-ramp-delay =
=3D <256>;
> >>>>> +                                     regulator-allowed-modes =3D <=
0 1 2>;
> >>>>> +                                     regulator-always-on;
> >>>>> +                     };
> >>>>> +
> >>>>> +                     /* vbuck2 is ganged with vbuck1 */
> >>>>> +
> >>>>> +                     mt6319_buck3: vbuck3 {
> >>>>> +                                     regulator-name =3D "pp1125_em=
i_vdd2";
> >>>>> +                                     regulator-min-microvolt =3D <=
1060000>;
> >>>>> +                                     regulator-max-microvolt =3D <=
1170000>;
> >>>>> +                                     regulator-enable-ramp-delay =
=3D <256>;
> >>>>> +                                     regulator-allowed-modes =3D <=
0 1 2>;
> >>>>> +                                     regulator-always-on;
> >>>>> +                     };
> >>>>> +
> >>>>> +                     mt6319_buck4: vbuck4 {
> >>>>> +                                     regulator-name =3D "pp0600_em=
i_vddq";
> >>>>> +                                     regulator-min-microvolt =3D <=
570000>;
> >>>>> +                                     regulator-max-microvolt =3D <=
650000>;
> >>>>> +                                     regulator-enable-ramp-delay =
=3D <256>;
> >>>>> +                                     regulator-allowed-modes =3D <=
0 1 2>;
> >>>>> +                                     regulator-always-on;
> >>>>> +                     };
> >>>>> +             };
> >>>>> +     };
> >>>>> +};
> >>>>> +
> >>>>>     &uart0 {
> >>>>>         pinctrl-names =3D "default";
> >>>>>         pinctrl-0 =3D <&uart0_pins>;
> >>>>
>
