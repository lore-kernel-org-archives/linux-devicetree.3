Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6182110E
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952601; cv=none; b=Fqpon+zmVgbZZ8+JpSGvrGu6D2FK1KkHY0adjR7HukwibBS5LdXxECj3JSNG4+2AH7qcyxmh6WVlPhfwNr9dEHmxNZY3cUpHsGdDbYkWDzBwl5c6ZQunB/GYBU4c5KVi8rCZhk8zLfQ7mpDCaY+RiEeVC0I1P41LhAxsQnqIZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952601; c=relaxed/simple;
	bh=2O/S3XL50vnKkv2tSiVpbykmAydVtqNSzRobMu03p2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YbcyB05R0JB0CqRer93JIaRlvmPNiMzua3F5hyiGXf2vcCWKnOcnxFTfNjO44GeJT3ypiauS05teoB8i0O7T8ia9dsAawyqwhaXHfr+tkEq58KoH37hYz8BZvCN+8E8C9Pt3vu3GtQ206KIOfnwX8GZGwPjWPWokFfDKQDD2GVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Hc4Coq+i; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Hc4Coq+i"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17e5de00so502912866b.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790952593; x=1791557393; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L9ik8U3QoQNQPe5SHdLCShleOIeiL5bJn3z99i0/GMM=;
        b=Hc4Coq+iY/cC/8E3IDiKteApOZAUhCdbMWK4KvQ5QbXCQm5qfX6nZzOZS604EL+Gh6
         vjyBIf/p7GHe358lezmBtgVMd2qJX5k5yxo9vVsVVbzieNSEtPtEQrClheumpsqq6xbb
         RPmv3hgHDWsX4kCUjDHE0uK8pKWRWyEY9657ZNZQVe/pnWHxzQpmNs2p4W4uZKUdgsLh
         w6UzlM1LMASXZSKxES0quwEiu3Z9KBsPmXvtpmyxY5TU70z3hnqiiWde05ArP7GvnJnO
         G9Si/UaNJaywqpZgTtclyD1r+30HWdegAU70N1yp+a5PG2ystuzmNAijFIeBr89y8Mne
         B9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952593; x=1791557393;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L9ik8U3QoQNQPe5SHdLCShleOIeiL5bJn3z99i0/GMM=;
        b=m+O2gVg5rRN/FJIAUNuKbP6wFnuAQGKJj/IHdvVc1HKvdoVIYsGPnG4PQ5hxWTNyRg
         ToesO5jzf190EMoqLhlA+yHpU+cFE+sLaQt+VjIfzAlaegyFSxEAI8DUXVYvJdEMNt3j
         bqkoiTd3hyN94sjkIN8O1ZqXUTmaBy6hufNIlFD6VwqugcYOc1mG9nHh5GINXdpOfsHp
         ZkYv7pOLwp3QoK8/qRruwRIGTWLnGJX/7+5b8K8KF6k+Qa3LGYuHyuu7ResdqkCY/7Ft
         z0+xeHO7NVc0JhFApXYw6+jGdPdpKNguNf37iyoNxe1SFSIbywZYhD3tmKPLvy4wSHG1
         z/GA==
X-Forwarded-Encrypted: i=1; AKwUvBwWVnX03+zfCnCnJ8R801KupidHMwi2UvjEk6PBe+Ef/bTDmuwuzHzRKWz3YcBasoepjxDMz/Kku3Vu@vger.kernel.org
X-Gm-Message-State: AFuF++k7VJNlCO6NsgW6ye3uUE5W4bUZSLt9DPbQs0MZF7ujckgaSlz2
	yjrUJ8p6xKbJ/tZVyVP0UcVo5p2bw2Q07GQggDdYUIM+e+oBTuFEPDlhGdC0XcdnOmU=
X-Gm-Gg: AYBFou1cY/SJmr8YMGsznRzfEdl411TuxxnuLK/MxxA6tGB1kGin+doS7keR90cP7/F
	JMgJbr6PIEPrNSvJuY/rLPuKiHiVJ+AH3KV+SXKYH41GpGim05wtmT77bPaH35N05bjh4G5+hmq
	NXP2pJuBB/toeGn8llIu05A9yJQu5QUlDPBR4mzCtLdaI18fuh5ttMJ1vDIF++IVTlogD4tlBah
	JGoHbGqIMdX/0/LWPt/spp/nnorDIheQU5YifPX4mky3EwqR7fhKShvDX2I50lB0JcOpUzYm8ui
	oSRUbIqIc0JryL3jRC3yuRQZfEjaA3DyTizqUnVnDVVuCOgpomUPK4EbLRxGSIxDLjQNvXNS57c
	0JD3r+2MRFs50fXAXFdxRK/zy6kb+wcM24RR7LsEKGKcJuIWpCpmou8KLxAlsG8rGc9SAaEaqt9
	QfRHMOaHYvBBkTxTlZpyqAgLY+PNrR1X1arrRe+ndhVCcXYpVV4MINc3JvgXZwV3QhgSwxIvO9Y
	kgz60IACyNU5A8tpnuKjrZxI1mmi9gW4WPcTbmjPH19Om8pcgu9
X-Received: by 2002:a17:906:c143:b0:c2d:d289:e9ef with SMTP id a640c23a62f3a-c2e4aac989dmr291403566b.12.1790952593255;
        Fri, 02 Oct 2026 07:49:53 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa656bsm94539066b.74.2026.10.02.07.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:49:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Tighten compatible matching for himax,hx83112{a,b}
Date: Fri, 02 Oct 2026 16:49:49 +0200
Message-Id: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBvIRJC0VyldJONYp7RRMmkRx
 Lub6u6/zV9BOQsr3JoVMv9EZUoVeGmAxpCebKSvBmddh9Y6My6+RXSGps8cisQ310wlSFJzxcE
 Te6aWeqiHOfMgy3G/P07rN76Yyn8J27YDMceoW38AAAA=
X-Change-ID: 20261002-hx83112-compatible-contains-91f8ce8ec3cd
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790952592; l=748;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2O/S3XL50vnKkv2tSiVpbykmAydVtqNSzRobMu03p2A=;
 b=UkE+b8v+10J3b4FJm8JvS7FzqYhsFdpkNMq8xiMS/usGGxhwn04D9UYTOET/8+4palDdDBkbl
 DXBdzOwNR6lAUhyGtoQUbswtR0rsZ+DCL1BDR1e7yIG650exuYvntQq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As pointed out in the nt37705 series, fix the match for compatible in
the himax,hx83112a & himax,hx83112b schemas.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: display: panel: himax,hx83112a: Tighten compatible matching
      dt-bindings: display: panel: himax,hx83112b: Tighten compatible matching

 Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | 3 +--
 Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261002-hx83112-compatible-contains-91f8ce8ec3cd

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

