Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDD38F255
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211329; cv=none; b=mhsOKJbKEoxjtPBfobnbx7ZuValyF7fvsfDhEqhPfvvcr9OSzEblMtYFOmJ0+LJMrdRpJL3bumts1a5SchrA1f336C4+g7C4fDRZ/9MmlyaRuK5Spv4ggVHkG8IEyYm4Smg/rfume4hfDpVkpbxXG6In6TfW+2AOElrrm+YMX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211329; c=relaxed/simple;
	bh=7i8J/fbN7z0SDl2RldQ6zv/iIja95/EoYFcW92yxPco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IL+wNVVveLSlmcgwqyiu5uzK1TL7wl82oyGkP5ow2mHFJkxmwZtpZEKrBFbdNJfaxeaVGkLnuZaCYSrmXvgYBeL+prp7i0SLgz/wXU+06h95jPbYowMVDer3k95al7joVPL1d/8/6ufRJaGxA+wtBbeTUnsEaIOBwjbeVJ4R6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYcoeav5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYcoeav5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2503753efso14598925ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211326; x=1775816126; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tordCEdMdCISPKuHP1P7HVkOG9Rk7horQHJTiIOMN44=;
        b=qYcoeav5Jgh6JG5CnQJLkcmYqjsY1PlCjfw8J+573oX6CfJph3zwhG055pv1/LhJD1
         AacYzkviEHxOrrrc7wh5uT+3ASADEXLGI0bq2p+1DaNh+LeiqTLaJ99TOa/jFaGdl7Vk
         w/zOgwi+PY/q+PTlZ2XxoV5iucti2ZGw2mczJDM5K7vlySDcRtE+a4q/DRcS9BGPTVxr
         p4XA3ix0b3MbctswZ2ewAmFFyug7bnVz/LhmT9ZZXw/MvSnbZXvJqwmG6fdr8M0tB0Ma
         H7ElKbClPSC8uUo7q6gFjNaTJDBJTcVCZMknN+bQAfoXhmuusJnRgCo5bQerzK0SllSm
         sVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211326; x=1775816126;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tordCEdMdCISPKuHP1P7HVkOG9Rk7horQHJTiIOMN44=;
        b=EKU2VDthsTj0KAzZ1foAE46N1GSKlsCtHSZg+t0pZfwrZ/AdZBZo9VjlJVfVJpT91q
         kwYYRgjpPlT4n4mBx/hK+ZQ9fmO+4Iv1tnRfNpDLwfb7+Kl36LB6n0oA7WbG3s4G+MaE
         1lT2j+tdw/0YyYePPTglwzJXpQs3nJ0P4K3twJY7cxMRtplhkTkCdZtrHWk1CM2DzB2c
         et4KMxBVWs2+hssO65raol2Tf8JB3J7wyal+T2qzt8TrDTldRpfXFeE41k0eS5WHT2Ez
         TydWPrszBI7PE2UzoIFcsJoqJ6mtndmfA+bPqkXSEc65/P8ki9KYSAZDRD9eG0JFCXqb
         qEVA==
X-Forwarded-Encrypted: i=1; AJvYcCVQYC4o2yUSqFwfwlsbBlhl/xzsKLN/slhx1ekFnaI8dgg+xcXJygE/C7VFP0mFtiE25BKDfkC+nFEq@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRLzNpyN3RGjdQenLdE2kt9K6roOoKFfbtq7k9AX20+RuCiYY
	tuwvQqiWTj/dbmOAEKiwfKtlOoNuR/Wq+5gvvg3U0ydrrhmU/d6j+Ibb
X-Gm-Gg: AeBDievvoeRiOElSUQVz3TvhcWn33ZO2xD0LrGR/XxKGYVkyUXb3YvFKArRP9y9MMYR
	u1jIhmIRdW/MJwvnRLJcJB+ysVQXH5OtjgRORh0XPsaMzOE9IVVtuhPIEZUNhue1uzqdnqme1Iv
	4wkZu4bmzcMiBXRgevEDnsnB6Ca3RvRyGpS50ju2GvbaC4Y5yk1tp2ZBurcU2pt/8KhzDUwWiy8
	AH25gycvxYOPd5okNN/pjpC3ijaez4PbRVlgLa6OvzHOG4O71Pjr4ONuG91Pb/ibRnz2+rJT/aU
	NnWPy4hQadAKPEHajW+xSbPoU3+t2cm4ozllxSemEpX1I/NmXerGA9Ih7foA2kC0pDykPsPfA36
	jv2ZnfqrgbleJ6U/azg7XHLYl0yiFJDwQznkq2883LYz73YiEf82dITe0NChPbQxaBQ83ciIOyO
	8q52JRSp5it4Bq+8OH+6ukW8eO5Esr0RF2V3S9jx+/xc1TKSNqyZrt2wF/r5q+4cU=
X-Received: by 2002:a17:903:388e:b0:2b2:6df1:1112 with SMTP id d9443c01a7336-2b281969a70mr25700175ad.40.1775211326126;
        Fri, 03 Apr 2026 03:15:26 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:25 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 3/3] hwmon: (sht3x) Add support for GXCAS GXHT30 sensor
Date: Fri,  3 Apr 2026 18:14:56 +0800
Message-Id: <1775211296-63722-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

The GXCAS GXHT30 is a humidity and temperature sensor that is software
compatible with the Sensirion SHT3x series.

Add the "gxht30" chip name to the i2c_device_id table to allow I2C core
matching. For Device Tree instantiation, this driver relies on the I2C
core fallback matching or DT compatible fallbacks (e.g., matching
"gxcas,gxht30" with "sensirion,sht30").

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..abcc7b4abe5a 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
@@ -948,5 +949,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

