Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706561;
	b=IAzgyWx3vBA/EBdMcieRYMisi/k6KN1CIPyIHCyM+Fuj+p3mcv88vuKia+7WJsQACFS3
	 jy9RXhpzUplXS34mUKu/4D7XsRufnwvhcMREKAmOOXi3DfCTS3BRgqe2t+tfdIO663bld
	 bI9CqUxNOinHnqCJ4q2IAvsloPnsKAGERgO6LrCUl3QlNwGcTvI816EV+dzm0BUSEPSYh
	 HZQzHlos3z7xCg9m1hg+lFvo1A5GO7QKeHPDjrL29VI06SslsQxp5wRK2Lu8nWqPqUbLX
	 deibWOibXvdws17wzBqdoxU2LiPMfAtPv31EEn8FS/o7BZ55i1bMo55qzqqtcp6nLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
	b=XdXMXAXgNvDYdbKGtwwOt2wgaU9KBxsLE8+97dSt1ownCjCbIXIkihjy5VLiQZvgJSaX
	 anHix5PsRIgvvYBv7llTn+C1eFxwysMouRG7p8R5gZvEkaP25nqSoi8mVvSIPnt7SrsQ/
	 jZ9qarJDh2gid7L+z/+q7D9Xd4R4YH5Nh5v36Ee/vMHd7i91fhGXw46HmGHv7hYq9jiZs
	 Pal2s3VBSiDiEKKBPtO5SdEzsRQD69JlrGPlMS3iztvYsaScLvgkEvX4IiUkRPJnfvpN4
	 9E9neOulh5hAW84Z9wLEp0zUkrpJ7uYQkV0wjk5m2VPm4+0IUGjv9SQIy0thYNFwlwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C73606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so68379345e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706559; x=1796311359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=qDi+MWpzqiBvWgwSOPcp5Bs3CfXNH+cOcpFQJSl+RIc6CH5tZlaLUj1iH5K63qXesn
         xxPWPzxoH/Wr5Zgo67x0S18ZH7SdnyDipqkJlh3d3WHtsWGsfRL5jWCgjcM74a3Z6j/u
         fSJmLvJ+R6LM6/dQ8p3lWoaxk3l92dSawUICIKmJCGh8jB/VRkeMjkXQOoMJGs8PPnR/
         0oAOwtmp18ownkufiDgF/vbNxqfSLg668cuFtmlj3rh5dDiVJN6e9zzGIlvtgVMXumqH
         h6pSoSsa+T4bRQpm/DodcogGBrdlC8e9PIKgqxrPNRCs5fzSCmFYmoucQAW6r9c8y1JI
         Prqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706559; x=1796311359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=1bDUKUcHLa0f7mZRGbhXFFbs8Fl2gDXePUHD3qNRK1JBisdJ0lh7xiKGrF++siHU4L
         h5+xHvK/REfORtMFgGigp84vlSON1GZiJhxOgRQ1kYewhsokIsMs/AXUxbl6was6icwq
         M09nr4A2SAM0WKAmZRYs7RPorOyuvjn+EyAS3quifZhdz8QlhHxaTuNTbPH3tP0f0eWD
         55977uSwa5Sq44ZTTTwywfljxcZ1KM8yREmJ+OLgmIzqmKlGX7DCHf8MvEhGsVAmwxzL
         XG9a7DAaTu6UioNZg7ichD+JHpjABouodSIXXmBBE7XszaMhTgYOBX1Fhccjsp6rjk6V
         DiVA==
X-Forwarded-Encrypted: i=1; AL+hErGWYNrnJVJr2AA9o87i+JO87rWeOmm9oHXO05NyrWQ7b0OKAo6+hAFpllG8WBRYMRrwv6OIAl0y5DzH@vger.kernel.org
X-Gm-Message-State: APuU4Z/g1f3qHF4Z8QrwAG1+8A2iNsLBSGc5ugvGGFuY71YbFx+od3ss
	AWOW9Bzhdpn4TaGgEGV8Fk5pSj3eau54vMp9Xy5bNYE0OO+eTxR92rwl
X-Gm-Gg: AZFdTZdZGRzZNpvNIBp3WA19gchbmUbGkd+PH5esrtYZl+AJUeLGMk4rKcBoBwxcQHW
	6DzfPWIhnQgC8X4i7LVWL3ojVhEQ9SEUXlYVmsosWhI7uzEc5E8CpntSD6arzfRKehdA4i6eO+P
	JGMdm6rKdwa9ePlh+gMVaLCow9t9CV3jwZTLV0gRNtKf13gl2FfGQ6MW8Irs6cjZqRB7kjpSrLp
	0RxkehaVJPovP2Q8wAOHhVaiPWU1pXF8I+D1xlDVvDDTBRSI6gD5dfb5Dl0gMV0GhBtw75Q/OTl
	aMUiYEcoyIGdUS+XG+YMxnTv3ZcWUKrpmQJUeIA88bA2MS4I336+ci3SUTHckHf/lB3Ph5eqQ26
	Qu9bECG2qAZgqKtRLDLzfFhEnKn/TEGwTRAUxQqdvlvP81b9QIHiDy3hYyjZ/iPAiAf709GHiZe
	OBQo1o1/Yzi6NOdnh1Ip8ps12h2Is+S2tkxrRawWjtN2Kvw7E9HhBmnTzGmElAxhFkXUn3WfInR
	RtjhBsQ7OLIBueI6ntzodRxCtR8LeNXw4PzbFwlMcgq5myzFk/3EIOmSUVAdI3P/K6y0sL53/1c
	eEGrI9HobSiEZ02+V9eiGyV0+53ZD+43uzOt6A==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr451013865e9.3.1795706559520;
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] pinctrl: qcom: halliday: Add the gp_mn and gp_pdm
 functions
Date: Thu, 26 Nov 2026 15:22:31 +0000
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALdOCGsC/yXMQQ6CMBBA0auQWTuJbZA0XsW4qJ0BxpRKOsVAC
 He36vIt/t9BOQsrXJsdMr9F5ZUqzKmBMPo0MApVgz3bzhjb4ehjFPIbljhNOMzYLymUWik675g
 ctZeWCOpgztzL+pvf7n/r8nhyKN8jHMcHLsoeW34AAAA=
X-Change-ID: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1110;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=HD8degU7LtTIkgstinfaN6iEKPajs7uLNNN6OR7dmMA=;
 b=DbhUTn77kjaP14rmgpnE2tKjZrsTz+eG3NVAKIQqBaftM/TYrwCoShxPg/rNFmKWYqst3Mam9
 XgfSwrfmVbdAMzsG5s4pyXsc1IGO+A2CqxofzopdvEz2keNGSkToRYz
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Konrad Dybcio pointed out three pin functions that are missing in the
Halliday TLMM driver [1]: gp_mn, gp_pdm_mira and gp_pdm_mirb. This
follow-up to the applied series adds them to the binding and to the
driver.

Qualcomm's downstream driver does not have these functions and the
Galaxy XR does not use them, so they are only build-tested.

This work was made together with Claude.

[1] https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: qcom: halliday: add gp_mn and gp_pdm functions
      pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux functions

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  3 +-
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 32 +++++++++++++++++-----
 2 files changed, 27 insertions(+), 8 deletions(-)
---
base-commit: d1e44b75cd10eead6750f929e3cf68febab8586a
change-id: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

