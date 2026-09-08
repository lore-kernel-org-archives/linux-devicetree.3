Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096155AEC5B
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895267; cv=none; b=ZL8OgAot2jEbCW5O/G31TccKtnS99XOAHMAIpMvmietfx1hzpKotJ9erVXmobWAvTlUfjbwcsNlpJGYM+vfSVM+ibazFt6pg7UdFukrpB7pDbBwagzN61bC7ID/oWJ+F3hRiBpJo0ZdMo5z5mNkHfSPyrhONlKlUGTUzmML/y1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895267; c=relaxed/simple;
	bh=6A1+E/vOD7X29NvY+oVvPlZs2BNXNhPpx7MgYd5DIlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gd65NYYzdm1LaYTPpYY/owWF/nWPdpeIoxucsba7FjLGtDIfc5sTjNW+7voFvTa67X5lBXkOphY5yYPpm5OV4C+9JTfjLmYYzu5KdLxWvtXfwjWquTAxUYXEzOQa+PqIuWG9hg5jng58Wij4ncv4wOZykgGiSm+wy/6bjFzAhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWHzRgJp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWHzRgJp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so40642305e9.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 12:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895257; x=1789500057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C2znoDc6QFtOLilfHto1MLA/C5JcF5zobRDR2Fyfh8=;
        b=BWHzRgJpnXvqYctyVfmeiQqdbiWdgKdoqxOGd9+3Z8OoOw/WgXgqoTHwGxfHsTkxpl
         5mX8Ds6ePsh4E7z2JLX28v7HiMvIycEN610oM6IJclOx3MRiUFmd249iqJJh0rZeR2zY
         vsa0ZJzqozus1LSaiPShqIV6yS+hOHgULU9R3KnVmQR4ey3nY1hiNDWa76aFHw2oETH/
         YzTs1WCzUBFdarLLju8/BpDSCREfFoGsebF4vFDWPyWt27IDACJVjOXts7UJAXWR9jAd
         XzZJJJdHagLQz2jsSRJ2hwmCzmH2nEeT8QrXcPiE5JAwrZBEFJvg+8DUe8XTpmAhjvUp
         boeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895257; x=1789500057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C2znoDc6QFtOLilfHto1MLA/C5JcF5zobRDR2Fyfh8=;
        b=RWDOdUDx2WzGoxatpIs17w+p9Ev2/wSweMC5kUSZm1JMeAE6eq7r7NccktfchCGouF
         1Vw2vum5fQxvJJDE4VMP/SF06m5WHUhnsWcLMFj3n6st2DgTZO3vmE7R08+tva+3Z3Ib
         yTQdtpNWQmZX0fVxrRzroANn+cHprvTQwt5DzIOEe22kkPRLRbIkACeOnL/C7DkqaCl/
         KWX7FuJ2kHOgIPsHWspnjgi28YnvnTmbdE0e0nzhE4NVkGNaNC4JxzClllSX1c8Bwj3z
         mxtL/pmMd5eVv0tXGhw4bsi2EHIEDctE93PEQJV2NRUunZ3CZg8d0G0HYgRMCLDVKaiZ
         0L/A==
X-Forwarded-Encrypted: i=1; AKwUvBzxXkvFE3+PdPVH/tZAlHzph+iaF1kI6pztF9isWd3BMCjghM8nb7kbjxkH7qzMNsbNAwZKXT13cmuR@vger.kernel.org
X-Gm-Message-State: AFuF++kSaHjCj3HXNMFOAp342zp/+QrUC6EBhXmBiA45Va80Yknve2y4
	yLfCWTTYeQRy/sqE061su8UkwtqFlu0UY9DQH16pgqUDqzVAsHg/X1z6
X-Gm-Gg: AYBFou1AFpHuux0JRvM9i/WRyf5IG4tQY8hRImGX8ZY4gvKjaJvrjOH5D/YP27o93Wv
	uyBPFCSHLWjgvE5gYzlvojow2JBVSDqFUldxD8kTlh/1kvIgHJtrG5sD7EoFnb0RT3SwQTnCZQL
	ZDA6+WIwPeAasdEsGt3WguhkULOhirDAhBeG1zwq81Stm5aR2pR+VL0+JGE/KDLAYsXPRJwtkOC
	crR46st/oj2gQn81PNLWzpfQ1teV/7YUnkGi8Bnm9qpG0osSFBLt8V4zX/coaKHDu6Jx2bhF3tX
	63bCcQiz+us5320hzguP/QwoJIQWVeEMYmrHtwikzDxjkmoiOv4m5GZrtAnWh8QSu3XwWaZk2NL
	PbYf7vIlZjWZyhyKUYAAPUU8nuR7LsA94NQS9zQYL48syP3E0o77KDmT4G5M3ih38Fw+oPAnEln
	drTgNf/aYaHckpldQKA3qb/3ZJu3K8NNzsmisUoIRSnfWaq+JAVVTk9zMnIZoJBgmGP26xdTPXQ
	o2KFJAWEIdEOv7y7Mv5TXJbztaM/c28HNB8AvXfqA==
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49cf8244260mr314855325e9.10.1788895257060;
        Tue, 08 Sep 2026 12:20:57 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm407885845e9.6.2026.09.08.12.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:20:56 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Tue,  8 Sep 2026 22:20:35 +0300
Message-ID: <20260908192036.8503-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908192036.8503-1-flaviu.nistor@gmail.com>
References: <20260908192036.8503-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property per channel similar to other ADC
chips. This allows assigning distinct names for each channel which can
match the schematic signal name.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

