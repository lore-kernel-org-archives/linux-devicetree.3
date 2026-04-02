Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4652853F3
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775091934; cv=none; b=jdHqA+Zu/mgCTUjrcghyXK3EdPkZHGcFKqd8aqXBEhFBBrXRKd9EmHZztPqtHFL3wOKxBbyBgMu+2GfC0rtMYBvjOAsdeQiSQFyQ1LOwfOlNmHOhq/hPkElcvZlYBDwzPK4BXwFqFZtz4hIOUe6ce/Uy8HnAeRw5RuZT9d/XNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775091934; c=relaxed/simple;
	bh=am/OmExRMs6+4inYpMeuvlbO5iWLZZ1oD5RIyvgeXuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWqyGy1vZwGrtYRgGIDqdBoDBr0yNkxKjWUlJbooKdOkSr6q+hk2phbMaAQGcRz+rPizvkeHVktlkEGbJ8bShVzcLsPqY8kJj/gDzVhwD9++76gO3eXGYfpV5+KOqUJvEvhuAKRdTGy3IfjgJ5XD9aLOOtWy7owjVXeoVK5A9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6siG1Eh; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6siG1Eh"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-509134ab2d2so2934771cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775091932; x=1775696732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=E6siG1EhVTKGOfnj4xwH3D/Rw5dWilZ0kNDXadAQBVOQJzl0vx/FVmSwewipWFENKA
         xo+ztQgylWLADpS4vH9Sb8hs2mvQzuSgoIQtOLg/AeV5KTNrNMU+rU/FQrTuCd8ZDjQB
         E/YSSTSELWrLmk7pJdEebIIUA7v8Y0UYXgHR/YsLTN6kVqxJI1S4jXaAB77nvwWOh1IZ
         LFrMJJuYXZU/QqOITLSChuO3mUAzyGXkidhWBNNs2aa52sGILDCdSVMcOAffOMFgyBNY
         JFWcq3yG/mNyNgr8VYcsoFVS1cGo69MTJucRPgN3xo/CfYHa++nejqkjf0tLK/ZirJs1
         gt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775091932; x=1775696732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=ev1RaA58LMUXGhDaLUUxm3SCt3dOLi6jQAy457+VeAvhWzG2bErH4ihNqvK83wxmrN
         nI6pBfnnrbe0fTY34THQaiY5sO1Bs4ZcfTs4fM0Whxhw4XdA4INTR33FQYzffYKacCtv
         deAkcv8foyms5GdcqVYcKajSVXRszQK43XcpnhBaK5KrAHjUpEbrObUJBZ+kNseJ4mo4
         fjFfMLGX8LHuZ6u5EVMmR/eHjDG2VU991S/fv1TjBYJoXr+knfK2FI2bbq+378rS9jHL
         yUAvzUvbUniUDsk7VZRmF73VpElqi5IdLuIu5mpMZpULb3MH+N7MFzR7rhszcmnuwDlx
         oJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8UbMCB752nb4KRMH5s1eo62sIyg47u7Z2lWSjfYNE1+ZtUkW/aULr5V2v71+o7yCvN5VasXka43Ze@vger.kernel.org
X-Gm-Message-State: AOJu0YxCtlqfJOvcmFRhaokfokcPo66K15Q24EJyCmV7UqSL7MkW5oIm
	GNUi//fQYruCmqRAEJmskow3NvRgTx27BTihmPAF3irsKIhKry6ONY91
X-Gm-Gg: ATEYQzwuEtb/QyOBOm+cu0+k/5AiUjF2ekpsU6n1ZZoqRa8PhZmCmcJDA6dUJHQSA7A
	nPafkbQ8RAOl3EBpk+REnuDuK7vaB9b50ijmYuQ7gbqWF+2JVOd/ZH/CQ7o+8vtUfM2glZkCGQ3
	0beFnzDjdANliQ4eIwfDaOGQoED8ZIciQY3UzLsG3AbqrZSObwAf9I8rTxP1fqJ1/1QGvTMxJd3
	mphCeHepQ3F99zZlqnZChC94me88oKapwwiUlZLPSwjJSyC3lHzv5MC0CsZU8HYsv2yiA9TsrA2
	0UAimn48DvRCDQd/w+LBfYRcSwE0FD0vBV+6QKvTTfqKpZUxJTWWEmgVeNtdu+5xRT9BG6rHGit
	XaCFoM2ftJpNweGOxXWvNJDHq/APrB1GPiqPF3cgerVG7EgGfZOi5Xpqb0CgJHth7HuHo1QpQMz
	U7wED8F+hoedxbey/qfbYdyfeFVg==
X-Received: by 2002:a05:622a:d3:b0:509:2455:2b53 with SMTP id d75a77b69052e-50d3bdcc8cdmr85646001cf.49.1775091932321;
        Wed, 01 Apr 2026 18:05:32 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1a3fc7sm14217521cf.5.2026.04.01.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:05:30 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:06:06 -0400
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
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Message-ID: <ac3A_m4sKyJHa_hT@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
 <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>

On Wed, Apr 01, 2026 at 12:37:14AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The IMX355 sensor driver currently supports having 4 data lanes. There
> > can't be more or less, so check if the firmware specifies 4 lanes.

This patch is superseded:

v10: https://lore.kernel.org/all/20260311020328.57976-1-mailingradian@gmail.com/
v11: https://lore.kernel.org/all/20260324020132.8683-5-mailingradian@gmail.com/

If my workflow somehow caused you not to receive the new versions,
please let me know.

> Does IMX355 sensor hardware support any other number of lanes?

Actually, I don't have hardware docs so I don't know. There can't be
more or less without driver support.

> 1) If no, then it makes no practical sense to check for data lanes number
> given by firmware, there can be any stored value, but it's known that the
> number of sensor data lanes is 4.
> 
> 2) If yes, then please return to the sensor dt bindings, and reflect any
> other options, right now it is set strictly to 4 lanes only.

I think more lane configurations in dt-bindings can be added as they are
discovered, either by reading hardware docs or by finding a board that
has a different number of lanes.

> In case if
> 'data-lanes' property is omitted, you can use 4 lanes as a default number
> of data lanes, and this information shall be documented in the dt bindings.

Later revisions of the patch require data-lanes.
