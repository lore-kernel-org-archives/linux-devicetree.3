Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A94AB1AC
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052063; cv=none; b=Jgd2fTnaLTl7yihLM0uQM8/HQqrz8yPbg+23/S+APuHhYfBZG+EouX7x+Xflu1f4aEelFpECRMb08oF9tABQD6MWLLjoQGRpd93suP1eLmFZQzCTuHHlnppXKLjS7C5WzoJpIxkRWTKP7vX+6544ZxL37oLujIOroHzwquut42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052063; c=relaxed/simple;
	bh=+bkPUwN2hMVE3y7Yolp6psCq4hieuh/DtkDZpQvEXUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jV2yPnlBljx4pUwSlc+EUcFdnxQTuNLl2w/Z5BmfSmPu7mtG/iYrvnVJKe8a3ScoW2ZWTI9R8ysJJLYAUHFTLwyfnzBP+keMGHlpiKGyEj5R7eEyj8/QpHlkQ4V27oocAhKaJ82bM4Fwa32c3SlFBJ6jdw29li8wE6yFPCs8zQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aqqTnoj3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aqqTnoj3"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a9983162dcso2794076a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052059; x=1789656859; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LX8jitlbpM5cd8REaraZghKiqPQkzzWMZOq8r/lMnsA=;
        b=aqqTnoj3oK0EKm/ywIaHXnWGg+2XtRRn8Q2Fyt4tTIpKl1/dCTVuIoTAAqfPHAo1FK
         m+MzoYiaMQqPQiw+EqYKz2QLFkvDbUanV8PSaI1gqDJxTtCUSbnRAbEt6+Zm6L9OGqh6
         1cMt8xDBXVfr3ynnLBqo5Cxnq6qNRl5KdH0YnoLgzqKVIuGEF1oVuUgeS9Vyq8dyhyHn
         QzBArwhYXecfHuYGWO7hnnEC5szxsYpc70ZDAgALZU7MPkoLl0Iri6m9kh4TuHxecyvv
         U/+bY69BfEGmHVDq1d3Mae+QqDYcTfgFdkeO2nvtrqeXrdeHZDa/US3gAyNhJ3Li3OXJ
         tvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052059; x=1789656859;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LX8jitlbpM5cd8REaraZghKiqPQkzzWMZOq8r/lMnsA=;
        b=a7zSdbgIcci0XzrdeohwsKJWuGcrM1uBP3HRkQn9u57n2M2PWu3Bp3qFZxdPEELzuS
         ADnL4JGBCe0vYVuEJpNoUW1eUDNeCCwPp3nxnFHMbIcRPzFlkoY4g7yR3PiwbUPeuCdl
         Rqa/Ji6zEZoM7LynpGVlVa4sm/am3Ac+/0senfDuR7NJzLA342g5dHW2QWk2Xja0tSxu
         wTBgYpZV63IDQOzzGDvIl+FRQfwGd3PiP3F8SrBANIi3EtflpxW0cMtbSUDhgAyjcK3P
         cAf1DGp2ilbMGJbWFcrf2zAYfnDR7sLpSEl9KImXEC2YW19Q2KF9y+bNBvD/AMBIcHr0
         ge6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7CcAFFL7cyInpsKMoBjmFDLU0jpWY7pFfo1/7wa7QjPrTw7/oYjzfKR2yjxriWJW1Akf8ErrUJl6Q@vger.kernel.org
X-Gm-Message-State: AFuF++kqyTn0SjDZcVeyRdZQHOBstRnlqmJVU8Q1GokI69fXoAlUAJFt
	9Xt/FRVzBc7HUK7Y8BfxHI25ZMUKKsD+zcDQFQKb9hc97hkNqACSeWa1VlBU72pBTM5OnUMZu2a
	viBsodg4=
X-Gm-Gg: AYBFou3XKCNmfCyG4vV2YoTKNKr5T7p5lRqDLJTp0LshpCqp9n24+Rq3KLLTapkiv61
	ogAmi5BAVg23PRu7jJrz7hAfVR2d/suEdPvBdq40QlbTyBdocFnQt3QR3r1czQXvjjq+csyRAwb
	qFQ5rTnHNa8iBnme2xvr4Weul23i5lIOUCnQNdFZUBCxTQS71bxsjnfpGBimvYF3VNhWA4qCahe
	4y+EJLc7V/SxcT8L4tkU1J1Q+XCTRRWC4dVUDEH559T2/MkmDWdm4t/6/L5gL1ORIJWUUjv8bm7
	vcy2rEHQQhmHS0msrbUVrJHGYszgGTUKGjvyykuFonqggaZH4eU29/W8euKj4RLg/ZKmmyRkGMr
	j+bpMmTJJEanvgLzyZDyaOSBcIwv3XPstXplNuhOoW0YicqLG0VhCEM0y9GrI7Lp3cGM8sWST+J
	kOKzuxzlOT8MtztU7uEY0qb8w4vr3NeXvInmGHAO8A0xvM5bwY06v8suDL2AwXO3HoCWNehjwEx
	1dYm6edt++jIWucSQLQ936rNGfxXduDaBLIPi6ziI+MEovmzkii75uX
X-Received: by 2002:a05:6402:1ed3:b0:6a9:984b:4c71 with SMTP id 4fb4d7f45d1cf-6a9984b4d29mr4002866a12.33.1789052059015;
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:18 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH 0/3] Dongwoon DW9800K update patchset
Date: Thu, 10 Sep 2026 16:54:15 +0200
Message-Id: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1MRFvjVURKEqd1VKIkWgXx7
 sZ2+Rb/HxDIMwWokgM8fTnw5CJkmoDttPuQ4DYaMsweqCQKk4t2UyXi8LIjabfOAo3ST11Ikrm
 CGM6e3rz/pnXzd1hNT3a5T3CeF4qEuex2AAAA
X-Change-ID: 20260910-b4-dw9800k_cleanup-0b9a7a51e149
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=1198;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=+bkPUwN2hMVE3y7Yolp6psCq4hieuh/DtkDZpQvEXUY=;
 b=h/64XD5qztm48Ht/9zBI1inq2ZW3FDmtZYfN1L8lRUe4d0uepqpvhwda/UUVfl5l9krOHofuc
 6Q4DmXNqNA2AMKk6Iblgv4+KJMxBGkhN7/QUHa2Rc1EU24PyymgEcX4
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

This patchset edits the dw9800k driver and related files, to properly
match previously mismatched register writes, variables, and logic now
that we have the datasheet for the dongwoon dw98900k.

This is a breaking change, but is necessary to ensure proper bindings
and driver behavior. The previous naive approach did not ensure proper
functionality with different device tree properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (3):
      dt-bindings: media: i2c: dw9800: Redocument DW9800K
      media: i2c: dw9719: Update DW9800K driver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 +-
 drivers/media/i2c/dw9719.c                         | 71 ++++++++++++++---
 4 files changed, 156 insertions(+), 12 deletions(-)
---
base-commit: 6970ecbc1f96154fb68107b467e6294c43947447
change-id: 20260910-b4-dw9800k_cleanup-0b9a7a51e149

Best regards,
--  
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

