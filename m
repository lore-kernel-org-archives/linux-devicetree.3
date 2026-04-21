Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC226C39E
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789472; cv=none; b=TzLJV+RwVpgC/o23AYDzeavtSzs6ebKZQY1One7hojPbg6pzlnqJW1W8qW4T4X67q7/ugbR/E5RS2OwLf5XPAODyfPMhAfULZMT2r5ImU5X23rBS1TH2DGp1zgat6sxsCrs9ybT+j8BzvtcQnmaHlpkz3u7mLk+SZRyz4ATteTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789472; c=relaxed/simple;
	bh=ivLgOCQg+w/iR8uXsSkARaRNV6BFG3O81VYilPgyDBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=RnE7V1iJWFpTYyXZ4JjO6pTH2qybSmGt26p42YH/EPxyyEulKb6f2I0/H9nGd+t0FAcrcQVc22wQ/mBiBrTVe+xciF7OMuyB6f71MWXBZIVpVbRjuuYjmaWiRZRZzdb8n8KlF9j8Feeo8tJ2N5khfPcbBfQec+1jmVfKoZM3yWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ORLnEF5q; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ORLnEF5q"
Date: Tue, 21 Apr 2026 16:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776789467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpJV3RY0EbaEZUr7cB+U3AXYZF0kplYNLFyuwZ/YRu4=;
	b=ORLnEF5qdgVpnRWwe+ZGDZRScEa9amzvTYBVvrDt3C6KffoF3IOiJuAsxNZJRe0OLubZR2
	0Q5IIYUgUNPmwOfL2EkA7FdYj8YqQHBdIAeNIWGV49DKTgkQv25LkVrwY31tlDT+mxSE0Y
	5eb0rf1riSjwB3GMibR5G7aQeMUonu+g77nOyI1PO2qk6W7IkD3pKs8ciosWGRDu5R6XRZ
	pnq+DUpMUcPCy6LwGy3LNvcDF8D7yDzghkqcYI7V3zpBMstJvaqvCmR/fIiPOv7KYDASx4
	nlHfefVgG8s+ryZbX7mC/CaQE0QRc357miibthjO4rgC3Oq+bEyJSRnO1Ona5g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add support for X98Q
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at> <20260421155328.26359-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260421155328.26359-3-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdurii.1o3p0jnn1bsji@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

On Tue, 21 Apr 2026 15:53, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Add dts enabling core hardware for the Amediatech X98Q.
>

You should explain what the Amediatech X98Q is. You did this in the v2's
cover letter, but it should additionally go in here too so it's visible
in git commits in the kernel. What hardware does it have? Maybe also what is
enabled in the DT?

>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 2 files changed, 250 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
><...>

--
Best regards,
Ferass
