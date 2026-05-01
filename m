Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151837648D
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629473; cv=none; b=Xc3+KeODIeekHbPJyhwb2QE+PRa2dEB1M7zJo6Mmj0u6ZxgM3FKK5Q64AEQ25QSd7KxFd83HEsVLHsQ7uvIhs/nsL/q47NzDdZZT3hP2YzIsOkUCRccbbcNssLSdmejs5VCWbghTA4h03lvrpD56zFWijldQV7yFHr84nX5ygEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629473; c=relaxed/simple;
	bh=u0+cl5+Er6WaymYzamEFJC39ZKeWrnJt8oCo63e9YIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bu0hk78jhTVtb1S5io/pA8utwAhWvx4gHyQcFxjH1ZLnxOf2GKqJbu4oF7gnttLH4yqZr546Mn91Awu92WvJvG3Gso6IugfUryA3tmM61qctaseumI5P00bJaKJ96s5t5IpgTqZiHl8nCuiQpEjO6hZW5st47RCP6nwFYryZnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG6Ce19Q; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG6Ce19Q"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-827270d50d4so1732482b3a.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629469; x=1778234269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=LG6Ce19QKUjyUE7KNfuoAZrL7Ob4MIFnreDowrGA8I8t1L9zt6D0ieahInWDOdZWXn
         jEH0Rij6oVCip3U1KSQM4IZoATJBd4N0r7bdqJZOOvoEsWUpRxEGBmEnR9EfdokC4eLh
         CfVpb+lbG9Xwn5JmZGTK0obviVZ5CG17s2J+arAKYk0Rn3owGQ1fE7BBQSEmMDfeAD7L
         mp99mi/Jwv80c00t5YQAuQpA7CqYZzsjFUGT3/rIO5lROmDLRPHGzRpNbpZhSEhT0+wT
         TwT/f0RpFKEwB0N0vEM6K8W0oePVgC22Kes2XNsPescpVcagV/iccJHRkxp33DqWjQlU
         tdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629469; x=1778234269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=e7Tc3uHLWzfosxdbrxl1j2E/rBcOMs0QiU2CjrCjwoICyaiN+Bt5Nhz3aujozDlzw5
         1TlJnJ8lMsOIrpzqDmtS7mi8e1ozSPYJJi1/azJyRNQdZcK/1vZ1G6eRyjzVyHgarUIf
         pLkKrSNPzgHGAg6c6xNaA9+Ss735WA9yae53Or+ausZJ0RODm7zRLQpti1wvyFtx56UQ
         W2+A8CSiQVhNCpI1A2sapjwW+iiLGToYoU4AzXv7QwvkGPDKkHnMYrhlaUettkEEeA5g
         dHVfDJ7UvRkprynN5gDmufM3gtF5F7Ml7XSVouQnzDSnDPIZCqoX9dIqjyyg3ZtD17Js
         Q9dA==
X-Gm-Message-State: AOJu0YxAiKN22jt7kDwGcvf2zi9GcBHznj4HjGxu5Rme0bGNjmqUYjad
	EjGCSwkWnYM5QcyASArEwkbc31l2n9NECcgVYPcna813CVLZd3iOWv+E
X-Gm-Gg: AeBDievtKsjLVpn4weyuE3z1OR5oAlsFGd4eBgwXhbY6Yi496ylpp+iCIFK1EprYUgB
	PUxBtgNdEUtiIjiE3rMph5QY3M3pkaxNYnrRFQPPyBiiQ+enYUGongsSvLFuAG1UWOe060/nCkv
	bdGMRkAfJ0A6lQRAX5+De7L0viZ58ndDdgYinXsNYlQF7XCXZkGmejjCid6nHpS3puBjUGgG+yy
	Njd9skDFWmv9s6CIGbCHG0uWXZJBmYmVJ4Ohw4US7jC/mxqVxbbuDtGgDlxfzworueG80JfhW8Y
	gCHlZpaAT4d16l1JdRNQxUtWiQc6rY83RDB8Hbh9C9dkJytSSoz6D43eaMcTll+JIqDM+IoaepW
	gHBPGB4HRJVOBHtaOuC8wGModB+9yh7VFz4AjuaV1mWRYAi+jb7vi2LucZZzKSkpjAUiwdAIZd7
	tbnCG0XwHroEq08w==
X-Received: by 2002:a05:6a20:258e:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a3cf8d8f18mr8009215637.48.1777629469654;
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Fri,  1 May 2026 17:54:33 +0800
Message-ID: <20260501095433.1609309-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

for the detail, please check PATCH 2/4.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0

