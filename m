Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D235F185
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827650; cv=none; b=fa6m14blllkHesKnjjjhYCX/GstfbsH2fHHw9oOXuBmUT29qQLD/mc8VUWjS6eupiVniKFapS8Dq/xtKvCM3CF1UMY8LCh2koJ/YSDHJaFDPA1NDYQBBKblVbcQqGmGhEFiD04b5wSmB4Otaq9gJcSNDRwR4gjr4+ngoPzEjcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827650; c=relaxed/simple;
	bh=DZ9oLVY3Czyu62BJE6zCrZ5cyLVV+14RZVVwZRJj3sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Goot/B9T/59UZLwePfQ6p6r1uGRv30LnAoCVfR3rkVI4hdZbmdcGQ19S3/5aGSNpAT0M7op2hPzsrydUrKPsfJ5Fw58GmXsyitN0q1o8KE5431kLE0wIxoDg7YCE2VkFrEtyMUl7LhbxBJLwa1uK+Z2KMd2IceJzSOAc3TF+YqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NdJgLlfu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NdJgLlfu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo1731308a12.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1778827647; x=1779432447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GSV1VMYT9oCWN+WztoVciJCG7ntocFd2tnKjl2yZp0=;
        b=NdJgLlfu4A5QNdWCDZ4NDgPPx7uaQ5GZtMAabKFGcOAWFcUZz7BGNitQOfsLAkI9FQ
         9oXjOTuExTq/yidzUYaPcTlU0hyGxkXK7YvFI3fBAYL0m/Ta8wtowT9IlavEaAgTzosO
         5p/S5Na1IlN/J5iuqQ0ahQP8OwQ8r1WNjkDlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827647; x=1779432447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GSV1VMYT9oCWN+WztoVciJCG7ntocFd2tnKjl2yZp0=;
        b=IMQRFGbE97OwLJb6kIA2slfSEDYEIqvVrDpP+KSiUJMtJnqZ/p/Rosr6Ad0QL0neby
         U8fdzdQdV/KBe/qgoJ65SE65J5KvuWkpx4eHpmCh6RrKrbf/JAIMLezkfO+Li83zlVze
         eJR0ROMS0ZuF3iexnuBGjD3PLhvBvgWnM2cfSp9QbI3B1njqI8l5TnyHySU/litemfrC
         PnoeMkhYrZVb7sVrUvhQHdRSEiJCO8UZ+IvEVQB2xx5xB8HE9/IVNqpfLlZPc6gh8clA
         413cdecTsGWPA3x6fFVDnVw4adf2DryfAvWqEft8D1SHAyanC41GZxFSHSAJ2eefLtfd
         BM0w==
X-Forwarded-Encrypted: i=1; AFNElJ/TeVr2lAWtGtQ+G1aJyK2bftApJlmlG8TtQy4n5gLyddN7tOV0xbxen+E4DnXq4N4+My2x9wve5d8q@vger.kernel.org
X-Gm-Message-State: AOJu0YztrLXYSWkqQehytn4sLoE7vdQ3SbG5oAMfykWQ1WntJyxzEnTe
	CCI/KvXT/2uxXGk6UJGOQh4OAFPeW4gGGaoMzgECaJDYTJbYE+x7cQI722J+VY7nh7U=
X-Gm-Gg: Acq92OFT/tvuxHaA5UuLnIx0wJq9VKh24XQZhrKEZfDjJ1TBhKH5FW9vP6HrKt0Qmx8
	K1F4gyMfRbWVdqkqsITHd099HPFAT2P5mw+eGPBb/xJE8iOrqq9pEtzPExZerOmW4jGKSIZp26H
	pmovYOmqVC3xL2qkg2NRoRdu52whpwP40N0K5z/Bji7XtwXYd2SFpalrUd+pxTMUBrz2jxXnBEx
	CD0ov+eO4j8B07gUI5Ru3xa+P/UDv6gQb3EJvH+DFy7fFIaqf1+oEsWxIOI+qqsWgkC4HI/c69q
	gAgyTaukPU9+X+8IclQ9FOpFQgjCgKzadYNTBjSxLDcWmIHPV5ThJUdVHrpycXAGp/e3nxEweSw
	PxWqJdFVSdDyKjglqXAHFv42bHsNqMpMlMiNnhyVI39CjBG2jFQUrgNjO3Dkv9IuawtxheQhQRW
	s/cVkv0BD+WJdMSFyc51gQY8r+PsKMo3udzeSSByVrR6smUM65+2bhxuNuZrLIn7wjUoUz6yVNK
	eFfmi8r7QO94VVt+arwfvfwWGc0E73owpk+vDw8oPmunMxC
X-Received: by 2002:a05:6402:424c:20b0:680:ccda:55b9 with SMTP id 4fb4d7f45d1cf-683bce9d17amr868593a12.16.1778827647337;
        Thu, 14 May 2026 23:47:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d510fasm1607798a12.11.2026.05.14.23.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 23:47:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add AM-1280800W8TZQW-T00H
Date: Fri, 15 May 2026 08:47:13 +0200
Message-ID: <20260515064721.1750990-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for 10.1" TFT LCD module from Ampire Co. Ltd.
as part of panel-simple.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3e41ed0ef5d5..ea5fe23a6fe8 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -29,6 +29,8 @@ properties:
     # compatible must be listed in alphabetical order, ordered by compatible.
     # The description in the comment is mandatory for each compatible.
 
+        # Ampire AM-1280800W8TZQW-T00H 10.1" WQVGA TFT LCD panel
+      - ampire,am-1280800w8tzqw-t00h
         # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
       - ampire,am-1280800n3tzqw-t00h
         # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
-- 
2.43.0

base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
branch: am-1280800N3tzqw-to00h
