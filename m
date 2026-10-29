Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262367;
	b=KDGXpIIoIcRQpPaGTQnVD8505mafLIzUV2JJkPWYzlieiElmtoGyTbpELANFWCQ4agPA
	 ED5UFm+rzbyb38pIVtDfcxFmo8U1qOT6ap/S47tgU50Ckkh1Isja+vb57QtnlrLaLpMxK
	 acMgMjEFCYAh0xsmQdkx9oVyZ3Ll+YxPYPGGV5w9OQD+Y6vyP3uMKgc2viMyofQY7IRQe
	 U3cv3UVSC/gDgimsMvg5vJItHLPZUALgx5PpzLfS88CHHXaWxMEWjMsy1lZide4FbDFdI
	 DHxDbIEcRAUS+NYIrYJB3HOmYCGlTzEjFlMBswZWENK2cWGDcpJ0JQFQupWjkZhhYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
	b=hPvwF7fs643nxaYpXUfItv+/PPeu6Qo/9xZ3YahZ6U8AEPzxPjoKMipwCSUH5gE7+rFz
	 T23/QU20S4ebAok0+zIbqMYQPIPXyJk77WXRKOT6aLORA6sBx4FvBOdWGK7Q4ETkjf8KF
	 IwFuzQZJT6weTSPGNLMSem9boJ6iUYsWrO3wAg71qaafy4AbvweU4W/33VKYsslc4HhnO
	 2FzAr7LalhoWIwdjekh1/muZZ64PKLiav7Eap8YMnUesRWm1gVY1ViJSN+P711tfxq+bI
	 l8h3g5kfAJVtvkWxfdYZEysgozC4tjU8FmTQF3yZ/EreKeiNgcxyimIInXk9rdDLTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKd5sIYI;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C054606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C054606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKd5sIYI
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so5444465ad.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262367; x=1793867167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
        b=PKd5sIYIRx7xlGFCaBUh82PNHaJUss05t+o73G1nEuehVRQ3xFK07lfDrx8RTEf1/6
         hjPHuew/+YKBs15zIORKdfjtpMfeaHsuD41javufFdCGF6JVMQtmwIEtg5vVh1mdUXvN
         n9MB42NysuKulvdSk3MD+N9YVz7pXLbv5xufDap3tjjtVyxFb5kUAL4MT8zNqcfj2sKp
         984s/GXG15mFqWEFGTLj4bBVjwiLE9rlwBTN5XNmCLC1Lf8T+vJA11DKZp/9H4Op23Ob
         oqEHsa1w27MxpGTiHY/Ezn5P/4gozVrChnlR3IfRnL4r4KGMvosgUWdAeHCzbeYqzrH+
         SwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262367; x=1793867167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
        b=OcnMWAKecYXTmdWE9ej4rdnfugapShC5gTO/geCAWnZN13/ilJLMmJ1uyqBwvAe7g4
         vCikHWTcJiAlLopYBjh37cxVHKjbv8G7BLXw1CQlmR8tEdhvKkEUpaEqrjv09SdGiSM9
         eY8sN44MRq+bdQ9knQ7pjyTxP481rk+FXw1+b5wjQI5xEjKBmjnHM4RhwG6A1TP2LOyp
         1ombX5/CTxIUkyeDFalcKkPdzkIFy+2xiVw73cr7RQ9dfUZmaxS0SFm4y79pABd+PYyd
         bYXSqqzJv8IVEZCn4haWq9k/hlf1OOkqBGlRPMzIUZ1v5aXLGgTt3ezoiapqV67g9CxX
         zCjQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5oQv+ENFBOMiqds/EDZE48pZlnzcr1VNTY9rfz0E4ZAMRBV5RtmyVgQkr5kwjE1Xf5eNNYf08PGTz@vger.kernel.org
X-Gm-Message-State: AFq9FYLOxW9sqdX6cD32/M0wP5/TxLTLgzXPRV6lEO8GrgWqdxeC91p8
	i0h0CNccR7lY2MWRFFXA1dCqKYvIdmPUsj/sMxWnu8DjRvCBAGU0WAh2
X-Gm-Gg: AYBFou19zDgEXk7mXXhJQJvE/9WPcu8u9ObqHpOetXqTqmRVDztPQwc6fKTytgg6qRy
	T8paDXkt5USn2SoSVT9f3JAPLQmbXZEgt4NULx95a4ARCuZDzUXFIAbZbC5ixqkUDMbi0pR6EXD
	6e2/OzjuyqcGsNITINjO74kKchsKsci5LfHa6MbHSIfSc6HDwaNPXYpcqTCmC9cjnJwk0CaS5vj
	MvWwmvVeSqcr88QSuHcQtP2kaHKtkpJljuSo7wUSzArSKAzfYfLg6qTqXkU0FA97XLc+Ogw8R6s
	ryKzdkMPpHx9FufxSwCfw1sDkrtkNimUgrsT3zRbdQRbLO2L3Q7p1hoZFLZAiwhWRK3Kj748YT8
	LACVX7xTUI4hfkEZxTlhvA9C+Z1wS9UYHytt0vuAgR0NNoqutCX2hEIR2D2nzUdkxdkzDVOBi8s
	YVjGyD4uJLAWMnf2Pa+ogYEKWKsYIgLbetEkBJGw5EM0gbSe9wuawSExjBZQ4g1Uc7jkir9jzBP
	dvi/8yph5S9gqJQoZlcxkOlfwaU/LBSPx+9WG6EzvH5oCDlaJ93y9muvUmZO68NZswxDCjdxzTT
	U9y/GTMNY4wfV2BPB+ei3oCAD3rQT2ao
X-Received: by 2002:a17:902:fc87:b0:2e9:6468:1ff1 with SMTP id d9443c01a7336-2eb0052ce41mr73031425ad.2.1793262366708;
        Thu, 29 Oct 2026 01:26:06 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:26:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Thu, 29 Oct 2026 16:25:20 +0800
Message-ID: <20261029082541.469999-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
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

ArmSoM purchased the CoolPi 4B hardware design from CoolPi and confirmed
that the Sige7s uses it without hardware modifications.

Document armsom,sige7s with coolpi,pi-4b as a fallback to reflect this
hardware compatibility. Keep a distinct board compatible so that the
rebranded product can be identified as an ArmSoM Sige7s.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Clarify that ArmSoM acquired the design without hardware modifications.
- Explain why a distinct board compatible is retained.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..1b905a7af8009 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -99,6 +99,12 @@ properties:
           - const: armsom,sige7
           - const: rockchip,rk3588
 
+      - description: ArmSoM Sige7s board
+        items:
+          - const: armsom,sige7s
+          - const: coolpi,pi-4b
+          - const: rockchip,rk3588s
+
       - description: ArmSoM LM7 SoM
         items:
           - enum:
-- 
2.47.3

