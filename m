Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768816;
	b=kvLJg+TDbDYvIEFXruAzVGy3liyBL39wTFbhEqJMa6Q0oMpOg1hnGIGKaiyMB2mcYiT6
	 tC9ZCNYJYc6kWSzv3IzyE/zAZdIvg9MwmWirqsPakD6pj7POAxDTBYaTWjXCgLsSuavLg
	 ofgb3aUcb2YI+lNL25bh/HJ+G2PI7FCCMzSHx4qOwcYceLOJFsxNLavrK88GAB95A560D
	 lW5mktsVOmJAPWNA3CA7IcpE6ZtDJVrVfkAJfYG1G7Rxa+9uQQO8CvnQCCnzts/zFl8cH
	 1hcVmdQY4F+2HBMY6i8hDvD1ESZUZ4PCHJ8zfEThzuvoyOC2UzXyafNHaljo71sqJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
	b=Wmmwq4Jn5px7y35ShNCoJ+rgqn3xVqz9rLlawVGMjpxfIB8bPG52savSpVB5ppxBE92J
	 a8T8l0dfqUbtjSblCAaI/gJCZSwufS0lIs//7uN1NoxG0nysHiXFT8o3FGwgO1xVQCOAj
	 KlWL8PrngBCSkzqHejVRe/M7j+dMHbNg7Czah58UzBJRPLEN9yDbg/q5+63suVckcANli
	 yYBtFLL9pJG6MZaT3fz2/1Ycansq5C6iObcSlxZFM9rBa59G3BCSyAfnK8IZzwvbKib0D
	 peoEWd3eptOf6/4XwvwsPJIffrM6PLgU6tunC907M2Dk42UNgiZjZlMQ/wMXv4PGkag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jdhlR+lA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A84606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jdhlR+lA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so6492105e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792768813; x=1793373613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
        b=jdhlR+lAO7IDozcJvsMqFxmnm5Kt2++1YaEJ8/YCU2ez/29XM72x5C+baH4L4ooaWc
         g9In6dGBnUFVkSvPwnJMyPuzEL8ZtoF5x6Njczf+b/EUnrjpV1Q/140BEchX45FuK5ed
         188b9CMM6T4Q3sv+XwUYm41vij4jDLKv8kqCqQTdQwvJ5EJvbpyrdXMp1g2DddzRpaB8
         cjqqe6Shxaag/YOpkdekQ+QU+7yEKkbC+6qhoIhjMNOu26Yz0GVDxLqyOZZUnjZCpbJ+
         NKJQUsPiMKBGtXD4CYveFWD88fiEKHzoqgMmqm6O/rkA1OU3QF1F4egrAPeXgHlcGBtn
         MOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768813; x=1793373613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
        b=qI5II4db/M7frQjAJuXXYe+6iMpBEGpS3PvgqMOXDTUFFaaBKSYFwWs5wf4VB/3HTs
         g94J7CmXILv5vFIHsTkqhPr8TDwHXEA1u0ORYblST/qydU6sRRguUel1SU+ngczLUBMP
         ginrlWhz1LV0oRjeW/S9YftUyjRl64baeAwCVe+aWbSXdeB0u2ZnhWonPJwrWUo8xcPz
         Wlpa4KI8dby7iMRPCGJkRRMlPuHUL18Y7HpzM+s5GhWRnQA+CCY3/esU6F4vpBea8I/X
         P8lde//woIkYlhZCSk2h1DhcZIxbne1+Hl72rfTwnneQXkyIP4ZVVIqZROeoq7vbN/9K
         9ouQ==
X-Forwarded-Encrypted: i=1; AKwUvByqKAN/GRxAairBzZ0XA5S4ygvE/mzxHlofXr8pb8fKSml2BcRl0yQdTRxROSJcrZwDEMj8e+TfnXLL@vger.kernel.org
X-Gm-Message-State: AFq9FYL8GeJLdBSV9IXc3txS1HZpMfWRvk9z9ZsHo4M9tpGMk28eb+WO
	mHSpQ7TSn15bq3Imh75eHUNATeRhL2wRJSJ77JFDcbG13kfQjz8uy6b8frZHPN7aesU=
X-Gm-Gg: AYBFou2BbZqZ4AnwmRo7o+zO0HwVVcVSJqubv6c8ctedKf82cyaGveauru6p4pp3L70
	sDjf+gAlry1qDr0odFfgFY1RG/muhQl7ltzsjqa2a/CN94xUPW+sVz7OiaHTLfSdh/tc5HWD7m0
	7kHuG63FWyv+JKqAOpV8z3+lUZnVRelFqIrdKTo2g3Spjje2q6P8ivFoACCqrhbv9DHNVuwnQ4x
	OCjNWoGdpYnKbk0yLClOSnxsmfEpkmF8bkYyKo4HYpll460cjSklub6OLMRrFLFBzO/utfj+Gq8
	OiQg59vHCcgHoVJLixolaU2Dswf1smn/YPpTuuUp6JNcjLdYqtzWpfnMgp8Yc4Nj/2izf1Wu1dH
	OZr3gUr1G9J+0c6dsCDSltE3GQjp/sZzISw/EBPUT2aXp84ow0y+4eFUfwitnGVc1EZQXX0dJp3
	V7vQiL1rFUeimmdptlZKgsv29Dm1W6lL01hUGXzE/7I4gaDpO2zMLr4ObY8BKffb8SVnSYCnyPi
	6XnrtY84TS8kDNZVBhssAogC5NL9aM9H8Y2Ku7TaxbfTjIiREx6GfjuhmGJ9DldvUPeb+JofbkM
	0Bgu1kjK5pI=
X-Received: by 2002:a05:600c:8b41:b0:4a1:e9c2:6c84 with SMTP id 5b1f17b1804b1-4a211efe1f2mr42623705e9.18.1792768813197;
        Fri, 23 Oct 2026 08:20:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm11683025e9.2.2026.10.23.08.20.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:20:12 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Fri, 23 Oct 2026 17:20:10 +0200
Message-ID: <20261023152011.85407-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's AIC is the X1000's, but its bit clock divider register
differs (see the next patch). Give it its own compatible, with no
fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2: none, resent with 2/2.

 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d15c000f14e1..9ca75fb80f45 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -24,6 +24,7 @@ properties:
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
           - ingenic,x1000-i2s
+          - ingenic,x1600-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

