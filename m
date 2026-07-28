Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D14749E7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279488; cv=none; b=ThD/KuO1Jjrzc+w3pjFGMe99NXfe5Xw0GAgusv6s9eLn/Ri36So7pQmV+iomSgosCK7BtqRfswHdg8qgjZvjFck5HNI8ASnC4/E3ipl2ZdXxx1J6/iVMVPX7DRVXgq2sLe77vSu6hujsMcmgs/N1npBpg+tzUBdo+VzSOUYzb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279488; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyCVTMlTDaZmTWrqfUI/+f0xRKbHRQB/ADsshOcIRfyzQ+dej/8FLtYN2LBjwFnmeWQMYaF88AEwFGMRH/wHlUTlAcW6AXPMy+7BF7Q+FE0xtwk2gYtLk8KHbt3SRN0PCUm2WE833pm0Ptzl4ZpjUNTufqBgRfoZqYqnmbZPfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPfn6F/X; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPfn6F/X"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aca0f482e5so252609eaf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785279486; x=1785884286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=cPfn6F/XeGNh8VaSgyg4yYEgM9fBNHyGt4SsToqX7On/v//46Xe1OP8aeTRF3YiPH/
         udPRmvvGU30lbabXr7ncYXSeeEZ4a5/Nvu4bxIcEuVOvy3apmKFNY1rPlldTW6rT3wRi
         gXx9PkGCnYslURpzMdr7r+Gg/3q/DXaGD0uSKxCYh88oDamzYBepYk8VQOTg2p1iEoFZ
         bSpkEkXF6CRP8jRh5wqI4mRbPetWr+W6wGzpat37Mdz9pUHyOu9X2E1D1N86gnDBRrSL
         kPNPjU7ekS8JhpQLZFJ8tpqIGioBx958Tjx8SVKH9w2DN0u1nDVzeNzuUM6eG+aIz4Ru
         vPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279486; x=1785884286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=dEkX+wQlXrWwIkVRHNfsWawX2VBqFGRVH0hLQd4O69zr8jo+f3K5X7wkad+gn3Qpw3
         nIUbvGMPJpqZLQtqouXh1tKVNSTuYyQ8/IsdsC1UuM7cM7dYq6/3yqFzvqtMOc44AKX4
         6aGyZ/R+NUnLtBU4V/PacqX8Y/4+Z2i6GKTny58HRp1uDFNHO/zhyO05aFVCoW3CKxVY
         kt/Zlx1zn197A6c16FB7FSk/dBgX+Bw8yfaAoaIHrMeOpwjdrfEpk21/Mey2MsT+iiGi
         /OvyRhivhH21sxxs1vXn7npUQescaeTYPscLY2aDO3jJHeIa7vgEmh/UJOAWYxFM/SQ8
         5DuA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7XGsQ6v9SFbtjKJujdE/2FhTC+udQHq/cxRdyxRZFtIovxxUzymrApgtCXhadF9ozhsZ1cjYeNZ1d@vger.kernel.org
X-Gm-Message-State: AOJu0YzOX0AIrRxLFMqBcUKsU3xt55OyhNGK80f3tgI/TqDMDAGLpa78
	1UHmT0ej28FuHHFQv7RYn1xgt/I1T7Ig+qqs3KizI8AC3ZKkUVvnJE0Q
X-Gm-Gg: AR+sD11kyUa63McQcwbFgdX0DKkvq4MYPFAS0jiREki4TZb4I+zi67lOef6IwQZmZQy
	/GVontpLazO64nr2YS6OMTn0NwAQikvgy5hl9ehFYxoH3/FUiiXaWex0pvp2szOhEBBqPgRnrSH
	eVDjKYPdIkX3pjPPd4sXd/rROrSDjNMbaYZelq1QwmFaFPMU9D93eUb4eqT6INC5yb6nQnToczW
	0au+uwRZGWzLXqEMBE5sqbNem9BYXWKsDgqco+vTHIZmbJw6oR1YrcsS1HBsgSsNQ67AfqIGP+y
	Y9eWoZpFJK/F4aGWNDjQNge9w/71x56eDxDNvvp8uGUXzOPl2utZlQ1IzYmxrF28TbvBTUGmoBw
	Ibuq4vx4IsDVBWD7QkMzHFqbB/UrAF9f0X68SQT7cooXzlHK/VBXjLXWP+jiX0Ipn9Ph6EfSZEL
	yychvRjgsimviMB2QuLTAc5w==
X-Received: by 2002:a05:6820:818b:b0:6aa:f2f9:b3ee with SMTP id 006d021491bc7-6ac969c2ebcmr2480939eaf.6.1785279486135;
        Tue, 28 Jul 2026 15:58:06 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9162:e42b:cb94:2d55])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4588646ade0sm990277fac.5.2026.07.28.15.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:58:05 -0700 (PDT)
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
Subject: [PATCH V21 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix
Date: Tue, 28 Jul 2026 17:55:32 -0500
Message-ID: <20260728225542.174825-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728225542.174825-1-macroalpha82@gmail.com>
References: <20260728225542.174825-1-macroalpha82@gmail.com>
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

