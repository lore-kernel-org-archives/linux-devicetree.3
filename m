Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826571;
	b=ZMjQOuGwwy+9+tX0zJQ2JUSKXE8ZfQFFdc0xJdi7f2VmDXuKDuCnT2ak23JoKSqYhPXH
	 EcDRcX6nlkvsNfsPdEOOydtUQA7/2AHw4apGk8PdRTCHOOy37BjqzEeZoxYFLz2HQMyey
	 nLJayoBKQSg5gnxQp1RziXNR5zB+XtwyWtaoET4/fKOQFOqTG30G3cF7xaFQDComEsjbe
	 cz5LYcaavwWKsQSWymgD2DtDkWf1qZ+02kP94BlcenMgbskQOunuJKu5/I4DGa7rxzfdc
	 vulL49oVoCUCTkIbv8n3Uywleilqx1HMCdYReKyGv64o2U1fGAe+2WIs6NplXQn1ZNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
	b=vvgSJGlaaAGsLT6HhoCZXY9Lk4egMEjASFx/LCFamvqvPAs3qMbkd/B34wEV/0rvhtN3
	 RCHa07dgJQrd8iYDQD2p3fioGq7ESQ+d/qt82rgWw8u6q8xeyZOwVDvV4tzDxNVwvx1cp
	 2ItWkRhANNvv3DmUn1/5bOmABL81AETxnSiciJhCC63kmZdLzPJmWvztMAWCgSFHbJGwI
	 RrXg3w5ebJbBYUJGjr2YheSFNUteJLWGyyHilM9lHDyRtRc16F4tJohU1KvJ4ws3GoqS1
	 Q3/OwRb5xSL3Put4UIlHKcEMviSDmN9TvPIRdRtInPZxDnv07rfaF5G7FQFDfzYSPuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=me5ihzqy;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F596606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F596606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=me5ihzqy
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b360828905so29712887b3.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826570; x=1795431370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=me5ihzqyzMngZ33PKeWakS+9H/wF+BrDnb3sNRskbLAS7FAfWcXRA/+3MHA1+x0PwA
         yL1Zw3c2vxCKQnpDLoeE6EY0HFmer37j43SgHK+jZx1oWwpW+BvKNEXLGfKvJ8aoC7n4
         wBmAO7eLNAqnaTTBFMaY+OBsLJ6K+UMOVn4N4wMqwqdv/IzbfGYB8SIU4gusKnmPNbUx
         ChpnbkAS8s8A5QB37c9ze7VDbl3/KBWfes0LOHtweXot4ggaIy05zP9JVi/ErSOySF8h
         s6v9DhRPV73KeQYKmt1L6rQtyY4Q6No0+o5X9gLIiQX7UG1k6rWYlkjcT+5n8UEpeQ+D
         seNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826570; x=1795431370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=ZwU+PneAxWK4Ph0LxwDtijrWQSz8JqxgeyNEyRB9F6cT0sRL+IAxupM0C5u/W4U9a/
         JFJCSSZ8ta+MvCExuSiwcUtRlNVtG1QOG8iut9YtSdgSofidODZHGKJq0KCF/06h202A
         TZ9iifTRSxuBYCxk3/rTRCJvPiVaFOgynKJFEg93OXWAFEJLFnampdO78jP6CogTkPBP
         IJuBDbyJuI9NZKwNTeRtg2DucJrrXo+BgWRONa3UhKsqddmy8ZIFpMdQaxKfPJWmnQSJ
         a34TDQOPHdokcP4FvVviGjhde1d5VRyBXTrE4r1iIVumOMMnsvDmk4g9R2tA9WZRSZjc
         8ODw==
X-Forwarded-Encrypted: i=1; AL+hErG7hKReQj9QVoPyfttgLebNfSy3TV4UGa5KlQgLVt9pEWXseKeSssV8MWoPmmHlM4tAmv4sW6/UaKDb@vger.kernel.org
X-Gm-Message-State: APuU4Z8k50swHqIbEeezXIhaQ6mk2kcZjdxBF0fENeZ4ovDeN/CNJP6m
	9Y7/zA6rMPaZQwewWPgEUnzbnnPvbrcFVv2kTD41Taaodnj/EhgyL+k3
X-Gm-Gg: AZFdTZc/NTGhQ+EAe+AwdZiR6OiPCXJ95ADbrMN8Z6Ic23fmh4Z/FRVTZUaUumYmJS6
	d20aIHi9A5vWO82PKOSjkFo+7as9qHEGeK01Gyk0R2luXbvfG8q2m/6WUEsWqFh3eN/d9yp0R1u
	uv8mW71hxdygfJFfKyfsIcrUdtf9d0jKttVDqiGxWIyK6OcxsNsavTaFKXPvbEV/FUuwkx0LhZH
	SYPUqaCKPGRR7suqnobs04LIlpK/vEdXx1cE+zwvcrUotZ9sTCtSvAUTrcixX555GCX2zuRIo5i
	AQ16gfBwAFjjpuOEr9pIcKrqTdy07gyVn9lFWzlwzbnqaNBtBuNkPDUZbQYroSo2tKy+sQ7wAvb
	nh6mByvUUTDkUgNDACAeSM7euzY2W3NskrdhVW98W4rWtVDshI+Tpoh5GeXSwidY5jCEkkXVjIP
	31wxewhF4xb9js31GgeUra/H+pBd0/t3FPqVZNIpbNqE2gKAwuvCYgCbLAuVmWIeqcNnqE0huSA
	JPh1OZOXahAVhE68aLdy0prf36T0C5dNtl/DR/ThbvssDVITUkvNYGeJBxlSP1qn4VgyHoBeOC2
	jpW6681jAfuRBJJJv4mjkCF5B6Q7zTyvzQA+DunI4viQq9M8AFisQ6Pu6ZJD/kF3oFXNkUt4y+y
	xNedpgcUuIm4P3P3cg+FOfa4rgdGSW3Ly7/Zo
X-Received: by 2002:a05:690c:389:b0:8b3:2445:889b with SMTP id 00721157ae682-8b4aa2eb92bmr50305027b3.91.1794826570279;
        Mon, 16 Nov 2026 02:56:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:09 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Mon, 16 Nov 2026 07:55:43 -0300
Message-ID: <20261116105544.669029-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
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

The Allwinner A733 USB 2.0 PHY uses the same configuration as the D1,
so add its compatible with the D1 fallback. The A733-specific
compatible lets the driver clear SIDDQ before releasing the PHY reset,
without changing the PHY configuration.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0

