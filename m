Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733820;
	b=2Lz3U1XDfJ7GKXbcTQWuBU1Zal1QYoqPrffhcsiXtiPsgv4rveMMV77uOOLaduXU+vu9
	 2uzQoH1lAOHVFCQ8uT9krba8/4NELTPdkyl7KIYMCQsB+7kbGMNAXJYrNL0plIJBo3ilG
	 1jvFrJ02GntaXTB4qJPjqTUYIBsX9JOnpWcHeLHIYjuvFxZpx2AbO/FpPJjRkhPlZSZou
	 fvKgBC/5drf1tx7DNM3LAGr0z9PHKoDWlSUSLrBZfHXTcGlHMwyRCuM8iO56Bg+Px3cow
	 diHuX2tojNntPTpz8jIEPFuyTG2GtcX9yG3UZI+PG17ibcJ9Lws/R7lSN4qfAm06GRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
	b=jnqjBZdaPVAYHYD3zlh2+1iDDL8ue76CL4wLQzK9xPWGbnq40pDwsS9J2Ho04Sr+8wD3
	 gNBqttyQklfWfubIy/5CTvB86RQ5C3ArlxuoTqwryMuUM9ZMHCZgjfVzqG0E7rTE6DfXS
	 Er+KVBQ+EfW1hA+yFOafiFqoJ5pHZeOldP8yKWOfQzQhsUhWCCrQFn5XslmHX+PppF8Mz
	 4Nn3ULQGYJ9Q+Ac1M/NjYN/v0XEc0JphS4ObIraFJPEzPu9RaGxEkO/BWV37p0UaDE/LH
	 8edv087tpfaVN8PTlTZUeEX+KNEglzNB8jU/ugVyTHR19uyw2VAJc5H0JRAKPj0sP1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0333FfG;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6EB606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6EB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0333FfG
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84a248254f4so3063194a34.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733819; x=1794338619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=E0333FfG4upsPuighbjoWor7MDkevAE3RMaN6spi1eERSv2pBeIJJUG3LDKs2Sb2Ii
         dJ/HJDIqWw0ivTbTFx+TGd9q+W1alH16eoWs9jXjqXLxUUtXpMw0+BbaEMt32pXW7eZX
         ofifav4nGTcLHkN0DZC0Iea4PwBsMV6aEWb5NxEiiVRdSHvanX9KBLPa9w+Q9Py+42GD
         RvU1+6uvqHZn5maBDc6a/7aPuvXOAA9ug9C811JRrv8mnPEMPyMNj31viZKIsaqoiq3Q
         2KPSglhbMUyyhII6t1EgPHDhehA7EgbPFakzSG0irtdPmMWkimrmNZ8WLVIek8HdaeNg
         S+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733819; x=1794338619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=XkDkqR6JSAS8r/vgRwkWVsjeEwiHzpiOF4z+TsCtfz3QViHgfyMgaGQX91GPgnNr0i
         9Q9anhCauzmh3hXWyFS9CSN79RiiOPkkXaozj6nZpEjFBOAmfVVgnj6PrEMO8BV6AH4m
         k8aZtk/DXmQtWQlTuAYsXfDZ3SKZ4b2HuhFitjKVR54TtHM+ouq3KDBZHWhO6UYPlpvp
         8eoA2k51w4kImVZjaUis2IC383IMDWa0EIzdN81vT6RR5bcT24gHvbMndNranPpBcyja
         91LO1WD1ta/fPJYb4WLwn7YTPkDpy+LrNmZ1Uw7v5HEzP09Pe6iOrf55PfFzDHE+QpkK
         5hEw==
X-Forwarded-Encrypted: i=1; AKwUvBwVNcuZQIc+jnSaPptUDn+Zd+RgGmH/oAFfLszxNLq+KDh7eqNoQaUlsKPYbtL4MHr1C5K6EVAmJNaE@vger.kernel.org
X-Gm-Message-State: APuU4Z9wxCC5OjAuMAtD2tcgcPjb3j5bGgBmAfQumGxxgz3fZ43wVCYY
	MY5i1p8Eynm40+m8Nvm0xnsG8Oj+EaJQlunm+yXA0W0gtzKSLe2KyxsG
X-Gm-Gg: AYBFou34smozWyCAl072juIv+IFwcavES36BdowTu8FOKXvWwAOZdWQjXAfUNHbHPap
	reJA/JxBSwoIoW0BznsuhamaL4NLEg4hF3gFxeTFlSskc8384C0YMxYx83aLbIWuywr4oi1V+s8
	74UzKdDcHOdhYHveaUXfaxthRqRyFPR5cYv970f56RCefLsCt8V1eMGXfeM9fY2VpAyZGV4aori
	SiT1iAixZrSMskgcNV+MQsB3RW9drHQMux7UssOHsLvYjhj3pMkszsxwi8IJ1m19NcDjyPk3F/H
	4wyH/8RE7w1a1NSSpVcwRLljyPey+UDIyMNVyZwy8SiGxfRsC8gNIVlbarqWiQs7f9e5wHa/9cX
	DSB0X+t1bmG5yGlwIUWez601sDoIco163aIgkk0fPTbKnvuroRvLZNNhqnzNAnd2CCdfw5tfhh2
	YgIkjTZI1vndwBm1cpMY7IySp+HgcCn4QTpuxteSslwbshPC5ZSzn2fpcpJPVNQeqtDJ7eT453P
	z+xCpefvUuSqT1g9G4U1kk7BN40N3hcqGZLBYU1X9xIxnblf1ow5vS87QG6Q5jVpwNfZYH4G0uR
	cChy0ertGVwW6wd6HYpp2wVaoDNjMj9ZHjUXwuZsbbIlwbXl0iM=
X-Received: by 2002:a05:6830:43aa:b0:828:d647:332c with SMTP id 46e09a7af769-85d3647359dmr9188302a34.25.1793733819011;
        Tue, 03 Nov 2026 11:23:39 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue,  3 Nov 2026 13:23:30 -0600
Message-ID: <20261103192331.394489-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103192331.394489-1-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0

