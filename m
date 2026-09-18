Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86014D17B6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725978; cv=none; b=ESNKUSzSdpuav8nvtgePpwl9wOYhjtJXJYhe9YTh/NiZHfyrXVOMeC0nP+Ow7UKw8U4LyZFtVHOBLY3C0O44FVxDAlI0+mm/GZG5Q2wyAmOKhtEorZxn6+/4fFolwHLNWwMpbSWww4UtMyjlicyM6AHKNuYC3BcDjAPu6KUAt2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725978; c=relaxed/simple;
	bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPqV2QWNqYjGGL991S3FqBnlYRjW0Qa2tubhTRJURatVFpib+aTENwNQ8bxHmYGDDW4g2xuTpQPuSvayuVwZYvsleC2dvZFkciNMW6Pfi9VUkpFlY5c6r0DjrYq2obsQEIQbaRNVLfvtR4hPUw84blfYpsM10ptJrqs7ahkOKSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwmaNpy7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwmaNpy7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so72003f8f.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789725967; x=1790330767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
        b=gwmaNpy78/xbD0P9d/Skf3yiI+OvGv6GC6WWwpq+ZwSjMS4RUeU+63H0ka7NhZz+Zk
         0JbBizwObmhNrRl7M8sI+c+/8iMvB+m+t7WcKy9hVwEh7nR+d5UMgMjeKCPCbnDl5Fmb
         gpo2teQazeTJ81DxIIuSVp0Cx7/YJ1kgAj29o0hQ6cERIcooX3zGpWMxk/3a8gG/Y5Jc
         UxrSaoT0OT/B6CQ0wwAppqt9CqCzRjwjlVtXQoYKdMUWcgacWwIWTXLa3xvs6TTsSSBX
         vZhoqbAvg2dD8Udy10ddfC1iZOKMxq2c/aAJ8mx9uX/MFdxonK4nV2jjC9EPKQeU/tC9
         3qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725967; x=1790330767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
        b=PMHUi60A7wmbBDQSEIRak+EWbP3uG2FydlLXzTOIGt0vH0AOor5Uotjq+DrkD0LRUR
         uzVp7D4xK0rAXWgbuaqrKlj5i2l759Rinllw0O1+8C4ldKPxhllOi7dgYj1d6x66uQVI
         5m9bviN7T6HuFuut0DmnIWZduhfkb/PwFYzhDEaofxUUQtdfynJ4ZtDHEWalSCXPuqof
         PdjoMb0iosGNze+QViKAZK9R5wvndW6WYxN/hTNeAGmgpPOY8wgx+2FMdBprT3XnoG5Q
         F8u+Nuh1jTI0FEcb7Mv5VQWsfKRwWGfg4gEnEYQzu3JQ7voCFbGam2g/rVkvDPaqlfjU
         JuSQ==
X-Forwarded-Encrypted: i=1; AKwUvBynQdg2+3o3dO85VYn/0JeaoZ8Xhf9nfU/r9+kiAiiW172O8q1FKXkFDyECQqt7urMD6/0N5V5Sp9go@vger.kernel.org
X-Gm-Message-State: AFuF++nuHBhRk5TGvbYLViXY0le5eUXSOCPFOpKoD16m83Rq1tfB9m6z
	5WzY53ZSQAcf4Otx/g49ZFBkQcJtTDgV5P7ipusO7pPjPNU8YE/IciXi
X-Gm-Gg: AYBFou2XuE/rhet6F2xgFmdGvYnk9qP7pQRR28/Xe085DsPFSTQuFgotHKE7MoPDsGL
	bbBMHaLIDjkd9JKWqFdIXx8PaWm4SAi2p8thCQjRlrJn/lOxJUBvNRVkmyXXg44haJs+lDrqem6
	wZrGdoc5tFvaVpLYDGqkiVKPX0d/MK5gu4FHHsl7rN91RczyimkYn63EZ6fBRsC67y+CUaUUytN
	/j8IqeBm1zkYz2YKgjQ7fcLTIMDs6Rm/XCMsXq1lPKr6jFRkjgv+56Rok0QDAPXW0L0t0bXqmOP
	/5YyVPilFCT7zPM87Tl5zXjBbxAt5tnHTn7F0xXXTM99/jNYzWKZdrDRSXcYO4dGJt1nn4rFjEE
	PwN7G2X6zL5AffVOt+mxj9Y7rHK768reyLH58W2+YOigBRtJ0adSWrE1a3hQoFu9mZlgRoZHrF/
	nv0VrDqRxIquo6yO8OXfz/Fk76pOXqegLUK65nJYrsN8IIISSK2vwvECJ+WwQn76ZciutwZPnIe
	b4Dqhes1qGKbP9dUEyMJRnj2RB5jUNE1qC0KbgElEkfVfJrEZRLNyx+n/tlvBYi6pOLy3b5uB88
	PqItH2/IqDySzS0=
X-Received: by 2002:a05:600c:83cd:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49fc7ddb90emr15837745e9.2.1789725967027;
        Fri, 18 Sep 2026 03:06:07 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm2922671f8f.9.2026.09.18.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:06:06 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] accel/rocket: DVFS for the RK3588 NPU
Date: Fri, 18 Sep 2026 12:05:43 +0200
Message-ID: <20260918100543.23974-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tomeu,

A gentle ping on this series, two weeks on.

Conor acked 2/7, and Nicolas's review of 3/7 means a v2 is due.
Sashiko could not apply the series, for the reason you gave Jiaxing
on 31 August: its prerequisite, the slot-search fix (link below),
is not part of it. With that fix first, the series still applies to
today's drm-misc-next without conflicts (git am only, no build).

I can send v2 with the fix bundled in, so Sashiko can review it,
or wait for your comments first, whichever you prefer.

An LLM helped me draft this mail.

Thanks,
Igor

https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
