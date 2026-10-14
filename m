Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C668565114
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000473; cv=none; b=kzF7Vmm+tbNrhKoEJEBP7ivpz04ElRbkCq4fAIynGE00DtjyelbhaPHCLmWdp7gGDD4AmybWDTxgXkVB8HnDp7g9+yKj3XN6hoxBMMStmHIM5TPV6iTu6IiOBGi1XZT2mrNiE3OTS1newJaWI6AI7lxf0SwO0qupOieRymdqa5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000473; c=relaxed/simple;
	bh=zKSuXRI8aMna5pQ3QoL4QnTlDfII69cLtILjo3bnSvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIa48RMOZjR6OG5SvudqmhHwGTaf+eN3Jyt0/uOesk+oqXPac2Y5hc4mQbsxqwy6o8g3tyZKU2WGMVjhEqtXxyFa/+5qSNNNItbdyDMYHxVJIabC7jARKNref/yP2eKVX0BHh+cgs+kx/0XvOot/yh/htei0lGfHfttn6M/QTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pO3RN005; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pO3RN005"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so42663435e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000470; x=1792605270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=pO3RN005CLFuOiKCp3fMt4dWnKmVaL95Oa5o/J/EZ1fzj9neSB7GLJNo/W3z+09WV6
         56MjiNFhVYDLXOvmlBvcHWfJC1vSBbacUPllUOvkOCyt1iqoqWyucUXwA03rn6pCHImr
         hTz+EuEunEdRDod13x1tlgiAGZTw5zdGb8rS7uFZBCb6L5FJXs13Shgv+3dzoKbKOkgH
         FQ2q2DDTUda/dMxjArrjdtzbAbCoQUV6ZSyOeOo50WFqaIJgm8Cw2x7b5PTnykq3wPWx
         Uvlbz71Y66bBN+Um2b6AQYX+EnNSriLtUsCFQz76MS6HePOi5UojmL0uVHquom27LWfk
         xB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000470; x=1792605270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=hvzMc0r9Y9NC7ZXUi9H3tPQjMnwNG8B4TOZrMEMus66PU5Dv9gsmX9UzfnqDIEh1A0
         3E6xFxijSfovfKn9acDlgWIRjSRanP0P2h9QM1HfNjw2KdzcAniilXjRkoO17up3x2mx
         I52S//cVnRhGsHMEGPdifmenQw6Xc5X0sJXIf8obwk17Y/YaaOeI6iHDXUaGOrau8ALJ
         ySDNR8BuzKw7SJ+zAXeXc7ym1z2wnVT3n130xBdUguQeeXoJmxR0cPnqO0WvGNi5QRQe
         vUgvIGnPv+AGwvNtrzsg68hlfOu+1ZrsTPRBuxZmX9fj8AoD5CVfhmETq17MzBYJjAyq
         yAsw==
X-Forwarded-Encrypted: i=1; AKwUvBxu5cc2u9PBU8Bgg/NoRxcwIIhzEPXe3DWVChJvJZnB+12si8iLC6HzthnSPOCzsMU+J3KXqcgymND+@vger.kernel.org
X-Gm-Message-State: AFq9FYLYvQshibh0ktlwCj5G3iDZAWle+aEbbTJnMz9jLp1V4sxQm+7u
	g7pjpPQ1H+QUw8QCJ/sM+d0JBOt/x2jgdms4lOZ48A50ldduNm26z0wEE6KUjBvRYF8=
X-Gm-Gg: AYBFou3zrfPKMCQDDXe/9r/xHQJ5cwTdMdQTzuWwoJaV4wxSsgsepomPRFehDbLOrFd
	B3+9l3zyIdCt8d31UW6o/eXC1pctIl75GG0at/BPUk1sFIK+jdsL+DopchMgi1ipeeD72/bxB6u
	LTYXm5hLR8JGvMQfQnOcj6GNIY0kZyq8pyAyso/RmbNjLwzNyoor8XBgcapzwqxZPvT1ouTIkij
	1uta8gVGKJvZEeVIUC7kwOitYRZ2Ap0htH2zWBNx6olnj3flAcjhg+a/UCSfV6z0vMblAYiPlmx
	QhnCg4AG8ELopnuMov6OVIkrpdeWmd/V5tqKVPEDl7OF8eGXcPHgtHPCjM+Jb2j8nCur9P4iPg0
	45DJOjrR7pSuX5niBY3lrNlgiEc0633g2m1TfXfFk/HPd4Q8tXqKMVV4b2h+cW1LeiWW8vYwain
	yWIpEAItp/ABom+ufxJzyc/hWym93dQG2SKsc/vLCC0PQmnc/HquO/433MR5sv4GJzouDzPhb4+
	2IvpjZWr7xJIbw+V34edqynD9GWvHRzJSQRz8vFEM+Tm9Ohyg==
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr260052285e9.15.1792000469877;
        Wed, 14 Oct 2026 10:54:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:23 +0100
Subject: [PATCH v3 02/14] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-2-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b4733990d03a..3656658e18a4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -186,25 +186,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -913,7 +902,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1175,7 +1164,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

