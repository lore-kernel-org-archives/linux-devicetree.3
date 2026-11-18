Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004866;
	b=I92QhtxCl86tbytIpcY1uoxFlqD7bR0g7qcZFuC77DepWv9dobTgBnzXy4NFSuD/xbUL
	 C1S1JQpoIsVgXdgu9Y2MshXj7vNFJsz2YMrPsKy/x5USVOXzvQPz4uYkjpq4Aw+7bWUjV
	 BWnz5Gl8oAsdUn7H71xkWN7KbPFT0yLePCHB9fvMzEsUnZWcia0EsG/3MTWb8SZFl82lz
	 DpqK/mfgrquXYkeT4UlKI8hqwII8FISauqdWPIYhCzsV5Ho011SmldaewpkNUpjKmwmWY
	 9e+Dfe60aw0nUeFxTGWbAj1LtI4gt3STHf/pp9ymUGseQlQS/O6qJYlaWaq7NvXlUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
	b=yPpuBGVuO9RFyMSfJwSCYA8d9YWo73mQTeLjOCd60BKTA1nl8K3+f1S/Dz9yd74pZKqB
	 Au0iR59zUBoJX7N//GWxPLKVmoqt4ks+0jXjF5pD2bUj992jSTvqzXTAda+UNRXymCoAH
	 yty9X7v2hU/2I1811P5fPMXSrTsM9M6ofP6kGV1OafzGZJ+1+VM4l1elaAhRudQariXi9
	 YDpsoZcHqv1mgcncK4M2fTF3NvRDRyBHj0ukdAM9QXgyjGId/wqH/LG4MZHTWNORSXGLH
	 XVqWSfoSj1yAuUkrsZlyIkJ56XGUVYxfw6zBtOIrxPtXjRLllTbLtzoCed7SE/+rxYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBHVTF4b;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E6606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBHVTF4b
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so545609f8f.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004864; x=1795609664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
        b=HBHVTF4bbapmpKhd2cG4j0/WIyzz76YZgospn+F8ZhfA019r5hF0mzXdmMgw5XmcYi
         iIghQouW8+9DpAGnD28wwSHCEKCHmumJJ7Dgj3B29p7C59GHHID0JVDwPfGCPxdkiFMw
         YroY1fXJNUGl6lAlBbhycxfusl/wd7NXBDxeSaunfJO5+rcQGS6BB3cqEZn/3l5o+E6D
         rs29dvDD5gIl/YdTcATmYbuqEgFqcNo3Xqhu0RjjI2WQNk9vOWEiTAlolM23mU6hSdv1
         l5zVpegNpwBb1P89cuSv/AElopPaytHKcNANPzV8kFMVI0bd9Zs0i2ItsxPfwpOxX+d3
         uS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004864; x=1795609664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5C/iHN7Lmzj8RXtCSxUA965C7B7NlmPdCiPikMVO9w=;
        b=NI/24PlFaEz71vVzbSSADq3YcPS0ALN4ukTFhw1gw/kP7RhjVlBVgddFn427UOqPkc
         QPqTIo18YXNu7KaaEKuN3yaSiv6RXesyLk8LjdCHSIkFJHfPA+lgQwo2dF5WTfneBf2F
         4bpYgoUKdhwKJ7JI7OVo1J18CVEOrT6ELQ64CPafhBhAFWL/0QOJ555Eg8/ivVSGhFhi
         kBy/BSvUl9Ru+xIrlKCQmctMEzYw2a3Gt9+/17zskourY9yCRzwQP5J2zTmmLsFOWa/A
         hxpwyIJnnVVitgnQF8ptQGGNjgRRuA0oOgq4dKBmh3S83CEsIxj51vl3FntQ5oLrj2Wm
         ZAIA==
X-Forwarded-Encrypted: i=1; AL+hErGR+0AO/RIsASQVK/Z1ShYezVJO8Jof6/GLvYEZqWftrHrnhfO7aZQGHN/QBqwyTS68rw2tH5Z5dRd7@vger.kernel.org
X-Gm-Message-State: APuU4Z/TJRoQEutHTY10+0kXQZLla7Z4umzR+f6MFh/ySwv03v673Mfg
	HxL3QUDsL4XIqTdhmU93hZiFxmw3TkObpEISZiozc1xsGoYAJj1RJeMC3vPiaRSCotE=
X-Gm-Gg: AZFdTZefyyc0ZM0gmrv/D4VavceaE+/mNd4ED5ncCWr25iwYBFgZp9q0iWOl7tD32I5
	6o7HMoSffHnctU2fnGYUtFbFw+1M0EQ/lLQMJAhCBXrV3EUyoucJ9av8cYy+SFA3ZsDM+ustebg
	cY7w+EplRx6e/wvL+gOjB86nqYDjLLAiTUdgWqPuTQfbnP3A+uHaqd9gvPMJ0ZsUWrHyXTCCW1Q
	F7D7xK6FUgoQDNQFMorGW5aPhJI+KfJuGZ/zJGrgTL3A0MkNIbQW3Pnxg1v/tUJYqfJgkI0HbsY
	fw/GzBpVZm/JYb47D9XSVjT63OLadmObfUww0ZTHdxM4SyGpcH0T3f+TN/N9Jkf4nYXP0Meco9+
	OCfIPlUUgA9q+UkgDDgJBYiPMruzhy7JVsVmjLlCWRUnWQSt/NTAnJE6sAEGncujJddji+5LIpM
	4PAr6tw8JOPnPPi4vv3Cfj2pdaVnYlrK1/U3eBPQxNk+Cxt819XBvtLGKzANM1nVa89Vj6Awft+
	+8p8AEFqsgL3kREuvA7i2NEJk3OuBNM6GXL+6iAAYIyKtOod5fzQHe99jjWAevgJLxpAuOP5u8V
	ggBRPHBdSZnTcVdmV0obPSvpzHsx6jimgKIkGP1yYAkoPxLDXPGTAmUocDb6r3/yUgQXpp/X9KJ
	JeA==
X-Received: by 2002:a5d:4f10:0:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4a63bbc41c8mr4416511f8f.54.1795004864445;
        Wed, 18 Nov 2026 04:27:44 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3a7sm4875705f8f.9.2026.11.18.04.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:27:43 -0800 (PST)
Message-ID: <f91804a6-39bc-4a86-b24e-9588327e092e@baylibre.com>
Date: Wed, 18 Nov 2026 12:27:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 04/12] accel/rocket: let the core suspend after a
 reset
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <2afd051e37b8dd4f10e347a3537b0086973d554c.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <2afd051e37b8dd4f10e347a3537b0086973d554c.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> The earlier test on the ROCK 4D was done on the v15 code: the job after a
> timeout went from all 128 channels wrong to all 128 correct.
> 
> Repeated resets were triggered with a 2 ms job timeout.
> 
> v15 (put, then reset): tested twice; both times the board hung within the
> same second as the first batch of job timeouts, with nothing printed.
> 
> v16 (reset, then put): tested four times; the board never hung.
> 
> So moving pm_runtime_put_autosuspend() after rocket_core_reset() avoids
> the board hanging during a reset.

These sentences (history of the patch series) are commentary rather than
commit message material, they should go after the ---.
See Commentary section in submitting-patches.rst



