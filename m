Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865053;
	b=hwcNBOJAtCT/CttC6goivftQQuIfaikmmeWBhW26WP4g1hOsFO1sm05d4JHb3am6HYQa
	 Gql3uuXZRc5rEB6np43i4dQZtUzUXXGfN4R6dHaPAxWqJIf7Mg81fjdALpdqdie0e2q40
	 Aln4WP3+o81wSYNeN0vZU6biQbS7XrdoYmJkJ+rACM8StBzjvpBk+EHXPHOmaPwcRrHSD
	 FMOE1xOrAKq1iNKl3VnnGElHxolo2YBjCtJM8QDi5J3oAymlBihHfrmyt1ABgBovom8h7
	 wavMsfSvLU2liQPTSp2DhGwGJpODUWavUpNFZvVJZVcLk9JiQ7XIvjnV/Yay2seFn+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
	b=4ciskf8khFjFto3kI8hgcd+5EeXg00R1JOWheJa/nztvlAUB/ipLQonlLT9WLbutQbCF
	 Z34trlGcKcF73ThtK8KpcV1bKDPsUqqYB2NFZVx3mZvd0KaLBzc08kyGZaCwWBC9Ufeca
	 kRAhaBsCm731YCl7FAArqxuLaFAo5Pg84IWYZjCJ3pfuRhx6eYZRZNTmGzwRUs7vKFJ0F
	 q3qwn/Xu5TFj6+lohqg2dlXPAfvnDxDFb7YZROjxUiOZMfHnwwpjv+4KMsm7umZv7vWvU
	 ZWHDhHzubu8Y8D49qzsh9ADa9xxAvmCClGJOPVlHzOkGNBgYWewT8+uqcC4FAiwxGuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptrvNQMv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97133606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97133606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptrvNQMv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so11352615e9.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865051; x=1795469851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=ptrvNQMvZGrDGdeRfZ7P/5XmtzRi3+skDCRNqe3eKv7RaDd6Px0lOlXBfXoXIPk6ar
         0YwYpsbidhWdqnfgy48BeWCNSb/vl7QlwrJKBPxuQRGtNHefKMLMVOyClKOYTWkpnQaD
         H+DQ9MVm2XoFQqcWczODgyK7hgRWffk6+5xEPPmve6FV6tMePnKAUBfirKfx0gvpVkd9
         ogFSv4rMz1RhVDyJ8FmPjUM5/S73uz0hqY7Bh2oa1r/jWX3GIUlLSlHQ1Q03tVGQN/Iw
         0wPvxlpMgYX/dWRH0uh+Iz1p3BWaKqy5vSIcO2o/H6uZKoYY6+qKQuFTykeXO1CwuiV5
         vlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865051; x=1795469851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/CIlexh+3dIbJj+uNeGrZODUMiRED+GiA9HD8bfoMA=;
        b=RMnCkQojf5vY2+FyjyY5cljfi02BToKWO86EelA50tiAYlsghBdJo86BbHJx1g3H4H
         yEM0mLFH6hlREg6Da8W5AwYFupiYhnyPwfJQeucW2zQ6NiowJVlw/ge81GDmbrFGz0Wf
         AqUxRCSoegti+/9rCy+S2Xan741RsyUvlPXLTiiSF8sw6K2KL9+o/Y8jgDVzM5GQ8qYC
         Jnp7goJqRyQs1WD/uGqxUwp9eNJ3etvr7eoMWdfvAcKuiQrqQUruB9RpVtRM7IPgGL3Y
         PXGFhanD17OoDvmHHxGQ5p3LgRT7yBjZTZaNYnBfXPzYfG7cm5T36Q1K84JG2c4SNrGL
         LU4w==
X-Forwarded-Encrypted: i=1; AL+hErG8XMhDqODraBzmgPrufSEIrhNL13ozKm0jp7G5wttJDzcp5gAg9OugWvr1CC9clZROrjFOVgAEiJL/@vger.kernel.org
X-Gm-Message-State: APuU4Z8FG3pN2j6nJA7QXHVipGyXNrXnPoJ8WVX3mhzcJmMi9U+zp7cA
	8gq1bI0B3ZWM7Wkn2+zuhKWx7M/bbracn/Pw3/T9tW+ExEp/01ugvldg
X-Gm-Gg: AYBFou0dLtATb2LW024Cb1xlJdBHkh3G6KRHCQZVgvTBlrAtX1n75d6XJ5Bw6+zYS3a
	XsmmDX5J7Uac798dgKDzn9zEFTVKROi68RAlZTJgkSNjUFJEsFQIjpngu5IjwSM0M7HiwvUbQsk
	4dP3fQPc9+7O57CUIVDBD7kffe/mEo+js4kAzogPrHoM1qWNb3eGts76pBFOSG6rjOBf1FJNxBb
	hXg6oZ2zywTMDJdOEzHNNDlRQopvAB2YQYh1j6VaBwvgIaNDP/BoQFCRwM9cqijWwVxjGOhpYKp
	IQVVyGdts+FeD6F/1mmlYl4B8lyzFrJ8GVOODmrtafEtC1SAdC/Py+XKyRlpNl+iXkS8jS+cxL2
	VbTUkQW8/aeKd/jiRjLHfUAxQZ9LzMmcghZ+DXpL25LWL5YpXDAoSM2EksN91LQq8uDYWANP8YB
	FzvjizOBlEabh6w7vkWalp0B6joYIqZsoY4IdKqQ88mk7syiwpMdG2+jslY4LElSlhttwcZqPd+
	5nE5gTpPDHE4PdFq9D2WAnUBGmOxGAcpbqeKECKrPztZaY/R9J/kaRRR6kgfnsUJ3SNtbW7YyGz
	utzwAIlE4ztMECjPMzM2Esio7lw+
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr187933905e9.35.1794865050987;
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm143331635e9.0.2026.11.16.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:37:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
Date: Mon, 16 Nov 2026 21:37:03 +0000
Message-ID: <20261116213703.3774089-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217729@kernel.org>
References: <sashiko-outbox-217729@kernel.org>
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

On 16/11/2026 21:32, sashiko-bot@kernel.org wrote:
> Should "qcom,halliday" be documented in
> Documentation/devicetree/bindings/arm/qcom.yaml before adding it to
> blocklist[]?

It is documented in the DT series:
https://lore.kernel.org/r/20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com

Stanislav
