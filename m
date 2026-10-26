Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036681;
	b=qAHTTmPO143SFGQoM+iHbSrx5gJ+RiJLUR01TXxIkCPoVB6IwqIBh7fAD3BZ/qjvJpK8
	 lFEY3WgxMURIp8vjihwX1b56kRlRlhwvLVp0uWM4btyZtgyFRqcnbVgip9XaC3X0XI1dc
	 eiCHsLH8dxnDscQfJ77dtVls6RCKIqhzQfCpCQPrlBsBT8W6NEN49H5bJ6aSkw9bV5di1
	 cQqXZPyuqiuxMiY7vrLYRGltWAAzX7D/u17OqeRkZCJt6gwEJYmoWtNRfkMTaF7eLqGzW
	 4k4rQTuWV0zUlbjH2CyLBGpCOMT/vVzgfqgjGCWTR71iBdQ251cq/5UzUbIVHrvmy3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
	b=x+mx7lzpHAp1zVc4+1yWlIg4iyWL5KvfP7Sho0pANjDxdB4PGfGGjzTVc16GCAz3WmIQ
	 NPhSlBMVKk+WZ8mBiSMjihFgkgw3tHDBeL29efctGAYFkAl560nbD+tu9Ss4P7ILKXzXW
	 i3H7SbKlvyV3wxvtSlsPgV4HXwSIiNiOFLpW2ub7uMOrIvoN7ykUuboEoDIMUAey2zwje
	 FeKAJtvG8tsJwDV+xXfevl+YePsWqa23DQwfqAcCqJszmJVP8UBy5CMJDGuq8kFEU+am4
	 dyH3v7VNGYB8B9DVjx1+LlxC1zxJYnnuj64NDSqc5KuOSDnhtx0litWKJaOy7UlT9Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mswin.me;
	spf=none smtp.mailfrom=mswin.me;
	dkim=pass header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=L8E5XqA6;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FD606A328
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504FD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=L8E5XqA6
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4697404c2bso421259566b.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1793036680; x=1793641480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
        b=L8E5XqA6Tqzxzv5x+x3Dnt/A7KPA1+eFip+NQx04KhL6C2dStKFQf8ld29c5xMK85c
         HiIGJx+dO+lPi5qreXNsifCsc+BQaLcL/U9MYK7FV/DNzeJYAJnHYRztxN2Wns5cfLJN
         Fd3hX293ZhuHlLBFZY2Or4chX0tVIgcEykewJFRKVzhX9SeyxGIAuwK2ArvLos6ryo4t
         EP5bMzSifgq7ShQPG6eVE8cJoM02VumKLSRxxaCUObgQej9ox6C1Fnp1VwnsqEe/Ievh
         oMCY9pIt3nAHEWRF0LJx0TCO9asKtk6+4CNp83eGh3wlNc94zDh5mV/5jS9hyxTDUx9c
         fEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036680; x=1793641480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
        b=ipISNIcXQG7QkI4aVpJ2Uznq3Eko7Z5J679mUas4UsOw6VJFWr8zfYoF3SQh41GZQH
         tyZUMoj+SRGBdGrvxf0mrp8GV4dqs4dbkhjstfeBAIcR08eo5Cu1Vkl+bpH0CBRwivVy
         lk0vDPv6eFQe2sF+y39/Cr9agbpcnMpqZi50emEbEqKrIZf2I16ZqpHURLgtvFYZ3+Ic
         YLB+j5balu6MoLSBIoTWRpThc3Rn7aM+OB+F1gp0FQAx3fDO0mvFIsuwm+0dwz5B+xd2
         GjdMaU/uMRt2TSuz0Ty0STEMETjr/lg6RSSbQWm1mcv7v9+aFsYsJAci5BKlx/ymE8I0
         bNHA==
X-Forwarded-Encrypted: i=1; AKwUvBxP8XQ3C0pdcA4fGiRc+VpSu6O0pzMLNeNzc+D1Lq39kNqRy48ql4oYYaRMeYjutgjusU6Ws6cQhydg@vger.kernel.org
X-Gm-Message-State: AFq9FYKyafX7HsaNaq28mTGSsyb2kuCNjAiD/2HC1VaSbrZGzQMyJVge
	aNEde3LM2WHroaVxXiFE3JAx7rUYV8UtPa5tUC3IeJqDzqCIH/X8JnuQk+DpYl7mj30=
X-Gm-Gg: AYBFou3IS6/Y9TygAJVtseLDqtBwdKSwENj4axeMjC3PwbRX0MgJeOG35VJ/B0Kdtye
	e2KzBvF5po4vaB41YJgJTai2xZj6WLz0nMeKFokEzKK1lqNhYB6CzVQWTLoKGRBtkMaggzvavxC
	lt8OeyV9/V7CXgvIEy+cXd8UxJhLjbawYr6C8KbqMFx5/mGJJr9pD9l2qFWfJUgDLpChDXG179W
	yhfhEX8CbmexJE6YecF1lzzwuWFK/TxWw/f4Xs2aTxkOhTMLY/PATiF5tD86ZdG2OqNmz0RwOCB
	626KfZWHfLWBpwsKl5lM8YKfFJbPjdK/5L0/CuEfVNLZYlwdRXFx9Ix0uxCs/dNlHg2evuLr1TM
	MyAe+4+EfoCggXfJYHXeSbh2Ti7vNPXZIFkSoIrpkyDmcapvYWMiLrmW4Vwehq8nqfh20UMNtYa
	vDK98UBc5SOjm//hNH2rsnL72vYkmLrm7Wu0gQbFxTL3hPGnkdF0WM/TScZN5QySuOTwGmnbU+a
	fNAxNgyRnfCaLdNDkcsCAjgyUC8gVdeC3KhcN66ubwt+P04dbzwItdNwvkuj1A=
X-Received: by 2002:a17:907:d16:b0:c46:9ca9:f522 with SMTP id a640c23a62f3a-c46bde42195mr863150266b.26.1793036679205;
        Mon, 26 Oct 2026 10:44:39 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([95.135.208.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm346004566b.31.2026.10.26.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:44:38 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	barnabas.czeman@mainlining.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: sm6125: enlarge reserved_mem1
Date: Mon, 26 Oct 2026 20:44:36 +0300
Message-ID: <20261026174436.305327-1-admin@mswin.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260824155535.335494-1-admin@mswin.me>
References: <20260821032541.1856299-1-admin@mswin.me> <20260824155535.335494-1-admin@mswin.me>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reserved_mem1@46200000 is sized 0x2d00000 (45 MiB) in the SoC dtsi, so it
ends at 0x48f00000, while camera_mem begins at 0x4ab00000. The reference
firmware memory map for sm6125 reserves 0x4900000 (73 MiB) at this base,
ending exactly where camera_mem starts, so the 28 MiB in between belongs to
firmware and not to the kernel. The dtsi nevertheless leaves that span as
normal System RAM and hands it to the page allocator.

Every sm6125 board inherits this reservation and none of them overrides it
or places another region in the gap, so size it for the firmware map in the
common dtsi.

On laurel-sprout the mismatch is observable: page-cache pressure eventually
reaches the span, and a store into it never completes, which hard-locks the
machine. Before this change the board wedged at roughly one lockup per
59 MiB of buffered reads; after enlarging the region the same workload ran
691 GiB of buffered reads with no lockups. Booting with CONFIG_MEMTEST=y
and memtest=1 sweeps 17 free ranges with no bad ranges reported and skips
0x46200000..0x4ab00000 entirely, confirming the carveout is out of the page
allocator's pool.

The downstream laurel_sprout device tree describes the same base as
removed_region@46200000 with a size of 0x4900000, so the reserved bytes are
not a new claim about this hardware family.

Signed-off-by: Roman Linev <admin@mswin.me>
---
Changes in v3 (from Konrad's review of v2):
 - Move the reservation into the common SoC dtsi, as the size follows the
   reference firmware map and applies to every sm6125 board. The v2
   board-level &reserved_mem1 override is dropped; v3 touches no board file.
 - State that no sm6125 board overrides this region or places another region
   in 0x48f00000..0x4ab00000, and that all four affected boards build with
   the enlarged span ending exactly at camera_mem.

v2: https://lore.kernel.org/r/20260824155535.335494-1-admin@mswin.me
v1: https://lore.kernel.org/r/20260821032541.1856299-1-admin@mswin.me

---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 86de156..fb126db 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -282,7 +282,7 @@ smem_mem: memory@46000000 {
 		};
 
 		reserved_mem1: memory@46200000 {
-			reg = <0x0 0x46200000 0x0 0x2d00000>;
+			reg = <0x0 0x46200000 0x0 0x4900000>;
 			no-map;
 		};
 
