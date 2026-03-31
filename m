Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78FA425CD4;
	Tue, 31 Mar 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978131; cv=none; b=TVSWVnqx8f802U4FXSwWuTWcIGkNxBM/mdqwKo43YqZOLep0a1bGwW7P62gKkqdaR2+1KJ8jOdbZsw/rP0AEWkQpjjGCVMgHeCechjQhKKyzw0oYRljY7T5cGFP+3YWIR7owFWOk4MT1KiITCjhRu0kYXzJOmc3gHnKnEqYD20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978131; c=relaxed/simple;
	bh=YfUih1exLsJMD7xKSC0lhbxqEh6hoZVtHVWQM+4KANY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwEYpQ2L/pQxlLww7ebetXdjntisbDBJotn/vmcr6svlzaO6PbmEI06F+sFTfNbKFFX5N2B4Ld5WCjyiVugVpZPvqDIt1UURcJn5m9BRji83PsLyVMNJxG3zwvnCkbI6s6cchc3a2ZKRDxYTxvstyQJY2OtMAr1XxXGZ32yK6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=n2P8Z37O; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="n2P8Z37O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1774978119; x=1775237319;
	bh=RAJ/BmxoWBjj74xPSxI88dSbFSKg+ByLjVGNOvvJDw4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n2P8Z37OaUVkoIozMA2G105AjaF//ZxGxajTkh3aHHR7QOAq5AXtskHy/W7ESbaGI
	 a+2VvsnEuBbYjnVHG2zwzhNbjAz3rGmfIlgw5MJsaoAHhvopUlkRyNSQ2R+hDoGnJ2
	 EPHZ5g7XvB9tNzbfXy05Z20bfWEnJA7Iju85KXvqemBrNgnROCFJyQfd5WUkNbrxkJ
	 TjDvbEgc7txxS2uBuK3Tf9CAHo+9xFt/HsF2NyRtpCHZPjqObmuquY3pnS4kWCS9tT
	 4AdzE3oe48rG8jxO2KD6uJOlrcb0H/b2/0SJu/jSh1bD9jzs5cNKRzkmXjkSVZmaVr
	 Y8AF0/bX2IuwQ==
Date: Tue, 31 Mar 2026 17:28:34 +0000
To: Val Packett <val@packett.cool>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable onboard accelerometers
Message-ID: <99hP9Xe8ibJcx85xycqBaG3yUezfHcy8D6ezywja7IDv_eMMPfl4zourMSO82q643vxISbWBwo-L7iKesCSVGOq9uDO5I93GjLVacPjTSGU=@vinarskis.com>
In-Reply-To: <33c0a723-7748-4199-9623-7ed3eed8bfa0@packett.cool>
References: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com> <33c0a723-7748-4199-9623-7ed3eed8bfa0@packett.cool>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 32283a8f4b08d2670bffbcefeb60a742e2a4ecd6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, March 31st, 2026 at 19:05, Val Packett <val@packett.cool> wrote=
:

> On 3/31/26 10:36 AM, Aleksandrs Vinarskis wrote:
> > Particular laptop comes with two sets of sensors:
> > 1. Motherboard: accelerometer
> > 2. Display/Camera module: accelerometer, ambient ligth (and more)
> >     sensor
> >
> > Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
> > typically controlled by (A)DSP thus allowing for great power
> > efficiency. This however requires DSP libraries matching ADSP firmware,
> > sensors descriptions (must be extracted from Windows) and other
> > potentially closed-source libraries. Opensource tooling includes
> > `libssc` and `hexagonrpcd`, but they were not verified to be working.
> >
> > Until SSC support for X1E lands, bitbang both i2c busses to enable
> > accelerometer functionality. In the future if/when sensors on this
> > platform can be used from DSP directly, this commit can be reverted.
> >
> > [..]
>=20
> WDYM by "support lands"? It's a userspace setup thing, nothing new
> should be required in the kernel.

Hi Val,

In v1 discussion [1] it was mentioned that libssc was never tested on
X1E and is likely missing required libraries. I have briefly looked
into getting `hexagonrpcd` to run without much success (though I have=20
to admit, I only spend a few hours on it). It seems just having
`hexagonrpcd` and sensors .json files (extracted from Windows) is not
enough.

>=20
> It is amazing that this bitbanging works here, I don't think it was
> expected to ever work on anything newer than msm89x7 o.0

Been running it for a few weeks now without issues.

>=20
> But this is likely inefficient=E2=80=A6 and "stealing" GPIOs from ADSP li=
ke this
> sounds rather scary. And would definitely break SSC initialization for
> anyone wanting to bring up hexagonrpcd/iio-sensor-proxy.

Do you have any experience with `hexagonrpcd` on X1/X1E specifically?
Personally, I think it still better to go with always-working bit-bang
approach over correctly implemented but 'needs userspace customization
and firmware' approach, as in practice it means very few people will
get it to work. However, if its possible to get SSC to run X1/X1E it
would be a very good argument to drop this patch, up to maintainers'
discretion.

Speaking more broadly, while the accelerometer is not such a highly
needed feature, ALS is, as it can be used for automatic screen brightness,
keyboard backlight controls. I am planning to port ALS's driver to get
those features next, depending on sensor model other laptops would be
able to benefit from that as well, iff bit-banging approach is chosen.

Alex

[1] https://lore.kernel.org/all/20260228-dell-xps-9345-accel-v1-1-daf9e3b3b=
5ee@vinarskis.com/

>=20
> ~val
>=20
> 
