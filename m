Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471583AE1AD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958868; cv=none; b=Pp4qji8NzZ7XSAGF7VNWy6jJXxRk2ORJ7SN25vNAnX2VXsK5xpB5unHH9lsvfN7f6TRkz7cIH0m+JvUJRdxVd1lY6fGepPyQW9U/+jRDbgXyB3dq/iScsPy7Hkn210C2suu1+WxtJRrz2OEuFc3t198g6ZToyq6uX+ViltUo2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958868; c=relaxed/simple;
	bh=4VODi8yUWp6VotkEng+Eoi15pTbHzrJrCQiI2m+Wxhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8I2McFHTiwqbRjSRdqZzNTJFrOia4e6i+UayOfR1XW08F2o42ECjGlM3cQwgzImRgZORXPYlSfii69wWtieqD+akWWFXuFx+oQeCHYKu3snPcF1PWThrPUGdZnLPqSrJmB3Cf6qPsHU820N3usQHFJfkgBoct8+9XQbs7R+6Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=XWi8qjwy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="XWi8qjwy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf50c6f235so38259315ad.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1786958866; x=1787563666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqILGGIWyBqTfUPjY9fDVNDQq53KOhgiPASwm5nWtNY=;
        b=XWi8qjwyps0lDkUqIPhgEjm69T0dw5pcpNd3e2wQPgaitxpRdCkzmfskBK8AJMfGQp
         UfgPECct6+bRn98vw65yiZrQbSKOc0+e7/z0tT9cCF9tt8M00CKY8XeNhavYS4840WyR
         /mIadDq05BVMpCZ35oug88g4Zoi+GaQ0DKBDHsBIfcs0+Uve1+csOUSv00WVcMlMR0JW
         Z9Fk9DRop7+eAw6YAV+YiCKxlXyJihBMKOeoKls84LlBU/pLI53mq2vP+LgU4BTEiVxf
         jYVeI9xvmOHSWDjZKgVfAETVztgdIOQYZvWM0oHFJTv2AJ0pKG2Hk36eQttgfMT6XL5p
         V/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958866; x=1787563666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqILGGIWyBqTfUPjY9fDVNDQq53KOhgiPASwm5nWtNY=;
        b=WXvfvlO1db7VW7gkMQhGGbH8LExRh2oYgIsRK791LxNQL4J2AfFInuEjpTCat9Ypz3
         u40eSyASn6JqrJsV4SlLGZjgZcDB6l4u3eeEOSRfNvSz2y3XgcklKSNxgR30gv5emjRw
         nJeReoDeXE8L4J5IVLPsfEDof4IHQg5Ywkj8ctVD3XCp/KE7vsDJ084UOcHTWBVxKtYc
         KJQCVtruhYGJ/D6p3kBgMmHspKwd7WXNREG0G+NE8P49Md6Sqb2rOnsaexhU+14F/Hy0
         GYGwg59XMrXzjnQW0qzmCUGYjSfMmbbpoIdAD7/f5zsQIIFFanmKxJk0OyZhqO4m4Vi4
         Ivaw==
X-Forwarded-Encrypted: i=1; AHgh+RrAkfMWRYIKpwTrm/SrsPiTcs8Q27QZq1MK3gMnTeuIpqszGc7SNafUbFhQUVd9vBOq6tNUG6R2pkhj@vger.kernel.org
X-Gm-Message-State: AOJu0YxCriaEwXp4vOAmJWu3qhRBakXqpb8SIrh9Q8c5H0WKklcbEx87
	ciNurN/nnn7sziSj8xlwKIeVke2L3ejvQCtwo9TkwH2YyxZXljC6d4KTKbGPWUAXJtfZ/l1wjyB
	/Dwg=
X-Gm-Gg: AR+sD12J4fX6W6B2yMTEuLI59KVrPtofS3N8mVBT0dFekjYzWhQYYhlMVUAs5QVvDiD
	RQzhmhyIgo7S3YvsNf5Zs4ttEIkovFT+mevHvg/0nAR2/vvj1xjWhsi9PcipTKfDiAn4ZnPYLEq
	cX1+7m5t9/T8Wz21E1eGtXJA4TkJlAWG1oYH25Vw2aHpy1E4DxWbBvvu5W+DRNVws85aWr8lG5B
	k8dk8ubuCl05xZfNdlDZq1GvbaHMvtulBI0zrg+Ku0kzdbbEaGf3cq68pnCpZzq4cHQYnhxmk/V
	vVxvSaIGRPOCGys2wnwrdDa8skjQCAfgZP1nAZoEITAtEI5q3gEFOq68xE6Soo48yRg5U+sfJ1x
	K8klmtMgReseCZpPKt/QevYKjePg0FaLMy3F4M7iLePCw+cF54tt2FfWV66xlQQborH3nd9tz0X
	3AUB4HFLuz7FSTjkMkPHbzRdx31sudHnYU/495GB7F7AQcqlERmYjXDh2fTA6P8xxLOIX3IWHUf
	I5irZ/7T0nQjDTSQZfPOjNAx2t4p8ZMxPr4dsU1P0txvexu8vQJI2Ikn2LJ8eCeC7r/wKTLeobK
	2g==
X-Received: by 2002:a17:902:e78f:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d3b0c93b91mr258543235ad.11.1786958866521;
        Mon, 17 Aug 2026 02:27:46 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e12sm2962455ad.8.2026.08.17.02.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:27:46 -0700 (PDT)
From: kaihsin <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: kaihsin <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kaihsin <kaihsin.chung@synaptics.com>
Subject: [PATCH 0/2] Bluetooth: add Synaptics BCM4384 support
Date: Mon, 17 Aug 2026 17:27:21 +0800
Message-ID: <20260817092723.637956-1-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Synaptics BCM4384 Bluetooth controller.

The first patch adds the BCM4384 Device Tree compatible string.
The second patch adds the controller support to the Broadcom
Bluetooth driver.

kaihsin (2):
  dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support Add support for the
    Synaptics 4384 Bluetooth controller by adding the corresponding chip
    IDs.

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.43.0

