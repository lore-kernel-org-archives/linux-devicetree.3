Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802856;
	b=UxD8uGoW6WFKW33KEM1Ic6if1D+487wUJS7+UeAN1Z6yJnsclO5gV+nSyxtT7BDr/I2f
	 XMtoKT/OBYtfWjhyqwoaCl/JzteQEQoV4L34xYunpCOya1HfIpPBJwRxellVpcYEpQ7ri
	 JK8wGmNlID5X/sobY3ARlhrJqEtZQEtNv0RWEriYgpF6AkRbYib24JsaK+tvvX+GTRQ0o
	 YwbrU8Fyz16ft+JlsLqnFhr488cH8BiWUMVVop1hb7dbKr5hH8Kpwjv3+9WYDCmmeHBHb
	 C8cdH0kXz23chGVjdHRQEA9t42bw5iesVfjnOuA7BVaBit/ED2WUi9uOJm4/TLMDjcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
	b=C75A4Ls4t9pPzWfAgOo2UuLxOLzWgaWD09rcJXlC+tfV+EkReleMAIy0bW7RomPJ1v/g
	 jckg4St/2j15Xk8cJ9aqpgML6ubRykFbGap2rkRdcU3MDTq/aCb4lgcsg3F74EyHGM/3h
	 cWcWDUPPWz+z3SAF/x50VqCz9yh/KV3t+xzlJodwQJCnuH6Uj06NA6ItIkx0Q9VQFmc0j
	 i/uKIYWExhwGuXCM8EvRKmMWpV+iY1PXh83JHhva6KLkbQdgaY7C8zdMGz0Pevu7m9B+z
	 aqBpbCENofGtLpZ8fHe1OaEPknwqtMaiXCR155XNGyvOBd6+lekE6Vqq15usI3bU+tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ew+YTy+r;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4D2606A33C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4D2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ew+YTy+r
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-7190d9bdb2cso5007725eaf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802855; x=1796407655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=Ew+YTy+rT7UB3gv4my5hKMMNui51RIpOLMv+lYaERfblHEx27inOvOiZLANtrQz13m
         adSVUWcE05Oyqt3ZDZuFYpIDqU6vCMDvQkpOSBP8iP3ED3WNPY6gDHNrWhtBTNC56KCl
         +GND4pZlItV9kABH2WagloaPtBk2dQEayg7pGs2WV/yjrwCFfvRlrHMH+SbkPvOjFSKa
         ivy6oxuUU0gHFzQfY900KjfoRy5I6Y4D+nGIsfMvHM1pchBSTuL5GW/9vWEXNvuTK3PZ
         WCXkN0UGGXnRXDgDmwRRYFhsjkKKyzZoqS/HVkWLXuj7jtR2a2ExgE+4GWvDMif5xU8R
         kYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802855; x=1796407655;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=awXBaxQw9MqlDsVmRDwVZ0Db6O+Ue5EE0r3eFT7mXjZM43bRs3eH+RpSgyBRgfrq2y
         0joXjdT8zEg2qkhjdzcE8TfKjEJZ4oUySUrNNywCrG5rLcCWXNvnru11FYoqYrhBP0Fv
         Hlq2exRibFEQp2j8VHSykzpzBWkB0C5qI8BoLsgGQvA/P/QlxD4SBq2Fg31HJ1yFgZfm
         VHR4bcY23IyUPYQtgIsCPid6r5kd4Z6s7AlY55RvcHcaqs4ZWftCvlo/E8Eum8dsA02Q
         4Ig1+yflen6dI3wvBeBIzQbFXc4BR368L6I1tH1PMGPZP5c/0o325b1UbwDsBnfvzh40
         Kxog==
X-Forwarded-Encrypted: i=1; AL+hErEIE+u5Vq9S1EvPIycRBW8Z4g6c4s5FpEYihgckcjOhkNytUQuFy/Od4S3pMxdVjZ2ggXavG8YHKZbJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/aMNqTScul5sZOb+lphmeaIoBUWEe/zg2dXUJdpgCp0rislDbs
	9dIcSQ6okZNYQcvajpAksFsFBGV3vkFYaI9bQT59CXqC24Rg8Eam/oF2
X-Gm-Gg: AZFdTZe8e28EMexy/XX03De2CZWUa2TCfNPano0f23RQuZvuFvcflysgxviH8OI6COm
	vG2KV5XG/veYEWwkgX4nd3RHDPNtu1G6lFoq78xhxwuPhAteKwzbEStWK7Dvgp7NhwtC2HpSinR
	fE9pP4Z4538c5sv5yAMy4L3rj1PNf937uM6LSuNKlu5jgA9H9/39wKaJ49tdSggMGhmeTINdFmZ
	8dOh+WlX9v8jJrmqAQhb+EGGOKz7jxJJFnfyE9T3msadIbcEvPq+0I+hIEooDH0WfRHzyMjisfL
	4ltnVwuwsq4GZXWVZE6eAWJcVotlnO+rV/Sz737PzsiRcEl5cPJfeGdLCSkrX582keHWnIF6ktT
	aMi/6AZoXCDiK7O4tbgonQJc2Zmhvc6kJcT8OLgJeP6k4Nv5/VFYqU8EiUam3kDd8CUu1InhyKp
	hlTVMWLYZxIAr5J21VnTyx0PRosq7dpvIqxxVRZaRJT/tHdtOgiB+1wa4Y3rM7sWhi9JPUN2A2k
	XnZdloBISWGyDlnYPB6uTBH4sWoqMy6QFHT4IBw6e4NXOXMNA7U6JPTqwnp6VJ8WJt//tpkadET
	9FJXq7fBW6Tri1DWlxSca86EPtbXMBMPg2osGh3gsyTzg9dGmkUv6HJjJMfgIQVHs/p2LliOcgo
	hSrxFKdzzdoydXJBhPS+HcdeLe6Q=
X-Received: by 2002:a05:6820:3410:20b0:717:da:ba40 with SMTP id 006d021491bc7-71b394956cdmr13815414eaf.26.1795802854800;
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm16618767eaf.4.2026.11.27.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: dockseed@proton.me
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
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:32 -0500
Message-ID: <20261127-a733-dt-v6-05-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
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

> The cover lists CPU/cache topology as untested: all eight CPUs are in
> one cluster, as described. Patch 2/5 mentions the shared L3, but the
> DTSI has no cache nodes, so the kernel falls back to reporting L2 as
> shared by all eight CPUs as well (index2 shared_cpu_list 0-7).

Right. v7 rewords 2/5 so it no longer claims the shared L3 is
described.

> The EEPROM probes as writable. It holds Radxa's factory data, and
> our own DT reads the MAC address from it at 0x9e, so read-only might be
> worth considering.

Agreed, v7 marks it read-only.

> Card hotplug, listed as untested in the cover, works with Vinicius'
> "do not switch the mux to read IRQ lines" fix (a256b8c8083e) on top:
> pulling the card gives "card removed" and reinserting it gives "new
> high speed SDXC card". Without that fix the PF6 level follows the card,
> but the card detect interrupt never fires, so the A7S needs it for
> hotplug.

v7's cover letter names Vinicius' "pinctrl: sunxi: a733: do not switch
the mux to read IRQ lines" as needed for card-detect interrupts on the
A7S.

Enzo
