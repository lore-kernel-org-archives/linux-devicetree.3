Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294423;
	b=GdmBPsHE3zSvKQo3isDq+RcbUewkR0aMvBTZ8so26zgvIBUR7GQXKHoHtCx4mGYKrahH
	 J8Akcj1gpmzASBzQTRg4JjEdTURpZ9ymch4mK4PIw6KbKcBqV3loJ2Hl1x9FDS6Hm4Li9
	 bcvyDvH60+FivGvtBJC9PbeRNSej/vc5/NwguZnw7WjPeuGcnNeCgLjBnyIqJRhC091fU
	 5qUUvaRN+ZmthGRi+OPwSz+PEWms4xKBwfB4IyWyxjHEway1D/2S6BI3d06gYwbyv5zTl
	 g4TYUTOzXJcOfdLw+bqcIdEB4vH8phgSIqiuLqcJVDlL8h9WaT33Zo3SUJoiwBICDMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
	b=FQXhokLHs8BaL9H8/vts0LztxWGFRi9udlIdfwe3u/F8mpibJu/RPYk7puVBE5bmc6RN
	 6sf6XhPKzM7iUgSQ3CsNIK8Kvzu0rR3fzBViy57iVSzejSLD7XY2vLZGvsoMWkCxsle7O
	 SG5q7sFrOGbrgC3DGgP32WompmXDL+UbaQe0FKNBkEc1C1e1S7x1fv/WNLPFBDqG6vJA7
	 g3e8UNlGz8e10grvtVJovKH83TfKPFPxYuqf73YAm3n3ExxpfwHjQWxN1AQPjgDjUWMVu
	 5TmudYeYY2qUbcC0ZCFWPdyRWaujBLKSRs5UimZZJe0GLHp4zedhxU59BEYwJPojjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhaAaEfB;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32560A262B
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B32560A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhaAaEfB
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so668480a12.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294422; x=1794899222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=YhaAaEfBMqkZB+0+kqOLkFu3Xbj2X82jBIa1LXxTPlBEdGlO/dFnpCzU3C7tRpFkad
         IQDD1LkCDyDv36DcsX1U07i4SK1lTkiEbBUFV/iZlKXFiHgD85rK0WXV0+J5Wrzxw1PG
         BSN6UJW9CvXpYcXjIuqRuYrLFPewQU3HV398YzFazEXAelqV0Wi1pwgYUc7r198gkhq2
         gkG/R5JAfLCl1RE3e1n1RPZQnyhN2DMJwS6pQLJTxgQfHRY5SM7VvuIPnONRjmff4KBH
         dP8D6NiNgbueKR83PGPZJA4T9yFxlYWlwB2Uhx0ZPeBGqPo6bB8IRdNiC++4NdyWpoge
         4F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294422; x=1794899222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=n2rqixD02Plhgs+VzdfsTx3VEtTuMULmNlcZNuSmduExUrX25yuHDjbCLlvWRU2IHl
         u+yHIWGhnyV6eefvvOjAFGZnjf8NIXZqLqqQaxsLoVT3A5kkFuJEFgwL1NYMSnqWSEK2
         tEgAmJa/EbU+msERTAk19kM4VF3PRaQAwdxqDasBKZwKX23XLbsGD8U7xl/W1fXa9luA
         vTsxo41yxzTa/jereIiOTmRLcxygR5To4SRu2UL9S8upbAgwk8tkEGDk9MSADi7hq4i2
         Upti47VWkgnbyyd3MXCVb5/7a261YcjxDbP7xRnhcXBLxtl18L/3zbPm7KI5JjVNJnAl
         Msew==
X-Gm-Message-State: APuU4Z/2NdRck2+RaLBaObm7pptj8i0c3wPAXlBLsq/ruLeXBL8Y5VmQ
	KIUgM5SonSu1n5D5muL1dyp+N4A3zE2d3Wvb9gB46HXloQ397+SkwAsB
X-Gm-Gg: AYBFou1CawY686gN+rgyL5pMsWFqHk8cT5MFVpx28e1l2QFf9A6EYFg3X8p68AO867T
	sfWFlsCsAORHDoDIVzptoAHYrhQFu2ilHQJKS0viS68TxSNa09dN8BMFXFl9Sw+PVIQlY0lSAbf
	Sii0/RDFwIjyCZMb4rP3Mj4TYuO8JDMRC++V0cMsHTsLpQF6E1b6Db4V9dWgQ2QK0L8yMHD49bB
	wFMTXrJPFQYrLHP08Q3tsAMqFfbhecwNDr6EsIc1EZMeXwwEkOnzbC21lYaC5I0vptzrImji72s
	OAtG4OeX4sugOVXVabRvNCVXhPyho4l2GwKpX7ATB+FG+VQ3Ext+6v6kjDtVbxnlGCOhLLkpdwq
	toUtiYxd94Q5SxBYNxRWCf2EI1irq9I2Gq/1iJ0qDkXY7yC+cdCG6UTM6ikYAh8vz1EVyxKUk1W
	Jqg5BeMJlewyne2E8p3vNY9cZ69hc4b1OgwovcgSg+9VwW9wYmilKkQwwg4zCaNsmJxTkyYkqfs
	YYuQlg9K1ockMw3KemxBVm0HaE2HRYHhTkMwlxoPirTM50y4PXOGzj3ioUT6yqVe61VNCqDKtyA
	/KU960CE6rLnTh5/239cZEMYJ0hOsh9XUD+pKg7A7FPuYT0Q
X-Received: by 2002:a17:90b:5805:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b166c89a3dmr2067491a91.13.1794294421656;
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167715fd4sm2625930a91.11.2026.11.09.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on Huashan PI
Date: Tue, 10 Nov 2026 15:06:25 +0800
Message-ID: <20261110070627.217946-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

As current the DWC2 support role switch on CV18XX SoCs. Enable it
on Huashan PI.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index aedf79f47407..bf3d58c355c3 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,6 +88,8 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "host";
 	status = "okay";
 };
-- 
2.56.0

