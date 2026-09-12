Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A227FB37
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789229853; cv=none; b=ogSPi9QDwrurhW1uDqdhScWdsa5L0QyYOGVWZuSxcI0v4OXWwObtNlYvRV7y2P1Oiv81tcrLUXGKVx8YAH5ykvb/qAEgocFIazrzlbOBY/uAIy0MLTs57bWeei4GBe4N4MJGKDc2BFgzp9sAwI6oRw+geFS2QUdozP3vmvPgQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789229853; c=relaxed/simple;
	bh=Jqw79SmqLYkewooIG0Ms5tC1rgyoHKKJFJs076jCzQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkjqOLKrt6JLPPLTxfUAYbfoxAj3H5IHH6tpHWnF0rAvJdqL2j/XTccjblBARSBJfkirB40LckrsGllrfWk4Q1+VJPimn4+YqWz+zq7pLRvbLA69LELAXi4yJtSrUh39d1VIqNyMqY4z8FcQlFv6w0vUQ5jFz2jluLg8WqDsBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xepfy9qN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xepfy9qN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so232945f8f.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789229848; x=1789834648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jqw79SmqLYkewooIG0Ms5tC1rgyoHKKJFJs076jCzQQ=;
        b=Xepfy9qNZjaG0hYkcJVpkJU6/tOJ27m+bV2j1zZTU50TNUsfdjh3XLVHQZAGbe/Bqx
         zNn7lYJCMJXHrOFJe1DH3YHduovvnGHbqTVVzoK6sU2szGMagSmXuBJKpYEkU7tF25RM
         H6kkcIDxsZXDQb53s3Re9wEQDmHABqb2Th76Wlcx33Qtrsq+BpTppGG7zeTP6vENlhHp
         jJu+zqzRHw4FECFSpm5W75VsLnMdTLYn0f8yns2mfVtLYpaPIMnq8rHzsLGBa6lNr54k
         ZLWIjGxScGY/uoz+rc0iT+fHmibaFCiAA01blaLGMICEz8LZihTuYbW9vlrLCZNa9Z84
         +J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789229848; x=1789834648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jqw79SmqLYkewooIG0Ms5tC1rgyoHKKJFJs076jCzQQ=;
        b=M6sNjuuBg3mwf4XDoEOYeIz7idWdPgZ+VkSGO5lrPqPIbi7rOI6zlW5NMyXm8Wkkrx
         4cI/31CpN9apQbou71Mjdrc8Ju/Md5DUUxATEDmdFsUx80KMZufHEvvjsh6KJ6kFGU3p
         sEeZyZ9FUkjhxO+FwEURLSMtepbF/6o0IyaCxX9m4QaXKW2wggquctrm2ZcY6z4pOOAJ
         cFITUi4oU8QQUdezDlJ6c0rgvnj4sJczInFBIuOZtYvSmAy+PD2+KiSf8fEjQ6Z3xYCP
         ldNCrofqpnvkW/HHzNiprr98d1AWnhW2vnttcKuZv3RHJHrStSnTBgxkZrJuT+UinA4L
         zRCg==
X-Forwarded-Encrypted: i=1; AKwUvBzD9lsJPLBEdrNbssE4Wysx701ccwsQA2+Yk6+flhorLVnIBxrwR/iW7elSs2JZezthNbsoQhQXIEpW@vger.kernel.org
X-Gm-Message-State: AFuF++kpKKlWbjdjhamoi+2qlXzbeYHadXEWuREhgnr3/1bRFUrVSlii
	NWNQs/xuN9duWXHltnxe6xUNV5SdUSA14ZGcUa9JOFqzFN52U2TDUICW
X-Gm-Gg: AYBFou3K8Fw3jexu9RvyYiIl3SobErNBwn+6jSnOnEQheemRc4bFHK7BYmOjt48SLys
	F8/9qpC1FZOxjYrZuBLdw+/JgetQ9rm/c8ByWQ6xmQQumTVlyPo5SWIHdaAcVKsBzDfnOeUt23r
	TNwVem5OIGRZpeKshLPWxkttrWFL2jwPCR7ojjFBVe866eMZfgZq/pX6CHbsqsS1Z0VNuYZfL9R
	5bqKB7ToyywhtjFdx7Uwij1trStdKwZOjgN/ryQNvpuldWbqCkP2knhmnZSGRp9uqKBl33iRnsF
	TeTnK5FiUAUSuq3HmtbGdv/ybrqqhAnjRsDNluE5HpHZ4EzTG/I5z0mK7UDDB0HdM63GUvLheWa
	Jb1CRGS/ig9JuXMHlw8UKVXNUf31hzSJhyJZmxRmnlHLnNtdYiBticIsv0WSKDsYSz40hkG+6LW
	dhfZqS2wz9PX9PCpvDYj67KuaPQm6p/HOzW2bASASsfn7KsHdYpp3Yz0cKxC6C5zg7mGjscyqM0
	Kt1N9d65CImQFpijyc+vbBjOWjZWjBaHUbF/hufGmZCU14QYK6NZA==
X-Received: by 2002:a5d:5d83:0:b0:486:f040:2e0e with SMTP id ffacd0b85a97d-486f6d4ab19mr2656641f8f.42.1789229847393;
        Sat, 12 Sep 2026 09:17:27 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm13567448f8f.15.2026.09.12.09.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:17:18 -0700 (PDT)
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
Subject: cause of the image error in Gnome Snapshot [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Sat, 12 Sep 2026 18:16:12 +0200
Message-ID: <20260912161614.93775-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909203717.90605-1-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: German Pablo Lindo <germanpapulindez@gmail.com>

I think i found (at least in my system) why Gnome Snapshot dosent work, i dont know if this error is also present on your machine with the patches, so i have organiced this message with commands for you to be able to directly copy-paste them and make tests

There are resolution in wich the cammera works fine like:
qcam --stream "width=1280,height=720" the resolution that uses google meet
qcam --stream "width=640,height=480" resolution on a web camera test online
qcam whithout the stream parameter, which has a cuality of 3836 × 2640

But there are some that experience the violet and lines error i reported o my previous test
qcam --stream "width=1920,height=1080" this one is the resolution gnome snapshot uses
qcam --stream "width=1440,height=810"
qcam --stream "width=960,height=540"

I hope this helps in the development of the driver
