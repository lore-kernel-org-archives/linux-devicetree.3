Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793240573;
	b=nNfVsNWe8LOC7DTD1KAHTSYm5icD2RS/To3sMmr57PmXLyWhRGzs4p7pw+294kCWAfJ1
	 eb14we4r4GMHr/aS02bXBBIe0fZv+SCJ0O07D1+7lQbgWn9EitPHV5thLgHR776cc7XxT
	 9gmKsU/sWxOHmRZp7ZbxeKcAjCeAfeDZQhaNtsMBD/fJ0TuurYgG9ZvyRfRiZsjkOt03M
	 UkGch7n7DAqEGeYuaf40vnmBtjPg36Hx5DEVhShvothUyp08+7641zPoLbPGHY8fWXP0c
	 r2TsSGaqwcdWnvqArb+IsKi/94eu9IsdTmqRH7zuOF+jpJ9bA0a2hw0l4Ci/bNNAhIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
	b=L2+wAatP+noBbdXUiw3R3n5aP8m/lGgST2GVULMutWzQ9Td3wGUwVpuTGwAwB4rFC3qI
	 Rwvb3phmnTGFVq8yDJoD1PKYJ7S4dzyz+jCDltKtzCd/ineBM77p9fkRZ+2k0ioiMlaUE
	 Ac0i2YQifRe96QEu0+oG3FaMsaG/SuZ8aPlPTmc3+ksTT0Up3gmH8bCxqfsNv0attq1eh
	 6CgFu0BjueuTl+OLW669575aZ1OX0pWAQJe56Qx/WxPyxPq4Mmex4DcUA6f50bRH0tJIC
	 jD9cmoQKUylqN2NpUqiVJwldmyJIYlj29IO1eeoXYu9B3ziu5MvdsjVWMvRVsKG372Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmyf5Jt+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB06606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB06606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmyf5Jt+
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70059e4dab6so1097327eaf.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793240567; cv=none;
        d=google.com; s=arc-20260327;
        b=cj0jo6CJErPOpvv3ujaSiE0j7qpgRSP4iPgQ6W4919u2yKgZxKW6AhBXALRC6Nw8QM
         nBj0AKo9Wznw0httxTw6pDh0mieXiQO15LWviIPQyJpnLO9rwqNAM9ERV9Y3oyGahHgm
         2gP6mDyD6vdIb8GTxRLGjy85hkFEOuxbp7q6APggV2R78ae0lORYe19Zv4RvIS4pi/HQ
         iGNKk8Eu0lWgh3Q55gurtx0rU9knRjIlcFSYjX5VUnTjm1/NT5hY3tqhNVt9yeBdSeOS
         Ro0lINJrYnGrtiB6yjhiXWYo1utd7E5n0v8Nzkb4Fz2Qgazhq4raY1ESwP4srBwuthLy
         taWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
        fh=iAfDgEQDrsrVa7n18UjaalyWanuAMx43Rh8Su/omO3g=;
        b=VO43v5Av+bS+oV/I+5Wg4gFtqon2x8gQ0N6DXTW0O35GDRiI+ehVKIjT7sAvU8cpsZ
         Km6YxFm8BUXCnHV7NDms+WpwC54dLQKyUrUUGUINmsq2oG4j78PkKiV0VU6mVCK/6Vuv
         izb5bMjE75rY9PZx8RHj4xyCi3VJdeqWfWdKvripGMjAybFNvFY/SPUm4iYFTGeEtzO9
         mBpWBKuBZfWNac7aSIVw9LHzGDQ7R4CLFv4TextGUK928qDtTBU0aTO2Uki12TYPsWH2
         9V0CugAm4EottdvzlwORD87jhRDIygZFNcznz0doVQ+Zl1ZAlP/mZfWrR41h/L8VyMuW
         Q5aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240567; x=1793845367; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
        b=qmyf5Jt+Ed+8erZTIMBU8TuCQh3D2NzH5HVjNrR2j/MFpaoN3IGVfoACJiUjUHMjb/
         lFR8+WFwLe0CXdQXa/o0qlcSwCYmOmul2OW7qv5Fyp0d5twPeruOqTJp87ZyLFwWu03V
         aaQxGAM2DUjtppw/xL5P7oISaWVHa+H+oVtjg1Qmu84nz8uY8gAA2Af3Ucve5FKD4PPB
         tfAKUJfn06RuAOZ3E6CWTcIq8tnssyh0C8Em7zGntuVxBb7lLV3NdSlDyI7g0edtr8ra
         AKp7JqKhozgBFOIhF2TTJXF6W59ghl5TVfxLl1XRy0Cid1wYWsLR+hX9LRp1UxkcjO1i
         ZtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240567; x=1793845367;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
        b=GSAqz6QXzxQXG9OJmFD/1bx7rFMKB4fBsjeTDpA6WzNjbLOKenfdvOM3gI+uBPeQ3P
         3RKdEUYP5kLpxIudvbqY0LELqzfZgbfiFQHabgsrQ3WA33SdN+UX06ZKh2QaqKvHY8wn
         iJnuqjXSt9dz1irXeiLCL5b8KYB8WtRTc0f2RqprxlhHyVvNTRZTgbyEzqiWuUhGGzUK
         fF6v8bZikn3Ry5XpaThvZNAvyxDkyckBKgzVN3epQjoTwG0AvGduhXGTS5FZOrDl+u7k
         i3SZLH1Cp0AFIZjNOyNhFV+z++/S3/fZ2hPDnpWCjuqvT6aZ/QVkwR75ScZWwN5IKaOH
         o9vw==
X-Forwarded-Encrypted: i=1; AKwUvByqgygvb+bvQybpAAPOV7gYM9SMhA9BiOP9UEh19VYHswphxc/ZzvY07DAa/kLBTcm0aZ1lU7+oSgdY@vger.kernel.org
X-Gm-Message-State: AFq9FYLcI8HrQ29WH29Fi9NO/ryFApY1vHoLjNcBAuqxKVZq4D665k+9
	4XKdhOtOs4lF2OCdttgPx6tlEeh/ctj8u9G726JNLDaBu/kmVu/SEUKY9yBGCYH85gRtOO/jk0+
	B89PZ4NsO2sWdG2gSWzpdU9X+4voWNGE=
X-Gm-Gg: AYBFou21KRuLycP+vJx4zOr6jiY3709UGE88NMeGErJ59Cwu/FaLINlBrlJNtwy24Ew
	P9pWRBV2Rh59Kao+MJy4PMmEik1MBieUveQ/RN5rbkZI913psNJOFsaXgfj5QKxGJwXma4GJDgW
	HXwv8r8d6YJfBSu3p7WTLUkfVcndVA4AiomQVvP1ZF6X9KrE0bdtrlKflrBWSO6Xg8816hIZLfc
	Sgx50bMXze4wj5dp3ZSK6g/wskrom8e5OFrfypg/YdYzRAl6KaHq9TU82QhOQYdVRBIYVHcMpCQ
	6rMBEeaiKmDNA2mTi/+hAT9U4JX1Z0y6MlldQ6J3V35PLxxzdpcOpy4UlV5DkFDiH2boHWdtav+
	BxBEG6c/0MoeOVw1FA9k5NghS3auGbtF1/pZS0xLhjO4qVc7G1bH98DnZvrYgIu2uUs044A7HKW
	RqMfJVTd7svkPKmOCB9vFe0DOCrAY=
X-Received: by 2002:a05:6820:c2d3:20b0:703:fee:9506 with SMTP id
 006d021491bc7-713f217c0c9mr1834612eaf.82.1793240566951; Wed, 28 Oct 2026
 19:22:46 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-tf-luna-v1-0-53a88f93db24@gmail.com> <20261020-tf-luna-v1-2-53a88f93db24@gmail.com>
 <20261020-formidable-aardvark-of-biology-cffcc9@quoll>
In-Reply-To: <20261020-formidable-aardvark-of-biology-cffcc9@quoll>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Thu, 29 Oct 2026 07:52:35 +0530
X-Gm-Features: AclHuK-_y3DzB2l4MCckdRo6yujg-QNDJMup39akDFJc-hodLNFx5tyWp7l8yc4
Message-ID: <CAFqz8LLzi=mY01Lyjzmt71yzae=8C3-O9zMG0739jH2Dac1=2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: iio: proximity: Add Benewake TF-Luna
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 10:38:00AM +0200, Krzysztof Kozlowski wrote:
> Binding should in general cover both interfaces. You will not get
> different compatible for UART. Incompatible changes won't be accepted,
> either.

Hi Krzysztof,

Thanks, In v2 I'll extend the binding to describe the UART interface
as well. The driver stays I2C-only for now.

Thanks,
Vidhu
