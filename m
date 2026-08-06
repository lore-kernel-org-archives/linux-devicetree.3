Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15824427FA1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007374; cv=pass; b=Z6t713/9NIRZlUTOSK8sqLmOv7+ilRokXKKqOKi1YSKepevHOVq1lvFrjKwgpL/pPEwYr23rdgTYHAYaYdehI24Ymvr9U29+jLrllzodrkAiSRFlkLUrOYWLp48jVj7613z0ksv6U/C8vjL6mrNyzVGQzOcXVlVJAE5vJCN5dZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007374; c=relaxed/simple;
	bh=hNBBlHDP4IyrGb/3Zb0p9LdULHZUo8UTCuh8b32cQww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqm+xMmj07MyLQHIYggWZaTiCV5ZEc4B4KT7u4faLmX9SUmBGS3Dmb7OGf+PbATSmXRXd0tVNYMl7dCnHNy/zp7JKOxMAUQ4X9pbU1q9jD048OhTnDfuQ6WlT1/gUEZqIMUgRfXO0to1aBdqCs+qk9lvNJdr+clR2Rvg+d1vpn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSJG9sHp; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSJG9sHp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2022323c37so256302866b.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007371; cv=none;
        d=google.com; s=arc-20260327;
        b=flmdvKhoQfVbqlNuwkyNgVArCn1qMRufYFAef6XucbZ3t4OTR3sV+qqSRYtzflkNS4
         LR6xHAs+JI3jHiP3cr00voZfkHXsO4UWJcky8F1i7ys2NEdksuN9uE5ZM5sxwVRXkPmH
         rK/rPdo0qbMCdPWCKODpRQKumVumg1/+qtg4YYZjVbiPrnYAlDjMqATQoPz+EuFRUsaW
         3at2GeusJ7kzgDZOWGIKgcUZlhiMc30G1AOyZc/MzI7Fef+t//2ZCViLjsVDTdHOohsr
         yCPvMlJWHbVlarkPL7XLecXO/lkDCWy1fLxlrA/QLWzasLfaW1hT048UlrgpPNIutmBO
         nT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNBBlHDP4IyrGb/3Zb0p9LdULHZUo8UTCuh8b32cQww=;
        fh=goAFILQCLTpTjZVE4lbRCUIVp0AK2Qli36BvrUf/T1k=;
        b=GkvigENQq9+I+plt3PjvNqjwChcJPcgt8GB/eCIb/4LYvdtej+D9F8LstO761sPvEX
         t0/cCe5OmWnCFku+UjqAKxzyGJY7dFjX/TWUUKXsSi6kk15Rn/gAip+Y4dsnQDrlKpcy
         kOkZA6hxGZWjcB8sPIOsr9yOD3SUolPP6DTds6vBOZFHWMo6TH2rEDOyXW3fk+zayoy5
         5AtvMqXiOB1UzGlbMe4bk8zKIWARDEsCGZ4NBHv03NoicgNFvzka+Gh0EZVrbbgJloh0
         m5+7RUPd+1H4yrGZ+KhE/JFI2L866uUE9cQRNXsslV+bTvkG60AheQFGqOLJNSAPLmRO
         qOiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786007371; x=1786612171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hNBBlHDP4IyrGb/3Zb0p9LdULHZUo8UTCuh8b32cQww=;
        b=oSJG9sHparpCV6HoQVWtoA7/ejfzkgwBopefYOETyTOnCrFeHgjrsjkqaTwEU9RqLW
         YqJRwiEexmsq9rmzKUAxKRi9TZltUnxrR6htIYI5Vc9zyusO3mKV/ThL3vQOluYBdvk0
         B+CmhOPCV3eN9ZGfzrludeNPEbokHM+rG7RRBqGzTJnMd9TOifN9tZf0l1cYfyJ9OyXP
         DvjuVWZ/2E7qQybg9kyPUvTPH7zXRuULvHfGOHE7YClcgyBSuva1YGwMb9iFjBq046mc
         M7ycSJ7gZEeSqnByhi65IsC14wDTBOWuZzZNT7Aff8cLr1IpFN9BIdNcYw3V5KjD+4KI
         z2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007371; x=1786612171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNBBlHDP4IyrGb/3Zb0p9LdULHZUo8UTCuh8b32cQww=;
        b=PKlDbt72bUwDyb3N5I44L7PbDKtk30aW28NXbbYA9MhXi7ixafsE23rI2/5guuQY7D
         UaYRp+M4Ey+4GASBIWwNaJcospJrcXzQLNe/NNWR1cFjl5LG6RpRTbgfQlfk7LeDfy2Q
         IPtYEncmGu+7XBZm0cnSCO1aB+Wu4qtxfn9bmJI7DqxrgsLVkzD4Bigq9L+1g8fGLqJ4
         4AsmHKB6zgMHabnE93dFcIYhMdDBuhZFt18g9OGpw9LGZ8+I4ryx21UZkV65+eX9C0Pd
         AJDu3WNIfRyvQBWGTvgei0wcA5K44uZRDw/WV0bOEOqhQ888l+AkEbRDk5+RJrPlpjC/
         3ufA==
X-Forwarded-Encrypted: i=1; AHgh+RpPKHmpOb7axIm2gi1Jnz1QhECOMnUAi4YNZ2i0DUTqD8K+PZj87NNylqnt4cARy6fP9/imjmFl2PdX@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1e1BgIaJ2h4QFI1LV1lh+7eaiOZkkLERm9XRibGVx5tDbWLV
	p9isbSp58OSx5Vn6eUd02aLpxsx4CGz6DRhNrQg5CS98s7bt89PGR3C3yPkfM+GlitCrQOTZgDm
	w81htIT1lunkQUunwfbLNDm2mu+feTWY=
X-Gm-Gg: AR+sD11S35DRPXS3fR7XsH+Ozn4wnynCiNtE/HO1AOC+I4MvNJ62a8yys1a+TW9WlWX
	doA8Q+v8LWBctNmDdmXE5D6HMm+r1T1aj0KKtLtF7+2x58X6fsKBAOjx67fo5awNemhjlkXH89c
	Toozi3tVAiMwZbnm8+4s+PWqeD7G7tpBAxcqRzhjAnpr9JJZxRTJm4S8N3f4Fu/gJlEROFvRs3r
	2vvC9Vz8She756b7mQjiRoRnVNcXc6XWFWMRGUvhBL4f/wmoFgl8OpGd43z/fL90THj0pwDLmec
	3nJLxRtS3n0s2zLjJ/XUQ7ZJzCnPOjYlcwoLxtVcQ2jjivgHacL4gixG
X-Received: by 2002:a17:906:fd8c:b0:c20:33db:41d3 with SMTP id
 a640c23a62f3a-c2039d7f746mr698347966b.11.1786007371049; Thu, 06 Aug 2026
 02:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
 <20260805085540.452260-3-a.shimko.dev@gmail.com> <20260806-witty-apricot-condor-efe3ac@quoll>
In-Reply-To: <20260806-witty-apricot-condor-efe3ac@quoll>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 6 Aug 2026 12:09:19 +0300
X-Gm-Features: AUfX_mwF0Srsl4ymYSotEHs3H5sN16G_bkaftmzPkFk0pSw0EIRwuU5M2LapBow
Message-ID: <CAOPX745Zm-YcJcS0_KcSrJUR-V-U-ZDYqqxdmrO5gmEZAm8PMA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/3] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Aug 6, 2026 at 10:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you for your review =3D)

--
Best regards,
Artem
