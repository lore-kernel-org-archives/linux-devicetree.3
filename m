Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501224;
	b=rnS5vbsUO4rzK+AQRdkILT35J2WRicNZW+kvT4aGrOj56DhTOr082BRLiYXPx24O5Jnb
	 5e0jumBj+1KYm2pQEhLHGdzh7llHzIhmBIZK7DlwS3QLpCxjGO6w7VmgcfRCy89e7dYSO
	 6zRbvekRbTNLkKPyS5YJ21CXEZWGVFzxtctD3g2IjWbbLwKW+3OJeCMj/rEoSETd7lVST
	 RT3t8dx6DtHmMUGVPfdyDxGjNSt3Wim/olVxD07GPjvZVxQnCQDRP8aFy5hd4C27jbt9J
	 m7IBmd/zVWY+Klff1AVhARor74tjzYRlJ9rHjScRXd/Bd+bhg+HCRFuWnvJWG9dCf4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
	b=ILpXRdrZQk6gzpmfO7/F66fgOdGwpfcze/3lvVY7Q4j0+qdDzIybngVAm7uWW78wNtJF
	 XQNXoW8aXvDFKMmrytsqCYePTqcXWP1suSjzu1z/5izPx+hWrBsnZ1QKvgo50HsD0ePWL
	 rxdUkOaW+rU6UMDIiVRu41G/b7DsuQLHkT9ythAHaLwQXZkDUdg4qetQ5BWC0RaIFFzq3
	 KRfLJyWQKkQCT6egd/lizzlaRi3n/7f9DdzXgTZUPm8xzjJFLQGNnT+d71evNLCBAtfop
	 t4cO7zPev2/uqQTHi5FBtNA9eXp3crNH5Hyc+VkMakiFyPGAcizVhZ55LVs8fHeRAdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84760A380E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F84760A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a01933b584so22868875e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501223; x=1793106023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=E0F7Hu65seHwVdW+FHp3mVrOVZw/FQgWjo23wNhERvnPDPX5w0fuyS9y/+K/1or6AC
         53UmLLzuXH0GmfEXR0ypuB/t1gOwLzBNFXykNEDkIOlFHgYRlyo2RTqsVEFbUEkAqB7F
         CYjn96br5Iz8K+Wh5YFmSKXZRx+8iEZM7Ix/7zGuz4Sgiyt0Y7EJcYfXE4YF5xLNjbMQ
         zB0jun/WZ8oqFSMDS08LmBk8HmP1Ic8HNig6WgKSs4azQdbVwst7UOv9UzQuc4EenfN/
         2OdjzcTCiwtJBA7qncngxvdJ9kA65aWs+JxwYIH5btwWy8w7w4peSoTcfgnL/Lfb7Z/6
         X5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501223; x=1793106023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=jd1h+eH0lD0Ca9ViKu2h4rXipmqx/GPmjpZdArYYTVcV29FKcWn4b4Ni1TuZzgGYgz
         HkNAicUt4PMGMBVwpPyCwvhOBRlClhb5lJpC7lE9jCV97uOmNhGSp4ugqn/XqPRRZE9x
         sntOmSf+dPfmwNUnXnGEQQ1k2VqDxbdQHiVvKsL3rxyv7UQ7byWeXxSCbtAMoSz3orgL
         TT0bAmI9u1Nur/Vm+4jmusX7mYNcJSnMDXmLDUwlLJVMUkn8JUSTFMSvtqR/jVaDg0GA
         Hr2FMI/fJg2HL7IGUlQzXL3GUvNPXkxSgPqncXCE97ds6fB/Ki/CYhS8BJBxdeQtrCTC
         u7Rg==
X-Forwarded-Encrypted: i=1; AKwUvBye8Dblzjb+Gw+vDv0WWqBpcLJ+QqTEkzKEEKfn0ae8WPe2E7Duxc0NxBtQBmoQgGTeOHV8juQ4uYxO@vger.kernel.org
X-Gm-Message-State: AFq9FYIQZFMWomZz1QxlKFlRtVTWuUj3jttAE7/Hld/wayisV4KxVj2v
	JKLwcQM+qtm802GTMXe6mFeZ7rovYgSM8mVhDTKSOslbZNbfclOPofst
X-Gm-Gg: AYBFou1N18LTQ9dI77xPUZe9n13oecObIrZCaoVh1dZpiHye/hW8gSlVfGtOJmaTOv8
	jo/+fXx5oWWnOtDoMT4+RcgvXZsA4m/EbrfZIizu597c62hTWbpOJVyFd481kENmwFxjD2UtB/F
	Z1IiJs/HZbMUMsJQ1Fsgk5B4fSBYLwh/tpAztrXxhlBHfIZgZUT9FN6Ox5sRfCc7yFH/D82DU1U
	WdrCngaKh4wEpi/3o0ANpUVG/x/2RuV6q9dA+RCsRJa3pxLB+kPiNKJf011p9Ow8aD5aXpWL0AH
	rec+lv8rYZ8bZYScv2o7Se/5S3ds2oiRnULlVy3OTdtlK87GkkxnZAlsiD3b7BwXGeGK68DfiNs
	oKZKm2DToxVuC3ps/PB73Qggf9TGrZ3jCtxWbQ5jsPN4ezHtw80KjdDadbt75EYfD/CU3N4szHc
	ftYye/YhPFwK9AIoJYBTNLFqvGPKMdVguL01yCZ8aG/Ic7xImoE6K442TUCh6Nd1CHV4jGCEUnV
	DBjGttycEZx2iVg76EOfGO4QU9wt2YpYl9eYB1eXKQEg64slQmfWNrOAetL0l2GhMOCTRn6Cw==
X-Received: by 2002:a05:600c:608e:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1e08e4871mr164567895e9.16.1792501222390;
        Tue, 20 Oct 2026 06:00:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:21 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:14 +0200
Subject: [PATCH v3 3/8] of: property: fw_devlink: Report unsupported
 supplier linking
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-3-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

OF supplier linking is deliberately disabled on OLPC and Intel CE4100
systems. The add_links operation currently returns zero on these systems,
so callers cannot distinguish unsupported linking from success.

Return -EOPNOTSUPP when supplier linking is unsupported. This allows OF
unit tests to skip link assertions on these systems without exposing the
private platform-support predicate.

The driver core ignores the add_links return value and marks the fwnode
as processed regardless, so its link creation and retry behavior remain
unchanged.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index aa65976739e1..99381c07848d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1708,7 +1708,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	struct device_node *con_np = to_of_node(fwnode);
 
 	if (!of_is_fwnode_add_links_supported())
-		return 0;
+		return -EOPNOTSUPP;
 
 	if (!con_np)
 		return -EINVAL;

-- 
2.43.0

