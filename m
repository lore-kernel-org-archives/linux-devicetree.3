Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DAB41D622
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059492; cv=none; b=Jmm4XRwAhR308lvGD2Fo6cdd4dLEy28hRuk5u6HD4oW+u2nzfoQiRiHCfGl+JG7lsZY87M0eNRpJ6uFau/snZHdQW2JPfQlHkysf3f1d9hyYK3Ob5jQonx9GzVa8y8V4YAC89SSneAxupQkNmns8tBlw6JY0fbchbueaSA6EoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059492; c=relaxed/simple;
	bh=mlyz0pITWZURifv0t5t/tRwnR3AP8uFL+yB9c5Nmz+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4jupPhRo6ur4aq0sxfqh14BgkMFuOPG32sZmWUQI3rQg0YsAtriEeIwTVfvKfMqt5QuyP/aPLrl6nJ97tIQVA1cQSMgpA8HZOJ97MKTtYdedoFiC1pqPfAjsCZYwH7g6L5z45n4D8DXomHE6vsM/8DvImzZBpEu4W8BCtOa4Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EfbmWhbh; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EfbmWhbh"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-49fa951b2c6so1103742b6e.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784059489; x=1784664289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBKshlNu2WOWV4tRMWzhVwxQQdrnAT+tDDiDT+ttOEU=;
        b=EfbmWhbh52LEnoc9xqfzbWu92rQFVaUfJ523Fhk3T8K3Sqkfpz+XzCNWILxSKs7UPP
         +hQJLeUid1c11TlzOX3cB5ZFpU7KhoFQanTnwm0/7Dl6iRa3cwz8di+m6+IY+DOKoErS
         oSKjKbKC0ykG4bZtib+nyN4Ig6zKLUHz7G61jgcjRCxmyUvVMjZWLG9XbfbDxaA7f++U
         ixiVomdxqI1Q1HRj5LTZgIClSu0es/SVoP0d9Y2AGJxdkpDtc3mmx3kIJVqOVBs8twq6
         Xy7WfpXAKTFhqrycdpC95NyFqls6XKcVN8HlHztemhtfyRFzfjPSCazchYDtGzeeyFVC
         9i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059489; x=1784664289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBKshlNu2WOWV4tRMWzhVwxQQdrnAT+tDDiDT+ttOEU=;
        b=m8r5vVGaz3fddvg9kqiVZ+ubot6BXScaEkR5KxVcaC27iNE6rnnMIKQHSi3SKRxdT1
         1fVo/8Hhr0hpT62npufiFUKMjmu1s2ZDIsnQcKEiRB8WzI7art1Vdam8nIk0sbsuaKdh
         oZEUt4zhZTZPGU8u/446Z16Wa+WWxPX3IaL5IH2ect6cnEzxXfsjaQJJGNzaf6vghjZk
         fP7IJPpAs4hP6hjLS81K5bHrAQLmiI/Q+RynBODDyzfrsZpcs+xE3ssQ/vVfGh1zZRNT
         O5tYmWGydPBPP4XuNIA/YLiimvs5TtaGPsHHSvzs/XMkfZTrKJJY1Q+bUj8m5SLalpqu
         J/Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8UuDWn74qSmKMZbGjme5jMlCwARMkziDeE5pcZzFSfysHCAe1YUTnvPAGGQsZn/wnraS5oXuyH5hbo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FM6/sut5RIDeZeLWT9UrbmNboQQjcZ00gRqbulX+3y4jc+o5
	MEdN6UWglDH8dn7Mghi/NFmCfbRIG3y40GF4wK2sCl9/ayOl/Ap45mWNxi6fM3Q30kU=
X-Gm-Gg: AfdE7cmyQCyNvUgXtxiJtiBlSeSuhHiJblfzLbfOVnsgBaY/c8v7j1P3zyvbmbRANTh
	qP3oEtQu2cXMsUvklApXDf7porT2GN082RRuohJlkPoHWu1QIFfnlBdmkcT0wyr7m2ulRgj70Gb
	7DD7P0vs3IRwKM/+hpJMfvz/FR689O6c7jfI2KAlEikYdVK6H7IdGb9PpsZghCCopJwDC79BtQV
	ihICvRh0XrrhkTj5k3HGWfLsr3aawT5JIYt/ihUEUV8jjOi2K/fZl1PTUSoHMnVgrPIDcXXgbKo
	GU8X6cEKvz3eJ5ldr/tiF5IkXP3+MLk6WJ8bM+2xNPdIexlLP/+G3hilDj0+pDTapOIu4MQ/Qht
	jRk5a0MzMVgsnMrs64l+PprhfAEHLoITm2vJ/z+922rWKvz32PkxNohD6wVStk2VR+Iope7g9im
	BWygl3vAYzCpy28kFrf2Lox++ohDIKvlYrTZUBIsZUauqtL4AlL4c4nUDs5qvrlo8=
X-Received: by 2002:a05:6808:2386:b0:495:fa73:2e21 with SMTP id 5614622812f47-4a42b04ed3cmr10654616b6e.33.1784059489060;
        Tue, 14 Jul 2026 13:04:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:280e:69fd:7612:d5a9? ([2600:8803:e7e4:500:280e:69fd:7612:d5a9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f31sm14743501b6e.4.2026.07.14.13.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 13:04:47 -0700 (PDT)
Message-ID: <8d6d2236-bb07-43be-8b0d-5f6ff0752994@baylibre.com>
Date: Tue, 14 Jul 2026 15:04:46 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110
 to ti-ads1100 driver
To: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>,
 linux-iio@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 marcelo.schmitt@analog.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mike.looijmans@topic.nl, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jorge.marques@analog.com,
 antoniu.miclaus@analog.com, mazziesaccount@gmail.com,
 jishnu.prakash@oss.qualcomm.com, duje@dujemihanovic.xyz, wens@kernel.org,
 sakari.ailus@linux.intel.com, linusw@kernel.org
References: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
 <CA+gq5JjVnLKW1WdEYzy279tqURXqqy+JNWn9zJPfXKGHUP5hCg@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CA+gq5JjVnLKW1WdEYzy279tqURXqqy+JNWn9zJPfXKGHUP5hCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/14/26 2:58 PM, Jakub Szczudło wrote:
> sorry guys I need to resend because of some dumb error
> 
> Best regards,
> Jakub Szczudlo

Too late now, but next time if this happens again, add RESEND to the PATCH
prefix and add a line to the cover letter that says why the RESEND. 
