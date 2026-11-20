Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205492;
	b=VxKR3Lyio29Jyo68ExLoaySeELVwlGgUk958/yRyL7df+hmdHi+116vljNlwv25D9kXq
	 /amSP35+caCPvkGg4XQ48iL+Km2WtMyu8vG0ZENGJ5iD+A9pMS1BYdPwKcS4mpu3s0T7F
	 +0KvLsVBEInZYvXOkTCPtvLMhHYXQiik5FJY6fVTKjsHla9bh+50a/o82qHcQLTvWQEsr
	 h82uCNIo2n+Jg1vNwntlrYdSD6pkSErkMF0qMt9DjprUoG+EaFZUrXfzu0OCyI5STLpj6
	 7id1lQRWDsJFa2hY2r8K+fnY1bRUrYfXV3T+OPrRbHLVDPWT81uhEqBRIzOa3+RTZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
	b=T+60TAHgdH3JszW2i9Iich6JrKTPX1/AJxzWYqz/04fTGelAd377W0zoUjHmay5nx5HN
	 hhPwLputVOw2wMQdR9XQhqn6HLBVTq072+swMz5YvxwW3le+LteopAMAiXnBLYz3Hka8W
	 GnNyg+Ru0hzD+y9BHspaQeh10FU0a6av2b7QbrcbfZRNBcD3HuNXAjh2Bdl00MNwyxruq
	 zDo3QSxYez9GVt/Wwj9pSblefqhea+TYlf+iwtO7tFqVHEu9bEdMGYlQfnmUzj84scL4y
	 Yoep0bSyPdPZaOQlNfysaWstaMJCrxI7BKENe23g3Ct96W8467lCtvDgBtgIteE/vrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caX+YDDx;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606D5606A6E2
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 20:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606D5606A6E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caX+YDDx
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so12342315e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205488; x=1795810288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=caX+YDDxbdK7lOatziDlxo1NbeN67mglyVy5oETr/Bg/CVDK8WbHmhkGJNrTaJhyfq
         L658wKUIOvvPgzjTnQdWj+gQkuJ/fWwmQwTEpocdjJ9bNQZEZ0iN1E/eHLd9+d1FD3kC
         4p9jeJo1Xjwh/wB52phrpgqgm+3c6cs39cBZeknpGHCebRd9+sZD9NrG9r16Eri8jIz9
         wDb6UpfFg7J7mYFjUV/VcuzGYD9hLMgTh46e9R9l3TWnjc/UAWnfb7E8EJ+b1IbdHqu6
         Jvl/ly1YZVOYNnY6KXYPTbcsxoOz8VIP7GNuOeKkaocpO93yfSEUXzaYBZbjWJXLJVOt
         ScMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205488; x=1795810288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=oH7n8njs9zZyEEwF9002OXsqub57/hvsQayChmAZd00ptBRgUMN+0tQDE8E1Ox+mt6
         wpW1LW7fGc7zH853d3g62IvIWR/MtDFlXmiGeeGM0cMkdRBc/1m45sLsz7392+5jRTG1
         DADstM3O/Jq20q/OAOPcql4WjluxWwWpstgDVzYXIEnjTt4dRrkVf9nvkAq3Xam0HT5P
         OVQzZ9Bx47Dls6WbKfDVUU0mP/VxjKid5YJfq62hLcaDJkfx7XVT5sdUEV6hYKl7CCsv
         980KDWKJ7usMxSbc9R0lWXbDQ1QAhApqPQ2YiyqJ3QhpkSKt9Xu28LrMqLYaSwOlzcsU
         ySsg==
X-Forwarded-Encrypted: i=1; AL+hErGJ9n4Q8H059E5AWdbquODeQsXf1rlvUmD26RUt0R8sSQFMM63010F26Qeghe9e1l7vBxFPphgbYMVI@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yn9kfQWKfgnd/pvKm5zLDA91rns1YCVWW865cFdzPQ2GU+7H9
	iBFoI5hGuPsP6Src08HcFkiqL0NxMv1cdOaeMfaBHoOZjk/IKpGIGh0l
X-Gm-Gg: AYBFou3Lk3mmmfmEefF/UBM4UfXTbHv6P8FhgIBVDhyfYQp5kq3peb4+q23lx27IX37
	VqAxSuEEaTI5nUpqbdwFoV+J+UwqVeObi11NQkQjx1BjaXDqSOOe8NtqVFW8iaswyIq1sLDpqRA
	RGlRHtEJ2v0cQMVb2lIlLFobUvd0U37oKfBPXNED+YBvNbo37u+euwwjGl06MXObHKlQQW2BA8+
	8BkOBpvrFKjGHOFsIPhY9kCDkGZEfxM7z75FUUF7RPR1e2r9+l94UicPIAKF0mZGsk8BF2G4knM
	RjUcEb3bn0IaA+l+LAxU2+/htbPRQgXOO6ZOWfO3lgQUBXC35S5PX6M6PgMdxkKMCPCMv3QwkCH
	bDb1QTpKG2eldBNlGESxp4AosHJupUoUwNDXp260jPmbccO2z3pC3n9AVcNsqBC4EDuvP915N8d
	R1nV8nxqglZ+SUf9lb6Vcll6vLoaioGRw1l/6Z8P4KLi0yGna5kXJwfe69t17aMYEuZERrgRUPe
	rSMDL/o+wZ2tZDqQKan74QQQEX4aCBqhBrNr9LB0Yhw6jT4Nb2PRUTmCZm75ATAnCXz6gJm08ca
	B6da4nkdM8zV3XYM+qyag755tNjkA6n/qqOGjkPHLmZIa7nlQA==
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr104686305e9.2.1795205487788;
        Fri, 20 Nov 2026 12:11:27 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm115561275e9.3.2026.11.20.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:11:27 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:10:52 +0100
Message-ID: <20261120201127.90969-2-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
References: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
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

Document the ASUS Vivobook S 16 S3607QA, a laptop based on the
Snapdragon X X1-26-100 (X1P42100, Purwa).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2390568de805 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1350,6 +1350,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - asus,vivobook-s16-s3607qa
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
-- 
2.47.3

