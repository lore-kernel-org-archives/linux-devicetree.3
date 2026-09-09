Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E2470EB1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942670; cv=none; b=UnbSu8KSKusnRDWki9MqeAa+WCYey3sVzhip9Ds9w6bLFogiPjmrBt8/sIXKnz20dbfGbRyqhPixySOQIBO2WFrYMw7AA+QRkZUsONRZkrda2l2jgNqZ23XndNoCptSipRts4FzaEJTV6LbGXujhuedIJ03aoSbz3mrfT3LRCkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942670; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2n38ESqhEcWS3/j9qx45ohwYXNNYu4g4dn0alkh+CN9gSfcu57N/zp3yPBIc3oWtW9wb3KOJKHxlMzmi/ddG66Jb8JI7aZdDiDy771cQ2kz2FZPhzSFw8DR+W0RyHm32QiCI5jwBSzKil4xX8QCO5MuL7wpO4if9+cRGGpVbHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3vpeS48; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3vpeS48"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1497f0453so3989195eaf.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942666; x=1789547466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=P3vpeS48JWiWyK4+WoYhfjKUJEDSRSkDAcP5BIff7quilpBnEMOrSh5bnHDHZJLQ/I
         P4MEsf0O78UAzZYWmUkJJyUkoPLzKNol8qFXvklseN09ejGC0cSXPcy7Hp2quNgcvLDr
         6PRfh7QBAcUmoHbryWxEwTwzRj6XV7T5WsrNRuFitTfZK8KZ7qwM1xIk9vi1x8o1m9GH
         IOFZQizDn0ks2MVTbyNrGj471rQRKfAr5ct5aJcZ+omfKvecNWVqRqDryVAP6FdCbxZT
         gVSJkcNF8Ij4uU5O8XznjZPaYPeLmL3siwEl5ZlYRBhRUd9/cxeTkikd2SvG7aZk9yni
         Ll5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942666; x=1789547466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=O1+9KZOXQFwZR8z+97fy15FywPePozaATV9OYByKd3npWEstfEg9xdflSyHYwdrWXR
         DkFKb+6PFkff6HSD3PDmVy8wNKq1jjrfZO5kspNr0eZLSeecDIt1AE489Uxj6ik1qC5T
         ewB70Qo+wWV5wbBmMerf96PxUkkb5+rEmGh2dR3s3uzDOwypKtySGhdSf5Bbvs4XW2Uk
         yI0aBXZj2+1ytsDYLkqX9iVklPRqyL+vqk/d+Y3BgJwyRRNvrfquddGuEZJCTqdkNbv9
         prmYKAasPoDdfj/i9+QsTZaX/U+Wf2eiKt1R7fRhf9QXxZP67k7q2RXTbGB9DU+fQoLq
         nyiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWoNiypdoDJdBuCUneu3VhMe4QsLSTBxT3Bauea6ZuPgR2diDcUmqFEG1pkvYrotK0Be7ntkQwKYz/@vger.kernel.org
X-Gm-Message-State: AFuF++kflwv5cbIKA45xxCExBVr6AzrGDgexmxh6JMI5hTmEd1CBWodi
	cZVOawn5xz5W+Ww9m7cTPkoZSkCrwHGi38X1W3auX4pxSXm1odMlBRho
X-Gm-Gg: AYBFou0nWDjo6rWYzt6S2aJjG5/+UpiEJbmU/urhxzSq5rbSyraoWbpVFFWDmB9FRWO
	zAwvYR1Ei1rqgA9czRI9tODZOjwb+m8umCj3k4R/n5tEBDGu0I4IZURp8eYyedHRq0GWVgdNvvV
	Kt5ggtZLx0zDJm0vTij5/gW+Va5bptbMm4nIqjzr54hp8bp8MD8zGyPt4aeqsaRz8L0BnChaDHT
	Zo5lHNCm3xWmvVd+0OISFemBuHNLycN+mk/QhCj5MRSwtrG0oBVo5TVZiYrMWbT7G88QZEGAv+G
	DdNi2cdUILh5s2ozvYIEtqldChI9KAYR8NRpq+06OOs6WnDGdZl0/oTunDHwpY0LoqujmeVIxbV
	/2DMRIC7iiGbB87WSKfitRCnG1ZLlebvqivY7RJ3SW+0buidE56J/z6jngaF4ov9wwACjYAKOMt
	Yn7ixZat//DFx0YvEo347x+GLdsz47n+igPER96NjH7aLoHbrOcQN/dfdmab145J9BSZTc9shi3
	13yMFp/P+feQ1c3YCURDj/RcvHJhDUn5Jjy1lidz8E9eG1k4BUvTnruseBTZjC4lJWV151tlFvA
	TFsOgINXXc25AOUIBlxKTLvxCyN3TWeAGQnyaLsqFKZWw1N8AhOM94AIfPd+KuE8a4YSZR25dOP
	dIa5dn4kbcF+ggRSr6jfxbp/IrAYD
X-Received: by 2002:a05:6820:c84:b0:6b1:a0b6:72d9 with SMTP id 006d021491bc7-6b6fd3d694amr18766040eaf.25.1788942665879;
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:42 -0600
Subject: [PATCH v3 09/15] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-9-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

