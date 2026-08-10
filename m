Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE14307AD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403106; cv=none; b=Cwl9DHr7BNmZKlmK5mh0oWHCX6J7yMdehlDALKSlXXS6uVCJolT0JQOR6/37JN4k80uygPDLbiMzo+LGi8a0LTy39TDk8sQnJ2DQ+6OBma3e8fVXqV98gImq8I6DgOCMqqvAKSycf4coKMVj85v6pmDVdYtQJNkIQ9+lySBxoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403106; c=relaxed/simple;
	bh=C8wxNRLHTXJnjE555Pc5YpGfAsMOcsNHZykjvR8RKV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFotIejTF5IWT91UpPkDUZ7G4ujtGH9e3oW4A0vDPXacCFxvnNK9Mn2U1RFit9PQ29O77VJAQQ9HCG+WkxtpMnE/cdTVpZcVSu5L0ivUmfE7ig9Hq4AaXmQ+W4Bmp4SRlEo+zw9YWrMl+dDEBFbt59GCcYmfDouMc0S+2TIJKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Auabhuik; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Auabhuik"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso181874a34.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403103; x=1787007903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=Auabhuik/nthiUj0ZO8gKIV0CfhfN29Co96D9pfTyECRjqZlW29IusYkIVYjNmKrhS
         kRwJi07hrqcjsgYSCrCsxhsnKQB81P6GHoZDmvBB8H+SZ7/8uqflvrom26X/OJkghyog
         3x/gRZN34xD72QtIB6WTInAxSFwX2oL3crLeVGnUOaqp5vg9cqEJQt7cp9dl7zrRG3Lg
         VHtqWWOK6w4MsaRvdB2aRM/Io74zv+8riTvnmNsxOfOkjxvUgzvccc+qo1F4xxurs/1m
         H3dUjQlxf71Q74KoAcyeQjwjxRcFsvfMHTfXxJ8ATW/vHtK1lzJkyAwJc6kY0vRAzdTm
         /H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403103; x=1787007903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=aTpBp+b9WeN7E7wyQtd2WhmpBNd1SEFdVtRg+FkyneUTvX6SfA3AHBt7oqOvCwqWHv
         3gr068wU1GtpFaPJOwx/z3sI+PEfaQYIx5wSBH1F7ipdN2BL0DNgY7V/NKFGcHA74vG/
         7N1XmqxXM7PEUeAU9/7YlYAnKaq8qRgKpEJeVNDaXN5jzUoS4xNp7I8fDl4cOQiQdljZ
         V5OC2W+EtdBGSKG8k7m8y0l4L7PnSc+pJm5+mKedkLPdGNpKhx0vyqeA60F19lu5yzJp
         OL6red+E0CbuK9Zdvggm7g3K72amRBcvYaFYg/p9upIpeTDLWVntbRsaKWbHe+Mgefnt
         9UFg==
X-Forwarded-Encrypted: i=1; AHgh+RqtFSeRk+89G6+E6/jkV1tJYI3QqZN+RyHGwBe0vRJ0pUbVMbtzcTfgZGgy8Kh/PTduNn4Wr6lo0tig@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Lj83b06Bvk9XDxJ+eWzE9wWs8LjG/GyelE5jLdg2LgD2fd85
	pFsz+0zqDcuHFfHQRzSQh9g3aRKw1LryBhXLpugvF6JzVa+amGSp8Ir1
X-Gm-Gg: AR+sD10fC59OtnaC+LdhHowGXyrOVt5Fws9zNxstTrDnBh6aF/5simE1FjXc+9ubnq0
	y61B1XIRJZDQAnfCrRxWW2HCB2n4SeRz3kdAM4+8hwG3Z6UpvAJ8mYHz+goGE+k9jaccHcCo5zg
	1zsIF8HGRkr3VF3ZNHVj8o4BybvZu0BhmgkGeANlsWffcbzxZyEnoiXP2OwwEysdJlKy2kSfIc1
	SbHgHt2zichyR+Rmypg5Dab11qWIqbxceqLD4IutaL5Ju7vGUKSuZPnxkB9Hu45Zb9gvjgqIdRi
	Ia9AOJWAGGkg7wYHAIerNcOoUvjEPQb+w74dXat2HDLcJlj8EHXDW7jw3Z0nkNiFn2MaaoeNipu
	ue0HX8RY7GEe9hTvDeuvQS/qh+IIDXuobsFEDo5pyOk6moJjjWqKW25c8ovn5UpOuSEb2cp3WNp
	13hE5Ee4qhhPGcZD6XWnKRSlVx/O8gSBk2hF1LZYRxGzWpzK8rup1MkEu7MKdWG2GKJFksyxWs9
	zejJFXdkmmHG19ARno8MU/MSv84/QR/n9UDxo9vaDgQK/axHNYGx33fbsHOJvaHd3ssHO1GymkN
	fVXqCbEki7RPxVTMMs+tw1wFjFbOOV0eLnVXNZ6Yzmxc0ks3g+9YyNiCCtDCif1ecuLBDuYYdPc
	WiaW8QEKTJp88CtZ/
X-Received: by 2002:a05:6830:4414:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f1e5c98e5cmr32808491a34.3.1786403102967;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:49 -0600
Subject: [PATCH 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-1-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property for NAND using the randomized normal-page OOB format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..7eda1275135d 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,15 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Use the Allwinner randomized normal-page OOB format. This enables
+          the controller page randomizer, stores the bad block marker through
+          it instead of compensating the marker so that it remains plain on
+          flash, and selects the controller-specific protected user-data
+          placement used by Allwinner NAND firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

