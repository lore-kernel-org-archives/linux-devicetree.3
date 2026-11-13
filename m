Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794576308;
	b=r08/eXsaH0ykRa28K9o4Wbrdp7yUcTtyfd7cduAXAEdb8o4QRu0ECmsomDo+mbU+en6R
	 vU+F8b6aPpkir9X20koiv17mRwIJU93agQZJni4F+4IJhXzosMh9YKuVlR58wXSODY7WP
	 UbUEgHOaz4By6Kqc24UylfSrTYTpqm76Urbsanv7oKxzfqmogqmzkGLfFYVjEWT8N0Cie
	 LHZiiwMY+L27WYjPGWlS3vJ+2aN72gJSLdjlsjsQfo2DQD11E0PPZHK3db13U+tDvF482
	 8QoOd3amy4IgJzHhMuJeWeiCcJRJi1Tp+GoR7WAroQMpY4TDOtN6EpYaq0qout3bI+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
	b=puAXWVoMDVBRTFZ2BAJhqEx76OYaeUULYLJ9548emSz96fEwjBf/CPJB2hphcol54mwP
	 Bfi+HBNVAyEi6WrauijNC2fcBxJgaojRnNKz1gE4FnaksNSVKSCffRMdlizVcXIt6d/43
	 iok1ZwG7ClyIlYr2llA3bD536Pki1tFFNBgVEbhPe6xZbLb2q4fJNIXbwPAQl0X+9IydN
	 nuQSCmhwH202wIUvOXC5e6hVhiq3jzMO6RQnxugUZJcZuTntsWlwDcidEsMh+4f7IaL39
	 JTdhvlNzJyXlK3jlYNHxnjm0sIbigmIZmQqLAAXwCg6bj8xOa9pZdnQ0HxJ+MA7Futw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPfUO5Uv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76316606B57B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76316606B57B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPfUO5Uv
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1189601a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794576308; cv=none;
        d=google.com; s=arc-20260327;
        b=hVqF0BFQoVmpbQeLom9WfsXzDO98h/8ZmoV+pjls/l28P84UhXIVg6tccD3qSocAy4
         oUHvrE3mdldRv+COkxCHy2/KQ+BjvvKAl4CUmCAH7shNEugM1+q6zGCHZfdQ1iPq3w0a
         e//CvpVT5Yf6ywI9p1cMdptysm7hMyeHYo6QyfEhWOinPScYIyIjRncJXwu9rnU5fVHB
         VFQHU9ZhYhyD1T59EsVCZ1/c2QGmmzcuVWPgek8JwBufO3ziZAXDCsqVoqXsVBqM7j98
         EkCEclfQKuhaODGi7XiKEgEMstfdBzdNqstxREB5/xrL8FA+cHTAlU2aAKRO5JoOl3G7
         Z31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
        fh=Du+zNQJRXxm+OQoksmbMj1a0h7H3X2aJTw4pEjBmOyw=;
        b=lcHpONAN5TyVou8x79KR/bSZPAxk/Z8BBHVwMKDzpJbtXg658M9lkHJCnOB4C19Ab7
         QWYOqJIbctZDaetImENh28JLSctYYhotGI4xJFkCEzWLbFwdKqtJgrvnEFcIH/Hxdc+3
         Y7TM/TJV5y9WNlN0uQhFuMPoqXVuXv9HNDmQsnvktNkp6ayZB1XPb8ipDtdM2me7MeWu
         8J5UatUJ4AqB2njy7sIgCMrrVCZHZGgkxjQGM7aoJXkpzwjJjiQE5qyGgNZV9/3Z+Q39
         ghqfFcHwsWO6NrqOaqM6/Zc6pcj+7y+E/gL88Z3HVCrn5CODz2dc5lSIwyRlcqVFh4qu
         wsDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576308; x=1795181108; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
        b=zPfUO5UvqcBR2FNacPMuUTq26YY2GRrlBt33eHQz1ImceJ4LHszUfOGyIjlhgGMDFt
         61Dg6G//C3CGsNm8Jwa9C5sjLsY9gCBJi5jtHBTSMTuKLsRD7igxfV/F7lUJB5JLMbg+
         RcFGqK2A685ZGpZtAjqSMiWTf3S9VTCBJ/b/Mek61mqMh7gz8piorIiTUC7EBdlDlTqk
         gXt9p4RrIUpyleZxfwzjxNOL7B4jOj5ufcISHVmIifrTZ9SrSI+r8NoPs9re0uabg25m
         7xpt8j3uzsTU7fNSm1OPj0u1UacP5ZxKXh00fPThuzwyvfsLCQcSKVJ8n7EO4HMM4yxi
         QIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576308; x=1795181108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
        b=MspgHXlXr1C+jC/UVvR21/XimLJeREpVN6D1VNaEJTKg5GgZ3IGWtXNhAo01PUn7rF
         Ax+J5rpo5NcieH9gramons3WS5wGIK3q7+oRZM+0qI51aLcIJoyTNq3ibCKgKswGgMBC
         x99jyzl6Z2QDmjDXtjFyPxa5RNX9p3+bgEWCxZoN/64ant64XKJrgAfYgzYoV0XRpLJz
         BqBjMGKmMQaf9jQqqzIMTWrMFtlYZy8VnkWfOZ3x8sANbb9tO5tKWhbAgBmWERZ4jdYG
         8066vuGX3ZOURC+hErQBJGgsCjVOyMVOBoHQxwaRWZIy2YwYWO2YG86QAEldGFQzOhO3
         pzXg==
X-Forwarded-Encrypted: i=1; AL+hErFLyJYUggQ25Kxa4XWt5OYfl8GbEVwyYOh3n+MkFdmTk1XhwAnOB4flnKlghWAFmHLtlp7lv2df4taz@vger.kernel.org
X-Gm-Message-State: APuU4Z9FKvYfV2C1xuJlbOr7fDYXTFAa8VBpOPUq1uCt6wWug0Tq9jZw
	i7PRWyyGhoZsMpAHc58kpg7gemEMYf1PQ75EfD+bIwPlF+YDAf+XZTf8yVXNlSL0syuiSmhek9a
	1pwBoHOvfY3e3wG5cFN/EnSFjIsm57g==
X-Gm-Gg: AYBFou3Y0K13HR+O2XfrjDIaICto8iw90rciJEiQiWINWsXThzcs20y3sCZ4zOmFqJi
	SGwijhhEWrgB1W1niGSIai2wMc9PPPW11YotFrsKavOweiAHK/ZPWeqvF6yGcqAOHrIpuAuWX3d
	Flk1JusOUs1YG3zBgDcCOo8Zd5a1IshRh/wlCoTEzEiDHPkrTXOrVBZ+WFQVmVlu/mReuETgWhb
	L6T2SfmJ3fGvqc7Wd9qlwWnaKy03HWAnJ7xZaCqrfEyeFv3dZufciQvAtLqhcDHxTILfzqNI1ud
	aim6OPhKpvYh+oAHyi5t4ZK/pQC3D8SYcrftyqjcF93OEF2LA/7p07fGMBxqKLS3OX4FGNa37EB
	pAe50vckFZcrK6swQx1OSzzDQTePeR7xhXT7l
X-Received: by 2002:a17:902:f60b:b0:2e9:5c29:995e with SMTP id
 d9443c01a7336-2ee0dc2bdb6mr25549575ad.41.1794576307662; Fri, 13 Nov 2026
 05:25:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com> <20261113-fuzzy-awesome-shellfish-2d93c0@quoll>
 <CAARotke5983-NFonNAnLbpzhEU2QZ=mt9CSNi=CdBxVshcpD_A@mail.gmail.com> <b72ccd2c-d26a-4559-b09f-1a0a2207add8@kernel.org>
In-Reply-To: <b72ccd2c-d26a-4559-b09f-1a0a2207add8@kernel.org>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Fri, 13 Nov 2026 15:24:55 +0200
X-Gm-Features: AclHuK-uu1jJJ5-OWPL6fdC7q-L5bATE3bIoG-NpwgnpCOGdUy-cDFX7oyzGFms
Message-ID: <CAARotke3nDJfYEG0Qskrj0uXAXCGyTE7rq-y8mR7daPFdCZjDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

You are right, sorry. I missed the series from Nizat Mikayilli posted
on Nov 8. Please disregard this one.

I will review and test Nizat's patches on the Galaxy M52 instead.

Best regards,
Asdlerto
