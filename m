Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299659;
	b=nwsEH4/A6wSA0u39hMMhyc1sTFoZpNolq9yuTt3MqcAhn2P+w1NMnEWBfvv22f0ZxGBE
	 pIRHd/KqPXzClmYFXUH17JV6apkcQFDliSF3O3h3OdGgydEiURR8Zayw/hbHLqQmMXqnG
	 odnc38u/y6rjWTr239B/+7FDraZ5LJZG4iApIL93H+4oWw1x/J4RvqK2De1Dvf5NWaL0c
	 uideyhE9SOk3xyUwGHyENPRjCTJ7zy2ViRcaBJhald7jOWWj1dX4Vjo32dAv2MmRC2d8Y
	 N8LkwhDeDoaCBMHU0bGb1dNjOjzhu8vuBbNv+tIvGSww9dEuisfzSXOj1Xc1CsSh7xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=orTulyfNq0+0uRowLWANxVmtatobrw6CLjIKrnYf+2poF3FzZGYj414RJxw4cZVafjGC
	 JBq+PbgjdZTg0Y9S+bqZhPV8sDVEevIhD8RA5BF2uKkBg9TttjQvCNmP9fGB3nYVwofA5
	 w4zvN8PL8GKST+wnsGqsf2BTiu0h/loAITHnvGVVjwgsuq0MCMpOeWdpv0WYyN/c2y/c3
	 zaPsUxxiu4v7FpRpTIJaI8XbJYvLgGby4SAI2mGHrqiP9EoHntNcDbyayibJH4BZ8MtFK
	 LvYxGv6d6mHaSlGsjQguU38HOQM0cxl+BRsKvSlfj1YwlDN0NbkmZmGWgQlVzWSsXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXQJRQj9;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B3060A262C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B3060A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hXQJRQj9
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6dd4f3f696aso1363305eaf.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299658; x=1793904458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=hXQJRQj9rDCCM54LxLJ0O0GcaUqZZ1vbaf5ccd7XzTXCcm8o5nGy6Yj3i6MRM2zDbs
         Tt/NJX9+NBWqKZlukA/OBfyPR9mRBJOoBoljBFdXLsS9JPCZLf1a9mTy1FHcgcPrTbqa
         TQSEbJo3AD7U3WXbfzRQmvfJ0g5CSN2ixjJPG7nxPDJ7fhItwAHIZqA2ZQW1hKQ97XyJ
         PsQIKLyCbU85mm7xGRHOsZruQYUjZJk/rFe3agJ9uS3l+4VtC+BFK1RP1lx0KdiQGpR6
         SYDXeEH6YhKijleqGgsdlQs6Xh1Icotrg14Ukr6vyk33OZiok526+TaFA4MegRsvIjma
         +gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299658; x=1793904458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=J/QSpsbGXU4IPACoPHoSe3iHE2fpCGXsmm7u/1Ssm6oSHo7pRDS6nX0SBmes3ue4xQ
         rVwVv0PHk+rX/wqAey4UQINPB7YCsLRihLZChKZ6ekWUydRtdpscThX1A8KM+BQFG+UA
         BAikV8dqhXCEFn6q8ZrkrkMxtDIwKQPv79Mt70w0fpjCsHb1XJzkq4mvTGhcikz+NhBJ
         +vRMoC7H7xsaxK+qM9AMMTdM77WCLVn1KpP6ISKy4M/mtfQsCl+ahC3ssWrgm5EtM/hA
         AglJ1K478P1+VKuOB0Fa+WjcVVUAnHCrRXvoRO7+G511zJaNg9AA4+CxKkuzt1p1/j8x
         kHbg==
X-Forwarded-Encrypted: i=1; AKwUvBwoTuKduJ+aXao0qcuG6uVaHIrWkJnVx+af0n9cDl9rF+yQLM5e2nvcFebKzpdLi9Oh0GEX5PTdSUmm@vger.kernel.org
X-Gm-Message-State: AFq9FYIW4mizcdFHsg7r0Uf4UGC5ChzgVuqxg6dX0yzgif6p6fJlDjZi
	BCIJNFPBZqQ34sEV1xuEnM6xEaxCdRAtzkQLoOp4QUIQq36iVu+/wU9d
X-Gm-Gg: AYBFou2T+3fMpQ1g30UjFjQACa462zpDO+3HNSCbVhIxbwqoVENoPavMfd8QhdC1v/x
	fInxKaeoyXwRyHxTOFYbsKFLawKcM5LvvCGL5ho7jlM+zKCXerXoIQo1TmHZ2zYp0/+47LrBjYz
	n6DfYf0PwJXT0LqEY0WBDYL6bSVCwegpfBaVBJDBQ/mLgZvChtTsuh7q2rsk7ghWn3auNGtJYbN
	QX3iaHghSBEMzTDGyu1Ggmbb8KnZ+AjXQgg1Z7Qj/YlhL4a9ULnIkakiHTVpbfRC+kInSKf/wFV
	nSS80nzq+rpCuKP7AVe4XgntgeD1RfXZboIyx8F9qZ91Un9PtFbwHkDZ2F+gpkLfW5VQi4MwYrL
	7w/mqstnTXzzNzmYDjDredAuxazY/jsZODvMN4GDEIGnkBeOusz2gYev11rnMkVJYmdIEBi5Ldn
	XzZWKwlJsE+Yiop/ntHitFDb0EzOcf+NyuGSqU1JyoEEkJnNyXNQq5G+U04CayL5CJTVo5rDeCZ
	0T+E7QPFrYMuvMGh3/aaWO1FUDDMa/+RKjjbH2wq3NHyt6qZClcE6lukSvIMZvXNx1hFEdnbgc+
	sEPb4qONRsKhhTVJq1znEpz1YK2SAdIc/LQKNyiIHBhd+rhvynu3kL6B5MeTltoTQ91ymFt+7RO
	dAxmASicUxkX+wf1OmSu96sbgPUFH52WW9p63kDbnD9L4i3f+MRyJ7XijFG8BC2N2TdpK82HkER
	4ko9rX232w5tq8sLsznam7NOr7mDDuBvt/WS5htaoCj9zFSYy5rLS8tPVl/7Dc1/Qv99RGEWgR
X-Received: by 2002:a05:6820:c44b:10b0:70e:1dd8:6712 with SMTP id 006d021491bc7-714f29f3ee8mr66212eaf.72.1793299658351;
        Thu, 29 Oct 2026 11:47:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:26 -0600
Subject: [PATCH v5 5/8] arm64: dts: allwinner: h616: describe the UART
 integration
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-5-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the H616 UART integration on each of the six controllers. The
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

