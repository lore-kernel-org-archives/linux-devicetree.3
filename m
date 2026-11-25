Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594220;
	b=Vcm8LJiiUK3WlUa5iOpkHF9H85AiDJR6Z/uPckRMnyUVZfZ/qwiNaC0ucLYkldCUAgeS
	 PsRIsq9CTcNGraMtc6nRWynJ7nXS0+ezlAzA6OAXdV3eI3qBZnVLgqq33EmcHLmVoythJ
	 n4rYqcRpOuBI597RAoEJ7x02qMbm2f1BFAtA5qrZFcMMvUurRQVzC3YsIvut57d1tm+m5
	 NE6mQjv5NqjnPRM9bWgnRS1jyJRS3wFAfOvK0ljk80kyA7O/urAYFAWGNHrL6xBIwnqfM
	 PjDwyjQWzjMnKHm8F6en//zxqmwqD6XiGwg1kDJf7MPP6eqYpAN7zUUXIA8TBOqzusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BHutBPzebl/J3zCV0MJgpcVp3sq4NEl1Vrogec/7Cx0=;
	b=MXTeHwWJRfjufI/qu0MAO/iXN4XOCnk/uom6SFzXAClDMF8MwdvyReRWnThAs6LqXLvn
	 LJ0c67zk6we7z45f76oy3I9Kl2SEvXtpCLc27bYGorJ1KdNepezNFUUS1YYV2o/nPOkrj
	 yOsByEEmhx25jxZJY0ewaMLnnaxYd/GRlRlu2rXgh0Q8UHytyNx5dofVzEKCcZD871jlo
	 s9vTBCocyv+sSW7oeZ7vLWODp1R7ffj52tCAmnbNDYSqsYbvUZqZhJVV1jdLkPOf1v0Bj
	 yEH7L7mtX4GM1s0F5yHM717CjFZFf23M79BK1nqnpX67DRfy7Yi2unsHTL1SmEeitiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFE4XIvC;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74F606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D74F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFE4XIvC
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b43d6c3485so636525a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594219; x=1796199019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHutBPzebl/J3zCV0MJgpcVp3sq4NEl1Vrogec/7Cx0=;
        b=qFE4XIvCt23IRfOwY3ry1L6pAFz+UK00kqi6i1TVSMdpVQbNFtwN931JpbTb1zw1In
         XS6zBN8UnNH1gebIuuo5N56bwsfAbG410X7yamdDzzJEB9SyapRq+ZIEkFEDm9Mc2OHN
         Jkgfta8hMmoIhyHJBepMrHAs+01o5xP6XMlYtahsgMJM0W5aThJTIOUkw+bkwNRK8gZI
         fi2SyNngFz1yS1ORSHWcRLcW8sxP34kDNV5tTPOoU2h6XM0athMW3PvVK07CzQoLYqjI
         P6BFdhq7KVo7imLPTcYyjP/WBywDeZy8oitA47bYCEF8PXQEHXzxDGAAuh4FfUuyflVV
         2Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594219; x=1796199019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHutBPzebl/J3zCV0MJgpcVp3sq4NEl1Vrogec/7Cx0=;
        b=sWFQmrnyw+jsQnAHlwh2qYgpHJEjjro5DyvZ/ZFc39FGlbFb7idzHjlXNca1iLvkAZ
         3+nSgWbS+WVja2XBM6nMutv8C6IFr34iWm2NYym/CkcfCL8/XJkHiHnbr+XTNSYK/bWZ
         8ZRZEmBBRI+Ptd4tbL/7zovirM1tGzF86Qx3pyTkko57s9mljN9RM0cb5j7Gl0UK/q9V
         GnVkzRoUUYDy7ApgEpGBR6efYgL2VIfYKUuVgcaXafRhJZHA3q/YpKQaqABnHOBSPAb8
         R979OqY3FS9ClHy9yvR0a1ExloGNLnSQWzxeMWprwDvK6Bc7E1MHmBUbNOcFcR1e18iw
         ZV8Q==
X-Forwarded-Encrypted: i=1; AL+hErF8OWg+qC7qcj1O+neGUXShALJC+p09GJvNZvErBej3C6epQdvz+/g2sz1D+hxunkzITx4+q0bzB9ju@vger.kernel.org
X-Gm-Message-State: APuU4Z8azvUqeCL15e2TKqB9b2YglqxNBMKGZZF4mvd28+KvXLJchuTZ
	vIgCpDU+aYmKlctQQ8aWr5dlwLljB2FyxSOJkPiLcu1lOt9aJmXOxoW0
X-Gm-Gg: AZFdTZcqaKMlx+8kICMiZWqelsh1os8BFUA3dqBLUCnAgVCG4P8J0lLF4/aTBvL4EXS
	IWBgZiaeuPDoKtJNmSu1vrBumzzFWIU06Tinw5c0seWV0apQzq5Yfg8hu1tP2eh/uHFehKqpBah
	osREL23oMEDCak/yQMb6aSiWEKozLiz+0mV3sPIrHt+zYp3WvzpkCj+PfC8MtBbdBsfpczQlgI2
	NQEJRK3nEQ+fUx9A3tjPvYsXeohdhyBAX/TC4LbYpCe5srXJrH5RN09rXlzg0TLBtdCPoQF4bFC
	JYJZmgTTnnj3185UAuN1g4p5P9FKi5fgeo+XPaILAVbyuUxA+dHHn23Im7wYv6xJa/JrlOcwsmC
	gXw5qI0ymTkOEWRedaRFXOuwtNjCfxbt45Kj52tU7Dsbbm4kuj7ZAGngxZZN/pfOOxsJoXxab/i
	OUtIMiP/dlYJCq2QFHxAC9FesIXgtCZpWsJgL7EUN9HSC616ygQ60yUkS1h66ZZp+M3MoOJdTVR
	Disg2UNg5o3cOFM3yeEkMZtv5ibFi6877rk8OKTUtvcTeVTT+EEZAwmt4+qQAwNvgOk1cMrPt5R
	9Wsm1gQNFCQ7hWYuA1OBFD6b+fzY9L2d
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr26491950a91.0.1795594219507;
        Wed, 25 Nov 2026 00:10:19 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b09:6850::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25528081a91.7.2026.11.25.00.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:10:18 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: andersson@kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kaipeng94@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: (subset) [PATCH v6 0/3] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Wed, 25 Nov 2026 16:10:11 +0800
Message-ID: <20261125081011.1243275-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179416929522.628393.2913043282200216817.b4-ty@b4>
References: <179416929522.628393.2913043282200216817.b4-ty@b4>
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

Hi Bjorn,

On Sun,  8 Nov 2026 14:20:10 -0600, Bjorn Andersson wrote:
>Applied, thanks!
>
>[3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI
>      commit: dd851d601d63bd157562e7fc054eafdcc2ffd936

I have see patches of dt-bindings and QSEECOM in next-20261124, but the
devicetree patch is missing. Is it dropped for some reason?

Best regards,
Jianfeng
