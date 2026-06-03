Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3936C0BD
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463518; cv=none; b=tpez1ZsJzxsRE4iXiKgHl+AU8clwZcejakNNu7erwIZcqUgr/wwJDJ4VoZz2hAkzG6NaEjpWlZWPP2Wygi9WmBmIQRfmlQs4BoilqU3OKNEicF2R9SF8J0D8Oe/TGbgD+QdI3ELr1O+r1FU/Lbgv1bisjnROnkVEiwdWJlaVbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463518; c=relaxed/simple;
	bh=dI2d2hdPhO8pG4rkS8Xu72Xnf7x80Fjf/iLbxzU4xgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7pleo9usVu3rGDHgCY45q/MVlegkzo+O5C4oP+myVCOmrdLKFnkqd1FozDMUWz2GRJOyEY9xynOjxIu3X67Q6qXOXPElsUoa+6BEW+HC+cLxdD9x3qkYyUfzh/40v+RNt0pIDoV+IuxW3hYKwL7FpRhxpMOYEkcSVX+1RP4oJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=U/LhczEN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="U/LhczEN"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85c9e8b7e4so759678a12.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 22:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1780463517; x=1781068317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/5AUHBaaAH4PchERy95hly+rUDKZQeYMFCdOcSGWt0=;
        b=U/LhczENJXMNDYNVCRQAIsNab3WmTDtYb/wHqqdvts9xpFam3FudGjYnFEombXkuRS
         T9cKGAGiPEWGdcMQoBUe+8rJRt9hczy2jtGyWTBX/XrU6okljlPdbWXgAmzG9KgSX4DH
         rH2NPGpBkHRFmBiADbdRvIDgRj71N0dOZYhEdNd+bAFMvQlHcYClm6MpaTwTCwjo7gvF
         uuf6T0lWs1CFE9ZxQfifcW9LnUrAjpOKquzblMxNP7+K/btMVyOfbhzqETaAOIq51ObA
         kTIJoXp+wRFZ2QBo77l/nhtz7jopR4S5CeNAuHV4D7CB+Dt+6B75hxXQg9gzOMvB5o2v
         YKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780463517; x=1781068317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/5AUHBaaAH4PchERy95hly+rUDKZQeYMFCdOcSGWt0=;
        b=qV7qomNaXClkW6qUYnK028XHohTI0Y98SFYXgaOnadlSNx5DeZ4hlGUw/MQSzSSwHY
         uwph3Vh/0CIjrJ2g8wRn2ZDwPG1a2wYh9qyUUhX/K1tLRlO2KZfaa3gLR4MsXezQ6AJb
         zOSWcz6xlHzf74zL0adrQSGOvqd96eu+x0cdxxi6z3Ce/L+BrJuZ2pVXW+GLHU6LmM5o
         NAyGT/E0G3WJVP5vJA7uUroRpMvErXWGAIFoFC7Uih6jHj19ccBOfPJ8UFFLeIUG9ocQ
         F9DxtsxCESva8dz8jp1Sr/9N9loCwkq84KLJSbJJ9RsSPqIA8Y5A0U+bPMGdfmBMHdrI
         GoLg==
X-Forwarded-Encrypted: i=1; AFNElJ/7VssalAGzwYTxv9PWkjAvzBRBDf6tHpWajxcLJh3pTccgEuaEibu7tPiGZCFZvxJCNn2I3ihaF/ZA@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYZlEChvNXUEA81z2GsiEMrmg+2DKGnq2vNvdQN7jgz+uiMrr
	jaLzWDN4De9xW8XUWuE6FOoHCwwwCSMtQjvUVI01PLw9kEyk78dZitzf1CsRpqY8jsoZKSrZveZ
	k+7uc
X-Gm-Gg: Acq92OEFEbofhHEg4pASHx+poNWas2VZU/TYZ4La9CoBiq9QW4uHOtoAJEFpp4R0tMl
	rQkol3Q2X5FHedWURO8r8DdtFVsdMdY5QMLly2/CNrN5iclOfIAE4en4/vL/pZCjcBHCQRpbNia
	YT84uhKXPCRcSUM82mPF9aW3feRei1oefFfmEoo9AsPzANWAu/UHWNRy6Hm1tWZ3T4Et3t52quT
	2U+mRvS9FuuiEzubF5sXJJdx1DkCO8Gmw3AjB1q7Nj/lDuW12OsnEb87hV/t15FM1BRhWp1KM2N
	KJzxDG9PkZXMOdPMX/psRxRtQaJjTrGQ9JAdvJbBOY5FXDXrK8uXpEHOhnwKGeqrZg9wAP4EAlX
	TgKWnABQspHsJpvAW7HYK0aYI0K8ifzhkb9Y2os/Q0/Vy7FgARqrL5ZGfhtL+k7JUkHNxW/KDEZ
	+nB15sPW+DpM71DRtzlsePatChhV1/96AqIp8P
X-Received: by 2002:a05:6a21:600e:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3b497573daamr2027650637.20.1780463516738;
        Tue, 02 Jun 2026 22:11:56 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm942736a12.16.2026.06.02.22.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 22:11:56 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
Date: Tue,  2 Jun 2026 22:11:53 -0700
Message-ID: <20260603051153.233164-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529063523.959FA1F00893@smtp.kernel.org>
References: <20260529063523.959FA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - focuslcds,e35gh-i-mw800cb
>
>[Severity: Low]
>This isn't a bug, but should this compatible string include a hyphen before
>the cb?
>
>The commit message specifies the panel model as E35GH-I-MW800-CB, but the
>compatible string is defined as focuslcds,e35gh-i-mw800cb without the final
>hyphen.

This is just punctuation in an identifier, not a desriptor issue.

DT compatibles need to be stable and unambiguous; they do not need
to mirror vendor SKU formatting exactly. 'focuslcds,e35gh-i-mw800cb' uniquely
identifies the supported panel, and the full vendor part number remains in the
binding text and commit message.
