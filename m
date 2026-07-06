Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F163D4112
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367973; cv=none; b=KdwM61bBruVN4ABuSnJU9eNgNmVYvV1WABnfk3/aOhY7WWrKEND5lZ1Ey50XazUon9hK7/vhlRKbK6c4lG2IjlE+Zz/ynHiAySUKT3lssUUQDOvz7mdFAuorjvwxMsgD1fIc1b+NNP6EwsGocL0Gv0QbwSKKu2/kd2YRAblpk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367973; c=relaxed/simple;
	bh=djaG/NGurBf4ZQsNMptxWQoa3v2kz8PFn1TmQ/FGVSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjgDcsK97stqQXahSiSheIRDfjvkYOIZD68bIDlnmcuM91cgi2zVf7JeQiHkli5zzqRM+vs94nsOsOfl7jF+/0K8sfLodRU+LsoxYo4tv5F9YoT8ra/4b7cFLWUR8f9NnK2KMhCZhTQHsMxFilqjSAs3I3lTshFHDQkRN4uPrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UhcRMvXG; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UhcRMvXG"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9f6e7846bso1487209a34.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367968; x=1783972768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pR1b7+xzGSlhQK0IQGnCFDCaN1WTfnJWTFTWbY2IVA=;
        b=UhcRMvXGwqRzLiR2Lc1EtHG6ypGarDeP/HfiuiB1nzhIC/oLfL3rnlhLsOXpC0F9eh
         bTgXghJHUYCwOlvH87WWXt9sRN5LuT3hH91UDczaPFFEuhArVKk1kQe/p/IajiJtPO1I
         +Z1e/OrUuX8sW0++kz0aQcIKrExBn7lZD9DPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367968; x=1783972768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pR1b7+xzGSlhQK0IQGnCFDCaN1WTfnJWTFTWbY2IVA=;
        b=VRyOUV/zoOEppy+HNp+FiCMhm7BK0unJGRxqiPP/rq4yTnikJnPwtlqzC294+98yP6
         ynb9xtqX8fKcBf0Q3ZXxxA/QjzJQXu+USH8eNSXXJAHcyzwDKJqhnYo3D1DiGiZ3QwPg
         L0Vm57FhJeabT9FPJUx6yAk6cCtYnZO3T5QrQDsLeUNXMXXlcC6sSmYtly1tcVxoq+wi
         4OUJ0v3iUDoZxRc3FfKrzaGI9lTW/vnqZDMOLsr8C3u9gJFgiWvQb6ySd1bRFugrSRjh
         W610xKl+/X+qWS97QF/yV5eUf1t7u43eM65SKmnBzxe63KCFclKsv7dBPVhobbrw6LVe
         GQ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+oCavqqU9UR0dWet7glfFW7ujhhZDXli8alMFGNVj6dS1mS/O+cXHIbkayD/kY3FtN4ElWmOUM1re4@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5MKAr0mAKuLJusInk07ubQeqwxwxnWRI+twiWgX5QP8+fZQT
	OyPDdRokhDlOegxVN+UQqMOspfgS7rQWTmote/NQuoFNfsMdIiSDzmYL83NckeBdzw==
X-Gm-Gg: AfdE7cntDJewyCNXj4LZxYfHww47cf6ZwepQAvz7yA6JnuGKhGhdBEBMwfYS0bJzHLt
	KEv1yc0SG9N1o0Jf/YXXRQucxJz7luPgH/D1gjGs0FV7ZPHvLGR9DIVcaKougSzC9+P+OaK9gJC
	7859EJYNuoj14VV+uEoZluMiiFQqCd5QM7PTkZ71yBp983aEeiZkc5NQVCjdErjgC9cxGH+X3tm
	KaxfyVqrpIcEhDSeGge5Yz02FLlHe7rJmsBWkrFREVvPM0Ew030hBBZFQBJCIHpAe+IoABlXiHj
	j9dclviCwQoQvBnzLvwJ4VKVLPmGyugtR5zqtdzd0AA9IUDBrkp3dMiEGFjWRbUVm152cIyyGu6
	PWCYLfc1Hpqy9e0+Z13y5/jzOSRTOeoyOeY2j35aFznerfz+Psu/pDVkYzT3pLAbGLXCUQoLarW
	ZC1eryToI=
X-Received: by 2002:a05:6830:3887:b0:7e9:b4d0:53a2 with SMTP id 46e09a7af769-7ebb23a11b0mr1118805a34.27.1783367967800;
        Mon, 06 Jul 2026 12:59:27 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:27 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 07/12] dt-bindings: mmc: rockchip-dw-mshc: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:03 -0600
Message-ID: <20260706195818.3906949-8-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the MMC controllers of the Rockchip RV1106,
which are compatible with the RK3288 variant.

Unlike the newer controller in the RV1103B, which uses the RK3576
fallback, the RV1106 controller is the older IP whose drive and sample
phases are set through clocks provided by the GRF, so the RK3288
fallback is the correct one here.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 4965bb518c54..21ecfaa454f4 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -43,6 +43,7 @@ properties:
               - rockchip,rk3562-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
+              - rockchip,rv1106-dw-mshc
               - rockchip,rv1108-dw-mshc
               - rockchip,rv1126-dw-mshc
           - const: rockchip,rk3288-dw-mshc
-- 
2.43.0

