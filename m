Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791701;
	b=Pp5c5nGl/RvaUznoS+OAvL01xAbUxt1EYF3ihnVyq2JDMqUwBdyx6AboH1rCD7JLIPEg
	 cd/zZtUe+RsvAtAPLcknMwmyCsi8qsHBWDzqcwoNH5044jr/vJCyiCq6cpim3erVwu8sC
	 jsmAxc7/aHdS00d0RikI/B88O7aQ6PQ+mb1iXJZvoL322It9DwK6tcmr74t1GIjBi0OKW
	 SW+wEyCC8LT1E3W3y5ZVij5KyiQA5ESD7I6F60GB6B3spkQhDak33H1ZF/7Wmb1ww7zP/
	 cEa2u8h/npXebeEDRgxR4qp71CTD8XbEO7xU7UYCGSoueW03xlBzHVg6aDnxVsVvg/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
	b=OdwkbEIEHxnrMbfDMCcb6zrltj0T4F+2Rz9nvRzOiuhuYKwiAKS4Vbt3a+Nb4KqCtO+X
	 w20F48mqAqRXN53TiipVUTxEQez7/3MnjLyY6bxhjnCIFNvsWiXFLo2B+jXToAvGm4Rg/
	 tvqx9QcgmzZNqwOgXBTV/UqKfV7JYU9tLmXBB6904cpRYWQjlgV6P67WQSpc3zUX/zM8p
	 wQyvD/2l9vJhiy49mlRll43h4NEwXwP9JiGToFYkVJoOeWqCHBaIUdb1ucjz2qTf5xSIi
	 73HRNB2wHrwhGXk+RTuqqoEsmLy33ZhjLRRyBo4VnWhqrhVhtp1a8iEGBa8DFJCxdzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nFyZBs0C;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D6606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00D6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nFyZBs0C
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so71623515e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795791698; x=1796396498; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=nFyZBs0C7J3e4bI0vXvPauJ6r64YNndWq6eLYyzDQCzJVbptP2o0aZ90EisCekw/EL
         j2Dd1RtiL4zfIl+dtEjTVhoTHomp79HlXKDPaomyaugkReD8FKpA/yREODW1Ko/dwnvk
         XH2EPgNpBiyo33q8fEFr6zen0MR6CBcFDz8fnOXmyjomOEzGXCgqyZea9BLuWJ0LK0cx
         keoyBsZTrOeNv3lMG3QVH5wRj/uTIE2DbWVdoHK0+14NO4FMzs/QMOuGmT+UrCgZZGeJ
         roky9jZ3b7avcJANbXD/D4AbGqWrXvn5L4LpN+kzqKjFcQ0XcRHMMl7EMFxCNyipOJnm
         MVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791698; x=1796396498;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=KtOO3aOo1M0WE3UpDURrupa3Z78oPpMaHjtxkGx2UhrWO8/OYKf7+lkG5Tb9eKkfP1
         lclhdmkvs3SA3oaXo8/Tu3KJZ7FNm99Zcy9BDkmvj03p9sO6eoB4rY5snyXOjs2yg6Aa
         pPpufeEmXxl69JVD4VvkSt5pB6CvZq0hYsVCXembhybd2o1kcbTSbZqoBYVP1ZN0wV62
         b9WzLeLQ/upPXDYGO8na2gxH2TvbdsML+qB27v6WmJ2tKO9vAOjXN8pyYYrgP7g1A4Wc
         DiXVQQKzD+2A2bYdQ/KDTs6IrkyI0X7vYyRbPJdGzn82DURuYq1UAGF50xtxfh9ekunh
         9x0Q==
X-Forwarded-Encrypted: i=1; AL+hErG9kdIfrdKz4dOckycPXm+QJ3Jn1x0bqDediO10stqB5l665LLmGJa4RSCJNWKG7UTH9zD1hxfNmElP@vger.kernel.org
X-Gm-Message-State: APuU4Z8qYNPPrHaVN8yKtG6TEcx6J65+PnG4Wfex0O3RKedEIrqUhEzN
	4l2Z/m5jNtqhBZmFkDqiKXsNTE+0e5G4SZXGQ4KDs3ljVgBWiyoK8GAkiXtg6riFFTA=
X-Gm-Gg: AZFdTZd9XdaaqT0QINuQ8SN6NU7+NRooCPSBr5rES62MH9eDweTKNWISdATVYm93wuC
	q8bgqeWOIrhOd+/60YrbudaoVrEXDHN3/j9dFgHpKt6hiOol/n8GjqvUyNI1CyxEpqaEKnwi8oE
	f1I7kCN4sdcYWDuEFFVNv4VESvOpEB9028YETtCykqd7vis0V4Iirb2RYWm7S6r6LKahZoReClU
	0gkXsQJl0AAHR+Sbnhi0w6i8Lm/xpslm9mULn2rIU97zwxOZ746OQB/BhAobHqlPqZkkHM5cP/G
	SdWgT7nkWaplqnPibsSyv6qDLpMp4YZdiqwCMMI51J8Uf8Mhxiq1TZ3ixKDiffIX0X1VLijC6Ip
	vMM9lsZ/MIGznJfonO0HkZKs1jmu382m7nGGHqmVEOs35kxQvnq0xUppeKV7Rpw9ZE4aI9PqcfH
	eWGaZ3LtD0RQySqQNVUT4LvBvIhopzBJ8avhP8X7mziKypo4IO4MOwLjzEi3880gfUjIDIPyB8r
	cOumeTSuXauBxFpxBa49sa2cxOmheyYiClZ5GrhufQKnIhun936fUCnP+zwS1tpn0m2arn4UK6+
	ObOPqcePl1AkdQ8iqFHDKVMJhJty7i7jjieA7BjYq7f5ks0I
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr520259335e9.24.1795791696489;
        Fri, 27 Nov 2026 07:01:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm665457205e9.2.2026.11.27.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:01:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] clk: sophgo: sg2042: Keep gates used by
 firmware enabled
From: Jerome Brunet <jbrunet@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
Date: Fri, 27 Nov 2026 16:01:32 +0100
Message-Id: <179579169278.2788166.8963233310700352675.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zyZPxaWhtK89KOfIzTta5tnUxxcbXy33/Xi1h4W0PlQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcs/3yNEp8maMy1+r+Wm/Ebptp0Biw5cH025W9i/gED
 OfYsO/pKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETc4xgZHr8rKXnybqH076p3
 yxfsn5W+Vc/ixMfzHLltP1bMNnr63J7hn1LOTN7jjgU/O6XVHl+sVq8PNEq9+8Pfmct9ZveT2ru
 dTAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On Milk-V Pioneer, firmware uses I2C0 for the EFI RTC and the serial
> flash for its own image and EFI variables. Both sit behind clock gates
> shared with devices Linux drives, so runtime PM on the Linux side can
> turn them off under the firmware, and GetTime() returns EFI_NOT_READY.
> 
> Let firmware list such gates in protected-clocks on the clkgen node,
> and keep them enabled.
> 
> qcom, the only current user of protected-clocks, does not register such
> clocks at all. That would break the I2C controllers Linux uses, as the
> DesignWare driver needs the clock rate, so here they stay registered and
> are only kept on. I'm not sure this fits the intended use; suggestions
> welcome.
> 
> Tested on Milk-V Pioneer.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Drop the EFI MMIO patch, Ard is taking it through the EFI tree
> - Use protected-clocks instead of scanning reserved nodes under /soc
>   (Krzysztof)

Hey Krzysztof,

Using protected-clocks in the way proposed in this series would give it a different
behavior/meaning compared to what introduced it in Qcom:

- Qualcomm skips registering listed clocks. A consumer requesting a listed ID gets NULL.
- SG2042 still registers listed gates and marks them CLK_IS_CRITICAL.
  A consumer gets a valid clock handle, can read its rate, but releasing its enable
  reference won’t turn off the hardware gate.

Having different meaning for the same property is not ideal, is it ?
Eventually that might be something we could fold into the framework, but that can only
happen if the meaning is consistent.

IMO what they are trying to do here might be more appropriate, but Qcom was there first.
OTOH, actually registering the clock in Qcom would not be a breaking change DT wise, the driver
would start returning a handle where it would previously have returned NULL.

What is your view on this ?

-- 
Jerome

