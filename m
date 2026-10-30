Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365551;
	b=4jeOW5ob7y8wL2d7zitddqj8Cj6yrxAy8ATXOxS2Bx1/jSh0Ttu9NUKtlvavWaHRYEOK
	 S/MoYbEodbaG7iAWHZnACd3uEGWleEXlTFAUQs9tNFOmR3H8Yipv74fCPMpoNb4c4mza5
	 72FSSPa+QxDT/3Ec13Uf1TJKSKdFXe4XATuuXn+C2Tiv1hg9SnZQLri/LZkQB+XFQpray
	 SxBkHu8m/W2EO8p6YPV/ydVaFS9DJbQaLPErot6tU/7ejodTQErDpGGDhan1Cxn8yzs1m
	 2MW8IcgISSFFpC1sKNeZFCzUv1ZSbt2b/9P2SdLHdJOHnG4GTMxKFm9CPwdjYC4tmrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1z912D1NCt5NvEYz6/bHU2nyVUiHkm+tWWOngqofhEE=;
	b=VLeDR+QGoSwHJEmz/6Re6xWjCpwa9ZxK8ML07upUQuBl1Xm3pxiQwapKfTKUB6U9vMcI
	 Z5OCRdy5sTuEK73AE5/ytrlFBmVOKQ7/Oi2UNJx3C5+s+3KBn1YuJjZll4pSFItFOHomh
	 dl8X54udiaOshsOSJt/izeufxYTqCEqcTjGo0MqXsaGY7KJOVgh8AmcAwgJY+2BU45Plu
	 ng819eX7pe3ooFqLNQOkYmW5iwxi3ypNWTCJc6QAEJ2dOl1URFfbrHeL9n4s3koYUVeXx
	 qIPc67DhhSX//t7/+FVylREeNR7oyICgWPGlWdClGiZPaHpAV5195qKB79FFn+Cb7lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=URUaMmF+;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C8606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A3C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=URUaMmF+
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a65120bf25so1040811fa.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793365549; x=1793970349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1z912D1NCt5NvEYz6/bHU2nyVUiHkm+tWWOngqofhEE=;
        b=URUaMmF+Hgq8P7BKvk15Z0E+OT+AbqsaKSxHYayCu/2Z0vuu29N+LlBa8K5LXxGAgk
         R/vzuolj35EUYE9VxfCH8IUhzwDMgnmlUYnXIyhtDbO4ElxokjX9IshiBk+VEPlY5043
         oU4uOuKdYjcCwFhdyMQcR2OjVifw8gUqO2zeZJV7DqiRGE9VedfF8wCA0yDAKcZiyz8U
         XnuEJozafHLXoIX5skEPK0LiI640r1EgnrlMierslmFjrbHfgdCFaVcjBU3kB4AABcQ8
         nbgMnKTYhbtolpJIcuwplBrxaK0p6CiV55nyHdt31a7qBPp6dSbOdV+Bgo4HstNkiZXm
         BRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365549; x=1793970349;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z912D1NCt5NvEYz6/bHU2nyVUiHkm+tWWOngqofhEE=;
        b=CIbqO0T4jjcF29eDDYRNxabRouKx0SZm0B1KaPN9hwm683YEoMs43LgUSuL4BOkTl1
         +BPepMa9u69/ZfNgTHCZ0vVmqrp8+0+pb3zQ2jct9rFLz7yFhwJA6ji7AhLnrqBYFTgh
         e1k497qHfZSdawGXM9is8mNajn1MBu6ST01b0kDZs3+IbVKYcqZzuwH1hg0MGmRPcuM9
         Iz4HLh2k0eUiAcIhaJm5eHWtut6nfMUopVUxddZZKvkFlYJb7qiUJxmN7NyVzGV+I0o0
         T60799jtnzU+OZdyg2OrqIgIm0zFlgA44Phum/m5EvYeK4H4D5ZoNPOSNl3pUU21QfjM
         X4oA==
X-Gm-Message-State: AFq9FYJ9Mm2VYG0lHqPTQypYaBq/UcKSVefFn3VNHgfnowmB1yAAhiWw
	AI+NVjypfT06zy4a28BsCRpynLDbcjvNmPLi0ArXZmlsaz4VeFSYzllDe0PmjPLIDdlXqWirdGp
	FxLIzPkc=
X-Gm-Gg: AYBFou0NhroAQ7AncSLbEbZIW2XkXJvLhK4nMWOxGCHm7EK23R0LtmRLEAhOaqpFZqh
	9Rj+xXJXOKsUxisUZyXFQNYjU+ljafWNDZYX/ue4lp/ED17OzcOU4C9ewiqGZ/HUZoH+71ukgWo
	ZMk5jzoFKlkh7axvYxcCRN/zjmVLnQaRU5dzlNQAQkXLI6NeZ+bYu8KyGzr7ZaM1pqHbDdxKoOw
	pS99ya0ELAGlhfLiEvzTcrcHlY8649dloRmxCYnyCFbQ6qMSrPqRROiGGGN65Sg4R0qx7+ogIm/
	Oia46KCWgKG5RS7YVIjqP5kq/HHE7GiEW+lXNMzXYPShqWvg5sbjUSED8nkZQicnCUFzaJ11w4J
	Y0gnjIvuY6dAZGEaHAxjJDM5RsCmpYaln5OFnFWgLPmvwmkV7i730kr1JPzPhqiNyg1lVB3FFKs
	11YK2Ya5+DO7Z8KeRccESmndasmjJbFSfkVhro2fD+64zVihVoE7jJ9HvNFKdwTrxTrY0P8Bo0M
	mjEX5Ev/tEkgh75U6+oEnUG6a3TjkkJh0Dj2prSshx/SGHMXAvWqmvP5Q2hIgPy7fbDE0l6zmqM
	oklgPJvPDj3W1yX2nQHfMd8z5xtbIXOc/wKKhEzal2NG7hmvo1Gh7TAv7XbE/YENJP0YuzlCHu1
	1GSZT27Y=
X-Received: by 2002:a05:6512:159d:b0:5bf:ba43:fa67 with SMTP id 2adb3069b0e04-5bfd95989a1mr919917e87.6.1793365549071;
        Fri, 30 Oct 2026 06:05:49 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd9c48feasm343623e87.59.2026.10.30.06.05.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:05:48 -0700 (PDT)
Message-ID: <53be356b-9a63-4df9-b5eb-0d84245406f6@linaro.org>
Date: Fri, 30 Oct 2026 15:05:42 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: devicetree@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 14:43, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add CAMSS support for the Hawi SoC. The CSIPHY resource table is reused
> from Kaanapali and the TPG table from X1E80100.

There shall be no CSIPHY resource table at all, it makes no sense to supply
it along with a dependency on the new CSIPHY stand-alone driver.

It shall be fixed, please reference to the recent SM8450 CAMSS changes
for the exact details.

-- 
Best wishes,
Vladimir
