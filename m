Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DF38236A;
	Wed,  8 Apr 2026 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633759; cv=none; b=JBXnDfJh6R8ZW1NsuXe0a8CIeT67cljiW4r6miqnwTXCSkaA0E74/YkP6ATBRS1tf4cpTmi3AXTzAqA8b/zq0W1yaTKktSuhykR2fbYUWVtmYcsqyApxr/TI6iqzTlJ8zm9Bu98OyBtWv9UKvh0ucbQPzIqcvc0NZY7rxqyems0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633759; c=relaxed/simple;
	bh=XZV8qm7BHRHuL3w93A5yoY4tQ3JkrcvAVxVZHbS+Bic=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hP11e86nk1xpPpwghUBd4/d1YwDK+2hzLHM+AQjOKwmHuYTccJP68aYLD8mzUt/tgSVlbZexGwzevzFZUFTt7u0xekNcwoDqFCtgrV3l9t1jTuMmPjR/sB54z/giLJmu1QQ8FuFHCXqF01YurorY1G53Ss1uwoWtcJRnVorqGhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.43])
	by APP-05 (Coremail) with SMTP id zQCowABn9glFBdZp48XqDA--.42033S2;
	Wed, 08 Apr 2026 15:35:34 +0800 (CST)
Message-ID: <414231dccf62dba2a9275f0867874621f4922b6a.camel@iscas.ac.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Chen Wang <unicorn_wang@outlook.com>, Thomas Gleixner <tglx@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>,
  Manivannan Sadhasivam	 <mani@kernel.org>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 08 Apr 2026 15:35:33 +0800
In-Reply-To: <MA5PR01MB1250025586EE7A236CAC536B1FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
	 <MA5PR01MB1250025586EE7A236CAC536B1FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowABn9glFBdZp48XqDA--.42033S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4UCr43Aw4rJw1xWF15urg_yoW8Cry5pa
	1DuFsIkaya9rs7Ca17KFWjgr4xArZ3Ww4DKrn8G34jqrZxXa4UJr43tr95G3ZrXr4rXw45
	AF1Uuw1fCFn8XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUnj-e5UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-04-08=E4=B8=89=E7=9A=84 15:04 +0800=EF=BC=8CChen Wang=E5=86=
=99=E9=81=93=EF=BC=9A
>=20
> On 4/8/2026 12:01 AM, Icenowy Zheng wrote:
> > The SG2042 MSI controller has one 32-bit doorbell register, and
> > each bit
> > corresponds to an interrupt. At a glance, it seems that the MSI
> > controller can support 32 interrupts; however the PCI MSI
> > capability
> > only supports 16-bit messages, which makes the high 16 interrupts
> > unusable in such way.
> >=20
> > Reduce the MSI count to 16 to prevent producing MSI message values
> > that
> > cannot fit 16-bit integers.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > index 9fddf3f0b3b99..9f1820a7b5a9f 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -234,7 +234,7 @@ msi: msi-controller@7030010304 {
> > =C2=A0=C2=A0			reg-names =3D "clr", "doorbell";
> > =C2=A0=C2=A0			msi-controller;
> > =C2=A0=C2=A0			#msi-cells =3D <0>;
> > -			msi-ranges =3D <&intc 64
> > IRQ_TYPE_EDGE_RISING 32>;
> > +			msi-ranges =3D <&intc 64
> > IRQ_TYPE_EDGE_RISING 16>;
> > =C2=A0=C2=A0		};
> > =C2=A0=20
> > =C2=A0=C2=A0		rpgate: clock-controller@7030010368 {
>=20
> LGTM.
>=20
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
>=20
> Tested-by: Chen Wang <unicorn_wang@outlook.com> on Pioneerbox.
>=20
> Thanks,
>=20
> Chen
>=20
>=20
> Hi, Han,
>=20
> Will you please run some quick test on EVB boards, I have no such=20
> hardware in hand, thanks.

I tested on EVB v1, but I have no access to EVB v2 either.

Thanks,
Icenowy

>=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

