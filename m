Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467648BD3F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997525; cv=none; b=uppIeUZFRw+7KfFIAxj0ujv3AVcZrhjcPJ5r5h9+Od+W6Usi1GMs6dSOxd+Z8OhDqoMq3VJG/xa6fezJrXjXJYhEChpbeu4FEMFOXu3Zzed9kvakcKPZ4tt7S86+KwDkthrKTf3LP3czwxPDAby7TaGxLfmXkNO+bTDDwceOTD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997525; c=relaxed/simple;
	bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InO8GvWBLXsV0GPxTh3AfnDr2TqvB7AI89qvMbb+6nAZCi5RXp99xABUfaUBupQIelMIGdPzd7edSAnYEtRcq7FCr1uHmow5270mE2Vk4zY1q0I5vpHR1VrXpZIVk8Lxz3SpTIYY01TU/uEc71M2b+ISltJLxRiTS7+kpKwDwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QE0Jzfr4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QE0Jzfr4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so44192285e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997522; x=1778602322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=QE0Jzfr4ghC+sfz3pY6AwdkOy/JkB38i5QfaYsWWqBiaQC7dbrCwqAu1tuMv2lQ0II
         Osz/LZPWzhFMpCbjvBr9dSfXGb+osmuomdhRvAQ0xJP6DXMQK85vkkZGKMjKxeII88Y+
         P5NjmTNhairu5hV8QlgC/wQQj3/V7AEKUM7uSoFSTePMWC48J+EIeaZUI+FPLuuQ/4hj
         7mKZYr3Zz7QEWQZXlbc0+Wx8bQCHwWU68BIwXJ3hDsNace1ah9IhoPXnsmD2zQPbBtAQ
         GKxYlK/WCgf2QfOgBubpQv/TrcFaFvkn6eXPUXhzjxmSugsdRMfBAr+LBupBB4YgfTgm
         NLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997522; x=1778602322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=HsLNXg8o6Trf+Syz8adCRMP4eM5IutZY9nZH6QYCRi0vQs2gKALNxV5TCCG6VH3vBv
         fbRpxKNXRG0btYj2x8aIeCvTwYgLC7gg3POsyXMNbvaBRzlBcyasrHVVgrjSpR2d4e18
         aqn+Dbs4RMvw/Ra61v2jUrCnNv5wih1UIps7aJbMXShlIBKEI8DjJfl8TisrqTMu9Adc
         nP7sLZ/8RIytK+zXj4jC2V7H6cqTixG4wAanNKA4BWHC7uxRroXZMSVI5YPoF/v/LUoA
         ASBTYZq9kjInEvwdhmeiEbtz8zNdbEleW9ORdu1sXXAbK4KfnmkRYluQSc+o2ovYoFDw
         8+/w==
X-Forwarded-Encrypted: i=1; AFNElJ8NYfEqw3VKZX5iQVSkqEdUjLE20vERc5W8xv4WOy0U/4MPPAqZcMoepRMXYkIcDHfuvozlL4UqePRj@vger.kernel.org
X-Gm-Message-State: AOJu0YyRE0V7kYOBPdsgawcy/bS+T45DkPISm8oPUTRN5hJZwgI4WEe3
	4L/ANcGnlXeDZ3lZt6IoIUW1TLZzLJXQAdzMiR7ubzdzx5+C/s1jUFYL
X-Gm-Gg: AeBDievG9hVZUtKVLDFEHewgQjINwXHFBeAEOncVdo7yvaY4bwK79sUwKCIvLoToK04
	s+Lly2kH+zAggg3kLdrJd28YXlIXUVuOIUvWB/BM50OZAV4fJ7F59n7SK6HOU0YgJRqi8myiOuY
	Pi0l8CdA4Q9mWMBLHDNa32W6KZt/TdfhCjyzQ1+qGA2MlIXhAZKpxVu9XXPOAmLujiFVtWP1bo5
	rPedjtEYZ16ar0PzPGaAx5EUMdx8wP5xYPruGe9+hyLdmbO6QXcP8OLO5OKD8smuM04fd3iWZeh
	U5x/NzoG7eN+eu2gG+783vCHLFJunddbS51WhvXALBqDQWVkvCp32meZw1UiPgmyzAfTzaCP1u2
	/+4spLqSOSF/djKFJTdUdqlhMJzgCWcBSE+vLsjvD2f5Ew/nnBanxBt0yX4m6b1/bqeobLCEvX6
	wqzY3b7rpLZgmF97KnaKWAw7hk3E47ieRsM24nTF4gXYd8XLkwCoeYy/JXmxY5Ljk9F4P4j9b+N
	7F5qgXCgU5o1r1SCdE=
X-Received: by 2002:a05:600c:4506:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48d187daac6mr60424265e9.10.1777997522093;
        Tue, 05 May 2026 09:12:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17710bfbsm26884555e9.7.2026.05.05.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:12:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count
 for H6
Date: Tue, 05 May 2026 18:11:59 +0200
Message-ID: <VwMu5tg2Q9-HLmYXaV-qwQ@gmail.com>
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:05 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
>=20
> Add the missing IOMMU connection for the Video Engine.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


