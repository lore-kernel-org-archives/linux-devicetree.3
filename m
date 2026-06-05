Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0B3B6360
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670446; cv=none; b=dLwkID38mFe+wTvzmycltDhgYT2binsIPbPlxBhjw+P6Ro5BJis2Rg82PxoPjNLzCc5oER1YbJGpPpZNWeDpfOzfkWQjg4p1vzNPAAGIr/BdkdNBiZiOlbrlFQHyBT+NNtGNt87yN9D+CIEAiC2N9OUU671sajVKJxaPKElq22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670446; c=relaxed/simple;
	bh=2fn4fU2NfDRDPQchK0bwTdWV8aPxHMeupbQse3mEPGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sdyIcKr92HGjLMtw0LP+XnQM6bUYyCYV81uKOwUGx+3o+2UWQDsJx54bgaoxqya5Ww1sNOTqikz1brLssSYqAOeMwWNi7DghIjPnMvK7TtGVEJQ4vospdBev7cAQgu0HS19RISydO34GX8q10hfV0aDnQhkiPjpAVsBPqyAEXes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqC35VhB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqC35VhB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso11423785e9.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780670443; x=1781275243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skr1dG/uETuGik9GgZErIJKqeHCvcO7qNrhexVQ3Vl8=;
        b=YqC35VhBjKHFoEPcqjey68IrGKQ8Uwlum7E6DrWI+MfPjMhe2JruiBcc1V80ilbLqJ
         xp5J7w5Q7SlTAREQE/17ZWsu/Lzkw9Z5KaS8gzuZnJSXEB4c2KC/EUn3GFsvKLNXJ8SK
         Do/izmCcRbdhVE2oavl+RFkI9/g38/Z0PRYDxAVzbivhgXHXV0hOElyJpUiBFHIlLzq9
         FatckGw4e4FO1+r97gZyTVhCMfwtjHI4Nk1DsM2DmENREp2NP84AfEfJc9KhkC188spI
         2QoarO15BWWFww42/JPReZYGJVI+TJJF/xjC5XQLkDnC9sBZHPtlv7MJz3aKeBWzoW7v
         xL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670443; x=1781275243;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skr1dG/uETuGik9GgZErIJKqeHCvcO7qNrhexVQ3Vl8=;
        b=bk4IWx8axlzBBVvTlEFDwAc27I/SDXYejI5EPrtKujpjwY5B8GySRF83y5aGI1lLW0
         +K7B+L3Bp9bu6LyyE+HL3LLl2BXKgNsWfV56FCA3sYuhgA/oAhcQjyx751mXBFOziH17
         NTALRsvX3IkAjM7hdmVW+lwjqYakOCoeuJrNf8bD1mNxovu90YI0EgdaV7Hk9FQ2SnrW
         kj7nUcY47umlJUeLJh18XcEeX6zjyD7VemLf3PhowfrS/EleeAP0q6N7Vr50nAGGSDHO
         y5hgTlkKHNltjt3iJbc0WiPkR3AN5OuXTORi2Xd5V07RM1rv6ivfj6oafCzKlTVyRIPA
         uKPg==
X-Forwarded-Encrypted: i=1; AFNElJ+tORdgD1btU9C8FY+A1SkN7YljB+Nnul2z9yqKl7ProjHYteJmBB3/CPaurDoXLI6NvCNr+Xrz5uO5@vger.kernel.org
X-Gm-Message-State: AOJu0YwceWsMq20wF6l8EKdQ5eHdpQqCbPMeyPOiADeXtoG1fcXma6OA
	N8bGPRBeW0sCh4yzg46ZXCC4n3CXlHCvjJSoGiuPMuYQ5Kq0JidyiVlxwVTUOxBnTU4=
X-Gm-Gg: Acq92OHd4gKSRNvws80fUWVb7Sm6WowKv10fylB3dkTrRDOj6FjZWl1GjnN5BGxSMHL
	ywkvD0J15Ib3qR/65QzwSHXpocSr0lcpYdncTzk9J4FL2I5P1BiW0vCqj2jIJwwSetJevGhyhAl
	FvCrMQ7QjTpjwVHLy/QTdQmmTtQGsozcpzBpLbMwv3IfLSt3lvSTctBB1rCF4v8deSzHLcjryNv
	JjdO1KQ6fw7qN8J24C6liKtSl6mcS2oDzoBWPpozT4YIe9f+KAIu6trWmclNCCur8vXeU1xIS64
	YMJUpJPi0oLuafHtIPuF85dspmFSp9qLD/cDrd6aSbdYAk6EfXtfnAbeLbJJP4t+TIAzupnvahL
	U9VYZAySMHTvAXlhVS7GksKHXhLztqW9t3GttxEjDWHrPG+4E+P0tzb3/2F97Jqdzeg6HcEu13P
	zJ0ERUOsHmL0V0+MBng/sFOn/QwO1zSTeJa2ux3e8s+9JYANWnwnZ1xE3ZEpw7CPpihg==
X-Received: by 2002:a05:600c:354a:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490c2607c39mr62305025e9.31.1780670442943;
        Fri, 05 Jun 2026 07:40:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e4b5asm166123485e9.13.2026.06.05.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:40:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@nabladev.com>
Cc: Kael D'Alcamo <dev@kael-k.io>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260422210806.80948-1-marex@nabladev.com>
References: <20260422210806.80948-1-marex@nabladev.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Displaytech Ltd.
Message-Id: <178067044206.1089225.4621525773604895263.b4-ty@b4>
Date: Fri, 05 Jun 2026 16:40:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Wed, 22 Apr 2026 23:07:23 +0200, Marek Vasut wrote:
> Add "displaytech" vendor prefix for Displaytech Ltd. .

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: Add Displaytech Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f917fc75dc63b4994c913a379929b0a8c242f4e9
[2/3] dt-bindings: display: simple: Document Displaytech DT050BTFT-PTS panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f917fc75dc63b4994c913a379929b0a8c242f4e9
[3/3] drm/panel: simple: Add Displaytech DT050BTFT-PTS panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f917fc75dc63b4994c913a379929b0a8c242f4e9

-- 
Neil

