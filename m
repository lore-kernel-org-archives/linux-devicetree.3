Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C219296BA9
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784453654; cv=none; b=OxsWwDtuN9p4+PZ51m9oLAwpHyQQ9+OtuyK5KXXNIUtRrSGQFSLILuyzKz3NMZedESGhU/CSPKDkTB8J7WAmJwQAVmPAxglClL8cY5ue/35fhfSyCz8yLzwFzfs3x/aCh9Av3M5Dc5Rtqz00amb0P5R30HE3D0R6OcDeZnahBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784453654; c=relaxed/simple;
	bh=wxLFfyl6EjmWXKbM57wT5s6PAdPnSGQiTYDpgI8a6ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcOQ56J3uRU+vD8Exdzkb2h9Z50jERtM/FngeowbDxz/79+hH2uNAthdk1PUZpoVsXukpKSfwhFqJMs3WQI15CJBskn9ct1RC0JpFRFq8E1C9MZ3+yBgbUnqR3KySqcmYWkS9k/5wZho8j6dVBzmIA+C2dzUCTdl5pPaUv8GDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvhQQcN5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvhQQcN5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486672f03cso9175339b3a.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784453653; x=1785058453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bd6rm/MQ9voPe9xoCY/Cv5zoP3z6FjXkkKLZydXX+cE=;
        b=RvhQQcN52NK9w7zNc2/gVN5mNYPBTBlEZ9vqoI3ZvudMf9B1DlrVNLeUlql2LzpOul
         xTZALljCZZlMz/Iy1uHFQzonArrv+BIPHNSojRpIoBm6HWozrt6cCGwXjeKHzNQaRuzL
         ZKxTKop7CKTVBOY33n6+auDFgVfh1zPR7/m9VkHSegLXSgN9QL1sDEHAmJAglnFHnXi9
         c2BThjzayvkeGDrYLmP2wKRTWyX3xt/YPIpQ6RwxWqrGBTfyBy0JhxJSpdjLHfA95/I3
         GaYnhZ998kcPaj/s1e/xlJeLSKQkIUlgJleIsCyTw39lcMjyfyapkc0uY1wk1AgqDZkW
         Wmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784453653; x=1785058453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bd6rm/MQ9voPe9xoCY/Cv5zoP3z6FjXkkKLZydXX+cE=;
        b=JaA/gpcYhk55w79RRGiPFYk2/pvtY2y4PBkUiIjlnrn+hVfTq+OusTjg0iqyTkHUyZ
         7ZGfgxm7ATu5hEfwpM9kjmLts5KJAfMHFhsfJNd33jDkzk83JzUaEtyjMXojc+8X392v
         68J9V82aMeMGsGkyuPpjP5vn5NlVRVC0RJqm4pcJFUHGBJwIsSED09qTCdjS7uPARI7k
         9bbFI/WngipmZx0MmUMXjMJg0c0IYEFScQJeZ5HakA7lQkEwqh4GE7CwDot/yDg2WXsD
         jvKCHWsaqDM6XK1JkjRpvmY7r4eHI4Z0DtAyaL44LAXY4r793zR6r8dYhy9mexXnzPHd
         p5xg==
X-Forwarded-Encrypted: i=1; AHgh+RqteR7dUa44xxizmQNv6jet45SJLkpip+A7mCg9UEc2w7OsZGwLDG57y2J6wRjW91MV/LJii8kmnTkP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkl4BcJAs/1DlfQpjfXp/fwcZGsweguCcNAaIoysvRMeLtwTqS
	41r78WaFD7hRy+ldC2wvljDzR+2uoy3L3kUKmCF+1kKrhtoew/lEU1Hh
X-Gm-Gg: AfdE7cm67eoY+htcfFMUNuoWRcRMGChAEMvmjcLrW4YpFdS0YWet0vLOzUD6YHIErv0
	vvD+bxQ9VQxtIECpmYwgC4wVFXxyS50r2228HsMU9efUP3OMMG8gddcopKZBx3qfLkH7H7NTfG+
	c2svQ0AZ2oXdGC0NQAnfrnHF66RUYuN0LE5JShsED9YNGNUqvMwypJ60NYfheu0rBc3YBAD9M79
	ozNt4mL+StvwV3JeagFL0fbLEhC03lvKCRbVhPklXbsi4By+mC5trsqxeSmC7aWdz6heuGsukE/
	cY5i0W1mzX1Vf4IZxp/LAHaCvQAaoP/Xgy3xodnlGc2oV4hqVHiih8z1ai5bPARN+FsSKRdpWMT
	4OIsXCjnX1+IEAcGPq9HGO9emm7jCz7jXeubeIIdtqkpoMbDdqLSbPrOgwV+axmkEbC4Nu6A0e5
	63lZ72ksXhOeaUowboHunnwTAw9HyoQCrF
X-Received: by 2002:a05:6a00:21d2:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84c29093c61mr9083789b3a.0.1784453652823;
        Sun, 19 Jul 2026 02:34:12 -0700 (PDT)
Received: from nuvole ([2408:8456:3214:35e7:8e03:79a6:7390:9fc3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm4022342b3a.20.2026.07.19.02.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 02:34:12 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: inux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guf296@126.com,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/2] Introduce Lenovo Legion Y700 Gen4
Date: Sun, 19 Jul 2026 17:32:24 +0800
Message-ID: <20260719093226.197740-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
based on sm8750-qrd.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---

Pengyu Luo (2):
  dt-bindings: arm: qcom: Document Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 1097 +++++++++++++++++
 3 files changed, 1099 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

-- 
2.54.0

