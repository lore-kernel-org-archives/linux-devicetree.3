Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5F42883D
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892532; cv=none; b=PBBV/H9aYI4pKSlzNP5Aqbu6BA+++S7M8s5nwjWIlkVRVUoiLVwDOHD4+9Np5C2LZcG8aN/mD+6dQucGEAx6T7tstA8A09+dgbJR+y5h4do3zjxyWIPoUiyOCK7JaC9UR2128RRGQEEyTwtmpkRu4EHCcmwkO/uuD6sGSHokTmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892532; c=relaxed/simple;
	bh=3WvURRv+0iGdxA52spNK9Vrx/EhqkX/wdqaVWGz9pO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHR46d05OzkbRSbMHxJSqdv0K/EaNY4MBIcQECMgjcse20CEmZxuCXO67wsjN4k7qPtP1JL8mxFU2aOQ6LJpuPe5mdFssaesIZyj+gFhYjiusW2WIiFTCXL82+koAFWfCgXz5lp/ON42T6raPM6znvgD9bN6/+tb9jhN0+fo3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peaWFW+B; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peaWFW+B"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-449de065cb3so11599592f8f.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892526; x=1780497326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96VfRnvZ0QCw3hUcAbbbU59S7RhhCddL2r3UDNMDre4=;
        b=peaWFW+BO9b7N9ANM6TmONUvqn15q3Cuw95P3PMhYTZnIRb/26wbvozr485/vijz5+
         7OJDujmt3TB8a5dVL2oJwXCq9DeDf5cJmVhdFih0dw2+4UKtGdXkbfDOe44hlc7cvXXE
         7Z4w3kOUlj9PsmP7MS+kLK+dlRYdrApf3f0MtcdyCk2s+NOy0TW7TF42oHygIobSXtjF
         NYnsMwxoITP2Be5y4K4B8/nZRm9SVu0kHHLLVdyO/FSF44OyqhMkt2YW0MY/5CShNpH/
         le3pzH4VecRBsVmyv5mjJGrLHwaNzzRLngivDlNGXnI8rFPOWsx7J+U9mPHH886bZPG8
         yVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892526; x=1780497326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96VfRnvZ0QCw3hUcAbbbU59S7RhhCddL2r3UDNMDre4=;
        b=FzDG5kn6jWCvLFSZSJJC6HXGI1gn5zmP3SFb6TtCiXDGZnu71Ok4AJZk7h9FS4+o9p
         W8tQAusej0WT1gK43V6Q1JjatR0zjn9UO18tJEs3wImNsItQ0/HjOgpquCZy3zZnLQJP
         WLy40XIdInPi3sHREUJgBbwsXgh5zHxSlffaH0vUWPx5bozPaJnoK6llW2lVcAsU8q/8
         9tToMKXaLtgQRqHC8rgOGIGAFHW5/2XSuLIoEZlPM2/NVwPJLohRDWUSTaLz4uBvkZFQ
         xIaTgICA8YWT2n+/ZJEfn1gm+ELv5Smiu6rdrZL4cKRiGeyN8vxhGAe4agz+aLVW58Qn
         iaGA==
X-Forwarded-Encrypted: i=1; AFNElJ8MWvXVchGt0Da4Th+h3RCiOFCUcJJl5M9T9EPn161IXF3n5B8oOzsj09s/SRJljLcrkBxBQ0g8rHSO@vger.kernel.org
X-Gm-Message-State: AOJu0Yym2Inmp76Th/2eBLCMdBm2NQVh84HWVOkn+M0HTwrTyUk42dlo
	jjz9vl7QARaqsvkyGq3sNW4gxO7fQkJsV9MeUm5GPa0VDEs9eYfebnwU
X-Gm-Gg: Acq92OEPSxKda+lnlCH69kWMJF4uznnXxMRrPcPMf5DPoP56gJzDubRf50vHnudkEwk
	HSiEclgVqFBK60yRH3L1kHzxY7hzkB04UA9QO+d+3pHQQ5j1tpCpKh5NyI4XRPyZ8XWC6KyL6Bq
	OOz8tKt/Rattnjs2pbWZ6Zqbm6h4lsrCgFyrCehFXGwB35ToWxuBZtKO/sK7OaoNWK3nl6v6I5R
	t9FR7iaBAR/1EF1d/z6Sxi2/emJltRNMHfm2braljOvConv87Bzp3jKY7v2wnCE5qVhDSiTiSpr
	+M/WBU4RPeHQbRnfHnehb4FpAP6VLawvy+sV4p7Zq4W9nP7FmnHQBGAFCiHYJkE+uRSeUFH8lG/
	GqFHbaHlN0CFLvWM64yyElf0UfFQp5prCU9PRCsJay0fJifbZv0qAhJo37kmQouZIKv6wj7r+Yc
	EL86v8/3gesT+CjS0=
X-Received: by 2002:a05:6000:470b:b0:452:d03a:7aad with SMTP id ffacd0b85a97d-45eb38a6d8cmr39575261f8f.36.1779892526169;
        Wed, 27 May 2026 07:35:26 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:25 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jic23@kernel.org,
	lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] iio: flow: add Sensirion SLF3x liquid flow sensor driver
Date: Wed, 27 May 2026 16:35:06 +0200
Message-ID: <20260527143515.102794-9-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <4349f634-dd7b-468a-912c-5ceb8a283954@roeck-us.net>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-4-wafgo01@gmail.com> <4349f634-dd7b-468a-912c-5ceb8a283954@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 24 May 2026 14:40:51 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Sice you are at it, it might make sense to also support SLF3S-1300F.

Done in v2.  scale_den = 30 000 000 (500 (ml/min)^-1, Table 15 of
the LQ_DS_SLF3S-1300F datasheet) and sub_type byte 0x02 (Table 13,
product number 0x07030202).  Re-checked 0600F (0x07030302 -> 0x03)
and 4000B (0x07030501 -> 0x05) while I was at it, so all three
entries now match the published product numbers.

> > +	{ "sensirion,slf3s-0600f", "slf3s-0600f", ... }
> > drivers/iio/flow/slf3x.c
> What does the "X" refer to ? Why not "S" ?

Done in v2.  Renamed everywhere - slf3x.c -> slf3s.c, SLF3X_* ->
SLF3S_*, Kconfig symbol and MAINTAINERS title too.

> > +static const u8 slf3x_cmd_start_water[]	= { 0x36, 0x08 };  
> 
> I looked at LQ_DS_SLF3S-1300F, LQ_DS_SLF3S-0600F, and LQ_DS_SLF3S-4000B.
> They all also support Isopropyl alcohol (IPA) measurements.
> 
> Would it make sense to also provide support for other liquid types
> besides water ? That could be a sysfs attribute and/or a devicetree
> property.

Picked up in v2.  All three variants are factory-calibrated for
H2O and IPA; the scale factor and temperature interpretation are
identical, only the start command differs (0x3608 vs 0x3615).
v2 adds a "sensirion,medium" DT property (enum "water" / "ipa",
default water) that selects the start command at probe time, and
the binding (patch 2/3) documents it.  Kept this as a probe-time
choice instead of a sysfs attribute since switching mid-run needs
a stop anyway per the datasheet.

> > +static int slf3x_verify_crc(const u8 *block)
> > +{
> > +	return crc8(slf3x_crc_table, block, 2, SLF3X_CRC8_INIT) == block[2] ?
> > +		       0 :
> > +		       -EIO;  
> This returns -EIO on error ...
> > +
> > +	for (i = 0; i < SLF3X_PRODUCT_ID_LEN; i += 3) {
> > +		if (slf3x_verify_crc(&buf[i])) {  
> ... which is then ignored here and replaced by -EIO.
> 
> Why not just have it return a boolean ?

Done in v2.  slf3s_crc_valid() returns bool now; the call sites
translate false into -EIO themselves.

> > +	dev_err(&client->dev, "unsupported SLF3x sub-type 0x%02x\n",
> > +		buf[SLF3X_SUBTYPE_BYTE]);  
> 
> Not my call to make, but the driver is way too noisy for my liking.

Toned down in v2:

  - Unknown sub-type / unexpected family byte -> dev_dbg() and
    keep going (also covers Jonathan's fallback-compatibles point).
  - CRC mismatches -> dev_err_probe() in probe / dev_err() in
    read_raw, one line per failure instead of per-byte spam.

Thanks,
Wadim
