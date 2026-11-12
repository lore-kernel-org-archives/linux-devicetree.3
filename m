Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490393;
	b=lVxV2GiLFh/FlyA54+OnHlV+cJB4Mk6kBcfggnC9srlyQp0eQBmUwAhkWYLPV46Fm5pP
	 6mVCZEgA6rXYZHtg0xr1eM7jdJCkG6ahL3b1huNrW76h23KaXxSC0LMXOtxSjTlE5VblT
	 SDKBEMoWXjJO0yYbrXV1aaTmZR87Shxt8R20Wi7iCw99YLbawjRTZODsxG59W7LMuQVz2
	 Qr+oTo+NsPmg50U5o9I6PBtRr1QlMyqRcc35Y7xdypoIR0fq0KDD4xh93f1FDRHG4Kw4t
	 GSg8yTiJR9K9BB/m32zXuj5BiGtOgkhuYTgd5ncmWkKkAuDV35ktceHxkZ29xhMqcGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
	b=wm//qirehzdfPK2CIBsIGytSqwVR6M631U7ZT+G2FobcwBecUAZ5CKqdItjN7UzoqiF5
	 HeKlSnu9rL00Z1QUUeoPEf+OxjBfkG0m9vnXr6lIKMr2z6j/ROPW2M8/mGq54Pq0FUIbX
	 ogFN24JPBwzXLUWtOaXNFDpBtdM3RB2gHzBzzmeztVwICvFoKEGr1xNOR55n8iOiJ0One
	 UBthJW7jGG5nTW7xNTbalSvU3qdVIjiMpxL9r2joNUFex56+cRoO1MY65z5aUNm0YVn5J
	 +m2zg4gCl4a938eyGDiz+wnOYyamp3UsQUSfasOPI07aSKf6frR4t3TMADBhRUMwHBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ib+38hIj;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278B606A338
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8278B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ib+38hIj
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so36148731fa.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490391; x=1795095191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
        b=Ib+38hIj0RFGoFOjrvPfYEyLa4R8naqV7ydkUoB7aq201lboVxR1gaVYnmJVl09jJU
         t2N540G5RK8oyUPQK+JKEaoOeo//uc4IZDL3DWy2+PNvgm4hgGSLFDtP1WaOT5wwbM+I
         dr1g2FfJgZdFzsgn77FGw+Jf6aven/M/Gvo22Xr99P6FD0ayzE+tHxUM3ynEK8foxkx0
         Oo++IVge9uKDYRb39qZj18a9e0mqxlc1VRINBgF8tceBnQjsZraz9OgJLX/srOOs8Ufi
         h+PPH3nK964dN1uUIMXPYmfWGao/Lp9Mjs+pIt/bCNfOuEo4HCoQ8FnfwjzbZq324y8z
         Kb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490391; x=1795095191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
        b=CbbAn+mehhH53jk6bp1uJeJAZnYhn9aRiN70h1Uy3Xh29mFA2C06HPxyGJj6qXKyzv
         wCeR9Zofgw5L2BFGF/9r9zq78nHbuagA4kvr39YObzz8cfs9z1PkilkmF7VikmhA4Kvy
         TyohJOrgvs7k07P7zv8SFN2RlBhUrEJ3wXdr5X7/RCvFyst3UPQ1/Dy0SEzNpP7j7v7A
         2sI1xMxj/5a6YvnltvyxIRUmE7RHbsqPG7z9qa9Y+2nXk2T1/PISF+xAHLXBPBTaMxrx
         JeCQk4QE0zVHuqvWKYkBzVMIZjw//T8QGD0rCjIIkDB1vbmVAxNo32XIlZC3MYzdU6T2
         Y9jA==
X-Forwarded-Encrypted: i=1; AL+hErEbXETeYhPA5xvnEDsohQBjhfEqXROErnDFIvqMIwkVwlFOC2oefTt32dLQIvwkeki2KsxypIUOWFJC@vger.kernel.org
X-Gm-Message-State: APuU4Z8ygOm7fcPMaem2JvhLMLdq1PWTM84HloFHXBRwHhE8eq68C8aQ
	1xHHtTog4SKV16maB2Qpn4mlejQPCL5XNfdSSY9Wymyc37ERKZbiSNwh
X-Gm-Gg: AYBFou3yWY55jlZ5t8nXcRGaGjgiOCqWLbD6eSaNDHqABJpB8m/irrOJeeTp37Rhxh8
	Ne42xvWUvQiQZhNDYrZZszcEYnqvR8DVKmNvAzmOTmoiu6sEDkUbgDAIHx0f27NQETeLALu6j1x
	DleZxeGbK0dQsgWMCqKw4wihp+EGJBpDqmJa4ui5MkuEKgF/c9vuvrvfuWUYUtkPzDZDW8d3T9t
	VZ2R++H2mUigCpSGgQhQ2JTotDFSAb+qYqAzaQnCsQdN1YoSqcqW0q0FBVmw6Uhv7mpdj4JDneG
	XzVbTxjHkaWXUVDmhWMmWuc3SOaF0T2zHcX2M4v9+Znf9oYFbAhLQnIPxfCyvm08d0HgZScorRs
	k5IRde4dYdtsGzYhXGDHS68/YqvBl06OlGpak6BuCJcQ1tSzDnJFHBm1CSYJ793a7rWcMqpajqQ
	9Ch4mx9QkR71FzA0Om+7rQ7xQi6oqwg8ssjyniZ+zN/POQnDsNHeHjyE24s89ZXue9nCS9FbU5s
	JqdECi9UEXghfesQsxO0xMcR1Ek0Oq+4SIUzAAU9LM5unD+tRWMW0+YOSXsT0rY5Bl19DC+sDjL
	jxJDnMNX2PV3u9+z3Eb7sKIPW1Iz0BHUoqw3JTiD
X-Received: by 2002:a2e:a915:0:b0:3a9:87c0:7737 with SMTP id 38308e7fff4ca-3ae126b980fmr14214761fa.21.1794490391466;
        Thu, 12 Nov 2026 05:33:11 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:11 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm7125-samsung: add grip sensor
Date: Thu, 12 Nov 2026 15:32:57 +0200
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAwAwK+Qnm1CK7iJXzEeFqhrTVhIC8aE8
 HdXPM5lNnAxFYdrtYHJW12nXECnCvpnzElQh2Lgmi9ExOhjIG7R4+hrTphMZ3TJPhlypDoM7Tl
 0DUMJZpOHfo78dv/b1+4l/fIbYd+/QIFvlH4AAAA=
X-Change-ID: 20261112-sm7125-samsung-grip-sensor-2a107d537b42
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use Semtech SX9360 SAR sensor to detect if
the phone has been gripped. This sensor was initially added as part of
device introduction series, however, an older revision of the series was
picked up instead, which did not include this sensor. A link to this
series can be found here:
https://lore.kernel.org/linux-arm-msm/20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com/

This series fixes up issues mentioned in v5 and adds the grip sensor. No
changes from what was submitted before are intended.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      arm64: dts: qcom: sm7125-samsung: drop unused label
      arm64: dts: qcom: sm7125-samsung: add grip sensor

 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 48 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-sm7125-samsung-grip-sensor-2a107d537b42

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

