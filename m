Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769112;
	b=ytdJCCiYbLOecH+kBshSjAFKkTpvGV5Di88nvvAi9oyMNLOoodaTwWR/D6S/9RCIhSUL
	 ysUrOTnQKUQ3NK+IaaSZzhqeEy+ZNj71Ut+Nyt2stRKaddydsEbPle/f7ub0Rp7KbdFoi
	 61+HA7ONkx1XEq2JLGeRo2oJekhOu8wgM13S5C4U97j2EqHDXKSzC8VXQV+RHWCO5+od8
	 8sm6FVmrUi7+QkJTM9jduEVa2+9QavkhS8g8K2XZtFzpBL/TD2zF+gtCsILnPw1iOMqRF
	 Pj5J4qXAZw4UPvE0M1l+l+TdadLiq4D5i3anJ+Ak25Y1IWXbdA9+loqC5DCjlw5IGaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
	b=rN+kq92UK655W4v4SEDYODkpaKrF0EbNZ6fih1ThMPxqh7vu+qvRP8KMQvDoQ/Bf7TTj
	 rlN2gvpTlhf9eoQ1vGLyMv+WcGSMzEF59c3bSeTzgYKfLqL2II4xYPZDN7v+bg89r5Ald
	 2trDWksKHEK9J+oBAWaV4qpOdQQV3CiFOIldOP2xBHM/tvZdyHG84LqoVKe15D70g/Er3
	 auMUWtn/1towp7d3A1KUdPoIA5WhVknJX3gWUvA+Q+tuwTArU9OeulVh7OgN3ob1H0VKK
	 394SuQB11QKMeYy8P7VkSmJp9qnJZPxLFvcVKjEpuc3XKXqtDaNvfpRuOR5t5U5AOsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D80606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D80606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRD64OoM
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c506a231b88so1045384966b.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769109; x=1796373909; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=MRD64OoMvCFGHZzsUp9+PwRr600pYUT0w3py/Lhu8RIPbqz6DXgVcMB/2Yq02pK7Jk
         zIr7Bip3xailSfRQcn5XGVNVqY9qud32SG3Dh/HIncZv/GYYDGBs/yjGvu6uagZJ3jPH
         EFINEQR8KwtgdsJpdpN/TGnxBzOw/N8Fm7ivr3hJXlrbYE4F3S+5wVPl5IpGYJ4GFeCY
         MaYws/JsouoDxUGRRwa85698slMGV7CjYPGuL/hUtgKI3+gg/PgfrUtBbLfNah4xjtVW
         munMq2IlGI+FdDn19++xCQ259D97pO+8nQPNtINOJhw74xx1qVicWNXaQidZ9Ok+FWl7
         keIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769109; x=1796373909;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=qFJjWC76ckqDdSMSQ31SFrPSDJX+a6M5gosv8hr1CD8kS9ktjKMV8U8JFIB6UQmfbg
         X6/y4/uUuTosZFh0uVRVt43Esvtx35eNCjfMGQGCHtnMNZ8UPkEt2BkfIRnEWeXUA96v
         1OS8uYpBiMadob6bn/LjMjCnSTATyPpkaXT+0wwi7Y/rvKtx8kKeGi71OAiXHcHe8am4
         3+liEoXgTeOtEcNvs6cIDnr4+KjeaauVSeeKW+LfkYVrWe/DKI76UhmhbZLQPixtjzBX
         mbnkSJA8kUlXKwXbl5kER/4uuSl+NZzGvi4eVIueTMXibvQpCBgKvNySsQvbucFkGdiu
         9Tfw==
X-Forwarded-Encrypted: i=1; AL+hErFSTJ35ZBMB1uxoiKV83O/X6dFgChS+2r8KZuZ6L6q9IoWKLgi5+hnDZrQkJjrPeHpNN2ipV7czKObJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8itkPy7JfyW6MUT+OKauZJ7YuL16GWtMtjsB2/m8LNovTQV2DS
	nu/Copug5S/ZRtBXN8GsWIMukC/EtNuq/+9LjzjsI4Y7TKU/F+SbiLszaLtfyAdUTIc=
X-Gm-Gg: AZFdTZdqhSXNrUNCPVo/MSOVYUMLl8Lw2n5djQitBxKtfCSp5/oH50a0XeoRxcGFr95
	r2Hok/JxNqVtCBPc9y+oAPVhXSXXUewLqEAcghtyQbMF2KjXpT8b58/vD6P/J/oP6oBFnZihw3k
	yuvUH/etRRN3Hj63t4b88KGLrm6n3cIiMYFOaif3U4zecQJFm/8SKmyEG+ahowvbUI/Rp93aZ/c
	njpDrlvMjTWfTxzl5pUQDASjhhZ45XFgcu9Gp/U0iZ7TLvVPSxANstHHQcHEh0+qaEsH0E91Xq9
	kj/75Ipn3AoYakVTjTw1LADYaxesLMsY8mtrQfmk423vBU00gHf0reS0HtNI7yqlkeQutE5AlH3
	O3BKdtlbn309Me1URh+DO8ZLs2uHCIrDUU0NBtp2n3rpDKEVHv4tm3+fgknMtb4shFjpmbFNJG9
	M7Tx9Dpc5uM6OwDKl+YvhScCUaIgz3pxHWZG+SdyZQ9kTbQoqTf752rMf9PM7niBqmewNVDMBtB
	pj7zUlS9b2ng/yLM3dDk0gIXvsmK/XWVg7UjpKpCNTmAXbC6A3VLUWpraaW6lt72ZO8sgQ4KwDr
	uyz0xuMtHDneIOaTYjOHlEwITLN0WP1RQWCVH2DbT+25SKxj
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id a640c23a62f3a-c513cb65d73mr1971796666b.49.1795769109636;
        Fri, 27 Nov 2026 00:45:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm851467866b.39.2026.11.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Fri, 27 Nov 2026 09:45:08 +0100
Message-ID: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +
>>> +&spdifin {
>>> +     status = "okay";
>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>
>> With sashiko remarks handled
> AP222 does not have an SPDIF IN port. I will remove it and update the 
> interrupt number for SPDIF IN.

If you need an immutable branch for the clock changes, I need you to
submit them in a dedicated series. Let me know

>>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> --
>> Jerome
>>

-- 
Jerome
