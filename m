Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD67413639
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102800; cv=none; b=TSOKvXsWCK8aPYOECkdsrG+HJAntyspGXkk7QzIBgRCwxjEJNcua+UJziMLyditwibTco/FBeww/sUM5FE35OYrwoO00gGUfsO0ypW6vO/jTT6UC7pyXtfNxBwpHlZAumBHI5PmqOL/8DZjjlj0KUkSNZ8XqJMNuweid9DlRRoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102800; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtuRadf9BFEKdzvR+OwI9lcWyd0Q0AXesn6O0itr7SdiewQQ39hCk+QNG82OO4lC3fEetHbS3WuLBCwFEQDdsJmgwZBbfLUPhFSJdSff7hqvFzSyMhSuDpAvWg1Lg6pbgcE3kh7BlaUNZaeimMESbhfwQZjzTw8WucKcDrbMW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwtHUwaL; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwtHUwaL"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69de16f5e80so3059894eaf.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102797; x=1781707597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=MwtHUwaLwErKugHmP0V2uDMtzfR+8WSwfnGZm5raNF9W5MnXpw2TynK0uHOn7oBJBE
         6uGaUHKnfadf/F64vY115tkLG/6aLwmZY6+AIJSE5SSbnmlNLJazDTh5ckqn3q+oyTc/
         WXLSt8Jg/cZRl0dUTwzWX7UnNihxaJndxW+JI2Rtc7k2z6XMm2VXgeJ8KUHrucWqFMvM
         EzlxwLqnTG+8x3zZ5H7VNyhYgIK93MfM0KNzfwRD+3xd3+2Fsz/pu9DJ+LYORG3MoeTK
         5C+ZbbchOodqOYHIa8a6Zyae6kbhVz+xRQXesV3k7mpZKRMw2drXIEgsvBhMG5jJzNCN
         3tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102797; x=1781707597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=qj62aeqKnmkueTgFW5EH8vnsxDOpI4iXg44ORC8zb9z/ayRVFJZ3bNiILLuV34TSuV
         DsiDtH5kyYMIzOXhZf77gySnZp1jE3c7OBnopPruxeG4Hbyr7i56ahc4M5B6H8aDIw1r
         WjlgX2UPxdTZMBie1M7MWD0H0BQKT8ctmatrQkGZ4lCExzfybBeFgzqw+nlNS03Y46xM
         lh5rURbiMRh3t4nkMbfueAYoIRR4cqxc8nlHGyjCfHfA0wf2T7oRnA7muziz3+2hZAGb
         fXLgTCaCf2D/EpWvcRzJ8G2t3VkhRHzC+fuXHeoSD7CRF4V0/UC5fW79BpVc0edAuEjo
         Fp+Q==
X-Gm-Message-State: AOJu0Yzej2/1jMk6Px398VwWCF5JrjbTF2tei1GIsiy+V6lSCVBuybL0
	ZDmyM8cUZeyPr/2Vma3dX3lrWnTsJgGkc8C0urF1X0ztwfEIvGMB5V9t
X-Gm-Gg: Acq92OGpUPTXJREWY2vue4hEK+99/xJcOhwVc4fofAhvIcWzJshLHBoYQyw/yxB7jKu
	a/39xz8HQrOyfZzZ2d080sDMdFX1F1jvly8l3Q7UrOAI+bXWlJjzgkJrCzTW76gAM8c6rDF+znG
	l3fVy5RMi4i4MU26Ab3mEHRKgRWMCCvFvT4JhZ2PiR/GpmzTETsu0+3JtWT55rosm4YVjZh5hj9
	dS82mKZtLXtMKg6/v0dFKcjCfP5OjzIw50UzxKIrk+3ZbpxzaJJEMSqLMkwxDYfaqvEHYBi0sjC
	qi8thuiUG0UwGx+H7ixdAvXHeG/4+K3dRufX4WZDEGLVRA4sG8X037v/dlGrVGtQ5T8igIKohYQ
	8UapfF/LeISgz89IsXA8H8hYKTxbA6hAK5WlC0IEpaA1MjnMQV+XlRkm7hkyBWTb1RJBWa8CXWJ
	LLmlWs30iCbsAhh/hCDtpSpkciEFYYBpw=
X-Received: by 2002:a4a:e915:0:b0:69e:97bf:4756 with SMTP id 006d021491bc7-69e97bf49acmr7928021eaf.7.1781102796725;
        Wed, 10 Jun 2026 07:46:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4644ddc2sm12069165eaf.12.2026.06.10.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:46:36 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V7 5/6] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Wed, 10 Jun 2026 09:44:06 -0500
Message-ID: <20260610144407.438846-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610144407.438846-1-macroalpha82@gmail.com>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Anbernic RG Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b8babe9d3a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -66,6 +66,12 @@ properties:
               - anbernic,rg-ds
           - const: rockchip,rk3568
 
+      - description: Anbernic RK3576 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-vita-pro
+          - const: rockchip,rk3576
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0

