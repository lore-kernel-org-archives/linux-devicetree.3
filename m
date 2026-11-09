Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254881;
	b=eQHt59yM4/zgrPk+J6g3CuCd2j/gaRS1MLNTpDxiusbL80nfOJucxeVpxfRj3BueQs9D
	 ZiW45wQqXSqSx9bX+kgl5XVK5vIR+lk/egjiSv7LTAAwiG3ubIUzCtegff7C8gJxuD92S
	 ZWwD8Bm0k/lTnsyaZ1MkK9dsreL6IobnnpdlgghmrEpoFcpAXUh88JHPJGoAYtr2M3t6Q
	 R/KVPrQuYFuKMF96jI3CeauUdIrNcr3ySaO6roKxxTEGJGy/rOvA0dwEpnTgnjzUKZBaL
	 WPcCJlT9PdXDoKn9epkVHeyE9W1tGQKF3ow3mdjgtC8H65Tu+V1WW1qa9JEgMdZKSAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
	b=SDkiyfkrLJgGt00nvmU3DeKV16hmvH0FI1fjO2yoi/gGaF0qPWrdeANMBrHlmTQdx9g7
	 MGe+8RAEXGz2u+fE0YPVt4IXq3nX4CZmbJGlMuaSO2FKGeDkPy7fGRGYxMZYyisbSOyPS
	 1fowdu+ewTd4JX1SLYW512Jqu8mM3aPi5IWf7tuq5P0M2GnFPVw4UrTLGhuRrBW3twGbk
	 CJ+7y16wAKQHhq1Q2ygAtOVVGnaVmLYnNg/in2Z9IrorDU5pCn9lk7pz1zFztgpKw6R4X
	 AYYAeJPZnUcW/Avyh+w0vYBbjjv7iQ7g9IHNl+HVuNpN1PywLzV4i+MqcKEMS3Jr2Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzS5K1aj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384E606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A384E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzS5K1aj
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2526409eec.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 12:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254880; cv=none;
        d=google.com; s=arc-20260327;
        b=l4abnJ4NE5+rVr3ng4K209M64MhRkokMXGXWI1EL1fJzTCeWyizYOGJHwf3J6dYx07
         V+Hhf7J9GcKDRCWE08/StYVU2+TamY7xGVnprwQeBqaaaZtlO61nfbW9fq6o/RRROrig
         g+U2k0ihkx2wxxVW5O0JtbcwR8UEWQb9W+0cZ3j3CnUS3Ng3EmfHVmKnn3dQ3XI3HG7j
         IPJc5qDTnUzymu7A8E3j7knhbP7MPpKLYeCJwtyRxH8GHpGtIahZxcTpcN1A7LUjNsbW
         fiGBdilIYQs0cbaA5/smlMedi5asTehgqC1g5IoAYIbtkSSkI0IGQRZMU454Ve963+fv
         gP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        fh=UMhiYpAav1AraEbG06BWZmMhH6RENX+0ycIno+CdrCo=;
        b=IKo1fFvVnaqI7T8RO+szW6kWvDdkZMD//7yZFRKu6puKb+cwe3r8QlM28oUGS+amiU
         tgMvRSk3ukhmnZLhYFyOCYacyasHMx50J+kCL/mZFyHJr04spH0gxS1tSj2gix7fLUZw
         KDVilqeaSEulAuttkYkzF3o2i5c4uvWyCL9GSGgzaviLtE6NENYnAeAA6jkKtvU0Syxm
         AS7Nq0oQrws1UPHSr1IZ9n8FaMyPivtNYfrOhKeHOl0WdjsAew4KG84jF/TT0BCs1TKk
         OSin9hTdjrRyUk/t5e6yFkAh/yRHhYvO8P82BQeRCPtNeNPTp16XUtKQCbaxSRIZGdul
         80eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254880; x=1794859680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        b=pzS5K1ajLL/ysho4dWDbqN799r7BUPcJItNm2WKd6HE8UbQZGQjHIWxpYuIVy4jY8J
         deWaSjucO5x/RPlLk0GuknYJI3UJrKe1/NgsXSy4p3PsNNGUm7H+98ywcrlse/vl0VKx
         YgOIaeKyw/ZUq4vwO3OnVq6kCpx0LxNb/nKpSEdf31x2ktnyCD3PmcNscntsjmbY0wKE
         r3GWBcb+0VNzwuGVD6wNzdwTPDvf2nB6Anu1yIrUhC2qbjxq7YnjTr4yBQtDexFxsqVB
         PovRMTFdH+7hCci+7SyYYWMnne0bVOb+4XrJ9pKpKbIQgRrUeMWMBf1v5eyS6EEwy2bA
         KNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254880; x=1794859680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        b=jpERAYmoBB04czSMLeTdA9ck3H1KPc8219RhJ6HrLO7RbsFAqraXyIRLoHLrV7NAFz
         vi8TIPa1GD/vvQQuygYe7U/CMN2YNEjzBe8NxFFzpk3TI+/k9dBmNFbPNPwRG1O3W1RB
         wp5ETiL1qRhq2MxBV5TXrhy0MckuoSRGcCFQRDpN4D6qBX11aRwC/I/38P2gY4gzgs96
         qhF2BSkYETXakAQ2QlIBfUY7M90NNO+igRq2Enkb46JwpenUNw7Jy9W3vmgwzWAjEFJx
         f0fnpgmnde7FkVakX2BW1gyuPiSjdkyeyn2l3OAUY5imMTUQaMhCHKNiQYob1qfH+Hf3
         i0jg==
X-Forwarded-Encrypted: i=1; AL+hErHvOIJTdyAIyFkXxpjpYkyaxWBGWkiQ6+ZE7HV9mSiNUqaLdQlDAMn/sCHtr75uoIUDVzniPAtrLDu0@vger.kernel.org
X-Gm-Message-State: APuU4Z9HiC+CAN6A3ISGy8qAucD1UPqjIJv3KsY+nanrKwzg++70nj5Y
	K1Vz0hUr/VTiKtWCNg8PqWFgN7ixIKZoiaHsN8YhYKPMbuJjJgxlrxsT9FG2IKudoX+6UdJc6kn
	9Faj1TMs8fiAmDsB03CDk+UAoWt2f/es=
X-Gm-Gg: AYBFou1ndIz5LZZtYo8TLooetPDqznyDtgRUa+JwCDTzj5lQGlj+qRIfAA9VM1ncSmt
	wId/CispMxlso1wLH5MA64Lib+dgWb9ThebDRMCB1yVGIYAuwNWGfcbrxOi/9swyxzlIdww05MK
	MHoltPS8Os4JfFV6P4vaAwRyYSjsEfEtbt3j6/sInBTv9R5y52ux0zNOymzHhPfd60gbMgJp60n
	IFgKtScDNYrs9eTaPn7EYUMBnSbonwUyUIzeK0r1Fi7VkvxpjSke5mMlhfwod5NqoMrOB3X5DDa
	pgG6i6ls0gU/pj4DXK8nunpuVp+eMtI3FPlXoH9G4AN7MFymHBFROJfX1Y5+Gb2ipiXyJgb+Ho6
	BZLyOHv57RxlrlCqhJ2vwtGP7NxgXqHI0qiZRyrzCMzMwGvz8swsFYCh1wcXSgjhYW5ij+nEz+h
	+wdrCPBbn9VB1ksS7O+4B25dZCQYbrDRJ36g3gD8+V6/7gdMCJ9R4=
X-Received: by 2002:a05:693c:639b:20b0:369:ef92:bd7b with SMTP id
 5a478bee46e88-3752021a4b3mr405313eec.41.1794254879591; Mon, 09 Nov 2026
 12:07:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108094253.83899-5-clamor95@gmail.com> <202611090518.mm6yt2nO-lkp@intel.com>
 <avInQ08dVrsc-Rbo@ashevche-desk.local>
In-Reply-To: <avInQ08dVrsc-Rbo@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 22:07:47 +0200
X-Gm-Features: AclHuK-uW4-VZbHI3Cd7Hqy4mW6DNnwVcXugR9i4sn8vPx7NjzrQMM_Kf1jGWpY
Message-ID: <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kernel test robot <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, 
	oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:04=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 09, 2026 at 05:48:09AM +0800, kernel test robot wrote:
> >
> > kernel test robot noticed the following build errors:
>
> ...
>
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: trace_initcal=
l_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: .i=
nit.data)
> > WARNING: modpost: vmlinux: section mismatch in reference: __arch_xprod_=
64+0xac (section: .text.unlikely) -> initcall_level_names (section: .init.d=
ata)
> > >> ERROR: modpost: drivers/iio/light/ltr501.ko: symbol 'iio_find_channe=
l_from_si' undefined!
>
> Forgot to import namespace?
>

It is not exported in the core

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/iio/industrialio-core.c?h=3Dnext-20261109#n319

> --
> With Best Regards,
> Andy Shevchenko
>
>
