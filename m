Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4202EBBA1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901160; cv=pass; b=um8hnK8J/fDNjH7gsUqLIMWtsVJiInCH80ELbWDk12Vs6AUofYVrlOBbEMdPX/UECzqUhxOgi3OHV6oq24R27zu1di4MDobEWXkt1BHxGFuTiZAEEQyOsdHmWF7CEe49yWnJxkz46ynguf/Y2CW47Nd5H3Bba8yy1DRpqZ0yZ8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901160; c=relaxed/simple;
	bh=bHfy37nuhXXv2KjsVSnDnRxsko7sG7MprYZCmzSFsb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gx3ocnUMA4zQZZR65b7P1/5uuMZQlDi2DPxkqUD31guqn4QGfh8xLDBhIhwWos2cpZKkR+Ed9ekp44T0z5n5balKYLmjPjGFDlmPNlPnET/tWQK8SVmC97h5PgcfspVo/rEjDAvz+3Yo/55FLcLHuPBCV+D508f/MkX+Zzn1GZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqLN9oex; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqLN9oex"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4905529b933so41568385e9.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780901157; cv=none;
        d=google.com; s=arc-20240605;
        b=MVNuK0p0cvlYXMclE4Suu3ctpmj5iUlsgjnciO+7GWRPGHtJNcjKsq7uag7OC2LRrf
         su6rDiGX5PJPjuM6h9O78RRfXWMAFdFsMkNZ/epURR+c8AyUjlN1ocNgdeS5o6K/WCrq
         LPT1dvOXh4ryS585EXSORmDoypshLcceiTHWhDjjaMohO7IBXtxmeMmZn/ZHIcZN2FTE
         1FabMPMQHUh9r72VapNZwYuQpRimJCda/bpT9ybDyQjY4ceWz1Q2rLC1EHIz1PgYm714
         OMbgQdCT29End5salIR8aNMRyMwZMMhZxr/gLz7HlE7ZXdbIyOr0oKlY7e8bwmpFyXkh
         yR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4jugU81pr+f1VJLNxBDFshudd8rMntDvqBLDpTS6168=;
        fh=cguz2JppnrjoMxCkA3K4LPj5eCOlwIkTO/hwnj4xq4I=;
        b=W5l+Vf7pRKmXeyZ+ZLo7Vj44nSEMctzbHXVPTwWKBHXVY8vnhe43PSG9wBHHs9Ferv
         BjsILVl+7SmJgKhaTHI7yfQYzZjDZeqmlAXX8Sl5ZpXzKW+deBRM+ERRX2+UkkIOgvLm
         vTQpDJNmu5tkNNseDR59bwXXUYYDgXQaLGOF0GH6uCTNptHu8gAEgfZCSdblvA+gYE7H
         0Y9qGSHHesqG8nnsiS5OVMHO8EuhlXOJv7NPvy97WDjdffr2U4casFM7OF+dqu+ckoYl
         yvX4F7t8phqvmZ/w1vB/KdcUp3Uvbv+mDKHAH/yokV+53Ewjy/GBA8+u057Ptub26n2b
         J+vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780901157; x=1781505957; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4jugU81pr+f1VJLNxBDFshudd8rMntDvqBLDpTS6168=;
        b=LqLN9oexujn8YQcAxtBDfKFtiEXOcm2EHRqbBODcPaWkMXFwsttHxrOR9//Q2qtNGF
         z4fRnjnKFweMJxg0YANgITXLP3aVIrlvKjrEFsBA6LZ9U5b7ryRSDJMlGMmAasyORv9x
         Y8l6bFS2gp6hl1VoQz6+JG87cev4dffARZG7dkt/x8vHH4602IhwKULWi9jC85jeGhfW
         1+SYAwdh7IOd/BJL/+jxL4MOrD5nZJqjIK05moZUEFCg0Rb64qvbLjmmDkz2iIiqibmc
         WfuP3WvBNLisFyxyozUgMo5baDk7cXtT6RSHgZaIzGIIbQbhVfRRlSmlyMCbp+RZCtSV
         nsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901157; x=1781505957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jugU81pr+f1VJLNxBDFshudd8rMntDvqBLDpTS6168=;
        b=ByR24vGV4TNLo8XhNkwQmOiBFtzPlHwdk+8jg4PMLGoYk3g+agbfbsqORt/htTQwHu
         O9Wdhanl06wYgRpOQMLTM2w74I7F5tlZczxIRDgaACo8mEg0BnKhoPZ3fnOwJseuGECs
         7tYb0fmUAJIXEha45VTBN7sbr58xKoY2b5oJAR65aYoQafwf/7U4DQxhNigMQNkaLMv2
         uuukphXZ7VNHCyy176ZGIQN/9EhGQt4rcSBwgUcLlr1OqOBfCyg+cyWnS9XwKKKv2y1q
         lVY8BhQFQktFmjmL4hiTTUIE0UyPj4/YjdvalFt2MhGGFHcZ6hJmKDc2cbB2DmuDnfzB
         dQyg==
X-Forwarded-Encrypted: i=1; AFNElJ/MNd61VGdx5o4tuTGN1mByNSE2xA0Ty6HX2pwQCErE9KSrCrfUzcWwVUIOImhdKg+Xstt45qf5XOAV@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZTqpVNz6zxdjXuFw/5s+plxyZ253jy8brNP0Q79nv2bFCC/d
	Z/QCnfbizcP9EY1Dpee/FiVZIHNuYEU4SzSrs0qQuS7qfgVWb7/HbPyXQoaySl9y8Qi5qExeGLi
	fx3yPlEgobcJWVIhCllkoYsapq/wXNzY=
X-Gm-Gg: Acq92OHTkKBeFcCn3DZTg9ANk6z9dFJKWG1lLe3xt8G1s6H5UDNDLIafdpeTds5pWfH
	ZbiFbXgsaCTHM3gSyA3VZoWB+INypkuk1Nc9GwHxBQgad+wYmMMy7bhIZb0SN57pr01BpErJSuc
	nMsRQwX7rhVZvsdGTNBXFzfPD6fknh7SIPQZ7/GnuiMRuRYBb36rLRuXj2By6QR+WYXe8nsbTbO
	8HK7xYJ1jCEvjXhL/eJCZGLdo4wVSo5dflad9WuE3dsUsvUXR6dD+6YKxV3BjHrZyy06azm/mS4
	oEPSze65e/b3SwOkecnGGew5tkPN2+rMpfprbDbekNx7VUOLrU4lgL38Hw8DasmqmgFhAeITiin
	TnsMMX4tsPB3dogoHvCQLKNQTJTAtV7MvwbUzO786RCgZbpw5DOVXPmw8omBeeMyN2mo3kTafvq
	yBNXhmt3FDqZpr7R53
X-Received: by 2002:a05:600c:3e0d:b0:490:b65f:8b1 with SMTP id
 5b1f17b1804b1-490c25603e4mr249321315e9.5.1780901156899; Sun, 07 Jun 2026
 23:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607183542.368184-1-jakubszczudlo40@gmail.com> <20260607183542.368184-3-jakubszczudlo40@gmail.com>
In-Reply-To: <20260607183542.368184-3-jakubszczudlo40@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 8 Jun 2026 08:45:46 +0200
X-Gm-Features: AVVi8Ccuuj_JhJpPWBLSUn2XjCtQzdApf74id6ladR7XTQfxeMPo7J2JOTt0IHY
Message-ID: <CALoEA-yj3hMKRa-3OpKtHKswRjddkARSBs9AnfiLNOtPiygPyw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: Update Kconfig description for TI_ADS1100
To: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt@analog.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mike.looijmans@topic.nl, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jorge.marques@analog.com, 
	antoniu.miclaus@analog.com, mazziesaccount@gmail.com, 
	jishnu.prakash@oss.qualcomm.com, duje@dujemihanovic.xyz, wens@kernel.org, 
	sakari.ailus@linux.intel.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jun 2026 at 20:38, Jakub Szczudlo <jakubszczudlo40@gmail.com> wrote:
>
> From: jszczudlo <jakubszczudlo40@gmail.com>
>
> Add mention of ads1110 in Kconfig for TI_ADS1100
>
> Signed-off-by: jszczudlo <jakubszczudlo40@gmail.com>

Better to fold this change into the patch that adds the actual driver code,
otherwise this is unnecessary churn.

-- 
Kind regards

CJD
