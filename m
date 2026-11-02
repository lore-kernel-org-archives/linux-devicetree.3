Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638231;
	b=zuaEUf9ROVpBWVIyM+APHo/kPdXFsLlohI35JWUW4Tn+Ota+aahFINjmou6UHVl6Ty4K
	 JMItQ1elYIESThfrjAql+ZbNPImTzw2bJp0B2a7YrJdDnPbqQ/KVKUdz+KEHUAnKFjm5e
	 k+UCSxOV0KrDL1OOEs+Kauo73ZwvQSLr3sOW6d1C06AQxvEIFzNVDSJdx9mkMuQsFE482
	 1qyycZOyG5DF3yeTmXb+fhKN83a+sCK7q8BC+B+6Qj5U7FXUj+drqt/fzg3E/qXczbruM
	 tgbAau/HxcmjIVe/YsnVHfZ1bKpudLF/PTcgcWGun1ODkGilrFmGda9dAgHouMZKsLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
	b=rqfiduGaCQLAF1OXpvxtlISeWHvApaAPb8gfyfi56KNJ7DVUeaTyAl9HE85gNp73DX39
	 wiw1/6affyEXM0KVghLDbuG35CC+rwo1OdFZcLJaAZjl0aMoM3tnES4jkZNqaT7TYQvHb
	 dgBunFh2JrTUBU3mxjryrj/d3PZO/rTaHNZrAInqoRAJk9w2e90xYEQMqnGetp4vpHYC3
	 0D813Fv+RElPnqBAljL5ZnyiJZ6L+ofAgKGzBQ4YDjkejUVkk9E0HNRKbyewslxs/QuTc
	 gv+E+3wzwsy6TpF5DqCrNoV4oklsMu6FJdoMqbV7uG+8m4GnzFD3wUWl8MgZV2yaAwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0v6Qu6l;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811416074642
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811416074642
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0v6Qu6l
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so1646871a34.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638229; x=1794243029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=c0v6Qu6lGqB/NueLXwCJ0MbujVdcNa7sv9DyU6myuKFeILKR0PllAb1Sq8tx/QGgA+
         NfzxVnnoiyT5gmxc7CfnMxcRZR2u99gOm4l2mYFJFeqYNSQGiWexUrEDEz8OGEdkpXEq
         ZoKErvxvBrvSxkn7YsEsokpzcg+042WJRx5YAGJQrWn6bV+KvOgC4EVVfOPUiNUYc6Bn
         LukM0cKT66JMYkHQAqA9257BWRnPtp7rbFFfCjFLYmLDVNf/OvNV+iWIk1yUEbFUzQ6G
         DWK0oYFpNaRxMasT0Sevyqmmos593gnGO/7WPzOq44iH4+Mu/XlUFqRryRkhIdQ70iQo
         R1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638229; x=1794243029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=1xXk2Ai8bJG9dm1ndxPnusiCArDit/kqTNm3vAvHDWDxZFssyzqVOOhnPAX/iTL2p9
         GojFUEN8PpzC5dqp95oCqM6Q4qh5Ka1Jv2DcySMdQKUmemPSQuVUA9e7i2brIBupf0AK
         oT5TTPx9g9tzkdkDtGqcvfouqyy5qssdmQsdUjmPu0d0ZhvRHj6y/YpTQ9O00YLv2veP
         kKc6q2Lw7IGPtjGLYZM4gD/zX7yMTxC/qakqvD3nx8JbLrMHjvd9gymKf4CR7qHkd3Fw
         31VNWJlL9H6Vh90PSuBmJ7jY7OWiLUlHl4MqZhCVi2rE2+pTQPHLtp9lPg9cW5kJ3uez
         7HNw==
X-Forwarded-Encrypted: i=1; AKwUvBxVY+O4Wh5jNPVT0oPCrQ3bPQpyFnRPVLXrzxBg/3Z3/q0EHyk6oX5Ipqw+pfZy9i9aoZaR5122xjUw@vger.kernel.org
X-Gm-Message-State: AFq9FYIVDcHfgKvv/xhzyA6uGVp4WsQMRQ+6ZHJU6ih0mDTtR2natkf1
	2VXKkk8lHyH7uKz+W5X/t7gt9eQdaFPo7IMWhNXOQRAe1r+6i2ieLof1
X-Gm-Gg: AYBFou1cgYvpSHYx8b0kL3rXfcNleUof7yQf/KwXTHb8P/O7fihoYW1EhERcHw7mZ03
	EFImmoafewW9Jv9ffXsttUUQLE2h4SAStsh74HdEDixbJ0I8QriywPEct566H0xFJ3CFCsg2urz
	c6bnU1wI8a49X2Cropa+D0vcNDuo4Fpwv4sKW18gN29n2yM4Y/zVsZQVYv/x8hLDy4swwaj9eda
	TLz47gLtkBCp2h9hRv4z1WAy+ltGBLGIkoXK95zVSz1FdJNMdqqTlWNn1zmww1vmWAOjBIv46BA
	wob+06acGa55PlmnHtGd+C7/MmjkKoQHGGrDe+f2p3EIUGZOo56aPQFkFuc6kBRBpGjHaZhdHr5
	b7tu71ai690eEHQUYwnuPZgPq12YejeViTZAElxaldSSgEGjLw9R7uKhIQ/qAvUyLSiI70m4vPl
	hkbj5w4rI7qLgDfedfmqG53IJx7fog+Y2Kzvl6IpWPLP4MLNlZqV6gpQYFzwxJHRWHtzxcBiTfA
	8kQ4zLjIqzL9DeLRhG05fTrMz5dgHhUTCluB40N8H73SN6iDDkrpe8gFrS0NIwuEO+q9ioAdmcL
	M7M1K3gMzyQtF5NJfCLnW0qgZtS09o88wbUxAeZFNqBZBrknp3vQKH0YCAkciBcpMEyryhaqBb+
	MWQI3Xae+nE5WxkoFqcQ=
X-Received: by 2002:a05:6830:4487:b0:843:b6f8:de3f with SMTP id 46e09a7af769-85d365529d5mr7247305a34.18.1793638229426;
        Mon, 02 Nov 2026 08:50:29 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:28 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:21 -0600
Subject: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's 32 kHz output
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-1-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=1237;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3CyHV7hxEQyK84ACcArH+5qoJrY2fIpfuKy4fIAGdtU=;
 b=0Wf1b+8NmB4OEOpczcJRUHMeGyBxsbhLHqpUCilWHGZgwVqtkqscNpMc02ashPTcWUbtr4lgH
 WpE9hQMgNpfD6tqblyH80VYcqOYLALDE/Fh5XCg6akXUTVKecaowEVt
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0

