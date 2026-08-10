Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EEC3C9EF1
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363409; cv=none; b=q8PZlWmXuclZjlAz9vBLskWq8Xm+9/3NVvd6NB0txm/mr18iPXA0rkJDKzBHp+mlW0K7vmn+V4hQdHV3LbgHCNhfhquU0kHGmopVMXUDx6p8u8SG/pwhBkcjDbFmvullJE4FDm2mnfIdTbR0Ul4AVYeSo+2sIRs1zKatu35vT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363409; c=relaxed/simple;
	bh=vh0TxNq/fm5zGbnls35thYfK3Vc2p0h543Z+vBeSXys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPcNcD8qMhuvSMu3afuTm6X3c8cGuwottwnmkRSLwK+8lKPKVAz0eaTYEhBPY0sYOB+LqE9k68lJBc0bqaIKBWZELE6hvYT+36wnOVGyGXYrE0ri0L3jGJZpTy5MNPEhGZOSzVcWBEOXk2UgCzJ9TUFWYS9XQmr81tL8oGerHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM91OrC6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM91OrC6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956242332dso17629375e9.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786363406; x=1786968206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vh0TxNq/fm5zGbnls35thYfK3Vc2p0h543Z+vBeSXys=;
        b=EM91OrC6iSjHGyComN3ObNfv6kyANa9CaFKZk6QHZjVrh1EGhxAyNzulN0InyTzvDq
         hpISuNJpCs6PV6bwqH2kqAuMI4tfUhHVrNHMf+7GyHzpYtM5xZP2/MufYzYHwfL2rF5p
         rfYYxRI0A0aDREFUV6GRwK70554WHPCemeDmJAH7/Sz7A6EL1bZbj+FGms/88Aj18DZi
         Mk9PvxfHOvXcZEmAVFwq1XqEQdQP4gwn5GvFjfZwHqUSvEn/Rf0hLb0OrHu984I52XrC
         wgCiirSetNnG/YfFrS//BcE1YXtI/NV7mh2mFz2F0j1nPZMcI9pGIRq5YJwB1IqWm3ls
         /jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363406; x=1786968206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vh0TxNq/fm5zGbnls35thYfK3Vc2p0h543Z+vBeSXys=;
        b=a13Xoq4K5D8t0vDm4iZ8Sl9ufVUb1mxweg1KZmzUEWfb3n4D0QMpN494uKvr8cWwjU
         huyUBEdwwzvCjaO9Xzp+FOrBNjj1Vb/+4Rjzhi5mnfdu4fQk2Xz98csit0Pf8e/+dG9V
         wzlB4MW1mlVP/xxAkAdpEN5/LSNp1gsxK+xWIXns8YXsjUff3OtHpsSwsNjTrIyWhD24
         D8NEKV3yZnkF65GajIyb3K6kQOLajqaA7pvMcaTm5TZSI3Tp3wgQFu4I1kymeN6hEgAo
         Sh0W87u5V3yTuk55iRsm+eEz3xptxl4/cpf90k4hDFhm1RRqRH1q1WP2icHiQ3YUA262
         z7VA==
X-Forwarded-Encrypted: i=1; AHgh+RrKld4SzlyVhof/0F7CXZmUmydYevh1+RXShhXQbKXgL5y6n4mmssyprYToDnfjM6zEqwzdoAf40aFO@vger.kernel.org
X-Gm-Message-State: AOJu0YwxiI1M8iG8YbVC+tvjjSxcJaSrKkZmZuYXxOof3XGitymAnd1K
	gYd3JpCem0zGkzJei1IGrJszogGN9pWarkbe+ZpcSCTFN3TC60qe0rV9
X-Gm-Gg: AR+sD12Z8akmb4kt1xOWFSJMYq0+4320S2eKXXbON2Aguy8s2wiVnZw9mEuzJkHywlR
	NUezf1AHadAavjxIErG109dhctauG3mmodN+JbTMoybF0/zFVZ9JcsdsZc1Bu/7K7+NCeSwAPWN
	Ww9LXgscnkfL4YOIwnqWcsbo9a/kQwCncLr1QTuc8272X9FUunzMboz0gD0aDoNM4Z+DTghjeGv
	X56iJzX0gyJ1S0/nzVDn8RP+aE3KDyGcNjJKXmYfEJAkttdcVQySOmFzRqc536Mju/ippkQ+3FR
	CONfMrDWNPrEDhSR54xDivldsnzbyw2p8Yfl7YLgh+UrgO3IPVy65ZVYdAKj0EMVoP+rOZXjgQF
	j3bH26IjI2r5lSQvWmS0w0uPX42jOKIDmLlVgXx9nEWud7zRPtHKT7KwkDUZlwSLXYlsXCWRrw2
	4amhC1Qwt398dUj+F75tg8EUQyCuMitzN8XPrmGxdz7Y9cTDEAy3sV/+0O+WHEFx2SSSg75VFtH
	Pt1bDpMcdk=
X-Received: by 2002:a05:600c:19d1:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4996199bd2dmr245762845e9.14.1786363405567;
        Mon, 10 Aug 2026 05:03:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f05:d403:3a00:9de6:4b08:7661:9451])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdc433bsm307615475e9.1.2026.08.10.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:03:25 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: oleksiionchul@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Mon, 10 Aug 2026 14:58:47 +0300
Message-ID: <20260810115847.253474-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717132218.27007-1-oleksiionchul@gmail.com>
References: <20260717132218.27007-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Friendly ping on this series.

Is there anything else that needs to be changed?

Thanks,
Oleksii
