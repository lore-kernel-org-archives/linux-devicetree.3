Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A15383C92
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022453; cv=none; b=YJaUTXMYVJ/KIBcNfw+X0LUf/P3WQwSKzlTotmUDIyux24FqAB3eYBLeWJeuKIp70UTb6PjNG5eJbwiw1Ou64nKO/SNNq1/4X+jtZaDH/sUPbBRxnpAZMTniekbRd5VTgV+mnWnKpxkgPwqnb1/kTqbKNZKU/X3dQR3d4jIMtwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022453; c=relaxed/simple;
	bh=3QluWGMR+jHmo+7IdSGCtayU9+fIrN4dk4r82ov60Mg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKXbF1mU8qkYZFwgJeVd3enkwuWcVpSdOUATH9c1/5GozmIJDPaGGxDfX05PlrKeqy9PycCMWwbJMUFrM90dw+txjGC4m/8vZUAfaNvU5Kp6TfWOcmFbkgc69zjd7/2P/A1JRbjC3uSUc6wZkIgAZapYsEmm+4XNyUA6Ma/Yc/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcpNHEpD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcpNHEpD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48909558b3aso70548215e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022450; x=1777627250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lw13ndhj4hcVsNP3zE5oxceQrXyrN1eVPpHFMKp7r4=;
        b=WcpNHEpDL+yjUcZBCKH0Y8pegl45kvF0gJZk43Pz6FtGDWPks0QQfvEho3E/NpYNxX
         9QEqItjO8XYFyZ7PoKcg3dLSOR2MCawfFjnO64DFT5ka9ddpNHcOitYlgQfgsGgBlJUw
         KXSC3xrJ+cIHIDoIrvZ91YvVUc6bjSqU3A7pKFZhOtq10lRybQwTZtlCGmmxiu6Piyx/
         coY0H8ARp0pdOVLST3y/rnYm+XokPxAPAiq8ia8nKNbVQG/cf1ykQOyHyz05o4uANO/O
         BJNQ1YkRiLvl+WOZRA01DNfvlX+FqSk7HYf17ypwrXzkGwV66NECXozfxa9+SVizXBT2
         fYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022450; x=1777627250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lw13ndhj4hcVsNP3zE5oxceQrXyrN1eVPpHFMKp7r4=;
        b=UsEeRWBZ0CqYIMtB6yP7a9Lo/XbVCRytv8aQ1PYqHU+b9I6RzA5o1FDKSeEIwbgz36
         TYCET6zw5+emN3xOlplJEF0Mva90Og132F6TxKvmGyWtDwhn5m3iSMX8qZA3eZ10pC9C
         e2sye5YI6m5majv+KMTEsVYYVa4gbI1nVXSjG/GtwuX2Q/B4Vwbrmmti3ldS1VPaEryp
         8PPwXY2knXt4zlDg6RXjEMxatpm2rB6BfmtsbcBmgnXz56+IpYNL30bddXg5IaQ+cc9V
         EoePLIQUC43P2lkiSBv5WGecs3JPJ0Hf0kuiTPfaiAB5luJcJTDscgz1RMZPgInkcfT0
         CMfw==
X-Forwarded-Encrypted: i=1; AFNElJ/BpzRTVxkqX/nrmwYljtEwvTG8aDlk0nB7JVgL5/eRkCNjBv+iOrEDMDBZMSAOdmzAxDkTAJl3DYsu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4gwdInAjpOBusy9+JfclO3snGfPloqvAg7RTsJBZMoZ3sWRBB
	9yXwp20r9jknefN+d07PXErYBvBS0BZ2MjRDBJIy+WwNAnRg6TF1/Tln
X-Gm-Gg: AeBDieump78eEgf0jFQtfa3ZrJWmV6i/SBluykSAGjZ0oQpbgZZd8K8ep79BrgV8r8E
	2lEKcTrGvRwWSq02wpEy7a8GDch20TnDjBBZ6pktXmHVlencneVURR3Z7srqjI34Eilp36eshqp
	FEHE7mt3wyjo5jFvBGlF4Huq1qbn0LFC7oz7gqw+KH/p7KD0EbpuwZFpaI0PQ+zPwG/xqAkzwQD
	37AcTEVjpqVpSoHQcFCVSB6Edc1D23zWbWaXwlRoXjHEFbdJcwolhzf8mz0v2VLieshm281sgpY
	9I3ZFF68QHh7ddPS7p7oZfTDHNffcwONsdT+6bOcpnLs1Imu8CAuR8bVE+0d0VynYKuPlZTLsjZ
	cijdwrSpPnDStgryCDjJNiYAkTO90fApnTgWwNeY2xbzLcbxMfGEa4gr/DvDVz3p/BRILJAmYJu
	dnYS3SqpX+MoiFQAgje1RJJ1b5ZFaKbQH4VpyOzhSNePLux7q686hwbEgrlutqZ0loqC5Vvt5Lw
	evws9EKyzMgBI0OMjBtREWnOKr/MvDLYxcx8z9vUsEIB3Gr8DJ0Ga9T8UF795YUenTEv/M=
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb738412mr415441935e9.2.1777022449653;
        Fri, 24 Apr 2026 02:20:49 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm276246255e9.13.2026.04.24.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:20:49 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 24 Apr 2026 10:20:43 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Auchter <michael.auchter@ni.com>, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 21/22] iio: dac: ad5686: add triggered buffer support
Message-ID: <h65ofgapkjztmi5szcmtejcwtjchiyxyp73njefrppxyalw7y3@fjz764sgxkbz>
References: <20260422-ad5313r-iio-support-v1-0-ed7dca001d1b@analog.com>
 <20260422-ad5313r-iio-support-v1-21-ed7dca001d1b@analog.com>
 <20260423192714.04eaa55e@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423192714.04eaa55e@jic23-huawei>

On 26/04/23 07:27PM, Jonathan Cameron wrote:
> On Wed, 22 Apr 2026 15:45:55 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

...

> > +static irqreturn_t ad5686_trigger_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct iio_buffer *buffer = indio_dev->buffer;
> > +	struct ad5686_state *st = iio_priv(indio_dev);
> > +	const struct iio_chan_spec *chan;
> > +	u16 val[AD5686_MAX_CHANNELS];
> 
> I may be wrong but I suspect the static analysers won't like the
> fact that only part of this is initialised and they can't
> tell how much of it is then used. We might need some sanity checks
> to keep them happy even though we know they will always be fine
> (branch predictors should quickly make them near cost free).

will just add = { } to end, so it get initialized to zero:

	u16 val[AD5686_MAX_CHANNELS] = { };

> > +	int ret, ch, i = 0;
> > +	bool async_update;
> > +	u8 cmd;
> > +
> > +	ret = iio_pop_from_buffer(buffer, val);
> At somepoint we should probably add a sanity check on buffer size to that.

nothing to be done here then, I suppose that should be an API-level change
for iio_pop_from_buffer().

> > +	if (ret)
> > +		goto out;

-- 
Kind regards,

Rodrigo Alencar
