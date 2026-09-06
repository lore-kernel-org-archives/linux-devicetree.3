Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441512F6577
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716596; cv=none; b=R+PBYzzp4/7zggVejEHpJEHxeGmzyS4LtJGhmtkv4lntwI1NTAyROpjXtZUiRSC4litxOejHFgzXVtf8Zg15CC++qusVy1YDsoFgoVdYZCE5DcUU71lfrq9/g+t2jb4jXkyzmB1LT8dWJwypa6lFFWmYNhb9xFSpJjy3cRhwUxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716596; c=relaxed/simple;
	bh=5nK/kdBjHaD/NMso66yY+d6rNmqA2+T5Z0LnOMGmHAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsxOnfhMGWCtpvcRksWKJRIxCD+5g3M+p4eV2gabyY1PemUzLLOUahW4AP20ciWnw17wM3Bi8pRt+8EB6DOELkPyXBfvmbPWaafM2zS8zTEyVBnK0C/qm4dpN0yucKD3d5eO0Lff/EV9Vld+WvebOAQ6zjvU6e5/tHgnR4Nw5TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=aKCaRsGv; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="aKCaRsGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788716585; x=1789321385;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=2f4fKMkS67eI3F2+CxELtuM9BfOh5FABiK5eMVC9zsU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aKCaRsGv1fc+IVqGC8tmPvq3iObHaSdOR+5na7OmcnqtnEze3yEJm7VkBSMF+ggr
	 MpKPk8NTLXoZDQT4dqYag36tKn0AhClxhEsi1tM66QKiPFm0KdVwjH+8N8DX/6e0n
	 vW1HWSCCd6gh1yVFjRW7W28FlCGZcSWD2Nm16Oc2tEl7WXTJ9x8psOzWAZePueKvs
	 JlIgIIIEinebwDTklgBTntdqr/Inu7FuMOpN7HTFOlUYene+q49Ip8op+F15sk8hK
	 rPvjktrAfxjmnbRRoKDsy2hEt7ofGBNxTi+ZuaU+hERFZIw/JLldCRwHZO0jea9d+
	 ha+XXk1+Zv9m4GXTwg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MJEAV-1xJ1ZQ1N87-00K7Lu; Sun, 06
 Sep 2026 19:37:31 +0200
Message-ID: <6266a94a-8a6d-42b2-ac8a-46dd4a16f87c@oldschoolsolutions.biz>
Date: Sun, 6 Sep 2026 19:37:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906123753.0E64D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260906123753.0E64D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ET/6Mms2lP9ZHXGvfnsrU7LePd9teVccbdgAqNihPyDk8FilPgW
 Pmb+utCpJpsg2ahi/GJbn3HICTj18e5YIOdsXSbbAMNxaL659yzyf7INwza4xZKynlYh+3O
 h1Mp1be0vQDLTPJrDVBPjGv9HTxnHhEyozA6wuCHQHZzdpFKNGpAiNlwWpQ11NteTHWYrAT
 zDiOc9du1cTuyE3tPMEyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N0CVPdBpOKE=;DXN1hruyWL9kM21/OFYrZlaqzqs
 KxAuFG4m4TrKc4PeZLQIeiipyEHUtezMYjJOOc53jeaqnqOb9U/kfAeEbIZBVkL4fJDlk8Z2V
 Z97yEEgYIrklf4dIhLraVbA5X0WLeMRIF+nCVmqSi/4c9RtMHmWQaTEkQ5YVarbEk17Wl60Dj
 DJZW/kLNPb6SNBphGBj1rsV7hvwJO6t1feBhknLM5byfgz88I8hF0b5Lr99FwUlVSCH7mm3C5
 oS/BPC0CTCDUTw5XViYvkDrFGU9I6SNOgpWVSwygyUTGSnY9FUAxTr9l/EfT9BSlpBS0K8943
 zQdIzt3miVW8hBxbDaIDcEqGrkK5S8upSURfWRFEqOKfm020oKhJ4N+d2JubfPA/fmVx7mE7E
 P2H7L0t+XstkjRjK5975VCsmFOsirXIqAiqxfHfJvRPhvmct79NGWvLq34UWIlZxJGh+wxwgS
 591Bzl2RKaUma13cCn4a9rLgfL4LDAFLA/astJgGK338/KHcgPgnqf/6/bRZ1TfjWCbiwOtb1
 OdwF2ruReZTL8lYI5BopqPMlXHcxVdFDnFwh4X1D0/XVCqThX/O/OaXYfK4AGEJEqvnQ/vH8/
 GeBOUMHK2Sd6rDdFrQwpO9UAnKjD7BVSlrXtRPQHHom/gPW8HiSTgLMdQeNMke4aUgjuMGhru
 WmhyVq/22tQGBMA7LpcYk/hK2Kx3X0X64iz1BJJgdY7Tzhw16LWBBqjNDWzug1Zaycaw12ncU
 CRDdY5ERwQqBqmTUWhSOSENLVkRbVlnoef+v/7xcu2kC9xnrprOaqQXDK4YJ1Dqc3ej5gEEee
 KN+1p33Kzc2KE3VtjmorTMRm5JgZ17AM2h6zL1N5CiJMWqtbvxF1OjLEBCEOKqmpOks7V8n9G
 cFddkrPInulDw2iWe3yWMtp+HQ+5vOf+WM7qLVdfWYYC4Nymra0cx/HWUJLK/HunVgfP3LV7R
 OTg6PtCo2MK1lOZTPaik7zfwxt+ONXKkLdIG0wPbXktcQUd6FGlt3KWi8vcXrSeL/nXv8POsl
 bs1J+vinlPy6FZvAaHdigEcjswZaSu71CBwIhfo4ZUF/FvyuNyWaU6hZOnQASMKncT+MDFUsh
 FfS966J/oDQZ9X/986izqbDS4lyzUO1kK9kmry8iOEhFD7HoGu7hWoMpuOInjz3Y1QXuHLoVg
 ZUj2fCpfwnnnpo5+Cv5DzHZChq9vkNeiuDtWx6xuyM8eV4+VVHtyLXxxazMJrB83GElTHCBHJ
 yVi2VIRgj08/OkTU5FxcTvwTsoggV5BxClQPDVKHBIAPKsYD7f1I3QIu8e0R9meBcW5gaiqi4
 hKzvrOKlpPBgh0pZMlHn2KnWBVe0nAMuDLomXIsZLzyL2XhVW3UMC/NFlD4zGps3Pndcu4hO6
 6H966JkIgv0Phx5bx+OCWHyQ5KMXqn7H73pl/rtH2QLhaiyIWzN95lkRSKb2Pyk0WsP5js3Rf
 l0NnI7YEro1rM0scdU1V4Tq4Vh+7Gtf6OQXWLufkyteBab3QS4I9xo/sp713E84IGGMEOHEL9
 1yvEl080a7JxQI2vGb2M57oO+jRDKChlAa5z9gG6lhE2zQjNfObFphgrvRdqkj9K0I3dtLY3e
 Ab34j4vbE+lSRdHlR6AxVkT5yJ5mrAr5Q9q5yWyx5+iBQb6cupeXJ/hZgnyKbCzJfkRIYjftZ
 onvfXuRD4HiPy8e5KVIlYznQPLuHHaSweYtNPG+d59cFmiq/W9ZsHJFX3wc5Pj2yAYb6VGKd0
 ivb/maUL/83Y6vgc/bY3oVThT3aLw9OyUyK2ctLxRNsAKls3k8eUIsDNzmejQDeoAsbOY07hy
 rUmu5z5oO9giBV9O2Edro0XRiZvsIrytKgo5HuGxQrLnZyKzcMV7aTr0WpRqtYpMiITGSxJ5a
 dB9Ou9x60Ts0L4UtIfKaBWAAupPk9O+smp9O0PumB7D4H38Y4zzsbbOAPNL3VokS/v0RloovR
 qnwX4R1Vtk6uvq1KYgWb//Pkh2iJxEOuusJBxlE6R1gndBa7A+G6VGVn5HKB7nBPPXLkerf6x
 ezg3zWoMWpqzNm4jWFsrzAQRUaLgRekxW7LhjEVCw+bFEhvVPWezKTdqLjEZmvqUhh5jmx1E8
 4CHamHHZx/h6NVTIfxAepsp+NSpu5WeiR7bLL1ZddqbZT/wQWjdnpcmgOeTPP6tgkrGYaSkd5
 k65szEt79UlHR6shdPE1Lw4FBMdS3t5W0FA5hDljPshE8b5ibsJQ5CVE/IAd9ffnHOVJw82Wt
 aN7BLwLSU45p2e9weQqbImNo56SDAWg3tT8PcdAZ2aC3Syv9GaEvBhxFMjlOhw9ySk7Fl1pSs
 mkUGW

Hi Sashiko-bot,

On 06.09.26 14:37, sashiko-bot@kernel.org wrote:
> [ ... ]
>
>> +&i2c0 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	pinctrl-0 =3D <&qup_i2c0_data_clk>, <&tpad_default>, <&kybd_default>;
>> +	pinctrl-names =3D "default";
>> +	status =3D "okay";
> [Severity: Medium]
> Are the peripheral pinctrl states improperly assigned to the parent I2C =
bus
> controller here? Attaching &tpad_default and &kybd_default to the bus
> controller prevents the peripheral devices from independently managing t=
heir
> interrupt and wake pins during suspend/resume.
There were issues with individual pinctrls by device, the multiple=20
touchpad definitions would use the same pin. The workaround is to put=20
the pinctrl on the controller node. Of course this is not optimal, but a=
=20
working solution. The touchpad may be longer awake than required, but=20
this is better than not working.
>
> [ ... ]
>
>> +&pcie3_port0 {
>> +	perst-gpios =3D <&tlmm 143 GPIO_ACTIVE_LOW>;
>> +	wake-gpios =3D <&tlmm 145 GPIO_ACTIVE_LOW>;
>> +};
> [Severity: Medium]
> Should perst-gpios be named reset-gpios since it is placed on the port0 =
node?
> The generic PCI port handling expects reset-gpios, while perst-gpios is =
only
> parsed when placed on the host controller node (&pcie3). This leaves the
> device in reset.
Yes, that's true. Will be corrected in v2. I tested again with the=20
rename, card reader is working.
>> +&usb_1_ss2 {
>> +	dr_mode =3D "host";
>> +	maximum-speed =3D "high-speed";
>> +	phys =3D <&usb_1_ss2_hsphy>;
>> +	phy-names =3D "usb2-phy";
>> +	qcom,select-utmi-as-pipe-clk;
>> +	status =3D "okay";
>> +	/delete-property/ port@1;
>> +};
> [Severity: Medium]
> Should this use /delete-node/ port@1 instead of /delete-property/ port@1=
?
> In device tree bindings, port@1 is a node representing a Type-C connecti=
on,
> not a property, so /delete-property/ will leave the node intact in the f=
inal
> DTB.

Yes, you are absolutely right. Will be corrected in v2.

with best regards

Jens


