Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8B3B7A8;
	Fri,  3 Apr 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209261; cv=none; b=qCDVcmM1Ouy/TOJeOyUWgz48T4FdmNgN7i15cW/jScghFJBSxeAG9q7NEHCgI9qg9FCBGmnb/GMGM4Ubm247ouwsUAVE4ECVfQvh65rgwsL3biRUE2uEqbTe90pfLulIDerl+f3+cUVaAg/JMQCXgFRdYwNbcBIdUba3k91YacU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209261; c=relaxed/simple;
	bh=AiBtAdXx3VegFtcSRwvWQvA36OGNPCVim7p8JFQ7feg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCJyjTICU3zqm6un/IKHcD+9spuy49tjgOPFCb4wEJN/cwYN4I4iQEUhIFPKuIhUJkT6AleAxdliE8PG1jknQQ73Rl407sL1ZO6xLVWgkiAScPshN0subEjfYpSKkpcr+Gkr6jz8GrypiYThRLf5Yal0hYtoVvGDayT61INqC0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3972f1899;
	Fri, 3 Apr 2026 17:40:53 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
Date: Fri,  3 Apr 2026 17:40:21 +0800
Message-Id: <20260403094021.229838-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6376799689e094253fb1dc0e3e27b491be46e9db.1775148159.git.gaohan@iscas.ac.cn>
References: <6376799689e094253fb1dc0e3e27b491be46e9db.1775148159.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d52b78a2e03a2kunma4e3e7aa59b1ed
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGh9DVh5NTB9IQh5NS08dHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

Hi,

> @@ -91,6 +110,94 @@ &i2c8 {
>  	pinctrl-0 = <&i2c8_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";

Perhaps the previous i2c8 enabling patch could be merged with this one.
For the floating sections, I suggest marking them as "not connected":

```
		regulators {
			buck1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck2 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck3_1v8: buck3 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <1800000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck4_3v3: buck4 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3300000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck5: buck5 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck6 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			aldo1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-boot-on;
			};

			aldo2 {
				/* not connected */
			};

			aldo3 {
				/* not connected */
			};

			aldo4 {
				/* not connected */
			};

			dldo1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-boot-on;
			};

			dldo2 {
				/* not connected */
			};

			dldo3 {
				/* not connected */
			};

			dldo4 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-always-on;
			};

			dldo5 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
			};

			dldo6 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-always-on;
			};

			dldo7 {
				/* not connected */
			};
		};
```

Thanks,
Chukun
