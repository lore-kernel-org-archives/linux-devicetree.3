Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511976;
	b=MCEVPPRUm6Db3OtkfVfNYDg9iDwBzZeK1bEBE0yXfOazD1LbRJUD5xmcJDba9BB/hjis
	 X6VJg2BSv/pcP4feeWRcGWc9AvyDe8e90Att9kfQSrGRGp9ZrfH1ucx4sQ52VejcDvdgc
	 1xPgU3Myo7+/je3feSav3wC+dF8wukC6CtErglwJQS8iEQig2iV6XSQTl0mj/WnKAuhP7
	 ZzVSYkSSTDcYgN9KS1cSP59s0aKhTsBbzxLrI1gWYSJqzyV6vln++ShRzUOaj9J84X8Ch
	 ZahWEaOMmvhSu1HLaNvgZdSnIgK0Nr73LwHkBuoyaDYjsrTdHgXDGAxWjPLWoaW1KUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
	b=KhO1ys7KV9VlDNbcuiui3onSnwL9X96LBsCdMuQ8CWtZUJsfR3NDBnhEihio9cMQkgkL
	 C8L1+nA7sxmETQ12k2dCCzRGbtAL1YsVQ9t4lmmxS+kSDU1ai0YJlTEi3cCoZdmAeArSC
	 T6VktkLClsBwULRLM7/w3rYhrKm/kWcTCLqpcxf/OamNZCWCNFlHWKCP6hsSGK4R8IwcX
	 XyBLKsdOCnTeNgNZoA1VBwBtwbj4mrgAY2VAzoCQeWP49Kv/4M7zGvdyPzbYmMZBkI1M1
	 PSFDO0J5O35F6lVTgjAb8AuaZ3qC90OHdnqnM25MvIAVfMnzx5y7txvL9pBdwNzaGvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTkpkPeU;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF7606A880
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFF7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTkpkPeU
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-37198ed3727so1546435eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511975; x=1795116775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
        b=HTkpkPeUlYafXD9LQAkhIwrFERLVcjpR1F0zM7YZy20qARACQ5/DJlbJSqzNRe+WuY
         0krYA9XgsD7CvmRtA4khk3TcsBL1IcK768e8B9zLuqCfchIsdDWn9qr9I6c7QpOOuRIp
         hK3UQcAH9dozFXqYBm44inFlBaV0yroaNlkrV0lbKxZWZddqKcsaCWzihgmsJONyI722
         pIXLAiouVrczqHqS2Br24TjcP2LBaHn66Kv67Cn4lsGPs91wfJfNlPNSvrJzDgI+jICy
         SYIlANeiMeIFzfkaBLYQPN6nxTvMvXfAsAAK36UNUx/sdQmDN0xYNvH8G0EEUJAYDWXf
         qjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511975; x=1795116775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
        b=tW74egQuZDPKjOhf+rPBBYoDV8hKeHgleP1yplSkvGfGiapMTyHsSNpmfwVZ407uOd
         EnUfu/oDAodrBpyLqSQbu5RyOBhU83vqDwURBCCZaGko35YkxBSgToMmOa49fTXffkIo
         UnMcI9ixniZxIYC1gVrVnLlDpck5r70YDrmIMSqnkITPnMw5sRtucwQN0Slw7iIQnp7P
         AYtiXL71rawgq8h8jjrKME8HTCHoMMSF9bdjZ2mzvcwvuSJafVL19Ndk0tEHCXAWWQls
         CXML95fcIM8zdY9RrxTkzRTTEIXCH4BaNBP72EUKXQ6JEZqaVEuzUIB8oqrAQNdglBCn
         +4sQ==
X-Gm-Message-State: APuU4Z/9VnYN318NvkykJ+X7af8TtZMwmDltw2x1+Wk0MbxTOzuCewAO
	JcRBblZ7nMEDngEWg7P+1Bf2p0WibhEyujt2gl/EIH5F8jdB4Qm90PGD
X-Gm-Gg: AYBFou0e8rk996+O8kRllrVC2xL3DnRoo56POgZ6yyS7KbaPp/xbPdBkKdHdMVkCMc9
	e6cOJqNMDn0g7D+q/MMm0EcZAy3vEy476dFHn18LE7kpGv8Gep3mvCht3QLFhCFKsf6MsUvuajS
	AXHFKTYNKWaxqyt/falXdwYmJ68m+TagqGw1SxtAAC9qbTC8zcZvDAQooNtoUZjlZtTj12xOrse
	9oUBP+3aysGPrRlCUn92V6Pks7503AloXYWA5HKFNJvSknlppJgvcDH9WkTZv/60Jqmamf5ACCg
	pSCHZUKzthmJweK2ikEuucOEHfr8McFMIigDGIHB1cqPob7mdx7RdAzMPqJHShVHsCjZLFQBCFI
	TAo//rIeJhiUbwSoauEXAZNrSJQNbeCspjIuK2HaZdl8lTAPgVT1fGSJPEUkvNBSlmoRZak3kQ9
	+qGzJM/kwVTaGoVHyHfYRj/yqbOonOzrPH4oikEFMVZ2FggzDSDeSY2fLlI6xH/LBJiyMx2papT
	bprdHcmDRfkZWlYDfQ0aPV3qnsf/mFymZzG23wmjY1zE4KFoqgRQL7i7iPVNfKq18sFhrMNh529
	GRQwBmYiL3hNHEvddC1WbTO740EIjSpW3Fmyhbd28QVHbTySWZ6e8yEMpbwucKcMNvEriQw=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr4156057eec.25.1794511975341;
        Thu, 12 Nov 2026 11:32:55 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:54 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Fri, 13 Nov 2026 03:32:44 +0800
Message-ID: <20261112193245.250149-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
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

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..e3bd3d7660 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -34,6 +34,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0

