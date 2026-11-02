Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626837;
	b=u1rYkhQw+BFya6EDQUcftqpsLIZ4/i09Toj1nO8RdJ2lmr9YanJRmxZa4XTm6GuJjJ99
	 secQGJXD2qwdIxT7w6ZKbonwV5/kx+vERuDMuJltAjrsZUzPWauUtgxaExPHD0LK9LJnp
	 fyKYNV2brAXTkz2Wc0JB02gBGBlXQwZsq5c2PRVlNxGOuHVMVHdY+4KmJzD/5dRAvx8Xy
	 hxRJbM6zYZs5hhAeFlcXSFAZfbr6+6DXb5mod2W7HVOCqGkJw+2RQ3W0RrNSiv3Diemmi
	 o8o0VmzCyh6Hldni3+kEa2WcyIjClHbMSht1qr62gR+0MlRHTbX3MOrosH+NJbph18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
	b=w+roxSwUcCecExo98662vA49U0KpMGpVVxKnzkePnamA23YO8M4KoU19kvncKy3Paahj
	 WhCwHnjYRS0UL3udOXgcNrlGYlkaljMVTwpXODwcAyC4Ooz6sTntcESZpdr1Ajd0SnAXK
	 kMEuX3n8GZ1QHB4cydlMxABBGNIWTstRrcuwyKkJflhLPc0vcGSxQvMGpviJFubvDNpTt
	 GV6i4YTMfO+2B64O0fBojhAP2fVd7cmvAONWVN941pC4xHVvihoNUEi7UjnKhYscuycn2
	 AVxkHWrCosXf4FfMb/FEHM5HJUSio5deYBE5Lv1VpzHW1tsOuRrCBW0Uc+Jo9SoQWlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vuzfuEg0;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD7606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DD7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vuzfuEg0
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so1684124f8f.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626835; x=1794231635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=vuzfuEg0e/+AlSp5CQMLuWfWasBigWLX8d2tuC7hOQLrke9H1N1y748w40zfzFyr+O
         BBfaY6lba8Ruy00rEYs7aI0tVkWCQH/LKdR/cJ9PoKAj60Kqu4e3PG0w+60rkOk7XhVe
         +mbpIr1lvEhQ1kIOB4dlMgnRdo2zXS207rTX+/rlHZ0oGCcKZiy0X3RUziEL5XbAjluG
         szTSx9AznDdgD+u/kc3L5MVpATOzgA6VG1FeZIij9B0Rk4UtgN9SP6oCJyGOcx0mVWQD
         URHkyqzPnRMMnkSNJnY5l3WSP5LOVtnyLINn3j17WPMNEyATYMdIe2gwVy1ZFzbWPyJc
         I9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626835; x=1794231635;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=P9qW8jFwRmQ8dvbfnrKS3P8xdECpHZgbnNKB4X4bPKww+ingpwNWspS0HpaEEiSUak
         Ov2eZ16Q9rj1EpHt5rAJyi8EUkSO32zRM0WcB3KMK01Zk1digZ0bZqah30SwQtySafOc
         G9OBGivJCM0tkSSUuqGdZjXaT7hTvhAfcGLHMJjAwaZ/6hxLb55HWVJfXXu3cH238Ulr
         VfwOyLLU6KWF9gXU5U0zIEncLePjMFvA+VpdOB1yxHpqOsnjFDGQ0YNl4CF5SOy+EIwq
         vPaPQr+xKC75ruuNQYFlGuBwPKY0Gadh/BfNAXcDi3fKrDES2+IfmM4PWeMCBkieU68s
         Ti9A==
X-Forwarded-Encrypted: i=1; AKwUvBySpT7CGDEfVr8viykqo0nREv0DW++ZM4m3/U54vHnUUZsVAcxAJyhAu2EO/QScvz3koVPkoNBM4AMc@vger.kernel.org
X-Gm-Message-State: AFq9FYIjIgTglkEZ0TYdpiYPeuTQZ2l+vC3vh+B6oEMWhKk+JLYFOpuB
	mZNqMyV9LGMgY26GpEt2ShROyoELNIW9Sx2sniRcAuwMzo7X1xRxP5a5CPXlgp+Q2rdhcVgdTcP
	TIgsx
X-Gm-Gg: AYBFou38QMXMN4OYFD1qKbMJ2slkMTMh3m8025vOMAsn54qJZURW/zR//GWUQatujpp
	2TmK2JR+avDly9pbuFU7Z4BQL0pinJQVR/4Qk/DwUwfN3O7WZgx07opJ5unfQwl5aQ2TiixxOob
	KOO4tLI1RZMBWwSfDtK6Omt8FAKI2sZkXxrDXL7YA8mYBG4mK/f8UINCKE9kgI7xQOUud2JKCIf
	0Fs4vW7GoN7gBK+rx7xsX4S0SkgBuy7aPZxT0TQuQDtzI2gJhvX/KpGhHrI5bpFdZuLL+MJ4cx3
	TGpgF481kpLmNHGxJsecrVF3Nt+cVUMyQX8rQ3HS1xSQsLG5RSdl95McGREf84G7fu2mBJaURWF
	VCt+fwlLKHxwtr1hKBmv9+2iUsBV3AxGV6LBobu5Mhrv8C4gfQQOufZ5roFrebHZX1reJXHb+K/
	dCFV/Dq7ALxPyiq/gVhuJCQnrqKG1I75e4Iw2MSmW2OjYjKyuwuM7rMZ3Z9N8hknOjIfaibwZCQ
	j8JSercCHfGZLo6qGWOXi47qmVb/uZ5feq57kEbhtvxJnNR5A0WEtpNFO+TO8F4Q+2ksNE+Day3
	owy00oDaUeDqjbrWCyzofgYFfxj4YX4TNudN5hWXkxMkUC+2lA==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr233451845e9.20.1793626835401;
        Mon, 02 Nov 2026 05:40:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Subject: Re: (subset) [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply
 for Startek KD070FHFID078
Message-Id: <179362683429.3310106.6925209959908507351.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:34 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Tue, 06 Oct 2026 15:25:00 -0500, David Lechner wrote:
> The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
> DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
> and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
> 1200 EVK it comes from its own PMIC LDO, so it needs to be described and
> enabled. The existing Genio 1200 EVK device tree also turned out to
> describe the panel supplies incorrectly, so this series fixes that too.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: himax,hx8279: add vddp-supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ebc6210efd3502c8ce2b1b2740ad61f69188df7
[2/4] drm/panel: himax-hx8279: add the VDDP supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dabbf2758be8f05c3757bb4727f2e48fba4ca66f

-- 
Neil

