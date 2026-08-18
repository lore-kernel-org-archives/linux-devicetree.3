Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E84457C4
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045071; cv=none; b=lFkT8XrE3cRegL+8wwhu1ymXO2WGyrh5agE2Tk6JsmnWBhv0/KV9isBfVEdtPa1eCbryIX6aoNqSaY0kxPiLz1VMOmJ7hLO57TvLiV0Bdb9e3FJlENFm9YCqabZFWxQ6gCc2nj7TkOuCwlxMCqLA5F6bE6hjoa4fSrtZ+sWGyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045071; c=relaxed/simple;
	bh=XK9oF+spn3Q9EflDQqaeZhgSOFD37Pm50QwK+qYrZ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hexWWINCmfnsOUH6E59WJaLPYLgX2mm2K9DtfK2miDRIfIaB+WX052yulWtynsZAtBgJM35t2w/GZe77hOGqXC6D3VOcPuW7YX6KlbGvc2v/8AazAlAzIbITeuOjLv65/OVTdax0BJRwrU62nA/0+O5APSpaEg0DDFb1vvbH64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfGE9eU0; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfGE9eU0"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so1663711a12.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045069; x=1787649869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1pbnb70esMHiIG2GjQa1pvwn7zF1O2Mpz4YdOsewSo=;
        b=PfGE9eU0qLUTeR3yocRlqp1Lp39l1848+4zz/Xn9auDyXy8K7hhuyldv7q8DUeWIFi
         PCyGlfBUDDHwHGX0hi2Pj+tTWKFwLUk7H/vSTbSJqLgtSHs0DgP/tENMz8FeuRsAjZuU
         ZgX3yD2vqpmpllPO+SWqWpMzbguc/Fnj7i1Wu7+TbRSW+AxcJOiRuDEb6NFiklGkZWn8
         mayaRIhEFKzS4pDDgxytHsWP9pYrM6OZ5eg1yE4v+WWergcNWQ0+Rg5OgQlLgKz0hmWH
         2cFziwZrt/5ZUiEB6SnXvYdjcLgxsnaKBoTUA9PHXNJa+fTIfpVFuvJQ0+X398Bg/sFx
         GRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045069; x=1787649869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1pbnb70esMHiIG2GjQa1pvwn7zF1O2Mpz4YdOsewSo=;
        b=X5KLennab23Zgu+WVvEIEFCOVZhwzbv3CkP0P9FOgBJfM3rpzyOEvtDdGNni+Um9we
         0iLWDB31KA0/dGzTAXp9YAswYaC+QTt8TgRBf3dO9jEBWOKqExs6aU7UKwQmgq6X+lty
         vXvxXZUQ413+9EDkhiDLe+wpRxUNDoJ8PozAZOJWwGvZxYZx2VTY166aUypqshAKESdp
         EGIGWfjfToYI+5opYIdRzTj3qFk5GQCDDmlxV9jIyn8lBEZoV5Vxf/bed0kqqQaJOrph
         RE2tuhVpfXEI1E+NXkMI3Ga/tDDC5FFsh6uLEKE9dYdd6dGPqpz/wCy3fLDpTOt6wjsZ
         Nl1g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7jWO9BsqOLBw990rpxBjT7arBc9KrOThU0vPr5UUsL5cD8cR1iGVVvEVzT04ujOk+hiKWMtJivQHK@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMNYn5lxKTh3NA4j3CjC/YyRU3rpKfKFMkvaoAnq1y54zmPK3
	OLkp01bX2B2hn+XhY1zy0OidqWzmSt3mnzDnvWO2qbQFW5E/TUmC1Nkv
X-Gm-Gg: AR+sD13v/wV9eKh/4V9QTRn1mAPzZBHrzeFHKjxN5DET5BBSDSK9wwcSV/MJUpLOD3r
	DMKUkeRlFhEM8QQcW1nVriUKRmJzVmD39545fRlbCtrzB2gd+1d8k3FojhVfz9PuIIOKvkr4RgL
	I03o2GIuObzuP2R6k0JlQViq4aU3oDdRX19zh4g1we7ypKDt5/YBIlfnmQggMb2sXQH29uREgvt
	zgyI7zpnq9YRgk+/BC0yCrmdKC9p0XPTbFL5DuKfJ5M7u26RiCifrcNhhJKDygAJ8APyNwlOofz
	3jjEPDCyzvdul5GPCqR1/CYkhA2ZwTV4nd67CzhRRDdgnLF9HBe0IS257mf3zw3JhFmxLn8F7A1
	/Rcj0+tBHhhnspyYZTImOWI4NEMe9zpPJbPpjqWAU9pSGkjCoTE1pXSA+PoWsvGCLaiP+xWhuGO
	1pcEXme/4Dc60GXDMGPx/S1jza+z2HFO6CiS1ZjmhRa5+DN5uYwdM7JOujv4tXcbSXaSYKemE6
X-Received: by 2002:a05:6a20:c90b:b0:3c4:2cf9:28ad with SMTP id adf61e73a8af0-3cc71ddfff1mr40412723637.12.1787045068712;
        Tue, 18 Aug 2026 02:24:28 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855975a12.26.2026.08.18.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:27 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v2 0/5] of: reserved_mem: several fixes about reserved memory
Date: Tue, 18 Aug 2026 17:24:15 +0800
Message-ID: <20260818092420.2859026-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

This series fixes several error-handling issues in the reserved-memory
initialization paths.

Static reserved-memory nodes are reserved during the early DT scan but
initialized later. The first patch prevents a node whose early
reservation failed from reaching the late initialization path.

The following two patches reject overlapping static regions. Without
these checks, overlapping nodes can be initialized over the same
physical memory, result in data corrupt.

The last two patches fix cleanup of no-map regions after driver.

Sashiko reported these issues in [1] [2] [3].

[1] https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org
[2] https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org
[3] https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org

v1 --> v2:
1. Rework failed-node tracking in patch 1: do not track zero-sized nodes,
   and keep a reserved_mem slot when tracking overflows.
2. Reject static reserved regions overlapping existing no-map regions.
3. Keep MEMBLOCK_NOMAP flag for static no-map regions when init failure.

Wandun Chen (5):
  of: reserved_mem: skip init for regions whose early reservation failed
  of: reserved_mem: reject static regions overlapping no-map memory
  of: reserved_mem: reject statically placed regions overlapping
    existing reservations
  of: reserved_mem: release dynamically allocated no-map region on init
    failure
  of: reserved_mem: retain static no-map memory on init failure

 drivers/of/of_reserved_mem.c | 87 +++++++++++++++++++++++++++++-------
 include/linux/memblock.h     |  1 +
 mm/memblock.c                | 14 ++++++
 3 files changed, 85 insertions(+), 17 deletions(-)

-- 
2.43.0

