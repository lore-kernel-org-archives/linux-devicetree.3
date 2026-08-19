Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95AB40DFC6
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127929; cv=none; b=FfSTmAcLLkqz/R+ot153/w94nB1iweKv3Hp00AuNbrJwvHo22I4Sqs8ARic0vmCnxOR8AYI1NuWm/jSpyDHif9EoI4RDkRA2+wz7pLQbZDG+gXKXtR6M0so6Eju2ruEyp+y4nqHMMOk7yYN+sLYMHsL8WWDZ36fBd4vs6IDhWjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127929; c=relaxed/simple;
	bh=0qlzCb4XxZoTqc5bYz7C/qbvFkt8AJhYaLM0S1vbpJM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGdTd01VmPH1wvarmTvfa3N1ikvh+A1Gs7PJ4gCJuR1a13VF1a1mcXk8/T94ArWO0vDoUQMWT8tdqp3aezjPSxlkslSBLvBOh6sjViYpFm5cyoNl47QdY376FvLnW7qlTzWyntGPZ1rngoeiGrbLQ2qwxaiEcprqezr/g1tLX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0CDUU7F; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0CDUU7F"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994c49f588so6994035e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787127926; x=1787732726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAG4QBgBLWT2fC9Hd/KCO+unr0wXvjoWFWHd+CcrkoI=;
        b=P0CDUU7FSSbrlU8oZBMcHRoPK/YNkjwtpkql39OYb8U8tb6i0jad1i+9n4xPS1XPDw
         akMDen2kFC86hYgFq4lP6dao9a7vD5S02D6Ay8KNsso/YOKrLUb0wUXgpu6uk8DBMdfH
         FpA0LcURRd14KgGmSx4KwugiOwmEZAFaIFzIb+SVWBp/FYhhTkpDwufmcQ/CGxeq3rMI
         JvEMhOUvPUW1Guag33K64UkQlmqVbdVeHcZpc8ygRfdIC89L7wDirHPf6mSOT+INvq8M
         GV4nnA7ISZcsjx1DglVZUd3kNpoXONpt38D/UgbPC1bmRd8OODyWcRaGvd2eD/x/Ragb
         VmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787127926; x=1787732726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAG4QBgBLWT2fC9Hd/KCO+unr0wXvjoWFWHd+CcrkoI=;
        b=oO89/WQJldUasqK3ff3iNHf5yzQP3P6w/iqGGxvcTBHqZEovEAAfod70B2ZhdE4/wQ
         g+CyCVxPQs9ts+NojsJ4qujGxJrFo8QGG9S/PsmoxklWK4w7yFsJ7Cyix0jjORCzTBiv
         D5V2GeoiRG7/AKk+oozBUvU8wqmT7IZ9pyglSoAx8hMUSn8ESDkxAF2O1eDUc5FjhZ4J
         QrxYN11ph9a89mh+3JyUlhcYcdjIdCGmJafVLMO7YFj2r75LFGtyiANhcZxICu0hI7Qw
         1NMwB10G5oUlVVd4IUy/9oSv5vOzu5HjmspO7uw1QUyHLWNMoFhYnLchFVl3oxq5JUXj
         dfZw==
X-Forwarded-Encrypted: i=1; AHgh+RpJtMUlHSv8JD6HznNgcCGoHrx2CnVW75WIqKSCubYTZ0wA7fY7cB8HTxVUG1iKZtwSRBz06KA+I5is@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqoz79fGPAj4EEAQ/kVyigJ2r86Putjk6bnBJLac52pKmMcS0g
	cp0wBb5HYpC+Ew2p190y8/BGc96m7zPMRpJCTgp79lw1cEXT6EH3g1dO
X-Gm-Gg: AR+sD10iCubP8ejQkIdmY+O3z3LXWKS+GEEoeEOKBlCpuP1TqNbPy+/CEbhdbL0Y2Dt
	jWDd2D4O4hbsFiF5Behn7MlFeBmvf9NjbwA7VPcDkN9gxM6A7pq1yRGHdv0Ol6q1dxVyV2WnUHv
	ajZh0VwisZMRuCUh85neXWVarYHuR2g8a3gFle3A2EPE0vl9NtXG38SJigPIN/ybMrCzmHUvRrX
	KyrLfKYefNIQRdN+EPyvfqlE3usOodKj30IOOs1KcVz0anriz3Jw9jn+78fzlfO5PVPuixyR3k+
	rOwvdYzk5A29iyNhsYOT6Ty/XVAtbQQfMb+Q4/Z160Nu75nhTh4zt4fJdxhBKqDNcQH/gbNoHqP
	PpWdxlfeVWSkzZO+8Vh2Qna6rrPJYbQ9j75BxMwgzGwDaQuhvM1co9PpY4oEtfqmE5LM0oxLcTL
	6cLa5HtEf/dRW/9Nvmi7GXHhPBvifTkTXHRky4PfHvBOShFTcPMEjGuiZ5gXJSxuZyqWW9tQjuW
	SoCxTjjzSPIodzMN97E6lH/pp00KnBTK9HX+q6cxJpCno+7Bx8/2Uqo4LNZ/7l2V3M+I6dM8jbi
	uUnQ8LEz98fB1z81QXG/kMfN5AaPt4udJSe8ZWmirC6qDWXKdftcg4p3aZBNKXcuFbNXy+Z9nCl
	M/UtdAX1cbg+G2IUqTWVRNQLW85rRz4/RtekYPWMCVCJSJ89haCWdnFZ2aXij7N04fkww9w==
X-Received: by 2002:a05:600c:3f10:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499aa0f306fmr50702575e9.6.1787127925636;
        Wed, 19 Aug 2026 01:25:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm59079895e9.11.2026.08.19.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:25:25 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:25:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v5 6/6] iio: accel: mma8452: Reuse existing dev
 pointer in mma8452_probe()
Message-ID: <20260819102523.00006d40@gmail.com>
In-Reply-To: <20260819-mma8452-open-drain-v5-6-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
	<20260819-mma8452-open-drain-v5-6-d8aa590d7c36@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Aug 2026 10:15:33 +0200
Esben Haabendal <esben@geanix.com> wrote:

> In commit 32a5c04d4575 ("iio: accel: mma8452: Use dev_err_probe()") the
> struct device * pointer was assigned to local variable dev, so we can just
> as well reuse that throughout the function for sligthly more readable code.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
