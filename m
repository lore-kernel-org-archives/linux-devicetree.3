Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23F40802A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204596; cv=none; b=eM2kXkDPHhPd4inbPftdza6y07zx7K7WX8Nrzo4qz6P5K8fr4UDhUTmx3j4c/I5rL32nibS3ODLhkamageOqVRlfYiw3PR2KSMWqXmGmZzyoRfRn6RZrzQyK7IO3O7pstOdyecSjjz+JxcFOL5zFgnX8XOMe2vRcOvlML0uBbX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204596; c=relaxed/simple;
	bh=gy/AsyDebalhiVwAUC0JUvsXaHvpZEUUAvd0kQApG7U=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=psJXjzGkENBHcB67IBTAuSlyN1luT8Ul0NrMUtBAtRS8r28sDo9caovTsBvDAZGGJTorStylXJ6CtzAjMMoV/CgBUNoY1cy6+pmadd82oQCiUSd5qg1zAYclLAdhd/3i9DF5vuWvy8LyXQ93brxvP1NDnNrBsf/UKpVyup/c76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=fail smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=VhiRz1/3; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=qPiu0Bv5; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="VhiRz1/3";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="qPiu0Bv5"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.23] (unknown [10.138.12.92])
	by mtl-mta02-out1 (Halon) with ESMTP
	id a0c2a8fa-909e-4b22-bf4d-4ec1a06ae0fb;
	Tue, 19 May 2026 15:09:47 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app-swarm-manager-2)
 with SMTP id ce95a583-c22b-4776-a8a7-26233e52afd5  for
 devicetree@vger.kernel.org;  Tue, 19 May 2026 15:09:32 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [52.14.167.181])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id ce95a583-c22b-4776-a8a7-26233e52afd5;
	Tue, 19 May 2026 15:09:32 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: FW: GPUs & Enterprise SSDs Available - 23438003
To: <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Tue, 19 May 2026 16:09:31 +0100
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <1931202605091697B65BB50B-41BA8EDF21@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: ce95a583-c22b-4776-a8a7-26233e52afd5
X-SMTPCOM-Message-ID: 4b38df4a-93c8-42fe-8bdb-20bfc91e91c7
X-SMTPCOM-Payload: 
 uPG7ZutJvn2jv3ExiBCbEx4MKpZ4g6orT1pAng_UZRlgoo8ojdqgvWQ3DTJQL3VELNaZ9KpIwCfpe5evAvcwpC3Y2zQBEW0aY2m4G8SitdC8uhRnDgIHau-ZGfPey543BPqPg1ZGtbwKRwzbv31qJcWNhhyyGqls9gg2DuHZVJwlYxyCDaQshasZ6p-nbOf1
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1779203377; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=gy/AsyDebalhiVwAUC0JUvsXaHvpZEUUAvd0kQApG7U=;
 b=VhiRz1/3cySzBnrvnLnMdwBklMPmdI63qGaBlItEgWUjiGLMyCiP/NDrxPyfuLgAMK1QU
 vbdtdowqNB/PL14rcZiVTCgKrWmjU8ghThOrJetpP+yHygqDF4ZPJvh3d7nzskt/o/yopmX
 L6I7rCiGajNYYY23nICgllN4sd5e3q9DQjFv1A3DbW+CHFhHsJPjQZ379vdZN1RMWrYROaI
 G6NWzO5ewALwFALQPt7lHxiav6KDGNJjyXONKZqDeZ6vRSrKWYxyhDSX3f/leQVib+LyAEG
 uNd+PeSLfm1IZqLeMxTqiI6tz6axT03f/tOiVz4YSahGQIrFueIM+ygIrtxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1779203377;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=gy/AsyDebalhiVwAUC0JUvsXaHvpZEUUAvd0kQApG7U=;
 b=qPiu0Bv5OCXPFEgbmI37snOOXrEcd35PzTH+JAsiasXa7nZTOV6HCN61MiQJx+j/ZkuyH
 b2tjPCphddhHHydSd9BTGPj1xyG7Vq3s1+ZwdjmcKm/nWAHthApJn9uS7+RkjLFvkdtwSue
 +oJuTe7GazAtTFnq9T0G2JxLgW3Bc9+DgLjnfo0KJU/J/fF4TmFzqllqkOUEaISZou6dmbQ
 RPuALtkOllEzSFx9DlrMJmHwqWbvuhBhH2XIR5HxFk9qjMvrEb8EX+yuxrtoOGOT331j7zY
 GkwlnKnw2wjWc/UzHfrH9Zhi3Z+Zduo2cbl4/5IrXlXR+n1/7Yl+4F+8ZegQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Hi,
Quick update — these units are in stock and can ship today:

Mobile & RFID Devices
Zebra TC53 (51 units) – $600
Honeywell CT477 (51 units) – $600
Zebra MC93 (60 units) – $600
Zebra TC55 (71 units) – $600
Zebra MC9401 (81 units) – $1,100
Zebra TC22 Standard Range (80 units) – $500
Zebra TC21 (81 units) – $220
Zebra RFD40 Premium RFID Reader/Writer (56 units) – $610
Honeywell CK65 (86 units) – $600

GPUs & Accelerators
RTX 5090 Founders Edition 32GB (90 units) – $2,100
RTX Asus/Gigabyte 4090 24GB (45 units) – $1,680
RTX 4090 Founders Edition 24GB (90 units) – $2,000
RTX A6000 48GB Ada (54 units) – $1,100
RTX 6000 48GB Ada (51 units) – $1,200
Nvidia L40s GPU (45 units) – $3,000
Nvidia H100 80GB PCIe (9 units) – $20,000
H200 141GB NVL PCIE 9 unit $27,000.00

Storage & CPUs
Samsung PM9A3 2.5" SSD PCIe 4.0 7.68TB (115 units) – $650.00
7.68TB SAS SSD 2.5" 12G Server Drive (140 units) – $650.00

For quotes, availability, or inspection scheduling, please reach out
directly:
sales@computergamingpc.com
Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-4364
Thank you for your continued partnership.
Ann Kamila
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA
