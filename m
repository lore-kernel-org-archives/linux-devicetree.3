Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7D372B3C
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106811; cv=none; b=ZD0E3AUpFXAkA4KNBVvJjoJTky3CfNNny2GGBJSr5LPofOmXEdn1ozqztRq6nZWVlhQ2Nls7rZq56jPePV5F+KTgIMyk9HGzmg+sOvPIBe6l7z1yYFaX8GWXn4aY2Q/0m4dsD5ZjOjBr2yNvlRfO/s4/fyrnMcSOqE54HiMRIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106811; c=relaxed/simple;
	bh=HAYmz7ZfsuZX6hBfuMn+IAW0Wg5RalO+uEGkvnj3w3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPcy8QG3OTg9orlpyhwS96e+GzsbpK5lTepDXtUtA63K+B32TB92t+9ys6E+cRZa2qsxKZ/cnrdizx7hcg+ZtCoVv/suzXtAeiKIi7ck5YZZgk+DRZFKYOO+SNG6uSd5wIW6b2AurN0495gdqJn1gjGVFLJHwBvhNHU3MmEwvYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WhLdWnzQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WhLdWnzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774106809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/sXjSA7M1NRk2hawgkNSgrSgBZ0eMVtFF3HZ1venY0k=;
	b=WhLdWnzQfrn5bN/a++T9kO47eDrQOoqmOm1l1eYSe5ybqIiQ9LHn0Gx8QAWVHtaGZmbsHo
	L+rPxdxFpZlwTeZb4nWrzsHOwcNX8KE8SJcd56XOAh90hp9fqt5x6qaO8aNTlEA11icede
	LUF60rmKMaBslg90wMyMz5qIkNiWVuk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-7YDnBuPENOGnUQNDxoBvqw-1; Sat,
 21 Mar 2026 11:26:43 -0400
X-MC-Unique: 7YDnBuPENOGnUQNDxoBvqw-1
X-Mimecast-MFC-AGG-ID: 7YDnBuPENOGnUQNDxoBvqw_1774106802
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9FB71956089;
	Sat, 21 Mar 2026 15:26:41 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.64.6])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C7BD1955F21;
	Sat, 21 Mar 2026 15:26:40 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lei wang <quic_leiwan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/2] Add Qualcomm SA8650P SoC to socinfo
Date: Sat, 21 Mar 2026 11:23:05 -0400
Message-ID: <20260321152307.9131-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add SoC ID for SA8650P to socinfo.

Note: Posting patches originally by Lei wang <quic_leiwan@quicinc.com>.
Minor edits to commit messages for better clarity and to match previous
submissions that add a SoC to socinfo.

---
Changes in v2:
- Fix incorrect spelling of Lei's identity (no code change)

---
Lei wang (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
  soc: qcom: socinfo: Add SoC ID for SA8650P

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.53.0

