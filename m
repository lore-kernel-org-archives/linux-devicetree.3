Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF494285041
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430051; cv=none; b=BMZNX+II2CZN11S+5F4gbiM7TNH3SuIAxve80NH30TGai5JcU+eEQD8F6kXGZjcfBN30x0vXmMV0fQEuQrW/GuepWaethUSazCkloDwFoqrhG9mJYMIjbwIIAzNDWZW4zLXRA42QA4b1uOTVeh3fPHwZZ140rFqnrvz0X/HEmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430051; c=relaxed/simple;
	bh=qFXBmmvUeTK1exabxEjnNxEYc9NefmCZrUqDcKd9UHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5aPW0+Ej4YNSXILC4JKK4E00Hf1DeDdt9dBCxAIW/Hdgqn+xQUvgUmmpen/5Ka24eDStQ40C5Q47wsqeCX4nuU0eUELq0lIFQT9EWdOpH8UvW4dy+io4Q7Ycpn/7UJhsvkwp064v3dH1FsqNPsr8HeNorzkE7lb3OccmUH+1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDHH6ryC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDHH6ryC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36974220e45so2943110a91.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430049; x=1780034849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXHEsP6MIsIy0oSjkFIfzW+qvl+16XTQ6Ealt2erRAM=;
        b=tDHH6ryCDW4kDmZE3/UEbTtq66FBojELhpUQWL044sqnvfmCkfdF2ugIV53BM4RLyw
         NeESeAvshAmIrukTP64lx+RiYswE/uzUjxP7TbXuwa64v22z0epaRLbcTc18vZ3NG3YG
         ryoUy7DxzG2pNHx5LhAJ6WERaRpy3zpC6qvYvO/pR2czJvX1WRoWjUw9KUqCfmjyeHny
         2awzxxLnPVz9m5wL83+M+gfAnCN+J9ZMvqrcTowILST0uWsVuzbpDZgapvqyBWL0yh2p
         qdQKBfS4ic/F5MuwdUH0V6kPuJ2zVzKZvQ1HTKyHaj49bYDxi+7hvD7ehEDPmuCPwq+x
         BQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430049; x=1780034849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXHEsP6MIsIy0oSjkFIfzW+qvl+16XTQ6Ealt2erRAM=;
        b=sq8jpG6D4Mvd+h4T5hqzLY8E+3qGmm1lstV4xVjrR4Q2dR35qbY8YB85rdPzG8iUo7
         8WFa5NqxnER6yq9O0L6BoCK36pnwq8fu7E0qMNzZZ6fUGyqEW18hvprG5QFDGwc4hq3A
         V2hqucU90SBISDX8KbJPNb0b4u0i58jJrPjOURCfSsL4J5+GEPgqITi0vt54DyFHrM6Z
         oppgkoVJTALqkvDSHMMs5yaZPzYFzlzVMK6CfgWf6itwlRLPS49ao1d+4YwVoL6I/he9
         CzJjkwUXCYlZ9yHi/0GQcKrpSUHko2bU61INfRanuNqtJFNKXirK8y5HgtbNHNofUqu8
         eCoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xi8y2tF3h8f1hYnRoMSER1PBKxaw4QtoWxZI1kdz3k9DncQUeRYypN/gd0U4QvMksYD0t3MdlxCpj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7oFiquhLjAIedIhNh3fsQ2/xuzS7YDXiw6X2+OVMAS41DqE7v
	1o1svzfeYz3jcAMple5yNXbjg6RtWUqamMYfXlyvrMlQbPnMG5mFJTRw
X-Gm-Gg: Acq92OGr75Uri9Gld/6zGz5yxo7h8fpe+bJGuuzSWo/0XBZRoJDbTK2zAqwR/I8TcTI
	+nsN4AL9ibCKJuxTlcIF+3rDYNB7jx7TLw2k+4SgmtE0VK/jtcEEGZ7Hfgo6eKbQGnFUeDXX8dJ
	XgEc6+28hvY28+a+H6xg7znjUiOr8/JoSSL8r7TVLgdpCkgyKE1xsU8m7Mvb74zloAUbzjT8X4m
	7JCuQ/5HrL5HfU3dwXUUtfPSGFq6LWib/saKTfP/Ou2N7x5na09eyjG+wl89mLweVNdkbnPobx0
	pz6BHn8Q6oxP/JFNu9XaRdtjylQhXC0u+njBI5ELHvnv20kZOeVJ6vZ3C9vLfmYnyuo/8dX/L/8
	4YylJ2OserJx/x9AXRmd5hj8xBJEnJnC/pG2ia3lG9E0bYB/XMhGMP7/jceP9w1nN2d8OY7ZROI
	qb1qZKxOPOUqSWBeueTKHIskuDmW4atNBn6U+ZWj/40xLkj37CO8znNg8mTbcYpQ8XtA==
X-Received: by 2002:a17:90b:6c8:b0:368:7398:df8a with SMTP id 98e67ed59e1d1-36a473cccc4mr5285786a91.4.1779430049070;
        Thu, 21 May 2026 23:07:29 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:28 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for RA620 bridge
Date: Fri, 22 May 2026 18:06:42 +1200
Message-ID: <20260522060645.4399-4-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RA620 DP-to-HDMI bridge used on the Radxa Dragon Q6A does not
acknowledge DP link training at voltage swing level 3. The bridge
requests maximum voltage swing but never completes link training
when the driver attempts level 3, causing HDMI output to fail.

Cap DP_TRAIN_LEVEL_MAX at 2 to match the behaviour of the vendor
kernel, where link training completes successfully at level 2.
This allows the RA620 bridge to establish a stable HDMI connection.

Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_link.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c0..ff0d8e99d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -24,7 +24,7 @@ struct msm_dp_link_info {
 	unsigned long capabilities;
 };
 
-#define DP_TRAIN_LEVEL_MAX	3
+#define DP_TRAIN_LEVEL_MAX	2
 
 struct msm_dp_link_test_video {
 	u32 test_video_pattern;
-- 
2.53.0

