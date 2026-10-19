Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434290;
	b=o1qNL6VWg+VbgHlb3SitkyRbski+qjIGcZDj37sQqgSu3+HDoBRjc7wtARJxbDZSBZMJ
	 FIgot49r6RLfeMdMJu8GaxvT+DU9P7ROE3RHHI3VMhrnDDTiLMwnX4UahzmFTy7DeUqcq
	 Gi5lpXVUZj5DcOdQ1YoGVKtfTIpJsJ03W270uP+BaGmmP2URUTafGWveRhag5uVqnvzB6
	 qoNrkTvJ5mI6cGeHB/j+RCjSKrQFAx64xiSMSjhf+OLQdbWdrlLsFy3Nacdn8udzg4mNV
	 2LeaSy4Tp+ponJneRYhlfl3P7j05uB2n2BR3PvnGK8wpCf1LOOT4rVuH3ln3MnLbmYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
	b=KMg/LueZitU79PxOPUwUJHNMxXN9FQRRrf54JqgWgq02LBPreZetCV4nsEbDXRewn0mA
	 UE6eKWHl09tQAJXDShWJ8W4re5Pn+i8HChjrzSSeaLe0FmYUW5hQxQSImbGG/a4WmL896
	 23c6S+F8qMAYQMSLh6DUPtOle2SYkU7F0GNGbeCUIDhYzHiABzMoYIkEbrF7MbLnigcsM
	 4HOGFR9tIpL1iOyqT8/4aa4UtEtEAZJ8g2QKWd+xVIziLrkSLl0n9EZfUCkd4HiJePFWY
	 lTX12wkXxHxClVX/zRNuyhXheckbmwU3JB4Dasal8SO1SAJmBjFSrFKSlPg+A0VqNQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEQoXKH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F74606A31E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F74606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEQoXKH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso27312025e9.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434288; x=1793039088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
        b=AAEQoXKHc4qVf2HIjiQ8hLWltD/WNmxMWjj8qt5UwN5hy1+/yKrcck/VhWskWsunqF
         yo0007HiGPNS/iWFOfPU+uMkVzFV0mVFotObqlrQ2gGZ1h5uzaOtd/PZAvrllk3OKRkO
         H0N/htnBfc9Th6zrFhkmNfUNHTOSduebN3AKmub6tijY53xDOZwxBXoXLyJnUkvACQu2
         z8f9zH3xplsg9qACQcCSLXriJf66GOnJZb4HrOCvyTuUJ1c+zEEZw8pWQy+Xje2QmB3o
         isUsgzbXIR3XQwRcpIrTdp+wNcw0rWutNAbNpJR7cLXoOL/M1OBQW7JSRiSMfkm4wo1d
         nkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434288; x=1793039088;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
        b=GilNH1ntcepkHTMww2HQ8r3gs/OHNfSCkK0jeXwcRz/sHwfqfRttHDU9TCgbqtzTi0
         fYly9GMX8yTSeRdjKdSSK0fE+lWrS82fe48kGt3YycS4m+t/1XarNvLY1cW98RNYaTn0
         EAW1tg2jkYF5M67IuCJhCpdzvhrYuBFlVujVFCbygliHg/19zgmPwWa3K26Zb4IWjm4x
         bUz7FTqhTk5kwuhOgJGV88b74Mn8a7YT+PwIct8BfhFDSR9cwOxUd34CzzV+O5x7byfb
         GHujbimKEeBN5EEPGWY0dqL38TZbJCt4q1KcAzEtx13qZt35QA2dXHCW0A2IRFR07DVA
         rXcg==
X-Forwarded-Encrypted: i=1; AKwUvByTkyc5HWyr9dFvSdYPaoxT4iLQVNFgDGvG/z7OZESH1Ytijr9mYF+3QKZxvIm2Qizit/PDwWXiv0G/@vger.kernel.org
X-Gm-Message-State: AFq9FYKwhxFVWp4WMgu98tY7Us1CSJv7U52FCv1Pqiaio/Rzxn9YLHt3
	lXwdZOF+MeaxOGFa5Se/SZMMtLsRR8zBrKbSXLJ0TMW6Q9VlFtTwxNv54b2ND/jd
X-Gm-Gg: AYBFou2h0YmNCmdtIfavRNdFFZBKiNUkXJFxo770km1Bpy99p8+8HxD2rl1FoJD70HI
	PPNZhgS8mN1igPGbZwqe6KsSEZGcrkaDNSiTKiQOT7YqhhPzZN4UeVPl2peg5rQaWuCt/iDPMIs
	jLyMwBkoplhqxA/NzBeGs9Q6rQt2hyPAGLN5nhcXOma+3L7Zgn0roX+P8ZWhgwFUc7RMF6hkAuw
	+rMxIQltV3M8k2QAPq9zS8ApBxHxbqKuZnOOIQ/YP9I2w90v5wQ0s6qTgHkum/CiWDvMDw5UhIa
	XD7ItU+NUK3PDiZM4HHO7oCrYQOqm4ytgzIy9qM6CB3tpUJTch6hwyYkNrPndDZNkiqDGKMKKbv
	vj4j8Bs7TU0g78+qLCNhkqYBW6zmj/2LKMj3HWryYiCyWle6zzZARD5/pf8mI3HyupulUUpDQ2V
	ET7VE4YDk1xLPTcDhMFy8MRlGa4Q2AuRb9nQkn5Duvbs8vFM+iKyOyDx4sgMT/4F8W91ywmAsqe
	YHHvWorB6x5a/ViHbHNMcIkLiOWvKkV+oSQ+XQ/dkocEODT7kU8IevSFgqdXou5F5XyP2hgDOA=
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr174049105e9.16.1792434287773;
        Mon, 19 Oct 2026 11:24:47 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm613743f8f.2.2026.10.19.11.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:24:47 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Mon, 19 Oct 2026 19:24:45 +0100
Message-ID: <179243379000.31842.4735750009847702427@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019162722.25587-3-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me>
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

On Mon, Oct 19, 2026 at 04:27:50PM +0000, Sergey Lebedev wrote:
> The clock tree is computed from the input clock and the one link frequency
> the endpoint gives, as in vd55g1. The MIPI rate must be an integer multiple
> of the input clock, or the sensor would run at another one, so any other
> link frequency fails probe.

Thank you for posting this. I tested v1 on the Snapdragon Surface Pro 11
(X1E80100), where the endpoint is 420 MHz link frequency (840 Mbps) with
a 19.2 MHz xclk.

As posted, patch 2/4 fails probe at the integer-multiple check because
840 MHz is not an integer multiple of 19.2 MHz.

For a test only, I removed that rejection and left the rest of the driver
unchanged. The sensor then probes, the CAMSS media graph completes, and
capture delivers one complete 644x604 Y10 frame. A continuous five-frame
capture then times out waiting for frame 2.

The 1200-pixel line length below 900 Mbps is already present in this
standalone driver, so this is not the earlier line-length issue. I also
tried the ST one-lane OIF_CTRL value 0x81; the behaviour was unchanged.

For comparison, Peter's generalized vd55g1 series, with the 1200-pixel
line-length fix, streams continuously on this same machine with the same
19.2 MHz xclk and nominal 840 Mbps endpoint setting. Whether the sensor
internally rounds that rate is a separate question, but rejecting the
configuration outright prevents this Snapdragon model from probing.

There also appears to be a second difference to narrow down after the
first frame. I'm continuing to bisect that and will report the exact
cause/delta once I have it, so I can't give this a Tested-by yet.

Best regards,
George
