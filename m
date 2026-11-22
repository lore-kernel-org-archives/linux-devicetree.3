Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340043;
	b=1DV2hyYc+QYm6XI8bQtfXvjKHjhgsHmsRJrU8FC84DvaxWiS0v4GQuUFnlo/y2NGh4fy
	 ctHoNEphAOY0j7xcMf7hzsd4oKMcODQDLGWS9IIJNn/xMw42hpcgI0jGwgNwto/avA91i
	 +NYaqAZ0LV73Pgayoe1FqPRBY+fI3WC1AdtRcvseIXqvMRFBP7VDeGavfxFSMfELTdpDb
	 uOCTNqRdD3iGU6azpbnTNgK1nsJ6XW3lTyE2DMq2itvIl0Ly9/7s8MexauuuD6TwodGaN
	 1kHSLUQeq9YHuzbTXU94N9m6frmta214cW8FMLJyToBVwT1GK7uLwM/32CxhnFc3K2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W5VTRU2ZJ4vfK29HCyapxIcp+oDTBoW4ogGlC4wIY/w=;
	b=kFaJXWtKqiBMeqrWqowHfny1Bl/9HlnNLRMMQR17k84r3xjnJGPbFp0KZxOy8wwaXDl/
	 jwGEsXuRmRsV3tzNDpvQ3OcT3OQbd66BOiX6xoOSo69tEPEdkVGnWF/unVsuKG8gUgwel
	 cicMD+zyKLYHVm7lHB4C8yaYPL87C1v0wESD3InOUugk1gciGzNLjHhqVvnfC45Jl1vn0
	 xJWhZG7K6Uh2X1mQY7kWccfGkIkdPCkKQctJJCmyg0OFo6p2ui3TERAXsSCsjrNcsGlBu
	 rfx/jF0bsNAtVJPY9iCPtRZoYhfdQGsT/61LGatKCuOqjN6XVEZ87IjpScImGwhEZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n+tQ8jlF;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D96606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D96606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n+tQ8jlF
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so14508965e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340042; x=1795944842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5VTRU2ZJ4vfK29HCyapxIcp+oDTBoW4ogGlC4wIY/w=;
        b=n+tQ8jlF9qqkDnT181q+T6SD0KSNWI+ercVFB9Ze8d2CpIz/eVP7hfn8ejHt8ng6O4
         0IxyK1MlxH6Hhuq6UME71z5nR3loI0BST+7UG2XxAz05XuRH23ipnoK0BGXV2hfu/llh
         gxePZHSOKQoLTPjBaoy60Qy0eXR98WetMRr9W0eUpIrHEh8GC90/CFXQV3Ncs0SekCMy
         6wLwfXp5jrtC0An9XR+s5ATHqa+eOSylVxfzxavyoji1XMQ1SDzF/dBIrTv1bU7cVkdi
         aibXNXPS3umdOJhwNS8hOFO3hMzWFlZjj0vgFsn0NHkSAWYI4PS+rkWxLBI0E8KSS1hv
         dGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340042; x=1795944842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5VTRU2ZJ4vfK29HCyapxIcp+oDTBoW4ogGlC4wIY/w=;
        b=f6lXotZHcFW43Ropd9ZB7G+YVqsrp0liM0Fk0kBZKXGytwUcj/T/9bz/comx5rzmZp
         61vims9MMKqilhpiGtiF5BNYB/ska/PlB9cMzWBlprv/E+vmkQfSRB5ExHD776wUncNf
         QrHEN8dmHfyUsUQThe6VXcdcASxqU6i+e4J+vrIgA/43mxg9j3C3vTX2ZoSskuwFl8Hc
         SGyFmc0Tak1ynA897G/hfYFpXBFJU2/vpiCp+6ys2X14ORD8O1YbPNw69w2lOpT56jd0
         9U69Y0TME9v0xwcoRv0i5oJ+6hjVDBneSlVEwnr8aYrpO9qdQn3c45QUOiuLScw7RRAk
         1b5w==
X-Gm-Message-State: APuU4Z/AqCx1LZOLjqCN0Z38jZ0nndOBBRdu618r5L1Ol/DV7IEdhfd/
	5CY7AqqGwM/l12gq+OM/gOW6DfSkG7/2Q4YQNNVzpuukY5MBAI/gTJCNdcBT6M7vdwc=
X-Gm-Gg: AZFdTZf8NOCHdzNPAKE1R3ZDArfqZr4DQEismr7yesmpZYoEPcL70cC/dCxHwitTKBX
	i8ISi5w4gCxoBoYOSqvfPbZs2QCS8DJ5i9sQyCY/J5nFHbu4LvzUnuAvl8bmrAj2rKer5xAvsjS
	80NUghgqgucxY78hAKbVeYGJn9pAsCKb4EkkTDLxtgsOeiZRV0CFMlKf94cCXqD4+Frie/KdWl3
	75b93wpH9WMSVZMXJ1poqXZ9chD5gXcNiVPEDqMxL3B7ukdJbIeoD59wCeUyB64oWxlP6Dztq5s
	xqBqj0uZROw1uJFwEGQ0+vuRg0fYV8R1FNVjnImmLHBNpSjQP1bvoHXuzI5itoNTNzBaGhi0vBt
	PbtR78bm43IagRCS8TfWsGEJKY/TdWLyv/7QWLk6xrklRBWyMTJoSzY2P5zIif4vol6ewJ0FQXt
	/R5e8vElCzL5WpTiDGpMFOaQv3sGzGvBGUMQyI8grqol9Al9ZfJ8Dm4CB9VH1h4GuEF42tdkIoz
	epByu7miVfUMWoA4uhl+PCrUm1Dprc5NJpX9hnS/QJZGQlpleEUdFTZT3tUJDvvFOE4JqpNEWZ2
	2eac2cx9/TYBerRNLdFy8TG8WR3kxnrSYecRpwBLN4FaJOco/557C9YtvtVPmp2uFCCYjWihdlx
	eNcEqVL3s+hA2
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr186380805e9.28.1795340041982;
        Sun, 22 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm16972915f8f.11.2026.11.22.01.34.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:01 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Add Cortex-M33
Date: Sun, 22 Nov 2026 10:33:58 +0100
Message-ID: <20261122093359.69352-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122093359.69352-1-gerard@teslabs.com>
References: <20261122093359.69352-1-gerard@teslabs.com>
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

Document the compatible of the Arm Cortex-M33 core, next to the other
Cortex-M cores already listed.

These schemas are now used by PebbleOS, whose QEMU machines are built
around a Cortex-M33.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70dacd..da12be7f5119 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -170,6 +170,7 @@ properties:
           - arm,cortex-m1
           - arm,cortex-m3
           - arm,cortex-m4
+          - arm,cortex-m33
           - arm,cortex-r4
           - arm,cortex-r5
           - arm,cortex-r7
-- 
2.45.2

