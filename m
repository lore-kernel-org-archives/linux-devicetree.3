Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008657;
	b=eWv9jAOv6gZkhwWQ9RwQjsCFJFk4d4asW7uX1UC8uGOgQeblpPewtI7+i7HbwtfPXw9C
	 CiQq0peomQXUr450wPjdGDBIpv67/gYnGWdSegI8NCSYDPJaZwZZyHWpxRyl5XmzRy5Ff
	 oCCcQSMKJqHdKB+29XSB4aj/IqGtIuZ5y6ZuqBsGHcMm/zfPT5bbZYqQJ5tAWoCVfwUhD
	 cDNkQ/u8EHf82ru0mvf9c9W8OdkS/FWg9Ujo1AsCyC7WnqRSuH1leTpF/G4bbewp26Tzf
	 0cfD4Te5Ejb/60P1Wtq31L/VtYEEovsMwA3okqIYAeJcEnMnCCptlNzBTQiwSJXYLsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
	b=4TBWboIUxDZs4O5JwlvAlfGdY5lseCETb6bPV85LXCYOQUp16yxnzefBZppF21t6TbXJ
	 xaq9srPaA8nyK8SsoPduj0GU6OD2IiOyUa7vl4kVt1ElDVpUppdALf+JqxgbIzv0RZuG3
	 rtchJcAhy+oyzxdAuJkTnhCQlnUAZSfj9oV5KovNVcPkiD5Iom7b9R7DHjwellBVhZnYh
	 1jDqwdz+WzvDRrvW3kqUXCZHuS/Xfa6O0iTDx8w2ro0AEqECx33PqdEy/QTzMZx++Ny8J
	 eoOL04PZw2YTvWSzn8FOsUkpGwPuc25mak/Z0K42Max5mUl1sDSAgPm0l4YrLNG32fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9AINkwW;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496460A2622
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3496460A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9AINkwW
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2861884f8f.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008655; x=1793613455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=I9AINkwWJ8ZYrJ01RIz5nlad0i1p4Ey5rx3qPRZrjwVgkvVfpgias0jPNHD3yDLmPC
         ik8oh2SJ4v8gpGM59obQWtz6CNjfaWkOfMbXKlgZjJcZXY4sAW9jG8IrJwNH+6HZELBf
         3ttqpOSIy0b4cKURHN71PSzEbx3vPhv6tQkqhPgIzOtzBWGQSc9F78si2s0wlQ7jMeWp
         0Q5z5pXhClPEYQef+nt+3vW2V6PbCRmFo0gvfk8wX8pqF9hVIUCmxWb6gEAa2IogtBO1
         uBAetd71IQL1mZPqj/meKzfcoihEmIzN5C7alFcpvih4qre/t4qyOxOOz+P9sHU0mXri
         ZKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008655; x=1793613455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=pWoSPNB3vtEUE28RO5v1XXg27/JOGEmu5tIqOvcgxg9RQiAfiqIEulg1FD5qEBerWv
         25FsezNJFQ2nzVIRjQQxuFBhMxtEgzhPEKhdxtplSlHDMJYlro5351/o+rvWKiHqotvI
         sXZ4jDJVkG8njGolzKjaMAbEMbByLNUr5LzY+jTyHLweZDV5egxAOyAi/sGK+TqL8pYs
         KHy04Fz+b1TGLIfA9GGqnnUDlotCGplWcvvMt6J3UL1fR4lJs8tiYqOqoRsLaQGMbHtR
         gHgqoJ69c1xw+6MnrmgVGk5OzZeWU/zDKjLlg3/BaQg3NiYIlLYdf8HT2atMRrgEvHah
         X2GA==
X-Forwarded-Encrypted: i=1; AKwUvBxB238x9QhclwNYwaAO0Th0152+VT1BVyPNQgqu7mmXDR0pJBMZ0UZ2/tOuim0wcuFj3eM8SXvBh69J@vger.kernel.org
X-Gm-Message-State: AFq9FYKhYNaXqkq0jIlDdDQIItpRpfwbsn2/v2RPv9UkrAK3DRO8Ibp3
	Co56EeF0bmnOyR0GZnUGMLn8uDUqUGqJ/XeQDlC3VDMj7uj47amcWauB
X-Gm-Gg: AYBFou3LbvcM73S68dLHv6TIusyAR3bB9dhq95u8BGIoNGOBMeL0fuRkhmr6sI1p3og
	VTWvHYAc6yI4OPN3clSk3rvQg1qVgSZon3TKdxdSqQ3S5ml2301Og20gnUfygKySXHiqyYxFDNN
	yokOwF+XtFMsYfofd4XVB/MIIXOKFOu14NeYmeh/PCVpJRWKTHHrguGBa3ND44RkyPdXl+fwHkM
	0ySIn6KbTgcpcqFa4vH5MMOYDm4U7IJYpNbJFtY23gLpYSwjrsa2nxQXT6Tr5Tbktjjo/+4ppXa
	ftMwPnVPireoBpft9LGMFEzjb/oWKltu/CU9ALzwXlWUeyjqDmP6UYo7OFap6+Q8RDpJa+3lTE8
	Ypmkk4Q9E/xHYln/Hc7lEJnvfJYwazfgo9nTnpt6BRfJy9G2YH3l3/6yu8FiuWZdJ4xnTewuaec
	0eK4ZmY9biPUrrnODwIS5vyzdKh1Oidc51I6QSqMy1zs/DxnUYivLTxcSJ5Rf5Z2AfG+ANEITU9
	hbsnbrdQvfjCEiR8kVTVPURFe7jixM8UdRnNRaZsVwbbpgW2PwqbRSCbrWfwEm1yccElemHpq7d
	6UXb8LxhQMd8SNHJTE5RKSr20a9w1QMeE5brabJ8Z4iFQRewD6FW8vH6IFRQhMHc4AMSUHIr6cl
	0ffgAow==
X-Received: by 2002:a05:600c:4e8b:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a35ac3cb16mr111294555e9.2.1793008655265;
        Mon, 26 Oct 2026 02:57:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: airoha: en7581: cumulative nodes addition
Date: Mon, 26 Oct 2026 10:57:06 +0100
Message-ID: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series adds all the nodes of what is currently supported
upstream for this SoC.

Christian Marangi (9):
  arm64: dts: airoha: en7581: reorder nodes following incremental regs
  arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
  arm64: dts: airoha: en7581: add Chip-SCU accessor node
  arm64: dts: airoha: en7581: add thermal sensor nodes
  arm64: dts: airoha: en7581: add watchdog node
  arm64: dts: airoha: en7581: add PWM node
  arm64: dts: airoha: en7581: add nodes for all supported uart and
    hsuart
  arm64: dts: airoha: en7581: add crypto node
  arm64: dts: airoha: en7581: add integrated switch node

 arch/arm64/boot/dts/airoha/en7581.dtsi | 673 ++++++++++++++++++++-----
 1 file changed, 553 insertions(+), 120 deletions(-)

-- 
2.55.0

