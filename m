Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340049;
	b=F/JXrJZ8Zw7/T34PxfaunKpnC/j2ubpvDh8fHkC3+jAifF8L60cq51/1iP1lnk12oag1
	 a/hOrcW/6FZqWq7OlRtwPw9mfHxIPHKB7H8ryIxhIbNPYm9NXhTO7R5/UN1ycOxW/mKT6
	 HHuGIpehii/ojqYbgDd8AZouy6NZ51InsyDlyvC9e3lcX1O9y1bZ3ans5/so14FK5KQ0p
	 OCuOPXoY1ucyeeGd5baUO+fvMLFpIsnkvxWfa7kp1T14w3U1wl3LajWcT1uXrnwvF2An1
	 mK7q127hyMkZ+MklGeNyHRCrOFC0daTxpbwbn735AUZqPrQQz9FJbmTxh0lGkPpFQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MuQqDS4gHRiIDL/AerQd8OJ/xrrO8MJ2dvAzRmjTLio=;
	b=kGv0OX52evqy55Ds/bWD7OJMbKqz+vXoGyrAEiUVMPIEG/mdFDe7V9wLib/DMVJ6qWs3
	 OH5V010/JMzJcHvK/Jvq+QuVlPCNOtORezUHjiURxTWnfd1aoTNmFlv3aFOGwcfn4tqh9
	 rLIIOtpQZXSIzIW8tOFo7UjjSz2+6qfdJkjFWgFKsyRA2KQs+cWX2lmLEFWY/jySaE9cz
	 +bd8bQupokZiuGdxr0CUiqnLIa92qWC2eHNg7xgRfc8zMkY9J/7uyWkvarjlmsV13EiZn
	 SIKBAkeMDqZmdkAjPfC37XFRmuwr3WVvRk1b8IYcdIQHAUbZfz7bSHnARGKD/V/kE8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fVlBys2/";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAC606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1BAC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fVlBys2/
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so1608058f8f.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340047; x=1795944847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MuQqDS4gHRiIDL/AerQd8OJ/xrrO8MJ2dvAzRmjTLio=;
        b=fVlBys2/1b9RonUCt+ctCL0AFnUAaSbp9xup9SH4y05xeewwNLJoQLtaq/JM9aGvwz
         YCcWWAp9kfarcxdpWfXqnOpooDVodnj1eziNgUNi+lM4W5MBj3FAPFGUBrKZcyfDfL6/
         EnA3JZ2yejNWEfuFd5F3DzH+lFPxlNEsNRhH5LCnwGUDMcFrIT9ychQLz034ThQhkFNM
         /q1BRTa9tVHwKWhAFF0GqEqrpf3V4p2EVyIm2LtQ0a//FIbsVqXyepMGJ8lsPt+AbN17
         wfnmGO5YuH/3OJ6DE3xxCoHk4GNdtN3xycReOflY9h5OD+OyR93DHh0SaVKgTR1YIMit
         ziIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340047; x=1795944847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuQqDS4gHRiIDL/AerQd8OJ/xrrO8MJ2dvAzRmjTLio=;
        b=lOqAe2Zov3dh2F5T9D+JT+w1avy0EaopVGg68jOIlFOJbE434ToWbJNnAdc4YHbVdx
         1tLDXUGgf7cqzGw2Dz+C1weVba3Taw+PBKej3n43Cg7pDvUft/keclN0elN50rPJTn9r
         jQ1RPmK/WWS70r9XF9ElnO9gdzYk5rMruik+u+PfEcdB+5Jp14PB6uZW+BtuoNDxVDsf
         HF/mDL5IKC4QBhsUhZrEbxFx4VhifZhY5Vksm7ibW6aYjNOTuCpaitT/Fu+KYuFzRQrt
         7bUx32kWLljfeWGEbCJb+N8B+QnHUWLZP0768HfW7d4dbuFfEirNZHt+avz/YgdBnFmM
         SlhQ==
X-Forwarded-Encrypted: i=1; AL+hErHn9mHz+1MVDPDG7EOokFERFZ+CPbNTYFpBqFlDw1mUbRb2oelV0KpGmtk7bC5GhYDbRIC/x7KPrRK3@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Fbx+eJv3rn3TKHuwXRvJbD952/nsMOgLQ6+34qle88egxTry
	k9rAfmCqjbP/41A3E514ZKqE9cYajU5fqyUrWaPpSGhPdzvnebhImRXCoZSUmX7ixYQ=
X-Gm-Gg: AZFdTZcCTBnj4W0I3dCmZFCVr3FlroJztjlkN8Sz9yQmsyeKRf33rVt/LpmS5KrNC3U
	C4JRxTwd4rrkl/XWCvz9Scgjiaq7ckyEnLMxtYTR9sAP4b1gNUjeECypxa+91d6lMSbjbvT0/sr
	9+8dIqzDCnaEYBIvHTc5PuG/Us3tIAy7XYa6jtxsTfz/TQmo1siZI3Nu+ipUaZQnatNNkxQ5Oq5
	HS6/hJYbU3vlF9mequno5KNFsXelttFlOQ0Rpp5WXUd+4dpU62u0MQxbOY/aB0NkBgPCF29wli2
	09oGNv5Oxa8gqFgKnNcxF9d+biqTJTShJ3bh5xpoScOPE73Rqgw1aWTXQlSgKMqsazF3Mdc78T9
	M801EMYmUeTJuUDLlWpq93xfR4ViqrAEMsKfldoRIUsJu0rrANha15miRhxk88sDOOoul7s/6/z
	VO1rjtKTnxZ9TC1+gKJVMczy7sB91xI4B1od3zrmb5pCoAj7tkiZZwz3KV0gspdzRb3kQO4lMuw
	CDmItDHlY3ONGARWg+J+oQpSO58IDy5D4TNhavkDHIc7ynekSqjpP/JL4CCDbDAjIWMXyoDCeo2
	0fAP9cg2fKBnieODy+2qsvxjImaIhEmUKsErW/UHlewpUbih0WDN4n1SlnR9XkxjCVVkGAV6OY7
	p4AWBIUsmSqpW4bURLLNpT/u2WqcgPSHs
X-Received: by 2002:a05:6000:46c7:b0:49d:7e8c:e8ad with SMTP id ffacd0b85a97d-4abb272758amr11104935f8f.35.1795340046997;
        Sun, 22 Nov 2026 01:34:06 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm1552848f8f.43.2026.11.22.01.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:06 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: input: touchscreen: hynitron,cst816x: Common properties and supply
Date: Sun, 22 Nov 2026 10:34:03 +0100
Message-ID: <20261122093405.70406-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The CST816x binding allows no properties besides the controller's
resources and gesture keycodes. Boards also need to describe the
coordinate range and orientation of the panel the controller is fitted
to, and its supply, which is often switched along with the display.

Patch 1 references the common touchscreen schema, patch 2 documents the
supply.

Gerard Marull-Paretas (2):
  dt-bindings: input: touchscreen: hynitron,cst816x: Reference
    touchscreen.yaml
  dt-bindings: input: touchscreen: hynitron,cst816x: Add supply

 .../bindings/input/touchscreen/hynitron,cst816x.yaml  | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

