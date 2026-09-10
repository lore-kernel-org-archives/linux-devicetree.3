Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431FE47C10C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040975; cv=none; b=ugymIn9HxKnzCHTBJN/M/F5BmwLlbTmsw0pO7t3mNw+AjKpFhQSgrgvuBV6hJjzHxB1SEpvvARKmeuy1+eQK/okAmQx3y26PWw3mp15heELKIFTLBaUyJToOaXInTJCUW+gRfDJRv2HWM3WeCyPq4k6gNNySpDeHFCS4duvzIUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040975; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJ96MVvT/P7KivyKlVbNfLTzjZxAAxFJ2Fz5+9Nf5v3SgTKyZnh9ZfvODOw2dBume22ZK/mTVXrwB/02Vq81JNwyc++BSkL9yiOmmIjlzakuDQtQDNNR3htC81iBwU92YJjegUgVSH5oCQBHSt3lA6PWhes2XBKZeETmQp7tz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMpqcJka; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMpqcJka"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so49855325e9.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040971; x=1789645771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=TMpqcJka2KQuxG0qAKpWZfFv6ebd8fY5pG3h1BfeZxsqpWA09BOTuZ9QqLWHJtB9ar
         Ofig8B2TD+K261SrOlYCOxrvNakZ/CAdtHnvDxasg5dLDK8SpbW14k5zLNvBg2VnG2aE
         on/ChJwLTJWY6b2vQTV6Dcovrs12jQrvpING+6JJui29QgRVLsLxxzoqtDCwDEHhlifo
         Q1MEIj5BEi2U4rD2jm6THKkk/J/1I2ATerBYPi32GcenhymmCXp3ufjCdRiENxsU7eP0
         ELaqtaIOV55+s07GeHRMxvHTBmFAQHqXXsDsgZG53ZoF/p/mTycqhGsdC8DvIF3Et0Iv
         X4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040971; x=1789645771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=GH9YNmZvC5+fJiFtpEy/T+l6cOF+1mxQGPkxNAcZnU9NIo9DUhsHJsIPmUjsGCpzl3
         QASF+3cqcbklyx3fwS1aP2seFKCfdQIrOTClKHLGtWdC3AOiFE0TkmZ2FwzzE39sMTE3
         V83tltKiA3hYe+228a8YJu/wafWpckrkDKsuQ8za8Y3vRyBMuvH87uFiT44qSI8tpddH
         +bQi7hr9VDLyc7+sDjVNqdpsQRlzpt9d2MxL8XzOWvmtal8JeM9Thd5FwPwJtoN9CBKb
         02kKdJaHi5MgDXL0F4oS8TBEi1zuvCHRC02QnoJ48k7vt1rSjdSKgD8a0yDdLE8GxEz6
         HQBw==
X-Forwarded-Encrypted: i=1; AKwUvBwF7hWfIJe7wHS4o6c7qYgLULV3tceBJ8pQ1y6kgw01cP0NJHBBd4SDANbhjH2oCZ80Plpis93UlgmF@vger.kernel.org
X-Gm-Message-State: AFuF++munBbnfo3OpVkgLismCHP8h8Xeroekcs9esOGGP0FIpOhXkQda
	CpFcmjTKaeRk2olFxW7s54JOHp/AM3GgUVz/dRI96P1ZnTXMZP0VnMbk
X-Gm-Gg: AYBFou0gW2RJeJcW6y5Pc1N9hrKChba+o1v72H2YqHG2/eQ51RX1OOBy+YVbngOSzPZ
	v9OgZpmiRUgSXa/DvjrKK9taZsdCH4zF19nh2w+EPT0h31vMsRCGj+GU+LG2QN47v9C2DGDbsHU
	8TtzC8aGWZNzJNONI8kLMZB6U4fLHfXuOJsFFMx1DPZPvkH1J2BEQYvmuL4oDbMnSfi6X/eukyD
	obj2g7ybvEemC2zIQ9B0z/PT4o1dY2xaBC/oh59I7jxUeDhJqXTiVH4wVtJ4mDC5M9jG/dYbU6o
	NCXCGkH3JpzHAeiRD6QgMhimLgOVE6doSKYzGUK5GyWf/CahE8nnA5c1rdzt9CsdH2Wxi6ptOH3
	SqN43SbOmVoxAyWMvvyz0VIXmzemu0z19YtqRBiK9S2TX0sOZ1ekhqFShK4LWRJ6ZROmqM64mhC
	N1JioBtUO/dRUWiMINNd1Q2N6e5x99K+++lb1M1clc3OIuN/+byIQl78+lV/pVL+6WxKWlJviMV
	P3IY5vMIhVKRv6LYXYZzS0lbF4Ww8XVih7ZTlvIZ31GE6OcNJW3Ww==
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr438196315e9.6.1789040971053;
        Thu, 10 Sep 2026 04:49:31 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb058c8sm62353075e9.0.2026.09.10.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:49:30 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681 Thanks for clarifying the origin of the errors I am more than happy to provide the tag Tested-by: German <germanpapulindez@gmail.com>
Date: Thu, 10 Sep 2026 13:48:33 +0200
Message-ID: <20260910114833.4801-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910112210.44432-1-lsa.uz@pm.me>
References: <20260910112210.44432-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

