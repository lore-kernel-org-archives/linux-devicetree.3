Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585248551D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398698; cv=none; b=UXRWWaR+b/v2ZSJj9tiI5ek0B4anIMd/DL+atdJOGRUowPj746XtGEkm4iFVEQCXH3ZxoDKHYz6NPBcO8Rg3IOth0Lbepuzucz3DXYzaBhB/Tq6bOm7wQ138WPhXtAxQV7LQ26r/Ttn9fGH52TZ+3lftohynzWwLigcxETyVhys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398698; c=relaxed/simple;
	bh=PBtDG7IaGArA5oidyV57104ug2/3g9vZYpC1ajDvsoU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iIE36WTNU7Xai9dEGm2zEMzNZrVyG7ZPzxDfzMyMVlhmdj+1C+nXiugS1CECom3+DzF50EunbZJ0M9NH4sbXuaG9jZ+akTTZOhRi63v3YXUQUJaSSqz/Jz5qcc+ROOGtV1hqZTWJDMIcLXdmTkD6CJdXRfXI3akvIP5PLVQyNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mvJ9/HZD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mvJ9/HZD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12106785e9.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792398695; x=1793003495; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=;
        b=mvJ9/HZDzZB2wM3g/ie6rVcnirtaSOu5DlB3Wbsps4hKIxmXMhNzWC+hTdWPR29f/b
         CwywdBBQI2kFJzCgVKG9slZuEYh4rpGXIt2kiFbN3Q6tOaCJ6zx51WgkxE0Q+ryZd+WQ
         3xrH6aoU09vUVrBlUoLb+XjPy3FuDDQAqHEPwZMKAf43HAD1PQSoxmJFTvv3uwtghShG
         fRvF3UdGmmCRFDLOz/y7LkPabp8pp+G5R2IY53T2IUlh/98GApglWd4TrnWeMvcXEx8a
         OAH4FgBleSgFZIE58NtVRz8NWvb9UDqoOfFxMAl0bo+tT1i5K2uah8UHcrdrBY37Ze5P
         tOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398695; x=1793003495;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7oxDA8ZM54hjX0LF1jWr12XxVGQQXbDbmOXq61AZsk=;
        b=kpgXKnxZN0Kl6F0Aqx+V34u+ZDTDYPVneRwu9qZjUfWIK82uEEfiSN/BQycsH+b5xX
         FqILwSzhqGHxTlUuesOwNymRz8xv7OIGErzaQ75p+rdfJNEbhlkFtCQncVqwmZmwBXqZ
         WWCtPT9BbT+GObFcTdIrRVaW1jM3Whzh4nY3poX7u/TnE87/yWJvNnjv9/metSWrvnnT
         ngncdIShIKhBovhYLUHstv4D3Y2ry2WSh3GBLPO1IA2di9YSP1ilJHHBPELMn7jPEeU5
         +8Z5ecxMf18tauWH6zZodVR/hlP5cjU45GGdFp/poFbzJ6JeI723CJFp4MXCXMzq8HwL
         e3cg==
X-Forwarded-Encrypted: i=1; AKwUvBx8NQZGlTQKo275GHbZTP8jsQ89NU07ld7CLUYJ57AfiW66HUSu11Sy/b8+beukmUdt+stlqrF+vieI@vger.kernel.org
X-Gm-Message-State: AFq9FYLts/V5g+y19eUav5EdQOnmOsK1uJImU3PZgjsUAmmZWdnIjdrj
	KcBTviuc3BL1C2iqDuDG8Urm/Qptag3nTO2q+SK00dDg8f4eQR4F/IG7rx+bHGn8RTo=
X-Gm-Gg: AYBFou3aOR+ejSmNT3O7WkycD9MB4U9Gp4YeZsNPk8o1bRh1xL1gX23A4fy3FpwAI8P
	CgNAykYcFvuw/4vkUg7t5YqH+xZhfcfDYWf6g+antzgdNHV6TJ8S0a+DEGwvioSAeKzQHVGWpx6
	N3bPq8MPuGl271fNbXQR8dgXg4WNrWySbaBQ7fd2XOP6+b890e3Cc7t8duvVsZsS3516+WF0TTX
	XK9s9ljdLDIs2sUPCPLLvCoS8NigU7oFfk0bGJzm5rpTNORsj9ozTuZ8HQFTa6DDqKGukBlpm+Q
	tW0BLLazA1ykfqIJh+4TE23B/xQ/9xz5/E8HhqL/dETdB9hYYULdNZUuv/H0qB988kMUi+6nqzz
	JgwSG5wVdzsJYI9JDYzMF5MEsMl3MLhPv5Qil+5bmaUvrm4OqTgq1NHz6BLw2LjO9fAapYnghbi
	z+5xW8tqrtOhKvtqJ3T07CDtpKZr8by7FklSc8oGA7QFG+AllJ2tE8vGafzaLvOgViTEfnjxaf6
	WJRZr49QqChuYjGaBMkZscoTgtJ6zkD
X-Received: by 2002:a05:600c:37cf:b0:4a1:df14:ad07 with SMTP id 5b1f17b1804b1-4a1df14b4d3mr115190655e9.18.1792398694579;
        Mon, 19 Oct 2026 01:31:34 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c10fe9d3sm316410855e9.13.2026.10.19.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
From: Alexandre Mergnat <amergnat@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, wenst@chromium.org
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
Date: Mon, 19 Oct 2026 10:31:10 +0200
Message-Id: <179239867012.642420.15110854236483587234.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=409; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=PBtDG7IaGArA5oidyV57104ug2/3g9vZYpC1ajDvsoU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBq1dVWFu5n7LST9XjNvuRmDW3m8PImRaa/WwJvF
 aGMwo1WH0WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCatXVVgAKCRArRkmdfjHU
 RYoYD/9v5gmSdVR1pNcJamGYwCTaV5rT+OL0L7Hy0d0zenqBBKLBoB5ULjy1XzRycl4z3uzaIyh
 HQUxpufXinchYoRParULVTDzEU4bDge3j+RivbJcNFkvXnPCQgkpifnmkNcDXTB9oUboxK1rI7r
 +tAfXnNtM2XECrhINjZemeKSzTK4o8hFFQJpNqZ4vaEGd+p+yQ4OydfroxrsQ4ussOJJPt11pGq
 XYPpjNtd0I0txUKPm4uxzqeKXpecqVNan77gYpf2Zy4bqjyPIJ4J8QL6kPbR5WqdRvNYsOHGDqJ
 dl7xZBqbcEbBuPZcPfrVa/SSbEyzcEhseR1YtAQVTAC6839HIwcR1jpJFaDI9G9Ir3/FpYJQLmE
 aeNNSiYLiXr7xplXwVUPfNl1T2lJVnqdJG3AIkiGgPrgG/ejs1a4kvLbqWOHQj/tmmEwDk4AIfb
 xtYYBpnPtu5B8G7FThL3jY6+qKUYBxCqmMmqQlOJspghF2IILNdA+7mnxsIhLRfzU2Rl6nFTl8z
 Geg76d4ZObp7A2TIzxpiApY+ZYVr1BBhu+N8aEMC2oJlVTeBUzWsCz0zgnTHPk8MSX7lzXsUqAV
 Us+8pkPLCQTVvlh75nO0i+L8I/yvjmltf99bYdYnK2F2Zi6T6c96vwUg8+NuXxvyDa5WIYTa2nc
 0xA7MHt6FvBAylQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Hi Angelo,

I'm working on mainline support for the MT6363 MFD PMIC.

Are you planning to send a new revision addressing the review feedback
on v12? If you don't have time to pick it up again, I'd be happy to
help address the remaining comments and prepare a new revision,
if that works for you.

Thanks for your work on this!

Cheers,
Alexandre

-- 
Alexandre Mergnat <amergnat@baylibre.com>
