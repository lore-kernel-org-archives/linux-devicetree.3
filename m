Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5C41B37A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462072; cv=none; b=M/vHP+CfzxvHmhhc2lkURzscB2CA9H6TEJ6LYQ61GDhUpSQGrL441Q2gHWOreh+hbfj9nkH9V2nRUf30ckvQx/rsaHKzJKzK7crik9T7qXz/PoCWh3i8v5ZTV+FHvfX45ahE0dc+b2KICHtDz5fnTJcTSMW3STPV/h0cPvG2bAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462072; c=relaxed/simple;
	bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfLLD+h+Hn2X4Ta07STsDATsaHWzAfku6GgQKeTVAJ1MoxadfdfdyE9lIbRCG4HjWorfG2ZWzDwzhmzpn3v+DqafBQCKJhpBQvrjFYGX48xZAu4TyBSxiwx/tpZcvNdM3DWzVVZedcptRvAgBzUWLReaMjpunjcNaGnw6EeS4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOMagz4o; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOMagz4o"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b06d33e84cso505405ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462068; x=1775066868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=rOMagz4oBevcgtyRlh2BLQU9nLyBqB+b3FYpJCtu/OxZA5eoP5o83IOR7Hi6P4I/KY
         974wvTViL4Rg97e+cfoULQzjTXzwIW8K2/aAMVmP5OUkEDHiTV9s0TPzeeirtq4rFK/k
         RjWufBFI4sFctN4Uc4eeK40hZyzugKVciikaOsphOxCdbe9N9GesopKUSixzG7NnGclZ
         yhDjHdRgYhUoK6gxXyhyY4MIBkDmEPfo+zdr48yTj8n2uOViCxn4SZ5FozChnzfOnfrT
         st9pa6wmdAXAdgwexkQAHjY2Op8+98M5pLz19UtT1oLroySUpX30DiZvkK7Lq1Hwnszj
         u/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462068; x=1775066868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=TkjFGhLvdpnKIFJzZsuWargQmvbEWWlRuoLqfQFm7UkLoU0T1RMfVSnXVOSfcw8Yh6
         DFFRVvzMmiOaRKEXp8NQ1untbSxP3DRKr6pl5zZsIgItBu1IoJSKTiZNabk1rGG+NpZO
         Ruxa3Uft5xDWN4A7tehK9K47lujL3fqoTvFmvLTIcpVZC2vC0AeJkBlWbF+VXIMWIZrr
         em4czZI6yhVaQqFv3m/P8V4kUyERWu8AEMrDdBLjirqf17Mbgt37k1dbxPbeVh95xdVf
         PWobUcTv5hK7OovDy4jlK9iwNGBJJCI/xGJmVR8VSAJqU5OElbTeDc81c5SKpqRjq4Up
         M9IA==
X-Forwarded-Encrypted: i=1; AJvYcCUCNenyhMGiwM9gi3SB11b5+4q63CWAe+wlVGDCo1xuuVc8YLH5pECxEtTYw1NHzGwkYGeeUe1btdNC@vger.kernel.org
X-Gm-Message-State: AOJu0YyndSkcV0PHO+ynPWyLAeVR+V3gEHK8Pp69SRShY8Gm+bR7Q5E2
	ehgFRheGQQyP1b8oBXIgjommRAuAjuI6KdAzI3PgC9RxIA/1BjfoCgY8
X-Gm-Gg: ATEYQzy2xLznGGE3wq5eGm2OUrEYvbL6/zb2q57vA1skVlBkqXK+W/VCZjYUMfoP9FF
	NCLJ3PLnF+kDQShLlSxQ65rq+xNJS6Hx9+RwIeVYmdJX4FjSWDiTmyLsYak0VyWcSwgv3VhmvGx
	+hI79PFKw6BLFrob790EJkg4LgKYqXHrZiWDxcl5uXHRO7VVBuTiPowgyb4jvzb5n+2uyAoYIKf
	vsx6GXktpcy74IXiWsbYc0WllNSo1XEL+EA0KvcG2qa9pa+HtW52T1JupudlvS6u8Q3+1YQ0f3A
	IMQgHs1xyEreXGrOs9P+OBIzAcadi0psLezOVY2tNh6RJBKvacXXzd6KpZwkPbmvMq7pZxbxM1u
	xqE1A4W7qE8UjxDZ3oiZd1YUEF9vLCSjzVC3NsTQvvOlu677GJvDA3u+lc90o37eX7Zz+0auhiC
	h3Rs0/1AM4grGe+e7/b6IWiEJmpn8Q
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr50563235ad.29.1774462067634;
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:25 +0000
Subject: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=919;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
 b=voXfhb5tQm3cVPDqWZP3DiFroa+n9Pp3IhcNpBymaT+ppwL0cOEgPXmQqxc7neKiDp8CqQHRt
 92SQS4v/upQCCItffWGtN3Vw5UcrLztgcL44oBIFh2osoEjUhpL22gp
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index c84911a98fc..259a24fe24a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,7 +1238,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0

