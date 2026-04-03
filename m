Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BF34EEF1;
	Fri,  3 Apr 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199621; cv=none; b=svzDZwvVRWvOilvZUFFlWhLjxh5gJXi/GZvA777GkvWwhj2Novk9TBtodBuRHkocC4aXGJogjfejXRH6rviGDI8ans4cHrAVt7mI1XyA6Lmt3SrNUPTiIGjBineR2ZmZPKA/KO8h/GyyjDrnUuiWo1C6KS6MyzGz4q5T5ITTAwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199621; c=relaxed/simple;
	bh=QqOkXDSZOqBfrftMWTmuBeKGunAGORD0D9NcfacWR1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cd/NNwcUsfvK3ZVYzoN9VV51xCml4i5ZWh+04sLSLUqA5ye4x+pnWCSuL9SA9FDxlBt88TjJiT1U+BOAHDKjQEK4MAT7TM6dOO0EalUpOsOkJvQgkMbvLelZJIq+bpvRYx3RLghCbkAzhS5uq0UGX5yKNvQiH7ph1J/J06mpWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396ceae87;
	Fri, 3 Apr 2026 15:00:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: michael.opdenacker@rootcommit.com
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
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Date: Fri,  3 Apr 2026 15:00:05 +0800
Message-Id: <20260403070005.213650-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <46e715a4-0fd7-4692-9a25-a44d469b17b0@rootcommit.com>
References: <46e715a4-0fd7-4692-9a25-a44d469b17b0@rootcommit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d522472bf03a2kunm6fbba61a591df7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSk9LVhgdS0sZHkhCQkNNGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+

Hi,

> Thanks a lot for the patch!
> Would you mind sharing your configuration with me (in PM?).
>
> I can list the USB 3 hub, but I can't see the USB mass storage device 
> plugged in the USB3 port.

Are you running the latest linux-next? Otherwise, a patch is needed:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=764c2e6e60bf17910d84e7179fee14129e053b96

Thanks,
Chukun
