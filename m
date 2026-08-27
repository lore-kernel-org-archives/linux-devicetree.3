Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275C456DF9
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842316; cv=pass; b=N08alm88h6DGdvc5KihhwzKY7UYOyP5G+6SG2QU++zkngwbrWuBawwC64Zgf7Mil1UmQG4wRUTJYaH3lyMeeCN7Tu4SQANOLFsHZkN3KHX2y2rrYZiFOTXP63XlbV0r3iQFnw8Mt+n+b2O0ifcUOCM4DbuLsQjxNsVFHQ2CenZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842316; c=relaxed/simple;
	bh=JfGF6x5LOBnftc5+sP1QIIQF8KWJ2gxceLJFrGZ0Tuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiQw1l+rTGmchmmrV6kgxaarqngpwDEjFOgH+nVxHdeueZeMpnaGn4l5laFYENgcf0f1fGwUi9NcSXH7cfKTrum94jeLXWiMIDdKN/9IK+pir7lUsqEVrgUXZSE891kUDohAeAtRN0hRZiUMXIGgA6g8dBQiwNd4H54bN/2wxfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqmNN4tk; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqmNN4tk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2530cabcf4so254072766b.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842305; cv=none;
        d=google.com; s=arc-20260327;
        b=Zqi0NlkxsYgb6F8SpE2Wq6xL3jgoerqLk5vazYIoFgTA2LTnGmco+zoqqihmg7LJIh
         w1QTVAF6BuTdkUekCa/jGVvZ2bBbgTMpUqI8A4DopJFks3+lha9AdzAjFygzONOlCb14
         0b2M7BWVcihq7TfQNByS42eT/AmwFlGeQZE3mXwH9RwUA9GuntIDFvtTfhmlylpxpGs9
         K4ULk0O+aFgj/k1g9ZIqLwaCEZC26lRVvS9HTRmfwg7c3yjEfFNR0VNh4nyMS3XBq3s8
         YcwRpCcB7qCz+dIv6kTI7DZDingE9Ny6RJ9i/GH9gtf8pTx8W7PfN1XxsEs0eS72gq6/
         s5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        fh=0aOZa4YccngfVqHj/IIQnkXmxdA4M6BqigJ7jMUeFiM=;
        b=JBrwFZr3Tu24gj56uygiOsQvWVC3h5gVqFGxkdY5ox1z3mOMXt5KcSUuCJo0jbQK4F
         /BAhY5Mkb49ZK7jNJ2gelAAbj5r64twD81CRjFyURWOBADvPZ6OhKR15tejLPfgoxhnb
         r9SHO2VmiUcKrinhm3djqQ8wJiw9ADyRBVUTrzS995xhNoGcZcO/aVuHsRVzcUDO3PqF
         FkmCMOvcHbwT4//hTcYHWNEjAYJFj8xaluoiSEI2iObAOrELKECKh2W/9ULh6W3lJEhX
         qj4p54HEXsYtXYqd/ys6IW61pQvW3I0fAYOXIWKwxx1c+zc94L95tb5ZKpZOry1RVlKz
         5bag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842305; x=1788447105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=AqmNN4tkI8x8FAfbglsXPvavrjCiggdJjyBiBhI3pen5AzsU7spp36DIUXTqk13d6Y
         is3uVyWfam1AAIpiLQdSLOOrjdFCZkpE5bnsDPu4KuOmkm1LnRNElB2qtglPd37//U2x
         +47mLJwmLvpt43Gbe6aAR7ZiikbjZPoFd1V1zbbbF7R12g2B77qdpfI7pH7qpQFtwZIf
         EwPDV7UvPrvuaft9kr2Iy3Pf26RxxmhtLFT2tjNA5yOoge6sIJQurZkYk9AIOPCRYUKH
         cGRhpKaP99NBBswbvrLl8sFQWUXttHkEpFr/zkepv9T6XQdJ5g+M309NEPaiNjFNnCIQ
         Soig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842305; x=1788447105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=rJ34W/n3JGcfNpVy5HpFkMcnHXQQROZMOTFgnoDbLRb5brmYHoc4mKcLMIpx6yquNN
         7UNa+Q5jl5x6C6z12VktoOlWb8ayzYjSe72Xk2LkrnljZPyLUar9UvORYUpzvqXS5UUf
         dq5GQ9kFNqdz5a7j8H7G45rHIBzTEaclheE0NSBH1v/XQ4S+p2dF149RTj3mxjS3evoG
         WzUCfDYfYTWKtoxUdFEkBjzoaYA5OghxDc2owheLW+ntYKpzMyDtVxlKMtMo9ARcxiUZ
         jAsjpPPRb6wWrtQKwlGmW7YSLaLwa5XPT3EcZx5vLXw2E3o8lGTD3f5KBWMgt6hQNPj1
         HVPg==
X-Forwarded-Encrypted: i=1; AHgh+Ro90VtFLNMTu8lh1eDiX+gvvqyNPfqfLtllxwRRWwFGYPgxw5WTdWxdw6Jx+E7DzVWqntYu2H+WgXWS@vger.kernel.org
X-Gm-Message-State: AFuF++m1nJID3dDEiJx3Zu9tWugLepgKVss0Fua00anU4yGQIhkylknL
	HEa6jp7MFXnN0TfJ4OqR3LdV4UnSE4fJE7qqLPWLWfJleBcNC5+N1/lK46KZ1IDV3jKEnLGSz6k
	aM9DL+VClRJXDzgdBDVULQdWU48wZHIX5XntoH1w=
X-Gm-Gg: AR+sD13A4S3Fp0Stv0NKqT5gJokZkuodx/S31mCuaWeI6GtPpMMwYco7m4Cv2FGb/uk
	/ijHyWSLEqiUlMXRZYYXxb1NFiEevD+fqEuKDKw4o+kEFbhNdQvW5YP/8F9Ohso4LvA9UETojVO
	FOrqCW2YT2SZhXJAtvP8f9afJUQLDfWjW6112R2ay7ImjuCPzTQaaQYFaByylwxTyP7iwf5mixY
	tITHGAaX2An5oRVHglv6a7+nxdlHVuHbWjSs3hrohc0h5UtaJnad0wcl/mgUrDUTiwWklbFLg9w
	YzaiuWJLOVAxxzL26U8M9TIiob9OCPdU9AW+7ZYiu5w=
X-Received: by 2002:a17:907:b050:10b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c252688970emr595367466b.0.1787842304808; Thu, 27 Aug 2026
 07:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
 <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com> <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
In-Reply-To: <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:51:31 +0200
X-Gm-Features: AcwNN1UfydGY6AWpAopJHGYjoXoxQXXnBv3_HR2BQl9Llz3VNnES3KHGvzZYgY4
Message-ID: <CAORyz2Jq-Q5CbFU5=vCffVyMmyS2KodFhomfUqyGwa1w8Q8RTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> The IDs do not describe hardware capabilities, but ABI between hardware
> (DTS) and software (Linux). If you do not have them in the software,
> then the ABI is not used. I looked at your driver patch and did not find
> usage of these.

Thank you for the clarification.
Since I'm not adding resets to any mt6589 DTS node here I can
completely omit this patch in the next revision. If anyone in the
future wants to specify a toprgu reset for a mt6589 DTS node, they may
submit the binding header together with the actual DTS reference.

Thank you,
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
