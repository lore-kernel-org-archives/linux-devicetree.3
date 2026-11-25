Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630864;
	b=0fGtUS36IWoNuU5aeQIWL9tTB3unaGlIJZ1Lyba0PHdGrjSSutQ0XN7pW+IqbStI9vn4
	 WTjOhSHKf5H52oH3fKQBXW34VUy/toX70ck13mNzjWfPrNNA1P3iAATeOl7L9HxvNmKGt
	 WDN//aYXVyFZjA71gWc+hTYy65QxHXYUT/IG9kMHyngY6X9WHUbwUgYXSzycwwqZQ8nQG
	 owlPyx7p+38p0cwaALpQfrU5nIBiPiJ/FjBbimIGx4UWqNn+NF02y71CY83In3NR78EX4
	 2gy2RuPfrd9BgZO43otfyMfncGWMWsO8LC5mYW4kXcIGtfWbrHMHh1RPZ38u4jJmUcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630864;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
	b=LDCfLphxFZEnrrqV0NJzJFg6guS9gvURM0SQhhEICQfwcAOAMD1uNaR574eQHuwZWi8W
	 XQdRV9DAsJy6unZHKnRz4jpKkbnhZomluQa4CPqWztHb0eSbZ0pLqVZg9VwmRdPcWC8fr
	 T0D16E85mjMo9bBfupJixGosopZ780AgGFJmfh+YJNm6kLchnEIV4MH1y6UgoKo2BYIYG
	 SOQqSU0hxNq/mDoFK+Dh1jF+yBf58pKa83YmYfdJU9rojyryOmuwFlBouZC8Y/9nL6OsL
	 62vxCNRfI0YschVGsa9rIC67PxynGYLu4BF8nUyvi7R0CkIIQKvZqLngRIOU+tDb8ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Rf9p/iyJ";
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3B606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C3B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Rf9p/iyJ
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso3486476eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630863; x=1796235663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=Q4K4fmXdeCTtGGraTmb2r7elYGZqey6HVTgBfEY6AKt/q+29d9ZoX8wKBp7clNiVw3
         Oj500hb8f/XEIiDzljp+sPbblZdBr9RJFlFawJhx5Dz3gqF4SBgNlpQElYGV9xO+uIGR
         vXapLhPgRaC7ImIpAd9cdCrz5BHi1f+e2j+rkHZ2SOUrVODkbgL3lUb1IbXnifBroT8P
         M0QKbkJQNF+/RQzbRvkw2ad4Vz/zFcgHh4t/dUv8TaC3q2BWEpME8Zdjz+9pUnJETRGq
         D/MN6Va2ZO3neMh2nOjKkiFI/8IKiBVWPRMt5Qoj1SiugOvGSBF/vXgKDypb/Fl1I+Fw
         LTxw==
X-Forwarded-Encrypted: i=1; AL+hErH1qfWPmiK+3OFOvnxopE4dzoKqhnKwNxMoRVnpUlBAIHJ3Oo+dypmfK8wPs/lDDHFlETMotYAS2/Py@vger.kernel.org
X-Gm-Message-State: APuU4Z9zPKM0xtp+0M0EJW4lQIeSt9eE9/bm9/xB3Yw99QPAOWmAz8j2
	iSMOAtBkkUyMT2HYsQzw7s3ydy47MBV5y3e/KvHH8NrOiM7XDZCdaNf9TiC3C1em//IwsL4gfLk
	XVvSC+E6+qsvTnSQK91Gdwy/LZlx5i1q9gkguUrs+M74WcJwhRAS/hoZZQBgp2ONK66uSIGyyYe
	4ClwuhM5nOsVnJ5eJpbMYY7kI+hgGvwDcpOAIjc8NvDQjolBrLL/qMA+Ex3V7qxDRNCeWE3K8t0
	ZdPXvVzx+2VRw==
X-Gm-Gg: AZFdTZelE5LuBSg1D74fs+iUTWNWo/57/V9isTzI2qYnWbGVCCHgDvTg8HFNoXmcbNG
	cy62EHjj6GFBRA7B+S45xJ+WZWGgG2yPxr5OVdu6ouMEBnWkOY9lT04Q2T+9SYbQ59OSJ/BRifJ
	GQVIJwtJkhcQbNJxctNaFKMe/vGuko9ONt9uHkbQS0jSDwS9moknJW6dnkRj++b86wsoVut2NGa
	Oje/k4gXBxrso2sjbPgOuu3fXLWoTKUuSTq0yqxq4w42ISMErjA351m/pQF18eTqinFhCia2E3C
	njz8VD8hbH+9Hs64vMbu/Uxi4u5OjL0mnuzMmYu+TQ7cmddHMXDlzeBWegwnPwQNv4SPJbuErba
	G5tBAEFZrNrmLDRzgyN90bcwNjNDeFmaNwkK6Olo/VF1F6+abB1/59AAkDuO1lekn9mbbZgl5nO
	bV/X1MasK6vdEc7/3Hv+UstuenG6BbS7MV
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id 5a478bee46e88-385cf429dcfmr18681319eec.34.1795630862478;
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385af7bda10sm2734729eec.8.2026.11.25.10.21.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92109408212so123620296d6.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630861; x=1796235661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxDwlowRXj+Slu4vqivQluXlihnRgzelIMa72vyyFyg=;
        b=Rf9p/iyJ1C28/hw3Kfubns0Cj2vLebrtpiNw3JHIKxX+JV4+3uGdJp8dUgbBoLTh2D
         Sq6hQxM7PO2t1FittueI2QHLktlSqxSSuJYZKS9v0Urg1YeDvTiytyiY9GJuvX+0RgOj
         6Vyaf4j1J+iph2jS8XPiUhZxVBlP0vkzk/Hjs=
X-Forwarded-Encrypted: i=1; AL+hErHPEI+vAgumE0npouS6ktWswu3PSIxF8GbHtzE2JPX0COL4zcX7p3TcY/1I8zYJkovUe3AmtuvsSC0x@vger.kernel.org
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id af79cd13be357-949ba823b70mr3245214885a.1.1795630861246;
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:949:7792:1106 with SMTP id af79cd13be357-949ba823b70mr3245205985a.1.1795630860597;
        Wed, 25 Nov 2026 10:21:00 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:00 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Wed, 25 Nov 2026 13:20:48 -0500
Message-Id: <20261125182053.3915833-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
