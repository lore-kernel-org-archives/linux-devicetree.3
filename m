Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9F2868A7
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827757; cv=none; b=q4hT9npL3zzBLZl7OiqvC0lWmr/szQvVWK0/ArzSrkc2p7ewL3zudiQOrnhf6d9V+4JEhW6dwrk4THKf8uwY1L519v0jRT3iu++qBOIKQLIA9IRFvViHv58JRFMq9D0MAkDxoWG+uZPhwYxtEY7SEKh+KZzO3Uy1sZxvWYAqdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827757; c=relaxed/simple;
	bh=C8DbFtwWr73bU897qlWowKdI+LzJPATt/h5/a2KEgZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sv5GcLtI03lGagQBqaTDot72NKSlVldO2tv9hXIRlpd2kiLnr3lqNtbGyKPECQR5NNkPmYSGzB9crDiOR/uRIELOhAYtImIFcs+FLtl+CAaKyi4oN0zy13mfA7pzZIr4AUCHXXfNqYXxvbt7aoMEg+/ubmd/2tBJw6Eke5dSDpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=EdJR0YkM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="EdJR0YkM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so55347535e9.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1779827754; x=1780432554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBYDos+g2gG8Yh/X4GriPM+bzzxtZiAUCWEAIa/mg9w=;
        b=EdJR0YkMwGNBkxbI733CqF++SVx1Hn2OKo4Mv5uTK0TR6SxzNLFViZ0+L3AYGjcNtC
         8B4WJy4ibhVVHAshkOWyeI83O3XeNV9nwbqhMmGwB1dGBvRvsudBFahhqCut/l0j7xYJ
         1lz2OKeo61rR6euaMxxWbniK66GS5/Xzj6rwRv32WETwX1qaFg1dOi2UtQ408vPxDcHB
         m9C0VQpQcfbwMIZFw6yo2iMkhrg+iJLTsc95TSuPR/Rj8k5dJF3kmXrhnnvknZcBdYGq
         2Ia/OXZGiLRF2xojQAg93lktI2Qm2zk8l3XGsxUTAgWjKjSLoicNOBuB9M4++gGyaueS
         Zd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779827754; x=1780432554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBYDos+g2gG8Yh/X4GriPM+bzzxtZiAUCWEAIa/mg9w=;
        b=qoRnEfF2knltOPU/6qSWhDEU8IjVK9YxrfHT2h9VtOGUH6qNvAOAOZuagUgYOm38pG
         4Q19+dgbGybgRSajJbVbzK/p/KdYaW/Lew90Krgpvv32VQhagtwLHI/dIbMfwcwG8RzV
         Ci/VPs8DNVaOWt2Sbaru9Sy3p55EpLZJ5eRVtw79NrITq1MGqooHJZrA38T6k2XLgP9i
         osnQbi4DY7ZkzsxKcQdF18ZYhj2iIDus/jD4zf2tueDl4tMTicxmsH6//e28I38HkKU5
         2wny1qH3xj2RsUwywBXdduZzdW280wmmfGw7SD+TyitkpGuF+gQD/UhgvR3BKn5PIzgp
         CAoA==
X-Forwarded-Encrypted: i=1; AFNElJ8XXr9SgWe9xqtRz3gPs+NWfT8R62JjtkF7ok6CfGVuidiicDNXCBzqOGGqv9j/7AgXnteYItBl6N+r@vger.kernel.org
X-Gm-Message-State: AOJu0YwCOjAIbvNLDEmGATbmDt6n7w6JO8EVPSr4JpR07gGDn99bTsci
	mGpmS5Q578JqtdvEmPpvSTwlPQaaDbWGjeN8VET5qgAsZwnzqWHPWeP3fw6OUwusiIBQcHlJ4Tt
	yilIC8hfg2Q==
X-Gm-Gg: Acq92OHnLjOk+Ry0bVfWUXMAEBQifwJHt9mgxSJ7Vd/3XIllwIMX2h5C3g3KmQk9s5b
	uuINc9i4FKAM7my8iOmobUZfo2+G8AROP+Z25QUMCmPn2sXe8TBRPXiTXageAqFlUpGkjSvMn9L
	xhk0Ix+NuuZ+8giAnTBuEhstD44xkvk4AK/eNTJLFQU/SGpgplVOeo275EjfEC2R02/mNMRTt3r
	ibjOAs/JbiJUpMAKYbFK+5SRTKNtFX/qN+7/jQe51xuDw0OGbSmi2JWYTdVpYIbifz2K340oQPv
	A3YBgDpjmo1S/ETFEyezxdV2zlf3Gjzq9yXBqucN3DD3fK/Od4er8Q2Xpw8mpQ0ZS0KRbV6Pzqf
	ULht2QQHK7MPyT4zot6ALpFw7WagYKDlMYPcPhgPA9PCfNWs1Pt3VdXI+EgIuKbiKrftqmep8qt
	042ZOdCEF2VLozU1bEjBhOv0AJdWZMU6xXxniZtPd70TLDL0k+pFE=
X-Received: by 2002:a05:600c:474a:b0:490:51e2:d992 with SMTP id 5b1f17b1804b1-49051e2daa6mr272126805e9.13.1779827753941;
        Tue, 26 May 2026 13:35:53 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:4309:135:1dc2:4f93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm620908185e9.1.2026.05.26.13.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:35:53 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: alen.karnil@ideasonboard.com
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Tue, 26 May 2026 21:35:52 +0100
Message-Id: <20260526203552.16717-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <93997447-2f03-4449-ac51-ee6a2e470d58@ideasonboard.com>
References: <93997447-2f03-4449-ac51-ee6a2e470d58@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 16:54:37 +0100, Alen Karnil wrote:

> I've been asked by Kieran Bingham to review your patches, I've
> reproduced your work on setup with a Pi 5 with a 6.18 kernel and
> I got a few questions

Hi Alen,

Thank you for resuming the work on the patch.

> I built the calibration application but it would not work out the
> box, I can see that CEF168_V4L2_CID_CUSTOM is different between that
> is in the patch and in the application? Which is the correct one,
> does the  patch need updating?

The CEF168_V4L2_CID_CUSTOM value used in the patch is the correct one.

Although the repository currently defines it with a different value,
this does not cause any issues for users because the driver is built
and installed locally together with the calibration tool.

I can update the value in the cef168 repository at any time, so as long
as users pull the latest version of the repository, everything will work
correctly.

If the driver is eventually merged into the Linux kernel source tree,
the repository will need to be updated accordingly anyway, because there
will be no need to build the driver locally.

> The tool to modify the device tree also did not work with the
> IMX477, I needed to manually modify my device tree to get the dtbo
> to build,

I just double-checked the setup on a Raspberry Pi 5 running the latest
6.18 kernel from the stock Raspberry Pi OS, and everything works
correctly. Are you using a customized Linux distribution?

Could you provide the build error logs and the overlay files generated
by the tool before you modified them?

The modifications applied by the tool are shown in this diff:

https://gist.github.com/pinefeat/1b3a258a193754f073e171b1ed33a0cc

Were the generated files different in your setup?

> there needs to be some further discussions on how we could
> improve the user experience when it comes to enabling the vcm with
> camera sensors.

I agree. I started the discussion on the Raspberry Pi forum, but the
driver needs to be merged first before moving forward with that.

https://forums.raspberrypi.com/viewtopic.php?p=2318070#p2318070
