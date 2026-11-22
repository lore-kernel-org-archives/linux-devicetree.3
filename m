Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375147;
	b=Aa92L4al10sZgN5/g2tSBohj2Rc/6P4et4afmfGFOLsxf1QZE0t1CJMq3jjd7hVKYbNp
	 vh1bwmR91EitPJqoDBapjMCFNcYDCll04viasinJJbq2oBYvuWrPlv/dAv7wzfm397bAN
	 K1LdnZxMPNbgNBXrt7CTMyHZUeN0nLY22SK2zKlLy6E3ZUUqky82iyvTOh6e4c9EAuHmv
	 9uyHdeF0Sttx//xmGniMpVcH9LI0kqMswWFeP5MpyGvUV2ZZtvJbp985Tof+oycWYW88F
	 ED6J56+V2YA5CHeCwVmOj+9tajDNMPriV6AhL+mg3ZrPzoFM3/7wcODhMCxr3RcWBjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
	b=ZwzC+BXgnEFsq76HgX1KGqnx+q5ugVpfQSPPjZQ9Y865ZfHRRhotHn3VWmEOF9GeHiUV
	 fDI4cjBfbzAxIqg34ne2YT1qNr5iCnLN9th0tsGbJoBy935Vxp6SxLU3JA8RTd//cRxEm
	 mSAd4lB7D3ctlytuGCPRijPpMEgOkkVcPB3u6MqSdhe5DWF2nr9AnkUUiZheUidx/VPik
	 SFhVL9GVSR51d5b4tSIXjRiO2dpB9AtArj+c9NnGzinlQYk+uVpW7UjCSF8CXTcAUmgot
	 BfuVUFYwoZH2dGPGKpK+USek/rGaYXXKJEsJvLSVPX7vviYjLGVeiITD3MhSux9o+Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANktN+JD;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C81606A31E
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C81606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANktN+JD
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1962722f8f.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375145; x=1795979945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
        b=ANktN+JDfZJG7QsoqdiLxuAKT49fs7fTbIzA99ZCabxHp7x2LLHtqDiLp0KWlhEXRt
         jzWunnHP06VbZRVrw7r15yxpsUN+ohIoW+2jyaSrvrDn2L054VeY9M/jG4KW6lnTgquo
         s+MzmztFVpXICqtnpaJz04SCjvf+sHB+iZjBiVhrVOHakLuDIhEyqgyfdahe6CHgkHD5
         g6db38/jacnBnh5nRpPAlHP2Lc7/x5DfHxJkSHFPpjuIzrRAHLQ9wxUHhfqE4OzQlG1h
         8q08wXWruuDYqeHuCEhVq9s7tZUZ7jbEf3uZhNWI75b/M9+W0hlbglhfzIpctJj0cQ6x
         1Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375145; x=1795979945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
        b=Dvq7M2dZCzot+oKPgdLFoRwUt241BAVblXC33sVTKwMM4I5ByZWZ+QfpD7PAleDb2f
         0UaC5sFzGRPUKD4kNxKx9No8DNh1FddGIvJ9alnJ+xOruBu8oLKhje0JQi/q8gvaBMj6
         TqP+Q5Exg63ygf2qPiH38xWSz0bMDdrQOnid6I+B8J7+dkAjgbX4fMtuODw3dqSM0xT8
         pZCrb7rg30mdu9bn9fuaOf1oiyVA/EGy/AuGwptCI6syg9svk6sykj4BKIFsaQZltdno
         mhf5lqvzhk2c1DY+I6qLyqt4prb9ZMqDvr/CrDRgemc5MBM2mOrrgGnigS3C6ABcfXT/
         /nMQ==
X-Forwarded-Encrypted: i=1; AL+hErHehDj6F74gY/qcslqohAITtFJRhE036PSXbVdyon2xW0SqTBq/Z+rRjF2QABv0cdTaljGtopHeg6PE@vger.kernel.org
X-Gm-Message-State: APuU4Z/NJ9MdiGor1ZQdki2CmWEme/Ediyv4ZryeGgnFePJDhVUpOUWJ
	SklR5NSxKF+3fI26rXRP9dPjfCVaAP1vv5z0W9bgURXg0VDn9Xn6bV0J
X-Gm-Gg: AZFdTZeaFE9i0dD8LZrhvjJwqUGB+iXhMRii7xwwMKYi+fs8GZhxhSe/Zv3v8By4dcm
	0ZFi/ww6u4G8MF302M0xRBo7bBmI+wn2+fCCerpNuCNineURAO8KJSXF+DXAJKdCo3egiRB8E0d
	DCcUBZN4XM5FQQqqF6HCWVUydrwu4yQSQk8to4cWtzDY5qPmqTT11lMcQYg6WDCzoXOt8jnOR15
	WUO7zL3d4fTnWvLy3yCPns17rklWov9e0yEAWduJt5m//jk0FBBaPUvy0FPy81+VOE5NBSdtGZ+
	Sg9XlKkoH2cjaR8F6ZbTgRsxj66cjKOPdUKqzmq6E0auJeeXbBxOYfEgwVMmAYFixzviDhjH5+/
	tQNpTinxUwoB4knSH6UNiwcz2jBCWQilUbtrzCBzHTciqovLaLtl2f8fkBNlot58CECSDl2B52R
	ZhwpnptlFpIjbhg0ZxMH1nuMdGS+3W+gr8wj5zztcD6zGC82Bd+7bonYLvbynvst/YiD07PnsGQ
	ffbyS5cryVTLtJ0KOYTf56l6tvI4UwDpv4OMpt/t8ASTSrG5WInrDuhAGq8at5GAyJCWV+4sTzL
	2Mh7ZR84hCm6m9h+mzvtb5TT5TNSFQrRXN5ISieY/J3L
X-Received: by 2002:adf:e00f:0:10b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-4abb0e4716cmr13169170f8f.10.1795375144988;
        Sun, 22 Nov 2026 11:19:04 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm14926556f8f.46.2026.11.22.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:03 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 2/7] riscv: dts: eswin: add clock generator for EIC7700 SoC
Date: Sun, 22 Nov 2026 19:19:02 +0000
Message-ID: <20261122191902.2183925-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3,
with clk_ignore_unused (without it the board hangs; that is in the
clock driver, not this patch). Details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
