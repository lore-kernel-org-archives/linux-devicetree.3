Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793844807;
	b=EHjddGNmkMXQsDhQghh1kCRWkveK57HlCl5PrxNifi78i1b+zqPIsmHfcSioj+fkfXTe
	 ruWxbvX1VZnXEeKyIetgWb96Mvm/Z6ZhhNSED7/Q56k7XWnXHa2jFMeMbHIab7rgnp1ii
	 YEEcwBvNnWfmJ01+S9620m+/dGwwAGYXtiEHmb4ghuc9cQDQu1h6o92pNyD5H5SvQuvUa
	 9DtaoqED+EkqsOTDzc0wb1n57qDxNVI/fkH7WNo9Q9zURzOM6ncdfAHlmjE5mIfqm/rNm
	 BvOypdwHGVUDStKumxRQYGG9Plgy1VBWi3oyl9Ja9R6Tcfkx5H3AhqIRDwynSj3fB3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
	b=k/MD13X59XIUq9u0zc0gL6w+CMMlIWTQiy9mGhhc5mJ3MWnPBQ5QmNhzvJkHvfO74QDC
	 FMjRfAKFVnpBcLM6QMYkQkKX3ZcKDdDshK1+TG9aAWbhLTWw5yb1ilAoFuvXg3gzmjHBV
	 6QsZ6yCeXD5QiZMAJefKrg3vzI+wLb7JWRXJkcTbbhX+SeOOE2heTqFqRi9nghNy/ixP6
	 U4Cr7AoiRqCYTTpfPYBfQW2aPzt81j0j8V0q+Xb/5vh1te4zgEZMu4bb6gidb/9qarZ99
	 x7Jg0pD3cN+EzTuGuGfTWz2j0WMjEXF5HrgvwVTxeCmkZXPG3s2KR+jaWS4812ujn8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e54vUMq3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57678606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 02:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57678606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e54vUMq3
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso5977a12.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 18:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793844806; cv=none;
        d=google.com; s=arc-20260327;
        b=CSynSY5jJTVllr6nYSNB7lw9LNF8f5DAPVeGXWoJfcd9t/+QiCLh3bdrx+eIYUzIPR
         73HP72TQhTyfLa9HMBZj1Dlxlsnv/qz+oogFqJIgcyzwTVi4+l6TTqetrpjpUKG+WqcV
         tIcAdXc2mgCVAXrXyM0irPQ+5EkMev8KL1Aaqp7/C/uCp8j+cESSXpcOQ5Uaab0KMlv+
         /6NI7v9DBltaCqZ5XKPP+DvNs027zeRRqn60TSDkjz7qyRef0M7vRvOxVC547m0TbULx
         oqN01vWbcZeiw1Qt8r/QEjhuHetj97zCIAgkN2poSnrOF08uZ2JGe9gyT5WgBGSB0bJB
         sC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        fh=RnrCkk6jvw+aKcRHKCE2DxBWpDjqQXJUu6yVrGZk910=;
        b=lt4igyaqxISQEut0fvhUu4gJWC8q5cXlL155yVoFbNq3dRClRpy5P+bsIAqbFrb9Fw
         R7AjowLJTF+UBLzFyCEXr6rM6wGmzdz8B7U4DnTcWoCR/HXwpyAsVe5eiNyqCx5R6b0u
         OjHq6EvuLXZdxM513jhdmNk25aMOvHTc0SEmmEBAzt4179039DaGwEV58wIi3s8SE8tW
         bVBzqCyfrD38BAuxt5mH60JSlcni4Rd5wdDch9F2E7GuEjkULEk7Js1v8od4qKC3zVJ/
         2iuGcmU3MZ3yzbSb73P+nMnIu7bGXvE3KVbjY8khmtshSiIck40L6pYjV6xl6e7apLNj
         bdMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793844806; x=1794449606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        b=e54vUMq3VJQg+XBl/xCM483M32/b4tOTj2yEbVLqfjK3dNUY/Mc6rXpZ76/jR2LPQk
         +Wy9VOwrhxjo4L2MnkX2IlFBmLRwbJr2p0RGTnW2JAb5Kj8gHxrNJrzjreEVNyHqXvh8
         8mYGJ1MunF3zziLGlUy8UGiA/Ej/jRtKSK6hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844806; x=1794449606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        b=MBrfGtpb3vY/Xcu2M2nC4plAcrg/SYjAiIN1QRdKLfvbT0SycfBKyv/c7FYNLxdMpi
         o6d66ECLxizfaAMAIEiIlI29o8a1vYzOJRrFHAuEBujkdNlXT+G+HkQTIXXH1Qcp1ZpQ
         xNN9k7SzjPZGaj9jDBA8iFM5RqJ7TiewA6d1rO0gsS8Hu/9oJJSqmWagSvjuKKSFCQQc
         jXNJN9Isurbj19elgw2J8rLj4bYF3oas6kx/5xdc5grt/ZFeqTZTIefcUAsxnPPjpqDY
         RTw2F3mi1ahLO2wypiV3Lpzvdgetcilozedb8afVH2BahUPaT/vrtZfaOo+Q9pvLWxoi
         YDQA==
X-Forwarded-Encrypted: i=1; AKwUvBwk6hpfMAeXIrOfbfcKfQssv9jVZx5Mc/InusdllSaCMgmwI52tzU6Hv6S1iHv46K3kHrzz3+9LgkvH@vger.kernel.org
X-Gm-Message-State: APuU4Z/81lR5kXBjgAvas6Y2I3DBGyo7FLvGbhPPoCtlpm5jYqJ1gy6f
	csPQvcx6hHxDL5k9yGLXtRzw9kWp7WrO9fcHwVfsGMPS2te4QQ/FOIet5NW62+RJtkTKvjSyO4r
	J1x379QHZko78togeX9Z+HYADol2yH4k651F59Y5K
X-Gm-Gg: AYBFou1mCK5Mkuq7PJFLqZ6dEyRipAg8aIm0C7odgTmSTzEHiXF8d1qTB2KtyDzbJ7Z
	3aeAggCs9MM6n18eTHYKdm1wIu/NflmnXzysd4V5/lNMSB/GZahBBs3tMXTespwgwRW0eOgX8mb
	H4WP/gpoe90Z7iOjPnr2KULJJ+iI9SJ6m8tI11XB/WVn1QwanMYbmfR8vvrbFzs7JmlLQCIJ1VF
	LHBeeZ6CykPeuj/GCYlhD5MHQOnr93oa0hVWIJNX/+ovS6UNGS28SH9ylUsDtREaGeDwjQ/2aMz
	yPr6/C+Dki60XTmOIVhpQFhm5LWppZ0H7yJPFi9grkTVgDzdT3GE7hdsgQGFPx28XHgZiVZ9oi3
	6qdtJbZ24MqgaRmRLaWsYTR6igSqXKLhk0BOGS+HjNkUGDsuUKA/sCtVV8tW1M6fNEXpTjnQqbx
	OtALvU4sdefWPbp3mrmc7qxQ==
X-Received: by 2002:a05:6402:7cf:b0:6b5:65ef:440e with SMTP id
 4fb4d7f45d1cf-6b57cdd26d9mr21493a12.12.1793844805321; Wed, 04 Nov 2026
 18:13:25 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 4 Nov 2026 18:13:12 -0800
X-Gm-Features: AclHuK-125zaIgRXhhjwYItELasBysm9j_wuLFip_xcu42o_jtzCl0wz_NYTSuw
Message-ID: <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC
 function ids
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Marek Vasut <marex@nabladev.com>, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> DT folks, is there a way to keep the list in arm,smc-id that you would
> be fine with?

Perhaps this is a bit of a hack, but you're in an unintended situation
that wasn't supposed to happen to begin with so I feel it might be
appropriate if it avoids adding a whole new mechanism to the driver:
What happens if you simply define two watchdog nodes in your DTS, one
for each SMC ID? Both of them would independently try to probe, one of
them would die from getting an SMC_UNK, and the other would continue
working to pet your watchdog?

This driver started as encoding the SMC ID in the DTS and that kinda
seems to be the standard for drivers interacting with non-standard
SMCs, so I would prefer to stick to that rather than hardcoding IDs in
the C source (if we do that for each board it may end up being a long
list eventually =E2=80=94 I think one of the reasons the device tree was
originally adopted was to avoid things like that). I would be fine
with the array solution but I don't know about the validation checker
and whether people care about reusing the same prop name with
different types. (FWIW, in the device tree a 32-bit integer is
basically a 1-element array anyway, so we might just say it's always
an array and for SCMI only one element is allowed.)
