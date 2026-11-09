Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217318;
	b=ezPpCRoVLVIkm5RPWh/MGZZZrTWQOzLUpbtB6H5NxW7i9wDgy9IJa01wMSlybgtNr9dn
	 kbhsOXBYDdGqjzI5tpgtYWhhjS1150U4EimdhXrlSVG6NG+dT3OuFQKkLEq+8W1IxmmSP
	 712Umtez9nffgIGGEReNBPaXDDC+KpVpkdPBqOlbZBJGXrEj3mgt0t7CK8cQTCf2ds9Eb
	 9sQ3SgZGb0GaGvmyNBi3y/1V9I2u/VDd53n6+wyk62bpdt4l42nctNh3T4QpVERxCcEcc
	 +TAQ8lZArWGFm3IsgOYWGA0RV+nhAsKnlYjSbu38WZ0A6lWNu9sYFgT8FdEwwsbnj6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=r93XzVB3Mw5/o9AS2aRrBAkJ8mfk7Pdmi+7Ik3SQfyM=;
	b=Emd3gghZ93OcoKEHjAUlbXWeMDPMOwIv1fDnLUmotwR9VvzCMo9F09r24ewSEmrT9SrG
	 979Q2VK8KNEkxw8FOemL3sF2rCklzNTMNk1xSwZGkeI7z5x/TA9yYaJNVjACg13gAGRto
	 rKwWdrJt2sSuwHv++s3e2sWZ3WzlzXi46KLT5PlBPjDt4qe7FZwqEE3jz6Xt7fR9oeOOg
	 2D7ObGH2bEhzQ8JoG04abJOh+qjhnytpFxNddnn+fslYmCY28Il+KFP/nzqjrCWM+qUsd
	 vlSbuhv31gxM/ve7H+Jr72wCq67jivlO9LXwTyTjI5H+GNXusOXsl58eWq5HETwxVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cD7VHbjy;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D027606D803
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D027606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cD7VHbjy
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c1d337d8so436615f8f.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217316; x=1794822116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r93XzVB3Mw5/o9AS2aRrBAkJ8mfk7Pdmi+7Ik3SQfyM=;
        b=cD7VHbjytBeJwEopqcJf5o5WnJl1cuopzqLaPLHwX6UnqEzoAgozVPUH1ybMFXsLR3
         JlieyB6dDtKzefMui5xiHDk7hiz6zcSZqve8nSNFhTu7ENyul9ThsWQbWyC3vSn/sFsl
         GMAZSh7Gd0umBYIjbHCmUFkprpKQfOik9SMwvCYAR1jLJIclfj5RgeWyOs7kT38TpVto
         +0P5Fkd8BB9zwIKyG5PTImPlFlaL2kafuxRN7v6lYc4gB5rz2+kYYveZ3oi2kgH5jqxx
         bMD8qTrQIzUmBNcm2GtWW1bVBnOWhorXS5WiDIMgbhm/fgVlCQxRKOntq3hJQaeJm9zK
         ImSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217316; x=1794822116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r93XzVB3Mw5/o9AS2aRrBAkJ8mfk7Pdmi+7Ik3SQfyM=;
        b=wW9iUanc4GwBfbP1Xx1uT0pm8ETixFNLwovY5MJFhu2sa6zgKkQCwc5g02yqPycW6E
         cMmz8HxCRb7WdGUJ9DeK0/NSmWmD4gAZKs9efsro9zrSETsx4WFfblqq4H0PP8AK4rdk
         ak8UIvNL87efavNwocpG0n3cLkYDwRSFZjD20W1eS7iAswCSw/ELGc6b+mjKThC97CFl
         bmIeBk9VL4E1KXVK2vGVLVUI+S7pkcF1GZN5ZHl6RktYqTznU72V1gfFDVbMm0umjad9
         0thcJDJpaDS1ptHgY5/LWPIcNgqsclrIfGPDDh9+E7ZXqR6FvPA0ahiaMq6rjNtU9coN
         F03w==
X-Forwarded-Encrypted: i=1; AL+hErHncerW9WLAminWgo+v/1qNGrk3BA6GIk0Mr6ugo970IQ2849kdJ1ML3zF0AY5FutcCc8qlavinKLzY@vger.kernel.org
X-Gm-Message-State: APuU4Z/2s5YencHj2y0JyPPRKgCTye8MwCLiwI7ygdAo5SzdXU3vjh4K
	OIIKCDuFTjQmPQKPf95i8T2xIPReJtFgKlpV+g/OPQHEcNv3x9kMb0J+ZhazFQLB0j0=
X-Gm-Gg: AYBFou0h904UZNLHEdGuYKvcdqgBXF4ToHYMR3PhuH+lEMx8XRsNpdaFGW7LI3b03hu
	QasQDRwDBuAxVpXwlLtXtb9HoP2MBzMDAEZK9Cl1n1OiOEoMm5Zgzs82/dCP82yneHvSHi+uNTH
	4M5mN4MyGVqOUKp0QOAWmd9O+S0slMyvWzHRNwtQBIlAUsI+NFP8HpBmyD2Mo3cAbr0m44PjLix
	dECmytCBlx3l4hGtogbKY7N78iNVVApDe19erobX2/t9RFpq18goG1EnDx42phT14MZ9lcehceZ
	fE7Hj8vjJEk/Uy9YW0iRkEN3vSHqWWj1ESx3VFave/mo7kt8JUR48+svDoKge7Y+1i24QxxmxHN
	6WbMIS7TL+ycFsXqFj6r2xxbf60M2HCDUW0yf73Ty55/t9Z5hvYezl0kWfLuMr3NiMW5DncRCQp
	UpFVTfPQCdx9aLkaUlDC5/nuaEUeTf5x6TIS5yrH53MbUCLU19lgf76byEMnG59tt76mjgVINOh
	+kgc4OPs1WaE0M/889GnDkzK5hgFHCYIGtNpueXnb/NXqXCnRA/s6eP3AoafG6fXCGXLaWXuMzN
	aY78aC0gRfoHqNNwlHXDSjsiH0I5SrlrOehd8PzJWbJci5cRLdPjkINoSZwHeEI30kw3Lu/o7gJ
	KFqSNif7y
X-Received: by 2002:a5d:5e88:0:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-49585f85d15mr6285161f8f.51.1794217315632;
        Mon, 09 Nov 2026 01:41:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:55 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 09 Nov 2026 13:41:48 +0400
Subject: [PATCH 1/3] dt-bindings: power: supply: battery: Add a charging
 temperature range
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
Message-Id: <20261109-battery-charge-temp-range-v1-1-a967abd8b80c@flipper.net>
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
In-Reply-To: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5090; i=alchark@flipper.net;
 h=from:subject:message-id; bh=s+ij2ixxg0Tf+IvaKSSYEw/URZBHqSW+IbBNwTTaFNg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBqv0Nq7YHdWVcC5PobOgwIB1VVbm5Zx829dfH7rt
 52zGThzOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqN15GhjlyUvNjgz4HnwlTjP52Nnz6+gcT/+vohly3ub4+pX2atiwjw6EF39c
 VHF8j9D67y1Tr7aYXZiESCqpH3KXsttpMeF5QwQcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Describe batteries rated for separate charging and discharging
temperature ranges, such as 0-45C for charging and -20-60C for
discharging, often with a reduced charge current near the ends of the
charging range: operating-range-celsius holds a single range, and
existing users read it both as the limit for any use of the battery and
as the limit for charging.

Add charge-temp-range-celsius for the charging range, falling back to
operating-range-celsius when absent, and state that
operating-range-celsius covers discharging. Add the charge current and
voltage to use between alert-celsius and the charging range limits, to
describe a reduced charge rate near those limits and none beyond them.

A missing half of an alert charge current and voltage pair falls back to
the matching constant-charge-* setting. alert-celsius is expected to fully
fall inside charge-temp-range-celsius, but when it does not,
charge-temp-range-celsius takes precedence to ensure no charge occurs
outside the allowed range.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/supply/battery.yaml  | 45 +++++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/Documentation/devicetree/bindings/power/supply/battery.yaml
index 9575ee1491bb..d2f2ed9a01fe 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -111,11 +111,21 @@ properties:
       for each of the battery capacity lookup table.
 
   operating-range-celsius:
-    description: operating temperature range of a battery
+    description: operating temperature range of a battery, in which it can be
+      discharged. Charging may be further restricted by
+      charge-temp-range-celsius.
     items:
       - description: minimum temperature at which battery can operate
       - description: maximum temperature at which battery can operate
 
+  charge-temp-range-celsius:
+    description: temperature range in which the battery can be charged, within
+      operating-range-celsius. If absent, the battery can be charged in all of
+      operating-range-celsius. Outside this range the battery is not charged.
+    items:
+      - description: minimum temperature at which battery can be charged
+      - description: maximum temperature at which battery can be charged
+
   ambient-celsius:
     description: safe range of ambient temperature
     items:
@@ -123,11 +133,39 @@ properties:
       - description: alert when ambient temperature is higher than this value
 
   alert-celsius:
-    description: safe range of battery temperature
+    description: safe range of battery temperature. Where a limit of this
+      range lies within charge-temp-range-celsius, the battery is charged
+      between the two limits with the alert-low-temp-charge-* or
+      alert-high-temp-charge-* settings. Each of those that is absent falls
+      back to the corresponding constant-charge-* setting.
     items:
       - description: alert when battery temperature is lower than this value
       - description: alert when battery temperature is higher than this value
 
+  alert-low-temp-charge-current-microamp:
+    description: charge current in place of
+      constant-charge-current-max-microamp, while the battery temperature is
+      between the lower limits of charge-temp-range-celsius and alert-celsius
+    minimum: 1
+
+  alert-low-temp-charge-voltage-microvolt:
+    description: charge voltage in place of
+      constant-charge-voltage-max-microvolt, while the battery temperature is
+      between the lower limits of charge-temp-range-celsius and alert-celsius
+    minimum: 1
+
+  alert-high-temp-charge-current-microamp:
+    description: charge current in place of
+      constant-charge-current-max-microamp, while the battery temperature is
+      between the upper limits of alert-celsius and charge-temp-range-celsius
+    minimum: 1
+
+  alert-high-temp-charge-voltage-microvolt:
+    description: charge voltage in place of
+      constant-charge-voltage-max-microvolt, while the battery temperature is
+      between the upper limits of alert-celsius and charge-temp-range-celsius
+    minimum: 1
+
   # The volt-drop* -properties describe voltage-drop for a battery, described
   # as VDROP in:
   # https://patentimages.storage.googleapis.com/6c/f5/17/c1d901c220f6a9/US20150032394A1.pdf
@@ -200,8 +238,11 @@ examples:
         ocv-capacity-table-2 = <4250000 100>, <4200000 95>, <4185000 90>;
         resistance-temp-table = <20 100>, <10 90>, <0 80>, <(-10) 60>;
         operating-range-celsius = <(-30) 50>;
+        charge-temp-range-celsius = <0 45>;
         ambient-celsius = <(-5) 50>;
         alert-celsius = <0 40>;
+        alert-high-temp-charge-current-microamp = <450000>;
+        alert-high-temp-charge-voltage-microvolt = <4100000>;
       };
 
       charger@11 {

-- 
2.56.0

