Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BC43DA27
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746742; cv=none; b=t35fNrzGawnsr4sf1Kx3ii6MS0i0xGd462/zQN1doEvHTnOHnNdlYUsIW/VcdvA8hRrV7ehyDh1jI4eUEhJIlcBS0xVhwjIUo7B3iiZlSI+jX8CU1CPMyYHip+iyy4gWfM8Ht3m0Zb2o0z3myVa13ZB5udiS0fae2unYdnL6q+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746742; c=relaxed/simple;
	bh=bMEqNXZ9mHubK+aM6jy3pBJZxkKeyMW8AyvCDDB+Lrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7+tJgRl8bUaeYyOaZS4dtzeLeC/lb89h34raCpgt/zLdUTXBu52eQkoZxfTa/fMc/2FRjViW1qNWhfb8qKG/A9eeINRD2P5A5ctBkP5GO5fkMd6koAFY89O718O4rNHmYGTVhWc0OksMMNNbAXsww+3zOboHOJxtkiwbKnD8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mJaLXTBL; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mJaLXTBL"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-447bb8bb754so2550081fac.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782746740; x=1783351540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaJaAgaoRCLCjD+AlsRhR9FrqAL4y+0Revc/YO4kdQc=;
        b=mJaLXTBLa1qxGRMHQu77viTO4XIUoCRPMKffn6Frhl+5jxJuXvfhWmKOKLWFtpX3Pq
         6X5ukd4WrfEay3JhK5jUJ9HkVhQ2QrBsnXW3BgscFG95s5xJJgcswBGiJxFiZG8iphwy
         miNpmJs3NhOy8nYPpfH+YJ+MKLXGomTyMRfd1ihBvymSHnOTLbunt/Q6iUpgmw7ZTDoq
         vpjseUl3AKApgG1Gm77XvO+Q0vos+Vi/M1fir6bwwlNRBimriXLFJ9eGIkbJhayPIs7E
         rVo22cdcFtJLWF39Qo1T7JWSlgqA7XTQ7GNaNAavYX5pztGqX+zi4rrG6ek+MEzcrsjX
         k6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746740; x=1783351540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaJaAgaoRCLCjD+AlsRhR9FrqAL4y+0Revc/YO4kdQc=;
        b=gfHvxs0q00f1iBfmfWWMROJKNHX7K7uq0RJtTb8AL61pLG0olmZPG7xmla9YcN27RH
         7NG44EYUVlUkhcgpg+afL6PxXHFbSUUKvEMTrb7F46RwWDx7UKiDsePbgISaTZrpwz9/
         5CXw5fXzhEv78O7t1UbJUrdlqztaXAtwpfHA0P+E6kw+zvs04OvsEVTr0/jvnaf7UwYb
         IIm8k4R91qvQfn78hPeVcxIgN7+HnlGyujhSL13BCBdppzute3W/cAVmGxdrCllzgrmf
         JwICgIeUxd2IxPV0h6rJyqOjM0hCEIiMUc37/A6I5yVTvFKnTLXMK0MgdUzU+h4fqYQ8
         +Dpw==
X-Forwarded-Encrypted: i=1; AHgh+RrTLmuiyioBcxoJsISzn3pqzlNUscbzWcnCU2ZtkMfndwOoEwwQrpzIUKTLnBtWPWMEqq9Q64ptzvrN@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsdhLmiSIx5FCsvngTZAjGt6fJ3Qi1xBS8c4Ks06cpE9eZH9f
	QLPMqrFkBWkJpQz8pFM1/hsC6igGYTBzZMuccRHHaLhs2LL5MrHY3eVa0peOJoI7s04=
X-Gm-Gg: AfdE7ck9vRTRUK3WgN+TAJ/oH9H5EubBN7AB698TcFRJWeAKbn46VPrTHRYFzxDOP6v
	a5DEOezUGj1q6z4Djr3Q3cfhzLq7HsSFSWbWqOYe8LkBIRRk0JIbUiYNACz7hIwhonwvsmKyzJh
	s5yR8flYVwERM7sD1Jdo2gK6XZvyuHe/Tr439Gne6l6iFcZ1IY7jarZ8jWU/yEgAVRUMSM86dQC
	X4Z1OmFPC8R03q1Viqshf6eQ65nd6iqyHwgcSraz2UC5zFThTR2afhPmHuZLVgZv8LiUUI9+Wmp
	rJBKpnT8iNtf0DYnAkXOtztftvAkbrxJjaaVpltel7uvmejGA5CA1EseTkT06bekvYMaVL59REH
	53+sPJROpUY98o1TuKWgyBABLtHfPTVkcMOmbV3LzabjQHECYsPe8JAXuBuvOkklWL2fjdLxl9+
	xjcI5Re8w6FTcO0aRqPK3+yI7tN6i7jHlIdjYIY9FPiAm7Lnt/nqc3DpbFCkgKwSY=
X-Received: by 2002:a05:6870:9693:b0:448:6e54:4819 with SMTP id 586e51a60fabf-4486e544f3emr4992977fac.16.1782746739826;
        Mon, 29 Jun 2026 08:25:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbb2302csm70720fac.7.2026.06.29.08.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:25:39 -0700 (PDT)
Message-ID: <9b179166-3057-4867-be04-b071a809f70f@baylibre.com>
Date: Mon, 29 Jun 2026 10:25:38 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/5] iio: add Open Sensor Fusion IIO driver
To: Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260628191337.937-1-kimjinseob88@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260628191337.937-1-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/26 2:13 PM, Jinseob Kim wrote:
> Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
> for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
> parses OSF frames and creates IIO devices at runtime from capability
> reports provided by the device firmware.
> 
> When the corresponding capabilities are reported, the driver exposes
> accelerometer, gyroscope, magnetometer, and temperature data as IIO
> devices named osf-accel, osf-gyro, osf-magn, and osf-temp.
> 
> This remains RFC while the binding, protocol subset, runtime discovery
> model, and driver-facing ABI are reviewed.

If you are just looking for review and don't have specific questions,
then it is time to drop the RFC.

