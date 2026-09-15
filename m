Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5F3C8717
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479497; cv=none; b=URpvjlLiPias2oap/XM83u569Rz/BW4ZeiToVvns9OTUy4JwGj36Fr/k4UhmkzDig0xRlrQAmMUMiEe1TTFzR7AogoTqOct3chVCkfWDHz8G0LqXlukJ43uwATGqbuxxQQPGH2hEB0SZ31QJfbFGmnkJWptNq1vxOkyiprHqgng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479497; c=relaxed/simple;
	bh=wath81Q8sOYZgPW+L09LPC3jhwcoeQbhIhgP4/22Sag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZR9RTLOfCAtfa5KLxLxL4unmQnVHlnkj0OP+iczDxg4us+IEda1P2HuxcMrlNUx3A4RSqi6JCW0P4VdbngSNehwtC7ZUhgaKCNzSXYDOnJqMEGPnOhgCKTCnqVAtmSBfY/pw6aB8xvAiOQMd++ySfO3vl1N5r4MR+NG4yERIMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=gPZha0K5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="gPZha0K5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so2302475e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479494; x=1790084294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5QD66LDLTjuaEtQ+ndFRPFOe58GBU9YDYWhOeJ3k3U=;
        b=gPZha0K5FYnpNFvwf7I+qdgTWsJPsQxSu64q1uwUxwhy0SJqH0qcf85oocUnERAHU3
         IQOkDm+QrmCnox0IweVuCsi15XhJCsGbxbeWRAAyThXH76/1rU4CjOHnaRl+s4Nmcnyt
         parGgjaGZwlWJJgp2VJNPn95WEyWgMlGou5No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479494; x=1790084294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5QD66LDLTjuaEtQ+ndFRPFOe58GBU9YDYWhOeJ3k3U=;
        b=ioRKOaD3+sJDiOw9Yd4fxMtYg+Ojph9p6RKRUfgoLQxwfP/O0XnNpGKz9yG5bwt/GK
         5POogt9AY6mlri92IgS2NbZQZR5hnS/CoPfyeJNFFvN12882oXZrSFMYGA5ZdEfEN2Dl
         y+RvshpFPNN8P+D4jWKQfaHJjbRCcrC2ZW2l+b/cumZ2MN5J4AcaP1wgcBCB9eEttNVC
         huCnBf3ggfpdXbiuuWKTjuqAWFEdWYY0Y0Yvd7pVw2XAS0Rob52Z/j1uml+BucxbnOx4
         5KhhgUjqLiPadgecg0VG/seIfxAHNEn50XVl3mijg35K2R9lcMeNuSHRbqo5T4hjD53Y
         GF2g==
X-Gm-Message-State: AFuF++nV2bzCY6HUh0JT5AdogSoP+zxPotvrqALOE5ipNCIA/gyf19xq
	RtE5fCFvyDszHL4dQm68+L3O6hFHSIxhAdV5qWapLWaCFooGZMGxIeZFU2XPzk6s6sI=
X-Gm-Gg: AYBFou2DPu4NSsIGjveO1ghIXGW9QHn0lq79Tu6hu2A/TeUBiCfU1riiiAuyikumxCU
	FoJ8Pawbi0F8WcGL6oAsUHbxUPEiF86RrQqqwoIjtz6fFWgDK6OlRbMQkuteyR9i7DHoB59q8HO
	JBRvdWOSjulqxQ/dPfRX9xZl+RayCoNrZTRHxMGKz5aTiKpzRV18HKLHdEOh0DHHXVNUGbLcakW
	ySuhCtru4ZnLvjJsi13FLy8gpWRQmg+GYzVJoBFoOQ8N5SQcfgDtCnRGytDysF2FZmN84Q9rIZr
	yeFJqeVg2DIv8jtktu1GytQga40Dun4z5OX2iK0OwA+TioOxAH/Uzx1xKgWzt7vt00NYhkWpJSx
	OU3pJdanx5NopUeEaqAD1W88ACmKIO6uNek53ODNRo+RBZ66CvS9eCG2rR+4Qi+BB+2fpOsuB5A
	Q2mn3yj7wJE4kYQ1FRlRtBsE4R94o4Tcxn7RBJ3If7Dzmip2XMHTh5ec/XDYjzJEilbb1FrD3t1
	eJeaYCe/A7TOAuC
X-Received: by 2002:a05:600c:1d23:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49e8224d49amr21067445e9.11.1789479493764;
        Tue, 15 Sep 2026 06:38:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:13 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Date: Tue, 15 Sep 2026 16:38:03 +0300
Message-ID: <20260915133805.3249587-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915133805.3249587-1-petko.manolov@konsulko.com>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string for Draeger's M48 CPU Module that is also
based on Altera SoCFPGA.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

