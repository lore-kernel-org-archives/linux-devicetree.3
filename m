Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA9443C10
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838859; cv=none; b=J0Gu8xXNL4TW4/wv9DzWxV+j59u5/vq3hVOWn3T4tZDTkn+RId5L3ANVMaZ/XTRRQEj4pib5DsVetxZfUeQQEBnNPMteer6GZT/5IWj13UdjKGngWh3raRBFW9NScExBWfKu0hyHzJN+jw7xHFlNzQMqpuhJXgDdUK/3CY+5Zlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838859; c=relaxed/simple;
	bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WuVqKOzZpJhatkcGkwgRxU55PUjMAMFz6jtIk6pQP55wKWBusIxK/lSQydSVtFtjot1mu+Wf5JnuuEZDVdcCO9QSp4BMljDGpQmaorlePXJ0i6PP5Ya62jm1bkIyrYoGxTw3S8KNUVUGun7wsy7+JGA0OhDkyfhcqn2YyYz8sL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNMYmy0W; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNMYmy0W"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so36352995e9.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838849; x=1791443649; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=;
        b=qNMYmy0WCpqKm9Dn4ZSUs7sIcW5n6dJFr8toCinlGkzWVcaaqU3yoE669LCPkaCRzw
         VhtZrg/2YDTpBTxqv5jWN0J/ueJpxUmzapRG7aNLiEH0/17i02qvviOGOjaXb6Nx12X1
         qeSeE42zQ6eUsTOgKBTsi296YB1+RhSGgRYqP8cgGthWTJczb9UcMKRsOhDbBjEjTk1/
         Qj/zleV1WdLZCiNfECMEcff6RzhdFckvLL+xi9UB4Si/LWDfYU5Xeq+XdR7mK0flDmWE
         xA+Xle9RBBl68y5q+XQEr2h1AKOQWJf2iE140eP+uL75krlLIYKXuVdBlSMVkqrwZNa0
         6J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838849; x=1791443649;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=;
        b=sH3juJFoiONpgP5RTxtulfQFa7haK1qsMovSAWXAhtsOqEzDi8lYbKxDk/zjtvwa4n
         KTylZy0QppeukYP9vwop3ZpjtNWNKT3RyND1BEEQz2/Af6TXlJaRbsMDSfo6B2//K9xD
         TTjP1VPu9tC3JRZFJfQsQJHrq49MnwRXZ01E/p1MNHQ8Ajy+cT0zZEjXqpI2HdutyTbi
         aWJ2eepjV4y3f/hcNKa2uyeNh479FtUuTf0D7SuDCJhT1ubxvi/YMebWIXo70BY4YwF4
         3+174fBsgIRBnNY3uxyP4aFpKZ3yL74Re6vxtKZjs+qoUJzGWhTnnXnqjUeWm42Ok+m2
         uHbw==
X-Forwarded-Encrypted: i=1; AKwUvBxKr42Mk7Gx2QFc9heXuBuNme6oV+Z0q5Ip4mqt7l1xDiMPqTjrxsgqyKmDU5s98dmTUYfUElJuRd/v@vger.kernel.org
X-Gm-Message-State: AFuF++mjMFC28K2+goU3kHdZIAt/n38GNYuGbXyGQHhl/NTsdrzoKkZR
	J/vYBDZu9dwv+byTEGvx0KnrvKWyA5KsAGIlyXQkrKKhFK/6T/s3CLrq
X-Gm-Gg: AYBFou2t9YGotR1xmF/paV7+w81vtKWuw0q7HK6FWjimRb2UdnFnHoMszlji77v3CxX
	zu1obDp6Hchttt9nOQ6AbvxJ7F7BC0U09snQBI58/N7eMX2ZsGhqN1ZdNk6uto5lIXuu/p9P6L/
	y2IXVzpmTLWnOf5tIAzk/hSWQkYBrerXBV/AyQiRfu+mMfOGRDXVSU8IRn1+dIF2E/6tCeZfQVK
	GNqyubrqoIfcCAXDt/ZK4LRmylxotlKc8nMXWnUFMshXLXbJ0TXGQr8B6S05n1TLJpw5SCwsfkZ
	vW8gMPhN1PBOR7RM1EBbGzdt2VC2GRizr1wgnu+qpSDnrJThmrWL3nztEvWdRZoX86n3yHcgUO2
	xKHJcZeI2B+gNFwejkfPH+AduLfMGp8+pWMjMU/tdIJhuqsBssfF5glmCbJoxYvimDJOnMyHM56
	/Cd4HIozJUt/EOIl/U8G5fQC2HYIzVwih08J22JyniFmvy5nrNnjQa4wLwpAILCr/WdSZ7U3cRU
	FLdouZ7KslveIWqheLPQakzEM7skhzS
X-Received: by 2002:a05:600c:4454:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a01b00f607mr62337135e9.22.1790838848782;
        Thu, 01 Oct 2026 00:14:08 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f220sm45635745e9.5.2026.10.01.00.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:14:08 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jason Li <jason.li@cortina-access.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject:
 RE: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <SEZPR01MB4208C11DB288933965D7BF83A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com> <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179083239972.193541.4791387611943615705@gmail.com>
 <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
 <179083615914.311026.2458351803214458859@gmail.com> <SEZPR01MB4208C11DB288933965D7BF83A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 10:14:05 +0300
Message-ID: <179083884593.341205.12618374409894485981@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 07:03:53AM +0000, Jason Li wrote:
> And we are no longer involved in the support of any CSxxxx-related
> products.
> I'll recommend "cortina-access,caxxxx" for all Cortina-access's
> product.

Thanks Jason, that settles it for me: CSxxxx parts use "cortina", the
CAxxxx parts of Cortina Access use "cortina-access". v2 keeps
"cortina,cs7542" and "cortina,cs7542-uart" and the dts in
arch/arm/boot/dts/cortina/, unless the DT maintainers want something
else.

Fil

