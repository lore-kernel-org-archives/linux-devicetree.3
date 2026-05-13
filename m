Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892A303CAB;
	Wed, 13 May 2026 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678289; cv=none; b=iG9NlkTmDEsvIcHEFMH4MbZ7dbiFuA/LwvKoSuObGHIGw/OPwBdCW3foajb6uQ0P2d8PODrig9veokiYST5OXBR00wUSIw8IRtbN1octVfAiV+93cFzFi3NfdduJ5+qTjmIeseLN/TE+TeFNZESVnLFV3DQNEzfdbNSzIPVQfjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678289; c=relaxed/simple;
	bh=bSJ25hdhRUWRW/tt7xLdkj0tLeAfFpTuwryHocg6FPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vw94KHlexp/mXXzTOzsgiDrbX8nInZN2TmTV8iZCIaA3/cCS2/dYzF9uweMyvlwQ7Kf2ynnZeymU1EDmuQiRfVfoO4y65vOJNvK5P6BZmg9gQLAwvtNww0o1xwsFLEuiyw69zU3lVg4SEZfdZze6zxqhK+ZbV9LGh5hNXq2m+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KWYq6mDK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KWYq6mDK"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 737B02E4F;
	Wed, 13 May 2026 15:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678275;
	bh=bSJ25hdhRUWRW/tt7xLdkj0tLeAfFpTuwryHocg6FPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KWYq6mDKn3YTBmsrpB+gmpADSvAEOqMRdYIoxsDrCZpEooPq+q4N+hau/Mxdg9v8d
	 D4bcnmlCwGIBQfvmP88AHvjRG7OX6Qf+CzZ3VBPhxYW/cg2pblEzOEgF/xhSNCK9Hr
	 zJoJWmvqTlnEGykIXbLBFTkCH2CK6xPXh02+H878=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:29 +0300
Subject: [PATCH v2 07/16] drm/tidss: oldi: Remove define for unused
 register OLDI_LB_CTRL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-7-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bSJ25hdhRUWRW/tt7xLdkj0tLeAfFpTuwryHocg6FPM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHn+2YNXZZ8aN7zUh1BcDJWnr/httpnHSfxdC
 cui6qEUcaCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR5/gAKCRD6PaqMvJYe
 9SiqD/92c2VScAUTj8GGdabM+26DMx/WnaEAeKL7Xr0dK0X766sGDIr+pltCP7TpbKRVBk48LX8
 UVOeX6UMs8i6Gv8EI94LABG54BXMBDZX8LEjV5q3jdiV+3U7OKu5xTnN+qugSHlXwI8J9RN5/HV
 JDdam/oFzvnDu9fnjqTTkYHHUYtTWYh5xYeH9Ocnyop4bEVdVx87a6KLyl/I/RI8entf1JwlMC9
 2xyg/SBt7ib3koWQJZsESSqvaaw5dNNd3p75kFFtMXVssoeaeJY+GJbRnQDR3ONVoJmZSWvZfrc
 vQhCc8SKk5rAYK31mJg6cPp+BDKOcEqqP+jy3FhYXiZ3aeGttksrR28c0Rhw6npgFtvn9zCsCYO
 D9IszvVqi3RVGGP2t5CblnrZQnCn6M0v7yJb595Ogc0Hxb/HpsIt1oYF7m8D6y7vSIUs00KCVO9
 PnSWlDzdVIflD6Cb9RoNX4Ygnvkxhzb4w93t+78QA2uuxsmhQMYmA6KGmrK2uZ/MmR81ZsyUC0S
 54G6i1FMLlDWujFD+Az/Gqs2SN5+FTD2jKR1/hnQsONUNk7cqUGMGnybQYVnH23CYETJdcG0HuM
 Ee5NxS2HUMlmzpxxOZMfzQrL3tc4vI5f28BbIhBFRy6ELLrGeQX7n2lTxcs2ljHBUOiwHY8sps5
 vRzPI3e0rqvR0bg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

OLDI_LB_CTRL define is not used, and doesn't seem to exist at least on
some SoCs. Let's remove the define.

Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
index 8cd535c5ee65..a361e6dbfce3 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.h
+++ b/drivers/gpu/drm/tidss/tidss_oldi.h
@@ -20,7 +20,6 @@ struct tidss_oldi;
 
 /* Register offsets */
 #define OLDI_PD_CTRL            0x100
-#define OLDI_LB_CTRL            0x104
 
 /* Power control bits */
 #define OLDI_PWRDOWN_TX(n)	BIT(n)

-- 
2.43.0

