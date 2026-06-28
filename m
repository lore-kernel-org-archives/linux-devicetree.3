Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8C40D599
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668065; cv=none; b=bKt3qbGicE/GvVyP9MSW3U/7f0vir1qdr6SvQdNh9xOGW7WL0EAA740HLQF8tXTk6IVam5V/6jTN6NQTu1HT8o3MOovPkA8clwaisj80neYTaZedtUdc2sJDaX2SMCOO6TSgaLa7/UezEyz+2KyzBGvMX/dyoVrr7ers9dMDn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668065; c=relaxed/simple;
	bh=09qQqVCweaC9dVWudIvU863DvaxZKCbR+wzGTDCknJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0aONIO2NHtuOBDE3fftknvlbxGD76QnlSLZfAdapInsG0PJn6ZSZWrVpAinVOuYz7jnRAD3zt4qnh2FHN8B3dz02jp+bxbz0pu3wRI2v5LYDtpMmmWtoEJ8yfp9WlSAKGrhAx56Lc9W6Y5sPaUmKeWMVQneN0vMc2gDmdSB+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aEiq2nHt; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aEiq2nHt"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9cb0e594bso269554a34.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782668061; x=1783272861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=;
        b=aEiq2nHtruIAs36argjAXLAQ2Zs2qpELM5zcGghUisCzW08kPoZjn/XnuiIj3La+el
         5VOPwpwsYPxuHJwGlIWOWLpiqydLIAPNF32PQEUNaTzhuq5IVyYyDzzPPA/Cxs/POpyY
         WJamjqYaNNZtfdNvhEk64f3r20SjFiTBaEQiprFqhfUvamFCEzAl3HFKuC/AFB6E8T6b
         B7Cf2Lra+boplDe7+7rY0lVr03BvIF86FIErAvPjKERC08JRKNqu1TrMGnNLYrTYJnQY
         lzbVI5cnnBVIsHTfAsStaPoMOpAB6ICFiivYAsyJomBVVVwV/9+GkfLgTyxfOacHbJTc
         NJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782668061; x=1783272861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=;
        b=jMQJj4rxRKZ+xwx8LQdAy38MfMdxKIJUOX0uX1cuQdthDLlZkuKu4IU9l83lyvOtT9
         /aMFSKBuRO9Uch3GqcsxRUobB2V1wye5skl3xZCpjWKmkJmHpcc2NHm0PqXiMRfpNvvF
         Q5fc+Gs+684ZX8V4wPgGGkED0y+Y2NysZGNBE/OprOYHs8wiwG3z9VLlq7YWhZTI4+9s
         oOQUFRPbiO1pD9BtsJQVjqVO0DIX4zyxFP2EH+cP6VlPuJj8vJLG4Bpx2x2osqkUfn83
         l7ogacChJRs5q1iHoZ/ulydtrUDe2MOdtYtv698NpHwVL7wSnOAfTJNjiD4lBZ1bFx5z
         OpZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iE7rdH9jj8mNk+/XHrzslobIOiFZlPB64QCJbgykW53yUkLtYUpvMAwwM8ETmXPFJ23LdsKkNXbb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxzC1ndeetYTl1ywbohaQg+ph1illEwusQsAhE29g50S7sty2NX
	p1CAEC0vksFpLtsE/qvDnaaxQK4NOO4lpYEBHm5lg6WS+WB+ol9vriVXFcBA7Sm6y+I=
X-Gm-Gg: AfdE7cltLlkoAK7gMFkkzzqvBegw/9csJmdw/eBh16XIju35X54khh5PajTaJpfSUU6
	ek8IVVu8eDRJ9Q7e/JVYCXfPOtyxaHen0NX6FGlsNopOfnbLJATKdfyVrjGwtgxNhVNcGH1r6/Z
	/b2eoFwosyLcRGZ255Cx3O7gVVqe5KVB98s1We/1aRKn/myMCVWG1wil8Spi5nD4WuaS9K8WXc6
	i/gUtLN7joHeBvA2XuVhZm5kFr5Jvv1HXCC4Kd8sw1v235JTSQLlgpHZ+2paBTTwBNE7FAY+ASx
	k24YlmFteITOxd4PSgaumvzYkXsh6XTRw/l2M/xc/VSZer0iD4S4mqfTn/6TkgDXmtEDBlbwZBH
	g2tIwIZpt5+45rbMTGSabWBri+PfhviGDSj79brV5wRfDGaPvvAoe/Q+AlWr4+A3e0Yxl/zbTcu
	VUb9nsrbX8ikV6nkHPYFoWnjwJklX4ODsvDe9P+YYeuMOCTz3iWombJUXzL4YLjfI=
X-Received: by 2002:a05:6830:4998:b0:7e6:f083:130e with SMTP id 46e09a7af769-7e99bfef82bmr13002333a34.4.1782668061288;
        Sun, 28 Jun 2026 10:34:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa7eb558sm6725566a34.24.2026.06.28.10.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:34:20 -0700 (PDT)
Message-ID: <3f914030-44e8-4f63-ae72-7fde7d843325@baylibre.com>
Date: Sun, 28 Jun 2026 12:34:20 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] AUXADC driver for the MediaTek mt6323 PMIC
To: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/26 3:16 AM, Roman Vivchar via B4 Relay wrote:
> This series adds support for the 15-bit AUXADC hardware block found on
> the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

