Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085A38A736
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792218334; cv=pass; b=IUOIez/GaPE31x0CYMuvNeeCuMaoJNvYHmTAqx6LuzhJNLvoHHvUSfb4OIn3CCLAE4E1ldHQtFHkSHgjh9GPV+kXM304K3vb0kaJ2WLNHSyRZmZCeaOPKnyZpt77xPHvGDZCI0mEFsZlFSv5TGSr90nmkoCi7airNf9UMsEoblc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792218334; c=relaxed/simple;
	bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4+RU3rZLi4T3AkEI4WZecjynghvLcJnHsWGTKsxjFlq+P7wctX8wYpQFVyrsbWGa7ZgLz4BQ3Ox9GkhEi3omz2zuPqRUH8Cot6ztLEQVwutQoOfARcO0kF7dSvOXGjs8H274XbRNsBTi1NjbyXT3DLPn2U9m9oQbsG8ZpkjOuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APrfs2YB; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APrfs2YB"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679965fb848so659610d50.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792218332; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9ABd9IEEVukoHt4twr5RQ6kT+d0UHn2jdtYuSluNYtwLrirTjnUPmP0E4VlLhZ0SN
         rBa9kDVeylMlsiX557Jjf4CXgqBEXUoDAOxI1JPdXjOqDCi3tmBKI4RCJGLg2pUP6DMx
         KSW5gK51fyQHAv4UKmqhqSO6IPpEHLh/lqrUOZjdbHhTAAABVe+WYWVNPFjfSH+Wtmo+
         JjzmMqUbz0deHLlse4LmcPSB+mI2D6V/o3gfYGEy+9QP4fHkhrcVDnDJ6WiAc0q/4y8v
         TdnSKNtdTVSabbhn8VwSzjdRpdy9Z9t4u7vu4hBvqc3ykfOS+2lTyol4YUQDxb8ocSRb
         dBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        fh=ksPUlxSCcbGvSk51IjD3tGyYBseV9shVebp5y1DbdIc=;
        b=kkaxRCsw7X8wj58v53RNY6ocLN+BQlgTZGkMxotjevDg3iJF0R1fUu9k/DPEUHcuL7
         tjwwuuAW+BZokCbVE3Q+1eokIyduz6KtgvV/CtKGMVe4kl3CZCumG/cwjDupru1G3vo+
         0g/7cRoyRhLMTdhWmmWt9B+vbL9rNX1Dwgwr6CH1/cHNPgOQe9TFqNP9lTMxWZ6xmgC3
         uEuk64pkZawtspWB285upr9UbMI4J2xBxrHj4qP2oSmybEQ4dd0Y+SPmesoIT+SLYpse
         1k0eRP9uW2VPMPP1Jr1JDoXWleldRPvU2mU3dQYOqV27B+FwkjhgM1BDau7bwNH/dFCG
         mgdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792218332; x=1792823132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        b=APrfs2YBDFHGJtPhqgMs0AiPP3svRWUO/jQoDuHxksXf2dphKg2ql9PZaW/wYWHaMC
         C72v/g7e3oqUeH3S8wGCIPAQE2WZa9IFB9eqejY2BV49oLnwA7PQhNsb/IUY52AfbmfV
         dHQYCYT05+ivErla0Sr3Yvpk9lTknw3IpMmTIyXwkCcknieHuzdDC/yYSesm3YwRNfTQ
         cw7t/scBWjh6xGsNPu0xu/cFZDY4IV5i/rQirWWpz3aTLMbbWgVVLyv4X5Wi9hGQUVXc
         ixFIs56Nt0Tyus9pxL5bFVtWzdfW83X41sxH5vsMoWrPgALTA61OTTD1tBJyQZx0dkmN
         6LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792218332; x=1792823132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        b=KKaQ5o89vHD4uuDXIvxsr9hJA5hu3qFWuVO8C/4f4qs54AeeexudWTlK696NOxjpe/
         CeWIAWbEbBHtPId3tADA60P2SkyomP95qu9Zdtp9oTPdTueRKuBDoPmY1vvrckrylSw7
         +eeOvjwT7m1+G0KxyM7Nd0ya14kD80dJoMt7Y5qhdgDOzOT5qZXyjL6thXLLRkLsf/iA
         2pBHaValP+HEQ2vP1k1DiQmtydx81hNyLruWB12kcNpY/sDIn8Fj9EA5JIKOECO0t3fX
         DZeYjVbTFx87A5GbC0yqt0Nn3Fokc7lvJpRCrsdAU7lP1S8AmemyRoQSZxF09C8AwbRr
         NUTA==
X-Forwarded-Encrypted: i=1; AKwUvBxAP6KSJdLEeqBfJ/lO6qWj0+KzCxuDoPlMfRNaXeCmr+5KRTXegY2jQ+DTl9g+vWN2taiO2gNcZ0uB@vger.kernel.org
X-Gm-Message-State: AFq9FYKKGLkuwBtLZtuJK0be7Zy9f93mUyg7Y0TTiegdgChKuVM3X5iS
	KvEKMXuvOohdCPJU76p9lohlf9LIiz4jPB8wzR+Z1FOj1ddjyyGOLcpggxxpXQZTzaGD6tpEoPS
	CEW6dwHjmlFjKIO5K/PJRhn3IuRYksdE=
X-Gm-Gg: AYBFou0S2I84iJ6TZs5aS06nLPRUPPVJXjQoE2gxFmQLXwnPpAFqQWV8QexejNk90tb
	R/9W2Kd2+BiV+T8n5613OyIVN6BcvWTQ1WalljvMsz1ulJD8Tssg3aCfhzLNHLiYH1tqOS8GqeE
	HWjGsv1Wqr/txieNkFR90gKQruU+pbpsxx3rlZEvQl8qMMuBSUvQP7q8PXhcOf19+8VfkACtEh7
	Npb7rw0uFQTGUHQnMoPLCNoeFG18UiMezjc9QGPYeT173ZeyDxRmXjHa4Bc28iFB69X1eQZ4R0P
	KzPn38eEOS93gjl4F2sJEISfHLbYXvVoiN7l26uZBs/arOdsFhWtYOE=
X-Received: by 2002:a05:690e:138e:b0:66e:5e37:2ff2 with SMTP id
 956f58d0204a3-679ca4d20b2mr429681d50.4.1792218331819; Fri, 16 Oct 2026
 23:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016090930.947830-1-wyibo6109@gmail.com> <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
 <CALQ9cS49UzOPA8PUh8Yf55+D5oim=9YRF9iHw0Hi0sXuZFDTVw@mail.gmail.com> <2abeac6e-226e-4fcb-aa6e-e0f89af27251@ixit.cz>
In-Reply-To: <2abeac6e-226e-4fcb-aa6e-e0f89af27251@ixit.cz>
From: Yibo Wang <wyibo6109@gmail.com>
Date: Sat, 17 Oct 2026 01:25:20 -0500
X-Gm-Features: AclHuK-mqUDVbuqHQaakUsbtYRPEG8APrmj9DlSeAzxy8wzOvvdrEuT53g8Ab34
Message-ID: <CALQ9cS6GYe_hYq7_iuQb4xe8Qtxu_xAzGKWUgncvObGL0NAcCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I agree it's mostly documentation, but I won't send a v2 yet:
the same chip id shows different behavior across revisions, so I need
silkscreen/firmware confirmation of the exact chip name and rev before
updating the binding. I don't want to upstream unverified hardware
wording. I'd rather send a correct v2 once the rev is confirmed.
