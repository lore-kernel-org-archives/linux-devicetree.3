Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C49245C714
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544404; cv=none; b=Wmcrp/Rz6uVOPgFnBRcKNHQjsrbAcX9+tFExMlx5HBDVkA7V+/rEwW4qw09K0Hq0IwK71u2zUrkqtZ7HGlu8uAGYJ/THMeexVGDkFQW/DVE9w9d3dBK4pPB0vJIqL5xcaFDtkIyeq7mhlgjVmCNgyL9C6uqI0BS2EPMtu59ISrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544404; c=relaxed/simple;
	bh=FzQdI41LsYXGgDVc9k9yPu0jzMl08cpB4+kHkxb+1DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=den0c4DpSqLPqnMDN1rw3sOjb2utVR9qXI+VSnHIsxUkiowY27q2P08BDd7IrOXc0hx7pB9SMb4Qid/zik2pSNSuWoUu7T+odpBw0TmEQwIm4itbPmf7J8sFLDHKiv3mbnnCdGe71140pAUGpNcHKrlQ0M4b2KZN2C3dFZNoE8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsWHbuPT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsWHbuPT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so6565925e9.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544400; x=1787149200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMZSBq3TM9KrtGynI6DWaERDoo3umOgfLHwY8OUCPPY=;
        b=CsWHbuPTa/dyYRbT1qJTjSFxna/V9sFQgdM1Kw6CxhUy/gukEZMi8m0TK9nDUPUJEg
         kqVW2234ADCV1uTXh07Na4Jl/u2dnwURhALy6lxlz7z/K+VfGo9gk5VTHPZAhmQjXrUx
         oP6SrBGgbb4cbdLWcv3CKFPfUdsEhIritzSXRKB/j5S0Ak6iXrLC9miIT/h7K9V4abBH
         fHx5vK58iuIDIxw00NIPZFKYecv4QS/TPMkDRTKfdGCE6DW8nnAK5TbGbZgP6j5AgLXO
         FmAUCeTxmEOsrImhefT3QPaXRlvbsrd56TGYVCMZsD74YEacRqNQ5rO8iGTomURTZ6jU
         L9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544400; x=1787149200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMZSBq3TM9KrtGynI6DWaERDoo3umOgfLHwY8OUCPPY=;
        b=Q36fUd0jDUVHrtgOBr0nV7q2JyjLC8CzsrMxSK0ya9up6UvbMKziBDVpueCbruCNkU
         1dC97CnWm5WnPQ76r2R2ZEr53gfIOFmBB+pCQEJj7IpcT3ScGz7o/NSa2cnIGMeuAAjX
         X+aqevNzpATmXcxBMVx1HzKdQEdBAd+jtzUEaAdd1ly/JFv9dSuQk1UdSTn/aM8F6xzR
         vcg27VuuScIctHtOAaokjhGwxZq75yMftWjdwdqu27k6YSVSF+6mhUyQvcrmDTCJqQzw
         5SlavCjoSCH4rgaxnIFL3HsYvNmClqZaO9OiECkDir5dWWnC1YYAmj3ivELekENnHApW
         RWcw==
X-Forwarded-Encrypted: i=1; AHgh+RqY/op2M1ByKXzXdCoeQBaSUxOWRDq18EZhMvQ/CDz7IaDOXkDQlEFbbd2JjmP6FplYgU3mrDPjeeds@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcW6CSRSopdcYVXN+BN7NJ9bvDs7cGNFc48Rc41es/w+1SqjG
	SIid9EQ6JsfUnb9EYyRzUqP6cpcTXMgG9Hw3NLn3Haaa4jTKsN8+1q7R
X-Gm-Gg: AR+sD117IKGnblrkkVizz936ZcKysa69t/gI6F8zPpUVWKDWfuK5Jlf0RrVD9NLJYKU
	vKeY/uWMkeK3ztlF42j4gflqYG/WTfawvcutj3YT0UPkCYVeWPNJOLVktYz/78yfebp7IBY04FX
	7YucYTWJMet4lsKDzPI1jhuxSLQppBwJf2zz1jFaL/MbTUnXQ9MmBgiml1fV1pArJlzMNoRgw+w
	f/6+I9N/zoghrgziNjE38/e/2reQwwz/z7+tq6/zRBNnEL9R55ScfckHzb9IhhIgm2URlyL6MBk
	xNxe6wz1bmyUTKymBUvlcslYYI45rTFsoeCN5eC/6GBGYTY9R9spUUhRwL9z8f6/okur3rv9N/0
	eHvVpuhIyXjeoZiRQG1uuafW0hREvMlPfhjgcY/4489qpCw11ux/VCl7yGwnhoWjrZZrKIYDH2n
	BT4hP1fp2CViajXNu9xhcIiuUePQZRvb+EKvwMT540Cj1DdtHNnPDG7GoXQNxne14xVh8PF+yQt
	BQUoWWrzIt1iw==
X-Received: by 2002:a05:600c:c4b7:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4997c0e398fmr55410285e9.3.1786544400258;
        Wed, 12 Aug 2026 07:20:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function support
Date: Wed, 12 Aug 2026 15:19:27 +0100
Message-ID: <20260812141940.246223-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Switch ehci0 and ohci0 from dr_mode = "host" to "otg", and enable
the hsusb0 USB2.0 function controller node with dr_mode = "otg" and
status = "okay", so USB2.0 device/OTG mode is supported on the
RZ/G3L SMARC (r9a08g046l48) board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7:
 * Moved the patch from [1]
 * Updated commit description
 * Updated dr_mode = "host" to "otg" in {e,o}hci0 device nodes.
 * Retained the tag as change is trivial.
 [1] https://lore.kernel.org/all/20260707145135.247565-4-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 522cfde4b66a..a3c491778aba 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -88,7 +88,7 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 };
 
 &ehci0 {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -97,6 +97,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&hsusb0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -149,7 +154,7 @@ &keys {
 };
 
 &ohci0 {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
 
-- 
2.43.0

