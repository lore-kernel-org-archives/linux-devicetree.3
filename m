Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E049EC42
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288191; cv=none; b=iU2D9dT1jbyb07TvKWe2KQp8r8QOWzREW+eZlOmHDMRZEsB/4Z2R0sEU7dg7H9a0zkqkaaWsAX4MG2a0J9IsJmWNh+fJyF066rDZZfF8VeJsWCnyauBh8n/mqvZYQYbZyEdXo0YxkLOcI+p3HdpbVDFvv7gAE8Wm4RQLgq3BiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288191; c=relaxed/simple;
	bh=Nr5B9X/EA/TPHrdPqN5lYHsqf+HIQ0e6gSRt/7NYRVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ry29Z/BDCFqxxaS3cPMKwbTN8S8jddAhHdWC8rVaJN95HDDMl6hd+PceBVqjAfImvnGrw6CzqQy79RJ77hwp35PRv7WeOA/WGOWE4m16mB6G7bdyvRSLpTxUjx1onA7KQLNDJpfpGYqqg0S0x6q4mEoLI+TXsa95fHKLI+sWcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxJrSd+n; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxJrSd+n"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b9320423cso1427935e9.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288187; x=1788892987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzeE/hU4D9bblLATFtWOwYmE1vpCRHRwseWHzl1OrOs=;
        b=dxJrSd+nCz1zSAvEg62OoeSgSIIoQ7VPBbdx1S63Ph3i/xebLfQdCsbjhnGyEUOIq3
         k0MyhHtUXoKPCCaWLi8jPm5TXnj5pHiboRpI54UJpW0GIAYSAh5slXJSf4HJeHAyqR+d
         p+mNx/QLVYJOelGxBtghwuMCx3BOZ4VZWFUBwL7rM4IfKUJw0iKEXduJxnc7ggpuNT7n
         yjKav6Esuyz7qQvcoqPkWpLD/bnsyoAcENOhNm9qQlsLpFYFB4orU2jzGow7OPzj24CN
         1S2DR540+rrZwGhP6kBiBO23RGLs3T7AffCEVtcV1CM39pS8Blxpswq4Zgj6MiKQ0qz6
         gykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288187; x=1788892987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzeE/hU4D9bblLATFtWOwYmE1vpCRHRwseWHzl1OrOs=;
        b=Oi4dpNeXwDDsqc378IzIYRBbi/Ibi8OJOk/A3c2WEp5LeFqzPkUmvdzPh/4QVdlbFM
         p41IYr6lUKUqH1L/P9zx/ANW9FgYwRFFcAH+8cqjtr6TWr2u0LnonN1NTXMgV8vTGmgN
         Dp3E5Y/y8IM+ENvKqEApUUZYVqJC4QLNHmAXGedwMRpbReyEEtxlJ0jHqtKwVz84mwqE
         o1ii0wTHZa8kRDn/P0Rfyccbct3MrGWIlJA55aMwEajGVXGxSCvTGmYYQgBur2+HMx0a
         WChMKshSGss7INFuCd2sQx/zFxpCY+aJXdiaYPkxri+t5KekN9POnb76GE752QJtdzXB
         ving==
X-Forwarded-Encrypted: i=1; AHgh+RrjeS0PWfRW2D4H8J0nm9+sluXslAfXqDfkB1CLuvZxzPwxasp2lRXMVJNXB7PEnks8YcONhltZuNiX@vger.kernel.org
X-Gm-Message-State: AFuF++mbecMAmOtWBsOQjWiin7+Lzc7FpkVyEWI5zf6BM4UepNGD6zEc
	0VmWD+c6C8yqC8B8PUtQqLJlrig+JjPs/us/Rdq6rD+hIOssM/nqeK3c
X-Gm-Gg: AR+sD12si0uC3311ASFglfURudZqTTLaHp1iuLSSH6voUzRzsRI8M0ELc5wtaeLpAfN
	IQIGn4pvSZ04MDsxZymLTuxAuAv585+6b9rkEEijlt3pB7oWYb1qWPV7tRPFlXVmwpHvRRSgyed
	FhTE8MvlqMXTOaEwRdezpaPEwKsatC7s54GdEKpfiIR39FxWy1M15vMRmqG3oFK6m1diZjc5LYp
	H7x4gXkg5igGNbVAbx388kYCuw+Rwos5QdJqoOVEx2QyE+IbETBJviHf/ANa/jJGAw0e1B6UdLq
	ZBBfkNnfsn1k+bolYtQzOeu+FG+GuRWRp4B5ZouVXRkqrAP5R4+ZAHLMnMPBNEy4EQ+k0uELrnu
	LXiKYE4ItS1ZyIGw0vHiWqo4KxBhYXEY6LQV1IyWa4lkIK+6eqS/xBSg2+q36Ku0PS03gqwUV6W
	GLibjYlr3F6wSDVA3/rRD3Gi+T3RmfyPY2YEp5esMANer8Sorq4pjYeb8TUJ/Oox2eJzvTQSLSu
	fG7+xNaNjLoY0ecLRRzSMFyVml1U+BlCEL6
X-Received: by 2002:a05:600c:64c6:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49cdc558470mr204496575e9.11.1788288187157;
        Tue, 01 Sep 2026 11:43:07 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm822987f8f.24.2026.09.01.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:43:06 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Tue,  1 Sep 2026 21:43:01 +0300
Message-ID: <20260901184302.8127-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property per channel similar to other adc
chips. This allows assigning distinct names for each channel which can
match the schematic signal name.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
index 718f633c6e04..777a75c21d7f 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
@@ -66,6 +66,11 @@ patternProperties:
           - minimum: 0
             maximum: 7
 
+      label:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          A descriptive name for this channel, like "vcc_ram" or "CH3".
+
       ti,gain:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
@@ -125,6 +130,7 @@ examples:
                 reg = <4>;
                 ti,gain = <3>;
                 ti,datarate = <5>;
+                label = "CH3";
             };
         };
     };
-- 
2.34.1

