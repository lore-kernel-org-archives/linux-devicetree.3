Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA64372B26
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921190; cv=none; b=LDSwpuPuRpPNLusaAJ7LutfDcWlDfvcVNPv7bouJjc3j715f6m8Kcm7fqUR79jFx40H8/xmMNTASDVUkS1aHJXo7PINyivyhbExexsEUF7uB1R8RNfOi06CTOUeZn7QPconl5pOkvR9rEQYe+3LhNiUWSE7f7fH395qHpO/53NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921190; c=relaxed/simple;
	bh=e1bzxx0iY67CI2xUqgdhPs4ZiUlAksJ9p2jPa6KR9Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThGXsQTIw8YwRNulnAxDmEcgl8VLgbyOWTNEOALLtuIfKS2kDFpyj3lvm5NAiLUsaONigQkCdXQM9L68XvdJuEf3ivloGQZE5GSe38klZ+fF2BH+dkYqyqVt6o77AeXLoYfFAC9b1mdSDhWQYjidarouwai1xRDODCKS94bf78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTaLHiF7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTaLHiF7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so1988778a12.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780921187; x=1781525987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1bzxx0iY67CI2xUqgdhPs4ZiUlAksJ9p2jPa6KR9Ts=;
        b=XTaLHiF7Z17UZsGZdccXEyFC7KVZEW0FTFEMs72qnaaqvgSl8AIEOAlinB4E537yWK
         5u1IJstKqYsamVYMusUAIb8fK2JFH2GviAk3rLOv05l1VFxImO8qtRjnP4dymPyYp+V0
         wJWddPQXJ2o7i3npEqGpnaGgSXHcdjfTTdtJJCVRAs1K2ZWKkrCG0cA+c5Li58A3G5DZ
         35JS4/i6TpFbJmH7HDrwFZEFGMV5YFO9GT4L5aGH/BwXQO4RTNl2OXjPInbUZlI57l8w
         62+8IrA1Cn26fr/6HzP/o/HQhF6bI+uGlY0f3ZXgyC3jxLY5urwyKkPHAHhgtVQyyLUd
         o70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921187; x=1781525987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1bzxx0iY67CI2xUqgdhPs4ZiUlAksJ9p2jPa6KR9Ts=;
        b=J5GUqxklUwbReOMfuN8VP0UQU/kj4h1jPIENDW5QJWA7jLdG2UZPrQLcmnQ/L6KpWH
         RrJh2Oc98d0PF68ae5q5ZEnnFLafKDXQDcO65q3p2v0+mNdh0iVEUQX8lW85U4VZaGYY
         tcVPIq4Dfsz/ERBfVev9aenM7CIbgFEV2Bjh1/xlw5KPb0x0JzrwMj2HipLa353HSA/4
         cv+QFOWiuBN/Is7kJ6to3f4qQedIvf9dW2fxrn1bQMfOxl8ZfD0OC2PWVZqm+p4DR7eL
         VRsgjJ/4PitOwcp5Me2FET8j+RG6C8RaqOAfa1/ZGNWuq5rFJo/DqIZZiEJOGgNW7Q/w
         WRig==
X-Forwarded-Encrypted: i=1; AFNElJ+XwnRYrhRPXDinP1Dd4xuxyL12EqgMnBIvfGLhJQiwbgpYxU0ftt3Id1HpqZUSsdpLLDqMB9Tifd+q@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzNyHnv/lfq1iRjGBwwnWMKs32NxHfkD9T8ZzU4ax4Bj7JaKY
	Gk8M4swNWiFOemxCMAeAUiYztFdBK+ySZFHk0XhbWTiaoKTgTZ3D9EEo
X-Gm-Gg: Acq92OHiy9P65t324Hr4hExwrgc9P0esKKteyIfUMFXsAn7xsoO6sDZsscOk7VrD2Eo
	B3Z+wxkA/0BhPPBCYdH7eRQQ1sTC+n/VyiPaIziTDHUR83Mqrm8MpoV0KBwM+/wGVm6be9GTer1
	H/c0w6TgFkcBSBkoP06xreWg/odhtwEYL4uS7e7D5jq5FTfC1je1QoOxYuZ/G/7G/2xf68l9jkv
	qP8YTADC2ZN9hIizNhMNQ4Zbimj50DIPExZjzwGGzDX7vzB1z7W9CEn0BtHvVTwHejI6KBnDJVh
	HHqF1Beprv4eDZDZ0LTd6BOvBdBkghxs37wpdakWDPscsQyAmI9D46Z9FPR2k7RXoXUsR9WELGw
	zbpfw7UWPqn32AJswo9H81MdzfNIhjGSpJc17UccgIU1g8DrcDgzTiJ2H+tA576+KfjdnmRiPNm
	1bL5+kbgLhsmjnw4cfeMmYIghzDdpbOK16L0ykymS5Dcvk6C2nI+Kjpc2WmL3yvCKbC01NVIiri
	Ybs
X-Received: by 2002:a05:6402:1906:b0:691:5700:7d34 with SMTP id 4fb4d7f45d1cf-69157008526mr4271194a12.15.1780921187287;
        Mon, 08 Jun 2026 05:19:47 -0700 (PDT)
Received: from fedora.clients.cmblu.de (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b57c66sm7017671a12.28.2026.06.08.05.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:19:46 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] counter: add GPIO-based counter driver
Date: Mon,  8 Jun 2026 14:19:32 +0200
Message-ID: <20260608-gpio-counter-v5-ping-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524193846.19216-1-wafgo01@gmail.com>
References: <20260515153616.157605-1-wafgo01@gmail.com> <20260524193846.19216-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 24 May 2026 21:38:43 +0200
Wadim Mueller <wafgo01@gmail.com> wrote:

> Add a binding for a generic GPIO-based counter.

Hi William,

gentle ping on v5 - it should address all your v4 feedback, and Conor has
acked the binding [1]. Anything still open?

Thanks,
Wadim

[1] https://lore.kernel.org/all/20260525-register-bogus-b198545b69a8@spud/
