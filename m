Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D424343D8A;
	Thu,  7 May 2026 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136928; cv=none; b=FoKYQGzIXLQs/H2mE1Kvk6occsVx+FhPtV8q4zJD5HOCKevz1Q6nn8qnaZyyn3o8gwqqJX/p/1QBWx/pKxmdVXY9I/JsPy1uqkaYqhScBYZzR7E141QX1Jl4Z/Uv8AhlO74zYMzjVJK2m84PApiUBKpWlHBlg6oVVO3b6p/adRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136928; c=relaxed/simple;
	bh=xRQzefjZDSutd5Xd5WSrMKEfveXiEhWRhN5BByEGscQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l+3mWtonL7V0Hbb4Ysxkz+l20MqZ44D1WNicfTdYEDaGOgzT6cLKjWfWbUtWwAcRhWbqakCO4xiehtaucKM5CgGjtRevokQZcJfwUdugi5bMTt9mdp9y+P4zmIb/vAL7dOTBnnbdLNFTIbpSSClaVlO063FdPMANhuf5X3af1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7029228;
	Thu, 7 May 2026 14:50:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: linux.amoon@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	gaohan@iscas.ac.cn,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Thu,  7 May 2026 14:50:02 +0800
Message-Id: <20260507065002.1883127-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502051906.8160-4-linux.amoon@gmail.com>
References: <20260502051906.8160-4-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e0133775103a2kunmfaa00f951983c8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGB5MVhpOSE9PHUlLSE0fT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0tVSktLVUtZBg++

Hi,

>  	usb3_hub_5v: regulator-usb3-hub-5v {
>  		compatible = "regulator-fixed";
> -		regulator-name = "USB30_HUB";
> +		regulator-name = "VCC5V0_HUB";

Suggested changes:
	vcc5v0_hub: regulator-vcc5v0-hub {
		compatible = "regulator-fixed";
		regulator-name = "vcc5v0_hub";

>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;

Why always on?

> @@ -361,6 +362,7 @@ &usb_dwc3 {
>  	dr_mode = "host";
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	vbus-supply = <&usb3_hub_5v>;
>  	status = "okay";

This is incorrect. See the previous reply.
