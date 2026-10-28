Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205169;
	b=YDuQtJzCyKTbg55EIe/e6EG7QEcbbqlFGMIjC/aTqgtj4e442J3AvMbhX+F4EYzMlZZ2
	 HrN4Idot6T+0x6XTViUQ2J0dowL36tBeL14yZ7SlUmAe2m2C5zL70IL2WmtJ+gJRO5c25
	 a/Lfy0ZbqgxUbh2+O9ZDt775jxD5spPhWxSQHwkx7RJTfjOzeOxJsK6tEG/jAIQuL7GrT
	 p+hTJ/2sXH+6hV5zKFxKQHqKSMP0I4iZ4TiKXzrkZvuGUeoIEARwBNTjUjZKTXHrKFu+l
	 gAVu1Hl5P3zfm2TQu2XzY5wg7e9pUXXEOl+QZO5A3zigW+R5vxvfIyvZSeyirwCjaVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
	b=dvj8AOHl9PGqmf2loHan60MV0ZcbA6RS6RgDGLhfvMX09oogpS6xTN1hUsI/yF0RNU5w
	 VhY4nUZXhkt/LGvB6wErcUhm9oFkkbs/dsjq7iZxfddBwORcEvfUl9sQR3f0dBtKIdXvC
	 57+vc439UYsq/U1ah+D5Ndcs2LRdwIPdsifKX92opNlkml22DpnM+7fv7i05aMl7VGY54
	 wbRFmcbaAfYLDUsN28eQGX4Q7palLboyJOiOVyUmvTxE8JhlgjZoVchMR6hHHf4/9OxvF
	 wOdzF9bRdKZiUq/LUQkl1UHTIk00VOH89Rtz0BW8N2cL2Peqpi0hzMx1wK6RnY66LJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9699606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9699606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c315869241fso188828466b.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793205167; x=1793809967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=eXbHX832eO7KCEIcf9QIePPynNTj3zpEb16xJdYbSQOpkoowvXm2FC7H6N9IvePrjc
         NYQ2YsaKAWrn2bA552yqC0m4jx9nYIEsJ+kAosssFdnCwTnhd1wrP5purilJVqmg7IW/
         9PyvNGGsC/J8INfibywsqgTj/qEsPfMTfKHOw4dM8efcKWBLZMUAodnHQ54JjxrTf6rN
         cUXimDERsjEyUBueSdi1MiLTD5lh4jvrY5h0wazj9l3ROl/0fZ8OLDTM2Vd6t6/kkAK3
         OMu88H+ojqLazQ53GiyqfkVyj8dVS6lmsTdc9R8SFLBxu3UN0Fq7XJUuj66hC7CQ5WNn
         GpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205167; x=1793809967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=seEy7C7eOFyy5NWc2nMtL87kRh39jxJMrtzhO/cle44OeJ5x5dRerEVBro50WqVlGx
         EUZr+cxzYgD35nWYuQpwCaPunXoAugwDoyrKORNZnGwEwUvOMOuew8MVi5qMGgmQjbRk
         dHSCv+lmGsBtwRcCSzJvMWsHQxw6wFxeNUPUCk8VBYmnKG7v2Dfw4gjhYIhx/sFoU5GM
         qgQfEaa8fpNEZB2i4EhSWcMPwYYpQpQCC7i4SytESCVM2YtL/V+aEctQAd4YvZB0pXgA
         X/OwxQ9AqtGfjp6riMwhZRz1kCGAU438xF19QfPmPfqrXUyMTB9+I1Nqg1YgZoWBVilY
         S6YQ==
X-Forwarded-Encrypted: i=1; AKwUvByc5Pf5gGR5LQbRwjL6r6TnR7rx6yovZar2RVJ538cB8bI9fH/MmfBfWfTUAdQMlDyMVTr17Q6ooGcG@vger.kernel.org
X-Gm-Message-State: AFq9FYLRXTZ01q5b6bPK7EUd6UO2RJJn+9vawwaA2ZgoILUuAwhOv9A/
	YupTdjDj4X9PBBZjs9CN8KOSF+Aq0Bul1phKgm5O+LFJArWsxPkmWMJl6LrMfcYb958=
X-Gm-Gg: AYBFou13tS5mvDEzAZBykXxoqtrYOqAT6EdFCj940VlF1XfCnzbn8dCGsb9we6o8SYR
	ETlbBxq6ASwmV7tpSwAAVhW0Ly29Pt3fXw3FaKnlNK2hkbqvRdQj5xKPe8Nl6+djgXdfM6oEAXn
	gvJDjkMkUVQV42w2R9eNwnY11JqKrtOcZiRR+C4Zt8BX7zfdqZgTI47e5uCIvG4wzklJ/OuatNM
	wJtnRf5BvKwnfjye+byp0jAQYnCXVCZsBt0smP4QuaU7LM+LeftT+JVwDSGaPOo4xo1OZ800qtk
	C5rjM9c+AncvFmWI//zMmFHXb45vQ22nCB76gzWcHiNvlBjb/wBhHFbTLWeh7nKkCWxJrDA7oHI
	c95kPIAt+nMIYs5+hXqZpF7KTFEUm1dzZnUHGv8vLGFkOW10qiNRuLYZ5Xge78MxJmMKuwWFcW8
	NFym8TKWaY9cRfkyflfLa7JC24e29ZqtHKtqgZxSDZxr7tB3ZCK6U8QffNA4Zc7N0FO9cG2Y3UL
	xpZL8PNWRV8vAV9Aj4e1t7f/2eTHd5DzhashwQqCX/a/8v0OHvQuF2lz9G0EqicDKMqzJFxxw6G
	41Rz6NrLzF38nD1QOVwfzQ1MR3f/66dutV2Z7nZaE0EOZH6lGopIMXHJrdGsYHoOrVGWrXKNuk4
	QCCKWAdXPPkbaLjFXK8pVy69Ps69E
X-Received: by 2002:a17:907:2d25:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c49bdfd85b2mr258903766b.43.1793205166976;
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm637108266b.13.2026.10.28.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Wed, 28 Oct 2026 17:31:52 +0100
Message-ID: <20261028163152.26892-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas,

I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
problem.

1. Over-read in audioreach_get_module_priv_data() (oops on topology load)

The function allocates
struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
memcpy()s from the topology blob. It crashed on the first load of a
topology containing the speaker protection module config blob. The
cause is in the size computation. data[] is __le32, so struct_size()
counts elements while mod_array->size is in bytes. The allocation is
4x too large and the memcpy runs past the topology data. This is what
I used instead:

	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);

	pdata = kzalloc(len, GFP_KERNEL);
	if (!pdata)
		return ERR_PTR(-ENOMEM);

	memcpy(pdata, ((u8 *)private->data + sz), len);
	return pdata;

2. Slim 7x bring-up: V/I feedback never reaches the DSP

DT changes for the Slim 7x:
- The WSA codec list is extended with the VISENSE ports
  <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
  swr3. The speaker nodes get #sound-dai-cells = <1>.
- The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
  Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
- I cloned the CRD topology and UCM, using 4 speakers, with the
  WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.

What works:
- The card probes and the SP/VI controls appear.
- Normal playback through the SP graph runs without errors.

What doesn't:
- Calibration (Operation Mode set to Calibration, then silence
  played) times out waiting for V/I. R0/T0 stay 0.
- I read back the SoundWire master and slave port registers, the WSA
  macro SPKR_PROT TX path enables, and the DSP module config. They
  all looked as intended.
- With the SP graph active, the amp stays gated and playback is
  silent. This matches the calibration never completing.

Question: is there anything Hamoa-specific on the VISENSE path (din
port numbers or channel masks, the macro TX decimator routing,
multi_direction_codecs handling) that I should check? I can run any
debug patches you want on this machine.

Unrelated noise: SoundWire parity errors/clash messages appear in the
logs, but they also show up without the series applied, so I don't
think they relate to it.

Regards,
Fabian
