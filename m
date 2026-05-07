Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151C3264C2;
	Thu,  7 May 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141810; cv=none; b=SNkZv/3sX9AWoIaZLpU1QBZjH79P3DUWQAiP0sgmWVChdWAi/2P2PxSn2tysERkwXUdl0S35qht4XY36Pvfl+WzQszEAZloATGQkFCH35XXYf9XVpIiNof5n1SCJuGOA591h7yKGCMdt+d62RWH/MQXzypHdSERGQbTo2vSKi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141810; c=relaxed/simple;
	bh=fqmXGl+pWWkBT6X4oeEj264AgLZu8QAHJCSM7okyQug=;
	h=From:Date:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sCDpvXJ+sZyoZyWM/7Eznz0k0+Zvx4GduUXn5bjBViVwHfqSHf/o4rD2p/EFHXsDm42yPiJ5SVF4kL9SaTHWoTsjYjxJ+LWaHXmbeSwLC0as3jo2jWfx+ZZC2PuLhn5tpCZWVBqy6CKMfRWzlURY15AjR9lSSvIeDUhG9GMRnRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 01-drivers-of-rob-reply.eml (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3GOBqSvxpU_hNEA--.31247S2;
	Thu, 07 May 2026 16:16:42 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Thu, 07 May 2026 16:16:42 +0800
Message-ID: <20260507161642.1-drivers-of-rob-reply-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2 1/2] drivers/of: validate live-tree string properties before string use
In-Reply-To: <20260505180522.GA3265505-robh@kernel.org>
References: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn> <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn> <20260505180522.GA3265505-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3GOBqSvxpU_hNEA--.31247S2
X-Coremail-Antispam: 1UD129KBjvdXoWrAr47try5uF4rXF43XF4rAFb_yoWxGwc_Gw
	1kZa4xJw47tFsYv3s7Kr1Yqr1DGF4UGr1UX34rAanFvw15XF43WFs3Jrn3X34IkFZ8tr90
	9rZ5Grsrtr13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Rob,

Thanks for catching this. You are right, I missed a lock recursion in
v2: __of_node_is_type() was changed to call of_property_match_string(),
but that helper takes devtree_lock. __of_node_is_type() is also used
from paths that already hold devtree_lock, including
of_find_node_by_type(), of_match_node(), and
of_find_matching_node_and_match(), so v2 can deadlock during early
boot.

I will send a v3 that keeps the device_type string bounded, but uses
__of_get_property() directly inside __of_node_is_type() so the helper
remains safe under devtree_lock.

Sorry about that.

Thanks,
Pengpeng


