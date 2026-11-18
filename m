Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012972;
	b=a5I1e+lGrotLxjQEcdGEwOV1Qu65N2+tEZY+oGK7v6R+4ja6HhfZNmv7mB9j5DG++FCL
	 Qn+seJ2ZBJgNHJpLR7NuxfoiDedbD8isH+At7vOB3hL60QEVxVr8YE4tUOfh4TTNG9j1+
	 6hfsBLqiYMSUjhRLWswYi9srL7CC3PMkqoqGuf2qSR6lHTzACfr5QWb4wqnNCpBktOsAd
	 k+bPIqnOh43FNYifzj7/3i2aFctAZorJ5NCJWfP6OQtyiyU8ejK5FcRTSLC4YfKcvf0bX
	 4jF3lh1VUcHaS9+SaYpDf8JM6v4l9roXQVmrwBE/uPYvli2gHLE+H543YOZ6R0DXdTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
	b=aE3/3B6ARwR5V2QAZvHFa9/OcsPV/lwqMpeoJvluRk8ljGSqRJw9CZ4Xjyu+wG5wKgbK
	 VDiekmHEZOgQUdtFe2rLlCBjD6Z6LxzEjqg0MorLBFNJV/82/kMeUTaq31GoQn9EyZniI
	 8MTEr3oIMKzpevMw9qmu0Kf6exnPp3/hILSBOIW0beD4JRpSWgQtD5E9oqW4ZQPWq0ynv
	 mLyQHI1IPxJHj+YFw+axxjdpiWCM5QPfAZPLwNTwwLx8the9XfXZbxgmvEsx7xh948+KF
	 accOkYsW0TjIY3CiBEJPNOoH4UDZCbPDUaLAag1zH1zKiuLVj8qqywkOwNqUtfhDL0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jTiQDbi/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70A7606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTiQDbi/
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50604721c8so157558666b.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795012970; cv=none;
        d=google.com; s=arc-20260327;
        b=l9sa/0NhrFScushrnAzC9Q7d3sis0iYcrL94DyHSec7JmybKwk/QRUJungnZ2zNWgk
         8ulamfWFhvkMTXlzu2niS0Zt4KSDnZJfB3+sP7eqZBTqQzQKk+7h57D7X5Oa7phgqOgM
         CFFR2q9bBRCiHUrfUcFGzR+AVprLfSDVr4HdAKKHM03DlBHAYBf9yeY21q/512K0eGgu
         jtyNjdFqiI+jQjDN9yTnY/ExvveioKwic4TitpMOCSj1avI2/GVv3Ppz50Syk3F4jmcu
         EsuyZ3behOasb2zs8ca38N91yzjhlbMI/FSBWAYq78MBy6uYwRP9HSIlmMXuS0BFRad2
         HqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
        fh=FGOg0xSNcZ19gsWHP0SP+RYXlG4HFX7jeWodr6/E2X4=;
        b=IradS2x/naqSM/utqcR+toKSkAydMKmUxo2Gvh4ujwUIQy8dDAfF2byGSvJN2YFD5S
         wBGfbWFNRdD1vi9lbKXB28ZYep7oPdIllLmWHbEYWpSoBizyU/S/csOid+3IbokLbHyW
         SiYl+fs58BTrfhfZ6L9TZKoWUatgjylRBz95MdVSw4cu+9+CwKA34sftghHDJF2cuAMq
         L1eBjiHC6TSHjywUBlg2YEIJeEutK4dg0xVqWDbkcfYVvCbdcC3EM1jKKbrdUDggruCe
         mXixSlXrzuEz3Jyn9fnO/KSw9HsVKslvQl5yK9/MgMzgir/mWk7PuMPuMT+GvSsZW+Gf
         rnAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795012970; x=1795617770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
        b=jTiQDbi/ZtDF9t7SdZiTQkBZF6ofbKF1K/q0w7e3sDchHSUAOksiNycNOD7xKOPLqg
         zhnYNkawYM2wCk380hedn5Rd00ZQCh4tOqAUmiix3gR+AyyaiA+eDJ/E3PlvsFYJYzC3
         BE5HqaDLzWfvWJS3Hry0BVCbMDMI5JnmBMXQHsPnZUpnpwRYbt/Inu1lk5gxec8XS/tJ
         RgIcD4ZkSKHPIeYSAzprNwYjsKa6lt2s/20I5DNtB+ZNJC/bEB1+JGDUHI75kO2qkRK+
         jsqtJb/tW9GUrFzizei7Y9LEWjJjsSv3KmCtAV9m1v0QIPJwfAItP6FbSgZWRCz/WfjH
         PTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012970; x=1795617770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUoJPQ+bQcBMLjchQg2sOom+qhVfJBoy/IZRsgGe9ys=;
        b=0CMOOHRJV0n3zeaR+WRK6vCAP/r+xNfJeCn6AVqSvNIWlCR09Un/0jk+g9EzfQVZZz
         9DW3rzciJaUuqrwKZ/0O4wYE/iG9VZnB6efD+2CSXT6/LNaTmo9sFTNYQxKoCk+Infp2
         KTCgHWH24Xilj5eja3xELWIDhqpFYMoU+lthhLkm2sKvTSJrqf291mHpH8xvAcArCSYv
         wLRKnyqPmJ5kExfSba+nC7PTuPtfgXf+cPRG6bbTOIillYYN61p2zzjhZacAPj5MdhFy
         R4vu/DipHmIfNO/gVZ7ZEDTos3E1UiVQ0JkHVyZU/bT0BTzVZhF3oBz8KpC7MtdlNnoq
         rNuw==
X-Forwarded-Encrypted: i=1; AL+hErEvrgPIj8m1fF/J5b429Mb/+IKPLgE16xlnQtVBx8CnfxiGTWdi+PgLpFd9fYb6W/7J6uoeeGk4sf5N@vger.kernel.org
X-Gm-Message-State: APuU4Z/1TSMNzmnxCcr1VGEy95wapyFod26Rx9lZ/T115pvP7p7WHmf9
	8j9J63DPH0cHVVI5W4p2/f8R3EYJzgk+Zn4BxxZ3L8akuzHOmoYBwoJJ9kergdkmlcMiZjFN4+g
	8d2DzzqlPliKG08SSeXyU+RqBHz+2BpA=
X-Gm-Gg: AYBFou1XhOVHb/+DHuofcWYdL5Xy+Q7paPzNEw+tUglQPpMIJ3vHV95TBl0UQhwtLrw
	h6vSKNjGPGirhL5JLzZAZd6TM6SSinbvI4ees+isKMQCFwmXes9Vg6sK9KJ9xKKEk8l5fXRzm7N
	Jal1PO0uJgzsTE4JNigVDuGyIjsZV0fhUjLRNlzWt3KKdnNbKGHrxQZ8lvq7heUN7eeWpCP+3b5
	/l/Y+RS8zjorLoSnt/ABwGV0iRSNHXsd2QmXOvL7EsMFXs4hGwyHRF8kNCRRJ8Iu+z2fgehGdoI
	Sx2YdyfW9Pj/dGjqakqglUfzqn1PHW+X4X8Jeixv9Gi0xgfC4AgB6ea6txdGZHsqhg0ihorI/xX
	FrRLu09Ru8r2yW9w1Bo6rJtIbBHU6ZriMlLZrNng6wZw4Tksd89+XfqUF9X8l/k1FzDLTq/AALl
	C6J9p+CoWZgOqsmft15S7UXx+PbgtAWg==
X-Received: by 2002:a17:907:940b:b0:c29:f5d8:9c73 with SMTP id
 a640c23a62f3a-c510e324a07mr241805366b.34.1795012969839; Wed, 18 Nov 2026
 06:42:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118134555.195479-1-clamor95@gmail.com> <20261118134555.195479-2-clamor95@gmail.com>
 <av24x_dcu2hggP5y@shikoro>
In-Reply-To: <av24x_dcu2hggP5y@shikoro>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 16:42:35 +0200
X-Gm-Features: AclHuK93fhxoBlMqicbFK9Gc1HJyqVV4hippm2euH0OtywPbIka7CYKr7EMAras
Message-ID: <CAPVz0n2jSrZ+ya=7JgARDRTFZ8-cu=209GGiOK8KYAwph1hGDg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: Document ASUS Transformer's Dock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hans de Goede <hansg@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:4=
0 Wolfram Sang
<wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
>
> >  .../bindings/i2c/asus,transformer-dock.yaml   | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/asus,transfor=
mer-dock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/asus,transformer-doc=
k.yaml b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
> > new file mode 100644
> > index 0000000000000..5f4a40539c2b4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
>
> This is not an I2C controller, so "i2c" is not the proper directory, I'd
> say. "connector" maybe? DT maintainers may have another suggestion.
>

I have placed it here arbitrary. I am perfectly fine with any place
schema maintainers point to.

> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml
>
> Hmm, this bindings only uses "i2c-parent" which is not even described in
> the above file. Not your fault / problem, but we should describe it
> somewhen somewhere central maybe? I guess the above $ref could be
> dropped still.
>

Child nodes too. IIRC i2c-controller.yaml covers those.

> No comments on the general approach, I'll leave this to DT and Asus
> platform maintainers.
>
