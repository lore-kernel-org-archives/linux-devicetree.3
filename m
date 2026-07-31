Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCE429CD6
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498103; cv=none; b=EwN94vNc35Hxr8ZxsnnBHMjU3fcw/eE81OHunKpHSSQb/bNf5S0brfyN+aY6r5bv7E64K4P2Hva115ln1U96YOdpt1ZRyk/zcC8H/VD+FH8txrllkimx8/nj6eYTjpKDJ1gWMfmyxTx9q9a4OUJSDkXAd/vTj/FVFUq9qaLe4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498103; c=relaxed/simple;
	bh=BDw0F7ULes1bte4YSLBHljJWq38T4e6moNgPJnN3yok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTtKojPM55Kd3ggZ5+MVzsG3ME7v97mAUEMbx/6KSSJJOuAKak8o9jZS95Wm+Nwp3/nSEU36feLqvwZbYmFrzHXouS3qiFUTBOrd/xRBdOknnPDb4p4FZuOj1HM/7pJ1RcjfJ9jpHbVFKIq2/+Y5bVt/Px1Evxz0fTlvarV9T/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6FIc3Xs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6FIc3Xs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso547378f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498098; x=1786102898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnYQKk++RFxqo7/Nlh6ltid4alJ0dkCuFh5DT65IXeQ=;
        b=A6FIc3XsAOmkPYBXMiE3bIl4XsHXPHUIxZz5dzSujYtWdUVQ4DrxBZtDKCvvBZRs6/
         Js92iGC+1xhZ1m9n3G+azDsbsRqCMhV6kIK9lV43uyUUFpoVm4uHIo3Mq6AqwObLUdSy
         ChCbYGA2r0N4c6y6pIhp9M3OMnuoudiGyGyeNOouiIWzqgF/k6Iv/wd1Ir+9VyCRCruH
         469xjlKrpNMXt/AAxV3+MUK0ZPf7eXQgKRVL3G1FS96fzGO8UeY4+c+K6dbtxWiFs3kr
         wj8vxoU6d7K6ZkgkrXyxhTXiImpCvn9Q8K5uFOOHot9QHIIqPX1oXENPjfyJ3IxLnCXz
         Es6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498098; x=1786102898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnYQKk++RFxqo7/Nlh6ltid4alJ0dkCuFh5DT65IXeQ=;
        b=be5rmmeEYbMQg5iPIYd5N5dRZu3sHbDnLdq9oNSMXcbt0xZR7aLR9Gi1ODuGefDBZs
         jpbbkQiWO5DUvVh6feh26ZcbhkMywUd304d4YZcNjxnydGGqddICEJYR1YqcucIgmuUF
         XbvmpgekpghiSZbKelPS0SKvnW3JCDlunqreRu0XXcOA8/s1z11PbGowaWn4MimjdqEn
         z+07kDOL0cyY+PpMw6lVf14IruZqOUdh9osYglCHW/KMY7PBsX47wbzPlJqjJ16kC+bX
         mSd7FbpH44gCINQ6EQnpBZ9rq/ZMSmibnzlL18sTcKTQko9OH51okELcCKdSKp94SnvN
         47WA==
X-Gm-Message-State: AOJu0YyVOxAXCH0d67aUZzaBektQ0GLZmIRHx4/s9e5Z+zeBei2/9t2D
	1c3ZOIAavnyjybgEcV88E1fzledYz3zIub/SXLvfKE13BTJib06F7PxQ
X-Gm-Gg: AR+sD10ZXE8gKHFqbC9dXABp5Ph3VctuSR/9khcgRsgmwRSxCiAT5GueS+npcdseUeW
	n12YIwNPe5RzqTqctUH9b0T8ijt2L4MrDcHTnxhbC0f9d84pa3EAcyj/Rs/7BpJwEfhlb7001Ea
	PE49SMAvMCm+osd30o2T/SwZjdteFFddfnQOuHj7XRT3JBUZqfGAmjxZB5uAneVrw5/H4kxRu6X
	DMXsgIXN5O9cu6b9IzEU07C9NKfVEJ5t/OuIH22vr/3u/9xIPuUKgLcRtBUTunOwAdXjqFulE62
	CYqkisCPPwPGfHz2xBs8IjX5D0iIkFPtPLBtFb2mn7o3TL2D/4BAkEnmo8v5mgSiEVQLLXDcC+I
	hjBIiVCSJHR9EFf0edAI8Z8+fEjHiijri6hzlXqtj6i1gkMTSrb1oMPC/PqkCu6pxQoulGfkSoG
	TlFrx+5ZdQbrj2LAA9+vqiSDBv9KnqBgiZZCY9Td2xqX6HF/Ah5gXmQ0+qHczt0zzclNNiHp0zm
	1QeQpstHrlmzc9gSZ9X
X-Received: by 2002:a05:6000:1ac6:b0:47f:8ed4:133c with SMTP id ffacd0b85a97d-47fd2b40daemr4232740f8f.31.1785498098058;
        Fri, 31 Jul 2026 04:41:38 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] ARM: tegra: tf701t: Configure UART-B line used for GPS
Date: Fri, 31 Jul 2026 14:41:05 +0300
Message-ID: <20260731114106.169398-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set UART-B line to use hsuart since it has GPS device linked to it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 32d55c18c7446..0d182fa5c1af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1283,6 +1283,11 @@ drive-gma {
 	};
 
 	serial@70006040 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
 		/* GPS */
 	};
 
-- 
2.53.0

