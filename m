Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B762F99B8
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211321; cv=none; b=qTlGClbOLa3E0bB57RzuO1gi1VG6WNlzkyrI/WiSfxNtG6YlZFlkLqWsvSW+xSns9zW3/8Qe/Gmz7BWPP53M5A2A+ZhRKMojrZIyX8UpHpWYFxCg/jO1ZHRu6ME7Wgyge8kbIvbWh5ceqxC7Cirhxj3e5VU1hyt/KIrncRP689o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211321; c=relaxed/simple;
	bh=h3I24CTb5jX9WGJt6epP09hxWvmgnw8nTrRLajn3JUw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=V6qEZjSW6L8mMYU+wT2T9LdLeGBV5RqmUUDd8Tb7Ag1gCtjo1aHmSnLuuirAFAE43O/a1BPUgHsgm0ugDryopToEc6fc6VIl78kdvJhgdRQInCaribTc6wteDGR3FWSqPgR52GcTVQNfuoPzbgzIizrqs8iJnqGE5NdMtaeYvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/iEy5hp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/iEy5hp"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d90833cacso1081404a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211318; x=1775816118; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYmwpBEwEzhMBq9vPab5w9jLzKpAAUkdEEETPjab/vE=;
        b=f/iEy5hpfrOLl7ODqzoPe19kut6EAsbJNQd/vWi7kqH/AwQz4Yq9GnuUs/6qq/i6lT
         4Z5ap3dv4F/l2XjnrxoS6dGgBSuF9ADdQZqE66RAnFm8J+D4iSNnrugJy9AK85Fv4SHg
         IUZKS1GlI+NPNy0dway4pGIxWs5Bl4HftsY1WmSW2ys6ZJZUL6B+nOAc08tCx3yxIOAI
         PxBopOGHVmox7+cuWQLHnaqUa45ngH4HuIm/thYFNpRTpJTEi0B1nAjfK6CIeXsGyKHx
         tB9PkoLdEk+qrwuaLY9vPrOdchCo/pPDzgJDYH+uKYVAMmIghYlyIiSQA7p6+rVR2kXA
         CSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211318; x=1775816118;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYmwpBEwEzhMBq9vPab5w9jLzKpAAUkdEEETPjab/vE=;
        b=DpnbiJDth+1Onasld0/ImZ2KzkOh11V8TfX8ZfIKatFYTCETXT0mhgQjIxrgiZmkmq
         BlEUuQFnY2zuCaqQiTBCaLNI53W9i3QTLaLFto9388eq/yj2JuhVujtidPdlFeRi3t7V
         C/UyZ0tunq1/eH6DYv65SWm8rWGeXrvBv/+YdwaVoCyeVVWNWpK5ZPD5w+ZhPsfee/Vq
         TH/0zdjanThDCfA92qG3Iwn8G21ENehRk2UPvpaPFnGswmXxWvN8nAKiI+7NSKTvVZhs
         vBYCunHQeegXrSC3JVM7Q6an2nX+DnoOwvg09NMqhLCRf3afktQlYPBhPUrcFIC4urfU
         n3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Av8YtqGJTS2fwZQw7OW/8+kNINXHR/2UVd+U/BJeDukAEKeVwiIqxRKet7OJvSLgJq6KHH1C5tYy@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvpdoiyBL3R4SAHdPkZ6BsZlMs75Bx4tCxKzGgZ37uBs/iaMG
	pYy13KernD6DdPxBiiCsT5Gya9MRISTrLhM5AoK+xhG4bnj/C+qRA5/L
X-Gm-Gg: AeBDievc2BIUGz/bkPfjtSY8R87P1YUZ+b59svA6TL/i+tQfMHvx080r3/R8rMzPoUw
	xWg5Uojb1f43JqoeuNnmp9LS/Ms9TThjq8MzdWd3NLII34aIPT0559hgY+czDmI+bp4QhWi7x04
	YTmIe1V8WIVk02ut5DajQ83u7YMKBkyKO1/9/JJD/hS53+XYkmFe3DZX//Cq/tma7NICLkE8gBo
	EIRgxIlDWAbkFR3V7M0GRhmEB8N0F8//kDXsu/mXfV7/u1YjLJTVPgiBE+Hj5MlmmIGakNJTFR8
	lLw8rWINY6LUOAkCHpNjHT8Trix6AoQU/2cZhYkhArEjWz3vcw/k/HhlQSI/D/SxUWfdNbzvIib
	4+iLhnXeXJUXMBIODiW4ndAcBpG1PBMGXery9sGU3Epi4wtQweasaDBsDmx1vckxHaG7mOeZ1xn
	AWdu2RWUALWiMxlxHYI/JJrvBr75vRoowvVy20UGpvbILD8dQvISXZ
X-Received: by 2002:a17:902:f642:b0:2b2:49a7:a5c4 with SMTP id d9443c01a7336-2b2818b00ccmr23090525ad.27.1775211317393;
        Fri, 03 Apr 2026 03:15:17 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:16 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 0/3] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Fri,  3 Apr 2026 18:14:53 +0800
Message-Id: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Hi all,

First, I sincerely apologize for the noise in v3 and v4. I unfortunately 
missed the crucial feedback provided in v1 by Krzysztof, Conor, 
and Guenter. 

In this v5, I have completely dropped the incorrect approaches from the 
previous versions and completely refactored the patchset to strictly 
follow the maintainers' guidelines:

1. Wildcards are entirely avoided. Explicit chip names are used.
2. The standalone YAML binding has been dropped. The devices are 
   now added to trivial-devices.yaml.
3. The redundant of_match_table addition in the driver is dropped.
   The driver now relies on the I2C core's fallback matching mechanism.

Patch 1 adds the vendor prefix for GXCAS (Carries Conor's Acked-by 
from v1).
Patch 2 adds the explicit SHT3x/STS3x and GXHT30 models to 
trivial-devices.yaml.
Patch 3 adds minimal I2C ID support to the sht3x driver.

---
Changelog:

v5:
  - Dropped the standalone YAML binding file.
  - Added explicit chip models (sht30, sht31, sht35, sht85, sts30, 
    sts31, gxht30) to trivial-devices.yaml to avoid wildcards.
  - Dropped the of_match_table addition in sht3x.c.
  - Wrapped all commit messages to 72 characters.
  - Added company website to the vendor prefix commit message.

v3 & v4:
  - (Incorrectly) Proceeded with the standalone YAML file.
  - (Incorrectly) Added of_match_table with wildcards to the driver.

v2:
  - Fix placeholder "Your Name" in MODULE_AUTHOR.

v1:
  - Initial submission.

Zaixiang Xu (3):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: trivial-devices: add Sensirion SHT3x/STS3x and GXCAS
    GXHT30
  hwmon: (sht3x) Add support for GXCAS GXHT30 sensor

 Documentation/devicetree/bindings/trivial-devices.yaml | 9 +++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 drivers/hwmon/sht3x.c                                  | 2 ++
 3 files changed, 13 insertions(+)

-- 
2.34.1

