Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273C33372A
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785701075; cv=none; b=qLzkNwT6To9sPoDOjiUTn3BqhFdxja+9x7NRMPkzfyuMKRsm1LqIPqPwNcMs5PAlHIVLaXW0l2n9m2iJYPOC2g2nNIPyvRWuoE89wMk4100IgqbBkLwgLgB5TVjOsEWkIULl1Vz8c2qKffzS2pif2y3ovI1fCxjAp1ILZKIEpZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785701075; c=relaxed/simple;
	bh=qltARmYzXUm3qHAeK/h0ZIoqQNWedRlot+Q0d5xsxlg=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=mGoDXA20YvICEL6oO15zaChvPkWl78Xk7AXZ2QY9pNjH434DWcQqJvLHwDrDTDFUzfeiv0NV/igt3Kia9fLP0kcqV+TrQd1/kCRP4ZFzeJwobpDuLQva2rFYNO3U9VCXDrQ/ybA/rR/ohcIqHHTWZg2aUq/n3DklPIWAJdeUPZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=pass smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=uLmKaAiR; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=lEtDcVQ/; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="uLmKaAiR";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="lEtDcVQ/"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.127] (unknown [10.138.12.210])
	by mtl-mta02-out1 (Halon) with ESMTP
	id 70e8900d-24e9-45f2-9841-fd4392f1aec4;
	Sun, 02 Aug 2026 20:04:33 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-5) with SMTP id
 ad98e460-1ace-4f93-9ac9-b942ced34985  for devicetree@vger.kernel.org;
  Sun, 02 Aug 2026 20:04:21 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [191.177.202.7])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id ad98e460-1ace-4f93-9ac9-b942ced34985;
	Sun, 02 Aug 2026 20:04:21 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: Availability Update: Memory, GPU & Server Components
To: <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Sun, 2 Aug 2026 21:04:21 +0100
Message-Id: <02202026080421C6E3E57E0A-593BAC6F8C@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: ad98e460-1ace-4f93-9ac9-b942ced34985
X-SMTPCOM-Message-ID: 9cd1d9df-0932-480d-afce-3705a8d500e4
X-SMTPCOM-Payload: 
 RG60FvISMUW9xUaL4AkfWdy4OGAZhyxqf7BAE3iWlY-OA5o1llhAtoSsBfWdX5JQ6JwEyD1T0R8WePZ2Zf8S6WVtEzubQGj5rtumO2HFxkQgaoiYdJZDADibK43kTbKbXAB82kRYgW0ajxf-TQN3fwY87ticDbY0csXxrGBERqxmmwIHcfv6UphUk842JIJk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1785701066; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qltARmYzXUm3qHAeK/h0ZIoqQNWedRlot+Q0d5xsxlg=;
 b=uLmKaAiRU4Wjw88Ej0XVPBb6HNKooYKWr8ivJomyUcGHGPDOumChC7HQPS8o2ZMFb+imH
 qRk3aQZwii7UJq4SXgHm73Nk5t9FeM2UTYQtNNmDAjYa3VSexTkCjFsSqsaPzrgc9QMH1Sh
 FrTsibUOReLzsnuvBEm9soIOsjhcekflac+sJ8IRrRaDeKKvrRUP5sx8Sst4veRPH2R70OD
 v4kjam4IDy5XBvh/YW2VXeIsn2TaewQzfhD7rqKY5hOs87ti2B5/NpjP4QhlzA7icUta7OL
 FE8/32Qr40vXUZBT1l6EW0TjJ50db2Y1a1/JWJLi21FWjR5rtK1YblF9My0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1785701066;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qltARmYzXUm3qHAeK/h0ZIoqQNWedRlot+Q0d5xsxlg=;
 b=lEtDcVQ/IDlVvsm9mTdmiPPyZtJ3kzUEKJvRqLIbc3aLgrKeYscjc27ifkTTAIm9FrFf6
 gG0vyy+gcktNf+aFXHtuLBby8Ui//0LVTr9qaa0twQj7aYbKA/nU2vPrAKBEyvKczuUU8iv
 lG01Fz8N9oXuKR9SxSipvvXsd5vvM6bPvML9MxBovs0gLMXT8v+S6b9BVs4MweCPqydubNG
 HjzkIuEOdd5ZfGOJJPNAdhcgZTsi/tKXYzHuLSptWYQNW3N7DKxV8CRjWtqFQ8KpzKQsjAL
 bhVBI1I5+lEp0QjWcMx8CbfuiFvx64ZxHq1sm7aQITu+CDdTGOzDwxv0xUDA==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Dear Partner,
We’re pleased to share a current snapshot of our available inventory for
immediate dispatch.

Memory Modules
32GB 2Rx4 PC4-2400T (1,500 units) – $40
32GB 2Rx4 PC4-3200AA (1,500 units) – $40
16GB 2Rx8 PC4-3200AA (1,500 units) – $20
128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (980 units) – $170
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $750.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $850.00

GPUs & Accelerators
RTX 5090 Founders Edition 32GB (90 units) – $2,800
RTX 4090 24GB (45 units) – $1,700
RTX 4090 Founders Edition 24GB (90 units) – $2,500
RTX A6000 48GB Ada (54 units) – $1,100
RTX 6000 48GB Ada (51 units) – $1,200
Nvidia L40s GPU (12 units) – $3,000
Nvidia H100 80GB PCIe (9 units) – $20,000
Nvidia PRO 6000 96G Server Edition - $10,000.00 QTY: 17
Storage & CPUs
Samsung PM9A3 2.5" SSD PCIe 4.0 7.68TB (115 units) – $650
7.68TB SAS SSD 2.5" 12G Server Drive (140 units) – $650
Intel Xeon Silver 4214R (120 units) – $140
Intel Xeon Gold 5220R (130 units) – $200
AMD EPYC 7542 (97 units) – $450
Intel Xeon Platinum 8380 (95 units) – $450

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com
Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-4364
Thank you for your continued partnership.
Ann Sam
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA
To opt out of future updates, reply with “REMOVE” in the subject line.
