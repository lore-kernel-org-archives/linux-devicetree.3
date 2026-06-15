Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1043D3F4121
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526661; cv=none; b=lhgBPFx21A2H7AxAbpozJAjmDCije6Izs5b5U8un7YOtT5MuKiEL5F5CcaNkoTPE0aoKU61T/JigcdsVUjHPr3SJViw92v+TJ+YkEDg6fx3S/34qCCRkmKIDM5gf1Guce8OeUc2mp7LpcQUkGI3vIggKg2AvXialNM+ZpDuVOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526661; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ8PYOE/DWCRNH2pbiqJdg0c6aiUwlefTh5OCLgxiPYTpGzlrk9G3jZ8sDIuZM99RarYvosQRUd7fwl/Up6hp3SXkoA2g+dJt3NDWd6rJ7sEqgDfPaDenyDDtQhnd0DaaPAUPkPP/+C0MCu6TF5aam4Qav352g1UDA8nZHsh4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLj9FNF9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLj9FNF9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49222b6e871so18960955e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526649; x=1782131449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=RLj9FNF9kCa9JCJgII2lEK20OgFXJIkgwmHHFV/g4ofnX1cRRStGQ4lF0s3KNBCB/d
         P+NJHCYne6EdbHZid8DaxC10V5C1fobEjjlXWPU2u1P8gX++Vb6nl4TivkfTrAClYpdN
         YYYIKmxEa/pHTQ4zf7rX2sr1naB2MNdilGTKIDaqarsZYObQ6dAEFm0CClEKBIwrZKW2
         Uhj069wO8cDjGKJ5xVIXQH2AmsjdY9dCfSTgGlI8/AYvs2ZducVXG5h+CY1x1vOFiy8z
         OYkRTE6shBZyviB2H3t72IS0pea7rvSFLFceXCqP9kb4zgCjpdE5JwHv+78Va8djtRKo
         iFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526649; x=1782131449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=f7DdLS/ZgIgZb5/IhJxTnuBNJmeKJXPAurYI2Htdi6kuylhdE5Lw5rpH3HrWYPpK0A
         bTwkV+wx+GmYLiIO62ex+F7peg4Co8ac9CrrDczZa9zh4fz87P3GkysEHGzMXXrEk4LQ
         8lIkOhAgSlTlWrVjj7s3q7hzqg00R4HhEeWndVkvyEC06Ct+qCM7OAqYbSEdsbh16frF
         U5svP8wJyuehZiaY9WSQSCQlAxmHaxbmlh/vEltRZjvQRK91hq6gEkMdBqUNpbhxve0c
         EwJTWwtk2e6r7F8Kee2GSg1nFnAi5TEbw5wTCq12VyKyQxyViXig0MXSGLqWKODo9R8C
         Pm3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8hoO6pyc4XmK+an0rkwPWdTiDNgQTjSYvmqDj9lOZMhukNq+z3Pahq27MSRdM4TYf7ggVzF1pYolpp@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqrX7vdD6p3NQWbcyqErw+FB6VVgWzv8DgckDFNoFbiX3ShO9
	cJzqZHIVO/QPW6emKtxkgAIih7xyI3VMfc2zgllwwiFcdEbFaq0q6foi
X-Gm-Gg: Acq92OFELXqZU0rh5zViDoHS2QP9UjIOsAE/gn9GInKDgp5IDs5wiQrkWO8e8Xyx79G
	kUzFtUrcIJeiY8CILLbzQT1YABfzt28EBmmRIeenLli7JdtlYVUMF3/7oEi6ym4+pdDkgySCxmL
	w11/p8o+RGljljKhMtC0CMRpfSG0OBycEUnGFj8oWnglDY/Ptq73jH8zv/lOPPFBI0Gm9JyzRNq
	lsMNizCTLsII5rTj+V1C+WWb8DSesNOUY9QXu+KR1ze01WewqY1HrZzXoX4v1/JB5D5F6XLogXL
	fi2fApVICqnok19VIVviZ/klebGCg8FAV3f/1M2hsjo9V9N7HZXje+Ewnn08PPNlWMAT8SR6n4d
	SMfxdeLlGAbALJ7qiN/iAC3wLOagF6sBvCTn3ehYgv1O1SsBdI+NRII1uFb92ajirpxeaVWMtcD
	3CH2QAHgFiXLkhUix8ebhkpgJg6CQHUc3ws1sMvL0hJM6Qg2UFcg0aued5Jwmyjws1NQ==
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr195103365e9.8.1781526648835;
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Mon, 15 Jun 2026 14:29:44 +0200
Message-ID: <20260615122950.22281-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

