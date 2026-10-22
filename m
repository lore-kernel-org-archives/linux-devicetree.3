Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627742;
	b=xfPz6pXzwT5AkUukFG3IAQgZvjxL4W/9zg1guY4ObtPghUJjDYbbJAfsYvhrp2UQagBz
	 7+V5h4TVIhZG+DykXRHCmQiTrFjwOxbV+HElt1gtaQCQjlIWzyElj4dMnUakcS6ivLnQc
	 UQkDCutwa8UUCYyAc27EGbOW4fU2dZ5m5JGy3vy7tbjd73OBje/u+h9InWk0YfW9MHttr
	 S+ixJE9iNfw4hW7WobssYvBkc36Qm0I4GMWgzrmh9YVIrncHPyagdaLv7SzyXhF5La8hu
	 bKnq4hdCmmMZqiTP7qPLTLMLF8SiZpFbH08x0k9dpdXvvJIYIcpNDHc9mTL1diBIPvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
	b=PxtAycQIUCbQyEg+aAPyuGsNBI8Hiji/ZSZRLoj1ug6JIHN6xco3++m/xWrpwZsaJvL8
	 EOVSX0lJ/rLO7lLJEiRKpFt3NEPeBZpLCBvu9UQLa3Aa7rsTf0BbYtJtCEnvjuV77YzFy
	 Jmp8Pmw1dLRR6EKkXmb6Ne+qq64Vuanc0RhpEh/SFJrM8mNTu74H0Bbmqs9i66itY5Gi1
	 qPwMtMiOOe5F9Eo6pGnPvR6TWJehS5NNd0QnmimfjRO3ZplvynKq9GP+7KTRCoCxAr/up
	 qbC267ND6YXxTOr/5vXwjm6T2eyxFcXRDugpxVLEnbuwq7d8ACVhOt+C/jempaoD76w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reit0VCT;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D46606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 00:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D46606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reit0VCT
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de1ca1b05aso858657eaf.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627740; x=1793232540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=reit0VCTG1Vpg4NoFYSmvQilri9kwFU34qIWBGtDhxaDbLaupjp78sIDf4v521V2c/
         dA8K5BiKMLZ7K9OlRoCXWicPEy60LgNasURMqTeLrKqeZz6ZEZG1agJMpVTBxU1LecWo
         tSLxha4OrV/m1JltHLUqvtDlnEx5HGApgiBoHlKBDwnhZybyL298+SL7u+aSod2AkGA6
         nmO6P0jTxxawP8GybM9VR4GIBB33nE051NufgnU118U8sPcqY9Ai9Eia3zzIua28+E5z
         /JHXFVE9lFER/C3LXp8FpXf6BSNs7zjM0B6E2M8IydE2islhD8PFfqtnMIFqvuaSYd7C
         ZE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627740; x=1793232540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=emmETIkHVf7m2W3rxM0NULiGihcPZS/n3MlIUHaGvq9urG5IINMos5RYx2og92qhCJ
         szGEonjZkQX6ohpzOLXYImLjST2T2ComKwyIT5unifN9YU5IJBSD/ePxmPFXc/I28g7o
         97liURS0rBMvIk9wGy+FFooT3PKEBTqpzWSFrWyaYQbT2OoD+2P0RHeuFClOM09y67Pb
         fTVrWS+4hBLAYVDLW9HZYKpSXbQAM8wnFSGi7T9pCI19FOsI4JSck/a84Jg/Qj2nA8Gs
         9cXkCKzKD6lg8GjbmcT09DlhMuQghjzYEt/pfdrNHA5n7IpHJqEOnkjhnOo8ZHBJWvtf
         Nobw==
X-Forwarded-Encrypted: i=1; AKwUvBztpwZ83AO1gOBb6Pc9TIUmfLnlIs7Amj6wKwZkfGHMP77mCOTZesyKCGrLCyCS31NtZNDZvF7jM+PC@vger.kernel.org
X-Gm-Message-State: AFq9FYLJwoGLGaSsd4fRNSW1PKRf6K3Pzi2AjTQ2CMpmRT6/A/YcaIH6
	XuY9Kvmr8+e2WtlRmC22IPMa7Z1nYbYev8WUfNsP42y4tKqjH3oXpQ7H
X-Gm-Gg: AYBFou3Q8//BCLhV2xoH9LZs7k/eVoqNjeEr7gl8o0JUPGQ09I7eVVY8klRMfh3kton
	hgwt8qTcBaBcqmr6jcX8NMiEQxCiOUrxvhsmIo6d3qSJMnqgDKcRhgQp2s18kdG68lzHLJsj8I8
	yIxfykymlW5CRQgjireQ2jstMo3yEb5A676PzHrrOS7jm2zSvYooQRb8zT4yEvFbSZwpPxVyYXx
	kA9O0Kro1F9Wa5lt8+JOqtC6u6KhigE7/89lAr0MdPBJ4icaCfFzphRVhjvOpMPjd8otjRBGqLj
	OLCo2knnD1dEDQAb9xO6FgAggSWZRMKWLvhfKAdR6/u0hBUinD24scdyM5lyn799uWjDvaMShgk
	O/d7zZ7hragNqRHzGiraDSjGTnNACfu2JjXFdFmgubD1XKcppQ8Lxxlj9EjSMHcj+nTU4YXyc+J
	fxtt+lAxaCEi2yjump+OAGt2LG1ESsenNXPc72BtjPCihguIywF8Inanb8qYPzJ4bUTF6TLXGf5
	kl8hph4buP3/4XAtSnwNW4oMuzEtOWW7+fBgxNF74kP1JjKlSFzBYoqt7cpgu8pzlt9y1tuVEoO
	G4yTUqnee0ajeH3d3k/EaN3C/pEkxRln0NGPbf/Xrg3n2UMPW2sRI0V2WrLarhWgdkNJPNuUWrq
	yODs8J9dAzezF1HJ2fBx9GjuxstjW+YQ5cdRRvqlMJJ0HXZyPTtWFqA4Biyr8PFNARQ/k9gRyO5
	OU
X-Received: by 2002:a05:6820:1994:b0:702:ebe6:8009 with SMTP id 006d021491bc7-70941a50572mr2245317eaf.89.1792627739394;
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:55 -0600
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
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
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

UARTs use APB2 as their baud clock. Expose its existing clock ID so device
trees can describe it separately from the per-port bus gate. Keep the
existing clock numbering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6889405f9fec..e3318772c92d 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -11,6 +11,7 @@
 #define CLK_CPUX		21
 
 #define CLK_APB1		26
+#define CLK_APB2		27
 
 #define CLK_DE			29
 #define CLK_BUS_DE		30

-- 
2.53.0

