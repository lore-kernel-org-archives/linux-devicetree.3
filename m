Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ADA322C6D;
	Mon,  3 Aug 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775374; cv=none; b=OIhYtgyAZrUIDDDP6ramlaLyM1QrUGnUVGcmVs8sAvYtAFlm/96wjI21u58ToBuhctNvIHD0c/1daOkwPIEVLgtlFLbWJhBocmPzJtP+ALz990Ttx6qKBJVqtD48JwqD/zAkwICCALSpCWGRmVF6jx4LP4WDRLuUeLNWmSukrjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775374; c=relaxed/simple;
	bh=Npoyc6UgZLuFIpB9RaTbZpvCMTpy2k22vejLz5r1d9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Okg/Op6XkdmyQ5ZJAyQukntXvM4XnKdJMooXIVwwX/2oc6mNMLTD/+ywp6FLHfYjy36HmCFuv74daM1Dq0E6cRsSXZeNEfXiuXViC5gC9HKJU7/93mD3Rh/0Ye2vZr5GsZy1jnXCmGw1TV+4+hMYgIYGpvnHXxcEbM2xFsYKgvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mBqsE2FJ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mBqsE2FJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=Npoyc6UgZLuFIpB9RaTbZpvCMTpy2k22vejLz5r1d9U=;
	b=mBqsE2FJCt8LASLWEYHBNQC7JnZM+sJlFSBqrh3e9oSJTUfpQUPeP9f4Xtv6Tz
	nRZerYfKL94ScJgvtrHRqpgA1X4D+TnCPo57/c5BFijl9Eto+otynoQAiSJozm97
	toKHi41fUNJ8s7UG/ip+vkQd9zpf2zfqEGpg400pjeULo=
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnqYnmxHBqPXceMw--.40390S3;
	Tue, 04 Aug 2026 00:42:16 +0800 (CST)
From: Zhyi <zyheihei_123@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Date: Tue, 04 Aug 2026 00:42:14 +0800
Message-ID:
 <178577533421.26919.15228893238527652331.h28k-rfc-v2-supersedes@163.com>
In-Reply-To: =?utf-8?q?=3CSJ2PR04MB851017E50140354C2F5B3FF3B5D52=40SJ2PR04MB?=
 =?utf-8?q?8510=2Enamprd04=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CSJ2PR04MB851017E50140354C2F5B3FF3B5D52=40SJ2PR04MB8?=
 =?utf-8?q?510=2Enamprd04=2Eprod=2Eoutlook=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wDnqYnmxHBqPXceMw--.40390S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYPEfDUUUU
X-CM-SenderInfo: 521kvx5khlsiist6il2tof0z/xtbC3AgivGpwxOhgQAAA3c

Hi all,

apologies for the duplicate: this v1 was accidentally sent twice. The
revised [RFC PATCH v2] is on the main thread:

https://lore.kernel.org/all/20260803104646.26836-1-zyheihei_123@163.com/

Please follow up there instead.

Thanks,
Zhyi <zyheihei_123@163.com>

