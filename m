Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAA4825D4
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168740; cv=none; b=EKR26jKAF5X+/dxcxhUn6O0MZZteTgfEqdX7nIneqR+Em0dlsqiuNYiL7LFkK+CkbWk92b1On/FO8R+CZ3M/Y6GlHTDg8y9iQWbrMb8Al9cIGr9ZH5BtRiShuMWcYJp2nGR7laMlNcOjRGaq0htVYbYH1YfXfqsifFia0k9DtUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168740; c=relaxed/simple;
	bh=FxEVgvNwgROcpgS40eg+/0VB4E+ZMgfspJbjmomvovo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuPoPAe6+hl2kQ3v5cpP6HGSugYfjDarwFuJBz3tkDtNHdYlQMupKFRpqGQ8Wt9oxhNvyyzcjCNjPPSk6FXZGLbiSll86TMMn6OMEVY3A5tUppfcBtnLz8rfJM6dhSNCA2/IwT5g/D2eSQh6qUg3XBf7P1YTCKcHsb1xZrWRZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKnrx4OL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKnrx4OL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8899a204034so66686b3a.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168739; x=1792773539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quWXEdGzPaplUtxwyjvdAHT/D3hcP8quVKx4GUWHQG0=;
        b=BKnrx4OL+DIzDGhCeVXrHTr0Iyp/KL0z7B385yAyMaFS5fVHE16AWJAxPz90Ho4JgE
         bIEbPpCLE/ygKxZc+F7ZhzYrM3KkXXxlQ5/LHqkJ0d/FzE92TABFV47NEB/asOTSJ/a4
         8zWi7lJOpb+ABntEAla5+hwi2gI/fgubdCbwSmunG2YeH1Qr6plDdhOOTtP3WoYXyN1N
         GEhxI/Qg/9EjmmKu9aCyhCQM2Tv4mo5K1HG3PZFsyEYkrsrBCjssyNncUe6hy5GHsSsb
         KW2wfA2Dfsg/08CSLuKjdJjrEgz3BoQv8chlxuKRnfmlGHbyTFikjI5im3mXFYlgBq8O
         UWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168739; x=1792773539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quWXEdGzPaplUtxwyjvdAHT/D3hcP8quVKx4GUWHQG0=;
        b=I1Ii8pZ+VXYuHw85BjmdRkJwnWc9lbgwOUoEVUXV1HqvCHgCdKubHbMdGtgfK/mkb9
         cLWgwXtrXTSFSlTJxufxOWwgCtuyyOUzr1glv3QVaI3UA2Mqy6IouGYyQPLMGAlmORkG
         pMu1Sbty9ShMOP4PJAAu1tGeBg3JF5EU6UR1u87uy8BJMYPANJNUOR/M4OCwWKbQ2TQ0
         DssXIspYKptw//g2IQ1iEn6oQGFv3814BkCrgI3Q1m9ve12BDgZyUGWkoXCDXbd1nY+9
         P3Fq84DbqescwkxMHRuxhYAdOeIXcGKq0C9EivHDNhZtN875UuMg5xPy+JYJqxK+O296
         2HSw==
X-Forwarded-Encrypted: i=1; AKwUvBzi4A9p8m6f8skv0HYkhpI/W1PHEW7DfViokWlyH7A2iSLF50g/NFh2uSv/FAPjkEyo+ynQlfmAi/4c@vger.kernel.org
X-Gm-Message-State: AFq9FYLijxExPT3L55cdVjLChRnl06845eW/XYELe2Vjwg/kQ/ugTXcy
	MRhDTS028PuLI4Ypyom16Y2jirfYC+ByNxxWx6XGiyYwhDQOd08d9LN5
X-Gm-Gg: AYBFou1F/RhKE0nwcjo12yA+kPxiJIyaaF50w3M1ZMLN071dCzaVQLtaQHDXAv2fOew
	/O6ETABA4jR0FwxSdpcOySiIMuh1/0j7sOrHvzJ+nVbz/0wp8JRvW1Q8vBSIJ9Ohq5gdOcMeUa9
	juV333pVQBPMGDMk/D8+eIMpvPObg6rZd8KvabgqjWEp3Hv/8qdF1N35c3AliSVy+RQJF1dT0/m
	CFFGGIO9Zr/hrw9PxNo2vM/c3yLvcRKY/JE2YSEZnB27SaZrlWCi3mPQ8NLt6RKdQr6snQcimhx
	JjzX1jEJohvlmb0H2Vi7TB2BGhP+90yg7Sd8QEyDlsrv4AJ3chZN2+HhISpXKEVzde8cs6HoRia
	yfvzlLuTlZc8ENpHUk6vY/Xww4lQI1voBP7U+WOo00i39XK/VZpUHdL5+n/Gs4CQm8/h3SghKHR
	jKaArPlrotkmE+sG9+VAs0kEoW7bsxSKum+V2iK8kTcqILdL2iuHItthQ8aqWgfwclOZ0=
X-Received: by 2002:a05:6a00:9518:b0:878:6ee:672b with SMTP id d2e1a72fcca58-8a04be3688fmr101852b3a.35.1792168739190;
        Fri, 16 Oct 2026 09:38:59 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b2eec9sm1406945b3a.8.2026.10.16.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:38:58 -0700 (PDT)
From: wyibo6109@gmail.com
To: Rob Herring <robh@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Fri, 16 Oct 2026 11:35:40 -0500
Message-ID: <20261016163553.1069372-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016131159.GG5059-robh@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Rob,

On 16/10/2026 08:11, Rob Herring wrote:
> Please don't send new versions as replies.

Understood, thanks - new versions go out as fresh threads from now
on.

On the same note of getting the process right: the binding
documentation in this series was prepared with the assistance of an
AI agent; I reviewed, adjusted and validated the technical content
myself.  v6, going out as a new top-level thread, adds an

    Assisted-by: Z.ai:GLM-5.3

trailer to the binding patch and the cover letter to disclose that.

Best regards,
Yibo
