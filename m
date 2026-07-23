Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9234B1AD;
	Thu, 23 Jul 2026 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824343; cv=none; b=EBx267iEBw4qz7YymP9VB/OHEYW2r351+MICniV+W22//HOfYFkooMfE4CUazcjMWH3uKHq/IQexALgOPitbg2rA8fpzSjTXbKbh+GQ7ZgeJqTxNRLH03kNxXN28I0h0oKR2aKwI3fxmA3GNXQsLuql7tdTpy6V0V9lkqn0wvMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824343; c=relaxed/simple;
	bh=/9wQhNpMRLbleeKLSRQV39PTddwcffZxQnPG9IReTP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALEOIE36iZCGWIIY9eEm4GcYJFfbv97ihcIehsEenoDJ1aWb7Qwz65w1TkPztA8wYFhsqy+zEfT2/i6rvR9C2NV+4YlErltgfQIfFeQrgyo4mts/3D1N8bKE8k3IqexZSzaRzrTje8TvVNcXxUX/qB8Sd0i+DltdBJKE1DT6zQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NnosTmB+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NnosTmB+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A02E24E40F11;
	Thu, 23 Jul 2026 16:32:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 748A46038D;
	Thu, 23 Jul 2026 16:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EABB11C1122F;
	Thu, 23 Jul 2026 18:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784824337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BarVgAGGeOvcPeeUBNpcflLHNBqaoPcGJM6mqXgOooc=;
	b=NnosTmB+6RyUpm4Md8ka5qAY+JH17gCvkyFwghVkSgSMzX7yH48jm8qYNYc+CpwnaEcqN5
	H5N3Y5e2vp5QnaooGHygoEnIXvgF7a2CKETgjWoUhJjM9d221ttk1QNdX/jadjslkxCGfj
	vvSRPWj2VrOI2dziKelRTlgmukPLiPa7khpsKTU27pQXXYLmBZ39uw27qHJoejg+Imz4A3
	LHiqL8JVVbi7k7YdlcsVmKQfDUgB8f6DdeGlMlglNkQ9rmsLk4DIsHKfuUPBKxDXfm6sX+
	q2/w38R0tgL5Morc1dWR5wwji6hOferv3lMpQ9NZK3YTQhrcuvZV647eZOPNYg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 23 Jul 2026 18:31:49 +0200
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Ampire
 AM-800480N3TZQW-00H
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-support-am-800480n3tzqw-00h-v1-1-6a4ae0575a19@bootlin.com>
References: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
In-Reply-To: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784824328; l=1016;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=/9wQhNpMRLbleeKLSRQV39PTddwcffZxQnPG9IReTP0=;
 b=yADaO0pzjUcifVvpUMJXtAEoCNvf2KtNfDAwCboRylnA2wXtGR3MZiye+0OvJECHuNEyinS5v
 RGA6wv8d5N0DASIgp/uSHNFCIULPcghnEjhMT8/KRrdk5YYgn0CLWJB
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add compatible for the AM-800480N3TZQW-00H from Ampire Co. Ltd.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 21453f0d7ce2..3d1cc11ba3aa 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -37,6 +37,8 @@ properties:
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD panel
       - ampire,am-800480l1tmqw-t00h
+        # Ampire AM-800480N3TZQW-00H 5" WVGA TFT LCD panel
+      - ampire,am-800480n3tzqw-00h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
       - ampire,am800480r3tmqwa1h
         # Ampire AM-800600P5TMQW-TB8H 8.0" SVGA TFT LCD panel

-- 
2.55.0

