Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454432;
	b=ZUisobHvPeD6STnwZdXubb810vjOokMTUDqLOW5Krf8tPezHMm2NDxk0T/kS3R0mKTJE
	 gQHWOSuGvrhR52nHMSafXYoEFaUKosQB0QOYXacl/vw4Lb6GWzRcHV5vhTkdApIoeebBh
	 xRnDZ+jMJ+aoj5MdhFE6memMW8eid6b3Y/VfPBm5kz1iBAhf3FUV7vYY2NnJVTCyGRegU
	 UguEfN+tkMeZtR/+izOnYX7l6TRvPD1alQaDN+K6MxGmHEZl3cBVDQYvY8zMWFaELtwDC
	 zzpo5SI4vrC6/8LLtc5H5KvX1i3DEhmHlPgoFRwUfNrij6Y4wE3VcIBGWJHiHe8VvAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kOEW7S9rMOKRcbBBo1xEhhJSd5nf3JnZXymk/xgXKU4=;
	b=j6feh0GxqJrD/oaaFW2AMW0ighh8SPk8hUfnxOlNntnntQ1PY5WnHdlG9YFCqZNrLH9g
	 HmVspoe2S6szxeK2vucQ19+A3B+wtwESRD/OYnJR5TarBguGlQKbrf1YAq5WXAkhQDjhx
	 zF5xI+xRHIQgLqz0e66Rg2mSFt4z75hcM8mrqatINrD3bLRXb1izuq2MyaDsXoBkzEh4J
	 o+YJERhjQrpq9uequD/cSr9DzSF1nz79zlo0PBD/qRXog9EIJEq6fbzZpZYxdBKRIceWy
	 ARn2HtEFfLbdeS3382fJXeWtxxqZ1Tf1W8FWl0Xjy3B5Q0+HOLQnHTvPBsBe5xFtsvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCmOf8BC;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C0606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCmOf8BC
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so4530317eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 17:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792454431; x=1793059231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOEW7S9rMOKRcbBBo1xEhhJSd5nf3JnZXymk/xgXKU4=;
        b=SCmOf8BCqz1c78pw3ObHcpI6bBn3M/Of4yKhXYkhXq98ab4cFiCh499HcxncWxO2zI
         49ZrOKmdCfuWkwFoP376ZIzcgSVEtxeH3voW98E47ZAs544fDDQpRChC5xn1cofnD1qm
         feAiXoIiZTBcDOagr9ACtyGvkBfkq+NpnIVAJ7tKZkbQhduw3Ofnu/zZTW7x6awuw8Kw
         65dHNHyvTeI4yP6+NA2a2NRaaTJvZ2pHkf/919Mn+b4tT7cxceztYFUVyV7M7Ue6/lcw
         H9ZmqAE073s4ZBwNdkFbnpyvjMo1nl9DayGnAdvaKF4AEKCT7nj9ikJPJGVzjvk6PXwR
         vpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792454431; x=1793059231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOEW7S9rMOKRcbBBo1xEhhJSd5nf3JnZXymk/xgXKU4=;
        b=kj0Z5DXCNaMWq7w+nZVMrAzVhCAqTF7hX/Zj2FUHS/fV375OOC6CinOfcml2+F99CN
         EguqzLGLFjUlkJz/wDXowSlmrNRj7XpH88PmQUYvjtpPrdoyrjd8Ga52f0cw5dsXuP/Z
         GNG4hziJF//Z112CRTJbYAR7TBrBlS0Yv5s4NPOTy9dZzf0fvBBpUB/d++PFh5ezc4tp
         DNGsuSUReHyZl0zz+VaG7rOvLujG9sPOq7T7s7Nwqkwb+9VkC60ny+3dr2W8qIO9rkLB
         sXCoPoJWZVdswaPJqKgoZpCt1Rsj//gvGVBeyuLoC94mdVRqn80jcZfjF27Y6RU8Xe9u
         3DPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7JV/su/cUh16nUTLayyxJHgUD+4i7jRrGdKw/rdHTtgFAn6UsWahYIi1vc052l9whZWOAstXgeziZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJSvmBsu4mp37dFn4B0x9c1zicF04g/L7ebExtTM5qx2EpjW6AC
	a8g6LSqu8y9gJhCeawtFnwaGmQJJrDA7uGxRKF97ftoQ5II29WzWmiYE
X-Gm-Gg: AYBFou0cH1my+bfS3xZunrsG0LL0ywTDBdzHD96ThieeC3ivi7oViWLCT+Yotp+0Vz4
	gJyueHazwAsMi6fa/lnVLKrV1E8Wgu8XKz+7jakv2QLucVDHrTRyHK/kxlPszXASpfBDJbzdCNk
	4XEXCVCcEO8ebKKFBZwGtqJG0JMQNPJBqM+3Aj0GY4KYxtRPaHlNTzf7vvJMPiOsy2beMxp1hmi
	erctKEsNBSFq3hGhaAbXR984P7vN95PH60VbyJyU8h8rLeuOuaZu4ossMxXasG7MMGLrLTkOI5+
	ZtHQzyMk617OSdtv9ImLbdImvcuJ941QWQ+gnhQWdduAPLi03E2iJ8uoFNXLqlzPGWLmaDDeUH+
	xa0LvWLoN0CtjKwEundeLKSMdq6w3/dDmn5MWtrUzyFbqAN+8zg3XXj++Jx3Lq7unGMVtSYKTDo
	A9/V7zbgdXoq/K8IKsvLLJt8kUEAwKXaNvNTgn6i6JHHNBm9Zvhw4aijeWfsKK4tX5dkcyihttb
	KgjGkPx+fStPuA5o8aCQIE=
X-Received: by 2002:a05:7301:6497:b0:35d:8c39:b2fd with SMTP id 5a478bee46e88-3619f1fe992mr13331411eec.1.1792454431316;
        Mon, 19 Oct 2026 17:00:31 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:dfce:4d9d:7f44:24e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm37371921eec.21.2026.10.19.17.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:00:30 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
Date: Mon, 19 Oct 2026 20:59:56 -0300
Message-ID: <20261020000017.14331-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXAQXmGEeGdJMZQ@monoceros>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com> <20261019001247.483005-3-stephanbrrs8@gmail.com> <atXAQXmGEeGdJMZQ@monoceros>
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

On Mon, Oct 19, 2026 at 09:03:24AM +0200, Uwe Kleine-König wrote:
> <linux/spi/spi.h> provides both of_device_id and spi_device_id. So there
> is no need to also include <linux/mod_devicetable.h>. The latter pulls
> in a lot of useless dependencies, so there is actually some harm in
> using it.

Thanks, I'll drop it in v2.

Stephan
