Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035823;
	b=uoPRGwOyWM0P8yte/B0kKAqyuE90TNRu889XWXMTqzDOekscbonSzGTejHo+nRCZz7yu
	 dH4dEkSr0N6rKgCs3Aqc3X2xCTYiveWShlqn3uyu3GNvH+ZxZRHAaURBT6PY1Aivgdjp0
	 Xb8pG+05J6tJxDrC/XuYrbe7j21cA3R/ruHFJK+LJCCV/trVVDBhyF1mfS8KGQLc8qzbD
	 zl+4Li2UGmtB7bNscohRPZ9cAicKIW/iZshX8mOye1O5nEy0nAOrivfFS63n4n1qFcrHO
	 D79YRxXPTR6gfeHI7D3URaZ23sHJuZEjvYZTe8/Gsl+H/z1/gOoxidfFFj8gTUAkQKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
	b=XvXi3aI+YYGm87+oaiMSYO5QbA65fF8b1NCZcAdxiZS3bmA99z3nmAdoh5FYwzBBKh+t
	 Cv8S6WJmTCVSOIjNUpcaKMIT6u2HYT2AqQT2XkNTESYL/O+nGZomOWe0JCpRClTnLkVfR
	 +1+zhkUYXlecSo2SPeNDrds6vlgw1+dQTn8oWyERaw/yHLyK4d7Eljen/3U1xDvYaCQaG
	 xM9xR+kG490ZyRj3Lxbpc2XCNf8K8KXyf4WlCwN+C8gixJLolM0v0BNtNrtHut5kRhfjM
	 1kvy12taKBEQoFJau0mpmrdsSBbHOI6kEsb1pqwsZLcSfleRcp/a5g4lMIYin4ECjrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdv4jdP5;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1C606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC1C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdv4jdP5
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so279169a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035823; x=1795640623; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=Hdv4jdP5sy08zBfvTne0xomG45Tbd1SP7Lw1QxQiIEaqMHzUWHLKKP1pb5bPGJ18o3
         Z7cgIX0JOKAMgAGkY8GYD8LG45OOJVsRuBguZwtDwir/MfS/T4RFWjFTWmVabRKHN6/i
         m9VD9crrDrCVDJLSJ74eFbq+atvvEZ0lDoAiUOyBNqFLDROZRWxOqhOozmcRGUqOnhOH
         w/1no8qMQitL31Eac27CIrgHXZbkgmAKaNqgZYprs0+nDRr3Obh3WwCugHtc2xm5179u
         aozEwiHn8TIh+3WD3JiobVeFkGOtW2KqSzVMLbaEQBmANt+nwjFiyLk4JMy+ogR+SGLM
         Jgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035823; x=1795640623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=vZleer+ipi9mSi8DpCJAaVO7tHUu2LQ4QcZViF9rbSh9VT1MHKhipgQn2WRaezqtHT
         95HvqapuF0hmNZXkCi1ofMpOhJJ2iPwPGvuuihIL4rNhIsyxwabkkVWxCks2vQIUmTB6
         G4vRS9GVt6am3Pq9ihJUnH4SmlCanPc4pVPaT4M4Ck11J/RjGC6jkhXqq9ZOwxcMQvAt
         xqj9sSWDssEDIc3UJa013pbOaJqQZEZy3/FI4rK+f+R9/oi8O4/LcBEcCoXKF8clqyid
         tBX5JVW5YCyrEjwd3Mu7gamKzVJGbHD5NmGrSU/W7TxwkGMhkD6DtwYnWsURazhqZWBl
         AtIA==
X-Forwarded-Encrypted: i=1; AL+hErGXZfTqm2rkS3la1wUr1kd4scW1CctcN8Qb4X+oGBb3Yc5XjI5fXdZusIoznhIfNfnKi8sb5rsRTJKW@vger.kernel.org
X-Gm-Message-State: APuU4Z8i/1M64jRFr+t/X5nGXA5V2nJoBlOlXemNXPrMBx4bxwPf2YSw
	9NGqn3AngDWrekmB2rETJwd7pWrDFgZjjcC9g7pG5NjwEY2TVV7G0lLK
X-Gm-Gg: AZFdTZfwjS5E784iJia/sqdP0ppYqTrogJaMU4McWJDqDJxmKRtq1tLRiAkNZ1WLEVZ
	LfmX4TnsVjzQVi2Zn8dKXZE6AReN2abcwfQ/AYOePFXuR8GMh2podTooxZgwR12Meu/PlGbXkbV
	GDty4kV3qsX7CohVLV0g9RK/P66GVjo+8h0AbLI9wzTl6UsSJM27qK0VaL2rjgD8bpmXIFnNsQC
	LQUNK/iQ9RTmReOgTBw6d0oHbNu4bXJWjbaP0dxF55/+HOQcZNh99/MCVjEvxBv0QAmC2Vojxeq
	l13zhcu4MgwPB3vWc/s8uZzdRwPiIuMleD0KzgxpwEaz3IoyQieWC9gXwnbIzlLSgfoOFYy7tJL
	tKYFSli1V7PoKTVCG6trF9+Y3S0+KXmXtSQc0/SAlT+UTK2aNsiEnH8T4/DiXbJnst0Ta5GF0pf
	wUWZtSDou4g29n0rc6pd+eKQYgMEA4jgwd1YxT0zKE/pXuN5JLYL6qyTuB6on2d/a7Df/YTeehJ
	dmvoSsop4RgsCoaCHlRHCAXZKJa31w/1Ej/CLKZyqfc82eEkC+R7GauympgeogOCs7cONhbvUIB
	2N0=
X-Received: by 2002:a17:90b:3c81:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b3d07aa355mr3694363a91.25.1795035822845;
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f7066ef3sm865257a91.11.2026.11.18.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Date: Thu, 19 Nov 2026 05:03:36 +0800
Message-ID: <5167ad548a578a23ed8d5172196b36f0.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 08/17] drm/spacemit: add Saturn DPU core types, cmdlist
 and display MMU
In-Reply-To: <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-8-327d7910bf71@gmail.com>
 <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
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

Hi Thomas,

On Mon, 14 Sep 2026 16:10:25 +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
>
> I've looked through the code in patch 10. How does a plane interact with 
> the hardware? It apparently has its own command list, but there's mostly 
> code for the CRTC update.

Thanks for the review. A plane programs the hardware through a
command list. Its atomic_update fills the list with the registers of
the plane's read channel, the driver points the command-list engine
at it, and the hardware replays it once the driver raises
config-ready.

In v2 the plane only fills its list; sorting the lists and handing
them to the engine is done in the CRTC update, which is why most of
the code is there. v3 will move that into the plane: each plane
builds and submits its own list in atomic_update, and the CRTC flush
only submits its own list, for the composer, and raises config-ready.

Cody
