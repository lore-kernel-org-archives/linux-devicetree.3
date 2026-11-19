Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079592;
	b=IGgO5+y0y9lkxQAMlKJ9ettmfu8kVLdeZrg5UnnRW3NVqOIPnnlZkc4P1ceUnkumzCQP
	 slx1nmontL21R+bIE5xBE/H0yEq8oAYnHM0ALWVX8UvH4p6Qlys0biM+UU2cGfgLIGU81
	 bUM8sVunwY/MPzQS+RnPFELzKeKWsHQXMjUxg4Bt7djZG7F0ATHdQasZSxdbcdQiOrGF6
	 ywHfxGIEdkaQ6JDAI6CNMARkVcQ9K0VHtcpAvkGXKp5vKXN8q74QaV9p8Allrj6/sfbY3
	 FwT7pIu3jsbDiuFuQqHcPWxZEBYhiu7xXQDEwTUN0W6LXRmD2bmsSYYIqNCfzj5Ei0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
	b=A9d/0/EhlUNgwvQPjgtJO7aukHPaAFojbBSZRgZkIkFnVRACKsreLUK7meJnPxLPTU65
	 Aj962AknKPMMcA6R7up2MPwsORiA35GtU/rOltoyXu0g4weHITfxLmUqabpTXh0XqA1QH
	 DcmDYiCqa0LwKrGTbpDIrSZ4EI4Y7ipdgq+pdieW/snPKesUOv6rqt+k3P4nwevAs2o/f
	 CczxYNt4uf/cuB9GyH1nUJccIU8FSsGFG9sZgflC1M8MVtdb/0Cc42rCLZVHEIlDTmFL8
	 rO28SY5XZrJH1dlVSDBOGLvxoTkvJ4lXCgaKUloqmZnI9udAiz4RdaR0pL8GREpe0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14664606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14664606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cdc606b47so336885666b.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795079589; x=1795684389; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=cyYxEfasnJ1RB3+F9HQ3kC+3x1Suvkc2D89LpTI8+pw+eAAwycdhqJavNg6jfArG06
         7JOCKyjIFZw+nr/clzS/FlZF0tkW/tGCuolgw1y+hnhHah0vaD1owxv/OtpdlF+et24+
         5L6UDEJTNVsrLK4J+ku1kAWCSku6cLc/TckT9iAM6R+oPGnlb1CUiB3kUc5/c+MqFRyB
         stqsA0fzEfvyMaiEWLDvydtQsTclnOH9ybTAeNhVohSNOZyB0c9EwQfXP1kwiRFNT07A
         zWt7aKVRGzi7F2YU/x0W/Yt/TXqrDRWJJU0hid5GcWy+qSpR7k1tulgob5DMl37cK+Wq
         ZePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079589; x=1795684389;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=QTnwKTxG6mDDdDeaaDUDjIQ398vKdHyGJ5y0fmKHTNnb8Pmgfx8vhIvWojbQYQT1+R
         Bw9jPHNy20pkjFi5MNUHQ3IwBNf0+7Dzr0XAaGvxbDpjCBQZ+GqE0Vm5scYiuheEKqYW
         Yz8j84wc6y8I2cwRsmlW5sTJyX4fs8iyFby61bhMCEEIcjLyX5jEFnZcz4fa+blCZeyO
         ohpL0vZSBZniKoxNwFiAh/QBtAJQ5auWUkkxohJMSdchV15O3rR1/kfbrNbMI4DIWjVT
         yJtxiGu3XOGSqJWNod64vHArc8mtwBgDWHmhlGLQvhwXBOI2b3qrfIdtQ35HjGc47WYR
         QAfg==
X-Forwarded-Encrypted: i=1; AL+hErHg3E7RyY00IzrQQ2P3D6rjjZbj2x5yAtTtkzyia1Myh2ZYf4oVl9jViDs4hPtI5k47dZj+4mfHyaiD@vger.kernel.org
X-Gm-Message-State: APuU4Z9CU786+XRaKrNj9sPLscs/I5azcRgAdxBJhusrn7Cd3II+dVEc
	pItHC5tadjln/hjxkgLpfgvwWxw9StNHbjY0v1phIEJlAuW0BjXDv5mpf+lC35CyH0w=
X-Gm-Gg: AYBFou1A6gvgXxNhzspavLkjxl73JWPO0+iH56srg2XKZ1GnQ7GOG0MmRwowf2oJlkh
	Z/5eShoFYF7Phk5UvRyd5P8Ybx3DiLQhsBdwa/c2v2GDnLOnYecFoz9BhLdHZ6ydTuZkaPo/EVZ
	Vn8NJSypyjhUho5wrJSUHyvIkhbX0DN25CqtWErH5efbBEIGdArBmHj1AA/OODdaCPuie8mKu+C
	6Q/qa1eH2Wfxe5wAbdXP6k8PXomsX+YIViNimmvS0IcTPZJ3E6r6KRpVT+vyHczCM3Uvt6vaHCW
	UJ0C59B2d1piUVya6o4TtDpzcadpdbr8Ab+F1l8gGjCyLSdWD+vwBq/BS24b6hK9n5e1S36nmv6
	SlN+24+peH6H1WplL0T9xadlQUki6L22WrJ1MKY5CuK/iggEDIbx7WY5Cu0Zc6laxGA/nYyu/1p
	yoxU+yPuOjZbENoBsREuhmIjNH8goD/9tB0yPwf69GBk7W1eoGwQBblsuWBCqW9A22O3m7pbiIx
	iNKrnrlSxSXBSKGipX643jtWaPJ0ysi1AEBvSGX2/zd6Ku6jiu47p7IfKjJjy7IZJWL2EKirC/+
	urs/czpFmjAq6L91g+GMtzLTBckSJoMzEiyo4XS/ycTZ3DYQtWJGzNhaTd7r3LwjKfufjotqCQ=
	=
X-Received: by 2002:a17:907:7295:b0:c31:8cfe:9a25 with SMTP id a640c23a62f3a-c510e19d00dmr455876466b.9.1795079589464;
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512341e0adsm87945966b.36.2026.11.19.01.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 10:13:08 +0100
Message-Id: <DMZ2LUM6AWXG.4IUB01OTC2NF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Laxman Dewangan" <ldewangan@nvidia.com>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Jens Reidel"
 <adrian@mainlining.org>, "Casey Connolly" <casey.connolly@linaro.org>, "Val
 Packett" <val@packett.cool>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
 <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
 <20261118164229.GA2892053-robh@kernel.org>
In-Reply-To: <20261118164229.GA2892053-robh@kernel.org>

On Wed Nov 18, 2026 at 5:42 PM CET, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 09:23:12AM +0100, Luca Weiss wrote:
>> Document the property to allow using this sensor with io-channels.
>>=20
>> This means that the output of generic-adc-thermal can be used as an
>> input into a different node.
>>=20
>> As a specific example, generic-adc-thermal takes in an ADC io-channel in
>> Volt, outputs temperature in degC, which can then be consumed by a fuel
>> gauge driver to provide the battery temperature readings to user space.
>
> But this is already a thermal-sensor provider, why wouldn't the fuel=20
> gauge use that provider?=20

thermal-sensors =3D <&my_generic_adc_thermal>; could work, yes, but IIO is
way more flexible and can support the required use case very well.

From what I can see no device binding (or Linux) uses thermal-sensors
apart from thermal zones, so actually doing this for another device
feels like re-inventing the wheel when IIO already exists.

Please also see the cover letter from the RFC[0] under "1. Do not
implement IIO device in generic-adc-thermal"

[0] https://lore.kernel.org/linux-arm-msm/20251010-bat-temp-adc-v1-0-d51ec8=
95dac6@fairphone.com/

Regards
Luca

> Seems like this is letting current Linux driver design dictate the=20
> binding.
>
> Rob


