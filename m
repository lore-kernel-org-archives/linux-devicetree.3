Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B81F387344;
	Tue,  7 Apr 2026 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543423; cv=none; b=ZQRpC6ckFjiwabIvqaqISUjzlO1ylab8QGt7vko0AugNupFBjqlhOoEujVf+wn+P76c7i8+hxUJdIudyPrcyQVUpvrTVcRTy2oSAWxGl7Od9hMOPUubBisnoK+xWczhqICYxcgBjnn6gQlgTggUI+TgFA40a89d2tZcFSyRY4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543423; c=relaxed/simple;
	bh=Tkjlk7E11kM+9uzbS+T8AamY3KVjiIqz63WBKR059eM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LIAT/rCU69v2rAjskvrbuFa93ew+tHFK8UwoqHTyplwZDTBRUrdQ1UYLBjRkBVqoo/YPO0rZBjWqDlcfLA9420hztXKFD98kutHHpOMblHmVmj8qUZu5rrPDSAXNu+s+O2tEK3fOJMjOdmtZVQgFaCTQb+k/S0+aLhkQbwDsqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.42])
	by smtp.qiye.163.com (Hmail) with ESMTP id 39c24cceb;
	Tue, 7 Apr 2026 14:30:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gaohan@iscas.ac.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Tue,  7 Apr 2026 14:30:02 +0800
Message-Id: <20260407063002.638012-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403141637-GKA1042809@kernel.org>
References: <20260403141637-GKA1042809@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d66a2552e03a2kunmd64b485566944b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEJJVk1IQ0lDGRhPTENIT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++

Hi,

> I think Krzysztof will have objection on this, which isn't used by any
> device, so not really useful, see similar comment for "reg_dc_in" here

Currently, at least it's used for USB hub vdd-supply. Since there's
only this one, indicating a power source, I think it's acceptable.

> I'm not sure if there is any enforced rules on this? I can understand
> you are trying to sort them in alphabet order.. but I would personally
> prefer old way - in slightly logical order.. but I do have no strong
> preference..

There are no strict rules, but I think it would be better to keep
the same order as the regulators below within the same DT.

Thanks,
Chukun
