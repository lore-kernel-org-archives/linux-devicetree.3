Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38C488223
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940305; cv=pass; b=QU7YOaP3y6duv9/3aY0sgq1jDwuH8vMbojeDD3iSgAq5Y1TUR+jkj9Eg480ig3coXP58u5f94fgD+uHOzlLeE3e39DxjpnhzvoFbr06rV9zdYnaUDJvlGAaWJS07wNFfk2v+zN/bEis/fJQzhlE/VZr083tlmioBaA7acIlkV78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940305; c=relaxed/simple;
	bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAe90jbHV4fgXpen5vZwB0tA6qiiR9PbW8r8r3ASpaP1L0K0mTPph38eXH1tMit4D/NgpCQwg8YHX24HvMfKYWIcDpboU6tMV/qfihP1R3onF9OEHhS5q1I3kWDYnPEH9gRJUcr2xdt1nT4ZLa4N3tnb0Su4+2maJ3i7h8qKq0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efqCTgDg; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efqCTgDg"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so1671686a12.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 04:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790940300; cv=none;
        d=google.com; s=arc-20260327;
        b=cJgQfEKq5m0k36Lxid+EITCc7K4CLKekf0b0sOPlJ5Ou6xY4AWmZgMexBVQGP6sVqL
         Pan6bjCy2VPGjL6ZGReHu5KkXhFjMVbu/iIladb/Vjx2L+D9fb8o3/b56E7TIkA7P9ex
         DfTZaDwxppZh5ZZuoQ9vU++Daobd0bxW4aWKArYxAVIksxYlY/0/QFsShk8Xtge1ZiZY
         Hl1XNxHCB8Gi+TjeR51sMoW6rbMgpIGZU7g7CJZvsQH0Q+dpQnAQoa6luQvPeBVDxCcM
         5cuQKlgKSnC1fdSiUka8sfi9J8SSaZ5xs7ZamXPFu/6wGqHXhIdw/6IXSBTWOw89f559
         vF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        fh=Ri8cRa80DQhRRZxixS/IlQc4EMaKQgS5DrTj7Yp6mtg=;
        b=aJz9lb7xVRDWI8vhtAM+AsZXuVAxzxRqvqgtTrfdHvCwJ7rG5+vpVwPsQ12atNbUMz
         4G8B70v4nMti1SmNP0odqM6pSjsFN+2z1+6nSOMKfcqsvILSuzHdhRxuSn6ZbxN+PbB0
         wT6Zk26QMxwWep6r+OLD+oGPEXFQEL0k96tWUR+j3Hl/bZNSpH2T+/9JM3mp3FSi6QAM
         e+Na/qEo7zi9uRXIHOXfytTFQPRseyktQrKfxgBPc2DTgA4EdVRzW21FewJrS7uGU81N
         85d/mE/B1tiBR8gCRwWTjhCtIxrVXguv/iiWGWJzQjPNFKNedwQcdazavENGXSafGl6c
         w+NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790940300; x=1791545100; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        b=efqCTgDg+rP7HorfXfAh2CddbMB3IpZ3nM2eASkyu88plQ/Icbem6nxQxZ8g8Nmis/
         O3bQuprgqMODpxzcmS+8Q06gJB5ALqDCKv/W8YlhhtPv1FimY7f/u1b4Lrj3401BQa9J
         y4uJB4tof9Axdt9wD6bD4ORqh6EsUjBvfU5Y1AenE60iB8ri7iibPNnrozPrTVEKQqdk
         4dPbKKBkT507HvuE7BeJDisxLIiIOxm71GCWLYFu141ESNal2XIbkd3U9p5tplw3VrEa
         Ni5lghwXSK7j0aOP4lbsgVBoOxDLiYb02QfpiK/K03IlSQUYsH6m4FKD3IWN/oSvXIaN
         keyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940300; x=1791545100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        b=dnGxddaIphkjr0eXmYxA8i3FJmsHrhexh24IfPW+mv9Grr1jnT4uGzDhZk1rujQaDD
         ZTp8asebnDr9kOo5wjlyvReyPONLSUVvcd26H90e54dnY9gO61i2p2OnyRNhkUm8s1Lp
         aOv0ACyPHoxxKNNWYNxxj6hf8PkRKk6GnTkZ1VsPJPkNQJZ79T92Ep3Ew18pp6Jvm8O3
         5Tn9JIsO49iNpQEg9XKXIa7yFFgkuz7GSh1GCPIqGPTF9xOy+i5iJI3rUEb66PxaLqZa
         e4RTuy6y11t4dBOLdFN2KeOo3+5ak5QgfA/BidfesI5eYSMk8FmSCEVWsMkF+wXvXaCf
         DdRQ==
X-Forwarded-Encrypted: i=1; AKwUvBze72XnRgP7CVcZ1O2j+cQCTOQ3N6CZiL0DPRmzacAd+C5w3pOVZL4hDPKHwcfkXxs3hvjuDRjhOlrw@vger.kernel.org
X-Gm-Message-State: AFq9FYLWD//6nQMMAt7nYLfRdV9EucDBhUtcyGJPQWHcIuPWS7WXN9uj
	Tul5Cx+A+gvGLwYLZI1DBXWYwZNUvazDWTl6xzlAe2napZkfJxubbhXM7w/vgV6Vc0gqCgruaOZ
	GTE+++jvb7pYDVmzxPUFMLKo0vKmfjnhCUT9mhYYH4A==
X-Gm-Gg: AYBFou1Z9rPX7JwZSvM5n7Vm4HoZ9niIBKHKCeELUQHS6eXIMdjpehj3bgw+Oh/L194
	BhD70B+uMu4G9gU/DFWzGq7nikwSJm/n6OByeAGuF8AeLrpgLACmTxrgkABRyB/JgZ7+jmyZjpS
	UTtY/EE9hcZZm/wXcHewR5e3/0DSxMXqVfQqindyHl/thLBNFwK81k6yh10hONosGrMW2uilpKY
	SQqKK0F8luhhllGRNSuN9qF/L2qncmMnFcqu5GN6RvT+5ZAPPn7GIhcB+CW9AOt3TLtKXBVT6nB
	6For7oPq5GPVh73KKITR/eJ10ZhUucBY6DUN85SGULv+fFl5trIHDXoY6sMKbDQON+oYeu7ev5z
	thCWm9s4VrugMB346+V13JkjH
X-Received: by 2002:a05:6402:13cd:b0:6ac:8dce:5a86 with SMTP id
 4fb4d7f45d1cf-6af9e322b6cmr1463693a12.23.1790940300400; Fri, 02 Oct 2026
 04:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260927150938epcas5p33b7d0495f8d9a8e84bf5f09c66e757fb@epcas5p3.samsung.com>
 <20260927152738.3673504-1-alim.akhtar@samsung.com>
In-Reply-To: <20260927152738.3673504-1-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 12:24:46 +0100
X-Gm-Features: AclHuK9DpXDu6p9otQ-T72J8vLpAXoibGWPs5vMvpbKJgOwvaV2nsGKYn1-NIrU
Message-ID: <CADrjBPpG1nJ0Dg1jXhqLoR_dnRP+N+=QbYeyW8GJV4Xr=od1CQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 16:09, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add the 'samsung,exynos8855-wdt' compatible string to the Samsung
> watchdog device tree binding documentation. The Exynos8855 watchdog
> nodes use two clocks (bus clock and source clock), require
> samsung,cluster-index and samsung,syscon-phandle properties, similar
> to Exynos850 watchdog implementation.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

With Krzysztof's feedback addressed

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
