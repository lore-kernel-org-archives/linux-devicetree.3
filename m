Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F35433E61
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154934; cv=none; b=ut3g4qFvR337qULZViPpK1RWWr6Kce9j3SLiKOUBwvNIjVhOGv3A5iGC1GeoxsbLnKLC3uif0+ku87z3q1Y9WR6OaFSC1L8QZ+p6rUWTumn+YsaAYhwy+0wTEkndyco0ort/+hVcPjBmmRRvxoiIDKIV9nT3nKHx9cYxa/LN+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154934; c=relaxed/simple;
	bh=oaTRjCWZnQNokZg4Q89meVlVIFu2T26bZQvvNaVlNs8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HwAze3CWQtH4XZaX9QSxvjB11h3QBjOOjN2Qjff9oLgkqQQfnFIwDVc3Y7hI+LJ8PkNVZRUD0mTSaBVM/bwcWrm3z9TppZlekeOz2PHekD+eJi8hjtvQOL80hEaOjFnu2sciyAnHkEiPj0XWBz5NTld2kRLffSiomBcZBxBJn3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=QEbIjIMC; arc=none smtp.client-ip=91.218.175.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="QEbIjIMC"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oaTRjCWZnQNokZg4Q89meVlVIFu2T26bZQvvNaVlNs8=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790154930; v=1; x=1790759730;
 b=QEbIjIMCnk1sQ73gumwPQOBIS8aq/erpZ2gQABiGdIReV+nKPbhCb1JEfiQJ7Ujljjej5HQA
 Qh4qROVxBBGavLkjo+cwll/ou+ei7uMUPtTZq/TtctQ1Dm+QO3TiYmLVSjJ1jxfaIpetdUpcdcD
 j6tX9sE8sbeUiviKhMoxBaopBJcdAQtgXn0eGXu6VK/BbMF88xrtnY6KJ/6LlX++CNOEqrFoMms
 Uz1dPZVJ+Kd+RjZXz+bnvBOEEk0M7eGW7yVZ/4oUqSaaDSTdjXiARbK6F9wJ4GYmvpS84zx9A2x
 3UqsBTY4qyCyYqbjVNPtTAC8XSXtQM94eMZP+ocw59xXA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 342944e3381b851a;
	Wed, 23 Sep 2026 09:15:23 +0000
X-Mizu-Trace-ID: 342944e3381b851a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 11:15:22 +0200
Message-Id: <DLMKYI79QQRS.28Q4ESQ974BU@cknow-tech.com>
Cc: "Tomeu Vizoso" <tomeu@tomeuvizoso.net>, "Oded Gabbay"
 <ogabbay@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sidong Yang" <sidong.yang@furiosa.ai>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Jiaxing Hu" <gahing@gahingwoo.com>,
 "Nicolas Dufresne" <nicolas@ndufresne.ca>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Guangshuo Li" <lgs201920130244@gmail.com>,
 =?utf-8?q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>,
 <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and
 thermal properties
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Igor Paunovic" <royalnet026@gmail.com>, "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-7-royalnet026@gmail.com>
 <20260922160602.GA3529337-robh@kernel.org>
 <20260923085755.16219-1-royalnet026@gmail.com>
In-Reply-To: <20260923085755.16219-1-royalnet026@gmail.com>

On Wed Sep 23, 2026 at 10:57 AM CEST, Igor Paunovic wrote:
> On Tue, Sep 22, 2026 at 11:06:02AM -0500, Rob Herring wrote:
>> On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
>> > Assisted-by: LLM checkpatch dt_binding_check
>>
>> Drop 'dt_binding_check'. That's expected/assumed.
>
> Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
> two DTS patches, 07/11 and 11/11.

Doesn't the same apply to 'checkpatch' as well?

Cheers,
  Diederik


