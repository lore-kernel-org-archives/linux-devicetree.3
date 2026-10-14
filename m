Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFB5328D1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985692; cv=none; b=ZqymSJwkcVRN/Qrp3yniZX/vHoDjmxI1cFbSPlgg0PbtZC1WJUzc+5UDbRhPv259WJNUoPh8+TQg6sTuXydOtFRyswPt8ixzXaXGGVcO3oTJw1IE3c4v/B22ZYHKYaDaVXsi+aLV3UWXXZ/V7Ho19jVr4XNnUnuO0E3Or2YaW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985692; c=relaxed/simple;
	bh=XZb2BuZsmSb3LQX+Gqpg0HwFJSEHBcpA1T+CRYC45/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt8WJoWDilZFphLey2bU/OAQwq3iUD6SRGeMdhOYDQu+57ToWRXbc3PvzcBYX8qme7dKdFg3Ho99LJnT508BZ6wPqoOqbTRIwNBTw5gy/Ad3HzD5+GboebPehT4TgS1foMLkn5Tl5zUxqDM5HCJklJn0qExRmhQVgrllyyWmk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0iPDEY4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0iPDEY4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89a595332c7so2203992b3a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985690; x=1792590490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb14+6Zl+Og5oq4fRzXaYkQdxU/WMK9lIAeYNNyuMS0=;
        b=J0iPDEY4gqIYItuu8Y4y63Cz5+UA1sZxHGnZ9lKPpnJYcnDLFZfKprYQIS1Jc1nAfO
         7AzWBHf+6OBm+mptGEBImFFrPKY7wgvJ1Ff8VK/K4dHGKBC/kwKUDW0rRs7iK6H+tEtj
         DrFtkfuAlH3kuiEdqFTOQGZyQ+0z1dghqY1XsE93fxkbZ8/g1ktkwhf14C0RMM6Y3BKj
         U/YO4kOduUJfEBDZ5LdyxaBjqHW/TV+MvovD/ZKtnM/FTC5ePC/q7KPp1EyRT1N7aRsR
         wuT6u5plFtYBV9VkJzk72yMjgG/wW1/9iE+GZh9aE678lSVqZ18JuINkPQSvUqBiysWo
         uE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985690; x=1792590490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cb14+6Zl+Og5oq4fRzXaYkQdxU/WMK9lIAeYNNyuMS0=;
        b=nb3NIeH3AjyjjPdNMy4ecKf5Tc/HiG0UqiZJm12cV4qW5CC/u2kMkOKGCqYj3OKx3R
         7o7HILZzVC7LoIkXWRUXYoZR6DeQjePkLGlm3f0HMNSAsfsqZe3Bbf7iK7rJ7XsRSzSG
         f4D1lweszB9npxSDRkggj83zlWPJrY4HaFop63f4y2lvxrgg3fYcqUhyWPMPBtK4Nh2m
         zmNYxTB4/NEV1cuagMbg3UcUDhwnRMRbIPG5XJuuXe7hyFkTAUPsacwQVOll0fe3ksLy
         RSwSgnnSbBx+NLWAI2slTxhgfVkgaqdxwSjIUxkbAT7tkqGHg1jrX0FXCi2I4DD/2WvG
         hpVQ==
X-Forwarded-Encrypted: i=1; AKwUvByomaBFEO745i9S6sFwhOtfcTs/DIXvxox56o+5AsVishl+dHNjPziSJqYd/QgyQ2S60FaqvZ9OIiMI@vger.kernel.org
X-Gm-Message-State: AFq9FYJDPePS++QQnGpKnOFVRvl8sq8CbwT8MKL8Lvhc+IIoOj5wokzQ
	aHONsgsETAwHJzQikOzMB3QyxqOtSgRN5Anrl0r4koI5v+hf52sJJE48
X-Gm-Gg: AYBFou3FdgAjIHzvTOX0kFwGDmBJsNv6zPdYgitGujLO2YJu6wi1b+IP2EK34WLabeH
	wlGHASL5p9L+QPLGPwVhH/GkL2VgeLkIpFsPJU/hoi/TaAoYEWAtQ4yezUPhKRSFk4zoWRJZWEg
	Ult5jH6JSqzEZMrAmSRZcZANW6gQjRubYW1N+MMSUP6fOrKFuauEHzCFhQ8OPECgROAO1DR9Lju
	yFBAmeizHFW1KsT/h1KWKUgxDFJ3AGVOb865adxESWht3PnKnLzglJcRdzyldqq8Voq9cqR4dQk
	dNMxAV+91NQ82ecepHItlKoIcdxSEfkGc5eWMbyDNTe4xYKi0bbAkdomOSenJ/bSqer69jd1wgw
	9k5ZgulMKNLjb9IlYl/PWglV3Xo+qwSn6P/Od2+PqCh79NJv5hgeg7LIpysbx/QbJOs/zTP5lnA
	XU+hrb+nPIVUhrrdOInL43vhoLqFY7FW5ObSky05koLx3uIWLK15T7mL8BrHPoSc3+M3A=
X-Received: by 2002:a05:6a00:b8c:b0:880:4b56:dc2c with SMTP id d2e1a72fcca58-897c69329ccmr12308668b3a.34.1791985689597;
        Wed, 14 Oct 2026 06:48:09 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89e0d1a3223sm296897b3a.44.2026.10.14.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:48:09 -0700 (PDT)
From: wyibo6109@gmail.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Wed, 14 Oct 2026 08:47:54 -0500
Message-ID: <20261014134759.10946-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012-weightless-meaty-fennec-cdce10@quoll>
References: <20261012-weightless-meaty-fennec-cdce10@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Krzysztof,

On 12/10/2026 01:24, Krzysztof Kozlowski wrote:
> How is that possible? Same OnePlus Pad 3 Pro has different matrices?

No, and sorry for the wording - within one tablet project the keyboard
is fixed.  What I meant is that the matrices differ *between* the
tablet projects that ship this MCU, not within one: the vendor trees
carry per-project geometry (caihong, the sm8650 era project: 2764x1630;
erhai, the sm8750 era project: 2764x1630; iceland, the sm8850 era
project the tested OnePlus Pad 4 belongs to: 2560x1440), while the MCU
protocol has no command to query them.

Which also means your question from v1 is answered the other way
around: the geometry *is* deducible from the compatible once the
compatible names the project.  v3 therefore drops the DT geometry
entirely:

- the compatible names the tablet project
  (oneplus,caihong-/erhai-/iceland-pogo-keyboard, the codenames from
  the vendor trees) and the driver carries a per-project description
  in its match data: feature flags for the 0x3A sub-commands that grew
  over the generations, the touchpad geometry and the per-brand
  product names;

- the common touchscreen properties (touchscreen-size-x/y,
  touchscreen-x-mm/y-mm) are kept only as an optional override, in
  case a variant ever needs one, and are no longer used by the
  example.

v3 will follow as a reply to the cover letter.

Best regards,
Yibo
