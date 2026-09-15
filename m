Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9D47F3BD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469013; cv=none; b=fwi5PB8sjB4HICDp+GPbYYCnDxZ+48XfuxoC8FnHoFOxMfHyB0LW8gOlChFzwtO8zFMLLoeGn9AFVIBWsQ83nup/9hUvlbgMWZEZvILeSthxzlqJj3Y+ga9nVV4vdBxKFwi4GvWCFSqPME96M5kco/gIQAK1v239PWVBdSDNqLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469013; c=relaxed/simple;
	bh=OT1ITsHPctK+L8lx0K+iSmC/XdR3PBM/mhi/vcMFiXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmbOBXpU33huM0cqNBXfo4m5r0ZNLbWlhOlkkvsa3eeToEF/RhPeLxgfAztSDnBLioxhvwXmpjm4dLzwzzbGs+RaFwMEjNbgYzF2yO+1F55NdulfMdSWGvyuJdunSSOgvS9tTxPFGEodvpVBsnFUlNt/WZ7LzX+1w/RRgq1Tjic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsHWKY0p; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsHWKY0p"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so868725e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469009; x=1790073809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=;
        b=PsHWKY0pZ2AwN0dOvcRrD3uDDyBCeGAP914c77810svfJgGWe07HBFgV4Bb7sIKb82
         OKBNaV/1FJN95cevCTZxdQSLy2pernV24fYj8xjAQ7IiYvTTDtNW7BFX2nVnAwWDQR/r
         BVqYm5oTlR801jxkhYfRE7X0l4u1imqU6yWM0azMLWneK0ge7le2GBisLcRmsbZaCmKn
         C0fVfUbfFC375K7vFwAdp3+apYS3JKzhzuVY9NMifcFkTPCXHlt4ug3ysuovb/3XTT55
         VBIA5NhuF5DrrSUg8nUsz64+qlOohThqr85mGYlRM0bV/BI/SQhzt6ZT7Q9+/UO+ZGqO
         QJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469009; x=1790073809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=;
        b=tlt+/dW82zocFULpETCHovyo1vNYleo/iROAJh37oFva0JckXm678VDaFcpc6Dt8Bb
         MojOJmjO7NGtgTmLEvsAJvMO5PrA2isE2R0UrGjqxMYouglTeJK7HWCIy6wTiEZth00S
         wW8x0vhdCQdKPCwlJ8qXLh0sRtPARwUPZGirdR8XZK6/4rFm9QcmC08Oj8mJcipZ24rL
         taTj0xlaDclfELEaJ+b9U0W7KAjakmcXKjBATekNywvmfVElJBMQ9+sI5HNUR3tPJxq6
         Zs3sI+gOwMddj7wkMUlWPG8ZlbdMZyI62vsDFfewBFcfgR6y2cGi0nrYm0fLHn4GFK6t
         PUCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy68O9qPaIqzFeW/xNjN00nYQaAnyxAnn5O+dIgTLGUcGZhSrsR1bEEtNl4fVS1bspxYg1aiv1r2Z5O@vger.kernel.org
X-Gm-Message-State: AFuF++khN/axaqCEdUWGd5P8mn/ldpvdVDktZgw1ueUGdg/MlpQkQRC0
	lhIcXzt7PAVMdMfaMd41yUlzGFf418Ty2W/iWecPDJA4pBZv6ov6LAOTEBXdlw==
X-Gm-Gg: AYBFou0+7mLJLD5IOb6SW/RvX3zi+1vcR3HmfP6WWXJCjD2cuVaNZGp2/rwJCTbOu83
	rZN7QQou5Cd9k6cEdOypA7ubzOX6HccbzXL/Kv1YDCq3Vz6MtpzqjdFYY9ix7Jtfcug0AeSYW1k
	5U/kvIhH6UsEXuGErjlyaallM7KHr0A3wE8CwONvWkRPAgILwC4OwDAU3hw8SUedCswYJITPJVM
	Pp22VrM//1OSH0FbftrMt4ze+M1IbeLICa5OdWNkCkIx09wR7iEKH6HPCcHpt82SzyZCleFD0XV
	f4vanmKhFqGI6DEadkGWRwhw0lPDwi8zJbaRpUzmoi/qKw/QJXzgYHk590S64S/WJsnwRUkpoxF
	yzbhOQVCbxN1+0rlnK7JnixLMh9ZjqOYPFukJF/wG/3b+Y8C5k9TIBHEleKiPBKxYznZftfIgs8
	3/XMTcliRuum/meXyBF09bkWRILwi/nau2NJxWrvMUJOIQOFoT05D1m2F9UbF/e6SPgc3ovpN64
	KDaWpdTpTKTF3g65tnrBuXzRDp3l8fQLKh+tEW414BJmyRxnXJOveoDnCSpsM5N0+pC
X-Received: by 2002:a05:600c:4743:b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49e82257f4bmr8382775e9.18.1789469009197;
        Tue, 15 Sep 2026 03:43:29 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:46 +0200
Subject: [PATCH v2 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=963;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=OT1ITsHPctK+L8lx0K+iSmC/XdR3PBM/mhi/vcMFiXs=;
 b=xHW4ID866vtDzWpfHwdm1uVBYofPXy1A+IXn6A13CkcRw1xUF5qIJUH44laHofEaIxFhmo/Ls
 upqPyAcWXRQCvLqafGXxKHmCv/ihMy2SrzCuxJoYmPH/nvS2amffFBs
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Document the syscon compatible for the General Register Files of the
RK3576 MIPI CSI-2 DPHYs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..e94c83d7c138 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,rk3568-usb2phy-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-csidphy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-gpu-grf
               - rockchip,rk3576-hdptxphy-grf

-- 
2.43.0

