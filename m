Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660888;
	b=guRScH3NVR3haTKC7iLFF52IMN65saz9XIy5XwZaPzuqemrH+ZGoj1cSuwYToNywm3fa
	 WZ9e4hpOzsJnrpL5aiGUb6n735HWrj1MLFPOOQFEG5BJUrsbGk7QbDN6UaIUt09pk5EzW
	 N7RV3T7fe31gS6gLlbOzNTb/R60WXcaSvsWxoDyeFJdyMXBWJOAg++UWNzKsbl7UeOqPH
	 95FQt/rlIBjOV0woNbw8dCe3FSJ5FG9qTSEY2cjJk3A79ekjswJQRMahGxFon6/9C+z9f
	 E69XMTD3BEBIfitRtMt079dwJsgNwVOiy4euPSQ+wmtcMB8ByKcSeOpf9Iv1JpnTAeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
	b=00c7fvYT/imBy0Vp7CnvSk0oBnYw+rrqdhLhAQMjyY1nZenItVnrpd+D4w+xTDIgshiA
	 pJ6GoLu8NCk9Jt/hrFGRcfnmsKR/qk/6GJWMhaUaTMUKWZ0z5QUWswTMPaFHUFnWis1T7
	 1tbKy5Tiwc/QKm0fvVy9f2yF7Tsx8nrPv4MH3sEaO1G52CZkAeZUQOX5a5IzDHDUUWJP8
	 vbRX1TkoWpMZZMWJTvOLF3tUkC3eCeM9HLSgf9T6VMr+sKzEKFaJ4gCZwDXbTrHvGe1mg
	 ZcVGralqkkK/ljkJmJaNS2NVdVzsGxwuqPK26XYJ9nNnfm3kLUwAO8dFR85EwfFdtgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=dkAxV1i1;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F1606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 12:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2F1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=dkAxV1i1
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1756522c88.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794660887; x=1795265687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
        b=dkAxV1i1akrX9/iclASyqOcS7hHX+zkUiZgtkaofoh/kUhm/eu0SPxn5wiFBiGK7Xi
         ZYBxOFfa42CM+EoxzQBF0yfyWPCPJbV40XW9Iohb5vEEav6UxAMpyR+0OW8rsB8qtGtx
         ZepN02yz7bQqdeptFJ6J8U/THVphPzbhr48eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660887; x=1795265687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
        b=fRNCS+GyrOtOFO0nlj3B48ifBezaWLZmIlwYqiI7cRml/RU32xvZWVPms3cGgSijBk
         wlt0NPCLLJoYCfn5p3sWZAvVUeTmrD46cpnotrTwS70nszyfnKaBqPUiVzd52iKhG2iq
         Fv5jqx7qTLDri8sWcFRkIHhJ5kQt/QPNgohy+BQcCG4GgAvf0bJnSVo7GZARwRgtyq5A
         CDJ6qsjl3pYHNRy9ve0AlL5moTwqzXXS88crOVFPr3woh0+PwSeiWcKQHMN+uxd3W4dz
         fv6oK04VzRGFpY+M6voI/M1+HaWc5OHqlmidEwvYeitsoVGQsTF5S8Zq2+bwmy2AQsXs
         YnzQ==
X-Forwarded-Encrypted: i=1; AL+hErEPqFZfYBOttbYhDIGmDyHG1NlXeIL07n/dR5GsOjGSU8E04ITUR2hPm6VmF6s1O/ftZ66RdS4QnpIL@vger.kernel.org
X-Gm-Message-State: APuU4Z8PFACoKrXpJ5XY8sAo81BROVB9Y8kuIXEH8G3xurCug/VORyl7
	v1w8PmQu5OGFRmJ/etKqNbeBZi3+rsMXq+XyTebADZE9t4GK2R6To5LjuHK9GL/dUXo=
X-Gm-Gg: AYBFou05+RCGf7t0EG5hvX1CO0NZL0O/614/eMAEXu65N9G8MR8uxCpFIbuhvldcA7e
	hTvadFuKc62hhHR/88VI2goMR+6cGjTYgayh7eq0mujkEiIO5umf+jxjkmMhKQnoXkxpWx1wcXJ
	dDKWL3i3iGcOEx7V4gNLHJmdLBFFCIMU5R6M21+cRN/vAdeDdDpXxxwCk3o2TVinAQs7kM5aJDE
	EYKtY2JRjMUdqKGBlvDR90YIyrvSpPvCBmY1eS6WAGolO7VN2B2AG+V+NDuyYAUxUzzTKBV+Zvk
	fASH3pdDqJpCm38AUUti2ifjxKT9igb5sJNur1UTVXQD59bX9iuHlWcxXQTbNIK9GUp3xqfqbTR
	IgpLTs9OXO5b7HcNXYPTpxnBthOlp4Zhc0olh8I7PJ7GPRuEe5HKN6YvRrH8mMnyNL3WJjvIrjR
	tuIT2GaN5OsMLBG5IGug4FAI/v4GYB3BapyHulOLGfJsc3LZg9JS83CMHoTRN2B5RpPY2siBGFE
	bGf5YuGOpSKXxFJIadyvd8iOqe+mI/FsmPivKIg+4LrK3kaTev0pvpLbawoIKvvhItLoxa3L1M4
	l5VEv2O/RGD7NYmCkcJ8ysrYOpE6RsK0ytmzMMsqdYrr0WQ7sQx7mzsMf51Lh6gz9XDJxL4T08O
	4o96rQ+dThSJY
X-Received: by 2002:a05:701b:2706:b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b50311d3e0mr5111198c88.31.1794660886535;
        Sat, 14 Nov 2026 04:54:46 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15468097c88.12.2026.11.14.04.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:54:46 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com,
	royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 00/12] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Sat, 14 Nov 2026 21:54:35 +0900
Message-ID: <20261114125437.9986-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
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

On Sat, Nov 14, 2026 at 04:05:17PM +1300, Jiaxing Hu wrote:
> This series adds RK3576 NPU (RKNN) support to the mainline DRM rocket
> driver.

I checked the accel/rocket patches for regressions on a ROCK 5B+
(RK3588): MobileNet inference with up to 6 concurrent clients, runtime
PM cycling, core unbind/rebind, GET_PARAM (returns 1) and recovery from
93 forced job timeouts all pass, with no warnings.

For patches 2-5 and 8-10:

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, ROCK 5B+

Thanks,
Sidong
