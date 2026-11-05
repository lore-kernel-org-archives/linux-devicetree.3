Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873062;
	b=QxeY/r5/qQK+Xc09z8X8pVJ3hCJq074Pa9n9DKPjHaCWaPLauekWDdmr1jEkFlMrlv/i
	 GZQ5+GtWzd2oEwmPVTzO5T/uXP5JMW0Q0NFJBa6f1D5+6nBXU7IIVhXce+dgmRrV8cs/1
	 VP7cySzbLidLLL8GTnKNkRPE72AJ7RiaiRgHusVWn4TmGsZh76Ik4NATIYOAk8gx9nLIt
	 Ed/S+dqa117y2/vEElGZEzBg2VECnzk0uIMpeui8UZSaGJzIDLvgsOrBzwt67suVd0GkI
	 +NxjvQrv2sWw2ysPoZgAhiirLb5/i506GUH8hFrFqs8OB7k3ZVsn2Jxs46/mdJc8Pxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=zg6+H10dxRDg4A+l8T0eI4KPj0H19Zt2rNXESQze/4g=;
	b=qHJLHP4z4PSUAPKxipDjtYqMKFAREqcAKqJH4VHDXhAX/tTtsmbM0WLowwq3P1QFZ+2y
	 tXVfG+9bmAKL0UEJUAS4X6kPuzDgmMiYvjBpCs8mmQ2rRYKGVHKSSUkiWm9K0GyEH+zEy
	 PVlDciLDe0/ZCW8Tmc5AKWi83miuJKMFKz2vmJ7PxXZZ71NKgxndKGwQ9NY46eE3wErGD
	 PXaOsfYMUZN3RufktHANp/F1Y/Dvg4Sb8jDamxu2CUrXFo5hbx+GcunpuBKriavu9rwCR
	 g1qFenXL86FrHujkpd2pKu4axSX3RxJYYq40hGDlAcQLJ4irgDLAjM4Anl44Xv/xkCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A4606A334
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9A4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D88C9240103
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793873047;
	bh=zg6+H10dxRDg4A+l8T0eI4KPj0H19Zt2rNXESQze/4g=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=WTEDvAseblPFXFXvS6DIvqggdzz1crkr7qmexKldL1D+QF6VDFDwBos58D1WAXyv3
	 nooXez145/Y3nvpTAFevJyLOzVZEelin8K6cFOydaExn4eGjD5nMwO7K8erHRiZnXo
	 pYcBKUZO4Bf1Z99sbBayFWavXtjKASa7uLXodG5SDacIL2j8QCPJDZ1rUUePd/CxKm
	 0gPxuy6+M+DfnBJM9W3mF7/vBE/waqBappf7CXvtt2HFqMsKhwzr+YGhxvVQUqPsy/
	 PqP9nFrOY9xruJfKA+Gu7w00iFruuYpiGZ/Fk6XAaof1+drWeFcq3H5z1NJizIZsaz
	 fI0CMQcEMQKrA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKyZY4ftxz9rxR;
	Thu,  5 Nov 2026 11:04:05 +0100 (CET)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 10:04:07 +0000
From: mateusz.nowicki@posteo.net
To: Julius Werner <jwerner@chromium.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, Evan Benn
 <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] watchdog: =?UTF-8?Q?arm=5Fsmc=5Fwdt=3A=20allo?=
 =?UTF-8?Q?w=20a=20list=20of=20SMC=20function=20ids?=
In-Reply-To: <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
Message-ID: <2e1ea7a743552f7a9f5aef91e0d8d1c6@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 Julius Werner wrote:
> What happens if you simply define two watchdog nodes in your DTS, one
> for each SMC ID? Both of them would independently try to probe, one of
> them would die from getting an SMC_UNK, and the other would continue
> working to pet your watchdog?

I thought about that, but there is firmware where both of them probe.
ST's 4.0.0 OP-TEE fork accepts both IDs, so you end up with watchdog0
and watchdog1 on the same IWDG. The bootloader has already started it,
so both register with WDOG_HW_RUNNING. Userspace opens one of them and
the watchdog core keeps pinging the other one forever (open_timeout is
0 by default). If userspace hangs, the board never resets.

> I would be fine
> with the array solution but I don't know about the validation checker
> and whether people care about reusing the same prop name with
> different types. (FWIW, in the device tree a 32-bit integer is
> basically a 1-element array anyway, so we might just say it's always
> an array and for SCMI only one element is allowed.)

I tried that. With arm,smc-id as a uint32-array with maxItems: 1 in
arm,scmi.yaml the "multiple incompatible types" error is gone.
dt_binding_check is clean, and so is dtbs_check on stm32mp257f-dk,
stm32mp235f-dk and a few boards that use SCMI over SMC (imx8ulp-evk,
rk3528-armsom-sige1, amlogic-c3, blaize-blzp1600). The SCMI driver
reads the property with of_property_read_u32(), so nothing changes
there.

Guenter, you suggested keeping the IDs in the driver and I have a v2
like that ready (st,stm32mp25-smc-wdt with the IDs as match data).
Julius would rather keep them in DT. I'm fine with either, just tell me
which one you'd take. If it's the array, v2 is the RFC plus the
arm,scmi.yaml change, and maxItems: 2 as Marek asked.

Thanks,
Mateusz
