Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6646E3F9F49
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507851; cv=none; b=slk81vQY+pJ8HCJylTTmp/zz7f5nleCCcuHicjikBpEY/JrBXTBJewXSxSSq2jcXpMtfqGfEfd9M926FbybaVQ8LnAULJeEj8KBUwl2tkGoHAFKh6eFbowszTzTtq70RcXpbz7QGeiBpUGi+qVlMDiSD/f/Geww6XoZRxiE4PhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507851; c=relaxed/simple;
	bh=ibm/ZDHMWfIYB/a+JVogHL3zgQTqT1cxj2txge0qJK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIbETNt9q/3gWZZ5o7v+lEU7FZPiGkvdtObbt0Sb30VT7fvr7EHLQbab5hAG6RmQ5ZXOnbUF8SteFtLt1qSFfGfqUGZ5RUGkM2No5VZufUcjn99p88IzTO1ADiMKYUuZ2ehU15pQrrP6dJu6VdjJyZry7Hg1MNk9eAqfrFHaAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqztsxt0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oqztsxt0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo2808972a12.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507844; x=1779112644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yZ2RV9klSfc79KrOIT+9nKykbDSPRLRaZkXlnlwwJM=;
        b=Oqztsxt08VSED0yBq9y7gCvbNeIQsWzh6qCP6bEWpOdaH42iP9LOw/D6fGAQi8O7pP
         8+T/5rP9lXkGXz2utuy3yO0zDbfmXhzJypfb6BgwM6PSQX0GCpNEM14v5BFNjmOov3Gn
         vxaPdFefs6gvL0p3aCWOocLQqQo5BTYQrDwktwEq8VWzDpzN8toh2+prb+Ng2NNrP0xz
         XhX00H0+39dIbVI/dH+NyThiFKEqNozZZR3B+4A0iu+cG+u6cxhhiHfjz21bwZ3E+ghv
         4ZmQ7dgxb+4CkXeqhSUYaY50vct0v3vg3gyhxjPtxPBDVISq/a2x1EKKCpekXefD/C50
         KmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507844; x=1779112644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+yZ2RV9klSfc79KrOIT+9nKykbDSPRLRaZkXlnlwwJM=;
        b=IBOzeoCfF3YsOwl7habOE/CoHJhUn4V6q2aHZjqxIE0nb68+i5fVesajHMM6vdEXoq
         7sd8F5/oQl1bawN4uilt3uMXuIIwrJilN4Sp/mvOCS8cJTz2uspy4GeFXhaZnp4do4zL
         xtTi1lK6ccWZ6YbpGm/jUpNLANF9RN8QlRTQf0BVFORSuo9i8d2tItkV+IIp2jQ0FTIO
         BPXLJLy2FvqsD7uJBdTs7zvj5JK1epjU1ZBPX5qNip4P5VANokVvZ5dQgWdymHuUY+TQ
         ZTImUn0Axjo53zqcR7RokUoitZbTt80krcVg5PfEWAlmkAa0jymllJtofb74GzoEwTVA
         ehIg==
X-Forwarded-Encrypted: i=1; AFNElJ+VI2o6uY2QgT6ZZdGs+rarkXKqZSXTkDdCa3XNvkIjKjcd81r6bCMS8qA2fTM7soH42/vCZk7ctZe+@vger.kernel.org
X-Gm-Message-State: AOJu0YwtrpXXCYQxv3DP+zBZjH4yAxoe1+7GFYAOt8UZ7lqV4DwAsHhJ
	fG4EDI8hhXeEaOLn+PfNdpDgwapKYXNBj9OLtADzR8FdeEWdUhLQDj7c
X-Gm-Gg: Acq92OHhijcUSMyBiRsOECNAgvzuPRZqeeukRTGG5ZZmG2Ws9g1UO07nS+90rcGd7kK
	uS655hSENrzNcHG1jvK2bKJsTaT12WtYalOweqSYwDiQnrgc4hJad2/UKVo4DiqmvcOIhcBaNty
	SiSwVIMnqAzuRdUpmij7gQa6cYCZGgBfUxcFJZI/CaKW60FQ35jdQdD7i7bwQBZ1xXX/ib/V3Qh
	6XAl6fufZlDpX7AGzqVuiTjc9xBFMkQB/SbwD8fcz5AwFc1I9p8rgcgBpmWw05dHXB5kPOdn5u+
	W6lQib1HfZAugknCnAemwAuvE05IN1R5WVJQCBJAsFRqW4Sp8MUKutPiD9oBQm08CAAxYOTtJEh
	XxG0w5JnjbYIgW+bVXWKW4wrzbJ33kkfsQtOVQWWE2TUCAPI+rDeLubE4MfVar+frG4EW3EGlLT
	bPTxoqyAse4Nr4
X-Received: by 2002:a05:6402:5297:b0:67e:2498:dc7e with SMTP id 4fb4d7f45d1cf-67e2498ddc9mr9228829a12.11.1778507844261;
        Mon, 11 May 2026 06:57:24 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control property
Date: Mon, 11 May 2026 16:56:56 +0300
Message-ID: <20260511135703.62470-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the nvidia,external-control property required, for example, for
USB lines in HSIC mode connected to a modem, where the modem requires
precise control over the USB bus to properly enumerate all its stages and
intermediate devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..a13c1ef49a57 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -75,6 +75,13 @@ properties:
     type: boolean
     deprecated: true
 
+  nvidia,external-control:
+    description:
+      Indicates that the controller is configured externally and that the host
+      should not attempt to touch it. Usually used by a modem which requires
+      precise bus configuration.
+    type: boolean
+
   ulpi:
     type: object
     additionalProperties: false
-- 
2.51.0

