Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546533BB66E;
	Tue,  2 Jun 2026 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406500; cv=none; b=gwth/kxMnkCw/sZeqyaCoKBEtats/+SZUE4IyzACsHnFgNgQfbLE6oNoSiKjmyuzfB6E5BIV6D9EqEln3e/q5qUuOfbhMRCSqESC+TdDhfUu1oEURdY4XL7eyXcxmglqIXERHBrQpFISMjUhlxyh6ZO+KTPADnp8wczIkiB5oBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406500; c=relaxed/simple;
	bh=hWlMEGxkqVHW9eu1wc/fnzwEnWDAfiD9lkWM7LRTMTE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hrEmSiJbshkqlB/QWSfGJGNJ23X9lZN8wicHi7L4B5VfndJ/kyA5x3ISvvZcJ2B/BZw/b2kABID3r3MPbybT8PBpa5joNREkjsziCzBsWuEhnaK2/EEwqcoVsqzU0439mKDIR+ka8qq2JMMx1HpZp6tMgD5CvuFApIQqP1vxGvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-05 (Coremail) with SMTP id zQCowABXr9LX2B5qKdInEg--.1119S2;
	Tue, 02 Jun 2026 21:21:27 +0800 (CST)
Message-ID: <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio	
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 02 Jun 2026 21:21:27 +0800
In-Reply-To: <178040480680.1778078.1165164069560552075.b4-review@b4>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
	 <178040480680.1778078.1165164069560552075.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowABXr9LX2B5qKdInEg--.1119S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4DJFW8AryruF1UuF43Awb_yoW8Wry3pF
	WfWayS9ws0ga1fGrykKw1UZFySgrZ5Arn0kFn5ur18uFy5Ar1vgrWS9a17u3Wayr1FkrWj
	v34I9rn2vFWUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07betCcUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-02=E4=BA=8C=E7=9A=84 20:53 +0800=EF=BC=8CPengyu Luo=E5=86=
=99=E9=81=93=EF=BC=9A
> On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng
> <zhengxingda@iscas.ac.cn> wrote:
> > Some bugs of the GPI driver exhibits a fact that some GPI
> > interfaces
> > aren't available to HLOS, and accessing them leads to system stucks
> > /
> > resets [1] [2].
> >=20
> > This patchset sets the DMA channel mask of sc8280xp device trees to
> > the
> > values indicated by the DSDTs of the corresponding devices.
> >=20
> > As different devices seem to have different allowed DMA channels,
> > the
> > value in the SoC DTSI file is removed, to prevent new DTS's from
> > directly using these broken values.
> >=20
> > [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142403
> > [2]
> > https://discussion.fedoraproject.org/t/fedora-43-44-beta-aarch64-wont-b=
oot-on-thinkpad-x13s/183074/13
> >=20
>=20
> I don't focus on the upstream for a while, was this problem still
> here
> recently? Could you attach the base commit, so I can reproduce it.

I tested on v7.0.10 (with some extra patches, but not related to
sc8280xp).

It seems that raid456 module will lead to the hang because improper
usage of GPI DMA, and without it loaded it seems to be working fine.

Could you check whether you have any problems with CONFIG_MD_RAID456=3Dy
set?

Thanks,
Icenowy

> About one months ago, gaokun3 worked well with Linux 7.0.0. I enabled
> i2c4(gpi_dma0, seid=3D4), spi6(gpi_dma0, seid=3D6), i2c15(gpi_dma1,
> seid=3D7)
>=20
> I thought this commit should have fixed the issue in [1]
> https://lore.kernel.org/all/20251013115506.103649-1-mitltlatltl@gmail.com

