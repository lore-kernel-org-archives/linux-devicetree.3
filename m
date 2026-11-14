Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645519;
	b=kgP7GUWvVI+ZcM3Nn2i+vmvRLcFMk06OXNsK8IwaTZojphAexMsDLaWQuora7ZyARj3y
	 vC9c/eR2mNlmdfdOndDT6IxrAoNKzkhcfArZaGRuUaW/N4Zy9O82ASkk3LE+uABF/c9MZ
	 jn+dpAoVCLu4Vr9PZlX5NMsFFuynju7c8jDSoewwi9/ivexKUQSxl/mlh4m/CASEWCp8h
	 JvmdFBcDdHNEY2o4qNLTVsFcqQJznlWabn24XuoI4sx0StVolQ4CTSiqnHbrJzxWmotwr
	 jY+Inp/rX7yF6iNwhxTD7hQhlFpnEUD5kB+JPXD5GgMmj2wwDhTSI6/p+Rw60qYEuww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IrLTARzuKGpNCEUALTN/Yh4br8W0rH7Am+lSrApsbX0=;
	b=sxO8W+NCbjLjrQwyelz98L8tULRQSlAeuDEjhjLk59hE+NkdVMhSRyZAiQ4K+GPRTgey
	 b5MDzeL2udYPSpsPT0WGkdF/gNzL9/p7Iqv6IuYJ+CFVMZwWqx44rfqDduT6g2FDuST6J
	 /a1C9GhfTCilGr2o2a0juYC5QksakMVwKyTHceaQ5bXS5OikvulFWMYqoEK3/TeXj76yi
	 2Bp/POXk629mvD8x5WtfbT9OAtMy/MuGhy9eyuZpETjmL1fTeAcdNr9LGV/wdWykvSzhb
	 EPNDmOeoAKnM/RK9G8k+aFuzrI9Sf5gGcbd45bJqAW6FVxqz3GQjUFq2YSMseQj6+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0Mb++yI;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B7F606A89D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B7F606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0Mb++yI
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ada7d53082so27543671fa.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645517; x=1795250317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrLTARzuKGpNCEUALTN/Yh4br8W0rH7Am+lSrApsbX0=;
        b=t0Mb++yIbpunMuxHHwKZuirS6kHgEIlj7XoC7EmEihDJtgIj3Cwk0gKAO0305MGXd0
         3x9PYJr/2WJaI9StZ+dQCTjk2p4jiHiIeqgQTk4fJ+hofbbc05trklIFVtT1OxHXg2XI
         0rOiEvHMjiOs39KnOMCkVnXpKveQgC3j3e+eX1JYHZMAyGiJ7NEa4p2Q7ZK2QCH26w7F
         MuGf0LMQ7sun8vH0IRFRrUBUvHvrTNgqKhkWKtd3+t8rn3n6g782HAAhCOUvS6Hjzwyi
         D99bK9fHfdNZ5mSEyRLhMpESKW2A2+gOb1Di6Y1cQMdqIqyJHuQFV+Uqz8IKAjb3BKNQ
         L2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645517; x=1795250317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrLTARzuKGpNCEUALTN/Yh4br8W0rH7Am+lSrApsbX0=;
        b=HWeuilJw2/CPSsDryyFSUzWkkjk/te9u4nmC/Xd6sxV6fGgzstPkxwoBB3mQs2R4qR
         FKQhhM6AOK8SyT+EOrOCIldsSqsujizkYK+CNQJK4mgr9g/RKxVZHo54Ky1hNG3quEBJ
         5lpNGHlkpEh5kPPwtxW/bKIcteWRHNvev0z10IdNMByBqMxeZqkFg0yFaWWp085wipTl
         SL1kjmznY2I2CLmErMUJlHgHGosE3i2CLp47/1HIL+0tw1NtwkpUI0ZhqsjoTQjx8BIs
         YifO7vE/b5JhPDT3PsQRiXexcfy17ywFax4dGGaeElQcJ/7Kn8h7oCUwvmCRqTxGtrzt
         cgzg==
X-Gm-Message-State: APuU4Z/M7zG+6FgZeLv4j/en1GW1oOe0FnCTlJIFyU24VqYkP49BSl3c
	mQp3F4KBt0al2bqTnBqJx3HboqjWyHl0Qmjmyto996HXf5K1dyFzYfdu
X-Gm-Gg: AYBFou1XwHP9Z+bsaiQN5+hNpewLwxvzzRIK9oBtX3SQDZ+o4OWGl1aw8MVSL+CeBqH
	bJwOUcZPHiP0QOs5v51zsKvjf3CdinkLZhA8EpVy62ufCkpkhiQgGulOfGIMNRnIBMGcmwXtzlr
	MDcuyk4ZrNqDu85vAUntAtdIgYAAHU6AfuSiOa7mRxNuzDEAw8dM13doCJN06ulg0o7rGIMSe2h
	JlBZphLalSE8+WPB9bglBWNCQUiuI+7R8l4bG2J8uK5Z+vNd94UT4hc9yFzlOfw9PI+H+2rCd0P
	kV1WmMVd8UiKbCPmXtxlOUHprbUMKXplUNx/xheMPw1R2eNx9YHUTHi0KqV4XKV+hoprENrN41T
	1CtIVK3HxIPPvk179GV7//eGIgvLgJ+g0EpnQu6FQk4B0YqNaNNigIzlpllLAKK3NutsVymgjVz
	EDuvzmeYsyXLxP5PZVXNKnTxSIMtwtefeFLgxw8Odlx4Sy1bGS9wNEAwVQu6i4yZZAMKIozXaBX
	sAB2rbEGOMgk5cDmIiVkkEkpXlYUDm82XA9qy0lk/eTfXzNm/GMpyLn92W+Q+PeRzBOCuyjaGZS
	sLBk54VtPt9gO6EOmcdXKuPvUjzoEbt+4WiO3zodc58Nq4GWNzvNn6zlPa2/U8B4bRfEcGLfV8m
	lFGqrehYAwT1GxibPMIygX9i2odFi4cU1y3KBpw==
X-Received: by 2002:a05:651c:1596:b0:3ae:920:ac4f with SMTP id 38308e7fff4ca-3ae1bfb800fmr22203951fa.8.1794645516894;
        Sat, 14 Nov 2026 00:38:36 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713565a6sm1527803e87.78.2026.11.14.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:36 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: pressure: infineon,dps310: Add interrupts
Date: Sat, 14 Nov 2026 10:38:27 +0200
Message-ID: <20261114083828.18059-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114083828.18059-1-zoone.rupert@gmail.com>
References: <20261114083828.18059-1-zoone.rupert@gmail.com>
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

DPS310 signals new results and a full FIFO on its SDO pin. In I2C mode
the same pin sets the address LSB, and interrupt polarity must be the
opposite of how SDO is strapped.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2: no change

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 .../bindings/iio/pressure/infineon,dps310.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 416117dfd927..cded6e0af147 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -23,6 +23,12 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description:
+      New result or full FIFO, on SDO pin. SDO also selects I2C address, so
+      interrupt is active high at 0x76 (SDO low) and active low at 0x77.
+
   "#io-channel-cells":
     const: 0
 
@@ -42,6 +48,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -49,6 +57,8 @@ examples:
         dps: pressure-sensor@76 {
             compatible = "infineon,dps310";
             reg = <0x76>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
             #io-channel-cells = <0>;
             vdd-supply = <&vref1>;
             vddio-supply = <&vref2>;
-- 
2.43.0

