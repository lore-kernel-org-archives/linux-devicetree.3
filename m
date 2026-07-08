Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA734A795;
	Wed,  8 Jul 2026 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783539271; cv=none; b=OHQXvalWzZtEqGvi9+NuhCYpC+Jt4dL9aqaBpfkmScumKbCEENLPltqouDQqXkBxKwYzawYbjd3uJewOdilz+pGCyYlmKie2kK9oNVaqWoUZyPUJjaNw4Rh8ZFjxkKN4+xoswgGc5HMFgkWzMVt48Cu1FRdOl2Ukef8MreEWOhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783539271; c=relaxed/simple;
	bh=gw0QeWxFxxyik9znz3x8N+vdl28S7xv5x7VAAQyv1PM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LUo6H24Bbx/AvMlSRrKYFF3O5GdGubYxn3mwFZ7gzMdLN5mB9ffnI/cIOENNksheXRrb6g8Wr5xut2O5hAFWmWDDKEaUn0omVSMhnK7SMsKlCKd5PqCPN77gct8kx92Yr5WaC25WBZpKnb8D5WJ3S+eh0OnalPKtq67DpYkLu5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXgsmCr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXgsmCr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B90A1F000E9;
	Wed,  8 Jul 2026 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783539269;
	bh=5MYP0bubzDlJe9Hoix562dbjWYH5t27MyyOtIckOjXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VXgsmCr6+1zyHKnhwPVpRMyofjDwtUrpKfW4mWrHLHBd+7M1mSJ7QIOMlRGM4VuVf
	 0ZrkL4bKD79HDaTlmDUUT3zNDQ28iUnkCryP/UOUnYOcSj28XzuaxL+OqfKzpDYwdO
	 8E+5e+wDLoWNPNYG8RfmUBMzI93Cw3ltjYiU91dioJdfWbD8O4Bz+s0TfJYo1Q8Hc3
	 VW8u7Zd5XQAWI7OgOOHBio3yWlyNw/lu5IDeuKjEujFPrCVVQ9h74JKYG/LnSFIb33
	 9WDj/a4o7Oy4276ONxZuCiOgmrX6GHS0EAOaO9pVx5uwp2edb+6imHXBSgbNq4jHAg
	 JgBv1eiwgyuOw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
References: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add
 support for MT8189 SoC
Message-Id: <178353926731.1746530.6791830888599668019.b4-ty@b4>
Date: Wed, 08 Jul 2026 20:34:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 01 Jul 2026 17:14:06 +0200, Louis-Alexis Eyraud wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> MT8189 SoC.

Applied, thanks!

[1/1] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT8189 SoC
      commit: 0a87570f42adbce6cf4b6a74158ebac495859f35

--
Lee Jones [李琼斯]

