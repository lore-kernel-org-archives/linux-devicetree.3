Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1BA3E1CE5
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011612; cv=pass; b=Da6ngrxKvN3itOdr4w+I4+Qc30BtOoHZQvhfgOq9EPVvJgxvh4wdmJoG+yQIoBzbfQFvsILelvPNKy8mRPQcxxPlRENogKigomM+OFiz3YVz/Gg8F2VAgcVmxTVAqEUtEky0oqZYwxZuPD1NwbzrS1BrLxhGhBc0JpYyCcpybPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011612; c=relaxed/simple;
	bh=evGdp8hY4UsToY/uvp7yLFJq32Ens/R4w8zKdD+5dMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHYPJgiItUjxQ9v3nVqd2Hb+87bKd/ZQurv9dhCKh22NZhegD1471zHGeLt4q1w84PCqWRzBG5qgCrggNAp45Av9BgrB7V8VxO8D8XI18Ncl6qvr6qJ02aNnt3Gd3wXo+zrWRnLQOPhzEVg/wDX4xkMKB1Vghewuwx/eRjuCQ4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Ndji3Yyx; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Ndji3Yyx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so468804f8f.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784011609; cv=none;
        d=google.com; s=arc-20260327;
        b=Ry/7qVNBW2BI5x2fBlQTTHXGLfaunSb2FbecK9ezeslr0Au/UelA91UAfKTt8rpifB
         kG9i6i46nVaw3WnaCdfFx2f4JrNdupTx+MAhjLEJ7smKVD11Ss4BV7mLDu1RZRoY6Ftf
         qjG4trIRUW+6uf1NQESGPyRIABe8P0SqCf2aMcZQhwJb1VKKhTMLcLbyR5jOfGzFYeC3
         catw95PiQHVR9d2b+0FmjU/h63ICOCRQ0IwdaHWZGVywaqgstuXcRBGljbWztHpRc/Wc
         bhdSO9cbW3MpDjYv+NI4AA2UIDJkJSdNweRsN5NFpTqo2Yz/dmzry2ECdpUEr8adp2Yj
         BA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=;
        fh=PskT4WOjRM4lqvQbNMg+R8aPuuLo6nd4S+Nevf8CzS0=;
        b=bZvxMBsi/x4mt9zu3j98zb0VRuAXPizXFLr4xItHoZK6vW3x5rjYAI4xsxeDQqzMNW
         l4fcX6CW9yHL0gAwOk8vXLXnAM/EnOhG1hH+2EAe8eibhn8dUez4hJQga8vpWV6op+Ws
         hA51U2d83RAG6wxm9u7DElt2pEOWfOum1fbjMjT0CXfG77QiYdfkhuSzFCFpEUe4fNVi
         ykUhD8414gD5cvAb2TV91LY4l1KOx90oCyYTyQgeDBAXOH6PcdVnVQSx6MQu64rzg2yc
         pyaQPMT+GO2oaJG5GoikiXGSvORvhwRsYL64SWN4Xmcmy4C8yigTXWWxxPwwMZQxnxUJ
         F49w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784011609; x=1784616409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=;
        b=Ndji3YyxsJOovUrMDTckN8L20MRTCpcyhu/ilunu+dMPAfLUvrfV6r5+s9YKUgmMCS
         16DJlxsYB612DGhdWNhD2xfiUhPNyiXYh4MmB/YG1+7G7Ric38ha1js7V7s/mVceYNUv
         xcX0oUftCkVd+cRG9Cb9xaA08UBtnHjV5wjjEuFgz7k519f8mDXoGk0g0YiKkIQ8adDa
         kUqdPZqLWJkVycEOfO+zkewd2BYs/VLajiJ/yh4b8mtMp6SHuL4gJZd8ZAHGt7KOy6kO
         PXNl2L4ax0vGKvtp9HEvRH62vlEh6uSlu+MVco9qWw++zJ7/J7FLB1NY/5chJUukHy9m
         2k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011609; x=1784616409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRIKFgzkF61kYnLz7Ci2gKmTsN7do9uyOR/32IqtdZ8=;
        b=LOjabSvRTcKox8Zxbpapk1V4JxO4L6WvqNEXi7LlorfvlMngDgRhTMa75wc38IARbe
         RKnNgSq9RAM5CXQxXWYAsiTFnajHWK5O7zMRDU5JDAykCts7VUIJK0qG5tfRVdPjmGm9
         wLNohmBKfvS7PY72HMESbx8VcTkbRa1k9eM6+TmIEc9e/Gr43jdJx0W00vzhT8OIJ4G4
         S+kPN/nbju0LNnBLgNOVgIeIc9qTe252aNKhrstk0ESBJju8SnigYCNs0YoxIqmzNmS4
         Nk9gdzi5dROFb5KeKLyKCa8KvrZPV2ht6ZinUyQrtwtbQ3mglLV61ndwTiw0klV9yFVd
         zXLQ==
X-Forwarded-Encrypted: i=1; AHgh+RovHsjzDsry7H7KOfZiog0dtwxYDRKCKky9qU70tw/WQDHYFXX7XT2hst2EpwEDgkgsTJuVvQwWg5gi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AuxOsODAFGknflZ71J3VAs32/CExdXAeS9vInRrZjxaMrNO8
	FozfrvvnJ9Sanyj8mKiY1xviPndyQJkyQk3FvoUOASYJbTp8JA9nxQQOI4XFK/fLpik7DAV7rMI
	tiC3Yzfu4CGmWMUq6hpi8Oy6N27MgiHsIsVfhZsnA+Q==
X-Gm-Gg: AfdE7ckOhCNVbx6GFh0gwEpLJU1J5Mm4xjCIfP3Y/Ed0E9KgSZ3/L1JOPFulBW2CDVy
	gBNbvRit9FAOsmDKAOhNW4DeT+E6kReUmaM5QIUpkFCnnoqBawsleI+5VAL/nsopcuWJjq9g/sw
	QVRJJaGmQg2g5HYgGsMl/EQekNCncxg0haFUp7QhZZMoRaGkWF/1zYOSRWU2e0MLHLY7DzMqlVh
	PbMqkIti6HftQ5hC2syDYRjLVzPEx2JK3CYCiDBHxYC+ibxoSqDJA++OF40/wDCRKkLrPguo0Cl
	Kpn+7Uq1nFBiu4Js7+AZ410yXQXk/yV3QuytN5aJrvNT3k8qa1FNg2DZXg==
X-Received: by 2002:a05:6000:2c03:b0:46f:f12b:e457 with SMTP id
 ffacd0b85a97d-47f2dcc333cmr14446794f8f.21.1784011608749; Mon, 13 Jul 2026
 23:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
 <eaef5bcc-99df-4549-8d37-fb3d127c414e@kernel.org>
In-Reply-To: <eaef5bcc-99df-4549-8d37-fb3d127c414e@kernel.org>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 08:46:38 +0200
X-Gm-Features: AUfX_myOLR4_eYCcAMsMsFbuxCuEv8cibreksrI0hciTFLsi2wYi7z1DbvBt6s4
Message-ID: <CAFi2wKaO9ea77KP3hjoaruMgU8oVbbtuAmXK8p-12HRdRFOACQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] soc: aspeed: add host-side PCIe BMC device driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

> > ...
> > +
> > +enum aspeed_platform_id {
> > +     ASPEED,
>
> What is this good for?

Unecessary, it's removed now.

>
> > +};
> > +
> > +static const int vuart_msi_index[2] =3D { 16, 17 };
> > +static const int vuart_port_addr[2] =3D {0x3f8, 0x2f8};
>
> Sort of inconsistent spaces. Both arrays should be unsigned anyway. And
> for the latter, u16 should be enough.

True. Acknowledged.

> > ...
> > +
> > +     vuart_ioport =3D vuart_port_addr[idx];
> > +     /* ASPEED BMC device shift addresses by 2 to the left */
> > +     vuart_ioport =3D vuart_ioport << 2;
>
> Simply:
> vuart_ioport <<=3D 2;
> ? Or join the two lines?

Joined the two lines.

> > ...
> > +static struct pci_device_id aspeed_host_bmc_dev_pci_ids[] =3D {
> > +     { PCI_DEVICE(PCI_VENDOR_ID_ASPEED, PCI_BMC_DEVICE_ID),
> > +             .class =3D 0xFF0000, .class_mask =3D 0xFFFF00,
>
> PCI_CLASS_OTHERS << 16

Acknowledged

> > ...
> thanks,
> --
> js
> suse labs

Thanks for the review. Applied everything for the next revision.

Regards,
Gr=C3=A9goire
