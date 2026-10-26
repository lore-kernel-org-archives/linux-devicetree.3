Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025614;
	b=jeKd+kRKa39lIgoagVQ9OT98/WG+eIaH6vGl1P6TdGSeYidJRpcFN2cVX++0uxyKRYlG
	 kUldzz2kP39fF/0YpObENiAcKu5OUfM1O6OFa6rhAoGcSNKGd5IAKLIMyMkLZL4ukGdfv
	 i9TkAHUxcYzyVtlIlikfQicC3JFvW3VQ1u4DVBVRkIwIWr5014+/WA2Xn6mj+FlnNLFlj
	 GsQy+ua3UXbynn+/kWZOdImBHDEkwQET4FJMHadABiubaXvnFfbG77oGI3jhbIYKSbXH1
	 uWF0jIkHhgPLNa58w4OKMlyV/kdZsTAkUykETbJFcjknS4rQmoothAo3nEAnDa8yUGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
	b=QF19Mpx/QAEZZBYR0B3PuadxkLdaQaRRSTjsewlW9bndCG79V5nRissb/in2TYat3aTW
	 NGlOrJDVS4uSTwtvlCwzTE2GeDcFN+XeXQM6lJbVmjGjXIiDURbMhASRHCeXn4TAqleDZ
	 ym1VbmefJ89jKP/iTR0MRpxW549hUe/YCCw0BYRElY9VvEH1j7yla47b//mwj13E47bqu
	 tbOrOPf9lg7yyr4eQRTcWo/ib2d86Wvh3M4fZtJo4wtzrJ25HRHwgNI52hJtufJZIQEdp
	 TRCBjgYOcHcYIfvlnIDKR/465WSLT62wHWOvLHyT/YkNhjk48h+ShbtGS8ec5qoINGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AnBU3FC/";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7A606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AnBU3FC/
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987b4a710so20177575ad.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025613; x=1793630413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
        b=AnBU3FC/k9/7NJPQaCbz+jpM4h9DbPEzea+pAhsWWMEqU7at8UDWkFlWrJGLeXEFIe
         jEJ3nTIQghMOvFuiH34NiTVKliL6GYYD6lB71lOYvesKdRjuTv/cd9RpIr4DXvxfCbcz
         e/IIdiBdO4cyN3u0Gohp/avUemciBsVq3s28wWFWjTJ7xtqO5OKf6sTdHYxIvFO2jdtg
         nqWdCRAX89Ll74HR+pGAgGrnepeIqx5rMuc/rf9PM2A5X0RScXPrHvJbe8quGTHaHxYH
         A51ep3anRYIWMswa81ank8FGaaE42stZW63XTaOCqCWBnQFvHNlQNx1RyvP/DyvFM/a1
         Qa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025613; x=1793630413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
        b=YdszMDSQpILWcKWJNaQIMmC/L/HqLkd6eVYCpv6CFeFmhE76pG4TQa4EByoafi61/H
         Wj7z6MUUwg1n5LAH0tt7mXEm7BJyYB+SGwfjVz/GfR04InMLQ/TUL3P7wQc/H+VAb3Rc
         SJJS86VxRlvrBgZuoOa/akAhnK1LgU09DlJMdDyRw317KyOE9eABGqLhIrKymGKpCUvL
         wtZQV0DSiNVus4Z24ORtan4b9fakx3iMeclz8GarFXVyXqwelnBTgQxnSQ++n4XCisQR
         ucuSw/POu91GaCmSFX5jbKHkei33nXBwnpQ9p+XVoYAjrD1OVc7F/ObnZJ0de8Aoj4JF
         edwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3u8d0wRQqGC0FhiCSfP9P90OMd+NZWm/TCZ18eRg3KKMwx6WT5ICXdWiw4MW8+EU7lJcoYWye6aWH@vger.kernel.org
X-Gm-Message-State: AFq9FYJUWVU4fLQVeeiqUpsgoWhoLbHilX/Lp2EVu8oLSjq1IkYfSpYM
	8XXe1YJ5AeVLV5ffFgrvjX9+71mquz66kYd6JkxutflxX5w5pVI9fDEq
X-Gm-Gg: AYBFou0xfuB0CgS6cus3rvQwcHwE9u3s+R79pa03VVKebditiCrm6LwCx/0ErrJW/+D
	bgQsdHMsxCTWfSIigHdfcCvw6/gtd4MYTfXZZviIC5/HYaQ5ik2PEPtVUcFuhwCf77ts/8gFQzT
	U+8LiXkEos+e1+wP+wNSDuW43KlyVO0CRnGgfYDeW0XGql3rQz+84MxE64Wg+vJj9P85T/25Op9
	X9wK/IBhCKDtu94wLcWDEJfsUHVzUACkRRk211+HH1yLluViWwrZbwblIQQnlNx00oLKNjI0zF8
	AXIdOCuXy122QF9iCaiUvlzYfjX1ZGjttl8j7B9SOATaxnoQ577rFErMJMqtYcsIf9P88xGd9RM
	VimziiUMM+5ODw3uCZDhH7fXimojBEzwtWemilKn3bOl3Ga/ftEUAkq/RtzbaVWrL7nvlrUDqlK
	dID8oQnLv53fN3+esHaJwhqNKnlIonC7dUbGm6KnX64f5f0zYS2uOJQAsKBNCVVlFbjrr7Wc4sz
	2xY7s4CS7RwEYaf4V9ixE+xNz84G0TRA/JBmWYcidBehtibzOMK3w8Lt8zv8U77Km+uNw==
X-Received: by 2002:a17:903:3204:b0:2df:b004:df28 with SMTP id d9443c01a7336-2ea9cc685bcmr40841475ad.35.1793025613080;
        Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121651sm18814625ad.18.2026.10.26.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:40:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 07:40:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Message-ID: <3a279e6f-5c51-4786-a322-2c56667faff2@roeck-us.net>
References: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>

On Thu, Oct 01, 2026 at 11:58:14PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit 032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER") the
> driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for its temperature channel and the
> device can be referenced as a thermal sensor.
> 
> The chip has a single temperature channel, registered as sensor 0, so
> no cell is needed.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied, and queued for v7.5.

Guenter
