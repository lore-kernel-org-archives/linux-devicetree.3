Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7720119E992
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256512; cv=pass; b=DJCLrsn9uNOK1s3RCJknpcd6L+MeFvrjjaHAUrGFY5Fdt5E5IpnQ1LSdvnS1n0FieAQc9lt6Pk/du9hKcU4Dcd39q5Qy2uv9skxhyKqbVGS9xj5dUHtAWYA2smA9nLvGY2Im813LnKPpHD4OpHGq5POF25ICI6ai2oLLJREuAKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256512; c=relaxed/simple;
	bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLb4QW32RbMbuEadPW7ifAoPoYW5Nti6WpTQ2d71VOYtiWfKACbSgoprBwzuwgOdOKFeHtIdUO95k8nU0TSUjTpwkv64p+SGE1zKXG5dZUL20OeC3+sON2wOM2APWP8wsHEzCAAPgkSTQZPXhyPLIHiGQRnEQePqf1oYy8aOSew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE01Zffm; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE01Zffm"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15b33f7b23so1076213766b.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784256509; cv=none;
        d=google.com; s=arc-20260327;
        b=f6OMVH+WhKKjNgVPou4M4uTRL1L2vo2NgWr1Z3E1YBrlbBdyLQuTP2fhb2yYTpLQHx
         Ox4/hEW0eVSIpbpQ8TV5y9alvuSy29+9E3goVTgViRq8j93acSHew7xCMVcniDKD9NQ0
         Pp8yZefZZesnjk1Ov06rcKZKP8w6xSnAkfr9zvIrO1sL9H6Rs0RN4lxkTKXVes/Bd7aA
         eN//i/+Cu12k9LWGjXAHO+21Idwk6H6FGaMERE+PgjTYHCQn0c8m3uOPQq8O8/9NKs/x
         pPIoSsIekHIn/6LQdrC98/dokaSBJVUziVl3JQaocXRyqcIC0o+UncqovkHA7sfVGuxE
         wC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
        fh=sEEtQKN2mTDRV4YiaNXAsLHmIA6suRid/ymwRMPTVDw=;
        b=MuVFueSmHhU42bWPVLoaSMQ277xX4iO5QM9KNfY9myKQANRwElJT7PNHinnslFuBzd
         LyUQoHrc5pvzlwhcktiO1SZHqQHBePNlmmoWRcUCZrupiVaNYp1ofmvcPH0q0/DCtf4R
         yoDrE9mY7O/loVrREHHbNCI8SOQ6yXnCESYJE8J91R2NiP09LbRjHog2PFNZUlqGEDx1
         OVkheOy0LEz/ZaeFotG3tLlF3gk0PFmQuNUXxF5BSu1Hb1SixlcBglykxBjMcUpwdNg7
         EwP+/GNA94SUK22hSyxSe+Wptbfvy1Cj9g6PuRb4dKtO/lK15H7jv1f8MrnMOoYEl6xF
         THgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784256509; x=1784861309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
        b=mE01Zffmh8ckiAJA0rMP+NKoiIIbrCnec5AJxiLlmmc1M72Dyg8PoQvF+yfrVnzTTJ
         PrySwLxxeAy+JdGZnc8IhjxtOk/gDP35V3Rf5TIcoFSF3mCEojKUKQgykAVLv2gNnUJn
         lF2Q3g8fS/2YPG+HN5qMNC0P+SD3Jax4XeGNk2XrRDW7hmT9yKw0v2sJorf9rH8OXuik
         S6sajYmh3BIqhkHme4CDjJfhFwjeRZvcg7PzL+/Pa5C4SAzZgL92nMJmcmWqf1JLqU3k
         5rxvbcZ9Pu8/YL1ycsFMYtQ4Q/A1DGnMIjWxtr2WA5ezu78mJgFwfr5iXLxxP82aYXZ+
         VmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256509; x=1784861309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
        b=O2aMNebE7XjPMSTwfhLwjR+fliPLVNybMmzVUOmyJhgY8mtZBghQNHPHu/SmxNYbwZ
         /i2E/y5ZjlolnKr9PNmbQ7sCKg9AiazSdFbI2BE+QSsbNKHCWM3sIS9UcW1ReNwnY7/b
         AaXpgKaWcFd6TJnvs+39mozWGBvKfBdL+YolWjGWbQzyeqhOpuhxEpiPq4E2Bf9GHmtj
         2hXEmvSeVoe0GtedeP82phwJp2CWXdrRgT7lPUoLkEfCpUaVmNSiJz9y95A3ppVhU5rZ
         R2V5eZUdTgaRCSBa7PuH7+AVIo0IcX1lWIguO30kjhSi5WiO4LD40fYvOmT/ukJ8zcco
         HCOA==
X-Forwarded-Encrypted: i=1; AHgh+RomzLWV1MSCfh9q+KyfVAq/nmBmAZuNEOr5w/mFPukrxMefRPMaQDxvNIfWcYcAjrjMQFiBiH05BNZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AYZHAe4dIFo+vwJ1k7cBZCwpTwqEoSHUpWeS/uwZqXAjiBfr
	98Jxqxpo2i48MSFBg35BXmWxr9aO89oaE7pqOLXD+eYtmdlcQJMmMz7lxWofhfljUcotMNXLHP2
	KnCn4cBHFQLDxliVJ2NbPqr5uERrwrvA=
X-Gm-Gg: AfdE7ck7r//wOP7ga2PO4CK7F6ioHCt4Z3Zcvusn16JPlL5RZ/9LPAQS2WFLvZIrc2g
	op3k2zFj9m7uh9QvKWFsZUvT4K4+jKv1ntM57YIKDViBEs1ICVXjtPOWzqTFrlOCzprqgFSYSJC
	NDa1KV72QKLaMQXqyGa51RjBEb8cSblbuen0QCeN4liJL1BF0R0OVWWOMHCkT/TBdgCS4cbBSVw
	c8/jD9XDh1BhQAssLzK4oxFSYZEj6duSynYoxiGeZcu0OQ249rU3uR02BBQ8TH+5bJg42FIRdRe
	n3qOXGwHCdBZDroF+w==
X-Received: by 2002:a17:907:1b09:b0:c16:8aed:cec3 with SMTP id
 a640c23a62f3a-c16b48643b7mr18580866b.58.1784256509566; Thu, 16 Jul 2026
 19:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com> <091279bb-391e-4c0a-8ecc-a51f95be3f27@roeck-us.net>
In-Reply-To: <091279bb-391e-4c0a-8ecc-a51f95be3f27@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 23:48:16 -0300
X-Gm-Features: AUfX_mz9AVIsM_AQi3achJz8IUPx3rvSBxfgPtBXoYk3dxmYM3rsybnFUAJ9i5s
Message-ID: <CAJq09z72Na3yzdei_BVd69sLKFttWZP8vmF3gf66A_qYZ2Yirw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hwmon: (adt7470) Add thermal zone sensor support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Detailed explanation why HWMON_C_REGISTER_TZ does not work or is
> insufficient goes here and into the driver code as comment.

No need to explain anything. I was just unaware of the existence of
HWMON_C_REGISTER_TZ.

You are absolutely right. I'll refactor the driver to use it and make
the code much cleaner. Thanks!

Regards,

Luiz
