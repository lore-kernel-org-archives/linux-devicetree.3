Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107883CC7D8
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385630; cv=none; b=t+CEGBp/2I8xPzKL/prc4CHX0ojmwE+AyyQ3WQWJDx2OUuNU7ZTn9HU92MMccs2II7sAzPWInBYR56vZsSk4NcdPA5dkU5CmiJZ5maoTXBJ0ip5COfdmAhJ1DvggAffuxzCsWY0uK0ajM1I0c4cFmkvqTogdAMV/8ZOe9MMMLBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385630; c=relaxed/simple;
	bh=NawWT4P/pIY1IoFi5P4tzviTjdUGi4q+ZFHd2aj68LY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qom0L+p8jUEPnjpVQTwwlUKuFynP0FpW+NbduCLEpnv/dfUVSiEcQm8coroFk8zppU16ChGGFZG3dja4toasoR5XPeKnXdWkolU+us0yWJHMHqG+bYMPCFAvGfnJ8n/WTZqddtGilwNNz4VM1bJdZMzHZF6F4iK63zEJXEbJ7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=l3I8nKiJ; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="l3I8nKiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784990426; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=yn+WUL0msy3fSNyGWSzDvC
	fpUDesRlvd0CmG8Lm/7as=; b=l3I8nKiJmuAiWienWfHdaL4deC4rdem7bwg6g6
	nofx20gyIVtSIGdClX2RMeLcO8jA1mXMhi4tVO+uuik1oZzp3+iA6UcPURdyG2p1
	j+kQIDyJxYH112/LoDSIqAPH+7ova8XhHawnwCfgmvxZ5gOeOdFmRU0qtW9k9Sql
	X4eUQ=
Received: (qmail 1927161 invoked from network); 18 Jul 2026 14:40:24 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 14:40:23 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e639f57a182e00a-00a-4288be37
From: Yahya Toubali <yahya@yahyatoubali.me>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux@analog.com (open list:ANALOG DEVICES INC IIO DRIVERS), linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS), devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 3/5] dt-bindings: iio: dac: fix spelling of 'reference' in adi,ad5791
Date: Sat, 18 Jul 2026 15:40:02 +0100
Message-ID: <20260718144003.1880533-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Fix misspelling of 'reference' (was 'referance') in vrefp-supply and vrefn-supply descriptions.
---
 Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml
index 2bd89e0aa46b..80fb98035c6f 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5791.yaml
@@ -36,11 +36,11 @@ properties:
 
   vrefp-supply:
     description:
-      Positive referance input voltage range. From 5v to (vdd - 2.5)
+      Positive reference input voltage range. From 5v to (vdd - 2.5)
 
   vrefn-supply:
     description:
-      Negative referance input voltage range. From (vss + 2.5) to 0.
+      Negative reference input voltage range. From (vss + 2.5) to 0.
 
   adi,rbuf-gain2-en:
     description: Specify to allow an external amplifier to be connected in a
-- 
2.55.0


