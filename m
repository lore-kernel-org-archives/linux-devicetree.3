Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602660;
	b=G40waqEHflr4V0mzJFUJ1Bmib/Cw1NSmEidf28JT41m7kCjW9Q8/fFTu2j+UL++yRdZr
	 me4Ur6ZCvDBX2K6AVKRYAe2HrDAGcF/KJvoLUWwgAv+Qv3SON1+XwaZV4ciF+p3BQp+pJ
	 i6YYnvoY62FeY4GM5ndseUJSXfyt2jhzycEyzJe/WycP2H7iZDn9aXIAm4Iqi/wxzt2tX
	 MQHCPBKWFA2XdOGQFRDwu8RB8FW6Skd9Kqt4Wjaj4I8MVAzC1Hh4VxZ8zdzorTEL/EnId
	 bGbSNhyYEXJXjtQr8xYkjDGqr6f4hzWCqKCMgkXiXG9Pk1I3WmmEVmcPPj9WAwKOg5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
	b=OFfHcxKvy0TvkxFbxQ0jHP909WOvYL6rWbTztXZiQhJSHnrZGYuDJKhIqnTXEhd7IFKP
	 EJtlOk6E2FV29ekkGPEZKiBZppxx9q5N2+pI01MFQGz3P+4PvstgIyU9R1UO5/Lj36S4d
	 m3mcgDpVlVlAwrjwOFYF1/nCFwdYhPxwTBh311wj+vMEHnA36A349PGAKXvEWwcfDw6Wk
	 7q967i4J7lBdZava4HMNrAbR0d8S+HvI1lY3oh2IX0Gg1fj4EohtrstQ4YKW59WYMEFjj
	 ALoo4JXgLN5AFr4h2px4LpWqjwivKLhcARL1KuFFLoRWs4lxiCFv8eDZvMq/0Nvq8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CokUmVL2;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8D6606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8D6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CokUmVL2
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f33df08eso5389826eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 22:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602658; x=1794207458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
        b=CokUmVL2PzuZXJGxdtpDuVAfNTae8U8yzYGTaulyg3Zk9l1dtyWX6N1HJvEMflOvgn
         4vTDYSQCFLsnz67zSOcl5NTwAImgCL9zr0z6ttuQME2b7ZqSLm5GjRN6bwys1Zd6vaLN
         +Omwm05TDvlft8PzoJV8lrHdNo+KjhcrBIDCBzVrGZTWRuP5F6uV5Ie7iISUkmwGh+wy
         BDhM3Nlz8oM2TSHgBGONRJx4P3OXYm7A4ux79Pg172VQCmBvm8ZL+w3rlUiEjkp+6PX6
         nlP02rayC5rAc8a/74FWDcc5xUU2Rnex+BgkzioT6TCQvBDTB6sub2RPYdu+IV/7TRhM
         6Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602658; x=1794207458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InjeEPoiqzWWb0EC4NwNZhboImYMUQzsTZQooCdaAQo=;
        b=ERyKozOgP7oByU394ks987W+Hm7zqFK5FqPTLiFb8CrlCG5IJ/Xij8Rg/ToNvzi/nu
         hOvi0aIGGv0zTw2/jPnbYsLlmWWAY1yX0I3IB4b2K9D1XZpSBBmw3JrwmDSEI6G9zY4H
         0gY+ldBGIlX1s6Cks88ATQi/JvMNSB9IxNON1LFjqJ3At0aqPT5BDDRRjxNsBJiQAfWi
         SsYNFy+SncvdD6tMQkUAXanzwS9XdVsAfhbJ/QTHmQUgB4THn53elO5DIQnmAiXkOKji
         bAv53CeLHM6JtS84J6qm05Ox3uvD+MQfW9s7XkFz6mmeTMc7UBWB3IiwOpdVnH87EEQJ
         ZWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4ZpkbgvmvIR+DVEnKJE7S1pQ1/Pv6svnHmnFOgnlvGOmFionMrYdvH5J6cmF8a3H/P8IPGjZTAnAo@vger.kernel.org
X-Gm-Message-State: APuU4Z/h0C34Rrao4xjioaGg/rqbWxzFlveVZj2HMPWEVl512TOIcSwy
	JRrmV1o+SVe0ijlWydAEjB8ZBBRI0J8qE3aa1fmf5iZVViOLcii/UOLH
X-Gm-Gg: AYBFou2e6KEa6SOv1aEnX2HJl4WQPE1iTFKy3y9ZoePRcYS10QqfgBqmU0+RAA1FSFB
	jAhAXwCmDn2ih4QEOxGu4K80ujaufXi32ZNgzAF/t2Vmw1gNnn64X4Epa8KaLThlKqu3BkG3Xdh
	T0XsdgiCCp5G05fS/ilvkOn2jvUtnmmbLm2YtRBkVuL5OA8nXIDJ1EZv7QljtbZfr9kY6X9YEvj
	4PMyo7yBy000NzfTnyZorhF05cN9QLS6Z+DGRYq510HijRwy5wrExxrPh+1xW8rbldzmbe4gW4v
	lYZpqOtMZ7/R2H6PJDa+e44Y5h6bJnAXj5MmjEBGq5bTChuT9QibC9GHByj1AMuNYNpihXB36jV
	XmNXi0R8LzEig3b9Sy8u8kxIwzD38upi8bO5+RIdySFX/wzwoJMzt8wpBWLwx8AbWfA3HkAy1Eo
	noEQWJRAddZb+VXDwOzGWmZ6qynBbKuCU/+vJxAvsJyCt6qwdqWMrGZphVgYMOqhU+W6qCeUToS
	v+ofVkuKIRvDcwsX3z5hf+3ajczw5BbTj52cgoBoa0CSFC80QkO/YnHkgm+RPSGUUayqaM2L9k7
	4nOhf7I91oYthzxhBRBOmaRzctgmH6fwKAjcJM1AoXg=
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr12431301eec.38.1793602657852;
        Sun, 01 Nov 2026 22:57:37 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm29169317eec.4.2026.11.01.22.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:57:37 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Mon,  2 Nov 2026 12:26:44 +0530
Message-Id: <20261102065645.121046-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102065645.121046-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
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

Add compatible strings for the ADLINK LEC-iMX95 module and its
I-Pi SMARC Plus carrier board.

This allows the board to be identified using the following
compatible strings:
"adlink,lec-imx95-ipi-smarc",
"adlink,lec-imx95",
"fsl,imx95".

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..1757ca4b0f44 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1636,6 +1636,12 @@ properties:
           - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
           - const: fsl,imx95
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.25.1

