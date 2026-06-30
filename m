Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214F3B635F;
	Tue, 30 Jun 2026 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837057; cv=none; b=KXRmzjNsrnh4GVhSwY80PlMD6FZGhh7cRMhlw97QHFLylE6/JWKa6ZU6Mi9yQ7V1q+uJ2esZMCuJnpVlWDq1zV3akq9L9E2DjWHbvBJKQ3iLNMTVXUkA3rkKoTfOf6PmWxumzUqeD0NmM/qHzk1Iwpl7eNKMtyTnv/YHG72u4HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837057; c=relaxed/simple;
	bh=S+cD3I2AObcz2o1TgeI2q7EtoxabyAtZUYIv7evYz9I=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=IdVnAQm2IMAXQtBYfwHLQDV4AZ46Hr+aDobtDnQkL2TldXNGISlHw+WASH0sjRP2YjViwIh3uIqpBfauqD9kSDyZc76AgGMyip8OP9nRINwXsYFg3u+KyrDPK5uiZ6nRGsVtHcG6HXkW//8JnknsUKpFqhmjvdqvTYl4/Rs97rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=P+Y4jdqe; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="P+Y4jdqe"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UFdtVn1938441;
	Tue, 30 Jun 2026 17:30:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=F
	K7qiVDeq+ryLH4+tlVco0CSrD/DbC1Nj9JW4CSyHTI=; b=P+Y4jdqeBDk/oCDrD
	ZIVu+7/AibFZn7++sE7rw1gN5ohrFz8I/du4bIIuFL9F+0rqXMeU4Ron1EcGcfdR
	y0F27Bo3vlKHOKpuxswtqjvjz+V0UNzsv0L8hTQ2td1UDaNxRa/hZWVTldos5uIL
	HTExUPCh2FKS0x14s/3uaCPInEi0bcDKpu/v5EDlylBCTmoWEjPO3fi9hDGQlHUQ
	KltO3cHnbdUGYhlg4vKNA4BTpWy5m53WONIiMbwFrc6NCHTL/6J0ox+u0flF2qKS
	N+xhHF/7Ju8vRPQZDp+XO5vO0jc5Dy/rNISJynfoGQITa+k/ZWWzgDsLredVZ14M
	N0O3A==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4f24snu4d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 17:30:49 +0100 (BST)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 30 Jun
 2026 17:30:49 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.219) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 17:30:48 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: <imagination@lists.freedesktop.org>, Matt Coster <opensource@mtcoster.net>
CC: Matt Coster <opensource@mtcoster.net>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Frank Binns <frank.binns@imgtec.com>,
        Brajesh Gupta
	<brajesh.gupta@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Matt Coster <opensource@mtcoster.net>
In-Reply-To: <20260629-goodbye-v1-0-3bab53a80c53@imgtec.com>
References: <20260629-goodbye-v1-0-3bab53a80c53@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: Remove Matt Coster as maintainer
Message-ID: <178283704864.38259.17260489926754951912.b4-ty@b4>
Date: Tue, 30 Jun 2026 17:30:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1NyBTYWx0ZWRfX0wf2e3i06kmb
 VJCL+W3eosWwls9pYXUgabBhhqtemZC5ldBqQ7TR1r3NHdooVUByijx1UEs4xmull/eVbzhVh9J
 XhmjaRhRVfzd6l6pAoSnVWP0QBERBqw=
X-Authority-Analysis: v=2.4 cv=We48rUhX c=1 sm=1 tr=0 ts=6a43ef39 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UteWFfMXGp8A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=vWW80W6b-FRCtuUUefcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: xTcdZBu9juVrBPt89skewdSMR5QgM99r
X-Proofpoint-GUID: xTcdZBu9juVrBPt89skewdSMR5QgM99r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1NyBTYWx0ZWRfX3BhCoVERcHeV
 Jj3UpExmAyrZMWmV9lZMTvTBr3ALA+Bfjcg8eNV4l4VYagFi4JSzHiPeTfuwnAj1QVhAg+0yoLy
 5XTRq9mRWbQ9CV4jjebXV+HsbS3z3H25HxALzJlIwolz3lqVkx3rEGPgnPtcFpCTONh8hqZBScl
 q2xEC26z4zN/oLl/0RWG1tr+sKQydsRRRM0q/nInyDEsZKTMkIWg8AabBM/nXEn8wiX9p4ei6gH
 +32qSHdIxTwBw5TjSPup7OMF4bHMaWkB8OaRIi1Yga9YPhwpohcFBMvY3AmpEGUWVLMsqMjuX86
 rMNtjFpQQ5MI3TBghjVg7D5tyH67aF3qSbK3h3f2GLH//lIhoqXOw1d2VZQCmsT6FQJTrQJS6KF
 707jfqL4c6KzxIAuFj1FvtdKvRXdBuEdRV5z01v+IobKoMzJMWHsSQ7m9K43xiP3EVKEBbrAHzi
 F4IyWwEdzBkxE7FhYJQ==


On Mon, 29 Jun 2026 16:47:28 +0100, Matt Coster wrote:
> I'll apply this towards the end of business tomorrow; my last day.
> 
> In case anyone reads this, I'd like to take the opportunity to thank
> everyone who reviewed my patches, or sent patches for me to review. It's
> been a great chapter of my life contributing to this project, and I hope
> to cross paths with it again in the future.
> 
> [...]

Applied, thanks!

[1/2] MAINTAINERS, mailmap: Update address for Matt Coster
      commit: 761923b8837f307b39a95ee53b5863485cf4cd43
[2/2] dt-bindings: gpu: img,powervr-*: Remove Matt Coster as maintainer
      commit: 2f6f6b525f52e458eb1c023b8467e8ab75f795d3

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

