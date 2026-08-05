Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D6480DD6
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944463; cv=none; b=OBxJdOvWiS+QLfylKTaMY0jFqTsWlGGKsgB2CevXmU/S8Xj6bVxznvE+U2JR20T7pUBphGruS3ZJA+jnqzHYEw8+26r6/vs5r5VPu35bfHo+kJpgiBi2YXnyaqqnZE1QMGaH7xrcMEKpfXGo/tW0Ab1NUe9jYx3nv7rvQKmX4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944463; c=relaxed/simple;
	bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCw7cdmrbDyBGT3ng37mQEpF1aowJZ4mcKSHYj1m1lD5ZUYiX489xTwhFSrVSyIY5mipmPgPKSDXEFIR/o12lakLF+H5gT0OaNE0k+n+Vq0a2ThV3xHVSp35Yr37amBbBgjSUz6mu1zgnkUiq3bS4ZU0eGigYaTGuaaxjGW1jqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTwKm713; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTwKm713"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f5d5dbf80so69191f8f.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785944455; x=1786549255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
        b=HTwKm713XXJR2A0Wl5rnLTax89/donTaZFwoDtXljie1JLc5Z68EFRxOHxvqhxpsRo
         mYkIt0LAwBzapdgUpcRCafkvJEdEl7Qxd71QvLZZjzSq18e0qCpXfMmL4s2O2qQsIXBF
         gHIEqNcBLJZsWUqtI4Zd1oCtPpmXWudyVJxNjsQ8zcshI8HNNUpdWGjvbY/tr6IP5MWa
         i494xCRnLfVC4c8EUyBtNEkhj90eB9yzmB+2tf0WZcMuLBq2ke4G1f9O5TWXFKOTtXn9
         xM5koJbezy75H2tq6EEZDRFZSFMz4N8y3O16wy72XcUL9RqN/+/6G4qF0QjkbKbsk9LC
         PKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944455; x=1786549255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
        b=XfRFJuBJ2cAer/AHFscK/V78XwODjrTJsNIdwdswCPQZjRMVo/CSy5NUmzXZgrjyIH
         /oy7CBoRJ443MQmxb9FhgnHOoItl86azG2mwA59LIjVoHugxyWFps+qI9UMK9jl8dPv4
         OaU7rm6O4V2oP4LbQG5ZvF4U4LCi3MrrDNp6DBjMMTXP/fXClY4dL8prHAkXtFo53VoU
         /kO8cGWkVVJAW+FTbGhJ2RGGl98xtOg8ckwEB8rlDM3Fr7mJ7WfAJlzuGkPn0YJEaw2E
         VPG+PaRO/rVHneXu50q1QNxV9mzikS4/9AM3G8tXlRQeb0lEK0A4Tfej/9ebra0bAgnK
         ljTw==
X-Forwarded-Encrypted: i=1; AHgh+RqUdBvmPo8lXLvdXKrt6kovwbqJh88r/qDfQsR/S7IsiRWckC9Nn7B9uNqYksnvvToCkfGGgdbVaORg@vger.kernel.org
X-Gm-Message-State: AOJu0YzxASAb2fH4gYiSGHV+JiSoXOuVjucUQi85OQ+7oNbQ1EVefp3e
	6UEUe/zElSsOhOPTVy0Wszqta/AqS/Scya01QXEY10cWVGboFqjrbMpV
X-Gm-Gg: AR+sD13Vq1jZOd4quExzlUb90ew4xpfLjjRBRZuL5i0fQgwo+h4K5lceDPdZAdpkwFr
	62QybdehLYxZ9R/MbUAio4E13SL30wIDN7ksnjNIgOLTguLlD34ENi0c1h8y8SlyWUU+HHL1CO2
	Oj3xeaaD+vntwO5KccISKYXNPVepz7wo5AFa30du8iZF0Jp+MyqMm23obL572n285ghEgdSlLJF
	UiA2Tmg3yBwvZ1t9PvOe3oOm/VlI7i3DWLvzyJ6CKqrdgF3yE6e2z3X1nf0B6iacTvhtmwSE0rA
	At8OFFw6ODZZxVUh8ngoXttJx9XmBeBVRxQV8LQT41bZZz9bhPLBvkT2SoW6Nq3OUqRHtuoEwSC
	DvNagRPrzmf214R6CNydBcVohzpdLBpFGq3rX/gN2OsAmwKvVb7e4ErRLLNmN/keplc50BMBeMq
	laR+ZsOlueweNLJ9M4XgdEPNMziVDyWrE1+jhHvIM6hWoiNJyPGpqKASK5JYwaAt9B2EGnwiGrj
	C7pmtm+nYeYr4pJz52Ol7N5JPqE1N2wVRTrIzQZT2ZSRifTlbKeIKo/mAHH+op5LWVj
X-Received: by 2002:a05:6000:1785:b0:47f:91f0:9ab with SMTP id ffacd0b85a97d-47fec484f36mr6647230f8f.0.1785944455399;
        Wed, 05 Aug 2026 08:40:55 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm10866434f8f.26.2026.08.05.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:40:55 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed,  5 Aug 2026 17:40:33 +0200
Message-ID: <20260805154039.10161-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry, Mauro,

First, belated thanks to Dmitry, Sebastian and Krzysztof for the reviews
and testing across this series - much appreciated.

A gentle ping: all four patches carry Reviewed-by tags (2/4 also has
Dmitry's Tested-by) and no changes have been requested since 23 July. Is
there anything needed from my side for the series to be picked up into
the media tree?

Thanks,
Igor
