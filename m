Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214201;
	b=PTShG+7/QZlUf7VC26T5s3JqY3/2oL8OGbNJ+ny7Dw0MbYdaiNZxyrp6jEcnn/t2/UK5
	 IzsIjtNoSIi9G0ERgiR59AaS8ZuUVUUZm5R93LUyRUau1BB2G7k6r4vqtgzBpJj4lS385
	 13D9pVOzKJHUXyOsVJihHCR75DUiiOj82MB9WrJZOsapQbDsv61Nhh8dX77CiJJMsgTI8
	 VnBARTkbPeg0z0BX831Tsuz+x4KefCZBaGXuIyx27Z/yV/nCWLEtNy5ROaJ6N+ckppYxY
	 psCavmz6xCSqGslQ+0cFnAr8MliPclMQ7GGHyoI0mrBNHJgnA79aRUFVBWSfI52z3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
	b=Ege4tipdFrI92CY9fhpWcC55mML+gSxoDqiU0onDqxc1VZvWqI6EgolV786k/lEGLcHd
	 Pg6HtdUq+00EmbWzd5Tt5GoKsIPuvGO67jFPZu+Bewyahr169LnPlmPmk3s6ad3wMXVY3
	 t7cfqd+D0wgxV3+wf6p9sxmWHZlXfzYBAYxbTgeil+NKXvJJMSnx4wf14wAwqKH25WTFS
	 2UXOmZDMYNgQSUWx2NRD3/ctgtInU2/AHO8ZqWknp60iXmk0vjci5JUnWDCGfEwffDnEP
	 1pWhbvjYGrJURtWgKf8OelzDiu8mQEl5tywLmiDNN1IHiX/0JycTp6n/kYlE0+BXolg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OnOd9a+4;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7F60A383F
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A7F60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OnOd9a+4
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e4831c028so664663f8f.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794214198; x=1794818998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=OnOd9a+40cUTIUJd/RPKN6pI46RX5PKhDsWihEr7CJdmnIghpvKcynZLfFAdlmQLUf
         CkKPJvCDmZ+K9I92oLjkIP6Qegn1s/vMzh6dzqs8Pf92kRp7Czy+deTkYb4CrUeq+Nmo
         xVgmWZUxKhklinLS64tasb/WZSjPVSiXXuiiwOfz+gGyAn9WAm62TiYODWcJQUnfTMcf
         6Pu3HRyq++/t2+otcKIe0MtZVq9fATorThVCebMdl2D+yvja7OHaOWHYeK2/f6B3IOz6
         JWCSOP69cmyql0lrJU3z4Va67GGcrql04GqBwHbtt+v01AzgxHGSjC5tP0hOKjw21+F9
         J9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214198; x=1794818998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=RUJpNPm1cMKtvUN/ZHKPWQAPmKn/YU15103sDqHP6Et/ys4XcueSeQ8NdK37eeuPIV
         OBU4BvE3HD/cljL3h3JcA3AkMPC6mardWDGspNzMXb7VcBpbK8rtUy4TmgLensE+OmJk
         dQrJA5od9yAnliztb0IuxAkN57mGmhvLKsprs/cDo5vIgoVMYXp2cqytaSxldYYjrye4
         nTMDZD5Hms8ixY/HdagqXkeNS2+INeS/cVtIrl18Z1zoVOoMmXYHE8A1C1d0rVrJfgHX
         zo7PrMPP1VJoQrR84+DQ5A2KvnwW+mf1u/4M99y211rdDtRUBSwrZ5qhBCw4vSxe8RGe
         hNhw==
X-Forwarded-Encrypted: i=1; AL+hErHFtIHN257KckpxVC3R7aqd1wR/3JTQsbd+5DJg8ZFeVmJy3Enz7MlM381TT5KSD05HdLOFSNqFsgdT@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pc4PUtTw+XcopSpLcZBbAEj3GlgJwsI2u8SV/gJrLlxZFYwX9
	Jc2S+ea6nP/CEEdp1OLlCFPC+XSw3Fd4ofiRS5ue/lNcC7YSYwbfB1q0J652EPRPUno=
X-Gm-Gg: AYBFou2sjmHBo2RYDxVAxYoKztLj1I+534LqOrohKNrsW0tmvPkU9XtjexU4G9dNo6T
	ILanW9PODOTD0nm3+nhul+0V747iC0CMPFdxsZo13/7D6N0iTYyghBaD2RNA0djk5zDENIy8Gkb
	DyccqsowFUtvFUmtDWuE3u0OJxfEiS1wbeOJCl437tsp4gfcQyROgi2WHivrM27JXm9s94VWEMq
	+F/UegteNfsRphk8P2KNF91Cay+4S5S5BUAe+xAkYsLUvY/8S81bht7ZnMt8a7mQe2wKj1DYUpM
	8vo/sbeOCLelayhSatdc0X27Al8G3wZM/CIpkOL5rjEhSlHY8KRS6BkN05KuYU4WYs8m8AH1Lbx
	3Qz9rDqAqrL5ZBlBb/QRr9nT+hNgRsy3Z1KXuEnxVamkaxWZhHeaQyYZx4IQFdcW2SmatV2WN12
	uhjB4kWggGhfwx2jqHNIfSZpqiBQnmZ+AoCDVt/75qzKJDiIAyJxh5QudSILJ6TY6mP/L4w8ytb
	2ZoLm5574c6PyQNID0ITSBpY1vmP8sErD6mF3KoNDy46/v3XgVy/TNmY28ig+609aQis93li7Lt
	UTq+V/OpgAb9kdA9j7gCZVI6mzdWyV86Ods76zt0uzuQwbFbpeoxyiYruW2jyJxTkNL/FDp6PQF
	eD+/lgAekm4sPOWVkAf/Yp+N3zA5VF0dcboQtDJqFG1x1XQ==
X-Received: by 2002:a05:6000:248a:b0:48c:4442:54e with SMTP id ffacd0b85a97d-49584b5afe0mr6225635f8f.30.1794214198288;
        Mon, 09 Nov 2026 00:49:58 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm9069465f8f.31.2026.11.09.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:49:57 -0800 (PST)
Date: Mon, 9 Nov 2026 09:49:56 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avGIMja1yTAkG2X8@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>

On Sun, Nov 08, 2026 at 23:21:08 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> > The S7 firmware exposes clocks through SCMI, including sources needed
> > by the other clock controllers.
> > 
> > Define their identifiers so devicetree can reference these
> > firmware-provided clocks.
> 
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?
> 
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

Right, I'm not strogly opinonated on this, I followed the existing
Amlogic SCMI headers, but I agree the dts directory is a better fit.

In v2 I'll drop this patch and add the header to
arch/arm64/boot/dts/amlogic/ with the DT series instead. The examples
of the two bindings you just acked will no longer include it though.

Thanks,

--
Carlo Caione
