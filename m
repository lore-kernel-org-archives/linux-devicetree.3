Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778074;
	b=h2nMCOiUx/63Qt+ACURaG7+L/Er57olcmyg0BLJtw9Js/Q81iXHabvR93vYOIyN5fDiO
	 azFr1tdV3t/YOnmyHZvCSV2g6bAkxJ+WLlQbdTXP7utx/vgJrUWnvfvFFZq/g4mSijjry
	 tn+iP4N4l6dV4L5Zf4Ax+3VQpdpeU8L/i+N2e8k74iciKUHTKYLugIarjHZrIu91Ql0Fq
	 vfhUj+mjs1Z09ArkqIkzH7DGgBX8WCKl9Q5p9cZbW4bZd7tJKqtvWTBnQ/M0UCppcqRiv
	 mT5q1it+GNVVkWORKpH3ZXdB+NtoHCCsPnyheT7pr/noA89iQckuFJJmrfqIca90fAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
	b=BwAc1i6iAX4VSHGBywPH6uHgr21P3doLSy3LKHQLUYrY7mawHTikDDWa2XBVUQf0RusD
	 GR0JiAWCbJrQojjPYmmXZY18TXSKF2JOCTpWeFTWPjBwY5Kujg9QKHv4QjDJKJVBUN/rw
	 K97BQS8isdIAtgU7o5FiADMc7DCivxRVwykVEyd6T8hTMNJOuZKQF+IwxvccbUCfPNB46
	 vWe6SBfJKA995WfkQx52dWd4r/wP05Ihark60u4+MVUTXLU9KoAPydzEzQMTHacSAswUU
	 tvOhPjxq0ymSqr95LVzph/nLxJ4SNM52fmUI+A1ttTpwjGaZk8NpwA62JIQhhwzbC2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tsxRt8q9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E76606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E76606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=tsxRt8q9
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c24619b19so1812218d50.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778073; cv=none;
        d=google.com; s=arc-20260327;
        b=ZeAR2Rg4Mu43rSnefLBZXU3yqd3foeSSBUECEhhzhqO60+Pa6khx6t9U/Cwaj5ANoD
         TDskbP+SwaddMa4014lE3mzoN7+C0ZC2W1GLs0+7sCom4P+X6hflhepyd1GuBf1no1iN
         yWEQ3c1w6CZ/OSyc3ZwUXpl/nbdZAyB5fsCUtMPZ1TsbJyQktnx4hOzGJGTdwS0TXYwr
         D9OCIV2AH+LP729Z1rjC+hwfn0LqiPfvovOAAi5Rw+y9avkXFFHjth1vVLA19Vmz9Bis
         XwCenL9WHNl6sASxUYQWonGza7u2ZodB/8ywXlpSmcNHJsUTlLzjsQM8f6XgvZ1mCeCU
         KuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        fh=PrFtB4SPDFp65Bg/zRsrNl39T7Dyi24jFy+X1bJQR2I=;
        b=fIk6q7B6eBqnckCFk9mBrZv6cKvbw8sbUTZFZvEYOnxqifXz0JIUr/sJez0GgIWtEo
         0OAPk2PxoH0BNN97jTousScr/uMd5itT2yErw4FLDOY2YK/Em0zjRSfZ1XNziIQoz2JT
         F9d7VJpq//IOskZmQQqfmOTpsQ1/vE8cho6aCWd6Hj1DgDLApufvgTm9McFTTSc4KsZV
         3/Lfs29txUMwAmpKg7WD7No5HyC8DSewK9yzBJt1k5XP3BRgr4MxE1lP3ui8w8gWkP3v
         4TQdQKb1LjiOSwK3U+2Hn4lebMCACa9JlV3IJ61IkrpsJV6V9xaHRn4/KulFC+IeC6Jj
         r7+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778073; x=1795382873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=tsxRt8q9f0KX90Du1mkVtvnIrRJ91uI/VDkudcdAb4V8v3m9iWT1DPO8h52T4feYeR
         gJHCu1MOi8ezNmQSyvRRmw+eP4SzGDbsdwIu1UKcU5GnAf8Rw51+hm913Z9lLSkPjU4a
         F+8xa2LAUUZ7Ie6NsOyzXVGow6N7RTLiXslEkHL51fjIqh1hpkAkrrkUQpOVFXzrgtp1
         QvmhwpfqFOv5Xc/U2SBheC1k1NlGmUtIak/CdMk/x1rXdlsokyNtv8rkABKbfvyt+Sq/
         5er2XsQw1/H9jxgizo/gBcIrbLm29KXVhWrPII4KUzmeT9WNZavCUFrq6ZCj5YQYpFe5
         bvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778073; x=1795382873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuV/2IiViiua6vwxy0Ev/3V2xwhpRAL9545gCJ2FG8g=;
        b=oBq8Mf9r+DgmVR1D1B8KvxFtmNB14lj/L5LMZBmqZ7YVxGnJUcsmt1nrnLyugrTF0g
         YRqJn9eyHwTSrhCYDiUNonXKgFvDlFAPyUzASuH+lxrCK2yXSd5PGXgDphghaDn4buGj
         aWJW8BhCJu8m682L3tEVFKL4A1vrvXfQXUjRQsdDKpLRu6k9hbDS9KHyr2H4rA0ENfs8
         MTKFaa5m3P0TRX+QJaQpfjmwHqJ9nfZEZmgZferXwY5NOcy7S+pfl7fX9O9k09U3dlMl
         Q3jeOlO50Bf7O4UJDulLzjtqtD8vI9E5NyDuuKTDZ62sK7a2Cw+fGA+avBveuwMMz+uw
         YSTg==
X-Forwarded-Encrypted: i=1; AL+hErFmHcJBgivGSEOL4rkUa2Q2bC5EcbeU3XAbNP2K2BJtogrhVx82R8w9wIRHUeIR3a5WpJLaof/gafW2@vger.kernel.org
X-Gm-Message-State: APuU4Z+1e2kR8aXGswM+UdmNt78/beIxe+LPoo/1ljtYV4oflUW+32Ln
	FJ/oSYc5WlI1qFOMs5fNWvuI9r8Fbe5iWCvoRM/3VniMpPIDLZaPGXTJKiLhAbHjPZKbyPhaTyH
	mhwsKxUcsIL3CcGtF+eGx56qPSscCJnE=
X-Gm-Gg: AZFdTZfcH27ax+H23g0XeaI409vpqHRTg5VeisFnhaZFC/saF1eZ1nYiw/33uy5MB+W
	BDnsY6hg/Oj3GiUh1W2jZBi80/34Wj085T0m1h/avja+jsw36t0RVQv32nUWUNLaH4lENBaxa4Z
	rBGims9Zz45S3NMc7ylf60ebhBtc9AoAvrR44BlqY0gKkEDg3GEqfGsUFjc4EACJVsETpwb23Xa
	DBqZ9If15kBj/z9UJ8q3XOZDsLxy6yC5ch0OMgHwEN4GE+5S1+3zOpz65xsJudY/22nFlrQOX16
	ofQzq2GT5MKjazH7xtlddQacNIcldTDAsV7moR5H0DAUsrFz3IsC6EpB4FGPRs6KuCpF/XAjTxe
	oVi3HLckJrSUnGGSxGvzJS+Rve+uVYSGKJ9dW/QHgt7dRxFHJIKUE+pDLmNS4cO8BhR7Omw==
X-Received: by 2002:a05:690e:130e:b0:67d:bcde:a150 with SMTP id
 956f58d0204a3-67dbcdea64amr71968d50.65.1794778073162; Sun, 15 Nov 2026
 13:27:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:27:41 +0100
X-Gm-Features: AclHuK-tHWEVaVNE_O7wlDFFBv_6XVrqFZ8dhMwLJs0OnAdbKC_ynIhtYeGD0qw
Message-ID: <CAFBinCC-R=apWQ7729NueJYSi9d_pn_z9ukyFL5qPMXe=VQqAw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimi=
ze
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
