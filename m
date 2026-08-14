Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7F448D19
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695310; cv=none; b=SjQZdhXPjvkqFI2DJyjkaoaN1TNmi5ZZQFMPO4S5ph89NzzNjTkRfcinp3xvArzlkZ5Ut3trltLLiXd9JoWr/owSoOVoTca3IuRHQSDLf1/XF5hCkxcEUUHxwciPnBN+F2srAoOiTTQmOPkCdqDiRa9DEF93MYZLnZJb1CbPJOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695310; c=relaxed/simple;
	bh=wotXsZluvcxyn6s2nKRlu6uhtEVLn0t+kaHmUzK7NDs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtQwFVvIphsN6TqQm7bywQQoVG0Er1fskUI6a1ixrQU2XT7COLG3d/8sFUTIEu03wK2S9yRbp/AvJwlbQDbDAHYBhGp4CF5utzpZYktgEJBOkQnT0XYFRSnyc36GkHnm9mp4geMi6dsjtrd5Vr2MRxa1ErOu0i2LWvwhg6KjMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tfsz22an; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tfsz22an"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso352061a12.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786695301; x=1787300101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9unLO4ZeP6CWngyT8QczSGq/LrcwFa5DIFx/EN1Kd3o=;
        b=Tfsz22anceE3TzFbF35fTeAcpBH2JhwzU4hKFxu+ruMPFEbTcGaUx0hqm8GnwI8b/Y
         EK4qoh+BF524bhfrtLgZ7vWDugkM5fO038m7FSHCXMawNHQEUUSriwQbBbN4oUbdrtYk
         Gjlx+luBbPmzw+fHgshIvy/sZax8qCLQmZp6AvT1S7R3Jze/hQHITXsXZKJa5B1IOeG/
         F5FaNAeCXoXnRUOGPrWeuo4BvKmYUV+bf3AI4YgNA8XVssWVcmbieqEWQn+eS/mB5OHy
         nVccuf7KxR4tRVGaDBU1npRmP5d5EWxkZLjsr7ZIbbqZMcBZN4hD/s86tEWPQ1NSsshY
         f1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695301; x=1787300101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9unLO4ZeP6CWngyT8QczSGq/LrcwFa5DIFx/EN1Kd3o=;
        b=B9eIC+NO48QGqvLVi9F3sdL+3jlbUvtsYHZQSPGzSIZLYN3aYKWvysx+T5CoU8+TkR
         BW8k1KJ63ZPt17R58YIy6nEFi8LPkcDRaEM+w3v+8hxn+fzFXkgm6wCp0wyex9ave86D
         SY2DBUCzZJccgdXUa/1nCfCXSffFGgK1wKowKvq8iuZs8MvnjW4LnqJXeH7Ds+/L6QW6
         10ZtcqvUj/HLOL24u4LyQRi3O3f8Bi0daOx10fA02CmlthCgIsuJ0vty06IVuKLY5ml+
         seMztpup07sjMrFwSxq2mlJHKCP/X9Hw91FfTY4KphS9NBd89EYEq4l5I0qxsjyYow4b
         K2RA==
X-Forwarded-Encrypted: i=1; AHgh+RoZZ6tu94hgIJnSsE0zZSUDKgUwRN5acUzuo11L+E74rrYmlNOPewv6vUhFaWJ/HuW+S01NlTUzZE3T@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRFygGDSW/S+dVlQd+7iQralLtO7ir+XTx8vaAuGNA2UWxVTD
	j6m7XrNy2qB9VOE0CV1fDIbNouVMBokvIE+sft/IhACwudTFH03pQlfz
X-Gm-Gg: AR+sD12aMiH1gS6UHzYu19EhVOjeQ90Ns2q+kbSjr5TH7rwd30m8KQLQGU0gh/ojdH2
	pPITTU3YaAHFymST2ZpaqdPAAlbYfPJf47JZcyUXerN23XgEn0cWaaXxMFFoeqoPcCORIusEys9
	8OyXj9XrYr9FiNhd382y10S9faJLsFbVtqSZK8/2mZZsRXEli00j4kGXhTYQc1VBC/LOR59lYyI
	uuEiNpMO+ABAVj1W29bYhA6gZv4pWHBEEeEYo/DA0orSNqvjkxfYNUDqN4dzpmk2TgC+gftyrZZ
	gJkNOdYB36SToFviqsieDNX/Vxtu75bzHhUQB3dXQhDnGmNtZjOH07aRAoh4Ws7m8F6slIB9ZVG
	tuigpg3UOyF6Gcznwyi2G3VE+I3KZAhrxBaOpW2LaClsiimkNU3Y4A9IOT9rChIN+foqGcfDdA7
	edAwUS1J6uyhf794AR+7oiT2k3wUuvrHPF77BCNlMaLnyt3WRbiOeEQ3C9wkvvy7F8dG66iK1eA
	O7avYwk23Q=
X-Received: by 2002:a05:6a00:6c9d:b0:84f:dc19:b77d with SMTP id d2e1a72fcca58-84fddffa59amr4492658b3a.12.1786695300745;
        Fri, 14 Aug 2026 01:15:00 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb39esm149986b3a.4.2026.08.14.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:14:59 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] of: reserved_mem: reject statically placed regions overlapping existing reservations
Date: Fri, 14 Aug 2026 16:14:42 +0800
Message-ID: <20260814081443.1061046-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814081443.1061046-1-chenwandun1@gmail.com>
References: <20260814081443.1061046-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

memblock_reserve() permits overlapping reservations, so a statically
placed region whose 'reg' overlaps an existing one is accepted. The
overlapping memory may then be used by two regions concurrently,
corrupting data; and if the region's driver init later fails,
memblock_phys_free() returns the overlap to the buddy allocator,
corrupting that memory.

Reject the overlap up front. Dynamically allocated regions are
unaffected, as they are allocated from free memory and so cannot
overlap an existing reservation.

Sashiko found this issue in [1].

Fixes: d0b8ed47e83a ("of: reserved_mem: fix reserve memory leak")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/all/20260806100605.2C2C01F000E9@smtp.kernel.org/ [1]
---
 drivers/of/of_reserved_mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f20747725de4..67cb60616fc6 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -146,6 +146,15 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 
 		return memblock_mark_nomap(base, size);
 	}
+
+	if (memblock_is_region_reserved(base, size)) {
+		phys_addr_t end = base + size;
+
+		pr_err("Reserved memory: [%pa-%pa] overlaps an existing reservation, ignoring\n",
+		       &base, &end);
+		return -EBUSY;
+	}
+
 	return memblock_reserve(base, size);
 }
 
-- 
2.43.0

