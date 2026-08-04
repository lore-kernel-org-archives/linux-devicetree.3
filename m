Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC237B018;
	Tue,  4 Aug 2026 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844226; cv=none; b=p9aJCPAq6MHnPGNZxYV5Re/RQPt3SQsqF+DLAKVbHltcwNaABjSer44ZQ6CIXXnEgBHAyW3mUocYJqSytcbV4EJkbTkyBxSX+dCpg5OJlZfqwSEge/G5HI1GT6aiiekNmDK+JqCtLyOD2J8GAx9ITMIQLdxeA62hyVp/B2+OEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844226; c=relaxed/simple;
	bh=kwmRBi3Mttz/vbLQjZHH2HvJZ41JYfiFLc5cvHdptcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m3YiBmZfs3xEl2Vcdvsjf6MtIB5AJm7pCE+mLg5kQg8No1c1rmQ1xEfRT459Mn7p4B6nnn74XzSHgVENwL0O/FWwOOIcHHNM6Sbb8wxBPF2l0WKwoAVKfr0McxlnQFqwF9Phfh+b60g+PQchXu4oog08eIg91sa0Zax8ZmYaWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48ba974f0;
	Tue, 4 Aug 2026 19:50:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
Date: Tue,  4 Aug 2026 19:50:02 +0800
Message-Id: <20260804115002.1327752-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9de52b72-ce95-440e-8178-461157a157d1@kernel.org>
References: <9de52b72-ce95-440e-8178-461157a157d1@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fcc9c18a003a2kunmb934228d2bd9c2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0JNVk8eTUNOGEIfGENNHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> I asked you to squash the patches, to avoid work. Instead, you split the
> patchsets giving us more work.

Sorry, I forgot about that. I should check the previous comments before
posting. The patch for HINLINK H28K has been merged. Should I update this
series? Sorry for giving you more work.

Thanks,
Chukun
