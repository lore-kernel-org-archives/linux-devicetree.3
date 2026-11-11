Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362268;
	b=BIjiE5hy1m4iNSqRJ8c7a5fbcLV0KCT2b9PK/KmQlwc3MK5g/depiO70ev0MsFnnkcE5
	 IOrkezlc23yEWHQNbC1vRvia/8HwLLYxxQx5rbk+4U2e9Bm2SDcfaqLbj81mreDSFtPio
	 2Eqpmol6XRkoEtl1L2Y5XqpzetByNTaofNwginZ0OfieNQrFkopHULsIv58Gn28Rq0YOe
	 J5+h73htJGwLU7a8TopTZ7IYEjjrxhD6tTdyIkUuIeX0/7EEjdglu/HUjSfLmetrTFiP6
	 8W5HRHmCaoFGby/oE16vb3uCYr8JIkJW/sAttU8JgFvJyrPfzIRowGUr7P01ER97sfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
	b=z/8mgib8zBPMkJfUnGg1BMqktBe1LyOIZEVL+0GSr6ru0XL8zD8k7pzopmwGjDt3gCLu
	 QEsDJqndh8o/gy/AnDk3Atw58WGZurPPSftW/8jn4KGJ4JfhR8FI909nbjreB+xxDBbkN
	 TLMdc2pxLL9kzYDHvd7pCbsfJNSAGYBP81bBCAeVrhGrTzIgaVfNZTS5GvyrEJc9vbIhg
	 SBUBxwfLNQTY39UtL3ab/O/zXeZyEiIx90g1BrGf0d2JMVSrMtUqwGb0fIngF45OkhkqV
	 eBb6KM8KRS3fum60fKYED88jejaFcwGEjhF0JS4dIK38UN7WPIfsoI6N6NwRbtaFiBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc6j0gFd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C519606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 01:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C519606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc6j0gFd
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so4095833d50.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362267; cv=none;
        d=google.com; s=arc-20260327;
        b=DVrsnGwBmC3Ub61U56gp6ydrc2GAnv61SrarVFY2R5MBbHcJI+mammCUb4q4B4SAlX
         jMHz8j5EPczw1EK09DZT38rGbL/GGg7EtE0B/o9Q95alQSfMQLuh6uT+LdJ66Aq2sW+S
         ewVLQ94Z8DcvkmCTIn24hHgVZ2SkSKqY3O38o/OwtXAhnLMejsfSYI93xQWGoagC5g7U
         MmYvfZJKO8h5Qb/SZS13420GUGAHDmMgbuBr5tT0V5FjhZqfK3KwPTIPa2uueoaFGcJl
         6CZsyYbH3MmJZLi400AVCyX/rCmdwmQvegNmG2Qc4CyEZmN+NFw1DwXMjzXz73TmGni6
         xmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        fh=Mx15iO7l6n6n/o5ZulkTcXkBTQErGmB0YD9qi551MDs=;
        b=CB5G7PqtaK5AE3euo1XT8ajyshGzB2nBXuZyxIaJK7n1LllG0OVxBOzTK/5Yir56v9
         PY3j1L/PLosnTWFwvPyfflZxUaX1FTQu1W6axqBedZT+KHOHlgAs182eS4wVeD/Ku2vQ
         7kuNptQPtj3b8QhFjGXo7bGnd5A2Ybr0Gvbtk4Umph7jSBmaGLlmyWY0lbdxAfOLolH6
         I4wqKO5QGiAyyHP7AOUz/+Lkz6XXnsPGufFk9R4Z08JGOkI4wIZZQPWjPeWeM7pUWq1P
         AAGTiIWmmKeZ0DS7K9MzHeF7iwTbl1+aFpPydpWCBNJ1abGyvz9Nr+QJQNnxUd9gO9Cg
         sgCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362267; x=1794967067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=Gc6j0gFdjp84SMRrPO2fu0xOmYK447dr9MikIWbL+L6NK7jKoog+HZ6NVoudTasbNH
         LJ7y9TEuxhgeeerS9XHsOriZlsP9I3yJZIebJ/85xKKDKCkHtix6lx1zRhuE0NONiJgG
         a7h8Jv2ugw++3Ihdu598/9ZN7HUCLjEZc1N5LV41B/UBlpZonluEpKgj9bbPkdck19Mw
         mu+xKtXj8defGbe3E7bpywhOTSdZ2aDwPfjoauqxlEn4is8HaqWsVCtPpVFsgz2cfcN2
         j6gHSFJl8OgTFVXunf2qvpdAUGEPBSpS0hxn+69Gnu7fCWOnumfw2u5QIUHhRrIAVXpt
         WBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362267; x=1794967067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=TXnryLbeK+KVaSIWBIjGuILCwLbQvVyV9rhEtMdaJgzrCAHmXlwQr5fQ6jUjJBrxWp
         /evh7zOAm/MfVv//pckGcYtbHqa3fJuOjipatg6u7kAYw7q1aXnsoDoEwrkO8ssUriWW
         kwS/kpn+9xV66HFRlhyZyRRZyjNb5wef3/FtMwRYXh+cEqgNfrI8cNdlDktLK1G/nak7
         pxIkj3ZYIHidFwqwjDuJdH15R+y5FgInBR8CuSKbyYE05m6i8PQXlsQ6cTMC2vx0al4o
         vhISh9SJMTFUBgeI0CNLr5U2QprC8lMQUhME5bMr7Yb2SQk1Y5iwBzc6grMLOH50kevO
         sicQ==
X-Forwarded-Encrypted: i=1; AL+hErFYQqnMuXVqaU3WI0eabQ4ZSYG5MgwPsTG2kH6l1YtfQ6d6IZk4uDqN7xkhK5Hs8ltuGXc/2eAVcHfZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+eCaIwm1G9Rj6Nqitd8e8KRMbo0cDE6dFFymaj3jN2JTIiTw4z
	0d1HVNeA9oNMQm0IztCxVo5n1isaSkxsWNMrsQc2hZvw74UzjUTOuBvG1jdalaVL6DRgNCkgDW4
	3AF3uxdd40e/85Au8KPuR4eZ1PaCvOJ8=
X-Gm-Gg: AYBFou3M/cfcAeIJAxAlhWJJzSgWdEqxihim+7UFOLc2n0YEKBMupNjl550WE9cPVk5
	FFXgRXgW3BgcSWQwoQUEpOzjGCIhpGiy+4kS/pUDWEuhk9FM9MTPW8TUucYA6r12O6zwwpeoSgX
	TWR5xnQ+MPbz+Rv9t4buNrF0arvsSbvaPgyiTlujUrYkm+UqFyuND/ISFQ4sfFJvriqQ3ad01Y+
	U/ZXMvTTYEIv0ILJ4LJTkaQBGdPrstC2qEJRE9nfnC9ktFzSzzwRmRp4Wu2SZ+u6gjFg+NlyXwp
	Y3ofhmeESJAH94GZEBf0iOODggq2qzBMntvuLZ1UOqgDzV+hA7w4xyLwq2WP3xk3toIMr01G7cw
	BgiQAw/AAu7BVx1M0w99560DzT+vhh/QK2DqPlCmfYZofCEad8iPqKP0Izw+Hd3NhXJk=
X-Received: by 2002:a05:690e:80b:10b0:679:a190:cf21 with SMTP id
 956f58d0204a3-67c67f54906mr653906d50.40.1794362267159; Tue, 10 Nov 2026
 17:57:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com>
 <20261110-accurate-unselfish-cockle-3a39bd@quoll> <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
 <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
In-Reply-To: <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Wed, 11 Nov 2026 12:57:35 +1100
X-Gm-Features: AclHuK8xliRxrSv2YHsVIHXaEDGub-xO05VL_zEYwoOsVKkETettvgLLeJxK-6U
Message-ID: <CANpmGNuQQY-aiorBaNmzyywsVNR0P0NzCXnYweJ9fmkydYO2Gw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I would vote for input/hid.yaml
Thanks, I'll do that one. Because there's no change to the actual
structure, I'll wait until the 25th before sending v6, to give some
time for the mailbox / input maintainers to give feedback on the
drivers and anything they'd like changed for v6.

Thanks,
Michael
