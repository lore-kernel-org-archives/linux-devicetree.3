Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779161;
	b=ZHKrg9OMATjZxl6HsJPOxm3pVlTSEh2isv57gO3f4IsVnt3ME9iA3mv9d8hAhN2T3kkA
	 dcNtA/vO3Ziag+AFbFCVteEjkxKA7qX6x+tjjfhmeQdMxooEgaNWHcBusOmebYVvzdfft
	 /Pl8nWM5vQvDWstbM7hPR1RVD5UMyLZFMlHjpoF/mPmebUyL2y43lKmLzVIIVfRqX45wu
	 yGOvb2oO41bRpwp5z+35bMkpLh3if8w5jS61UMnkxM6Lo6GyBeSUnE8QxdwKk8QWqa1GF
	 ebnABMXVFl6ZSRaQJiuw7VyUzBh8xC5wEHZrDncg2CYB9Ymg3CVr76UaO7Zvl8vM+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=k1UN9ByJdt8gEiEY32EyFVyrB9m74CQtwvIOiaNpM7k=;
	b=npgGj8EIKkKYm81A5bcFfr/GuTi63T4TsOuTQzKKryIUZJ5ZfHS6t5ix5v3aw6PLspxU
	 ZEnDK3hz+qyjXWmc1qDDnAlxh4DhSgbgsayeQjGP7+654KzsPAYwfMXyi+n/nozWF7xjO
	 s9sVX9H3pUBvF4z403loantN+8EYlTSN2iAWwmWW83HvpWAuT2cI5szhZOM8p3ns+wZk3
	 Vm17Lznt7ip6VcPtF39Ph4zJXmkDYH1bdQCxk01BY1hu7UI8SkG5r5SsKMN66d9ZLMCsn
	 xnBzpHhbnsyp63tBlw8FY5kFprCW2pf3nVPsP70dgUgAPkT+rI7Y7E3hdu+HZravUuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJZsTfMm;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327D606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8327D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJZsTfMm
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03920c4a0so49420105ad.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779161; x=1796383961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1UN9ByJdt8gEiEY32EyFVyrB9m74CQtwvIOiaNpM7k=;
        b=YJZsTfMmWCC1ZRTnMufbgNhvqa8ZgXlXHXkxyq5nZ7eVsU8Z7sv09RhhvggKAqIhft
         uurl5KS/s5c5JElzj3uFZYfjxFCGtK9R2uy7wR8Gnm7Lswh7m4NBEF0uBBhV04QI1Dyw
         PNMzPh1u4VLMllGRS9Nl7y1v02spbgxW9U5azssv1WfYDRTi6gAdBWMcapfGFeqv9QlO
         zwhGr9VjD6JApfXVV6VaI5XcAXARIBOrBCJct2J2QYjdIR2dGDxovKknDzd2yMymy1xQ
         wI2vUYgtQSOfd3+x00zD9Z9IhWzc7kMRsmkTQ3hn5YvUm2Rjzp2QtE8BQVsHJCrksnY8
         Vr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779161; x=1796383961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1UN9ByJdt8gEiEY32EyFVyrB9m74CQtwvIOiaNpM7k=;
        b=qC6dGdw/ZLJZPF0kkAsDrzitI8/XcwKu9LOenV+WOE9Y2MB4XV6oQY2FvL9yU77rSa
         hVKXdzA3EL8FHgl0LyIGSIKjGoHl0EJoWSAQS2IgNJMoxzC+w2GQ6+auW5VzO9R54SRS
         BJvk350BlTJOEM9D/E1Bgo9WtAanxNWwBYXqZKK7UzsyedVy7i/Wm3Ff8n1U38qKy/fz
         8VHEMnyWbqfJtWKBi86rwVwk1v0KfWyd837tZVS5opz6o7BrbGAfeAWCYrCfpM9/YQND
         58taSS3UGxKOqIOsP3KdNoRGMs0nm1f2mvjAJgvRKI/UGTg+aEoZYXo+fo/t8r69ohlF
         KBpA==
X-Gm-Message-State: APuU4Z+cgMEVWO4VP5Y4oHigw20uoY0pSCPCUN2U5tNhqelin6lIA3RC
	jP5912qBBJEgJuiVOvSfF9NJ7ML63QrZDsVLZAcYccFzFtRrfDVxioGb
X-Gm-Gg: AZFdTZdThJh1C2Iyuwc5+ADGm7GCkW6KiVdCXGIRd6efoEbCegNAzN/nn3moaMgP14A
	4g2naPGI5XCrV0K+U+qEWvVwtMO9dJWqx6YSQwxys7VSGLC3cEPXiznpyTPnBdJApV+7fXi1GR5
	z2Y78Ptz7UTYJrcBYzvwTbVuqcckHPBGg1TI/w3CQQ8Osxxm3I2XaiI8IZwLq1LZh0kb4CJSkKA
	ffIp1wEMwyb9C2j3Jlt4DMCEsSqIOBXWe1ovtOUEUe9XskWhKd+2STDW21rXQa80f7fVSz6v8yB
	/rvHRJHZnxk/vT1t8e6OvmU+CGZtnqaQAkKgTULgcmJOKHIOCSViAlmHziS/Hl7J11EvoUqoJZD
	MXLl1t9Qwo0VtJtrglnU3d5QNlm2Y4nd1bdi1K7grWvCsTQq1QnYzFl3mPJKWSzvRk1XH1meN4d
	hcTaZvd7HrOzayVf0e/9G5O4WshC25AdjVP+Z1cloPpqn2CEzbOYsTslRwBVe+8yS517lpL0JGc
	T2hs0B/Y62MJA9vMzkiZkKdx09gYXNg2RgUJ43Ct/U4YA6jG1ltE40bxIDH3bIowUnANGpPbfdj
	mXiFdFuE+34IG38reykxfdQ7O7i1gkPNbSnzn+KDCdCbUIdW8pPw
X-Received: by 2002:a17:903:378b:b0:2f1:6bb:55e3 with SMTP id d9443c01a7336-2f106bb7460mr30758615ad.46.1795779160799;
        Fri, 27 Nov 2026 03:32:40 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04a49cfffsm109897425ad.46.2026.11.27.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:32:40 -0800 (PST)
Date: Fri, 27 Nov 2026 19:32:30 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi elish
 panel variants
Message-ID: <awlqTvcDwcu-7B_Z@localhost.localdomain>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
 <20261127101942.3215633-2-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261127101942.3215633-2-liujianfeng1994@gmail.com>

On Fri, Nov 27, 2026 at 06:19:19PM +0800, Jianfeng Liu wrote:
> The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
> display panel. Document a board compatible for each variant so firmware
> can distinguish the corresponding device trees.
> 
> Keep xiaomi,elish as a fallback in the panel-specific compatible lists
> and replace the generic-only entry with the two panel variants.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Remove xiaomi,elish from the generic SM8250 enum, as suggested by
>   Jianhua Lu.
> - Add a Xiaomi Mi Pad 5 Pro description to the Elish entry, as suggested
>   by Jianhua Lu.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Jianhua Lu <lujianhua000@gmail.com>
