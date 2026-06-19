Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03F1D63F3
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829197; cv=none; b=Ra1vVvUwqRa/hXr+VXoLyOuRISFi0gtopTiOm0ZE07nKzCjcUCiZw1pfjAcuR+A1tmZlZsnA6q1jSYJFIvygyy/YWH+bJFw+u3vrprK/z6y7IzOO9HvZ1BwR6k43i/x7MtA5MW+Ibcm3h3seDznZAxVSZgWwuyPjeyraquASQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829197; c=relaxed/simple;
	bh=HfDwPSM3AgwjPehs4wPAUk58oPTdqwzoGiKVwh6DUPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MxcMl2WEYJVl9fPt3RA6bkhdbCs6rz6zKldIAr8TtQPDWMg0j9YRwJpcISt+1l0TpyAzZRDJJBNoWnZ4crGOEZ0q6/SxIB6AA/zhotPC7NPkE1Q6K90X/NhZ8x7Odi8219/rDxBeycslwNcEqG/e49Rs7i5/4flGdR6cJvZRSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1QvTRoH; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1QvTRoH"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59d07df448bso1116713e0c.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781829195; x=1782433995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=znQu5cFGcYeDF1LB9ZZhOnWvhk6kupYFyYu/ENFjpMc=;
        b=L1QvTRoHnjNmxzN2X48ewA4jCHcNbQ6ccDX5volKUW8f3FcjRhT6LSdB0GP/kT+8Rj
         /ZJL/xO1OLOv0BogOOv67X3U1U3xL/u7W3ltub5Cv85umlruysA2c2wO30Va/vwrrJp6
         AsxHGuk6equBXebPO9hboZcpTL4ZDTcD/X1gKl/2GEVGiQzUg8zKqdE+iy0UsGB6pSol
         lDHb0IDQFeknphtOapqG5ZnurnQOho3USYwdl6A6dGsVfpj6hh0NuXTjrqPNNx4QW+IV
         GOA540oIRD6YuKt8TX3SUD1Vehe6YIpPlW7VxyMRYNKIBefAWGyP/A0GIuR5oP93/Kuj
         iomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781829195; x=1782433995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znQu5cFGcYeDF1LB9ZZhOnWvhk6kupYFyYu/ENFjpMc=;
        b=XQk0jX6OkwCMk9ZgaqE8Ee4LQBP2A5Z2liypFOsf6xD/YIllqqEEjAWD2iiTfeSKus
         /mQDCd8WsG1ngzLgm/j/nnHVduRqPhYY9RoNyJwEFxew9nNS3kFE00o2zUe658S2kIjQ
         4UO1kEqJtwVkEgh6v+/iR2KUKPn7kCheRZdIT6WU3EnHlEawZZ1QmqbJAG+UX4OgWtWm
         jUAXGqoBdc0mU61H+AmUnC7W7xCmuHJ3MPhrlz+BkFSpEX2axc0GTMug24BGpli9uiz9
         bFIaN83VWar1cx4Oy+IUZWcTUAHLlKNoiefcpJJSjXtBQOeSmZ9K6n+QUXdzKG197Uqt
         D3Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8Tzl2JUNEjmJHJabW92B9k3v0PAs8/221d8YipNfnKo+7VeRsE+gDtl1b5WHtgGDfCMzCWlzgPFce4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1b9k5q4jxQZt9OqUqBQV7ew93coYndrFEWhLWzE8hdDjoXQMi
	VSMlpsyuK2RuxVEOEC+Eab7WeU9jRHNJYotzcenRbNB1Xjt36GJ7Zs3jiY5d9A==
X-Gm-Gg: AfdE7clLCczFowPdDuiUaaEW3zbG9M0UiCeyLh7y7aZgJJwnD8NuthknqZa/YYuhOv8
	P9BvvTuUiz6e5ZWX+eoP6gRXqCeGKYBH+5GCuEH+xrFzDdu7zD/eO5K4DeVhjIQ22qVLNkfza7Z
	FN9iB2ataKh6ptr081ucMMvnKzyRXsWvGHT4mWe5P8D7pib6rkaNV7cla//Tw9exeiDtP9Vlgj2
	nbR3L1ne/0sgzRr4DmjrKBmPr4MbMfJV/368AsJrr7T/OWvibIF34SKVy8R75y270JiX/gsnaDE
	vYuv/hiOTW/X1IQsgfbx0QKKovAymr3Ts4/E25hchC1pDA1KN+j/chxa6huHdjgX1Qg2Yxs9WsJ
	hpxfhOuvxWJbUZ792RyJH+yajoJ8aP6Y0wRZQ79ZFsu9gJslvkB/c5Ub8xKR84SWY+ssYj6dzUL
	MBSYdnn0rWUJX17/CE8IwzhlXcfQ==
X-Received: by 2002:a05:6122:4886:b0:59d:8734:e801 with SMTP id 71dfb90a1353d-5bbebc30bb9mr702133e0c.14.1781829195253;
        Thu, 18 Jun 2026 17:33:15 -0700 (PDT)
Received: from [192.168.100.222] ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbea36b5e6sm861581e0c.9.2026.06.18.17.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 17:33:14 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH RFC 0/3] dt-bindings: iio: adc: Add reference, excitation
 and burn-out properties
Date: Thu, 18 Jun 2026 19:33:00 -0500
Message-Id: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3bzUcl2QTF5qjm5BUX5Bsa5JWlKKKVDeICXRSAmor6AoNS2zAmx
 mtFKQm7NSLESwuDQpKzW5BGSaUm0tAFaVyeN6AAAA
X-Change-ID: 20260618-new-channel-props-4fbd52020da2
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=HfDwPSM3AgwjPehs4wPAUk58oPTdqwzoGiKVwh6DUPs=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkmfc5Wl7WF7UtMBX5sMp7B4Wj36VXujJcVHJs1bc4Kc
 byuz5bvKGVhEONikBVTZGlPWPTtUVTeW78Dofdh5rAygQxh4OIUgImcns3wz+TD6oxHsfEqed8/
 ej0UXJ+ovW1J5yRhfknnhzNL2/Zxnmdk6J/2vyYmdcl17YSnMU9T9h8WXxV5kfsEk+IqaYY3B4/
 u5wQA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

After submitting a patch series adding support for TI ADS126X ADCs [1],
I was made aware by David [2] that at least two more chip families,
ads1220 [3] and ads1x2c14, share very similar features (though these
chips are not really compatible between them). After that, I found one
more chip with the same features which is already upstream, the
AD4170-4.

As David explained in [2], these chips are intended to be used with
RTDs, thermocouples or other resistive sensors so they share the
following per-channel features:

  - Configurable reference selection
  - Burn-out Current Sources (BOCS) for diagnostic purpuses
  - Excitation current sources (usually called IDACs TI) for sensor
    current biasing

Given that these three features are present in all four devices and
three of these drivers are still under review, my proposal is to have
these features be described in adc.yaml and have this series merged
before the three others [1] [2] [3].

This series is sent as RFC because I still don't have much experience
with dt-bindings and I don't know if this approach or the properties are
general enough to be described like this.

No dependencies between properties were provided because not all devices
may be able to configure each one of them.

[1] https://lore.kernel.org/linux-iio/20260612-ads126x-v1-0-894c788d03ed@gmail.com/
[2] https://lore.kernel.org/linux-iio/20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com/
[3] https://lore.kernel.org/linux-iio/20260610151342.44274-1-zizuzacker@gmail.com/

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (3):
      dt-bindings: iio: adc: Add reference-source property
      dt-bindings: iio: adc: Add excitation current sources properties
      dt-bindings: iio: adc: Add burn-out current properties

 Documentation/devicetree/bindings/iio/adc/adc.yaml | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
---
base-commit: a50909aa46dec46de3c73235fc15a7d6f763d996
change-id: 20260618-new-channel-props-4fbd52020da2

-- 
Thanks, 
 ~ Kurt

