Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748948;
	b=cbg7WFnouLycI71+jCryr1Su/CqF+/ZPbQdAeRBBOQpH31d76B7BPoGMUtCJyJtli62D
	 WupE62EfSOR6X2rxwKkYPLBOqNL9BTPvlcBbQfZbjAzcM5ZpJkiIYHkh3LG5nmaIHVUPq
	 wmCMyBUf56C/j5NsWkWr/o4DP0jSliNSVDIUioQQBKUZfKisTEStsKLqPxPD2lJbKHw+Y
	 yVVVwXtns8NlPeU04brYpdw9OUwGT8dTNS4R+Aw+KucuX77ALV40P8CDCC9VLB4rDB5UT
	 AZ4sJbebVlYcQ2AvlYhXdUHAVkl/mB25oJBIe4zM23cqH8qfj5RKSzIQgljuLezcgMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
	b=BuJx1eEJcGyHodsaBf2R/+fNclgsk4f78XUagZJ6Bqr4E3i2UNUpSfGQhJoY+lhOTKhS
	 mOGNV5GTW4A8na501fGba6fw/9ql02CX7F9x+Hu6fx7hsO8nDKXPq4CZNPNH7bzGiX77+
	 T/vFZ4bRvA+XyUdLgBh+dRY1w5VbdLZp77QiK+d7L0eZj4DV9ElA0h1fnLMfdnbwMBR/S
	 ikAwoLTKcT4sZQi1ctHZDDknh2hUlfbreKu0Y4ELaXmp8HfrvyJmEMhIAAMVNkPRMqhSI
	 bQtkDTeX/QgLI1U5pYCysHwV2XZq4+wlNSQQmSGc2RJCu5iYUZvet5NUnbuARQQtPtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkfYjDfb;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12169606A890
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12169606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkfYjDfb
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e47347279so999188f8f.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748946; x=1795353746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=fkfYjDfbVwOUPmPIcmRVRviCwS9ifEc92SQIdBZr9pS5uY45k0F3v+tkmY5NoS/k/a
         MmJHT9w1FkMmtoeFXJssFHnqRY2+56WuYvLRNvqM3WDLIZmd8Z+3s0RUJB4SqDYL0M7f
         VHBIYIkvifEwrjZK/ivGbIOHcpJBoRe+mWul4z4/7a3SBd3m34k2AM9n88liiR0Q0m7L
         VSskSpvfQtIBCriOyYHOcOCP2qvMvuF297l78meqpppVmTZWEZkHuZzBET/ZUrJsooE7
         Ea0MfWmLxt8Ento0PGdtDvAkiNx2k+PU1dvqhS2VJV9Gmp18509rlF5DqcycVtB4f3xj
         WqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748946; x=1795353746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=AOpZVsmngwKpI1YsYWbW5aG21p/0rQSIt5ppGOSk4+xRRDFsh1sobySdSshQSetGkJ
         Thf1cJ34O4zIkaXXuuvSjqaxxiIqC8REFKPzPdoxPTiD41XWrqdz4EtMHLWekIwqdQoN
         F09GyKiNkYxEnWuY/RbUeJ2Duni4VLCKcUXTkv5rQwwN4JdvE2Idt68J8G/CvhH42kh4
         H44b7H5/qvxH4HSd7fkAB+mvPF8QTkbVdu4jr+u6FIGUb4l5G/59kkGtHohEoegCCdW0
         jRiYuVOdyb24erzG5SkCI5kHTcA7MGI+RMa9/09QM5aQOpnPzUjxUImlLNtvE/G54mUL
         l+bw==
X-Gm-Message-State: APuU4Z+vq++3yoa5wk65i88rHib/1UK/8ucz8bPtQ6mjcoFx8tiDyd+b
	H43VNLE836EsxjkVRyvNtkZ0BfG4uxj0OV/UCGTXWNP8gY3FJUu87SMdDNe3TukC
X-Gm-Gg: AYBFou2PbkJUU+62nJjplWitswuM7v1YWLBOkXN0z0OANP5xAq+8njFeMBauU3uwxRu
	Cm7Ev3qzEf+F8r4NZ9WZ4nU9Q0FQxIIWn03wVn6FelX82RC5sYSZKkKKJbI4ENMN1A65GgAONFi
	qVDFLSpvPCqPoPj5Fe1GSzXeQ4/ubj8qmG3uT6cpghBjVUosWvrIYkDvKaGJOoMIENGVVv6GFEE
	3GPXE66HcBfx9e2PUx3T4a0j4GCjU9ic8xUsWbEbv0R+deIMMLJqfU+Cuz7HNjW09ojep3ruvYC
	gJt3m/QVEFAkCcx2c+UomUJtMrIwZtdWYXlqZvxBRe0V6OOPxkGQZRk1Q3uZDkUKtRO12gssXWz
	6Gkhd/YzxhUoTOpLrGbUNPdyo2kjtLJY26aZ7KJ5A0Arl+JpuZXRk2wVT3SJoHdTnizE8k5vz6c
	N3jnA8ge1ENIT2iKarWMviOxoFjUes+978nnWjnvPqhNeZmRC5igoo5qpZkANL/TkxLverfFj09
	XW4aIXh4pmsSgX4fDEyThQyKbqwCze+6VoDj4GDi8fM0NiHFVRDlA74j8e9KLFh/T3WivJ4J+EP
	w3THAcxCuxq6jAb+nYfnd4vzAdfJyj3TSfPJtp97Z3eAs8M0906Zr7sgOJLCZ1nQoB2tbFbYS1p
	0GSgNcXqZgn2A9HaCHEb2rx4LUf+0gf1YQrEhidnOfcVhfzWVY6OUpPGLsOY/rvooYwi9s8/A7j
	8QGpJW04oGeTwt31PsKxCsaNuB58RZNK9zu5CrYx6jxCybaZqFGdokT9B1FWaB9oujAygZmCiq8
	chHwSU5Q6Wl7Q==
X-Received: by 2002:a05:6000:4b02:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-49c6dbfff8fmr15902097f8f.8.1794748946344;
        Sun, 15 Nov 2026 05:22:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Sun, 15 Nov 2026 14:22:14 +0100
Message-ID: <20261115132215.289236-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 40c5c42b347e..a2a2e4cb0256 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0

