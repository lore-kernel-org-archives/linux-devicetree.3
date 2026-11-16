Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867991;
	b=1ceim+tA4/aq/hg/n2guPXOU10s43IwzqT82bX4B1Pk7ggm8uzg+MS+uigPLb5CsGP1d
	 cVgaeVjS6f4bw2zB0/7saaIFmGw513bD4RZQMFbI3S07qE1QVr9gg7F97Hth1J0fk+/5c
	 dguFP6+z7fy0CmEXDbF+DdU76EVg8uia/xesXlai+BhwjIQDj4/8smpmcqxLoGmS5vL2y
	 MS5DAnXVcpxXA2G/YTv0LO3MOAEQQOEiUg7keEMmrRlJnGyazrotrfRwG7lpLoi3ni/r9
	 AjIdpxead6eXfHhS46eXG9U0kkZ+rvRMgkvGAVf38v5HkGN9HF+EOi5daAS3WqPBasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867991;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
	b=G0k4IXZcXAXgapQyd8InbhCsO7K6/b3fSoKDWgV7e4/zles/J5LCcVTdEehcBIr4Eacs
	 lEpIgDZYaRppfAcXEcryNGCA2iuj8Gsn5avJsrzzk5pG3TwXONTKYIfXw3mOlfvOhBxc6
	 03y3Tw4MGgftHAzc6H28vZxfWhQur/P5M5QFAVJ8s6Njs8hgjAM6ofCoLmDu+5KK/cfGx
	 uXuNMsNBuFUwmlyZ+owzzitay38D9j4o94mULddZqRYndxX/JQ3nV4HGKHtcbOV4wkiu8
	 1SMCZaSHMMpCYn5AhIr31cHHnX4c4RLDQ8XEmEsa4AMBoeyx4z4RViOEWU41XpfCJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B7606A881
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043B7606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1661705a12.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867990; x=1795472790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=M1SVWpjoQi+T+qsd3AsuMlsLEETT/9O6eHxIKK3CAzd5lnb4hU/YkFfakBY1SnZURW
         XXmlX/7MZEme2EnnI1MfQcp2O+EA3999SLUNqAwG3Ke9qzaTaVRidsW7TslqqyX7Zm7U
         EnZaNWsjiVKEEn65+tKo1jAnxGIZA/8X/sG1Qi4qOePE4jMwcpqQYRebhDE7aDyM9Dg4
         dWG+DSLzqS0zKvBmjxjPRAkYj1yQSKVTncM1EBF9wRtHw7VSknTJadynIXELY4s+d4f/
         bbNZDKXez3yHyYZ1KCDfLf6hh/d67GAaCaS+3SwOTNtK7rNNY3gQ5YkhHtn7gQpCbyh0
         bEkg==
X-Forwarded-Encrypted: i=1; AL+hErEFjnd00thFmlEqiT0zWyaIxzJpSrjttRcgSCdYx9nbADF2HB5GaUr+gOkctUWJXYsKjhnvayoqQQFu@vger.kernel.org
X-Gm-Message-State: APuU4Z/fEnCSla7ULCjHiXZlYVIvksi262Q2ZVF/ZDKeA4ahCOI0SxfW
	j6tNw0YEppfoR0Iv6YsdKpEUar0hyVDunYXWVEXTpHmHaf24q2b38bfK6f8qa7MtEmjjl6v0+cy
	gOxyUc5DfHxiNilIKqtM7OGUrURo9tuj+biOBGIS7cJWoJPeSiXSTSRu5wyIw46FKPvVixssxws
	kIIxVUnGGmYxd4hiPNcw+9SbiJsQFxmBlq/Yu2W0fjETNHlw3HxQX4Yg0TRfpq9eyWOKRV1kpaq
	mgJwX1X1g+wkxe6XCOFvA==
X-Gm-Gg: AZFdTZf85KR7zKVfo5CnTUs1aMQTEFGpqQZgoe1pgKOUl3T+qfz7LBamj5B4IjXVTlu
	Qjucd7M3bdHUII6whOd3rginkh7DwRJs7y2nJTRmVQY/VKLiW5qL2Qg8WRYFjLDNc5KH6yKW5IP
	soPXjUz8IGzQj1rRzXSoDxmb9+rhz0M9BiHc2rN7Mc/PyK2V0N65ooD66DdWpsuKWHckPm+EUxo
	tKNmYCq2Z2VNVVuMZeNzcvpZzvCf/Vt2ORKZBLQ+4OhYknYlWHl3TnYmPOKKY7ZvIs5ZnoWahq/
	WPdHVgU8oFp9shmuFivCucuLbrG4pN8syKUteQ1AXzkEAwaDPVxJSBh0DyNdDSvvY9jeBKzmbQi
	B1AYFQ7xqb7zceVzD3caPDTMlHHDKH2ecFlO8KB7F9jawzHQ1aQqVNlsiGU/hgOO65RCs5dOubQ
	NznPMdCXfQcfCcV07BuX0cxlgl5PeyF2UKJFxe/bwh
X-Received: by 2002:a17:90b:4e8f:b0:3b3:a982:6e0d with SMTP id 98e67ed59e1d1-3b3a9826eecmr1032847a91.61.1794867990146;
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceecbasm463288a91.3.2026.11.16.14.26.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so3533211c88.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867988; x=1795472788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=ZXVYLoBeyjKuwDQQHfurKC/93+dEugF/FYFfNiIwPyyiWcQZ3lc4Z49np2Y8lLqFJa
         x14+TMrqyNZ6Ljz0yqlI39wpihU5gR1eq+/T7ksrIVVe+S6b2fKwf17Df5d8L9tmqYPA
         sJZUfmYkx53VWsG9RFS0ITZvAs3EWrL8Y36nE=
X-Forwarded-Encrypted: i=1; AL+hErG3YrGHpSsNQeR0CaANaNCALRv4gbYLeBQ9KO3hHnQ54NVe09HhZL4uKO9Vh2ELFGRtF2aVFF/+9bR2@vger.kernel.org
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964758c88.9.1794867988114;
        Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964713c88.9.1794867987246;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 2/9] netfilter: flowtable: reject non-host IPv4 packets before lookup
Date: Mon, 16 Nov 2026 14:25:12 -0800
Message-ID: <20261116222519.1416501-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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

The IPv4 forwarding path rejects frames whose packet type is not
PACKET_HOST, but an installed flowtable tuple bypasses that check. A
packet addressed to an unrelated, broadcast or multicast destination MAC
can therefore be forwarded if its IPv4 transport tuple matches a flow.

Return to the normal stack before the flow lookup for non-host packets.
This preserves the IPv4 input path's forwarding decision.

Reproduced on BCM53012 using an active UDP NAT tuple: classic forwarding
dropped the unrelated unicast destination MAC while software flowtable
forwarding transmitted it. Boundary tests cover TCP/UDP, both NAT
initiators and unicast, broadcast and multicast MACs.

Implementation, tests and changelog prepared with OpenAI Codex assistance.

Fixes: 97add9f0d66d ("netfilter: flow table support for IPv4")

Signed-off-by: FLorian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_ip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 19cafae748ab..98bade1b8299 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -911,6 +911,10 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 	};
 	int ret;
 
+	/* The ingress hook runs before IPv4 rejects non-host Ethernet frames. */
+	if (unlikely(skb->pkt_type != PACKET_HOST))
+		return NF_ACCEPT;
+
 	if (!nf_flow_skb_encap_protocol(&ctx, skb))
 		return NF_ACCEPT;
 
-- 
2.53.0

