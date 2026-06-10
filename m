Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633B31195B;
	Wed, 10 Jun 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101262; cv=none; b=YtXHl0PPyM/xt63ecgd7ttxjt5ehEiY0+UR4dEgxmz8TQjMEsqrOwOEFpzUCUkFdFmZyaKIoz/i6UCyo0dLLOyiKIcUzmPs+/g5c4glnraTQKiFZOvbC4j81rjZCa47g6uMbUzhfr1nYMpvWhRy+81r9U1yYgPb0yqeo3vZk138=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101262; c=relaxed/simple;
	bh=kXK/54ULP2Lb77CepgkuzvBpvSOu/WuOZfeeKMAjx18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGHCwcScUpkj/X42TBeLGYEXtgW13WzlkWSgi8BJkGHF7Ja+6B/AfxHoFEQRTa6AOjiOgOUvqZyl5k+DCwfl+9RYXa99SyvM75Sl2QIRx1xrFE7PJpnchKV9vmYtNi+pNRuWRQntR5o3jmcpz3iEveXG1bcFD/uQPYkBosdx9iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=LwR53l2D; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="LwR53l2D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JAu6Ul/ODruu5/T+1v02MmQ3DEE6tSOAxC8Avg98/e0=; b=LwR53l2DDl3h3OEjFM9fpyhnxm
	1oK7VV0Ebo8TIQxkNvtHSX7NNvmjLo6e2asN1SVlEBf5AFuGIvu9dpAet1GI+TxA+ovFes2kdRThR
	Md1M+VaMNG/5dJ6noMknnLV6BRAadvbDZNLxQbX+DpBqnMCEfK9jMRjdod58byutAwaw+3YnCqcKL
	gmrrd2RHGM/UveKXbnoREo74GY33lbBH5+2IaencvbRfjRQDNhAfTJiIWIVFkwGmaEUrQC0YNhAHE
	L/AB6lwhIo6eqbtoewFqwOwg0japnH+s9fdDtZnuhjQyPlEwmPYAkN2egOiVe9h+BpUgiQ6NRWL+W
	FRhksI/g==;
Received: from [81.57.40.39] (port=46646 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wXJSO-0000000Clj9-1VTA;
	Wed, 10 Jun 2026 15:59:00 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Wed, 10 Jun 2026 15:58:58 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add youyeetoo
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yy3588-board-v1-1-4bb7176b6826@superkali.me>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
In-Reply-To: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781099938; l=907;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=kXK/54ULP2Lb77CepgkuzvBpvSOu/WuOZfeeKMAjx18=;
 b=EkxE0T53cM7PeMOKfu+Ex9F8rM+N6uZvjL3ZF8/6lI2Ut3eYR/u8HPE6KRdqfpe0ijh1o+nay
 11kM96TfbqhCwbttEcAcdsv9tA6uaWJny2wG10paLkfDgjsx2Y6nI+V
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Youyeetoo is the single board computer brand of Hong Kong Cybodev
Tech Limited.

Link: https://www.youyeetoo.com
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66a..c0d05ba73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1915,6 +1915,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youyeetoo,.*":
+    description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
     description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
   "^ysoft,.*":

-- 
2.47.3

