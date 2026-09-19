Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6C2931DF
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786747; cv=none; b=LdrHsORmto+8cYxM6WP8Ky2/sxmcnpXVMW5k72qukkA+2wAkwq1j+kVUK26+N+twssK6pxh4vlvzeaBMSjdIL9bR+zW2DMH1wtG+cKdU4tqDLVYMpzKPgKegKr7EuMwQYfQKlEyIy+N9zFUH7IcoGP9gF6Yk6D04xJrcHj2iRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786747; c=relaxed/simple;
	bh=YajLatm1N39wTUS/2spLdpOg4xpSAjkOcr5obwgS3UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R9GCJly8EH7ry2h79UHT6qbPhsjOLbM7VPs9vNkmUYk39ydpgUcRRAThwhutdXDCdPoL/IGIWvHNWIIROOReGmU3OpDyeS692ujp+0r3Axfvle91GvDhr7+XXVRnJz9aXdNvNXqqMQ0OXtYHmHCePQg4AcfL5MIMsfFscAahyzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lymfHllK; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lymfHllK"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so589176eaf.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786745; x=1790391545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCesOAxM2IbdAjwoghFpZoYF2NflnmReXHRHMAC19yM=;
        b=lymfHllKscqLDzD3R93ZSc3qD2xCgtbE45+K3Yp/DSjoIPXMckFFGRJXyLjIInTODH
         4mMFtJoKUmAsmEtbC7C1xGn9IpH0jWwxpsOJ5sxmMIuJ8t5cVSOkbwYVwtoC77upT+ag
         NldZE7TD4Bmg7NT+bPad/pYRHSkN+2gObalhnPPypnYfelmzOICOz9B1jJVgmO8wjwoJ
         4ioR6xFIY4pxmZh0gZxjRzFdSSyM/zB8UsblS65Dqg3O6yOd2Wj9MHLyrxhA4GHiAgfU
         ZwtIMQjkogkxe9YY5u37s6FN2nxD5U3tUr/BkoKAad3ugphmkgQXo0bdDiIhwm3fqW0L
         BBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786745; x=1790391545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCesOAxM2IbdAjwoghFpZoYF2NflnmReXHRHMAC19yM=;
        b=EfPFwNLUleZR7dpkydG8s6llKLCVfPB4kfs4srX/KNbKJho3Dxt8C4hFIr5wjj0x+T
         H+RvIny1RgQ6yWPOlbs9soQxSFoHbBvXCgO7i189DduoLfcCBsdpIIgYNB8uXfPhDY4Y
         mRaXk3rdRgbIp5OzK0WqsbX4NNTf7KNltJlVDU7UHtX/oBeeYOjfUevXp1jo7ykl2AXV
         7KbEJHYeprES20BavSTZxwKNKiM1EMo/li/gpCYyWuux1XvaPUJS0B0hrxAahEGye85T
         RWBH+Fm8djcwAyINpDvadUdJ/55LINVH0ODdVMZZcjAUK+rfKeC1dLQwsFkqxpbR1hfd
         wJaQ==
X-Gm-Message-State: AFuF++mlwK4/H/OiBshn5rnAMoEUFGTLyeTwD72gshXODr4JmafPGd0m
	Cly/MfalQEslhbT6g5CdMvrqP3r1dUjS+kMFFIV7/IKTmfcQo3jfx2deWD+bzezr
X-Gm-Gg: AYBFou1PxSTfaLvV9KuiLHqEGuyeSgpfNfc5ztQZ1itsgPGl1LwSSYNy35Qz3Q5b/g2
	RQP5ZCKye6sERe5RoUmbklsGwcowAyYuNv+yJLaJGSwvtKxbN61ZsabAcWluNEgXOLnZ6skiQ4d
	MBVaJQGcZhUcRkPXShZHlVkxZQzoCPzszFZdoA7QocLJ7duItzhqK6+PFVx+O+PalGBg+bRpQ3l
	7DrOdzPZS1TeRgvznN9tjxKZ94Cb05nbqsh4lM6JmT6p2OuYCeONlE6BHNOs0HiHbDr2TUm+SOl
	DzkWIcgTB9FgkcvVJdJHl5IMLOGZw/rWEDCXsIEMox++TkKsOmX7guqaU1Dk9tWTo/7ahKuOS9/
	h6YvzZ4e3qyAhKzRlImqg4VBSgMQyFh8ziL9FfLdsqgjqZ42Bv0MFKkeXo7FViVifvzpX2e+LqF
	V+kpgsK0nsjggiRn+AuiXsJ7nDteCeF1JzXbXYyd60IuDpbckWZZnxQWA8DNSuKCWqU6pywFKCv
	zOun9Zxh7rDdPokQsxNTWFnRYhgO+aDIq7ZZ5asMZad6b7+Gbozy/sccUe7kZEn8u6EI0jt/A==
X-Received: by 2002:a05:6820:1988:b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6ca9a1326a3mr4442238eaf.3.1789786744895;
        Fri, 18 Sep 2026 19:59:04 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd2ea874c3sm1904355eaf.0.2026.09.18.19.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:59:04 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: misc: convert axis-fifo binding to YAML
Date: Fri, 18 Sep 2026 20:58:58 -0600
Message-Id: <20260919025900.169703-1-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919011417.156828-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the axis-fifo devicetree binding conversion, addressing
review feedback from the Sashiko AI bot on v1:

- The FIFO depth properties are documented in 32-bit words, not bytes,
  matching the original text binding and the driver's own arithmetic.
- additionalProperties: false no longer rejects real-world devicetrees,
  since all properties generated by the Xilinx IP integrator (even
  ones the driver ignores) are now listed in the schema.
- The now-superseded drivers/staging/axis-fifo/axis-fifo.txt is
  removed, split into its own patch per
  Documentation/devicetree/bindings/submitting-patches.rst.

Daniel28972897 (2):
  dt-bindings: misc: convert axis-fifo binding to YAML
  staging: axis-fifo: remove superseded text binding

 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 150 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.txt       |  96 -----------
 2 files changed, 150 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

-- 
2.34.1

