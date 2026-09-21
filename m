Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B04AA402
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006571; cv=none; b=NZ4MUe9NVWo/DyOPg4kVAe9GoOAX7+Lgbx+Qe7CpPjWItxr62zoynhmBN+08rL5uewuvQzjZJe1dbRXaaW4IOMEoBFKc258DA6EskBlemtV98l/aYqcbnoEsitRfvtl2XFRzoxk/IkBfzARiJKZhjCuqwlZzotws5ASMzxa7IZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006571; c=relaxed/simple;
	bh=Ryakvez2AuPrHsciT1nsS1VZjsANZaRlT0oLyFD9r08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NqpkjpNrXWqDomHLchl9pLlcEtFSi+bSL9PYnKRkZd3ZtBr5EC4x7/0nzMnYjkCTTGCCBaF5Epwoaa2qBGYZHRqACogsSAYC+mUYp9WNtVK+T3ZYKGMY0CbyStSDB3l/C2xPGsk2eNeWZP85lhg+VeNe2XsPkCuTbdX6nZovGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L7bllr18; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L7bllr18"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so3272076b3a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006569; x=1790611369; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKFRVCGIKTeJtMXkPmTO6NVYkX101OwB/yBvUY5h+ko=;
        b=L7bllr180MY+bK204YggwMGeo8DS4KcWI3LbqjGLDBRtpJ3HSzqmoR9SVVFL8BQoj6
         NfNNLx3sc0brurecgqfH+5PjSpl+ZEeKxl2cLBunbDgvZGX9CpqNxlgz1lpWIUMEa0gU
         xFhQI2l3AS0p47kpFmENPmycx+a6DhJeP3HzDGltZ8w9JkVOHIyTG/9gf/a3xDSjYdWm
         0EwX8hGTVEp27I99tF2Y8ms+eO7YIHqXJLju5P9wFI+oXcAThL6ZaiB4PRHiI/BBfIWX
         kicu0fA7urX19da4rUzJs2JIFh9Q+xaaEN2x1pIc9wnRfeXufZtmLrGuUGSuzQe4GYG9
         3U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006569; x=1790611369;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKFRVCGIKTeJtMXkPmTO6NVYkX101OwB/yBvUY5h+ko=;
        b=qq5lcVkBU0fShfauLqZ1kiL/17TDQyO5oX7dE0sNihM+DlMvB0Kl38Cy+F8H7SS1Qz
         WrHpfD9C5Sy2+tiptNCe629SAd0gra7BOuyMcjk/S1bAUc0fISrolHDZTaF1DS+9t4yv
         OwN7whQW3WJZwGmR5uhvOFnKbT8MUqmTIWEAqi8VtIq4XRvIu8FJzOxGrbBj+HBKXlMA
         QgstB3ri/Wi4rv1C+dhM4RQ6/jMO2X1bsXPP1FhcawIQpQIBeP9cMDO7042+MM6nGEdx
         9/rI/kPoRsVVT8HGgBbA3CNaytQ+GpULEAWRO1+nO3m5CnEPunOoXZFxw1067CAth7YB
         Qcqw==
X-Forwarded-Encrypted: i=1; AKwUvBw7PouDKi7gUCkFgCm9bpzUmfP6W7LRa31mkThl3El4xrKIyorStbTpFTkjgO/DAvP+D4JcS52C33ht@vger.kernel.org
X-Gm-Message-State: AFuF++k+CnAOK+6aobtCC+6BBr4UUbFlnMVPstqlPb0ofqHfBb/vcC11
	7RG4VmAnkTTDrvwxKNnSzO5z67UHc8ZRC4IeYCPFNpjV1ZDj9iW0jcDQkHbMht4sWzU=
X-Gm-Gg: AYBFou02kQy0W8lVqkCcGL0W+deXBsSY26ZnQUHaxizc3kw3u+2wWuWKNxZNtTu0fdP
	Dcq6m77Z/Ro0YrsZN2ryGoPnZ5g4oBcc92QyeAPCms+pGeI9QNFCVzQYe4tYsBDHbprswRSrPbB
	9HkTy12Is5hphl74klmn3QrqQh89VSjOhNMd1xZwQjVGBkjQbFQo/X0kWg8U9kNDxiiFZWbP1az
	K+fpjl+pZp7YlsR6h675udVgYBWJGQBIHQfXu5lcc72Rmdmve6wK63NRnCk6N6JEnJmQtK/YNqD
	pHSGy/3lu+BrfK/gqV9FI1tiQVTy8RbQKJ3egcxyj3PpvbaCq+LVGtH579JUNooSLsJybphTMoq
	yjNOEcW5e3idHWe4JLQButbDCt8eNuUDcav3vcuBydx2ZZIBX2vGn2FRJFmOy1CQZbH2dx8xSYM
	7/IxHL8giR0NYvu1649UuJaJ/ZxZoYKE1GyMCSrH4tzvd20x2nFI9UfGPw5Rt6MAVROU0=
X-Received: by 2002:a05:6a00:7702:b0:877:b053:2e10 with SMTP id d2e1a72fcca58-877b053372dmr8630049b3a.9.1790006568844;
        Mon, 21 Sep 2026 09:02:48 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877aa1099e5sm3480526b3a.49.2026.09.21.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:02:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones
 <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Kory Maincent
 (TI)" <kory.maincent@bootlin.com>
Subject: Re: [PATCH v6] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by
 increasing vdd_mpu voltage
In-Reply-To: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
References: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
Date: Mon, 21 Sep 2026 09:02:47 -0700
Message-ID: <7hwlsed23c.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Kory Maincent (TI.com)" <kory.maincent@bootlin.com> writes:

> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> which prevented the CPU from reaching the 1GHz operating point. This
> limitation was put in place because voltage changes were not working
> correctly, causing the board to stall when attempting higher frequencies.
>
> With the recent TPS65219 PMIC driver fixes that properly implement the
> LOCK register handling, voltage transitions now work reliably. Increase
> the maximum voltage to 1.3515V to allow the full 1GHz OPP to be used.
>
> Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
> ---
> I was pinged that the following series was not fully merged: the devicetree
> change did not land upstream.
> https://lore.kernel.org/r/20251218-fix_tps65219-v5-0-8bb511417f3a@bootlin.com

Thanks for the reminder.  Queuing for v7.4.

Kevin
