Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061C0391E49
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558584; cv=none; b=MSzpeFalzPfvjw9NyqLJkIlPmp6h1GKJwjENpGYIGhoqKOlAR4YuI2nUvqmT0x7++uyah3Hk8OFd8HDIHqyd7gfv8bfq/+JQVsQOI7+cXUSJccoIrmzEGScnyaI8ZREwYy7gnUlJ1NfV8i4ankdt9O3/1BCzNZmnEI6pCzoKZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558584; c=relaxed/simple;
	bh=2GKa5PPIBCTWD+KU0rCbkGneABKAAjN8/JrM3XwKr9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FolXds7bmLhQ15I+Ezw24LFsZLPRoj7JvOVArcNEATFdb0WCdZ/nuuSSgDaxJw5YLT4Yfq3elKeXQJCHXW8dOHo0Ma2GypZ+qQFM375/RhfZAEqbvZx7RoV43/Q1IVMSI1HPNG55omfYzpCZa08LAxxGD2TN7XUjjcNoqdm0GEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kosiz9Oq; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kosiz9Oq"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so238333a91.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558582; x=1781163382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7G6x2SUs/bASORWJDIcXZXWcW31O5jTR1XJ9NK25Xg=;
        b=kosiz9OqmkoYDToOAGVg6VAq9JkZEhzH8LVxYrPM7sQE5n5wD8PnGi469Qarqv0QiR
         L1CUeR3/O9e/L+xppnPNfJHynyUmbVooyNLnlZdrgniDkJzV7GxtI5Yj5EYPqLj+u7yJ
         j424ViewtcNz95DDTaYXscESiuIvs1JnqaEZbqeYT//NOqThe7eCXxiZJZNOnRCYnDdq
         tWDAOQr6/zNSsvHTYmd9W8SHuRLcA2jr2+nOblr5DrUIc8iiz7X7r7TSaMPQc7oVdBor
         M0OrnkWmA1meZGlY6iywN8DotMfnot+Ndilt9JYCzfZFXz8bylkfFxLkosOU/xOXVg7F
         33Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558582; x=1781163382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7G6x2SUs/bASORWJDIcXZXWcW31O5jTR1XJ9NK25Xg=;
        b=icZLWxv7qo2OZSYIIYJIjmZ/qYkp/L75QOwFCcivsyzwv8tDCqxmRJRzg1g8v/LLbs
         MgbluJ1kD/14k+SPL3pLeu2tTG93AOF+5qpb6OFiVQqBexTj+akpaJnB4aAgaeEamAHz
         lYpegUmlqAZ5ULWcy/3rgqTtt3WihIQ0MLqEM889sToiyNfMvneW9sf8ADXV7RUpDed6
         u71Fhfw2ZMh3BMDh40n+97g+bxZtH9LwdNULB/u/Reczw2k2k/umUsyP1+zcVCduH/RE
         XvvDZY0KZ+sxz4QPvg09WVavitHaTQS1t3Ey3Ba+94SJR+wB8TLc3KlIBLIubO4VfmIi
         Y13g==
X-Gm-Message-State: AOJu0YyL+pu7RSo1Kc32rYUCjOS9EXX2RfFdki2Bdc7qGCc8b4BFZOZC
	t2+OZvKov4leE81eH/ETFML59n2barJBiNkRX9pk4iDmBfjjjIToWxXa+DcnyiV035IVng==
X-Gm-Gg: Acq92OHRpLETXyYbow3OD0AV0wPRFrcagag6xBsMoIftxwnGDqD8qKuK7Dw6EbqQow4
	o/ZM3vEn9HhVTHRYWnRKYt6fVoNFizyPdpSlkRjqok61+grP41JvluJ55+YOaEgT1ahmx+FstUq
	UE/QUUmCXll7HLFJjsAVKChJ1ZyCYrFKCaci4dKVaSUS/Hv4jEmQ27mamOW2j/z/CLg2JfKscwE
	VkD11HM4ih4JVhTcnvVQGygIoro2ekUFPcIXTGIChrEzCUGD0ZpfFbJHfRYjTnpn6Eoh+VdMxS7
	SoO5DU7EorbIz7cVc4LqlV+QXoZ1w7QJZEaI3dN5CQ1GKoGINfSY0+kvKHcdyF2ShY3HBV+wMDq
	GqRhS9XEbiSVXj1pEd+EgfzIPb7uqL1pxrFapAiIpBwXO/vUZTmueE9EV0WtIgUqapmFQEh3EIy
	HcAMyDVzj6BhqBHJz3Q3gcej3sMJbhJiV4neGx2LUKqnozVs10lQUvT7ZONA==
X-Received: by 2002:a17:90b:540c:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-36e30e1435bmr6984123a91.7.1780558582113;
        Thu, 04 Jun 2026 00:36:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8521sm2063074a91.15.2026.06.04.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:36:21 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH 1/2] of: reserved_mem: avoid stack buffer overflow in fdt_scan_reserved_mem()
Date: Thu,  4 Jun 2026 15:36:10 +0800
Message-ID: <20260604073611.3954433-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604073611.3954433-1-chenwandun1@gmail.com>
References: <20260604073611.3954433-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Sashiko found a potential stack buffer overflow in fdt_scan_reserved_mem()
due to missing bounds checking on dynamic_nodes_cnt [1].

Fix this by adding bounds check.

Link: https://sashiko.dev/#/patchset/20260604015332.3669384-1-chenwandun1%40gmail.com?part=1 [1]
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ce1d5530ec0f..27dc98aa9bf9 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -346,6 +346,12 @@ int __init fdt_scan_reserved_mem(void)
 		err = __reserved_mem_reserve_reg(child, uname);
 		if (!err)
 			count++;
+
+		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
+			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
+				    MAX_RESERVED_REGIONS);
+			continue;
+		}
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
-- 
2.43.0

