Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D523FC5AF
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782490496; cv=none; b=cTA7jkXRZS02Oq979ouQOGb4YWAEhRfwE9M/to6Z12ELMLXyem4uNxty/Isr28ni8vtHsvfdLe331yRMlREXe0XtftSSQw+UbpR9T6VBN89AUu2A9T8QZZ9I7MOz4ETO56d25rLAlL23852LmvZj4ytY0+m8tlmhZgxG5apttWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782490496; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gH8Z5W7yRk5cNwv08QolACHWMVju5hWNgOWVWjviJQPDCD+8p6Gj3bdJp3b47y62piXyFBqI7ZSccz7SQVk9ewanZb4XTc/IOrBatMWqksuIvH05y3VtYLbI9C3EWD+SltgmxElUTSgJOjQRqbP/VRp62xlmf1D2zAwDxXHgCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwDcyTsa; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwDcyTsa"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9565cc13aso379495a34.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782490494; x=1783095294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=kwDcyTsa8B1IcVYILAhM6lbaMoB7zMZ3olKLM6qA0HiFjULeHQUv9hD61W/jBDQip4
         gxj25WJt5/NXpLUmCoMKDFUwF+vYKexw/Gc697DCzegyxqozmffaXgjEY82rmtlCKCQ+
         L6NppCNZ6GuQSioKS1ZzaFe3myz+iOSR/pqCOLcg1YQoPURf+obhVKqNJz003ncPpUcO
         jadlKeqP0ex5iFTKegoB/9eThRvi1lqOFcr3mE0T5/uvSVtRR17wq5TIysBzL9tCPRRL
         2VSqIw3Ds6UqjxFWgkR+EVeguN6lJaED/AdMD8fFf2BPMWvi7pf9i4NIYMgcA0E+iOGv
         HKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782490494; x=1783095294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=jdrVU62cYFlpfDzJET1v/taG6zfSY1rFL3bpIEbz4TnW7Ornd+h7tlQkvsjEQgeL+E
         p1mBwvmOnRBI6gkL45x4Ajp0UR84j1KTNpYqP3xL8YaPLTSVFrYZjw6G+4/4Jz8ifNIU
         N3ilFxBZlOwxvtuDoGjrXXj9RE0/NlGhO0QHiwYbM44uhfRTg2SovAYU+s2VcIfYq6lE
         UqlnGHGk38AonxjNYxIgRef1Eu8CaaLdDctXqg/VDQ6acH+XW4uvqGk6/jBj1OVySDbS
         WWkHR32LbqScnIfKKO3BF4HS1l8tDgSUvsu0Czvuw9HUmP0XbtR32tfGHOczmzzD5Dx9
         VGDA==
X-Forwarded-Encrypted: i=1; AFNElJ9goCtcML9L7vveNdSBVSe4ZRaRvO9QFSwA64amtALpICtAF47kIEX5juDHtHu7X5shneGQKfxC1uHm@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ1TcslAvduyfN26PEMiY8b+BxPy+001i8rrAYqFr1V38XSyXx
	Q+1qJRvjXnZ9EHtZPFuv2MxnewMUNow1PL3Qn4ePOyqTiSZqk8ufo3mVWYcUeYxg
X-Gm-Gg: AfdE7cmTB+f2rVBA6ioBvmcEB+YNGySYWzV2zty60DglBvqS/rH0MVca2/GVRnJ6Evp
	FLlqkYNBoxWK+oyE3WJw2gSVmD8CQiQLlkorfIHYI3LMDzxN2R3/OrSmeRvdHm+OVp1tzIP+kNl
	ApvRYNMiKeU63kPzPgcb8aPrAa/LXbJ/l/9MQcZbl0ik9MlnsbyppGvANEueTDq+ZHXBleH8uJF
	NPgrnf7hQbBeoZBjB+hH3+ucJiPw46xN2a3g1ZOz1ohpG0S0Mtrhn1rtaeadYVttBYVKM0X4LHa
	oUW44/1Q5/02zabUNuht0i70v1g+KSxWKMDVPIbM/QAtKuoa1kUk6Kpx06Oh4mZmc1fRNteiQL0
	44dw1QQYH4I7JvdqmUpYVaa20qZJ+V1ZML4WF7WB+DeOYaz5wk2ws/oR8W7y2TeoXMs4v+Fe8Rk
	PU/EcofeBoGGpGgAasMknwDA==
X-Received: by 2002:a05:6830:6619:b0:7e9:b4cf:683f with SMTP id 46e09a7af769-7e9b4cf6aaamr670407a34.31.1782490494196;
        Fri, 26 Jun 2026 09:14:54 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa579235sm1970211a34.1.2026.06.26.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:14:53 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V15 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix
Date: Fri, 26 Jun 2026 11:12:22 -0500
Message-ID: <20260626161230.93069-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626161230.93069-1-macroalpha82@gmail.com>
References: <20260626161230.93069-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..9b2af104f186 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

