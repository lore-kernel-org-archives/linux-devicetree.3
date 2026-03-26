Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C47413A3ED
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532915; cv=none; b=Xe0B8r3C/6vmWFIeQwhDy/gB46iP1SJBs1uy7JuIoA2M8IEyhiO2q/25Qq/a0WBdxXPpVlF9LCgabIsc6408kYIFXJaejslX1oX8icHWv91MR8XgOuq4VD6iQWUmIHhD41z9D/ldVk68+MqQPl/MqUqXoMQywzLQ1elVe+PvJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532915; c=relaxed/simple;
	bh=OGjx/rpqLanYJw8wyMx1GZX57lDgWW7QcL/E9ij2zVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJQEoCC5YSiI8txB59U5cVRRweU8oU14gyHtszqJKxbgnmzFaBBW6SPeH6wDY6U2O50M7bjlqFzsAw1iq/CEl5SBbhTNhqXXQ4zDBYmBPHMlGeAMf+pqaSzPD0ndA9i6MKl96K0nw4NGVpXFYJNPjalySEO3ZczggZ+LUVsKDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=WC5VkEcb; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="WC5VkEcb"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c763c294cccso714072a12.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1774532912; x=1775137712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=WC5VkEcb3HIhTvxn/MGV5pyeJeaGr03Vabi9AEBf/90bwlU2pGyvvFofsWb0Y/w3zC
         wG1f9RgF0JRVYvvqr7UdKig7cH8Cy3QO+BtrsdoOS9/iJOAnxSQc/OycMPDBRgeSrDv4
         sq3eHhlHkDZ39+omqWy2TSgYBLqTspjMiiOhCc7gsTgdtUgWAoZ8wgc2ZIL+MyvnUINS
         ZcRmpBVcIpGUAILIaaTnqBt7XJB0SnOZepvDet8v0sJj+jQgwhmszRemQpCsoTGZ+Wm4
         SetyflaVZCPYybVpSr9FFhTl2zch8iwovNRvvQE1yP3df1eIrTDw8eyOCS5FRMsXmepg
         4CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532912; x=1775137712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3ThBxdaxluBFioSVhIDwm332ADtoHWnIdue1Mw0j4g=;
        b=XK3raUsX3ihF7vDoJ8sLZhbOmKqzIF4dZWzxoM1Nswgy/c1bCVaH5h/Ii+zADQ3krq
         R0c6oAiw8ffHW8Rn7+6XyTQ3NWMFQwtn1OINw7apqlM20XOj5g976gRm59Vmg2FS60TG
         8NcohQ8X9B3Z89Rhf2xN0pRELNQ2pudM8TAhPB8L0VZLukxlBPp/Obd8jsAup6ma2gog
         NLkMu5x3lDpbivWj3M5DyfSomh/emEhP1Q2OJBZSWyZhYniMsUQyV37BU6udF9MaoxVt
         13lieW4RH5/Hb3wMZDJOb7Wh5QNKzoB1mAd/lAcFwG6rUM8x/tpBgsj6URf2N7JV1tVW
         81RA==
X-Gm-Message-State: AOJu0Yyv52kqd1cJ2R7nWef5aoF3JCZkEI4MvF9q+eAaFqcltcTdmz+8
	SzMY9kepC7KhIF6EMacOIi5tS14TUBfL78ESg8cxF9DvI+hvFbluMCVQeyPlnmNORAg=
X-Gm-Gg: ATEYQzxrxEeMLfOfCoehuXF/2uf+HxMNUwHLLukNW2zUyte3KV/aHjhn2ZRi1dOefLT
	AM32C+nmz+04Vo/tAPFjUUIHi0+KZeAZkRcqv+M2OT/9q746d8qyr31NMxNdkayyZn6DYbUSH50
	fCtdd4ATytdlNBkcVnerOgnD3ZpgJsVBevcks6+8qrLSyn8dwTdV+bQXtMZYKZcb7qrTfQeqr8o
	JoRKp0to/Ipv1AcHmXysXIwfWq9D7H18OYuq7kFpPxWAV9FRUPCrNJ13Wcp117G+mmmkoE2bCTG
	7Wp3132gCoWtljcR5RQQomtwkC4ql9lWMETYrSM7qwYh/29fK3jTsw0jrq/5LS5pfZvK6cMQ6MI
	bbm5v1MqGMWV5uNoFosynotxWMqfGCb+oxzzSbxEXO6+o+GKatgz3lzhhdPBw51TqN1Szln56OR
	cuKVRLmikgq5smUi4rTmdhD7HOn0Zn3nRqx39tpiSEvxTqD8f2d2zEL20FVZ2j03I=
X-Received: by 2002:a05:6a20:431d:b0:398:89b6:1b3d with SMTP id adf61e73a8af0-39c4aab87e8mr8369489637.17.1774532912549;
        Thu, 26 Mar 2026 06:48:32 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28d6sm2706683a12.6.2026.03.26.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:48:32 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Thu, 26 Mar 2026 13:48:05 +0000
Subject: [PATCH v2 1/2] dt-bindings: trivial: Add q50sn12072 and q54sn120a1
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-1-77bc77eedc76@inventec.com>
References: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
In-Reply-To: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774532898; l=1150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=371ndBFO++Ux/UDUOyIuv35ZzqLJAZsYGZPm32hIp6Q=;
 b=kzY0BZ4Awp0H0lRYVHYxJA89fVy3ZtAa/yor3kfP09ZJYPDG49MISRxvOsOsKQTaOmTMAVR0E
 w8LNo1JNziiDOoGJWLt+6k3sBfd5s/yIY5VQ/kI1gPA4WjTEkXCSIz3
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

From: Jack Cheng <cheng.jackhy@inventec.com>

Add support for the Delta Electronics q50sn12072 and q54sn120a1
1/4 Brick DC/DC Regulated Power Modules.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..d4b78154df82 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -96,7 +96,11 @@ properties:
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q50sn12072
+            # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.43.0

