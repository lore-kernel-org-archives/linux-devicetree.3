Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B63909A6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904039; cv=none; b=CzSkLB0ZTKKLVCPVKJX0OZ0XngNOX/Odi2sxFfYVf97ALmL+CyxKqjLGE/nYNv01wUVPE2/TgGRyRIdhvFsbaVFO0NFi7MB/BU6xP7eWlH4ao0lzEzSnEztjqovgUjf5YzUFDpnnd1wxk4+lSHadl60NUMw5dUPyLBXfJ0iSy90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904039; c=relaxed/simple;
	bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LhIcZ++vbaSDlo17P4bnur6ohLed4rB/l6N9rn+5vde7osM9DSjIxVc/YiRbiEIVHHFtxxmoIx3Jsa2WCiVYRJ/PFucLTOTbMUqeh2zHwzEPCr4nR/ZNzKTjyQH8P756zKQ56QlvKlU8eU1RZ/vBsWsEAA/rMUNwSo1W+D2/ViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zXqWonrW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zXqWonrW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so533965166b.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780904036; x=1781508836; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=zXqWonrWFhauWO395Q9+0HIxwy4vwO+PkgEKGSBJ1qpZ1bh/XpORsolDvvzCSIAXQV
         gUnJRBUtelCcgqPdViQrVpbFb0SNlYumwjdWwxufnh1zbgg6W/0RotckB/ZtiA2UjMDR
         WE8U12rGibdjlyPDBrlyr+1/c9TOOlSXBEiwCCn4UxKtp4SWto0pfFfFDslBH6uKAo5R
         6mVJKPKmGI2wJwT6bwLQEQwmwF5zkAj3NOWtYwNkQ30frILx5J4D/6ZqTjemYVKew6MS
         gL4abfzJo0jsX0pBDpaO4kiKHplWefWimnG3emrWrb3zR/8EhLBbzFS/+OX43neTAl5/
         8LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904036; x=1781508836;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=q/OWlVWpmbeW9uYL6Mlgu4wPVWMh5V8POekS7VURJ1pDdeFEqrKmXw/PxY8OUF03o9
         9NgKYWXMk8frB3FykKvJjWn9KUN3TifYRQvtrap9JnvVXQXkiQEfv/QMGpXShbOC1dvg
         RTPQeDMDgKZMou0nD6Lpcad7K05mjA5fH+2gO5Xz/Bx4NGokqZtYwfQ39WWbFxUb5HLj
         QgetekmVI8uo0LHAH6/OAE86evRxS5ES5ctrEERdd3JBD3j+TD2UKITfb59HlnjI5uhy
         9P4IQgJ7Z9DNYMTs1fVJy2px0byOLhiOcYSkD9HWBck+oAC0t2RVnemBscToAbAMQMjG
         jZ4g==
X-Forwarded-Encrypted: i=1; AFNElJ8P52tDuyhKx6c/2axx9X94w908meYC5ARLbx6dY4lpKULNsTi6RFo8EDoOlpepo4Qo1AB1H7al7jwx@vger.kernel.org
X-Gm-Message-State: AOJu0Yye0unXfkEzzIuga3hJanrtTM7NpinkPU3gjgMV53YT3RwK3dWe
	az3u1Vq7WdEhUn7OkQYz81A7aFugo0z0IW1dL9KljLHstXbJw5iuqjmt7wmCM8M6dfw=
X-Gm-Gg: Acq92OEu405zuTf2aqvD1vN7rLYINdz4k+eXbR7h4YYoqjbdzIeb/f3yw85EUmy5ouE
	Ly2YwYHCz6zyuDAk1+zUlQg7/RTdME1nKy83+uGY/bmneVWGBsUydvA9yUewl6yne7/2KsZcX9e
	AnnDdGrMuVz6mf9dTrObE2tfE0XRWhZaLbZcJVlYRv4Gu78z/1euqmFvPVQKyRtwxkJNOZhdGYl
	/Eel1faDeyJLiVLsjrKNm35OYLfETLo1690BDz1NBI4U95eOkhtmhlEm1vobCl1AbPIAMfEAHeF
	Upl71EqMyIyLpI0RO0aXhKVNF8Riv5QVJk69Rj2u1ws1O4LAxM4WHfavDEiJLifrQGTaaXDEY5T
	vJXvpxoC9GKa8f4UAO0M9F35/OEaUATYg5ui/xHPEb+4u6EsVEmqRjgZuFoz2u9GmWjqooY8jUU
	ODF5EKglGxxsYdMSFk7yrH4GVV+BBNVW6MzmjD0IrlWqBPj9+Y9iH13HG/XmkppWm8/TU6RXPz2
	Icy2Cw=
X-Received: by 2002:a17:907:6c0f:b0:bcc:e8f:c3a8 with SMTP id a640c23a62f3a-bf3738f1e4amr638949766b.29.1780904035800;
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0522834dbsm815190666b.27.2026.06.08.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:33:55 +0200
Message-Id: <DJ3HSJ8UK5MN.3FWLDU8CG2J2R@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

forgot this in the previous email, another kodiak=3D=3Dsc7280

Regards
Luca

>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
