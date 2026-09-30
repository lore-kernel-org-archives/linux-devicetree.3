Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98153C3F56
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795225; cv=none; b=duXFq6DtpODUwpzJ/uGXTfffFIH6TvkpRanYn2aVjph17IrOUNGroLF3+Lkxabuf1M0MxvmaqhGX5OW9Kfi4z7xJUVer6anevtTafZqL61TQQLnpmYdjFDhkIttslPAlQoL8fWIhMYTHWUaY9aCh2/g2FhSCbTmRZa7PTuQwzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795225; c=relaxed/simple;
	bh=f6JSGPTTRlczwCRIa38h9sle7WFZiKUTSLRApuHUzSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP6FwdG0XZAgqnyQocBq9WaO/M6sHXbqndXCNr9SfB6amECJbZQUIFddbldBchfoQKkDiFoJGl9NtJLt/CmzfDWDY66MOh50EUOg2aXijskhWGEUQksttci8G4ESq80ID/Gw7Iz3lfwH/3rNJ7fcFUanQl94Nrx4QS9ntBuYXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6Cg7z7r; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6Cg7z7r"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so3519169f8f.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790795222; x=1791400022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCDOWVvvPjn4Zn7DxkNlW8KIDmqPC58h+Qgu1lcXnuQ=;
        b=a6Cg7z7rYOvaRONQPBufra77MsylkaHppxwpcka5OsZ9KCyfjQOmsk1eY6dHgG3EIq
         HH8LtLxy2ODmBnIiVebYm3zpNDZNMZZyI0TiGxSkDFWrTmzZk+wprTjEqoUyZ7Eob3qt
         7gUawi/MIiFUPAb8i2SmPI4XsBQ7JL2wRIFPcGqA/bHkHkvCeIoAzEBtbct5NBitGQ0q
         WLDym5GIXLWbWP+9tfMRJv/QRNtH+WMZgiimDZWY9Ayev+w3g7TzDCr2HK53xT/eiPDt
         1CjmBzGsJv/SMUH/+L1h2b7pGCuITCyIwOrDkXOnXXQECddPRUvA9tsTMDFqgps21P0Y
         Eveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795222; x=1791400022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCDOWVvvPjn4Zn7DxkNlW8KIDmqPC58h+Qgu1lcXnuQ=;
        b=jhlx+jrf8b+j7WBfHU7UodPmC2b0lLsXMkBSzb9aK/QHkn6Jz8Rcpiuaz9F6w4JwYK
         P7LdNLYwtUpgHmJckmsAwO8JGhFg+bOGUlIzYARzk4STHwxjtbAqdggKF0WYm0woyxzQ
         U+ikHKvPtohbfWKf0KDIeW1V0uEgwM7waDdEbmCz1UljBXMbcR8F5hE/+ImHLWtIWTPu
         8Ds0SxpThtEk5haTwdH9DCpSaNeccwyjkPZmZadHPFVA/76RZPu6GJj6+jWBbzvbB+fH
         t1o86g/V5R6/+uph8nzOWkWW8dBHq/OYAaEwHR0sPUUiz58EG1EsIs1u3mZ+9mXw5JBK
         deFw==
X-Forwarded-Encrypted: i=1; AKwUvBxc/MRRQGuH05fsTKW/x1ujt+iKgsd1IIzAEGB/FhhqlKB2hJOoeCwq4DW2qEr1ELUCUlbF41kMn1ea@vger.kernel.org
X-Gm-Message-State: AFuF++lj5uRtn3DUoJT47gHHn8VxVPHbDwc17+roUe81lnHc7Q3uYBoK
	pVSzEPr3R1f2IbJVfU4ZlO+eNIoVwtKQwIW3ma4rnrbA3JPSZX3qeEGCnMj6MposYc4=
X-Gm-Gg: AYBFou3cVoEPDOJ5iH0ZXftZpNhdFb9qEcxRFQi9MutKQcRSVGfL2CF1AI+l1V+8gEt
	uSgNVtsRYVnoKoaUiwYjfPzROFHR1i9pQmMBVQSkMPPyzDp3uWqItPPSoju0MP1ybGES5KbJfCQ
	VGPhE04/qeB5AvCVmrZxKy+iZ8LhrbGWMKyZTEMU/3UVzbZHkCoA1T4UP1tljrH6tqEzu8gyo+i
	j910YJ6nB4HGOYfhnShcnPwWjvGEQVNuCQlEhPKsWsjxUXU07XyEVIv0RuTuqf3b7OYT7TZLlXR
	JoJXAkVsGbBh4YYAucyuS9ycAZI1huHx3jrGc8lrCdAMaUzMgom/ym+4kDT1yuuYroHJB1lDJ/G
	8WSUSeEEFAco4wPXVTHsKKngChg9P4iRetuQ7bNntTZqlkoUFyOEa5F0ekurALBAC4b5G6VPCqe
	Iyb5YjkjsLPmS9+z6DMzq86q8fYVyA8mc+l7w2ZIXmMdBlM+E0HQ5/sS+JncUQWrHUc+9x8okI3
	Nitf59YHHJJEnCOz8/w5Vu5BkPeot30keUvfvD86ZA=
X-Received: by 2002:a05:600c:a05:b0:4a0:6bb:237e with SMTP id 5b1f17b1804b1-4a01b01b407mr37229355e9.29.1790795221532;
        Wed, 30 Sep 2026 12:07:01 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f957b83sm3700185e9.15.2026.09.30.12.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:07:01 -0700 (PDT)
Message-ID: <bd02376e-f42a-4251-8e7d-7c4e7579a845@gmail.com>
Date: Wed, 30 Sep 2026 21:07:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rtc: Add Raspberry Pi 5 RTC driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com,
 Dom Cobley <popcornmix@gmail.com>
References: <20260930095203.492949-1-sander.speetjens@gmail.com>
 <20260930095203.492949-3-sander.speetjens@gmail.com>
 <7441de5b-e9a6-4080-b312-d6c7123fdcde@gmx.net>
 <2872a37d-4f24-4429-aba5-34f020740821@gmail.com>
 <550045ab-fe74-4445-8f6c-4a031f5b436b@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <550045ab-fe74-4445-8f6c-4a031f5b436b@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>> +MODULE_ALIAS("platform:raspberrypi-rtc");
>>> Is this really necessary for module autoloading?
>> I'm not sure, it was used in the previous versions when using the 
>> platform device register on the register_clk driver before it had a 
>> custom dt node.
> You can test by removing the line and compile it as a module. In case 
> the RTC driver is still automatically loaded, we can drop it.
There is no DT node for the RTC. The firmware driver registers us as a 
platform device at runtime (we deliberately avoid a child node per DT 
maintainer guidance). Therefore the platform alias is still needed for 
module auto-loading.
