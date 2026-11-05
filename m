Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874547;
	b=d1qiTuCAoCw6idaDpXM5myYuAHhZT1fFuV1GczolglmYTTlA/sv26TKYZ4MVraTtx0mR
	 2e86D7ijuWC/LWB6nT7oSd2WHVnbyBgLU+VgXB0yS9sXN/IsQf7/93Dvdi0zWQNiiyVZC
	 Acs8Lv6Y4bcwxCo5VroldmbjSQWM9PdAIjKyvsycPF48iRybzAErnym30Pnap3DkYKQFN
	 5l27Nu+KLKZq+ivmSPHjALNSWYwh0sDZPVLjrux6754ZWm4Xoi9U1uSDWUuyInWnfqfJV
	 REEZTQWEiwJ7cXcCq4MCF1+Z82d2CYFxuhayTObxLciak9EsEXPORt0V3C3RA/0cv6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=o/lR3U8T/i1VKLM4Q4fhQonZmdF/6V3j/NkCIzOSUTxku528PaYxLz7P/kRlSQ57Eukm
	 PGZbcauhXewRvgWTSiPAiEe961yt51+b/D36FqY5M0Ih5rYB45LMcYk8VTfSoVh2mQvLA
	 WI3hXsUKXFr8IDoEETM8d3vExgLu7uN+cmqzCDu4f3TPIW1BBIfYaFO33DihkE6o2L09G
	 061d9dPpY6LhtQ5iFZlz2ASz9eCdwfkeS1qfhjU5N4ExGkA3v5Ldal3hI5JbWtTlbhvsK
	 S55c+zFi9lbF37fiJmiN4ZAsGdq2361xYllT0Vfy6OWps+zW1ucvvljVCVWQ6JNRxMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="a/6um+d0";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BE606EE90
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6BE606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=a/6um+d0
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2712453a12.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874545; x=1794479345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=a/6um+d0uQTISqAYWjTSS9HtqKug8rg9E2rLH1wkEJ1y4a735hhrmhCOCiwFHxJ3nq
         A6zcqbb/g9Cvv42ERK/gzGNhSpFHNnP3IaxS8FusHfvgiVP5qUxfyDvsmsyN2dl8Wefu
         VckCYwBXoSy9paRds05qrzde8Csv1gyyZSxsRpcSxK9cAn0AAWc2SNpBRxBIuckufczm
         UqU4cZODqkx7b33OgQ6E/1hs7Blozqhb7/xi3/1GtZ9I8dS4qe8Z7m2EHgUxSLW4O6xA
         iqTHsyrS3gW5/HJxkGiV8JwkUV46y1WBvhA4S3tjiqgwztJPNW39oEQZKY0s7NRUH+rn
         Gs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874545; x=1794479345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=wy0iLBGWzzhllCOnPe7gjwuBc5KbMNb8OoosVGJIiJnI1Scsy8sL9ZiIvSf55G7WZN
         IZwHgAXnNpaz5j2PX0pq6BnmncpcIIXbLHxH4hIqZFhatpLO1Q8QnFQQhkpTZEvR4OKw
         o6AMUDIjp6oeum+9vtAaJW0LlAEjGckWt7d74uNDhybEkIxqcM/1nvpvk6bXKgI/2EqB
         4bfHJOr4fqSoz90eSUFbTIZEU5Bi+tsOCuqbDRSy0DiBYeY6jYg/4/jh/DOXD4lPENpB
         v5JD0+pgFoPQp8wwHW1/7ed1gqlypViP8aorj5xi0SPn3dmA/irFQ9t6ZH6Dldxlw0rk
         7sWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP4Ox93ypXkL9dcOIuTrSh1ZTUMsihZozmtPcwR/WRvhHipHTcHKhv4aRyF7KoNoXrJzlxxAv81XeL@vger.kernel.org
X-Gm-Message-State: APuU4Z+vfQGKTJFikIRiJ+zJPs2OXEJbgqS3qMPe6WE7LLLYoD/aEdOs
	DwLFgTbEHveb72pFUrseS4ZABoE8DzhY931gbekBkZURBznmTbMe+rXbUlmojx74Sps=
X-Gm-Gg: AYBFou1wLHXwbzRavQx3zUTRt4X67VtRsgJ8vhDqJmmSwwAyb1KWsNcypw0JAw6MzXl
	eO/J0d6Uv0EhfWhudPT2pDbXkmJ4bL2UFFuVeXxAgYvyaYKVnkOmSO/oL/JpdCMpzBDdVWRDRee
	qciKEskdmipUvivMSHHKtt9ozJBSyTiHnEj7U6vMRsDVRaGfEOyMPoecFTGV3S1izaG5AZDC0RY
	JCr6N+1SfY3CFYx1MFMNxbp70S7I+bebEjDHUwwLFGP5HpdHB9dZyv30OCp6pMQrX5GORVwYD72
	65BaXH3cEDu4zQOro5etyHgViiQZYfclGfp0EYSZRotx78zyGpDZixWmU+VyFmXXfGfmgXPT+cU
	H7URBrxZ9hXX/t0lNFVwMTrrJrpKrxfOvZaKGiUjCUT1xpZQ+P8+NquwazuAA6llX+zTjn1FZiK
	1ybZjW63Fe6Vd9Yk4Go9+s28vCg13yMZY33NhTARLOo5MxsFhDWXaV5EiG8dR1Mwrz422VFvKOk
	44PX7RL38CEXHXj5f7rFP0K9VREG00Y/0Ed5S2c0EKL34AVVtCHID07UldVwTQnI821XuX6WNi7
	MMBCr+0pYG+O+1SeS0SavNF94fp7oH1k7IHbvCuuV65s19y1wEiTnKrXglr2HGQtq1i1lrCBkFv
	YfRXz0FrcJd8=
X-Received: by 2002:a05:6402:2b96:b0:6b3:bca6:b480 with SMTP id 4fb4d7f45d1cf-6b4d65a8fb5mr13928684a12.44.1793874543883;
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:02 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
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
Message-Id: <20261105-b4-dw9800k_cleanup-v3-3-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=ijW9VPm7EHX86RDK200oj2lBmSMCAHlv42lvi+mFyiDqBGXFEZsOlxeuP2TZN1evalrtRLzuc
 zQ50VXLhpNbBVipwIcRAQN4VF/7J7Tb8Z9rXnYHls9BF6UrdAHwp2sx
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

