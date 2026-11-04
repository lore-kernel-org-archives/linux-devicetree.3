Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810732;
	b=YmBepF/Ofg1JCHOxZsW687Ym58LRmmveYN9VZBgomMUcQkuJ9Wf57WF1CYiHKJDnbaVR
	 NZZ09RsDb7bnubup6zecBFEDkAOvAgwk6vUF/2xvRam649/XtTUpicYfqkXfmJwz/oFgF
	 WXmJETA83wDMXQg/fmocAHbBRs7q2eS46YsHTLduVzj6eYceTinsfjA4qZGdzC0ZBDWds
	 8sQ1ozC78+BpNFsSUcHU/MsNSf+X6S0zGCEfpPVNW+wspR9IZ9AO1ItOrUgRqEAd9fTvs
	 l4p658bKkx1/UQIx07a846kRMyzrUwvf3yLpNH6ofG7+nYi4YzzSjFsKBdIOIWuLxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
	b=C9TMpV5KRgZAVM5Nteqwl9ewYbtcWnJd8VHuhXhoONSU+cR7aQMG8QJWTRN2jA30eH6w
	 aJ3jcSxNJg6tMXImn3+CY2X/8SLqJ3RutJis/GvsG6fiWH3d6U396oTcem+4UeoY1NiM7
	 xiUSxyhkZQ4BBG+y509IZoeYeKs+gLKOIDJT8F9q9TqtK4HjwFHKHrLIweStqlMCrBkZ3
	 OGYCFQmv/OJ3C9Da92tv4SauUQoAaFy1ISucLVyx7xa1R6UqVba/ruwexFtDePBmLtqMz
	 zlJSkpV89IWimAHAzTfh/SYKLhPHV8VqFOdX+QM61tzM9KdW03MPmnWLeFxiv+EZRbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bn/OceYF";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D764606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D764606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn/OceYF
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d6765756fso713724eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810731; x=1794415531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
        b=bn/OceYFwArPyDFSPPPx6F7fxbevCxKT8R7FeB0p2fbvIf+7OBijoe08vy0rwYc+5G
         /QZBWvJuKv/UYxDHvFcwLo1G5AofW5PO7IZT2FC4GT2O6VrxOvu2JcN1jB7k5hdV/kYN
         fS38yTExWUTJGvZc8YTuWCR+sxiYYi1vChhUP2aaBrFUuS7OpBt8gd/X4hXLV1RRI5mO
         ChyQV/5HOvlWE8Kuu1Qu8f1m4wzI2Nu/JhSro6UmNEX+Pux9AKYWt89R04k4H1B1tg0q
         BH8kBQIYND/ACmTt+ZaioNGqcPPB4bwc0yDq1hYXQKG2B83ZPSN2qQsgFmuGLfJUj+QH
         xj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810731; x=1794415531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
        b=QqUXNK+UN4TIEbqxrc2sCdYTjCbofTcSEFf9TWtov4y3jKqBcxKFUJ/j5CCU/rYCXC
         Uxj2be6hPSkUV0rBngazrVAdcvSZn9NQweL1M/DGHOXRDiDjVIim2CBb5DFeowJkpFsh
         ulfj4wQy20DLVpgszX2Su85ypRn6djqY+zXktXq2WA6dLt/xTcaWK0I87PL6gnqmF91Z
         r7iMpx2mlRB4eNsIbPkPo6xlgHRFmpod9Vz3eSCfOmp8spunWYF8LeOqRnoOekQsgWb4
         /oLKUcVQQtKcsAgTH1GB8jJGR0iPsB7D11eMn0brMSAYshlQFovKL0ALGLyCCIsI1XUm
         wfvw==
X-Forwarded-Encrypted: i=1; AKwUvBz/4KuPdXPsknW4Q1Q5wR14Sv3FNedzTFRahO1BpPQFdaJxrvtsVcmEQnPNLNHgwG6PZCtcOOIYeMya@vger.kernel.org
X-Gm-Message-State: APuU4Z/oMjULWA2gjpm2Q2R+uFSYxsDlpQ2xWvT4SfPvGfZH5pcHm/MI
	XmHm2qYRgFWybb8YSVbRKulSX9fPSYChClHXWJLPeP1c62adWliyLFHc
X-Gm-Gg: AYBFou0XfPK4ER/kjJOlqw6B4Nml/58Mhdi0kfd3hiWfcRUYhv0v3RRMvQOKn3Ppteu
	dV10fba5dMM8khyOnnBjYgnu2i3B8GWiRffCU2dczQRi1NycpqJaoGTONUB4t2aTeiPseQV5AlZ
	eFXdNLVIxfTONVywdfGbSj081LSQTMkqhytwbBcV2snRjiN2SHRKpfDs0t2MlMPAiohA5axdqX8
	L7TrEeeDv+R5lSC2pntgmCQvh+u8vVHTfmZRJeamOL97yLll1ZjuRwSeIH0KMWLBDjIqdAPwcra
	qupw3tNZYNHOAqFcxKMHTrsuMN9jhPB2yG6i3g1keLr7QDRKfgExv1tWBxzIhn9Qr0qkAUdzX+A
	CzgsbDF2Do7CY68/OFs3/j0VlUt7F6NgTcGPd4aaKjytaVo8fKKrZUII3o4HBeH9jrIVW05o0nx
	nPZK2Ju5+Th8P1BMpcttvOZxac9n9XkuQIoCWRGjjq3oztZOGy5GxgstkU8w8VcFN67nMsdkC36
	RE18/0iHSeD6RBDl26LnZnGWcfuW8/yln8sLVSHPMVthK8bE5qHuuErdwg8TQSsL+27ril9/+yj
	h4WxoHRSjZZtrdHyILg16YlDejoONJg3koEDHP2YMO1FwmGZoBW/6s0LfN46ywuDn7ai3WYW4Kv
	hJWBO19mruRM4usRJU3O8aTU0wk7gRyHu3R+SCjmn1ZK3Lxff66NsmbjwF3LIbzYCs9YwIO688X
	X/T/HeYlkh2znHYMgbQSZLhamCaHHmgadP/mtDTVBJVQ==
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr28669874eec.41.1793810730934;
        Wed, 04 Nov 2026 08:45:30 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:30 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to 30-50
Date: Wed,  4 Nov 2026 22:15:00 +0530
Message-ID: <20261104164510.105359-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104164510.105359-1-kapoorarnav43@gmail.com>
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
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

Channels 20 to 29 of the PL-SYSMON block are its fixed channels (PL
temperature to VCCADC), which the driver always provides. Only channels
30 to 50 (the differential input, VUser0-3 and VAux0-15) are external
channels that can be described as "channel@N" child nodes, yet the
binding accepts any N from 20 to 50. Listing one of the fixed channels
there only makes the driver add it a second time.

Limit the child nodes to channels 30 to 50.

Fixes: 39dd2d1e251d ("dt-bindings: iio: adc: Add Xilinx AMS binding documentation")
Suggested-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 .../devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
index 3ae1a0bab38f..0872f5f314c1 100644
--- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
@@ -160,17 +160,18 @@ properties:
         const: 0
 
     patternProperties:
-      "^channel@([2-4][0-9]|50)$":
+      "^channel@([34][0-9]|50)$":
         type: object
         description:
-          Describes the external channels connected.
+          Describes the external channels connected. Channels 20 to 29 are
+          always available and are not listed here.
 
         properties:
           reg:
             description:
               Pair of pins the channel is connected to. This value is
               same as Channel Number for a particular channel.
-            minimum: 20
+            minimum: 30
             maximum: 50
 
           xlnx,bipolar:
-- 
2.53.0

