Received: from mail-pj2-f36.google.com (mail-pj2-f36.google.com [74.125.227.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFC13D3326
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880323; cv=none; b=noHHEqXGprcRvMMIsRY/Gxs7vngY2PpaWN3KDspOX1a19VVWHgv8aIMBEJOwBhFKjfrJRdTXtbp96Tav0X0Wsr3ZrNA55rLqzNrVwFdXsDkNNMWB6ilGzpe+CmmxZxeKyCFXo4AZysu5X/D71KLMje7NPJBcfwW3JuQvm4R4Aaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880323; c=relaxed/simple;
	bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkNwAZttdhDn9kNu2Lcg8yDHZtstzcmr/Dn3Sl7ery44dmTzTFiRZ0nENFLnd4par/ybZsLFG1BjNUy9l+enA9QZvMw3PzrOVWP9Iz9vu7lI5hOEALTuUiAeUvshP8e3IO341fHU08bS4OBJ2kCl24wJolZ79gKcHszJ+bB+t7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9nfcVp2; arc=none smtp.client-ip=74.125.227.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9nfcVp2"
Received: by mail-pj2-f36.google.com with SMTP id d9443c01a7336-2d8fdc579daso22635675ad.1
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880320; x=1790485120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=i9nfcVp2Dry3qKRflYmMIdXL6MjoEVFxvL2T7tgECLVqB8PX8p2VLC2wlMFhEdv2EQ
         zBxHlQVRAjgGQ+xmUg9yKpDgg1Sf5LonBpgvbvC9BMhOfM3rKuenvECpxiWS0/NAuoci
         QutVICTSOo9pMgUt9kZpZqJL2SOh8DWdYC5VS5sgJwtEAgWGRG2Eep9eGMXdIk7yZizx
         hlBe4knhiLaFEx8mtTceQ88RRJLoxmxJWKMkDhO3ZlqQV2QgLT7m3LLUtZOXHcIQnKmz
         0GB/3KFq/OzJSixTB5GVnWFeM+Crisz66sI/8WFUJpPJ+i0r/ua7HTZ257BTMyLZw9qf
         +pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880320; x=1790485120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=XkQXFIu8MIRrwAI3Ycu7NtuFBKK2izOqZn0rLEDMSK62tKOKJGWuohcZHAxYGC7TKM
         UeKdItlGAkP3CK21OWKFOwLc++RpBQPAPUQ1JlBbPzCzAkfaAA2+EJ5sow9PtDkmd3R8
         xRzHiLj1YTPC0sGJD/wdteuts9o0Osx5W357Qv4ndXq+VyZLeqlYdVysPGixske0cD4L
         7LBiNvkuZNz7GUem4xJmeC0bEYi1ClfYD9sBPCbVRe/R3BH1q+czhn0mIPsASnRxV+bf
         YefVjs3WLJo7fijfBizd/ggD4WcO+11CwmYBhmTp1fnSRjFfHYAu7u+Y626bqTimLqrj
         CyHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV+MwF/APhyg3lkhXX0euZzhRjOp0lVRvheRS8/RCS9D5fctNBncvm4wgtbTNonQmKVrazZu5OVh8l@vger.kernel.org
X-Gm-Message-State: AFuF++kMBqXMi7B6tGn1EjEMikh1S4DwGWcR8yz2qGQmoP8hd5AsOqoh
	qD11P6NkbsZJ6biVKepQZ08PTNaZVWDzbGXUpR6x97AdyiGnQ0MQhJzN
X-Gm-Gg: AYBFou2Wmu35LsqJIc4REcZWGvTlZgCvWU9by8hDD60EO/pEn4wxsshCViSpl8Nt2gu
	T//+KXQO+buu4NYVOoYgptndETSbm3+EhgFbt3WGmRetNfKKoO2/8PA2ZXg0KKna8TbFzZuFyT6
	4oTjIvqvgXsPQIM1rS/F1bchLu0CDWdCoymPuROiAvK2tweOnJTCWy0G/939v8evZ4Pd1DuJwC6
	K2kT7MgvECtmCEzeVUqoF79NxRIQKutj+fiCBs/CWXJer9Otj0LG6jX/7oDTOQUXwlXQHCn+NIt
	9il4dkCUrn+r9G9lVtB3GpGqASE8GwtL5oBJz4w454P45NOHFmIkdeExzqCaJlq680T9DEkd6tC
	wAhjzTJmLQaGSOKQdFixxW6lRHgtRg+y/4Jb0FhOLzAid/ZjDQruM9VsBFjGkNseEKKRNlzbeAp
	tEolGcnCTMFsksWPJAJiTrdV9Rjctg9IAmwWlWDORZYWdmi3C+mVDVCggVgc+0vuok+VFSSUL/v
	XSeZXehQEaucaC3Gz0zYRe8aif+aQE5d0B9uB5WzcODGBshNAdSVEjcm0WRJEK6SCpqqBqZk54S
	DPUnmub6GvQKnWVwF2M2/iBG/Plpw5JpIx+UwThrSTRRcHg=
X-Received: by 2002:a17:902:728c:b0:2dd:ad74:ac1f with SMTP id d9443c01a7336-2ddb1bb26e7mr76373875ad.26.1789880319821;
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:02 +1000
Subject: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VcxLh0uAQ6FiSlzpQTeSvnrh373E/mvGIyzzXm2
 3z983M7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUz3rDsM/ZaXESME8nayVqaKSDUuiH7OXfN39fW9z/Qe1+UohogezGBmOzPm6p4P
 dwPaF7e1y78Xaonw8ektLpG0KnYNSTkqcXcYEAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..50088283f2e8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,59 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio", "apple,macaudio";
+		model = "Mac mini J473";
+
+		dai-link@0 {
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.55.0

