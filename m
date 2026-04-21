Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09A2C3244
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792558; cv=none; b=o77wTxkbdlKt8C/yRC5kxHNdOomc/VojRr6/KbwEFispz+jMYR2y8UdoXkR5+JfEZoWLms0o75fGNv1+UEhYOMjXaGFm9SrFqTGDe/+9qCuzE+GonKD3nvrs4axfJLQh4EYt84nJrU2+v+t5p/XMzRzocgxQBsbMQALzEqgs7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792558; c=relaxed/simple;
	bh=VT6F7pP5zpkVt+Q6oy48vr3dMiUpqgOtr+S2bUDTP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IV8QSOO8XHZt/9Jho6PlYVSO/XJ0lgCcEmuSAqZEf8yO123v8RRcR2oeYEWqsoeu1KwDVQN6LkPXo9hSEWDD8zC8ugyzf/7CrMZM1hZyL7ioLuMxz/V5sbeR6F+oDk0JLz8scrzmUQDrVdMVxOou2+CMIUmSVD2O8gXaNctPrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+/qwkjI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+/qwkjI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so14808645e9.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792555; x=1777397355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH2h0hmWtthS7ZoPVC0SQxbSn/Bs9GnEe+2qEICPqmg=;
        b=A+/qwkjIRSxhjPxF20/zJ827jm/u6U4BKlt42hPjfZulRlfKRrp2TQ+CJwNYNVkOhh
         Zbq319qujBTv+QNM9nz/budKqx+xVnuJOdEasgSfigqeN21fgnUvn2O4WwWA214/4G/5
         lkq7y5SZ5aQGIV06nKjHJiIHaisBnA51NeGdefX90DpL8OnM2fXidw/3iD7nlLoXZ0s6
         pcfO3Aj2qJFpDJAcIVTVehbELzfR3bcXBxTR2srS+uZWTvq0D2QQ3UwxxW9szQJ+/Xsi
         MOXKNjcXE5Wr43agko72ElD+ue0QHDB1DNaH5Ig8K4erSZOQKAColBJpNlo8HmMIWbIK
         dDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792555; x=1777397355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LH2h0hmWtthS7ZoPVC0SQxbSn/Bs9GnEe+2qEICPqmg=;
        b=VorueiAG0Q75nhA1Q27YJT6Gm1Axn0lXkLCGU3FCIB6z1WBKMgQkhopqdiYWYhQXYL
         3JC9vmijhG7nLTJ0HZEDmhT0EVQBS+I0lLGQEgb/6DBdtUvsPmAJwlXqBr+Q7ISEFETY
         JR2COylxnIleavXx1OpXUPmFdFOvpbU1uD2okX/s1Ch3Bi92yC9yhsFJa14nkqT6A58x
         SWKW3+pd9RzL/IE3VIzLpP0nc+U5eLIoWHlE+ecylkUyfxE9EKBy0tZ1p1cBzboUKAmD
         m31413/klYjQRr3BYcJV1Dt+VmI22q8PbXmylSeUhM1tvmDP2L0sDOxO3Efi4XdR/1Uc
         WZqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QLwFIT9K3fIqflFfrjDaJXgb20AMvJxlSaVSNtX8O5KPJ5hD1vqgchmP0TOpLApS+iyKm24jBPW6M@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqf3KY2T0Fp6jXlC2uSwM7k8081HKPKBbcabki6gmJQFFb2m7a
	5B4Kn5N8+A3UC7C6uED821vg7dt3mD5j+RbQUKa5ZTzhHyjo+rjGyVyG
X-Gm-Gg: AeBDieucO4YDiMZaE6QkhrKXCJ9JQcU2NWA1mRRdFT8cUDTd+D8HjRtIyfM1QJBKeMH
	vdgglCBoEUVaNjCRlUU8P52ppc20gmYjTnQVL/H+vk2JrE34QWpMTBi8Ruxb2SrU7xaGkBqZShJ
	bCl5tbwerBpWpyDSdX9y12lcaMSQdig3yXXQJhfSLn8INc01pq1b8YrLn4Bj3cX7fZDnByKsM5S
	FwwzzkBleJCDjIz9xOVLlhv4b4k4c4zCe/QfdRoi/KHl5QpD37UGYzhLuC/rU71ul0dL+aX/2gs
	y7ZEKxQl2QyTGneXfyt9j6as+yaVLczAnpJUcmGxW1M3rfbATi35Z8u6sbKaFf11m0H/+fSgLNK
	bsaEbwY6FmWWZu2s74oElGvqRQJKFi7KEYiWGEzjI73LPkU6sThIiIKAtrWPJsjebJPLfHcHF9T
	dxGypjaJjnPEAL6+Wx9kf7svXhfoYu+WSJg/4WLLneE4TVUm9pcQrAmbKWcws=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr211023925e9.7.1776792555368;
        Tue, 21 Apr 2026 10:29:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:de57:c37d:677b:c772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm57445855e9.2.2026.04.21.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:29:15 -0700 (PDT)
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
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
Date: Tue, 21 Apr 2026 18:29:03 +0100
Message-ID: <20260421172910.218497-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421172910.218497-1-biju.das.jz@bp.renesas.com>
References: <20260421172910.218497-1-biju.das.jz@bp.renesas.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
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

