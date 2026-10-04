Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD53C10BF
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128743; cv=none; b=FhopAcrWsAjRJb4Ni0f2pRpXI9yw70Z8LRKM7yDO/JoqfrGaRpcBjMkIuby/W5afXAdUGMu1nahqiqjIaq4w3Rc3f+ya+iRGHNliGSdZ0AP+xJfiGbLbfZPYIS5583mitFBijgUvqfzdZYY484poA2saCGNt0O8MSLDY8oJr6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128743; c=relaxed/simple;
	bh=e6FA645n0t5jPW4InVkmFqvoSKjwHUPLDdb3WpkSe6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx0X1yEsOrH+maiXhlCbVqTq+eflNBm006RbdiVicpzgewATAZjOHAwYigdfVbEj1KR4wOK2KsAiEOSk/VwQLWYs2irduOW8yCjIlXNhFZRF7BycEnMRvqELB9V1ajNzhmDQVabRV6+9ft2w42cSENSJW0ra3erXeRIkAJYFEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpDx+xeB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpDx+xeB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so15361145e9.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128737; x=1791733537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0aA9Ox0j6Te9B2H1vwXJMXFZTa8054BUZn+qPVQGD4=;
        b=jpDx+xeB2izIaCAc8kqY0ji+MI7agX+NflvJgpHR8/zuBmAv0jwBuL5BNY8XnJ4LG6
         iI8DydhmoND2ANyu7vaRyUGX+4LzJVDq0DZqId6OAcxzdKEbcFTAEdo757kw3PLGi/SN
         4i3zhI+OXUHarwTE7lnmSeUse4qvqB+ZrRFKcU9sYp1clGsbKpcmS9CNWWS1GcpV35sB
         CF6qUVExIFrB0k0PgZGyA4Yjpb419xbzJ+4DYaiXhHJ95xW45B68sTz4oW8LZ6SC3yf2
         IQzFuUtBHm1nlykMLOfnYLQONsRNFOg/UEhVk45K0CnGPI1bPaVoJcZRVPBZn5eB01uc
         BLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128737; x=1791733537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0aA9Ox0j6Te9B2H1vwXJMXFZTa8054BUZn+qPVQGD4=;
        b=n7XOtpwiU9CALeb2TcGRDpkorrX29se70RikljiydtYwLtqBzJ0Xdh3njuheuG/uE0
         vQNWeG2XpgIZmobd7HwPixxvX9lSHJBiFh5TTUi9+Kthl1wmDePqSHzPTN68DFy4TAzq
         kZSLg2k9U5zj0/vjDEw3AxNV1WlrFCrALCOJqNImJvpOJCnJVwb7DhxExTQgPQ+K+kRf
         0Gm+ygV63f55idubxsTkPds7DAehpzVQqTgQ2LATXvq1VqJwVEpauGiu+DmO7auNBx9B
         mZAcThtmgNH3D8KTFs5TtIc7gNzRh0CSk64fFycsAJL75+z+kLC/xUpWQ8prKr8V5qGk
         eiuw==
X-Gm-Message-State: AFuF++mKy6tXeeEjAou9TKO+mmfdInsVrCkAWKJtGzhJXKCtgHMFAyt5
	DPbfgbsBKl+IqLuSgy9U06jPmYYWMBgF2pAfiTM6/ZwG5g7kDl/rx91io7n2xQ==
X-Gm-Gg: AYBFou3V6Q0UeJKd84tM/E8/ywYJ2xzMC7VRcD7Db5ljxJInwXMXgQO/leLlHzcgs/0
	JF88n1NLv9lqcre5Umj1adSuc0z/imjx0tPDJGBylDMUUIMTBZkd+UdNwJS5iOBmthONfdRhN6u
	4TzfmH0pXZU93391Y97WT4ADGykW2ilBiHqvoehYNMSiLQifxECj6wTxjouFDjAwBP+B4IqpSQW
	k4rRZeaS8vB5lbSglfoN03KVrJEnYvhIgSrqGUcY58VY816cbr4/4nodbA7UjP6JQMyvQ5bj+UI
	hKuu/HCJtdJ73Ke8iU3SafTN0SM6IMOBB1xqA/sI8xf8bD8kx9Wehwzf8pe/xDOAnhgyTEWHCxz
	85O5EcIrVEiWyOF7XB+RYeQoZFUStCJjFPbu0EGoupVFTwnTnPuLMl6zGcmAFHAQ/GVKWzE5d6N
	+wciH/ckPgpyj+UCGSbtiT+02HwFZsuEEOU6Ih2fMHl50rNsyLr+RkgHAs4jhxo7851Ywo7VqjC
	25eq+3ke0BouVfVJPQ=
X-Received: by 2002:a05:600c:8b77:b0:4a0:1365:8559 with SMTP id 5b1f17b1804b1-4a0275663d6mr120969885e9.11.1791128737510;
        Sun, 04 Oct 2026 08:45:37 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] ARM: tegra: lg-x3: Lower supported suspend mode
Date: Sun,  4 Oct 2026 18:44:50 +0300
Message-ID: <20261004154456.145362-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG P880 and P895 are perfectly capable of supporting the lowest suspend
mode currently available for Tegra devices which is LP1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 7010d8c01abcb..d5365253c740b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1610,7 +1610,7 @@ bridge_output: endpoint {
 	pmc@7000e400 {
 		status = "okay";
 		nvidia,invert-interrupt;
-		nvidia,suspend-mode = <2>;
+		nvidia,suspend-mode = <1>;
 		nvidia,cpu-pwr-good-time = <2000>;
 		nvidia,cpu-pwr-off-time = <200>;
 		nvidia,core-pwr-good-time = <3845 3845>;
-- 
2.53.0

