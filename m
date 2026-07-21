Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F6C47CC73
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628673; cv=none; b=GyhpgJosW7vrreKSYkRAxPjnIcnFm3A5IVDVZV3FRpSCbZMb2zJ1o1R6r8YYeKVsvFu9CMZ7bkBsbKXZSnHIPXfF/t/TkJpxGCsIif6e+cb/0SHsagtMD8IU7fRoVweU84cX23JMUT4Jo4EysCVY0y3ov8eWuT25yQaetG2KpPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628673; c=relaxed/simple;
	bh=usrp+FjtSQZcl8J2j5C1lL1KI7lHh7LNpR3MIeGSSIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8EapcS6wziVj8ypMrEhKgfwSzsoPRu3xW4tYS50qi8ytcTsNzs9I0VEDHccY+AyCWR5uSJ6M+sDPx7YuntCUuEczlHLUp3mqWV8UcOveMp0jco1e8pclehZ5ssF52VKGmSdeamAlPEMNeB2c5hsao7Aufk5Xyn0oOd7feaOC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQT8v1vn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQT8v1vn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495590ba856so19820805e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628669; x=1785233469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m4WPR04y0hiYiGJWdv07CkxY0CSTEb3AZvblsAiZL4=;
        b=jQT8v1vnV1Vels5NltXo3vWI6eNumVnWFY0VfT2BAx3u+Pn36C0fE5HKwsSgtkiVA5
         UKhNUFjFn3WCBUZmpV4i+kkYxoFs2VmLkbtimY9juIX06BSIBYhpKY4P6fKAEyIARdMb
         tCEhuXyl453eqW9I/VZPhK2JxcLbm2jeW/gtU0gcwZkUn4sje01ltd+MuC5OihhVFzs8
         Xxo0B5zdsoDkBEvzCjd+DM5sBL74cFuGSdw5isXRzcXbsbUcaJN/pWW09riwDH3gcu1W
         u04i+4cHWjHmNuNMUA+BHOIhoerjLIZio5xT0lbp+DKzvHzcGCkTYK4qE81O311GY72R
         d4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628669; x=1785233469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/m4WPR04y0hiYiGJWdv07CkxY0CSTEb3AZvblsAiZL4=;
        b=IATwUsLOItJGHEuYSR3kejduvW6m1N7ELaeKBVteqfeYrONB75iKv7MbQllUSWK+fq
         vcySSuBvkLYAZAt9nb6VsXQzrB2STpwF5K13ThGhM/VkCCROm8glIKuWOAghVN7tQyuh
         5IC5p2UnxL1g27854OFSzZ/5gM+3ZIr4R59NFM1e0pTbSqdXzdddWYmOcRSZH5vfn+uA
         Bopgx5NrrgLgC7b+ylRVAFyvafbmmQz95686Fjj3nlS2e7W3tAOUNMfhLdxEeJb/ials
         ORw+7wod50fJoPHvl0dcZ8hOMHtcvoW1UkYGqjnxVGcC/fQbpVGG/AuTf0vQKVPHqHyN
         KwHQ==
X-Gm-Message-State: AOJu0YxpmdZXhxsY7y1mGseDTDRoFN2pKMhUNrNpQHJkEhe/M+uam2ml
	opCUrSiVNt/b8AohVJ1+LIAArNfYvrMPNmuuBijQfoSvj3718i49OeGY
X-Gm-Gg: AfdE7cnVAR0xuGs8m3FY/pglvv4HJ39yPM0Epibp7h3kWvLhcXq6d8GOPbxJvlymz7m
	1841WUJDnVdXUCeI8wi8sid8RuadNLeHSBKjsvkr8AysWRBbb0XNFn/l+uZEGdIq4VJH5Cae/u7
	rboGodnaaZoodOHtRnOzvc9OPsxznGofMmcTb+5I5dh67sFYJW2rf/e+vGg6ErYbbDKoVSjipHu
	+xXqqXAC5BcnCC0MGj83bRduvV0qGd2EmPOtesx5rAiw0Q1EACnnaddjPiFeVa2ZDmeZipM8BsC
	TEzW0NYgPUANc6mk0AD64ty1gsPoiMEUB+9B7+m/vg5OGGeygQaqi8svghjntp65JzWEO0mvP+R
	W/AQSwQikPlrXiCvfMck8FaostLzZLBOTpnzOVPgydb9EAWH5XVvK2PKN/LSitMdoe04+x/Z4aM
	Gm8jcny0czlfeOOSZrOKmmd7k=
X-Received: by 2002:a05:600c:6d82:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4954a405ea3mr143177785e9.19.1784628668927;
        Tue, 21 Jul 2026 03:11:08 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock node
Date: Tue, 21 Jul 2026 13:10:50 +0300
Message-ID: <20260721101059.451699-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DFLL for ASUS TF701T since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe82..5358cdb6efc10 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1621,6 +1621,14 @@ i2s@70080600 {
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	brcm_wifi_pwrseq: pwrseq-wifi {
 		compatible = "mmc-pwrseq-simple";
 
-- 
2.53.0

