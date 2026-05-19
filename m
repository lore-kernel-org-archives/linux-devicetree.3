Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5206A30499A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209513; cv=none; b=q0jLZEzmpUX6mSG5BA60pFwn5B4dfKdE9yEGPnNL+2pOonpvTu318er4Rxh5ETfyi8xSFFWYl4meeseQ1PkJs1wIPrh3e3AMIHC1KjO13zP8Sm4u/sKclDu82VG6Q3i+EQRr4eQ1wzPFQn0ibBVpU/lYpHc20nY9vR49aoe6Euk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209513; c=relaxed/simple;
	bh=qTPbYkiOMspqG6VSxSHXCGcz+MklfLABEK6/0TNXX5s=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=hcY8cKBWEZ9sfvbkzx7F7QBgFsSWbXMY4wgsiqIRLFBpmyD2DMsYITNjYhVMNCQVkZkJ/jl94iqwS3Ae2Wl7iCxGd3sPozoq2I8v+Z3o7aGR2ua3KT0CY/I+mG8vuhu8UG/Geq030PyYs3ywTPg7qnvKWWK1HwmT3mP0so9gNpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=fail smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=OP+7eYW2; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=u0BbRfKk; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="OP+7eYW2";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="u0BbRfKk"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.86] (unknown [10.138.12.5])
	by mtl-mta02-out1 (Halon) with ESMTP
	id 96d8f54e-5d5b-43ee-8b6a-b6f1b027d4ac;
	Tue, 19 May 2026 16:51:51 +0000 (UTC)
Received: Received from 10.138.12.169 by Caffeine (s0-aws-app-swarm-manager-1)
 with SMTP id 40601554-2452-4a82-aac6-801081524721  for
 devicetree@vger.kernel.org;  Tue, 19 May 2026 16:51:39 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [189.124.148.1])
	by s0-aws-app2-mta-in-2 (Halon) with ESMTPSA
	id 40601554-2452-4a82-aac6-801081524721;
	Tue, 19 May 2026 16:51:39 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: FW: GPUs & Enterprise SSDs Available - 23438003
To: <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Tue, 19 May 2026 17:51:39 +0100
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <1938202605511746326BAF5F$7021D6DA8B@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: 40601554-2452-4a82-aac6-801081524721
X-SMTPCOM-Message-ID: 5f15fda5-4ecc-4c05-b3df-e7d20463bc3b
X-SMTPCOM-Payload: 
 xS2_Vv4BQSMIbFWJs5TOtnIToXnizr24MEYWnN51cH7A2WJz00OBuHoDUStg22D-yNUb3LB1p5yYb2vN2iz-gzAXdRxi6Jp7jRCLTHY83txJTRMU29z1pBcrbGmWkkn3N9eASnCzC5UUo9sbHeS-npt0wG8lLOV3SCpExXSXISR01NzYSusLkuAm862yQ9m4
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1779209504; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qTPbYkiOMspqG6VSxSHXCGcz+MklfLABEK6/0TNXX5s=;
 b=OP+7eYW2Wl5hEpIsgTH11RdYUUUbV/BJRaLsJngv8VhLAIP5DTilM4wkcZdxX7FbgYnz4
 ebSkVYc8F705sOFrcVW2DZHZsta6L45xxO2HFZIzxm+ESzTJMo8gMVVVDFwF93MJObKo54T
 ZxMW2RKx6iM4OrsK75/AcyqrLn1u7636Qx5NalrwG6sYJLwVjtCdPamky5qL5bFDI35Qj+S
 H7xOrGGx4BmVWksQP8dtJnDYYdMDis9moh5ZMORbHo58/SFkYH6G95J+S8IHQ3yRhO7dKrB
 7SW/p3mESfMAvzMb2ugDPuBzJmj0NW67cH83ThfRtbTldeVeSkKGdzUIZnZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1779209504;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qTPbYkiOMspqG6VSxSHXCGcz+MklfLABEK6/0TNXX5s=;
 b=u0BbRfKkdprTpmrTrjlFfAW1mfkPsXbNitGuzBDlmPW/cElH7q+o2MriFkwc6/aEGsgoj
 vh3d0DO5B94UllQPpxXTgLmTsORY/uBEb+6I//8waRHgwGWfg6Xh6xhMvZpPTII9wdlLZdw
 30fPtyY5u5Zx7V88vgTqbpJQyj5WiXzQ88FnQIhhIHEwqSXVqTr3SvVJU3/kqkCGjEO9gVr
 +mYU8L8DDu9scY+IwK2cSK9hg+7nnv/6uJMpjya/jeNmkrkFldkWwvJ6QjeSMcvmDomM4QB
 M6mnaPzy2aC3qOdU4ohwtcVnWNhalzlM/JO/BzNUxNL3IsBqJxO/vfWqWJwA==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Hi,
Quick update — these units are in stock and can ship today:

Memory Modules
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $14.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $15.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $10.00
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $70.00
* 32GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,500) – $140.00
* 64GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,200) – $450.00
* 32GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,500) – $150.00
* 64GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,100) – $450.00

Solid State Drives
- SSD SATA 6G 3.84TB SFF (Qty: 450) – $120.00
- SSD SAS 12G 960GB SFF (Qty: 470) – $300.00
- SSD SAS 12G 1.92TB SFF (Qty: 560) – $350.00
- SSD SAS 12G 3.84TB SFF (Qty: 560) – $150.00
- SSD SATA 6G 1.92TB SFF (Qty: 450) – $100.00
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $14.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $15.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $10.00
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $70.00

- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 P43331-B21 (Qty: 500) – $550.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 P64707-B21 (Qty: 500) – $550.00
- DDR4 64GB 3200Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $450.00
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $450.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $550.00

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com
Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-4364
Thank you for your continued partnership.
Ann Kamila
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA
