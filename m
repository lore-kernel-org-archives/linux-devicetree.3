Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7DD499F2B
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320694; cv=none; b=VWyQrPM9Q5ICRD54A8xONp2mAKrgioGyxiHEHnP9ogWPRNa0dFxij+LIVT3eY2fBSHn9YXMTppPb2Q573SWF8Wo8GbShGvPw2ugucJX8AKOZQUrSHoa/7E2cNOI62x+ni1GbLpuT6o3z/ufIqoMZA39BNk+ZNeY+teyhwtapiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320694; c=relaxed/simple;
	bh=04GCmteGIux4olAHeskFAacFufwWGnwkFW1GWc2dsNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxJ3WRd8r+2jkxMkGaMg6jSVaTsT8MNCqsynZ0f64V89cYpH2KhgAQetLS9PwD/7/d/x/d1y+gTygWn06G3qBc89dNdN6xoanC6LheZPqFESPShD1HGoLlSqvlFG1yQIgTXvtzS92zrMlUd4w9eWK/7KiU0hpvfEl201d8OmHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk3YzsBB; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk3YzsBB"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so703004a91.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320692; x=1787925492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwGs2ndQ+fjxjLIqK9oi+yaLvoYinheEb0GyyG+r0eg=;
        b=gk3YzsBBhccMwhwaXya8roFyFS0OtV07f62bDiN6vdNaXwW1vJ7afYyYqHlR5ode1x
         5xdGMT8w7dO1Wl/B8lZYB6x7ro0LLkesFhMLP5rGKB+3VO2EQy96PFk3G7DrCeJ5rkMK
         f/8T4AZ3wOCFoGXIBjl+zrsfRHEmyX9aoEU11yB4b+SLVUsL8XtBx8LbNZYsadJ787ij
         ffwHCodjlbhz/eMsr5ds4ZUoBlTR3ZEQA86IS4a4b8tXDboGfEF8EpX8YULfPDKEuhPa
         2ZpPJxnog6voiJOnozWyMYCKV91EOjvQsH0fk+QljJMXdMpxdwPucEG5uqggs4CVYwaE
         UUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320692; x=1787925492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwGs2ndQ+fjxjLIqK9oi+yaLvoYinheEb0GyyG+r0eg=;
        b=Ss/x8p7kIGH5G/1VaxdYDdTNCrFbACQpnC0+ap3JcRa9GblT5pA5v6z2GBwqDG+3i6
         NRAqfAbN8ZtKhczz+ZWKeQivaMXyJUDla+t+sJDALuqb/ed7hWiuGHXq2x9UV4MmxB5c
         IeMcGzy203SYXpiF8sL00gon95KXiH3B98eHAJJD72B2f9p5c/F1h5ZmKkns0N6/D5xK
         hv0sDoiVP+K7TCKeoFytfghXSvQRC1NPJPxueww/0r/7FoHtKFywGr3O8ZGVfSN4IDY8
         YO+VM0Iuvjav0IgrmG/U8yNmKrdKu0FDaIBqk4ZneoKWBfBQeXR0hJtdk2K5QBEQ2v8j
         Td9A==
X-Forwarded-Encrypted: i=1; AHgh+RrZt5rfKYp4LWeasLqSDbaeNpCjxEHC+UfNCuOPzN3YbHqZsbUp7yMkqj3waBO1TSE+9Q53En9swK2S@vger.kernel.org
X-Gm-Message-State: AFuF++mgbjsUbrVtojN524JQQrP/DcuzUAWbbSnwzI0Ud/M5Eo38ZiVU
	09qXjon5YlWxLijY+L9yh+YVasBvGh2Mf17+YNYD/F6mQ/K+dbTfyM1Q
X-Gm-Gg: AR+sD13+sLS+wO6romkSbZTb4+7iNCOWtHkFGhOfUVgl2G0NYXRA9B6xzJa6eS2bmSw
	x9JFZtynWrcAuwlL7ejMbaJs6WxcRVzSSVW3cByLyLIV419JrQks7QowH8fQr+GbzuA7NoEMoUT
	Ei7ASEGUnJJlc2YrDFgJxMUUSy/RR4sV788MigW4/TMGqwsDYquRfFtdL5fNZzfnws2OS0Oqomr
	CLf9j7o82DrPBNmGkxoxv8mDNyoE7W2rhEeNg1Vxze12IubmkYYJkWkcGqDbvwyNP+jMDh/F5MQ
	eEC5+ZDZCKHTXHDOFTQJj44oRQyXbgcK/ZBFCyWeKXcO/K368N/4QX9nORjcqcLwh1Vq7TTac0O
	IFbAgi+FWoerZAYafpgCh0B8aJT9CskTsl+qwb7YS4KWHRNLGT85vu5F8GQ7IwGdS2MiOca3y6u
	Mi2+PVT9ItkRneiJmj+tPUDD/5Dhu3ulkmBDxdkmrBkHXOTG430mGd1FZAgFIYf2rY1xcC/RaHS
	VI7RcmAFN1MHYoyLTULGA559wV3vBNgb+AMayIQQtDWs3VtBKFnUO5ZSrfK2UDHefsnyQDSfb6P
	5OnlCHlr3g==
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr18208312a91.1.1787320692568;
        Fri, 21 Aug 2026 06:58:12 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:58:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 16/17] rtc: rzn1: Drop trailing comma from OF match table sentinel
Date: Fri, 21 Aug 2026 14:56:07 +0100
Message-ID: <20260821135608.275233-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop the trailing comma from the final empty entry in the RZN1 RTC OF
match table and mark it explicitly as the sentinel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Reviewed-by and Tested-by tag from Wolfram.

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 35770bff129f..75713e7b045b 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -528,7 +528,7 @@ static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
-- 
2.43.0

