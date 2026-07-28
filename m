Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0968A3AFCF2
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237181; cv=none; b=XbtUBYIUVxJkvL+vZfcJNC/P+op1J4WpThRWZORcKSAl3ALd7CF9wqddTXpQ1FvFprJgp1Cj3stDWKvAN44FaAAS2K6zwu4LjlXQQH2ORbFwB501hLTLzyu/+xk6a+VJ3PijoQEwuaFLIVNA/EjeMU1nSxZJ3n8bIjEztVqOgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237181; c=relaxed/simple;
	bh=FcJab1d4wKaGbN1K5L45zRsnPXHEzhNKKaHhvSMpD+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UWkJ/CqErzLdQLxH7S0Ej3YFpkMWoWMH3YK344SngtM97x30FL0bwWbGgeeGL2b7ILNzR3uj2H23i0EDfPS19AVL1QkTOApkGtCGDaMWgVzOJvMMxeQrBZKKbv1HvzeiZR1QGcKmibFGuKOv/Vu9msaxg1MqkG/81XCtWOTESm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzvTGV2U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oPaH6jAI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzvTGV2U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oPaH6jAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785237179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bGJ4Tg+9r3wkBe/ueTnI9a7CbdUxzDkZ4FWsmLQCGUg=;
	b=hzvTGV2U6OGUgr259YlAdNfR5WAVZ/SyNmOt115sQ5e6W7QdIzoNfLQPSxmG7ySwBHmLFm
	5b9G5vcMBWWPnYS1ezJhVhS0SuuV21MRReR+1vWauv2gZ7gkFrPRDM1EZaL0pNm9W2SshW
	lJKoOudLkxtgZB1U3zU/8cA1tnxRDOM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-RBKVDDeLMAKCCFxGsWjnww-1; Tue, 28 Jul 2026 07:12:57 -0400
X-MC-Unique: RBKVDDeLMAKCCFxGsWjnww-1
X-Mimecast-MFC-AGG-ID: RBKVDDeLMAKCCFxGsWjnww_1785237176
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f7700ffdeso1507765f8f.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785237176; x=1785841976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGJ4Tg+9r3wkBe/ueTnI9a7CbdUxzDkZ4FWsmLQCGUg=;
        b=oPaH6jAIwNLNEtjenuiCD3nc/tZv3VsHe3ox0GHjmvj47cjy31RfdTg4qKuvf23ryi
         EYAU4ufqzJk5tRNbe4zk+PY7Id1uAcjwtS+DP34dJID0lFE45IKAOqk15BYp04UjSB/x
         mezhoOmDvpHK/eb37AyPcrZ17uWJn1blPYf1p1x70hT388jjiBuzrK5GzmtzvZncQ3vJ
         3FnEZ4UREK0YI1DNSiQusKZ1hDbNj2yHvvtdffdk5J9xbGmOcW4GHtb78p0fFe7MKQJF
         hlVJ7DBFxKO+IdvFXFL5uPJV0/9tWHS0XYODGvnyrZ9te5pRaMhTTH9q7LtFy0/fSnFv
         LC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237176; x=1785841976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bGJ4Tg+9r3wkBe/ueTnI9a7CbdUxzDkZ4FWsmLQCGUg=;
        b=b4LJAXYKvfSmTKmdR8huKjKbDdEbX9w597czDA38EB/vrNeQ/Y5r8Os1Ukt6rsCAWq
         4oYc0stl9h+Q3Y4xBLtXhgA6bJhD0pCGqIad/UKBsWhL6krxujJVBLj84d0JbmJs5CTu
         IrIXQc1Sann9zX9SD/+pzoQGfE0R6o6U1Q7RVSDzoKC1778DZC+oGG8bIAlB2cep0g49
         OiZhbUmrsbbxJ3If6OI1Gg+KOzx2Ox5P8/1zArMiaNgHUmb7a7Luy8zSj7yaQaMhw5hN
         J/x0RDVTN2PS6Up7xExkRkTSYzRBAxlTU80EX7OttixLtXIvyVgGWG1vB1Y2s8YJOEHf
         MnEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFkSgtLs2/X/C8Jb234Xo5JAiAXfZN/uQsjW5v5f/RIg0sUDIymk47q2xWDWFQURwOI0CyoBgml59x@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmMJxiv6j38jF+qvr15Bfxojp5SiR0Zc014LAaYhQ+yleAYNR
	yRFTBwg6+9Onaw17oSLqZ9hx9WrnlijlrUIScDWOE/7vzWrt6I27fhz8bAl/WW8Wl31OUMiRF8V
	r2TPtZky3xgRQT0cRHgSHb8V2SBY3Jl0oyapCiRXWADokOhvyK/tcYv63nUF43tw=
X-Gm-Gg: AR+sD12YxtSjF3biVhFdu9eqzvmvTn9mL+Gkbm6Xb0lDP0xt52FC023ezPh0MLFTBMO
	Nm87q2fGWZCESwmXxletURS19C/S/u5/M6wIT0mim6P9T1HbJVaiT4iLGGladnIG0P1izJPSs7x
	0CaYdKwZQu0eN2HlQDcX6b5Ld1oPqg1ivyKTqux7S4sqzmfz2oPOKlnv8Nja/MxcXuFvN/BVzdc
	asalw8Wlkh4ssLvWSCCH+iqG2PiPLunK9q6Kxez5rXZFbVkIOQDvOmzCrCnKiQvwfwKITZEyK8D
	042KguicAjs0MzoA2TKxdPWmtoPu1fgTCT6byxR/TTP7o9+IyB1+L5eVMl/TfiYf2d3ia6GQjh/
	lihgFD5KhmmSCRPLG1ZWkLDV1sDxS7HBL9pU490c87WlvttHrakgc0s00/TgIl6eByeeA3nkLE0
	5vgg==
X-Received: by 2002:a05:6000:2884:b0:47f:48d4:3f0a with SMTP id ffacd0b85a97d-47fb1edbff5mr2084117f8f.45.1785237176384;
        Tue, 28 Jul 2026 04:12:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2884:b0:47f:48d4:3f0a with SMTP id ffacd0b85a97d-47fb1edbff5mr2084084f8f.45.1785237175988;
        Tue, 28 Jul 2026 04:12:55 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5a46sm56864881f8f.9.2026.07.28.04.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:12:55 -0700 (PDT)
Message-ID: <1f22ab9b-7951-478e-9271-3d659e991ea5@redhat.com>
Date: Tue, 28 Jul 2026 13:12:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260721132936.1331318-1-niklas.soderlund+renesas@ragnatech.se>
 <20260721132936.1331318-4-niklas.soderlund+renesas@ragnatech.se>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260721132936.1331318-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/21/26 3:29 PM, Niklas Söderlund wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
This deserves an explicit ack from Geert, I think.

/P

