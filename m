Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096550;
	b=0s75MALcnG+U7eta1qcgRrJ0fv0lSZqUi28Qar1/BwYE500DWG4t1k4YMEX+SD9eIsjE
	 K7hjTdDhRLsczz4XgZbz/C3vyq1CZVjH77ktAMHFxaH9GGCuNc0Cp2OszU+6BQDZUOof2
	 R/OKvS48ycg3HF1WIqC65yct0bksCr/9tIiW8/kz90fHLpgIM9Qf1Gx+P1PlN5lwCepyu
	 87430curR5R+3tQsmKnsXfVtBiGB7gWvE3fVEixSVU0M8IsEgGgRpq2TnOPnlUAtqKuyv
	 Ruhlln98wiHl+P9fvLfNOEF5fifi4fcvAZRnaphjLWIuQd8B7ulU3iduFdSDPzMmlXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
	b=Sfgl+8SkK/mgjzSsOjM66lyX+2lCNYtll09QUdUv5mEGSwMje2sJV2E9EBuhwvIAxwbq
	 ZTFxPwczhe6Hw+JKN8ICI20xEiFGpXuvfZjj14vt5AnGLeEBS/hcBo43CcHanYoC1iHvN
	 MAcMSXPydj+6ma/PHyoCKp1CmtWmfE253mJ3iOTF0xmp9st7uaC/NMbl1Ujiu1qP6PdP2
	 91sMhbuFNF72v4XanJuoKrm0k/N0PWYp4btYEqS27+TthL1neASaAWy82qQV6lMPKq4pS
	 lBk0NhaiKSy3G7QNEEMeHqv6DlY1PIjs+I16LIw1y9r8sq+IXrByX5+F6tb/VbzSQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRuyvpw0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000A4606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRuyvpw0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32317145e9.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096547; x=1793701347; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=PRuyvpw09AXUhxaqoKSn35lLtPWxMtTHN4GQ32Ex6SVZaLabRSVb6RMYIY5MIg5472
         Y21PXceAqe42yrKRyJUq60g3sTXY+cQvLfgRLC+eblPmGWtUc/yYHsyf+6QEetzx5pLd
         mDJGFc5pP7iWYBYbeGGFHu0o2HpM5oYrVZX9a2Uy4BAwmhkTCB7tMBmLK3soa13XGKnx
         QkBlNFeA2FnfdG2NVVT4T5s+mMNk+Hhgyi418fm5yPTg1ytt3IiWE9iaa88WGiyvjk/T
         aB9/DQkSPRi9hMKw99M6ChHLh9sgdtCpjKBi3u70cpl5PwzDywNX7roYNXKz3h9HO/EQ
         PnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096547; x=1793701347;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=bURgH+AVj0qg1A4rFklKLuVam/tYli738AZaHdricxhrvMBrrnMutcvL3RxbhlvvHB
         eDWW40rHPc0BT5lACu5LgdD696sEtXJwqfJ0VQqZRPrEqeQRh18jjz710YZqsU/luH41
         B0oa6vqT8NC/ODtYxr7x9i8F5587ln40efZiCnF6Tsr6LAj/XgGvl0bsZfY2LG2pk5FH
         Qu9bVGvoNaaeK1svZzaHoCv85UxqRrL00ufJoARVjJLH1oygXuZ+ifGpt+d4jd+YHL0K
         v316IjVW50BHZIXOIN79M3gBlA2gPcMRB+CxpP0cdIjd377a9QJ5HfDGlMHh+uehfwYa
         SfNA==
X-Forwarded-Encrypted: i=1; AKwUvByr3OPp7jRbTR7r6taGqDwmq6V/0McezFT/BWSV/i1Z0SvUfYcW69JgllBMquQwO71y53VIrrFVP7y2@vger.kernel.org
X-Gm-Message-State: AFq9FYJHJ8hu/C0e/XP+g7VeyVC5Jzdt3/a2gHdX5CD1cTfYSmCkUkUy
	edxn4DThYdYU1tHK4IZz1Ex1n9VBEIcsbR5zMG2HW15VAD/IQX18/87m
X-Gm-Gg: AYBFou3dxE/BwymLz7Ht33s6vpNjbHGn5nEe9jPcGlvRJa4rj/jsQITV7inEtT9Wohq
	E8RzVausefChdlpqV4T/OmzOG/3CvseiniuiCSdE1hNivrmxnr2SByRRz03747b4WkJ5xuaxMyP
	C2Gd3ChRNnUtTeZ0hRCbwnI4aCz3r/3x9FsaeIZmMuYkvlp+EvUq5V3Y1KzEfLGtCOJxL/NUaAg
	BlW463R7RlN3954xUUXoqyLO/7+xYAGmkPUFAx6hv+9HcE8nHeG+nl5EA72/wn1vfkt2cqBvROf
	AV2eN1tRpjYD9uxITI75vZvEmVmRRtJ4C3quawuLuIux7p0Ouh4t9lS5L07KcNAxQ//PDQn89ig
	n2w3TfdkayABKWEzSgkTwJL1aOqDhMMwEC+Pyna75CkKR766Oz6C1STGM0SQxc5V+yfUf88jTyk
	Apm+kJ8g8Y+TFtxnLEAXq9gq4SB5x+7qnLfdgBE+Qtb392e80fqOR6QRTemUEzj/6fbcYGHr3Ij
	hL1pycpq6/Kzjw+IL2Q4IpXRwSYiuQy2XW+gJBnunnzQUq0dvaj33CBOC5pMSGlc1JZoJhfLrdl
	o0/lbfKt6g==
X-Received: by 2002:a05:600c:4e12:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a35ac3f7bdmr182539685e9.3.1793096547086;
        Tue, 27 Oct 2026 03:22:27 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm20023565f8f.37.2026.10.27.03.22.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:22:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
Date: Tue, 27 Oct 2026 14:22:09 +0400
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 christian.koever-draxl@student.uibk.ac.at,
 neil.armstrong@linaro.org,
 sboyd@kernel.org,
 bmasney+clk@redhat.com,
 khilman@baylibre.com,
 martin.blumenstingl@googlemail.com,
 rafael@kernel.org,
 robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
To: Chuan Liu <chuan.liu686@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On 27 Oct 2026, at 1:26=E2=80=AFpm, Chuan Liu <chuan.liu686@gmail.com> =
wrote:
>=20
> Hi Viresh, Christian,
>    Could you please hold off for now on the patches adding cpufreq =
driver support on S4? There are still two issues that need to be =
resolved first:
>  - The clock driver currently does not support setting the CPU clock.
>  - The CPU regulator needs some time to stabilize after the voltage is =
changed. Without a proper delay, the CPU clock frequency may be raised =
before the regulator voltage has actually reached the target value, =
which can hang the system. The S4 CPU regulator handling currently lacks =
the logic to wait for the regulator voltage to settle, so this part =
needs to be completed first.
>=20
> We are currently working on submitting our own cpufreq driver. We are =
considering how to address the issues above, taking into account the =
hardware characteristics of previous SoCs and evaluating factors such as =
the transition latency. S4 will be covered by that work (as well as SoCs =
from S4 onward, such as C3, T7, ..., A9). So please give us some time.

Please don=E2=80=99t top-post, keep inline threading!

FWIW, the recent bindings/clock/driver work I=E2=80=99ve done for S4 is =
here:

https://github.com/chewitt/linux/commits/amlogic-7.3.y

My speed-bin driver is based on earlier work from Martin Blumenstingl:

=
https://github.com/chewitt/linux/commit/77e12d4d584d6a8bbd93304bbd4e9bbbb6=
ee159a

Setting a ramp-delay was the key to opp transition stability:

=
https://github.com/chewitt/linux/commit/ca7a99e86e23677c7b5af887e6f3b3c8ce=
3470d2

CH.
also a Christian, to confuse people :)

> On 10/26/2026 4:59 PM, Viresh Kumar wrote:
>> On 26-10-26, 09:57, Jerome Brunet wrote:
>>> On lun. 26 oct. 2026 at 11:00, Viresh Kumar =
<viresh.kumar@linaro.org> wrote:
>>>=20
>>>> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at =
wrote:
>>>>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>>>>=20
>>>>> Every S4 speed bin runs the same CPU frequencies but needs its own
>>>>> voltage curve, and the bin can only be read through the secure =
monitor.
>>>>>=20
>>>>> Read the bin from the firmware, select the matching
>>>>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>>>>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>>>>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver =
binds
>>>>> on the SoC compatible and needs no node of its own, and S4 is =
added to
>>>>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created =
after
>>>>> the bin has been applied.
>>>>>=20
>>>>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<ckoever@outlook.de>
>>>>> ---
>>>>>  MAINTAINERS                          |   1 +
>>>>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>>>>  drivers/cpufreq/Makefile             |   1 +
>>>>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 =
+++++++++++++++++++++++++++
>>>>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>>>>  5 files changed, 202 insertions(+)
>>>>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>>>>=20
>>>> Is it safe to apply just this one ? I can take this via the PM tree =
then.
>>>=20
>>> I would advise to wait a little for Amlogic to chime in.
>> Sure, I wasn't going to wait for the maintainers to respond anyway.
>=20
> --=20
> Best regards,
> Chuan
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


