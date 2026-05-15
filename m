Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445A405C33;
	Fri, 15 May 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778880394; cv=none; b=rbvV6iougVB7Hj4tWcRUUAPj1ZdNopbUuCb2dsnQOQAWBXdA7P+XNoAUhNu0kZ7W74GMLvC+yWo0mnKDCMXrQTV09F83alTaum7+9j57bsBQRVhv3xG7gkZEKLbFHw5hfBJ24Np3yflY6mBPAdsmkm1WrQADTZZYaLB3GiT1y1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778880394; c=relaxed/simple;
	bh=fjW7QqiAF1zr/jiTiza4BHos/Dw/I+w1QWBj/z4uvCk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QarwejBFck+iZ75bOdy3jrczZ+1r3PwScD3KeP3Y2D7gcF0NbSblUqHOnFA/PU+6zjRLqJUmcW/1UUk9H3zvAUg1Tmj6gRDlZbR46Sp1x+FpuprOgbGIEu4LzW4EY30KIQoX2hZkDEgrphLVPB0lI0YEM3qAsdUg8fQxwVAMGpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id C9AAD14021F;
	Fri, 15 May 2026 21:26:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id E9B4B3B;
	Fri, 15 May 2026 21:26:29 +0000 (UTC)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 15 May 2026 14:26:29 -0700
From: Joe Perches <joe@perches.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yingying Tang
 <yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH] checkpatch: Don't emit warnings for USB & PCI device DT
 compatible prefixes
In-Reply-To: <agdyvR0EjH-RXBcy@google.com>
References: <20260514105151.2771474-1-wenst@chromium.org>
 <agYJJVfMBVL0KB05@google.com>
 <1eee92b884068d649ef7be9f7d931da27aa04536.camel@perches.com>
 <CAGXv+5HrunhENv3QD4uG0ZLs8BvdOdrQcfn_82DRP51+_+ECUQ@mail.gmail.com>
 <agdyvR0EjH-RXBcy@google.com>
Message-ID: <a8dd2d183aad5743dbeabf81f8807c76@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: mk9b1yyqu5xc85h93bcqkinucutahr1x
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: E9B4B3B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18xcXveU+36lwQ7fWvbg9IUTL1Z3apYuJQ=
X-HE-Tag: 1778880389-860355
X-HE-Meta: U2FsdGVkX18xJJ/QPbcBF99cfkmhOMac/99KEsDVxdTBI6E3N6x/fSgbJ0wsLwFtLtJs5dzcuFOmocfUudtYePIlxKhJJdN901smsnZv+ogL8mXPmEUfVmt3G9lYvIoBTeIuplgYDtskkMtlibeG0OswyIXd19Y7pmUOfI7GIv33fht9c+qcRBKP0aq45rGMAeHx8roILVq+5KDiKB1csRkbRM86K4Z+d0UZK/a2BgQ5lgURUB0TgbXU6be9H9Sus9yQCPtgAaWt8VYxve4hUA==

On 2026-05-15 12:23, Brian Norris wrote:

> I would focus on eliminating the false positives, even if that means
> making checkpatch less likely to catch omissions.

Exactly correct.
