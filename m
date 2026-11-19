Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111720;
	b=WEjAAq2IyNdMP5PmhbWkgoxxXRk/NaaKim+i2kZvNdMOg4g143RMcHasaHBWS8IWcoew
	 xyTINBXzlnRoMutiK7xphmWib5sRMojYOr1jfi3mN66L1+XDXmB08StAYKt1qLP6eW66s
	 +jD37niAxp8cWxN9YY95qivkBrrO6bg3qaywYZWLAtFd3TtzsCrC3fseNNxH3ILGQceTt
	 zAUMGsm4JnTqJlwIAKCKuuKdsZbYz3/gpX/dDDlly7QXtNqqOrL1E9HnQCSFB42SWTEKY
	 3Vd8Y67fvEP7aJ1aED11vBKy4IrdUYViVF3qEnKiNR4hl3uwrJVfCW+0MSaE+yqM+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
	b=v2zy3Y6mvgg/SfdoaxvtYP9+6RYORdZwI6lOggO75IKG7MzE1MVKBgAx8fzijnPWmfX0
	 gQI2UCK66shICe0MGpFUHkmOwgllYRG1cNpu49ik/oDymqz1T4OVp5tCpyNPCe70K6xbZ
	 vGDOB5WSYh8XgyBhgIIqapF8WH0CYDmhs1HpGFmlzWZZWJacu7PktYGRVHJCA97d+qmR7
	 +V87wmroHefQeCA/w1w7nsIk14LaHQfN/mlr9QXjrVBDQxQlCln1rfIxmPMWlggfK557z
	 gVc+4pX6jF7EquTF6/QJVIbIJTWi7bt9A/UTMa+xSSMzY/p1xWZ68hiX9vPEa3tHxAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZubt7C5;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EA606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZubt7C5
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843cf077f10so85195a34.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111719; x=1795716519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=BZubt7C5T0vLUI4jNv6Y96iGWqpXvtaMAJMM/Z1yLj0tsZ5RroRzO8SP8LWAxuXwhZ
         6ti3I+XbC0jpsIwqxtU2oq5MXRQ+too1m/wf/MaaHx734SUHnc7u1Lct+n7A1Hloundi
         ONfCLd2LraQ/Efy2n5nX7ADWnrl8QxG0fz7LDAXG8sLTLfKIxH/0XRyyH4Gvq6/8Xx8w
         4XcJIz/A0laK0cTWGC0f2ZUBDRJJ5ALKzgKx7v1FIfuTd9uN+FD11l5fZBq++N99Gyh1
         B+0gjxpjg70iLDqE/a3Z2KJ94zkRk2s2FuTUXehItao43kuQiBUYw3+XhZy6EjuWt+U2
         4dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111719; x=1795716519;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=MnSCNNqe7zSH4PWJ6UJ/2khyVyocUq6HnVUjVEDDL3aTcqU/ErJUALRmbXcUUW7MdN
         q9BzhX7XY+/83UAinsGllGvkPd70+F3ZKR9EPdFItTsSNZrJq8bCbXqpvQhUHUaBRfi0
         RlO6V0JVJdJ84VZ1UyQpHwLr/Z5TeMEBIZYlnMEWMIvN8G55CprBQNeo7KVCfuwCDC/0
         6AYlOeei+jAzAqCQYyLbt+dyRNZUfu8/6OcIE6Ryiocv8CBxdSs0gm2q+jsWsTTRVCQ0
         ysZ3FS7uXxKoL6JzNw+Yoa/c+c+DlO/CuVZ8MdV89vnC1FmxCm0kQdqrrGtyFnsbtGQj
         yp+w==
X-Forwarded-Encrypted: i=1; AL+hErHB40uZZAL7Ixsb8sm9QaKvr1wESUm3BIfCN2Zxp3Xu/W0uwi9C82Osw9MEVxh4qd6tIDbKU9QAPiIT@vger.kernel.org
X-Gm-Message-State: APuU4Z/L8ejzDuyFPOpcjNpP/FLEcdUITBsK0XZSy1fP7lrhrdMau0VG
	GoId3fr2gMVA719nSVJhDS/vF3FAU253iN6hr35jjORWbwFh41kGCUQz
X-Gm-Gg: AYBFou11gpslh2cOeyh/BrmznA9JFO2yB+lC/6U6OE4bme+c7FFQHBxm8O+o/ihln4c
	OxFyIizLDNcWRVyKnJHWUKu4ivkQZsVLd1njTI7hOZW6PHEWOUd5iSHf/7a2C4WRv3/CwrbNfxO
	+VlfnLmhO/PX+EwuBhMd9RyynOWHhO4/6FRnCYe4oCQd0/UMtGdU1kXOqh2MPLNqaPtmGlmJNfj
	ii9BpWrewsr04yCLqRmH6WMysbfa3J0tMCuBXOb+bkQnGyz/O/8ujBUZgtB4m+Z00ef0Si4xGMe
	cLBtqDC6/xI8KO+5d/EQAlCVbz6beG29g9LFpmT3itDtzJNWBNdUvFL4Zow/cURF+kO0BCCTYxc
	3cqQsnft3YWFynt3wzf00SrQq9qGrw5ZZCsgPLXftspo1J9oAMfahqcNbFgtrBBsCs1rPDF0JHT
	AKYfeh3U+EZvB8amwDFdDfFf5t63YtXEW6oVLT4+9+P16uKl8HempKulQy0sWLie3qBH5r+/TcZ
	1kHaulDFf4ZqBaOCzQRczYnxtMQ+xKk3j39ax15HGt4/53iBEFpXOEVrtcMrzuTEVapktkWZIIl
	7RLotRGtmE5xzLbTg21gJ4T/SFVL9UnwWXM4ogek8ausS5UJj0O/xLyFcqR8V7rQzYRBsuUjJrG
	e
X-Received: by 2002:a05:6871:e7c5:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4bc802e97admr436457fac.10.1795111719191;
        Thu, 19 Nov 2026 10:08:39 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm456866fac.10.2026.11.19.10.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 19 Nov 2026 13:08:36 -0500
Message-ID: <20261118-a733-dt-v3-3-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com> <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alexander,

> Should the history be moved below "---"?

Yes, in v4.

> Should two regulators and the clock have been sorted in the reverse order?

Yes. osc32k-clk sorts before the two regulator nodes; I will fix the
order in v4.

> Should "status" have been last (preceded by a blank line)? (dts-coding-style.rst)

Yes. In v4 I will put status last in r_i2c0, after its properties and
before the PMIC child node, with a blank line before each. mmc0 and
uart0 already put status last; I will add the preceding blank lines
there too.

Thanks,
Enzo
