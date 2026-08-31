Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAA41B8F8
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199882; cv=none; b=Tzoaf7E8rSkPJWB7CWFUDgSTNmB7XvRj8zXH+C/VPz/VwiIUb9uDygVkwMrj3X4fLU9SbBJeTam/J7m38G2KOAt6/V+RBvwQdz30F7amLCpQIeJ/X+dFCqjIaxLPqwT/ZohGNAogpJiv6nNuy0od7Hx0pE0mpsIzo22amxShFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199882; c=relaxed/simple;
	bh=degjQC+zjZgSfRxP9sOwOQK5Cf9llwpDDwc6foUp9Rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Br285R+mJCPAqlZUihe+iLxbej+roZ0eKjYJAQJBa0j6HiaqEksMRCwvUOyEkulxluh/MpFRzq/LJBXjI2SiOxyNICFlcXBQR9rlxUzknwxHLe7xxkRwpDaVJn0SC4TldeGj2BEl25B3ediC1HKkhcGyFOiLPiwNpJQflPnPRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LozW1NON; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LozW1NON"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71ae3455aso59417655ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199879; x=1788804679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auz+mSkwNmUJblKIK/SlZzO4mv+o8fMJykvfsBMXi1U=;
        b=LozW1NONM4DwW+QwagEX73asol810NEGPGl9L7R53qvFyqRksJeEMlLjwJF9xstCry
         b2VgKfqyo8UqsMfzLNM58HLFfRj5rnzZYxp9RQvBCAssXH40FeGr/KoZTxtCzAF7gwrD
         gBRxgDYwEyMP7Wa9BTa66ciCwsV1fuEcXWVLZIGIlq6ifeE4hBc9aLrHrOJV9kJQHUQQ
         5eGVtDmdQdxkDMhT4fuPWFGtcTHcOgCSM9HyGqWVw/QPb6M8snzfOECeBDj8qYsBROna
         Lg6FU2CIeCslLnUCd3FoIFm8+d+UTZOOlo+ys/RzKX34ap41iV4TC6CrmW5qckaYLNqk
         bhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199879; x=1788804679;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auz+mSkwNmUJblKIK/SlZzO4mv+o8fMJykvfsBMXi1U=;
        b=k5yoBSm9MaFiFwqsWyJiNMrWtOzEPvKCLQqr0FhsdliMCmbrbPHiaJoteSmgvnTlI8
         1waXAuw2dP8xxOREj0dUj3LbrXkZmjLwXh0OteYTaognNioxc90vqci+IOENEbSgn0zA
         q8m3FIibwDY4eeDssmvYHQ9+eVzwyvUcF6YUmp5JTpjlCMe/e3S9IJVYotxBJ7wZtygU
         Rj3/xcVicjKPbDySKvEBvXyDCWl9uuU/GpwutUVhuTDeQlmLYkj0ADPftTAQuD4GOLUA
         LIUBDzOgOK6o6NYhwqpXg7sB7U/eS8K/1FJUy/NeCOwcaeHG0n6BhwCPL+UnhTGRjHJT
         baVA==
X-Forwarded-Encrypted: i=1; AKwUvBzqrUXRMIXq+qIBZyQeLhhP2Zzd5JgxTIKvF9KCAWnKTbp5Cn/sDWXBYmlpaFpYkA/erMOVzNjC4/xa@vger.kernel.org
X-Gm-Message-State: AFuF++lOdwcD60gVbkD3jS0wKS9GtsYfkB6Mj8hVQvu9vkWw3pigRUES
	bjfmQc9LcDmpEJXLrDKRkJx/uBtOXv86MdnhpPnT3awFRcv3bUn7t9oGDw07tIO8Ky0=
X-Gm-Gg: AYBFou32QolV/CydIOnJ466wkaA5dXUhDO/bVBX4GNBqIu6CY1P3Q9qu2aQ1yWbsyad
	026/HVXbTg3ycBJv0Q/C3liYQSZT/KqksF3B8BQ29Vd9vWXYPC9lw9P339wTJRqibfFmj7GlDNy
	Gd5gyaP8aMCQrNwqiS3RiNPUF/FbEE8Rdt0+uyi69iA5Q8MKaCy1UJi4MLaot7snHTWk2YwgOiq
	Xa+7xZW7pmQMLbkeot6ZIZpcQPQP5JwE/lIMJbVEMANgA1yRZedsy+Idci0r2epTrScuYlGyHQk
	qud/uMQfmeFwNKTbHDZvdNCGqPRaX5SVS7vQvnggYzv+68qxCHk83hht3nyfHCxUyXUe0st4MRz
	r8RlKkARBK62ZMKWCZkHWqMkgTXuMtunKVL50wEBUUpOy7zO7JisZdbBuSu07R7j1LAfDjf4DBv
	cV237btow6Ogb+9EKukIwkyLadT96fvE+zuCJILayJVQT751nHOgmaKgIIfQ==
X-Received: by 2002:a17:902:e74c:b0:2d8:d4cc:5bb2 with SMTP id d9443c01a7336-2d8d4cc5dacmr273920805ad.18.1788199879349;
        Mon, 31 Aug 2026 11:11:19 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d7594ffc94sm39417335ad.5.2026.08.31.11.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260719133730.3551691-1-egbostina@gmail.com>
References: <20260719133730.3551691-1-egbostina@gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: input: Convert TI Keypad
 Controller to DT schema
Message-Id: <178819987834.2869653.4643547927480344616.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:18 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Sun, 19 Jul 2026 13:37:28 +0000, Eduard Bostina wrote:
> The first patch converts the TI Keypad Controller binding to DT schema.
> The second patch updates the OMAP4 and OMAP5 device trees, which is
> needed because the schema requires the matrix properties.
> 
> Changes in v2:
> - Added 'interrupts', 'keypad,num-rows', 'keypad,num-columns' and
>   'linux,keymap' to the required list.
> - Dropped the '|' from the description.
> - Added the DTS patch, so the OMAP4 and OMAP5 boards still pass
>   dtbs_check with the required properties in place.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: input: Convert TI Keypad Controller to DT schema
      commit: 6980da9a69f59b3d061c317ed12d11fe4aa90386
[2/2] ARM: dts: ti: omap: Disable keypad and enable it on the boards that use it
      commit: 8d36324171f982c8e1d7f2df428faa5b05e7b1d4

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

