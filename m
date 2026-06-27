Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7C30F806
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782585014; cv=none; b=nltebDxmq6L1IDYvtZQ+RVT/ViEnHL1K/kRSSXvGYw5x6hLGAB7bHcUWsfkXFtjxWizj5I2xLUPLp8DQNhn8vWCSRS/zOeiAttTEBXQLWSOg6mSxIDHaFJAYxebQLGADSdyf8AtcmJGoWy6uo+4LYY5O4ww3TeagPuQYzB8rJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782585014; c=relaxed/simple;
	bh=pC8fa4X+KpaN8K12A60eHy8/3aNwxEawC4NV5EKQasE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lc5xFZBVrRVUXN0s+ALQOyB26N6IlmPscNpVV/gU87FYRwDQODu/kGqBOeg21q81Sw4qVCzXpx31qmhJ0rAshTH+6DgUDEFOCyV80XalM7o4FaB22lyaPgqt1fczIrVg4jRTP34C+su93uGEDBDjOZBJc8s895yjRhDZbF6Wibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BXDLkK27; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BXDLkK27"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e94c26f9e0so905566a34.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782585012; x=1783189812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwOhfje936cydMDnrwerRTqSDQiNMF3yBn9vwrjGE2I=;
        b=BXDLkK27ip3mhkfvOrg0LB/S+puU+Q/Rw9XCsakriOOqwOVP/wftQ6McILZj0Egpcv
         inxj50Sgkl4T51ENM40gsE/Tdp4KNq2fsEJO6pPX/KoMI+/CwtiE2ocJGA9THfJNrpAI
         d8BHi9dK60Uj29A7lVO+BauEcolebKTCAl5WH65dVcnz/AhGAGgWGGo6bOouW3qofYxa
         IFtS3Ot8EKREZQzi84a7kGqdxFp9Wirg37oWA4u+p8lvJDv3WHWba2CunFa3q9qX2P6f
         24daYbjq9PPsemWAQRTMbJHD3zWKTGRaQn0zoYa+eUJBql5cm4mcCVqdMSCKGedKjE2N
         gB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782585012; x=1783189812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwOhfje936cydMDnrwerRTqSDQiNMF3yBn9vwrjGE2I=;
        b=Xr8lvC+fvE+tpMrnX/EwOo/QDWyQsfbaJ1cHlrYvaO6VtGYHkFsz7+1ra98tYnwNwF
         Tq2XgA/l+L2U2ve8r9EJvDHA07SQTJZw1No342y8s3g2Fc9m33h8gEyn+7VfC/m/BwUo
         9yuo8Z+ey9nu9ql39QW74CkMqfMwb4ZYXwxgI5ataTbi73C38oG9cEApDdZEXK/K51oI
         iZ2IkdQf6j5HWt8x+LyuozhVLncVnzb/UBChz48mWbzGlK/zgfxBJJ5qqOslFWhUd2FX
         m+t2PSpp7+S4K/9nEacZ9isjZ5eecGWrBr3KxxjcmHfSTuUcfmJczsFvYVWGz321q7Za
         hdnA==
X-Forwarded-Encrypted: i=1; AFNElJ9sMr11gZVOZRcwJT/A+RFpy8A0s8ANdy7I08WJOv4VCBSQwtoImTVc7pkC0G/DXsvUXPBIORa8rWs5@vger.kernel.org
X-Gm-Message-State: AOJu0YzN25L57rFtuRU6JV4xuS8AZXcDHawe+D8nUcJ/KfCXrLHGvoxH
	AXZOf+e5bDWzKi0KzegDImTLqGc2GL8QDsQB265oe/UI+aqqgnDEyKuUjeiTYBuJeKw=
X-Gm-Gg: AfdE7cmoWXxyF/XlK/iUxt844gz4kRVNB6pBiMJzFVeXM5RdgWi4Fr2y8zJqA1msh7b
	VIOB+egxQkTef6o6v9gPA4UPcn/voNy89FeIr202j+1v/r2vnYRAp6pYtKstFIGCHNd2F8f50iI
	wV7RkpHw4iERr1VhOPTFI7za7Yv6ouoUPI55tmtl7XbFU5IxoTMv9rqZ7fEX0oXhT9qmgq4jlOK
	WoOwhwDcCLbX7YB1sI0mnCWoatFkm0YE+Ca/E4qSGTc7uUs0U6v1qbPhvYO0oUx4NkBQwnWJJkb
	1VEQDYdUkJoK13Ca4lCPzS065hSkKk+yuHeEUclPHbuFUAw/Bd5lqmWTsiQ3OBgx3NhTgMpDI87
	PRt4g6vVGda3+YDV0XqbXQwK6y7iAA0e+giYqhFC/X2MLFIECiz528PpcLHPnfpAe0Ef3MwK7qt
	9iHGfVlhVLXSLHgeeeie84mjDKuErfvBKFCm5iY6GWoZen9/SEeSnbnUwj3qr7qp4=
X-Received: by 2002:a05:6830:4119:b0:7e6:e0ab:416c with SMTP id 46e09a7af769-7e99c19229dmr10659662a34.16.1782585012056;
        Sat, 27 Jun 2026 11:30:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:47b8:1bb2:ed26:1150? ([2600:8803:e7e4:500:47b8:1bb2:ed26:1150])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d4a4bsm4618913a34.10.2026.06.27.11.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 11:30:11 -0700 (PDT)
Message-ID: <7dd221e7-07de-4922-a2fd-87a865558a87@baylibre.com>
Date: Sat, 27 Jun 2026 13:30:10 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] iio: magnetometer: add support for Melexis
 MLX90393
To: Nikhil Gautam <nikhilgtr@gmail.com>, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 u.kleine-koenig@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260627005843.7786-1-nikhilgtr@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260627005843.7786-1-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/26 7:58 PM, Nikhil Gautam wrote:
> Subject: [PATCH v3 0/2] iio: magnetometer: add support for Melexis MLX90393
> 
It is best not to manually edit the emails before sending. Somehow the
subject ended up in the email body.
