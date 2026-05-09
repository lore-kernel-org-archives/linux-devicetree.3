Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B636B05E
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778364425; cv=none; b=MBvfuhsTKbbXHD5YGg9ZlXVSale2q7/W6QugTadzlCoicghBkHFOYzQIrLk4cxE/w6+4iJBR+KR/Kotgexm7oJLxCROOYbFCaYGvjm+zUWbnLsmgZHBvkQOmb0KjHMfrjqdiJrPKSlvWSdubJk5rVS9G/IL2qPUHHXmRmfeN9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778364425; c=relaxed/simple;
	bh=xYyxxtDlsONFPs1wxs7WBi3U24/H7vuYm+AFdU2VYCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNBByaDKpu9ltcn6gw7NGhK6vMJ81wVOwtUCpauL5UIFnjYdV1chTAaSgzLyy55IOztTc3xzdMbWHeF1DI0yaESJAGBS5v1USpPvCIcto/awwjm4sFsWDjvrG1ssDl5roH6N7Fx/L5XPCJX707pdzShB1egPEp9T+5IjGC3qOjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=q+OMnOdy; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="q+OMnOdy"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbec19732eso2784422a34.3
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778364421; x=1778969221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bCT3ubr3H1wQ17zOsYqif8TnMtNy7ycioefPRWsFsA=;
        b=q+OMnOdyPAPrBpb+UHQN3e3avpyFE3nhiRY9VDxIEMskImjj6KSCSEoCvTgDKU/vm1
         h0p79/MsnNp2dxGDmOzIz9dZ5c3cZRD/97dxfNmWfviJyY4HQFinOGLyw1Gx8W0s/t9+
         uWJPJEuPAN7zsYBPzGe7cQ+ttUh9wJwhVKlgLTlETbHE/U1eFOpR773izdR4KSK1hYFP
         Rf6QgFSU7O/xzSGaVvH+sXQ42jxTTH85rv9+9PvPzOv6YZie/jzMOwlc+pm8l0xPT/Io
         9IKKhjj4f/n3mHlJ6uXkdjbNXgmCjBBsvfvOE6nideaWYlvqERts99800vx/yYy5evWQ
         Ignw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778364421; x=1778969221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bCT3ubr3H1wQ17zOsYqif8TnMtNy7ycioefPRWsFsA=;
        b=rMbKKCvj+ORZPBmmwP+dRuLRfflhhS7/8xFN2Nyd67TE1bftdanuhUidhxXkDwK7ox
         Dfqsm4rDEr+a5vC0lagd07yrvJMkkG90HXWQ34LGPp7bNsEaVmHongJPfKTFIn5w5PBQ
         ZrJy2M0XyMdSZkTv890EdOTDp+3qp/iY8z34faAes/vxSNlcL9eIc1CGg8XNvS6ccQti
         QCMquDXB8AFDhUaTKw6qs4maRFl5THXXMezw+3t4ADphyWIVI8v3Nkcbv6jIVpVaxco9
         lWKwJhFHjUhasiiJCnHMj6aoXNaF01f/my7auhPZWHlbqEYx5kV1VyIxXI4ReuJ3Wcyp
         4xbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qBiSuGyj6ILmRCjBltQGguDsmB8bpV86eIMaoRhCdEQrf7KEAh8JBZGuaQrB0V0QnjU0NcnkTtEHg@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtzbu+FztiCLj1Hofb6YLX4DDU2U9NoIFuBq5BmeI9AnUUsVC
	QkmwVPKgEgu6Dan3b7X3S8LEcED1y5Rtb4WQwzqMvgBADJfil3RIW2OA3icsw0iNxNs=
X-Gm-Gg: Acq92OF42oVGIQj4/6zg6cKgtzPvzngw6le7AG15FDJk72Umj1/GkcefXGdveSJCs8k
	/4ItWTDLLTsnlg0cen9kDtMRW8ZMsL1YVYeIsGa7qGj/Uvz9VrlSrdH43XajbxVg9cHpOahpC2V
	y7HfArIbwHGYSNE+EI/Ps5fswTbw6ByXM4C4kb9vAeWYqjjAqNvSiSddMf55n2uL4SPNzBJsDIh
	HOBxb2XTEqc5shdzl7FPFlBOd/bYyS+cGodUQArB7gu3eOMSMBYyt8tm4efCYjy9SHsWrSi+s7j
	ymYfuyt/+pqZNPjJo4rDhJzcQrWla0mxoNqGyAP+cLiqwQbufkhCk58uEoQ0DvvDItBnCP2l09M
	vrdyfNommthGalk+DG3pebIgblRaYpX5pZg0fDx2/lqYFY+MqIUHNTgLPQdhrFFrLEW2U1+ke7c
	o4TqIaUuo47kzkUgWYsRJMHRwPVpu7SaybA0sC+EJqhM9iXZhE7wfeZant0cm2gPKt3HiOLlc=
X-Received: by 2002:a05:6820:1987:b0:694:9fa0:aa4a with SMTP id 006d021491bc7-69998d31d1emr10956693eaf.44.1778364421638;
        Sat, 09 May 2026 15:07:01 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:12a0:9178:ab4:39cc? ([2600:8803:e7e4:500:12a0:9178:ab4:39cc])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c9a23fsm3260297eaf.7.2026.05.09.15.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 15:07:00 -0700 (PDT)
Message-ID: <87e5f4e6-557d-4036-8e6a-8abceff58154@baylibre.com>
Date: Sat, 9 May 2026 17:06:58 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] iio: magnetometer: add MEMSIC MMC5983MA driver
To: Vladislav Kulikov <vlad.kulikov.c@gmail.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260507205033.951990-1-vlad.kulikov.c@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260507205033.951990-1-vlad.kulikov.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/26 3:50 PM, Vladislav Kulikov wrote:
> Add an IIO driver for the MEMSIC MMC5983MA 3-axis magnetometer over
> I2C. The driver provides raw magnetic field readings with
> per-measurement SET/RESET offset cancellation, giving 18-bit output
> with a full-scale range of +/-8 Gauss.
> 
I wish all new drivers looked this good. :-)

Reviewed-by: David Lechner <dlechner@baylibre.com>


