Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570848;
	b=Nj0jQCivklA5CfKIZmaauVsxwJbC6I8hQ9R8bHbAW32XZKlTdC8KG5n/2RgJk6qtYdBg
	 XCL69AjKpQru88eu63SmyaBT14LjY1Ygg/D3v2jG4qlqFxuk/Pg/dWWFreUbYX6h8RrYW
	 j/Svh6VOwWz4TtdWiQ3RWcdgPcFLrPcLzjhjimoSTFJ+YFccdLtzZAlGWGYKjjht5kV4t
	 baNl59V2wImQHhB9FhnZVV5ZVI2oh9kmO2ZH84rLJ21xkgcGLSuHwsH2SG5o1LKhSOaoO
	 cgP+9v7AOicOv/KFQBTGGIbE0jYlgRWcrzL2lh5fnEZzwM0IusQoqJjZr6ZLfCD1RTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
	b=nKviTKMdu82VGmfNOCWFovevz1q0Q5YJuB/FTfVcFyNUfVjFpMc/4zdyO8dmX9A7ybrZ
	 VovQCMIe6YHfyd4rTa7nu2g2MUKC5o5dnVpjWWFyP230wUacbre3vCV/ckVab0MtwT5rx
	 oPIYFQ/XiqHscxtT/lo5gJaQim1oz8Nzl2HvMfJ+KU9ina7sUaNwwyDgHQYGjviYd/+ib
	 PMHUBAw9dvcaZ5XRphUYThEyhFC8CN67jEBbr4FyUYTwRKtPdWdSEOy7fcQQ8VdEZyrXu
	 AsH8JWKclAbz+8vOTkr1csNlw8URrfXUvvtxLz/szMWBfl/qp7VIC9zJs36KJArzl7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKLVcUCW;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB3606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FB3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKLVcUCW
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so1758108a91.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795570848; x=1796175648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
        b=aKLVcUCWjaGLEkL7rE62+5x2NfqZS8rT3GrXE1OUuvzR1jZo08MDOJR+8g7o05HVVv
         BPS1pp+bDADkiU6vd90PrPz0d8dlGkasYu+Li/MHmAmtoIIwkGKfIf0fYOHnFZFEPMx7
         jh9rKU3tyg4MXVP1vd/WfX+vAaYthqeW0uPPFBMrCsoIylEi9WHbFVx/KgAM9ksOCs2g
         Uc9VMXtYMqqrUSM7cO6VY0Ny6z9WH9fyAfVJO4ZCY3egMNBChA0EEwZKwbKUaAnJ919E
         9AL9yCJWYjp33eRSEFPeNmvGf+Dhy5/3IlJ9zIaGNz/tj4G8aQQm3KY7TVxsUImztWbq
         7aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570848; x=1796175648;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
        b=NEyCepAPB2NUQ6hGQ3MfNMDdy0xS3OQdkikdroxMSR/VIZTz4KZE2gK+KuOIr4mSEL
         qecmJQm8Od6lBOGJYS+emH+SKz5oaErWANOXwXZEQ1tMtdRCyhw4occkmTHf9I0vNu2v
         Ulie1pHg/oDvbXtrKl7E1CgTNNqIXfhhcbge+xHPC4p24Aakms6wdIb5nDeqMlDjyvW3
         Di0WuVNOI0VxpUuEXl0ySG7rFnl+M0fkkfzZE/hRK5iAoU/u575VfzE6AfYB7N6JTaB4
         lK5dkIsIyQU5HBXtGJvRDOXq4vT6iW0c2WU7SE1QXLxcLq2BZBTIEDXpD2ibzxBvUBFX
         AdCw==
X-Forwarded-Encrypted: i=1; AL+hErE/CF+gtSYEfHhCMxfv086GWUazgzypzRPEeAA+ZLU+vg4+5ZTkOMiWeH9y3d/jDTRucc8z62xIDlfr@vger.kernel.org
X-Gm-Message-State: APuU4Z99NnBJ6LDGPl+fY9V1AWLFTNOKT5Hwk7yvC15oK7fMskS9iym1
	Wn1PxXOeMk4RMcp9aYLcp15S3W7u5RN5g8pkH1PxZXxKmVv2GTrT4VU3
X-Gm-Gg: AZFdTZeRrRI4F1ihi1CyWpeuG87fuQhv5mdOCZaq9ilJNHfmphOjLoDdqxXguq4rJDH
	Ycum6RQ+Ot9Nh9LVlwB2YyT+szrpYgP+pnT4cUs96V74i5mkkceocqJiAkpotBdHZqLW4Y1ZtSa
	M1LVbwDhUJSRU6A1vTJAl+dzXCuov2+HDYp83/ESvMjjZteqhEhEll/yNanNr9Ny4d3h/tm/d1R
	sGf8ZjhwOeZGYuqhUZ0EfdJipy1jtGqs+xim4vOnWkNULAOFd8wWB9gMak9jsYKaE8As39GZkDD
	wrYlrY+1Sa7vm8Psn24EWLn95gEAvxvyplpXMUNk+gbalbPDwFw55NLK8ggej3EsoaLrWtYt60q
	NAU8dVGMX+nvNupJSGctI3e+mn9zSIfmSzIXhJclgs9Rwle3p1XKziY/UfF9Dr2nu3hAwsu2FM2
	+2uOLKQU7l/20Q7wtjjSUnVIjO4jEXw7/xWVrpqK+e9LGjUk6PtLUf4X++nhm7kVSIz7mA/mYuJ
	+KfLCDXY6iTxqaRwS6h0s0bxf84VTFr5aBuyCuLuf02Q+ai5P0my3gGlSIgQ5nqD8+wlqzkHYCI
	MeF9i02S0Zhad8E6lq4VfUBGweLEyE5C5fHCPvAPKTMr+yZi1w7JNSf0WGQQXVLi0zs+dDWmwVo
	5VS7V
X-Received: by 2002:a17:90b:4acc:b0:3ad:ce34:f63c with SMTP id 98e67ed59e1d1-3b41c9e4b1amr15908819a91.30.1795570847756;
        Tue, 24 Nov 2026 17:40:47 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm8761791a91.5.2026.11.24.17.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 17:40:47 -0800 (PST)
Message-ID: <8c25cc7f-5c8f-4bb7-b82f-0f2d1933e334@gmail.com>
Date: Wed, 25 Nov 2026 09:40:43 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-3-cwweng.linux@gmail.com>
 <sashiko-outbox-218423@kernel.org>
Content-Language: en-US
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <sashiko-outbox-218423@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jonathan, Rob,

Following Jonathan's earlier comment and the Sashiko review about the 
internal VBAT channel, I'd like to clarify the intended IIO channel 
numbering.

The current driver only supports external channels 0-7. The internal 
VBAT input is not supported yet and does not require a DT child node.

Would it make sense to reserve IIO channel specifier 8 for VBAT in the 
binding, while keeping #io-channel-cells = <1>?

External channel specifiers 0-7 would continue to refer to the 
corresponding child node reg values. VBAT would use specifier 8 without 
a child node once driver support is added.

The current binding also requires at least one external channel child 
node, so a VBAT-only configuration would remain unsupported for now.

Would you prefer to document the reserved VBAT specifier in v6, or leave 
the binding unchanged until VBAT support is implemented?

Thanks,
Chi-Wen

