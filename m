Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427231;
	b=NEb6AZgfNUNTWo4FcMbS0KeZ+XdW2Udk1kkX3nV4zW0wRAokUE5dSdywFPXqXVcXgD5C
	 pe2JDTrhErxOOG6aoXKK2NDRqWNrEOMfGNuj8gEhJOZozYRCzOdPSn9hF0TtqPxRkyldA
	 1Ix9h4NJdEJ3ThUNj9ifqMt1FPShOv3wtMBO0NhtRP00XrSf484BcOnBYxISNBMIYsfK5
	 qtWIDYMhfHpXkpZLiLPJwEl9fypPYzFbt8O5RdKXZrmWNgJuKTLC84IlvBjpw+MQM7be+
	 E//pt3WORQ8gNFhSnet7kV2ixeizFEko0IcRqWG8bq40FssnmN0JtykMm+6L4EXIABg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
	b=KghXiKW6hG41vzxKBQogBnOhlJVcCFWU9El0SFMnSoTkvtrv2jQiSztRSUzCRUgl6bP0
	 69pA6lP0XF6fW2JSTDs0GW1IkBsoyn/YtoVOMlGqYw8kWfoh1FYEUcwlw6AteooQQ+H4j
	 SvF4BzaPt2oeHWL3rjyArXEK4HTgS3nJo3GxZuQjKQtm6Uwke9qqdqZwJaYBnNXreP58e
	 jUlj7kL6n4M81K6NK6Ug25uzkUjoac6n050UE6CSm2g2aRTZgM7af6aEUYeTTeJCHn1nm
	 ANzd5DUGItSB91ytEGirGN6ggR+2FS/XmQVgA5CKIofm1irhzTJinHNUJmzUlVBDJFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICpsNtDj;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB1B606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICpsNtDj
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so2985141e87.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427230; x=1795032030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
        b=ICpsNtDjl8RpGDWPxeboydSu/EEH2dc3F1U/ihmVr5TvqmB9GXzkPDgrSdb4pTybmq
         rSXYND5og4GcBCQzlUFJdJ7g1a0Wg25xXHOc0oR5VBOQCimogGtybB77X2IzzJAL4QCY
         u/rPxDk7NZAtRuT5zgOxildkgI8fjUqWbzfA8BpS1lDpmeugNImYN4GZjcm5G/yE5pEa
         Bmh8Ui1PeSQVZNNz0MEFnx4+oVTDI3tlGl04FCJBhH39Bt9Bpi3W0D18XWQJ6YEjdkdF
         oF1V2Lh3uJOAsQow9V6jQCoClk4BzSTaL6w3T4gVUiqgEkTBavTQWVWq12QqWIUd5r1n
         sSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427230; x=1795032030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
        b=F/qB9ng6QZ2zi4AuAZ4wnIo2y/H5L29TULto8G0MR+grmuJp95Na7EoILKQ1H4kOoZ
         oWuxEL5hhmAyvm6S7Y70EPYp6Q97EE1d1fZjNJhWa4t9JnxZbsYvAUsILQOaEPaenpl/
         FGq6PJhFO+Cs+O3fYeZ65NOrg/ny/Po0NQrOVK6eW44fpVD/Xj1WQNsD4oDJ4t7m04QS
         RV3aI9nDjDoJLg8iCkclnAb6O/I0/B48c0lXXRGN7XPe/U0LccuiVmJZWnbzYG9mYKIb
         jismOBg9FcJtmD2l7HFAJtqcbOcjazpu2uKV7HJrt1PPHCoACw6NTBn7RufppZ0u28Gf
         JdTA==
X-Forwarded-Encrypted: i=1; AL+hErFwNw2+a4RDINVYYzHhUxvQz+AS0aBecQXoEvfhizIoElV6Zr+9d0McwaIdrTTD+5dqyTuLEZO5PXlc@vger.kernel.org
X-Gm-Message-State: APuU4Z8gf5CQ+pYKiSLqofFbtgm4pipSHibngW40SlGK11+zgVT0If4X
	IxOIZ/Gx29aevX3OerWqbZfl3AAdiH+rXKtTAFGSOwhIdzBqPfDe04Mn
X-Gm-Gg: AYBFou1eVCGgqMQb/NMY4PPRaT+hhtjq5EX1lpaqdk/VIoVotDhmXXWQx8FjnEhcAGA
	WR7SPldAVbZ+qu1pRChZlISgR/dIEmVAsf6rR3mqCgUsW76eLJJ4nAb5QkyO0dT6RKx+mN4N6UN
	i0DyCwLUzgv5/DAnLuDgan/+z9ztpJ7lWoZwthRC8AQsaEUgQkayAoswOc5E3unSktP9j0hLN+8
	6kqvBxGueicmXzpjC7euP20HXxzivbNshQbNh3Ih6YpEiH/fASIzotffneZJosb83QjOOnbyEnr
	lCPSvVsDtQy6dykCAMZLDx/t1hvyhsEocQkR19uHuhsHQjvAAMb/HZuQVpS7L2x4zBIK1+jg/Hz
	nIxjwptahcQj13FxYVcC72JEliNlFWcOifvhEaH0B+wgZbNh2zuAPZ39YEpljqjMmtLOwhj9m1i
	ghnB93KS5oz+DcHbjdmaPfAjevoyqXUQU7F7rM8fyQw9Eb8FMED58qHkmUZCjSeHbVGKttJw6uC
	GM0zMbk8ptpZXpNS8khcIuXsKQaHsH3NIaddU02i+VYywtVtPzU9R4jfMj4K7WDy32RRNnRm0+Q
	yTi/xMTbvO5Y63xSwMsVyyNf/H35YSXmS+89aLcclns69HqMvPkVIHrojtsMI4T2AKr0bk6VUuZ
	iGdazIXzy9fqrsV9NEw+43XqlEHqlQkmtEms1
X-Received: by 2002:a05:6512:b8e:b0:5c1:5cce:7f1d with SMTP id 2adb3069b0e04-5c15d58a87amr1050525e87.9.1794427229586;
        Wed, 11 Nov 2026 12:00:29 -0800 (PST)
Received: from yantra.. (nekmmqtce067ylb1za0-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5558:447:baa4:a7d8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bbe89csm1102957e87.81.2026.11.11.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:00:29 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Wed, 11 Nov 2026 22:00:25 +0200
Message-ID: <20261111200025.38344-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-208073@kernel.org>
References: <20261110154254.39092-1-zoone.rupert@gmail.com> <20261110154254.39092-3-zoone.rupert@gmail.com> <sashiko-outbox-208073@kernel.org>
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

On Wed, 11 Nov 2026 02:15:48 +0000
sashiko-bot@kernel.org wrote:

> Should dps310_fill_channels() read pressure first and use
> dps310_refresh_temp_locked() like dps310_read_pressure_value() does?

Yes. The wait came with the triggered buffer support, so it is older
than this patch and holds any trigger faster than temperature to the
temperature rate. Fixed on its own:

https://lore.kernel.org/linux-iio/20261111195118.36853-1-zoone.rupert@gmail.com/

With the fix, this trigger keeps up at 8 and 32 Hz with temperature at
1 Hz. I'll mention it in v2.

Rupesh
