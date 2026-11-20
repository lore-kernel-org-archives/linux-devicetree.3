Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171707;
	b=Lk2idaGQVxYsjAaaIZSbKfQUfBv9GZTaa+22CAMd/VnaH977AAhCApE86tHnS1CvIoPo
	 O5wkk+c7tUOPe2CHabx4EKXhqdEby2ojk11Hna4dYuLkEDwtbitOavVQCIrQGuqSW3eTv
	 fYrJ0rcHEHj8VtjHh7/BmLfojE4O0ul6ZoGtlVqbMQTyEBNKBDAhejrpmvk9A3rrpEK4r
	 9vIMMc8mQOn1GbKqioLiTdX1UioA+nLsuLpFjWyp4BiBrr2hxNtOkV39F471iOt0lmnKG
	 XV2O4HMw6hVifla4NmrEsPJszeXebBmeFvzSw+wkL1zBaTjKlICRednWUUdebMqsqTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vHOMPFBnuW28mRa7isHb3MCchoH5mvXwIUScVxLLKUY=;
	b=lSQJGrIYYDMQJOE2b7nyr+d87mVeN/T1UVf8qFmn+XnMiWI6DnVSPsEYnnKSyS5qUvfD
	 oceX7dC1qXrSsATsamT55jMeeloVfiJu6mWEgA6PLl86LHDc7HybvtVMWsv6UHI9nzJKr
	 o0i2TTwMr+ukhPJdbnhqMxN5FVZgya4r/kUXHcvtqADv0MgFEA8b5gHXzXIBEMYlD8ACv
	 +L5gJNEBoHYg65afSg35PZ2Gl9v0xQAgHR0Ui+5fnbYk/TKj8EAx/yEeZre9Ytc2+P/vS
	 fyolgL/A1a84E+/5APdDBJ3wOsLcXDtA4QZ+iOGTCaOr8loR+cxmh3iwLGrCVESoXFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=74k4s5LP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65933606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65933606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=74k4s5LP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so4432125e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171706; x=1795776506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOMPFBnuW28mRa7isHb3MCchoH5mvXwIUScVxLLKUY=;
        b=74k4s5LPhJN563h5LO+RdS72jSQW2+UxWU8MWcSE3CUNT0l5lXpWRYk5n3KUE8X76O
         u0luJgWcTtT6y8GmKgJ497dnp4Yi4LFNfiYmj6DGCTzgxNDUAfXZLiwn02cbYFN9MTpU
         qmQLp4Nr8nw4uESPdmp5y/ZmRZj5Mhj+0hcJg1rcWSn685envkHlAuRGg9+PpETTzR1b
         q0zyUSmbpW3u0ix2ziaFVpNUsNQaiMwCDB5yVQaZkf3r6a/leYT2Vc1SFSZxAx83c/OK
         FEkL5fyuAFFzLFcFq8CWBcqKjHgdAgyDNMIgK/VYEfLLpKR1KPly+IXXN7SuHFwpmCsi
         enlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171706; x=1795776506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOMPFBnuW28mRa7isHb3MCchoH5mvXwIUScVxLLKUY=;
        b=kVW0tnf0YUu4TmOTU9AvkReEEQbyAcPIBvWjopKnVfzB2dxz4Ci7ZAk9mYdKk8yEu9
         MLPJZQZYoomybLKkH6/e829oVX/EZ7V09U/mS8p7NSqEGfqxe7z+F7nU4BQtxIMgUpfp
         EFIlki5ynryNpErDU8jSBR5fNbDoKwYzcSvMCSeeM2L+mxVuFeMNAgLbeDODK814Q8Ta
         SVt1HrynASZMIxgY7DXdtsf7MwAG8g3OEFMKi3yqQD7H0jkAoBWBqmJzhR2oS9xQYKyz
         HZRH0sVT5SWHZWYTBPfnSDXP+UXiKEFzQ48YCODmVU/DICiuXWI8KTerhYjaHpZhTjjh
         Lw6Q==
X-Gm-Message-State: APuU4Z+vpXPz18LTrjvBscU7DV8gjyDUmmwFOfYOezmXDu2Us03bQyAX
	iIkfL1EezKei4zeBk/2NfpzuNjDHVY7ae5HUaa8Hd1DMwyHQFAQdKDprkhh8YuksB10=
X-Gm-Gg: AYBFou2Wvdb/2VI+OXT6TD2UEhvo8STKpMRGZZJ6KETmMW3zR8UzwFgGNWcUtbYn6NI
	kxF0R6hPUuHT/YJsgectYF5XRhK+xqT/EJTibkEzqthJsOnSy1sS4uOfxk6hZkbqvta0+JcDYTo
	Jn7a9ei28/kLL/H9Ohmlof3jA8gxKQvl/nbwKij88DFO43JR9U1e7fmlJHsmXqKFlHTO1LzWQRU
	U7jOauEi0S3DhSsfBK99uPkFJFJH2MNKIJ+VRc0V77P72qUvoU5tbYxOBQ2xn64Sq7+pLbsMjqZ
	0/XEKGoAoEQT8pTpLwk9HTjQY+ygDUiFQ6Z+bLkkzzRXqwH0xYLxt8Ycp++Y6P4zCps9J/xRn/M
	3IMuje9DCP3OVCNp1nu/2y8yEd2MerTVsrBflPK+saW7P7EnIHi9s8VeeYXgQpB1ksVvJmz0s1j
	6SHmQVWdA9IzuwE+3SdjbfwxzUU7TaklIi7/uxX5rbOle1qUOCP4wc3fCOPT/WfA4Rny5FLORq+
	vx5nQ9GXckZK0/wZc5+tKO1zBHrnfrr3ZiWoTjmO4TwLWOHrJGvsWATZVrRkx9n/wjQxtY4Uf9F
	84404bGJd1xjuK/1U3kI1FxwmoxKAlqq+4loIGRFt/OZ9m20PWUV+I5duwrMBOS/L4sEM7ESVaq
	sJBlX6xqL
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr60419825e9.34.1795171705813;
        Fri, 20 Nov 2026 02:48:25 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:25 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:12 +0400
Subject: [PATCH 4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5
 Ethernet PHYs
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-4-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=alchark@flipper.net;
 h=from:subject:message-id; bh=mpSxx4bNJlZdRiHhmqkwGoKjmGi2UpOvN6mAhYr+h88=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOZ22986VC2TrsfYesTwddY5Pl2m7E/WRlMcz3/8L
 Hon/5Jmx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMtW8jwv+D+z+mvzY4/XMlj+qo5foPYLQafoGdKslYrpx6bE5s9ZQojw6oj8hO
 ibt/mfDRDkWHXpCk/AsrXzJrwWoUjMahO8NbfUywA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Let the RTL8211F PHYs power down while no link partner is present
(Advanced Link Down Power Saving), which a PHY leaves disabled after
reset. Both PHYs are also strapped to stop their PLL in that state
(PLLOFF), so an unplugged port draws close to nothing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 778cb8181639..638e00b6e165 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -812,6 +812,7 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		realtek,aldps-enable;
 	};
 };
 
@@ -826,6 +827,7 @@ rgmii_phy1: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
+		realtek,aldps-enable;
 	};
 };
 

-- 
2.56.0

