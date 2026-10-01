Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB74EBAFA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853931; cv=none; b=d/eeCaCMMALIFHOBSSzcclhTox3/TwhuTQBJmz5cbN2NGIPQTZCkm/zOH8Oblyxz22rE6ZvkzBIcsUrrcHrBiSQsgREHss7StA3J7UCg0kROhiSXjb8n6j/d4BiaUdW6k5ZdWKYxibhVlGWC/W0wwsWartIxGDe6idqTAkNzW6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853931; c=relaxed/simple;
	bh=GD6X0Fa00C6sHSX+BoiQ/aUjM8kHKYzWZCl8t6VF0gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JK4yDRH4v72CsZgGgHcDDp08SeP/jBZddXKQ/dFOvSKH0zlKrSgQwNfULhDYziFdfT4RlFQyLKpDfUr67gXQtHvBWgXhn5g04ct15NPC/wYtj9UceCicDzn8zPtLeDh28vapGtHgQ1itMqHH6YZX8v9mFm9G4mcoxaDitlXVV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8zcyhk6; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8zcyhk6"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88732460a36so1060533b3a.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853930; x=1791458730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db+VBU4JjCMNuWZHEdb9Rds+vFFnQ/BjltDky969QKU=;
        b=i8zcyhk6b5/soQaaAFERgr6pt0asKYXoRpWbt95liiAz7U9vzxDnGXNsYjhstNfWIb
         F4HqfCPqLsg48UFDCK/wWEjVgRbg1lTn72wa0G/rhdD+XLS9D5PJFRLqDK0zNwWAo7Ru
         vJ1OB/62elSGyJ9O/bzx2tpeMlkj9cNEBjWdSCZXMCz7n8kaXjiMZHDdhP5mpT0uNX95
         osGBof7Mhc+cQfN+nXvDpCnidG0uXflaGKeeU+FiwkTYA2mhAB2lDhPstk6yNH5X1xHv
         ACKaMJJQ6y1fgyeNC6XB7nvX9dq39CXVJLs9xYuzAHr/zkSGFicYg0jAMDCZc4dfQPNy
         Nv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853930; x=1791458730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db+VBU4JjCMNuWZHEdb9Rds+vFFnQ/BjltDky969QKU=;
        b=U7wxVBRPl0saAhvrHWGLZw+kU3A6kxpAThQgNzpbAYi9e3Ncdtz9H0McjEu5v/ZCTd
         sQakF0bMEanLJPse0jFz8oTphiW3TDPlNzHauTi5WS88ZI6PiJWMvc8TmxEO4QlgwxEv
         uwyMgabfOu5t1Kdw5gaU5Fkvig0newbvcXekTBbk558XQ0uZFL5zmTYkWq5sw5ZzfHof
         vRQyL0fqWF6LAXdJt5orXihagUdoRQxo55gvF6PEPmw5TAePvKL7XASsBmFZjTdCZqVj
         mQuuqhXQoFUgxiJL7HESdddfFD0tLRagswfZGSyT+qsh5JukNZgzOUssFunytucOFTZq
         +AwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN2r1vPuXGTBAp7opWJ3ON1fjwp6Vj7dbfB5aOaOjzlMwayRPD9E3y4M6OlbbM4sAIrQZYlN+Vsm0s@vger.kernel.org
X-Gm-Message-State: AFuF++kBCEFinflUYpcd72SF3dGB0/G0bqzKQm1BLhTLTeZ2+CJgolkx
	1o1/OurF3Cym4AjnS7iYsp73smrizqz7n9VXZMh+uFZHFvlnCNzlsp1V
X-Gm-Gg: AYBFou03VhB9FB6XX7kq0hxCvs9+sfUAFtgmsGqVzqH8sNBm/be+OpSF/WZaZigG2tn
	LIoJ1Z2csrxogXfh9CInfZo9BZVDGBFV2jGhrCkY+D/GIoGxPvLKTz7PHY3wiQsn0Vu1/HRnwNm
	5gPuzvx5xa6jDIt6tCwmo19E6rVRWimLXiefWCOGs2HyJYxuWWZ8DubYGIZBodIJt0BvYBqPk4E
	rZeHDebnWMoafe9ttsf7pnfa2xtrAHPjASryfSpRq2WRX/BRfdftq/e/GhHJQvTY7JKpeRyqVq8
	aal1cgBvgABb1aBmHieGATHerfW74sEkO9TuPgoO1CJ9DOZfyAGPxv8is5zNFLsdmz3r2sUCyEW
	IXqfewjM2fToNVxAeS+WzyIdHtua++TTmHEeKsnQJcXq0o+8J9hKf5gQ74cqYvlV/kOP79jVbHH
	4ijgo862lPZjBIsRFdjat0jVG78ljI6ZB+MwCbnIiHyw9fcL/Y7dQXvfMwr/lHK8Jnvht9MqZeB
	U4plwo0gIrW87elKk7ULSgUJ1JUF1sXE6NFs0kCUIFdMaIy7G8Mfa3E+R2WI0c0qIXRVumGNWIF
	ZPYC5/t3T6x0k81hT5NKcc++Qk3CxCUeHPjBWi8gic0vlSrOvDAvOORG/HA=
X-Received: by 2002:a05:6a00:1396:b0:881:4b47:f2fe with SMTP id d2e1a72fcca58-88749034b88mr3297052b3a.1.1790853929768;
        Thu, 01 Oct 2026 04:25:29 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db4393sm922628b3a.61.2026.10.01.04.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:25:29 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the robh/linux for-next branch
Date: Thu,  1 Oct 2026 19:25:26 +0800
Message-ID: <20261001112526.3822682-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAL_Jsq+k8GsoSgmSmVRMdOEj1fJMUZDvE02o7MsZhO9uWE0OcQ@mail.gmail.com>
References: <20260928105951.2187076-1-matthias.goergens@gmail.com> <CAL_Jsq+k8GsoSgmSmVRMdOEj1fJMUZDvE02o7MsZhO9uWE0OcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

> Is doing this preferred over changing what HEAD points to? Happy to do either.

Neither, it turns out; please drop the patch and leave HEAD as it is.

The motivation was Sashiko, which reviewed against the default branch
of the tree in T: even when that branch was far behind.  Your master
follows mainline closely; while it is at the same commit, as it is
today, Sashiko reviews against mainline in effect.  When it falls
behind, Sashiko now skips it (since 28 September) and uses linux-next,
which has your for-next and dt/linus.  As Greg pointed out on the tty
patch, a single branch in T: could not cover both anyway.  So there
is nothing for you to change.

Thanks,
Matthias
