Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61E361DC8
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448366; cv=none; b=j8b7tC5bEETZ3U2oXM5MXJ+cfGgboncpwJgXmy13KIhYcjZ0HSCbyeC75sXvO/pM/yth94mkujtFzFAmI6v4gcyxyCwcraJl9B2o+e5rqikFjLfgKlkY6jiEmdJEhY58yebDZCnkUaK9Qjk5sD/irwVUrpyVCO3LHwMhaAg4RB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448366; c=relaxed/simple;
	bh=YpOTPUvd7+Ix6fxPIg06TIb4qRZNZIUThtvV8RtBuU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxDbL6oW6W5qibTb6+DqK59tTOi6McWPvaTeJa5kNUQINTGFpiue9ZCHqBuffrQwhaVd5hkCeddZ2YJaqeiqmzddMlhClkDz92tYjes4Arj1QzHoPva5sm/AgHZub1S3fBwl4OPatY7ch7Xhut1Y9qdgzPGboNEpCvamSseFkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn/F8pMN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn/F8pMN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so12496215e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776448358; x=1777053158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9WLAo+FIpFIL/Tg50QaIjrY8GmsgmdfX6tOY1c2ldc=;
        b=Mn/F8pMNVp5aFI0BNyZkcQ9VhbZogux7o+NIkiDH+EP/NzurTmBexARF/F8S4XFH6w
         2jr9o0nIxQGu0qEdg9VIaD//kzvBLQmgQoEe0GVWUlek4MDaFzKzClsQLyWgqVTC58kq
         p+G68+uPDwdSpxeMqEe/JYTXbW/BQFj8mdQPVC3J+v08sSq3dCBtsERZ9C5VTW16TFmp
         Ed98JQ0a8p3LVMbCBndbOi98GWeMjYXf9BJCImsUG0wt4vlhQUNxE1o0JdAegJy1aqOs
         jNlHJagiRHRqBLbQMjNu0msSVikg/2LsjW7Z94GxDNGWXGzwbAtN4KnMrYZ1w95FV+ms
         JT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776448358; x=1777053158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9WLAo+FIpFIL/Tg50QaIjrY8GmsgmdfX6tOY1c2ldc=;
        b=PmB9e75hkX6EuSWNqRqElUjSSpEqcqXYCtEACIy8BMoo7P/2JksmmgF6jHvczVPO7A
         WF0pm+G6dU7wvObA5vbqKIfYYA4IbOVchNrvQfBR8cAqS7M1BUNZ+d5tLN3dVkanj632
         Xtgh956nvFkjNGHGIV0zB/u4U5kUVcayAxRdmLGd42nwJ+pgwwqmH9cD/GG1w3Bwa1iP
         c1dXOIPKUBdGWJpGsn/gGwsckGharqMWoGK5ndghgrjQ0P3fnBJfSgtyjvs52INwfUEa
         Vms4FzzA/58AZ3o50Ph0TefOb/iORvVl8fetKfVRzFJshwidwMgXvxmYXAzjwMNiaIx/
         g/lA==
X-Forwarded-Encrypted: i=1; AFNElJ+uxXq+UgDFMX9tjjeOEmrDhozWleCpoI0QNXSRiDhe6vjMLIYU6GB3Fs5nrp1KXmbKs+TWcSLgNbOx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PRqZU+mI96KZUYBJUBk+RXDdADk22NINEdTNtxCXVFZ0GIpB
	zvMjzu8HMAv+O+Bm5bYevW7AA+95UaZp3JIMHCEHOzNT/BIKiNB7gEl6
X-Gm-Gg: AeBDieu2JljKTcE+2fjtRCrDP5V+gN9Xe8PzsDzYuYmaxXGXDTomr/UbmC9oFA6RlDv
	Q1sLzZP/jvSYli3FKnOTAdMqlA0HDGRkbf3lWspBCP9ls8eOBBF6Et/d2Ug+eHCV+SceiWLtngu
	IELmTyl91ObqQ1InDp4PFiRCYrZsriehzD/Y3AZy2/BxqYuKI44rhSWuIuQVywzDXPwOaDCYsHx
	awRufaVhsbtP5oRosnJj0wu6u7q2jwsngjV2QkAQGMaqwEBqIZIWZ6t9BIubZi5lhjLbZtSZk4x
	qzRqdBpOAYzeTLu8HXcNBpFAK8EzutUS2H8EnGVVcG1+yeoBy2Q0vbpXnvgNpbND9akzN7DPRZX
	X6PZxH6V69zr70vDp/YEbdngBZxFfdHxfa1GNwJ5DqUIqx7z6neYPUZ5jMnfX3+ac2GBOwMEngT
	NvEpKiyZyWA6hxyjw6Zer5kmQ1lhmY5Gv1GrBV77i6
X-Received: by 2002:a05:600c:8183:b0:488:b187:d898 with SMTP id 5b1f17b1804b1-488fb771445mr53526905e9.14.1776448358089;
        Fri, 17 Apr 2026 10:52:38 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:528c:590:5bef:9bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm56166535e9.12.2026.04.17.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:52:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
Date: Fri, 17 Apr 2026 18:52:28 +0100
Message-ID: <20260417175235.224809-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3{E,L} SoCs have an LVDS Common (LVDS_CMN) region which is common
to all LVDS channels. The RZ/G3L has single-link, but the RZ/G3E has both
single and dual-link.

Use the syscon interface to access these registers for scalability.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e22867088063..9c81010d5a74 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -221,6 +221,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - renesas,r9a08g046-lvds-cmn
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
-- 
2.43.0

