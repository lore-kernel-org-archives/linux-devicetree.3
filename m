Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491D41DE05
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057835; cv=none; b=P3wT+aNi0gs1pI1azyN5n/qgVOxuui/KuwQMCglXwXGC6o3TRO9WTmoPZIZuuMiS83i6XpRCRVI5AnIiFLx6xHpkto6mbhfGbKpRlAGHAOnXSC4mjCFEKUTF583tV/sxFEFP665+jqsHyc5n3XTMOuq9+6pnnbq2M52Jq+miof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057835; c=relaxed/simple;
	bh=X3k7guQMJ/cKE2RPh2BVLcvAwsvWDUbP3qvsI1eXrC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cj6ajvc/42m/8+OgWCb4rw7kUJHQiGsFVSlaLqj/WsA94z812FWQ/KkS7ZQWHSs08FhQqnUSKwfmcSnHMpS3vYJzUy48eqLcT3uxFZBxbkU5V60Xr6W+IdEkDqWmatFe/3jsWKZThAUZJaBCmJw+QOq3LQTobPjsP1s1B1+cPio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JHdzeVWE; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHdzeVWE"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb787dec99so2922779a34.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057833; x=1784662633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehkMFoWgqIg1ow9atROFZYSGr7YDspw2tJRq5+hr+pc=;
        b=JHdzeVWEtEK1BFtAWJIMWqzXArpSxWfCwRMnQ9Zc1vAU8iOkjAHc+Pt5GAEyjGEtwn
         WsX6pR0gRSVjLkDAG04mah6Kx60fsuY613hGpdrGoB5z4k4KON2FOqZXUsOow3OLBPd/
         dvdsESAD5fteF/poZGrz7oKZ4L14ae2YzeQFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057833; x=1784662633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehkMFoWgqIg1ow9atROFZYSGr7YDspw2tJRq5+hr+pc=;
        b=EIO1raCd1yG2414rgUTuV/eKC1yWSAccfbdrY3zwM59Usyi3F1xmVvkEr+vALxZFtZ
         JWrQU3e/LV0TFVH6ChI27x9DuXfnrx4nofQfUXtYmRbufDVjc1rN8lJ5SjmvZeXcLtdu
         5Jo7sl1QydLl9NI6DFO3fG1+NeEKuNYfYKfrmydBS3lBc7Fw9G6FERGlqgIBN5lHzTKb
         MUrIu9QWcEn56xdeRZzgpZPlsmig04u3mm1G4Xbkf6a+Ze7ZdNdOIyJGDepMjRDzxtsT
         Io9J4NFsCDXUDTlzeAosT5c5MIF/Y0u/jlDjXOXtvaUb5YzXz9bbTiv2Bjp7uwvkxASf
         0Kiw==
X-Forwarded-Encrypted: i=1; AFNElJ/H0f9me+oZvOfWNrt4UQ8qhI0WcxcvHcP/jSN4SmgFs3p18firyq7fMmxoh7eqF+xJQUemvDcc9Rca@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFMsm9dWJ7Pg0nOeeTNYjNmepvf3eEUrMnyAtt/i/BiCp8Xpo
	pXiJ7k7IvnLZeZi2h/AHVOnHIgcEUuqZ425I1QCNZhkONuS8QUw64ln9nUvvr74o3g==
X-Gm-Gg: AfdE7cm7arJzb21FLf+1+KdE2s9Tt7QfhM+0+Y4gkmAflMqPS6TgjaVoiaZGyaV63oy
	wP6oZrHrdP4RbjQtJdW0cgsGmvtCTYgG0jWrzCJGpY8UzriRoF58ipV5BOYcvddpbp6seIVehCV
	HmIQvriNBvhOtua3J156c3IWQoiLrGvkRaB516KFlwyCIMvSRoUThuDI5bZGwGETugV7NG9QsGN
	VpbQHSPEPmcg7pI+syjSKuqIckuMIMdyZdSKq32HeKLzImBHxoSDOs1xvo4/1Pr82iFvR8/blT7
	C6QuRtqPWLLP96S8xIrvflGP29Edcb7AUpRLBBo6EYNcGnNbtecHlbLM9EHu1eGSJv2EFkv2whh
	hSikG7Q8H6JjibbCR9pmzLmbcQ+kiasOb9X8ghVAwta49AmQvawkm5QhSOAjZXU4Db6EE3TW7DV
	7g+T784Bw=
X-Received: by 2002:a05:6830:3805:b0:7e9:5de:cb93 with SMTP id 46e09a7af769-7ec59d40cb0mr9721a34.18.1784057833072;
        Tue, 14 Jul 2026 12:37:13 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:12 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Tue, 14 Jul 2026 13:36:40 -0600
Message-ID: <20260714193656.2196447-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714193656.2196447-1-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatibles for the general register files of the Rockchip
RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
controller.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Drop the grf-cru clock-controller child and use the syscon-only
  group for the main GRF, since the CRU now provides the MMC phase
  clocks
- Use a single gpio-ioc compatible for the per-bank IOC blocks in
  place of the ioc and pmuioc regions

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..fd9235ac1334 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -64,6 +64,8 @@ properties:
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1103b-ioc
+              - rockchip,rv1106-gpio-ioc
+              - rockchip,rv1106-grf
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
-- 
2.43.0

