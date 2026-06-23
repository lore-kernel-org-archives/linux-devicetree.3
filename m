Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87301359A66
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250517; cv=none; b=a4EfMAvG/RbdBaMnx2TvLi51uLy84kW6VSjXqhDB8+tWu9vWM2np15Rinm8qRdWu+bMn0QTWaOe18lsOjP7Bt4mgNk6SLndE7CzQlVGsXEBXZvLzRWRPXftfukdIbIWS8IBgRwHXwUP/3usalzVgsoiNoVW4mfTBiYiSqZCJI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250517; c=relaxed/simple;
	bh=aUOlwUMmvUxeWUajWHyxa6VY5afRmReJOBvfaFefO1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRBK+6QSHufIvxqFZJXlJU/EwhZ+vAlQspTR7Jgj/4tVV2XfFGPLwmsNdpq0LAFQx9Gn/JOL2Yqny07p8KFq83QLYRbZT38OhphyTFunc78go3j0chn3/h5b6NbgR+UU7+MPd7Ojlenfl51Vev2yNwvbF86hwLltD7RLe+wux9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxXQe4kh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxXQe4kh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46255b269c2so249692f8f.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782250515; x=1782855315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npX1zE3oC8B9i4AqwB/UnRyXW+2tBx9spPlY9cjsius=;
        b=kxXQe4khNHhsZuZYLfHoNMuyD8he9Pm5qCSWmoJ37d2BOJ32e71EOoxMNQuH47+LDC
         P4lRRdy3QI4G1GaR4tAB0D0nDqjEjbibO1byHCiVUKUeHTnESuoWwQMdjd5/TGfq90qn
         0AV85RuUi2n1S6BxmjzeKuFkaiXnOOBzos5QGY5NDhTxzQmC5pS943OvZCliAnbExjlF
         2fru3vIAsOIMKXeE1luxuISphiWOerwU0mkhZ+7e2Drcbow7eEN/I9BIxk5I7cunfBex
         lfDvESZ0ZX1NfPozqDPQLIfrkzK1pjPdE1rXiIVP74K4XKyAk6oyMBYUEdsmuwG3x4FV
         geOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782250515; x=1782855315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npX1zE3oC8B9i4AqwB/UnRyXW+2tBx9spPlY9cjsius=;
        b=L67VeAqO+gMS5QuDzMUhkmu8UvK2W3AiUeT6VgoEKlPer5uwG2OXKwTqjAJBlVVH+x
         pmIJQ9HWMMiSXq5BRCDGKshv0oUIoTk5y0nGDVde5mknyMlyr/Ccpv4MP916j8pqkwxc
         am/6hC6JqmjZcv8BEM2X9M3Ciuhx2SFwEQFWfc8hRzvhqN7QVSfwAsG92P+1/dimRQp9
         33eOaFfLfa4gikUj/Q1GKp828AX5dupndC8iCiLuOEImP8EbNlTjAe50yapuIGEpMSeZ
         tRzcqfuKiEvtR4Bqp3RE6lOu2jynmaTgJVpLnZr0EOI4vdfClMorSDUCwNwfVNGcFpmi
         BGHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qqbXOLrWktihDnd9nXefr5OoxrYUGXX1DpwfFmpzHP7eFDLj9Mh+TpBZhheRn0Y1ucihqvqiBpWMz@vger.kernel.org
X-Gm-Message-State: AOJu0YyMl624s/+WHbV/kaUMvqg8023/rO8tigCoDf+sWTjjUqVPCEWS
	ttHw07pD0PRKA79mN9HmL5WIM5uoUGKf41DT/w1xIWU4bjh0xwwBdpBD
X-Gm-Gg: AfdE7ckoL1j1pr/ECv8jw7MGbQ2I+DwfdQDMrlr6TR+CuP6OXcoqNHAiG+oPRAiGNgh
	eTrcRMFsvY5yDGxX28PJYupHw3I6vYqeWg/Wwp9FhEEnFjaxee+K117mo0W4DZLAeyPtRRAA8pO
	/4+90kcXjtvrxEX87tkI7vEEk81JjYuwBIeQS5Huesl7ot8F2LuTX4KWC92p0EssOPKTI+KZEin
	4urWmgmfmPpZd96wyKgpsSPHKjyD9o6lUcwmukOh7uc25Eia5+aqLUi+CGzTt+CYPsHKm/0BZNT
	tnjdpYI0R7+UaURxdUKVVhMOKA61jJqcWIVdZx0C4P9jM6OiE2vyNAYYOOIBIurwKROVSJ08cUl
	4jCwIvT7iW0m4qVwJDxv4N8Cb+qntFShuanu8jYB/8eFlQRHLo83RsqmvJTDYqvsvRTSDQwflvf
	01dFSnipCbuh3XNpstbbgXfSXWGGLRfcZ3cjIe2w==
X-Received: by 2002:a05:600d:10b:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-49260840c5amr3352535e9.2.1782250514831;
        Tue, 23 Jun 2026 14:35:14 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93d8sm1059435f8f.23.2026.06.23.14.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 14:35:13 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: markus.elfring@web.de
Cc: airlied@gmail.com,
	amit.barzilai22@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/4] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Wed, 24 Jun 2026 00:34:47 +0300
Message-ID: <20260623213447.30196-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <16a86f3d-caf0-46d0-97a4-c9585bdaa06c@web.de>
References: <16a86f3d-caf0-46d0-97a4-c9585bdaa06c@web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Markus Elfring <Markus.Elfring@web.de> writes:

>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -146,6 +146,33 @@
>>  #define SSD133X_COLOR_DEPTH_256			0x0
>>  #define SSD133X_COLOR_DEPTH_65K			0x1
>>  
>> +/* ssd135x commands */
>> +#define SSD135X_SET_COL_RANGE			0x15
>> +#define SSD135X_WRITE_RAM			0x5c
>> +#define SSD135X_SET_ROW_RANGE			0x75
> [...]
>
> How do you think about to use an enumeration for such data?
> https://en.wikipedia.org/wiki/Enumerated_type#C_and_syntactically_similar_languages

Thank you for the suggestion.

I used #define to stay consistent with the rest of ssd130x.c, where the
command constants for the other families are all defined the same way.
In my opinion an enum could be a readable solution for these values, but I
don't think the switch should be included in this series.

-- 
Thanks,

Amit

