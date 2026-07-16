Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA923C10A0
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199410; cv=none; b=XQeIhcSQiYShZLOfQ2CkXTi9jkxbP/brJih9NS3/d3h0MOjBrFZ4nLlUrN0UNgzo7Z3JoG3Cl2aAEKjXAAAoDFVOjDvLRvLRaD4A2SRTNfc5h+UDsVgSNCVUuRB3rVND01hQwzlWABPpZJm4v2avUCcfh4F8b7nzaqtB+Bss6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199410; c=relaxed/simple;
	bh=O0294iFJqtBfsvbkV8XnCQuufzdC4+tPu19x1Wze+Tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=it+qAePDPKQDzHPYDZkNtsuSUlMNzTUguZiAbvv1DIZ8mj4Nvezu0sEpADCatSZ2Wn8BtyViE642FcPJjzzEjurbksMuCz+Zs/sMOLmKp5xmS5gBK4D0f1ULEJalLmQgXjnYxoaI6FsI+qV8jHBzDj3zqllhDPGvJfgYltId9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ijxRUksF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ijxRUksF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6291A4E40E00;
	Thu, 16 Jul 2026 10:56:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C527602B8;
	Thu, 16 Jul 2026 10:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E73611BD3BD0;
	Thu, 16 Jul 2026 12:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784199405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O0294iFJqtBfsvbkV8XnCQuufzdC4+tPu19x1Wze+Tg=;
	b=ijxRUksFLrrRC9XOyW8gcVKnG3XdGF1wJzJE7AuZ0lIOLUGQNa5msOZbwUYFs6F4sf8tLj
	QDIctbFFKlvOvuHw8VHKrvRBmjc0lK6f7EmhOo6zUnSwu3sDi32uPAZMuJpoNoIi0ZbDaZ
	C6QOpIlnJBvg3WTIXw5dne4usYLjr2EArgLP7kh4lHtOxxL8+JUiDa6ZeCyXl6a8t86OgW
	67iOmPhBJREpDiXBRXuIMs6q7RqIwxoh88bwrdD6Nc6yyn2odXbsqj+O6bmwjrgEUiHMZI
	6JtsxE7+lvPlXGtBmGsLrg0hRsrWE9p16BVl0Z4ru3iY7/86JPjLms9kBQ8gkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Herve Codina
 <herve.codina@bootlin.com>,  Geert Uytterhoeven <geert+renesas@glider.be>,
  Magnus Damm <magnus.damm@gmail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: don't set status to the
 default value
In-Reply-To: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
	(Wolfram Sang's message of "Thu, 16 Jul 2026 12:10:30 +0200")
References: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 16 Jul 2026 12:56:43 +0200
Message-ID: <87bjc7cidw.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On 16/07/2026 at 12:10:30 +02, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> "okay" is the default for 'status', so don't encode it explicitly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Board still boots fine, which means the change is likely correct :)

Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
