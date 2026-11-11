Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372124;
	b=hxZRljjoTm2ZF6AAs/SxT/cN13s4tS5lm8l1OybzXqBhOe0bnSRNOzoyX9SBJcXbBTer
	 cAXZK2ZaDaFyuEtaQoG1lTdsuHHiUmyEqdzcfmepPn2X5tRgC/ruUXr7NWVkKT1y08SCk
	 wnysePm6ACw0u7Tr2Qg5XzwJR4ZCXU96PJaf4Xl1xKHhk7y5vqrx3KhGK1ZBcZNDIQyqb
	 9MaWSdwSIT8LitXNi1kR/x3ddN+0zHBO7nj/IQ+D8xDnai/7/WfSjAB5oHa9BVxZKu2xb
	 +R7qYZPbQsRAroysIQgBeI6n68kmG+oFbOz6AJBVfDwL8Q+/5fVAgBYT+c1nBNTauVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
	b=ZAJErfp8l53cjA+9OyqSbZ5c2uDpgsamZ0cr2QD7Rl7V/kVVwmJSqaj+T2k8iBQQ9RdY
	 3b0YIISejjAL5GFUnApbyoEAHqqIIVMIbKz5CeadhtaFdLzlr3nBd1ouySLF0e1dVTawA
	 wfGhvsXGHPvyvCjqFr+2+7hMmFSMectWdefnYEKmdN8imI5nb0LHV+7FI9Fd6XqLnmdT6
	 QrCgmhvU+6KPE8SwlVbN+49BsvbEfE4yV44tpunLETkAQ+rBXgtjohSLnJ73W+4yy6ZQZ
	 EOBVwCmWWGSD6FIa6eMKsYz+SSDP36Z3VRDVhvNu2v+QCer8ePCnMRmwlfEWSp0NFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb8EYn5U;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF08D606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF08D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb8EYn5U
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso20935eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372123; x=1794976923; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=Tb8EYn5UL5TPN4jrj25I2JBolJE+4LfY73wyOfqANHUNWQ//ZRgSlRYHUVN+LIB2we
         MfjhZtYgorMdYNUUdWxpYmku5O5oKZ5DXLNNPmZoqDaFMmvNL4HwqCrDmRa5DFYFoTwJ
         Q63GoZ/tv02pI42Ch0YDvkYx/G0C8eJzTUJPlQfYc6h6Cdhj/Z2lNDN33mqpZalTb7sI
         zFgSrDJbeHJ25XyiK3oz7d+AXggzRSfVZT+wwmfeRA6sKT7+AOMlNUl0NKXAb/8A/jyh
         Px8hGxqnssvWdlULG6GGl+pi7O/1Am0iOHjypP8QT4Hg1vzoe7dAX04wln+YCX5neXAg
         RqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372123; x=1794976923;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=vVvPoOoyrsqWTbTFGuJ6oifiRhsOCEF7/w2iQs9mCZtKhPLySv6PdTraM8K+YIJ2tM
         v57YLezKJ+BKeG056SFiuEixIv0ISw6mfFAMTmVcKAfy8kZ08zxpKpDQxdEYbY5QNV8H
         x2WN5/je8v+bPe5OCizofM1pBPLwBKszetSM52Rz3eWfshkUav3Nc4UqexEUfh/jzbX1
         YKMr72dqXAMVFxzBdnct4GXZdxgGvuURmDGhZOUiJcWosn0CBacqZeidjOIOhev2GIBN
         Jvoj/XnvH/omgUJSl+M5Ld82pYlqQ4YXDMC/72SvvwOGV+p0Kc8JGpyZcjmx/dpNhWmY
         gX2A==
X-Forwarded-Encrypted: i=1; AL+hErEp9VzSPt31sT6xhjo6TkRc3G/FvlmnkPhzfMbHoNkK0nfHw65DwKZPTu2qbnd7VBzd3NMBgXpBTG+z@vger.kernel.org
X-Gm-Message-State: APuU4Z/iICW3j+fn+fmNYVBfimzW9GQYsBguHknuFQHzrEr+kM67zI+c
	0bRyeShKpc40n+EcFrRSxJFVuMbsQ8DJ/eG4RUvk2YhKaFul5+NO4ULU
X-Gm-Gg: AYBFou11xOsSJHTvZHUf3F/Ho1C0hYZ4bak2q2dK8gbHV3xH7RfIJNV9aVEDRi4iL+w
	aMsrYBoSzbnST1x6sCzxMTizk+EZkwA7Y8EdFYQOAmC2E1QNmwpkMtJQH08p+4XgIwUN2IhEGeC
	3RCBsO0XPIzcM37PTGFyrTW/43KTko2mOBjutuJuUYC17rZE43EfrMIYOp48yusRq3fs0olGRmE
	lC1f/H+TAULK9u1Fizd2GBlWbmaC6wt3Avuw5sV1EruJqqx5EEGwG8GYq7caCfHBRZ6L6CUu0bC
	EaVeoIauPcdxoArxLC0YMvG54JeVUNugsIHSK1WZ7qKdJxIWwr2Hi4Jv2VF/BpZEQ2yTNU5kgmX
	Y4FIjwLbFIiCI3VaPYWi2UoZpJqrutEc3mynZ6LpaEFgNxBomf0JVkyXzvO5PV25JoPLgTtGso2
	2Q9oHam4YcQ/noCkFa/NrZqjdStY4lC9SJJLiQvvTVC2L34KmBrPZsLBmPKNqFp/SPz47MhUcLm
	lJGXkm2g2XPnuAQq37rolk7QslmtBKeUlg/Gjaq9KCuPz+LVdhT2NSvk/olq+0beFZosn1txc5V
	1DlNDvZAqJGP1ESHXj27V0J2
X-Received: by 2002:a05:7301:4184:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-37685d753c3mr2904495eec.20.1794372122835;
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm11023535eec.12.2026.11.10.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Date: Wed, 11 Nov 2026 12:41:58 +0800
Message-ID: <531e628a379b6733632a25d998337d77.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Sarah Emery <sarah.emery@canonical.com>
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlan@kernel.org, docular.xu@gmail.com, dri-devel@lists.freedesktop.org,
 heylenay@4d2.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 me@ziyao.cc, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 spacemit@lists.linux.dev, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Sarah,

On Tue, 10 Nov 2026 18:02:42 +0100, Sarah Emery wrote:
[...]
> I'm sending this here in the hope that it will be useful for a future 
> revision.
> Is there a v3 in preparation?

Thank you for the fix, and yes, a v3 is on the way. I am working on it
with a friend, and it may be posted by him rather than by me.

I am glad you brought this up here on the list. I had already noticed
your work: the series, with your two fixes on top, has been running in
the Ubuntu 26.10 release on the SpacemiT K3 boards.

I would be honoured to have your Tested-by once v3 is out. Thanks
again, and thanks to the Canonical team.

Cody
