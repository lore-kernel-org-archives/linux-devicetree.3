Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEC47F765
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884318; cv=none; b=izLu5WWJAnkUTe2ewn0MIYybpfkYUc1KeN8SA4f83kSKKtTav4NAJ7sT31sAS0MPnZIlXrmyF1PasEEoPVrVomzrpPLzyULaYbeZe8wHZ0E3Qwli+UIMEMFFT4ZSrXxCU1YgmrzKfmoPEeLYK3yKeGF41fvBS7TZEG6wy3MOOzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884318; c=relaxed/simple;
	bh=iXKHtTcO3OzXfeUrwOHsqSVNmwXV/F74AKan+YlAHVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aasi1GEAtMx07IC7o1GkWB9vhvJQ+M9iYsi2PmorM0aH6tgf33zL6T/yq0KELf0C0J5R4lW7b/V6tKX1+OPLKcUN4ccrE8+Dvucw4uU7La5O+EWAcW0WG0iouzjMUkcucw4Yyt/NYvLhKEO9GZpdQ/O/jpO1sSK/Iv7X5KJ7Oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/wpZ2d4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/wpZ2d4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso23305925e9.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791884315; x=1792489115; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=098vSxKVV3TqG4547pdZNiDtttbybP63ryH0G1e7pgk=;
        b=l/wpZ2d4m0tizSSIaYcthyAMkROwma9GFNZSCQ8Vq8tTBK0G2x7puCz4jYPxE6DIHK
         e6NlLUPFUhaCeYIENVPPuOgUtYtp39RZDXqutHtdhxElyCQaEpzjRsC2sM3AnK4rBD9T
         5mCcJ/2H84pT2fczFi1djALT4+WnvVyffpkFwkJvTWXhld79GhgaTq8xCn2A6sUJxbnW
         +D47YfA9G9q8ETZJfTgfpJtd5sRyEL8W0/EG8yUQNoeuyVqLFPezudY57fZ7/u+9DiKl
         WNhG5HmmDxbcAVAK38f+eq43gbi19alminlL5Tt3Iz7hEkVQP6EJqxkcyfXn+MSNr0Ec
         O0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884315; x=1792489115;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=098vSxKVV3TqG4547pdZNiDtttbybP63ryH0G1e7pgk=;
        b=lwJ9ODYYkXSwDvgd6PLTBU50IlwPc1SzYnxcOBSsWrZQ2q+xEj71PqTYzyk1GWAFdz
         7uWd0htP146UoSelGak7qYoiHk1ptQBpQAo0K0LJ7S3EFOr2Vrmqquqvpt4oG4+BsZ2g
         IG6LZL4fY7OOqhIjJU/braGyMkyEPGLqXsyjvlJYYcowOQfij6VUqEF2ZEz3Tvb3vdPb
         h5KTEnhvFqezd+uXRKVQVb6DakpRs1hYoCY+Nxu5mes+62KiwKLYkOGVqZW9Vd82eaxw
         jvX0AAC0RWuR3lqnNfIP8xruqtY3OnkfwHzVa7sMZruhzUhQH/i6HX5o/E2dkOvL71NC
         O4Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwCF86LROiYf6Go2u4v4e5MRzuqA9nYNMVoC1mlARKArDh6Lz/Ie/8taPQw0e8rs5cnKvUjz2oW/UQa@vger.kernel.org
X-Gm-Message-State: AFq9FYLf5XMTBB0aUITLAMlepraVQFA48Tsb1kQo+VGZy4UHDLrk2lTi
	kRhhuI7OW3LKsjiop8vwU+kvReoxIaSjsQGczKxtGt5eTjxvbO4rz+bJ
X-Gm-Gg: AYBFou1iG4AKG1mQu/6zC7y/PhsRCw2irH6xkML7SXXKW/35XjAtVWvYbuQ2kw+K1QM
	tCAUUEbu0ZgYYRSlWd1vIjlfXo/4V22FQilHE9Ma8AFBs+zqcR9UUeflVu/qGapQseqIAnFME3V
	LFDzJMpQqcGM7a5UVXAKCmjFxC2WGdtefayVHSY6Gd7AiijlbXGIOrQdn1dfxX5/0v00RXcu6C0
	g2oXfGyByiic0LdaWnsvGo5aVkGG8NZUX92gscqrISM1og7XSNqcSXbpxOiXAkYlC8UAgUwiB0Q
	D61WaNnFX8+muOwsqtLs+8Y1VB27mC/fyQA/1m9qoacbFNqbt2DdygE+FepQcUxrmftG/XZuPcu
	d+VpatMcXh6tskJLZPIFFGVCiSTB796Ztmy8xRg15UhIt+KMNRz+WGgDYhukAD4wovPMJBbZXK4
	NSm6hXqyXOA6cvxMXXJqnJ1oQxRNcFhKJACJCz4Yfb4ZcHTAqzWRs3KAlvT6DHlNomggsib7ibQ
	lkFjEHUkUbKlQK/jF+EaoQDYwqSwaKIZSqhceozgXCZBoZEmQ==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a1a49ea94bmr80614835e9.35.1791884314640;
        Tue, 13 Oct 2026 02:38:34 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm450468805e9.11.2026.10.13.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:38:34 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject:
 Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI boards
 without LED nodes
Date: Tue, 13 Oct 2026 10:38:33 +0100
Message-ID: <37Wk96VpSLOh-P0MeN457Q@gmail.com>
In-Reply-To: <sashiko-outbox-167402@kernel.org>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
 <sashiko-outbox-167402@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> [Severity: High]
> Is there a potential race condition here when multiple devices probe
> concurrently?
> 
> If two threads execute lm3643_add_dmi_leds() simultaneously (for example,
> during concurrent sysfs bind or async probe of two LM3643 devices matching
> the same DMI table), they both might pass the lockless
> software_node_fwnode(nodes[0]) check before either registers the nodes.

This condition is currently unreachable. It would require two LM3643
instances on the same DMI entry.

I'd be happy to add a static mutex if preferred, or alongside any future
DMI entry for a board with more than one LM3643.

-- 
Rillian Grant


