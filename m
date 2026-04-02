Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327743D813F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128924; cv=none; b=Zh3bTkO8C5piuqrdL28XffjUn7Zyh76tY9fC6ydlraGKAXWeYi9jCtlbnErYmPGYRwxe5H0G8vRSgHCknD4qjo1WH63LAUkEAT4YMEJpb/aaxdehJsMr3hWBOUu+QEv2yBsVZWSTL+bVL81akn5nOQt2ZCw9URDrgAG1HKR79ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128924; c=relaxed/simple;
	bh=RcX9LDtuyetHVfHjlsGuK7xjHia6Sb6Hr4bV/1hbpVg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UPVnrrlrPbIIns5in60gtuZoeIhf1dbaW3PSZWe8YxYFIAooLXmidEdb0c/JvpJhagfSGCWdgGr428wN6tYrCVebgbirOsl4bbvUlwIHs/U8ZvY6XsePWVSAXuAsXXX1E0GUSdIfTRQF42iZ5VcZehPeaMthmz0xRiqlVcIp2mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: esmtpgz11t1775128897tbf21170d
X-QQ-Originating-IP: kxlUxpWpaYTKTqzcSIXGMtW5WoW7m1TS67JGq45OFYc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Apr 2026 19:21:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4623887784994959119
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Sender: troy.mitchell@linux.spacemit.com
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 19:21:34 +0800
Message-Id: <DHIMOCFZSFXX.2XZEQBRXLISKN@linux.dev>
Cc: "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Anand Moon"
 <linux.amoon@gmail.com>, "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com>
 <aco9oLumPh4OZtIo@kernel.org>
 <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
In-Reply-To: <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NjnaxRGIoVtrU0Po5BGq0P/WeCd94Kdq2ifnaNbGEqNI8S7p4EfTnp7G
	BJyFaB7tbr07t1KMRuTx1oXt5uBkgjYIfg0GY4Uw1S/Y3gSCOx7Bf1ZfdwLh6C3E11Y/eRH
	CDOC+QqWm1NreH3232MCUCtLGjqMKi2f3ViHsdi4UA7ooBgsj7fokOJRbjBcusX56alUVIo
	+sMRj7X694oypP+s6Q3PUQ+/WEydDm62f8X1NmthhnIW9hzL2Xowqzr6w2eTF57KVv0klP8
	ZVRQj9f2Ijgrjn5PQZdOZtSxleArKt+mueZQakzfu6DFuUGPUCCwMKF3KQahTgkBTOAXJyc
	qJgtvZIxllBfgwzUtDCXpXtgtvwjKQfcIiNByJTA/Vm2krX8gkSRMalEIY/Zw2wbYc9k/2Q
	2W5MPjuqncIk/pAn5BLfaGSxj+AOvQysfQOGDTsL2bqeEAFGaRVka8HmFAizgGGPOUQOtJW
	8MC+dd2kQ4HEDGMAc7qxucf30cHpUfVpMMzQopxI4roKWxnvOZC8df0f3XV0MZr/LViDrgD
	3h6QK+PY+SHp7GuT5lmhgV+nYBHPETUeMy2YOXyN7IAfSlUi1NHTd0EXV75Y/6l2rY7eVdX
	UbXH0Vi2uETythQ3ueph5qxEt/7K2ageKQTVmXiDqQaPd8klmxwBZrUJEUuX0IuOt9zalzW
	S4G1gMcownBHGXBD6PMOE3VuJ2Pij/ht+mT1Hz1TrCYP7ujPr7HCOzfSfoW+MZ5htm9m6Wf
	81miDn8h0KbHfXkSs9bWUKaYyrN7l9SqElhqbjI+/iuGHR/CzYK0fBTIdCUL2ogT0aHzcj1
	9QL13NxBCotNXM65HIIi84a9vy29K0PO5ig8BPjunGMV4xg/FNwNdzCJEK1ii6MV2f05Di8
	uY8zHGYC2wLFa73asDTN//ndr2nq5P3sFWtKAoLkeHVDJeaIVk3tSmYP1PAhCvU3GBMXbIk
	lMghr3fCVDRP3hTNHGmVIP0sBWy7VqpP9E7UY+IexqkjGUi4/AWh6WgP+AUNczNRmJL0h8k
	NqjoYNW6AioF9rAcm+uXItX2tE4pzF9N9SvVmKar66u6BkzTdfMd3jLoePja0=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Wed Apr 1, 2026 at 4:53 PM CST, Iker Pedrosa wrote:
> El lun, 30 mar 2026 a las 11:08, Troy Mitchell
> (<troy.mitchell@linux.dev>) escribi=C3=B3:
>>
>> On Mon, Mar 30, 2026 at 16:38:06 CST, Iker Pedrosa wrote:
>> > Add SD card controller infrastructure for SpacemiT K1 SoC with complet=
e
>> > pinctrl support for both standard and UHS modes.
>> >
>> > - Add sdhci0 controller definition with clocks, resets and interrupts
>> > - Add mmc1_cfg pinctrl for 3.3V standard SD operation
>> > - Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
>> > - Configure appropriate drive strength and power-source properties
>> >
>> > This provides complete SD card infrastructure that K1-based boards can
>> > enable.
>> >
>> > Tested-by: Anand Moon <linux.amoon@gmail.com>
>> > Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
>> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
>> > ---
>> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 +++++++++++++++++++=
+++++++++
>> >  arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
>> >  2 files changed, 53 insertions(+)
>> >
>> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv=
/boot/dts/spacemit/k1-pinctrl.dtsi
>> > index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282=
a2abcc0cb88f962053 100644
>> > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> > @@ -570,4 +570,44 @@ pwm14-1-pins {
>> >                       drive-strength =3D <32>;
>> >               };
>> >       };
>> > +
>> > +     mmc1_cfg: mmc1-cfg {
>> > +             mmc1-data-cmd-pins {
>> > +                     pinmux =3D <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
>> > +                              <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
>> > +                              <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
>> > +                              <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
>> > +                              <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
>> > +                     bias-pull-up =3D <1>;
>> > +                     drive-strength =3D <7>;
>> I'm a bit concerned about this value. Looking at the downstream 6.6 code=
, 3.3V uses DS4,
>> which equals 13mA. Since 7mA maps to DS0, what's the reasoning for using=
 it here?
                ^^^^ wrong current
>> Do we have any documentation or measurement to back this up?
>
> Thank you for catching this! You're absolutely right to question these
> drive strength values.
>
> Looking back at my development process, I remember hitting signal
> integrity issues in the early stages of this driver development. As a
> quick solution, I lowered the drive strength values, which seemed to
> resolve the immediate problems, and I moved on without revisiting the
> electrical characteristics.
>
> After your feedback, I investigated this properly by comparing with
> the vendor kernel. It uses:
> - 3.3V mode: PAD_3V_DS4 (19mA)
> - 1.8V UHS mode: PAD_1V8_DS3 (42mA)
>
> My original values were indeed backwards from both electrical theory
> and proven vendor implementation. Testing with the corrected values
> (19mA/42mA) confirms SD card is working.
>
> I'll send v6 with the corrected drive strength values: drive-strength
> =3D <19> for 3.3V and drive-strength =3D <42> for 1.8V UHS modes.
Yes, 19mA for 3.3V and 42mA for 1.8V are correct.
I realized I cited an incorrect value in my previous message (the 13mA).
Please CC me when you send v6.

                                    - Troy
