Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7BC4EE859
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565336; cv=none; b=ZoQW0scRku5TKKZFi0rpX++4nZRg2D3Ue7LmaL4o+WSgsMlyvEGYPQ3Tkvjz9bX+BWjWeaoQjq8QAfLBeDhKTsTjtKHS+y8IGEMhAWXo6RiLiOSIkqBOAxLS22OgPfYwFE7LjZTUC1vGImDGXd95jYqSffpi+wmTWVNYfaw8UmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565336; c=relaxed/simple;
	bh=TqbeODdYQEEftgsPxXsYkF97yhYGAJosPirzjv//pFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oot4QvJbTs/n7vv2RBQwGMxxNg9BejyMjwCG5egZAlIGIcTc0CPs83Ox/ZCyMHE84SEVAD4rhQc5fSyHFJ73PpTsJUOwq3Unt8e/sxhHedMV70zHOzgF/qPsBsBdyzB4zFohKQUcYWosx0OyLYGiIiHZhZhiMAySVbicKVSD5L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SriF5u9c; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SriF5u9c"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6af07e08so467555e9.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565333; x=1790170133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqbeODdYQEEftgsPxXsYkF97yhYGAJosPirzjv//pFQ=;
        b=SriF5u9c3M1yb4t2l0x9yA3RoFsu3Vst90q9fR5CzgrcSm+f6B4+JUdAqc7x96bTgL
         CyO8ie0Zzaizi1UAoyc7uo20C8BjH7pQS/5JkPsZdFmmtT77upCXbaWFeNGDWR3/B1jQ
         rMT6g9DXhRShNlVFmSOK6+TgqeMYJF+7dvaGDX57R/xL2Z009KCxCGyTtn57/0XKDN3g
         qbD3dulK479ejAT1VxqfFvLpmzb4EI8jnkFCKAmI207Zke2+/3NR1vR1I6+a9senxIHG
         jAotvyloepLXY2BOs+4qAW0EDVxRkGfYX9sL/GfcidJ1YcMN+sFw3p3JBj0apE3M+B2p
         ykZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565333; x=1790170133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqbeODdYQEEftgsPxXsYkF97yhYGAJosPirzjv//pFQ=;
        b=tsn4Qnf93W/98OQsIu+0NiT99VLAjgy3+ljr+U3NTNbh4TW8SXBqAo3VtrBqUBz/gI
         J6dpJOl8Rm61KZjzKnHOKtqznAPAyaiz8wnGtQnU3Y5788mdbdC8sgbicdrXL0wOfwfs
         504r4cmNperVb8eDn5/6dimqwq5/M/ch9TYMa3CC5HIMC3eD4eCGlmZL9j6Fufszr6BD
         +lZhpU9DwIo/OLia9yOxfoPQXRQXEuUT7oLTjlc3Zp3DXXoyLZB+EyKeb/AJVDxSURlG
         qocYlL3jAAg5yOwcQtrbk7oX21or3v9CMv5eHAjluSfQXRodLWLY7ddcbFNnO1Wcs78f
         aG3g==
X-Forwarded-Encrypted: i=1; AKwUvBx/WhAoqt7Ji9gVySWUBsxAu2lbs5d26c/k5oLUaoo2bNJDv0D/q0fibB2mqkBMk/qUn4ZBuAxWr8cV@vger.kernel.org
X-Gm-Message-State: AFuF++nVnCmR31xpom/yW8fjVhUsBB6xuHW0qrQij8So7rgHQdiq4rrK
	zKdoIh0e9q77LkNWMzkUXKCgrqoaYN+iB45WEqRKu4GqFq6UuqCmsG6k
X-Gm-Gg: AYBFou1SwMQLNjZ/Woy9VfefcMdVWwUQAdIswx/+cqp3T7qmuoH/foLloUBXgZL555p
	INam0P7VSPvIdq2ndOcRwy5tNGWKgcg6H7z4YdNglT56UhQnV/+Cs0K/6D2FXXPUKFGzuJT1ouN
	cO5Om5jYcU4hV40jIhmW90TMBEybbFfmO8UY5c1+hsuCX/nO7ia5bdfRkBTiORahwpm0LiiskE3
	RtxtexNpgEcCtzoom9vwFad3wpG9iWPbBKND04aaqLQhLLENbcKtQ+mxEJS23J1fSLw2/K3lTJ9
	h5XIWRtd5kFeqayCajlg1Q62f76r7m3jVtz0LZEs24H7Uins+skentPCHfEUypssqaV+lkkdGET
	TsqosXCcl3t3+PLuvC4Mbh1ORIxqqhTQAsW4MeWnHYl8TEL3OxxAttXoMmogmN08vuG8dC0guqY
	AJTJopEvqR+zeeUinJE0y0Jaw1mUDy8rmBXqUkrN+vrbG41Fj1E5g3qcPBOt/Ea/P7cDK/hCIdm
	3G++W75xYJ1IPdTlw6+V1Et9mGu9Nw8O8lHTkMKF57oYy31LyHKmx9nFeWAkScO6fm6z2C31lha
	4PU=
X-Received: by 2002:a05:600c:4e89:b0:49e:745d:5768 with SMTP id 5b1f17b1804b1-49eac4112e9mr27160505e9.0.1789565332521;
        Wed, 16 Sep 2026 06:28:52 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E02001A623C292D45A2B3.dsl.pool.telekom.hu. [2001:4c4e:1b8e:200:1a62:3c29:2d45:a2b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847da0cdsm594135e9.2.2026.09.16.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:28:52 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Oded Gabbay <ogabbay@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v13 03/14] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed, 16 Sep 2026 15:28:24 +0200
Message-ID: <20260916132824.13527-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915104328.45901-4-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com> <20260915104328.45901-4-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jiaxing,

Thanks for flagging the job_lock change in the cover. I re-ran the
same protocol today on v13 as posted, 2+3 and 2+3+4, three runs each,
same board, base and config as on 12 September (JOB_TIMEOUT_MS=2,
PROVE_LOCKING, DEBUG_ATOMIC_SLEEP): 73 induced resets with nothing
from the driver beyond the timeout message itself, no MMU faults, no
lockdep report or warning, and lockdep still armed at the end on both
kernels. Of the 126 inferences scored, 118 matched the CPU reference
within 1 on all 48 channels, and 8 missed on all 48 with the channels
the scorer prints reading 0x80; in the two runs traced with the
kprobe, those 5 results sit exactly where the 5 -ECANCELED completions
do.

The limits are those of my 12 September mail (all resets on core 0,
one client), plus one more: the model is a single 1x1 convolution,
which Mesa submits as a one-task job (one completion interrupt per
good inference), so hw_submit() never ran from the IRQ thread, which
the race you describe needs. So this shows the lock adds no lockdep
report or hang on this path, not that it closes the race. On that
basis the tag stands for the v13 form of 3/14, with the same comment:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2

If 4/14 changes shape in v14, I will re-run that arm. The scripts and
the tallies were prepared with an LLM assistant; every number above
was counted from the raw files of each run (scorer output, kernel and
serial logs, kprobe trace), not from the scripts' summaries.

Regards,
Igor
