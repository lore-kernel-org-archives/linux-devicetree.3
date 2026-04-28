Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3B40DFD7
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348290; cv=none; b=g1IU2tZ2ETjMVgtPOn7DjcF3Eisj37j03ldM4HTLC0eO/sVAuq0V+BeqDrKohBOWspj0vhjjuis1NmUdvKFs8TQESLC1WNZ4jSmjkmKRTqNRzyhKJjXzjt0kdCiJBZr6oqRcfDBVQUgsTc9xLziE7ZnzxQp16fk1rrau9FFsqYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348290; c=relaxed/simple;
	bh=RQfjDmjDhFBZQeNCmuYx5MyE8j6k2g5d33MZmHmxCmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwFyspySj0J5AjOW04y2EY0+dKB8lWris9fp7NrHmhBXPJJMSy86YFibc0AJ2jgRY1/S/jU1LqfV0zT8dfIVZtETF5mNQe9lg3Q127axTuacZck4CWA3AOzCbyIpq+7/m0PV70j/efaDZrtoLFpw4o57lraKHuwYf2EnXIsGlLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om7wcb+v; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om7wcb+v"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d736211595so718853085a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777348288; x=1777953088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63f4GofBoWLfXQjvxrKaQNrlmvp+JGGyl1KjrPUdmXI=;
        b=om7wcb+v6jOtI69VUjVTFihCYGBnZ5on48uPRzAVMvPTaqFaNcbrLl/6MkV5QW+DcB
         kxPDH4bKZSsy5XmRm6RUPqu+fcooPzoHWEhtjRZAX44M6VDtYXsp9PJa0AlQ564ogkmu
         022TOCX/89rPiIRSdYugVcf4FDmF2hozU9ZqVhVnuTB2Ex2JO9VFPkiLEV1CkoV/C1F+
         CqvoYdDWOskf2ylBidvPs0a0KN4SQMrNQOTTlZ2uEPoEZNlvSQtV3HlOtYfy9h+v8X+9
         0xdTds4jnVnlRDkYlkB2JIi604qcnCLwU4hZMjyQ39PogIL4lNHuMGTgg5w+drVjz7kS
         RN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348288; x=1777953088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63f4GofBoWLfXQjvxrKaQNrlmvp+JGGyl1KjrPUdmXI=;
        b=DMgUQ60CCxUCw/eX5p2INYtbwwSfTeC0w7rPykp70Y9Z49YYc84d4VxzSN4oVnZtGk
         5SWNXX7WXj8xj6rxgngnOA2GtxdDwr9UTp/PLloPJ1SULhWv3WnZZJIwpsKDRVx1cj2Z
         3M6J2BOTd1xUnsPK3tlCxvDQAnMumPjl/4CY/8BvU4Stk7oBccgbjKSWN5sR9kmHVYSG
         5qGi3CNt1ng4dJoM0WzcknGCevd47upJ15/3VA7lle65jImDul+FHxaVC7Ou4VsFaLHn
         gkp8hz1Ce706L/PTU1iYHsiWWAq2mw+Nb+CjnG7iyfagTV41naPPKNfbwwwImUeS9wA2
         RudA==
X-Forwarded-Encrypted: i=1; AFNElJ+BW7R5y/zoF1JS9Lc/brMn2wpuIPvb0bOa/LezkIF/3A1xKJ/quwvunRSPLXHDf5vJKnnlXgqqdeHg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfw7L1PFgKt4gDMh9bPox8sgfyoNMcwwcnzfuaWFmGiVbarvvS
	rkS5eELP05TnpJC3wagYmsqN9IsAxf/AsDYnTK7qAdgS9773hECA90Zn
X-Gm-Gg: AeBDieuS42Ylh5B3zduyhIIhZ3xQVilj/NuBKWN0pe/lCe95My4Kdr6CQc+JUGEbzcn
	inxS4UFGHrKPVJw0Igx8yFb69KttgBf2Wug+B+9Hvcg8Y2LPjMvDjlF8SgJrEk/iU8rpmEdXBYe
	Mm8FA3clCoctgS+TjLgjNGN5chTb2uj2LwgFqPc/4cHF4vIJS1c3r/opY08hLiHrIYYS4269XK/
	WfWOBKQDGjLoSZL7x6mFPjFOubfKB4yTPqVwA6WRtJjuYSGwckKy1yfTndFAlvclelxOE15bOWj
	boNYDDCead4PQGpBtMZLau2z1yY4ZqqGuIdlBYvYWThrR6Et8Egm9qhw253ID48886kpB6MiCmq
	Szyt8ideb+3rdHNJmAdWk0MHpB7uM1wYWonxE23RF0YbfPcxuZX27fkBU1Ii2phgi1+4/gqneO5
	97u553kR+VCtyhXFyahp7pnWeVauCFAEEqvegq
X-Received: by 2002:a05:620a:29c1:b0:8f0:f1a5:680c with SMTP id af79cd13be357-8f7d9016b82mr191945585a.29.1777348288133;
        Mon, 27 Apr 2026 20:51:28 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c4dbcfbdsm100150285a.12.2026.04.27.20.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:51:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 23:52:10 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
Message-ID: <afAu6ueMsjBY-yUB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
 <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>

On Wed, Apr 01, 2026 at 12:22:34AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The clock-lanes property has no effect on the hardware configuration, as
> > of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> > clock-lane property"). Since boards with new camss support can omit the
> > property, remove it from the required lists.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> 
> If you send another v10 of the series, please remove 'clock-lanes'
> property from the example as well.

I don't think I can send a new revision of this patch since it's already
applied, though there may be an opportunity if clock-lanes requirements
are removed in bulk.
