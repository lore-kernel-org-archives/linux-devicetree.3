Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154421;
	b=3LQ4eBK4YQjm2618vO8xGf7dSaj+THGYIQ9P+6bG+YgsASPVF27/+HBOdwFjD0KsGk0g
	 z7Hqyl3BoqQ0yHIHH8J2joh3aoaBTh9nKnrsqDAoWzPeUni84W+B/TWetOH1HskmqtuvA
	 N8lyBm+bzXKrFUgSeFpMQH/wRE6SxS3wyHQdfh+addU2PbD9bzfW60RDXpBhFpjta6k3X
	 c2FZyO5w0jSgeXTdutSx7xTST4ESz5obKwlUgQTBAIjse3Fzpeokdi6OIhrPv/dc8ZrS2
	 TuHJJZDSOG1Mn7WxZ4zI7NIVeZWBfkFEPL83kKaO+CB/nfA3AkmD1O3sv851Aq2r1BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dztU/TExvRdwdoHHA1pmOA03tC4CKeaHgrcXA1r9kN4=;
	b=DNZC9vomh13PwMuR/4a+s/YktIQkVBe/hX3/ZDI2nk3zRKXn/xg86LbZb/CD2XGyaZuO
	 1sXYwjsn13N0Szu4d7KoYqGmiOee6x63YIleFnAkxclISKRP0cPpeJmlBwtc1638U34uY
	 cz+6odZj1d1pHyn6NfXvOtzDCFDRHY1N2eV1//gcW+Lr8bIprYQ2KUyBRheR8kjYpXsTn
	 abE3bPQdPtGtGOCenxUiOijPXH/3/BCvC6SzhHagKEueQ/1W17K5rrU6gerrBPW6K7Odc
	 LnZj+ZMHQxOxbhtrfSgvD0MvruRKg/2ruu+DBizNUbcgWDqO1GwOHt80A5D44q2fqeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6u4ASHA;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0157606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0157606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6u4ASHA
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1224791137.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154420; x=1793759220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dztU/TExvRdwdoHHA1pmOA03tC4CKeaHgrcXA1r9kN4=;
        b=q6u4ASHAlu96sY2ofBItUFB1lKaUWqtlWcAjq1ouApqcY9t1yw/Wh4kibHPEDawxFh
         VksZEMuoeQxaWyIEf9SyZnbklSAYVChDgCLG/EQLSM8ltiILoRoF26o4QlDAPXW1Vl5Y
         ahbBNd2ed5e4dZ4wFAaoDVIOUJCVkV5M6rl2KuVq1HavhyAKFN7RdW0BaimAwmGBstIt
         BgfJFswec0DhT2mz43ls7KM9phFFtq1ThmmvFaas6zEnLYqrz5TYaZhpWAOY4hdTsSke
         ZTHX+2th4s8+FFHJOeX7b42JRpdmDBCW7gSVzBnSC+qqc4yLX/f27lS+9cYM0lomxpio
         b5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154420; x=1793759220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dztU/TExvRdwdoHHA1pmOA03tC4CKeaHgrcXA1r9kN4=;
        b=STXPc5QRKaYQDZK7fHeshYfKGh+1bzg+9r5F4nD8RVGvsxY4Cy3VwMhL1tU1B0VpZr
         Q4ls0qDs+BbYOdiRFcN/i/eXhkFadaSrCPgCQ2fojnz122GZaPAtY4hxAcw0LSUzCsQN
         wmVkdhLeWyF2kPZRw4P4NoDIP7940VSMFXKwdCRL2c2PPSFQaQ+d3xMTQ988YYv40LO+
         LTUleT5zrzKu2an/c/P/spfNvkplbjYPtAT2w0Ixmouzwvls4IOfcFk1D0f5k7n6vRBV
         j4lG39mJFzW+Rn8e79/J0v9XE3gIzu2k8QF1kqISKDFvHBSupVEpPGF7K/28OAPEiFXO
         zA8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGrwtSUem2izbPVsCjT5lrIQRrDO1uYRzj/Xzw+vPmcBx17Ji88Mi306C5FRZF4GxcfYQDVoXa+GeS@vger.kernel.org
X-Gm-Message-State: AFq9FYKiLNaQxuPriPAV8gubLNLcgx0Yd5D4x0SCzks2H4VZ7Q7k9X3D
	bWsZfnya/pyGm+neSGInRj/KGPky1dHKwTR0rxfQ6k6bkJ7wbfYZY4nf
X-Gm-Gg: AYBFou10QrJSyh1Tf1pY8XRm/gMM+t+fHQryShS99w1KzuGa2uwN+VBWtYSnXvq20U5
	NVo63q8zJnLukLIfEXrq/hyPzrA2BdRqh82RRfY/QsAovp3G+9FMIy78ZxWHYcPyGWAelcyDdXz
	8eThKDDZmkzvBs8q+IGRhjyhz+9yT3qoHVlFm8B6WdqJZF9Bpm+RsJGb/bt2u1Pzrxx6AHtyzKW
	nc0vOLTjyNuJTlz+uim7WKxHq1aM7KJiCIvobXyYf33dr/LpDqfN1rjDCklsBZBIshGPnNfn1PZ
	yz1lZE3DJdqTskO5A+WhUsex+DNr0NR22f0TOsukbbYdDcZK7xoXGHqNBi2y6Cye8YgYbyUdP4F
	aGLAYmb6bSFkSE3RYWISwkMgIxOHaXVtr5x6ret2EI0IgwulQ+TdYBJIw7QvxRg/LuxTv79xbtG
	T2vpiuMOLlbuqUfDYUuV+9k8iZcIrZLp26jR92Agy5Q7RF+Z1d1dgANK7TorJS8+/RZpa0Qp9oG
	ymoub7D0Ezv8vTAKhxrLYebOAZf77qcW/aT7uKrsXwzGQ61GPHkPzkPluL8mn6eEdAYD5xJ/Or/
	3TkTaCuhXxJYuTYu7Pl8AT5dr4qntKJ5u3gqre9Qt17whystY/pm
X-Received: by 2002:a05:6102:41a3:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7d041913706mr48618137.6.1793154419656;
        Tue, 27 Oct 2026 19:26:59 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3bc3824sm4456693137.4.2026.10.27.19.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:26:59 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] iio: adc: ti-ads1298: add ADS1299 support
Date: Tue, 27 Oct 2026 23:26:52 -0300
Message-ID: <20261028022652.31121-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025233429.23b02702@jic23-hlaptop>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-7-stephanbrrs8@gmail.com> <20261025233429.23b02702@jic23-hlaptop>
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

On Sun, 25 Oct 2026 23:34:29 +0000, Jonathan Cameron wrote:
> A few things in here feel like they should be in precursor
> patches because the implication is they apply just as much
> to improving support for the ads1298 as they do for the
> new device.

Agreed. DVDD and PWDN become ADS129x patches, binding and driver, before
the ADS1299 ones.

> > +	if (FIELD_GET(ADS1299_MASK_ID_DEVICE, id) != ADS1299_ID_DEVICE ||
> > +	    nu_ch > 2)
> > +		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", id);
> How do backwards compatible parts with fallback compatible of ads1299 work?
>
> Generally we don't reject on simply an who am I value mismatch.
> Note the existing driver may need relaxing on that point - we used
> to do this before DT maitainers pointed out what it broke!

Today that works only within a family: the channel count comes from the
ID, so ti,ads1299 serves the -4 and -6, and ti,ads1298 the ADS1294/6
and the R parts. A part with a new ID is refused, as the existing driver
does too.

For v3 I'd do, in a precursor patch for the existing driver: the
compatible's chip info is what the driver trusts. If the ID is a known
part of that family, it still gives the channel count and the name; if
not (another family, or a reserved channel code), the driver warns and
goes on with the compatible's chip info. The channel count from the ID
has to stay, since ti,ads1298 has been the only compatible and existing
boards with an ADS1294 or ADS1296 depend on it.

Does that match what you have in mind?

> > +	/* The ADS1299 comes out of reset with its inputs shorted */
>
> What is the case for the ADS1298 - is this just harmless or does
> that have similar behavior?

Harmless. On the ADS129x CHnSET resets to 00h, normal electrode input,
so the write changes nothing. On the ADS1299 it resets to 61h, input
shorted, and without the write each channel reads its own shorted input.
I'll make it ADS1299 only, through chip info, unless you prefer it
unconditional.

> > +	for (i = 0; i < indio_dev->num_channels; i++) {
>
> 	for (unsigned int i = 0;...

Will do.

Thanks,
Stephan
