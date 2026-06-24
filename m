Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B0A3E5A33
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335718; cv=none; b=qF7hjFXd8bsMTVIg7vh5Nqys/0XKSIvobgfObFRw/Y6IE+Ytctr2T+aV+W2K7j8DojKEUHL4JkU3iMcWDtXxVrZmVOhUp8Tq1eZ00Eg9hUVi5hIgVC/l97J2YOCaYYmwzY5f6NxS4PIjvR231k8hwkXjqKQChoaveSTxcLzbdI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335718; c=relaxed/simple;
	bh=0zMmiMYxmO59eZ6qVjic2K3wExDjUdUS48C4K7QI6YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7R5j/7kubB0WnY4zWdTxOUOsBnO1zEXRLzMav9hfzCkWPcKjxp3OkwhIT63sD12FqNY46ySWeRZn06BUe+OVt108aoqM//4UNIi9xZR3OxHSUfOcXOIbc46/bIKfQf4bmEFWWfsxEX3jxxVUG01ns54d32lRPirRN71cOKDkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rbB9U/5C; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rbB9U/5C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F1C19C6B3B8;
	Wed, 24 Jun 2026 21:15:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D814F601C5;
	Wed, 24 Jun 2026 21:15:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3555A106C8468;
	Wed, 24 Jun 2026 23:15:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QHUKe+8hibFtqZIizuIRJ/nMgnVCIFJQfTduGfy+O+U=;
	b=rbB9U/5CIB9JHfTSD21Vrbl1Y9hUo1b+kLH0Jmg1EZ/UDm3WAMNhs2hI3R5DiihaLQ0gez
	lGv6EbKvYWw15t1T95U+9dsIkjD/fgqDQEY+C+SUeRKLmCDgaC6T5WsHuBSbLmOse1s5Vx
	jV/VguwM4JIQNROLOQY5IFgib0QvoG6DmOd7wMGTHcBeCbv3ZHaa5DKIfrgQ3KyfsSyvhP
	jvJcDCI7zranMMVuleWIL6S6snMYyGrsCjNjJcsaKUFB2pyTNAFz9PriYxrxBjsxO7poHb
	XdsnAZXkrq+nhpRt+6xPh3z4NaCBtWqlL9B3IWtRHpBpZDt8lsrjxG2njY+WyA==
Date: Wed, 24 Jun 2026 23:15:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: Re: [PATCH v3 0/6] rtc: m41t93: add new features alarm, clock out,
 watchdog
Message-ID: <178233558829.1517260.8402947960501968336.b4-ty@b4>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 20 Sep 2025 20:30:48 +0530, Akhilesh Patil wrote:
> This patch series adds following to m41t93 rtc driver.
> 
> Functionalities:
> - Alarm support (support to configure alarm 1)
> - Square wave output support
> - Watchdog support
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: rtc: Add ST m41t93
      https://git.kernel.org/abelloni/c/b70598b3769e
[2/6] rtc: m41t93: add device tree support
      https://git.kernel.org/abelloni/c/081e3de28c76
[3/6] rtc: m41t93: migrate to regmap api for register access
      https://git.kernel.org/abelloni/c/d86e8682593c
[4/6] rtc: m41t93: Add alarm support
      https://git.kernel.org/abelloni/c/5b55ff7cace4
[5/6] rtc: m41t93: Add square wave clock provider support
      https://git.kernel.org/abelloni/c/5cb6816cd81b
[6/6] rtc: m41t93: Add watchdog support
      https://git.kernel.org/abelloni/c/15ec2ce19962

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
