Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006502;
	b=ztYjQIpdLjlg1W2JXuHc2W1LEJM+891Sm40IkYG4/agG98gLkDWxCtAhUTJSv6k35W1c
	 RXXkYE6+QTVGuGWDwJricql2al8Mgjd/3QA+TqdIHmrWaz9Y1cZ4kMn5+WOxJB/Euuq3H
	 +AuJdr7cy0zK4yHINA1Mi+ujg0Mh6WwTJbVKrHsKJuKEns/jKLwhAQhejMY6CNH4ru5Ym
	 jHytcFHE0lSfoepdQ5NsXhR+pf/tUbpDLhfttAUvFfqrSBCB9+o6ZMn3lpp307AKDWJi8
	 YskCPekZpboBiZkpdvvBxr/PsfoOkBUaZOTfschs8vEuq+R+fPg0U50Ff2f49OuJRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IfM0L8l0KO0jyxCjtdYXdfOsa3a+oLhBOi1/EZWw89g=;
	b=l9MrSg3Gj275XPLGwRQi2+ohAZ1WkWi74CzSZMkrphldgqHH8JG8aiocjWS+E4yEegIb
	 vdAdDS5q/hd/4YGMA8SypmQ01pwy3B6GhDZU49agHondbmm2MRBGUmu/dYGw3VC+K0FSS
	 6hN/+k7OUKkeDxLoIRlxOLHcXGf849gLjP0dJNtDZkxZWAOECGx2qbbRm8rTmrAphX1mv
	 HA5m8sHfohntnOFSKkyak8Y66q6ylsMykBK+19uwI1VaqUXyU8IJoTiPKY441M/9cUSrx
	 jsF+fSIH9gAZn1ijZkSdfPqTBAtP4pGEsOas4yHIzlj2tQSRakA3pkm3sG11QLV35eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EphXuosv;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB67606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB67606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EphXuosv
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b6b22be970so404892b3a.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795006502; x=1795611302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IfM0L8l0KO0jyxCjtdYXdfOsa3a+oLhBOi1/EZWw89g=;
        b=EphXuosvpZhHwI6IoqC6D3LFGaENEM7sy1ZRdj1dyjNvm/QjfgRYFiVIyZDyoJbans
         FRFPiwS3AhE0rk+194XgBKD9NkHDmBdHYWEgsBdjvga8q8Ct+cNz82NXuvLyOtxPSNIJ
         ubK48OlxNXIPGW5oMX34QX+tkLFND0cFhvJcGTyGf+NfaiaNNghgtmGjEEIvZ9RKWSm9
         b6PraheLd02vraVWfG0AeqgW6NJfgBaXvNWTsTEghEHLUIRi3mLXlBE3H8dltr4f7FXT
         ZMoUyJFl2W1TZ38XlUiXSZLai/CUSZMWGOyZfgmWRpp5Hny09i+czp77OG+jp2/0xJhS
         /MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006502; x=1795611302;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfM0L8l0KO0jyxCjtdYXdfOsa3a+oLhBOi1/EZWw89g=;
        b=lxkimwIPjvQ811wFtJ+C4nqAMVeip/oDlAuq9ck6uy6RmnE4Xjg15lRhF34Bt1vBTd
         xI8yNuNQ6ysLF6YGbIkepDXXNfzshGtlZ72QSlBrlr0JCzleQoIBxf1p9iXYvze0BjaW
         Gxz8SkIzP762O8oKnnC6eww2rvRmRZOa7/tW4Pto0OUG28qIs8xHzhJ1xQxO8L2sz9eN
         BdvSCEdePgLJ6V52/2eaz1YGXEmDrwezdiE1KLl0cBlvftKmEN7m3hyy6Vt3CR7TmjIk
         QW3CimVsRKkqobNr59GXRvtaVk0sCS6gTJ0i/mqFEZiwRyRg6Jky9Rsjm4ZO5ihFdPx5
         dAqA==
X-Forwarded-Encrypted: i=1; AL+hErGZUEihZFggcR+hxXmtXV6F6EC1cuX+RDpNB9uFNMeLGCPI+TByNg28+7QoM4eUVHFYyD98CwSEM1Zq@vger.kernel.org
X-Gm-Message-State: APuU4Z+p2NJz38QfpcyVP7zrhzjziyj+t3YRkBJ+uzpsxNvF6s7eENcI
	CybGL31YjJAITboB1Bn9yWaICiQfqUwUgq99Sby49VFewE05u2GtbLZo
X-Gm-Gg: AYBFou0cJQiO01o2Nk4JdJepRqnj4lWHDhrlvNaaoCtcIQZEmGqXujSKVpdskcg+xUG
	F++tSGFW2gQ6B4++Hwotw6x1XRt1FGXAIANrj6Wa2fxrTqQvs1bY9MeDq4kUG0rd/2iRlzghmaS
	JRZWpI/HbeDp4H3c8Rs6TWuOZ7w+ft8nM7yvZt3kTMhlXnsYljTL/lG++Vw0tqypK+QNAsjKy23
	jY3wTDGy6CRM+Pg7seFf3dC53T2kGS8s0yLiW83WdboyR6mVHwQSihI8sCCKYP9h1AX5d7Rdgto
	ASEypMibusnlhcUxArWyjc0zgBobNUyxXYsOmxCElbLC0eMox3B6U+Ibj8mlFvp7UNtB1982pU6
	zwejGyEpSllvT1CfHxJ+ebt+UmvBsNvAYtCaX7SXwN7NfuwHf1OUTVgwvFaoar6NDMMuZm2nep/
	AKAJFAPfMQoCQfFazYHbJ8DrCtw0f6i5k+PMld3fxsgRZ9O2+0+omtniCTtUh2kZ32OLVFus+m3
	y9UNWS14qzn8gPBqA3HZxlCIsVWS3vTq6NWP3efOJWfnd6SQBIfc6Bxn/UwfQplc7qovR1r5eDj
	mcM5znGmfgn+KYklqYpGLzE7SOFx3viCmImHfVJdgZKy0BYf6Hy6k5q6KZ/DpAXusmZ5Ijg1Kul
	RV52TM1Qo98zmQsuCPcz9FOB1sv5qn8zZb3/45UUhbogoHRJqh3pgyPKS4ElSvob22jpc4q5Cq7
	oAiFGUaNPdoyPbAiCO25zT4Qmginvvh3ryOnA0XT5SAx0VEi+U1yo=
X-Received: by 2002:a05:6a00:1d86:b0:8c0:7517:b9de with SMTP id d2e1a72fcca58-8c5d3e116f1mr2084551b3a.32.1795006501788;
        Wed, 18 Nov 2026 04:55:01 -0800 (PST)
Received: from kapoor ([2401:4900:e034:2676:5ea6:3ff3:ed45:7b44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99a7fsm1199883b3a.1.2026.11.18.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:55:01 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Semtech SX9xxx: add a reviewer entry and binding maintainer
Date: Wed, 18 Nov 2026 18:24:49 +0530
Message-ID: <20261118125450.12512-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bbdef966-c5dc-4101-9246-b668e00f62b7@kernel.org>
References: <20261117172612.25535-1-kapoorarnav43@gmail.com> <bbdef966-c5dc-4101-9246-b668e00f62b7@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 01:34:31PM +0100, Krzysztof Kozlowski wrote:
> I think it is premature. You just started contributing and your early
> submissions were clearly showing that you did not read kernel docs
> before posting.

Hi Krzysztof,

In June I was still figuring out git send-email, and a problem with my
setup caused those repeated postings. It is also why I was not able to
reply to you at the time. I have since worked through the process
documentation and my setup.

Since then I have been working steadily on this subsystem, and 23 of
my commits are now in maintainer trees. I still make mistakes as I
learn: not grouping patches into a series, writing commit messages that
are too long, and sending new versions too early, as Andy pointed out
here. Changing MAINTAINERS is new to me as well, so there are mistakes
in this series too. I take those as part of the learning process.

I asked for this entry because I have become interested in these
drivers and want to keep working on them, and Jonathan agreed to an R:
entry. I understand your concern. If there is something specific you
would like to see before this entry is acceptable, please tell me and
I will work on it.

I will not send another version until you and Jonathan have had time
to comment.

Thanks,
Arnav
