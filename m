Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5083DA7C5
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883875; cv=none; b=fZ2Im0PwBkU7G7SklAyX45A3Sk1I2JOPGgYyij26buCiZkN56fLyeiUUhNeCn8R1GK2pv+Y6RwI9fb+vrwmtyIXoy0CRarYbTBEuS7X290huIuqSA/4CZxS5SAgAleTr9fcmT4A00g4dS6iKn2Zql3rQA85raaUAn//JX6/MvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883875; c=relaxed/simple;
	bh=XVFaXEYG2jOij3HyMr7u9yLLDZy3V4Xivvx6eVWoUcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNUUaEYKiZXMjr/wWTwaLI9U/A2I5fq9QcYMz0n7gvAdBPCh+u6BeWYIniJwzQRmQvSb1zXvTGky9qJAPSg2M7qM5Eu9JOZmOpIRYO4ZrFuD9cBu0qFs5Uzd/7ZouvM+FTvu2ElxY77/z/4gUyF1/ozkgBvY5MCSkGh9VImB8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjQ4WzFM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjQ4WzFM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2533d83e3bso432718666b.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883872; x=1792488672; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+NB6q1K55xrXTqewDbSwetE1j/mAPNyb/yxnJTgeOys=;
        b=hjQ4WzFMmAF+BTTFBWaPHmNTmT7t4JVL9XfcTBk1GPItkoyMHhNLM9Xt/rJov0k8ZR
         Ii+6lhUwIIN6FILMdsxGClz0OOMBbouOfNaSnw+1JFT5AO6B0XD8KQ1XQyVGXbJSCGrm
         npqiXa5LfkTOkL4JLo3rY9UkfoyS5Krt4jbmk38dZ9r0NjlbIxEtzgj2asowAra+CFA2
         IA+I4henvLe7xk3mViB8IhIqJOTVkxGzDRzIPEYz/SgSHjqvl1IO3EJ0dP2M30vLJQam
         eGBpgGN4yP57HLRtdaNj4RRg8aPicBTbz4qXZoySHsAud0ODuJt6ytAStknUL2aMLOLY
         PV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883872; x=1792488672;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NB6q1K55xrXTqewDbSwetE1j/mAPNyb/yxnJTgeOys=;
        b=KJbSPo7aZ+L0+NY4AerxJGlvzWg59su/q0IEPOAkYbde3CyW9FafTZJHWp9gfUJPiA
         cR5tr4Ydb1yEQDQ8Znbo0RUOdTMfYrWFBztiznCnGWVwHMi5O41xXxvCm7OqN9x0iXQO
         jyJ1qoUK0nzh+xotq80cXvT8s64FaT81kLV8j1sTezwXxccc7tr+a8BJM7pBUuVFs9IM
         f3nLP/SNK+JjTQIT8PKkgvgJUjYqO9PAYuxZUomuKtc2w4FHU0Btw7zi/kkPOf0wUlVr
         jWvLY8PZHSGvBEpDVX+TxB//V+HhzDaiACRxO3uq+ygEBUMNrpHyrISbWj/VTosjwpQD
         ez/A==
X-Forwarded-Encrypted: i=1; AKwUvBzaEvdO5JjhYAdzAQKomqoOiCdC4vJ4kwWYNW5m6CPXZFIJOvTn/lbsEcmTHklr9r7ypKXdcfsDP+LF@vger.kernel.org
X-Gm-Message-State: AFq9FYIdw0r8oY+SgimxjhgmayfVDtszMe3juSOf3G+meRPO8T2fc2ZD
	iNOdoYrApDHrXfBv3/2EuI7cv9ybXIo+Pi8JuhaTue1Oudc1T8qz0T8h
X-Gm-Gg: AYBFou2AZ4c6WGja8XG5TLHjO31bLrfT3o4CJruYLy0enp3UGCA9BSbW6oY9+Pj7grM
	6witDFz83No0OEQT5uBsDwh+/NkjzDuqV950uIRmi07gJeomectQzZeqH0d4WSSk+Z/ZsUgNcab
	IuZgrSjxxfUHj2UOdXnHSOZELQkg/VuoBZHCEzl7IUcLBkCK/Lz3SObIU7X/Zb+o7VUYX6bMofj
	doY5A5A64MN0/g1oEK/2aj7sc7d+R895N0wzAoJYUfq1z7FgzdICd+GyL6vQWHXG7KqldnaQyZW
	8LcDAUlBGV+ynA05YmH4KNINNswphddkDZnP1RwK67MWObCxavKXpNhCDZiXmhdRjp/ytXNOKBD
	q2sst6YkpQiPZsmJcrAd7rJcGJ9MfULqwbXvAwNvC0Yk0LBekJuvpcDP2InUoXljtI/aQ+AWRXS
	UCCtOAyf1/BhEYPKWWIUgwBU6SK/DpXYNiiWHtXgEoFd+o6NAy8ICJ3I59NlJG77yYLhdTv7BqJ
	j3c5V/AQFcH33VfWHJqGNkPoohRT7qGEOpKOfFhs0878HLJI4L9+8r/85iM
X-Received: by 2002:a17:906:f5aa:b0:c2e:3abd:aadd with SMTP id a640c23a62f3a-c31aa093e85mr1058348666b.37.1791883872324;
        Tue, 13 Oct 2026 02:31:12 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c366ed191basm105213166b.15.2026.10.13.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:31:11 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, lee@kernel.org
Subject:
 Re: [PATCH v3 2/4] leds: flash: Add support for the TI LM3643 dual LED flash
 driver
Date: Tue, 13 Oct 2026 10:31:11 +0100
Message-ID: <LwK5_fJASKu0tC1wo7o7Uw@gmail.com>
In-Reply-To: <sashiko-outbox-167401@kernel.org>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-3-rillian.grant@gmail.com>
 <sashiko-outbox-167401@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> [Severity: Low]
> This isn't a bug, but does this commit subject violate the subsystem naming
> conventions?
> 
> According to the LED subsystem guidelines, embedding subsystem subdirectory
> names like flash into the prefix hinders Git history categorization.
> Embedding implementation details can also create rigid and non-reusable
> drivers.
> 
> Could the driver name lm3643 be used in the prefix instead, such as
> "leds: lm3643: "?

Happy to switch to "leds: flash: lm3643:" across the series if there is
another revision, or for the maintainer to adjust when applying.

> [Severity: Medium]
> Does this sequence require a hardware startup delay after asserting the
> enable GPIO?
> 
> The lm3643_probe() function drives the HWEN GPIO high and then shortly after
> initiates an I2C regmap_read() to fetch the device ID. Failing to provide a
> programmatic delay (e.g., via usleep_range) might cause the I2C transfer to
> fail on platforms where the CPU executes the bus transaction before the
> hardware state machine and internal oscillator are fully initialized.
> 
> Could a small delay be added here to ensure the chip is ready for I2C
> traffic before the register read is attempted?

The LM3643 datasheet specifies no delay between HWEN high and I2C ready,
so I'd rather not add an arbitrary sleep.

-- 
Rillian Grant


