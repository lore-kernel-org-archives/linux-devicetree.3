Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA854488D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080652; cv=none; b=aVoWqHzz+0WLU1mzvPNHY+pOhX569fNHCtgUrdaM2HOx0J3gZ/P647TQOEB6yl0yiF4EP6spGHuv/Sdg6AHAJermzn1sNRaxMfY7ToaQ75lUZwQn9EJR+G6ON/xHmj6qDhHt1YNKgQrmgVJmbo6eqxP+SmhRT4FHrIjR2P3YPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080652; c=relaxed/simple;
	bh=GNNcznWSFBk9BfsFx6sbFhNnUmqowOVWfdNrSDVGjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3y/0kLpEygQ4Pj70xpdvFYT5MsaenYNwI+a3BROx8JODRp6yugRaJnfIBYxqNlPqOz2zVreQum3iaEW06ZbbVxJ0NqDuFOw1qeD7WonWNXjg9Ng1OZD9wDcJZqC9mMgqMw6B5rJMkt8G00za0np+uIZQk2uleyehI+zKy2Mels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9ajlz7D; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9ajlz7D"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso3004573a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080646; x=1790685446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=s9ajlz7DsXauqODVhAgShrkCAxfxA22SAojiHI3g4qJaoFVWlbD66tWqYv2Ws4P2UT
         3wgBFWckctcn4iCS+QAlT7K8BAeLgaWXVQMTVJnyCQRH5cA/GkP5u5zP+UgFrI6oK4ph
         buLBP/6mNrXDUHP24p4mfjzUMt+Pi43boGZ2G+gSZNe30iR5iqSstC04cOuRmSFljG9R
         CK9FAQ5GtWylBdfTpIrq2EV0Ux2vq6s6PDVgW6tCZTFKOWGTURkO5N5hxjCn05Rw8mbX
         GKDiOFyPoZwHVRGZKIagz+a/5M2MtdWBh7IV9k02z9YPQpanxbKAw5rptjEtuJo9ArKH
         KRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080646; x=1790685446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=1udsWWHvTDl+eq+mvDSmAbGBTFzrAaZzGurnlC/jP9y1781ORF/mFFCxL/kJLO3dby
         xNSKDsAP2WPXQj2grliDqq7+xoS0vgzPxYf6EP15vxz7vDMJ93GK+vslxq0tM/O7BRig
         SSxsLn/IYlJGgQbOQbIohN/rw0uIQO/WFTcB6vXKr5l4BVPk95Ili82iUIZjswu/wEaY
         ODufV0AtABPml4fpdQZAaCIu9xLtg4iRwcFe8I1PsyyWocQ0QR30fXbZ5P72TK3SIckR
         TdqYL5M75tNAvfZZAp0KoiOFvv2aW8qRzSdScEHZpIxkhSmBp775lbIoZZtmJDt6W0Te
         AiJw==
X-Forwarded-Encrypted: i=1; AKwUvBx7IU10jMg01yNaLkMUrvidI/Q6Lx/0dG6Z+XOm2xBdI/2ovBCWFOvfwxFbDhJaBDXfnMXxtOYdVax4@vger.kernel.org
X-Gm-Message-State: AFuF++knydb7M4kTyASfmTcgSZwNHYqg4weSOirl7Xxv+E0W75ruIpEl
	nHLDbKl220+PD4khzV0TQyxz6hp5tIPeIv9Sn8zUu088pwFnMU3VJnB6KfZ1hQ==
X-Gm-Gg: AYBFou3uck6h9NyPje5KF0Ncuz7WMEM9jzERtJPnc/RDQwEBGu+aeS8/IESwHPNo5ah
	63AEv32GNG0avumcdHtj6Wx/7Atdg1yRKOUHkfMA/8sZE8SzY/Dzx+WaarPHhJnhLLmsEnSHBM9
	WPJxhzR9DQVa0BsMMVrE7Tbj3MWF9r1VOuggwOrJeB0CBeecG/MLmnG9SvlWRuHAFWDqxsMIzfu
	pDUh+UkD8fZQA8q7Wwu705mALLx2lTk0q3iLf+zhaVn0EfPYSjSnKmsgHg/JZIMLf4VcIFVc3/l
	dUrgx7ALrc4Bc0FINoyCfsKTDa941itmNyI0PTupgJR1NvW3ZHPuZ0DLO8b3HNrwXSDTNw+6aSU
	oDiVp4rBuNlKrbL7TLpeJAEvwQdbXqLvGESCLxs4aw3m+x4DHTH/Z7D89/MMguAp6+h7rNc1bS3
	IyJhB5/WSbcGGIs8oBLPxR8cIxUZyz4Nw37k8mV9tKee7DMZwc+LwBh7RxlBs2hiUzxeCKYePdk
	jSoeEmwU6Umy2jQ
X-Received: by 2002:a17:90b:1fcd:b0:39f:d323:c988 with SMTP id 98e67ed59e1d1-3a073241ff2mr1206949a91.48.1790080645673;
        Tue, 22 Sep 2026 05:37:25 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:25 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 22 Sep 2026 18:04:59 +0530
Message-ID: <017f5ab1176b12a9d56cbc060f3ccc1d6ce8332e.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

