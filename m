Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482BD317162
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017184; cv=none; b=CSq0FHGEj+Pwqd2cu2SbHiKX9m8cOxFzTmkwWBy1rVEZZrpefgycroMxqjZTcokv+NjVGxPXEZ5CmowrBFiJnegfxjVPW8oJ83fgETcLXu+fXRScU7X7KXAVO+KYbMvKS7PZEO+DOsH9Dv3xgehBch2Tq9M0MiDTAuk+S6BsP6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017184; c=relaxed/simple;
	bh=K4lnZ6woT95ybB008fTG6ieOTJpqz2f99IST9cPfWh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImSg9WrIZrnJ/Xbxo7NBbJZN1OvUtyPYTffZ8jCJ/PENeFOfTJ809sl36GiplTWX4wfE6ExSA8RbhwnnU4seGxF6hkhiVLvpuUOxyLT/ShMKkAQsjpbhfcTNaJ4u/ii2Im3NbRVpNh5nao66vPVAbeiylzh4Ld0SVE5G3vlK1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq53E43G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq53E43G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE2CC2BCB7
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777017183;
	bh=K4lnZ6woT95ybB008fTG6ieOTJpqz2f99IST9cPfWh4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dq53E43Gxp6k+q3e9SCl7eLuDmBRWmYCo9bO7m28D5gQA9EciRAgUAED5thnzEIC0
	 Y48R7Zf3BuN0+QdEl23doMPCZXcQx/a7zc1zqi9dc0uNTPLPtuBrpp+UKnkjg/eRf2
	 bl3W9ZshHegdf825YQVUe8Ub7av5jrTZCSkQq62yHgkn9nTFIKwpeLYdAPAfr0uVuL
	 ZhhRevgZj1OfzmAoMXXlSZCEVYJ6dSEG8dZpGp2IRre6z6kj3lMrUkXZJlVEhsqlBM
	 6smb9iYWHgEis+1m2Bkv00S57FrNNe/iag40P1+9NniFG/k7Sopc5M95in4tIU/EO1
	 Te68DqZoc024Q==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so8260829e87.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 00:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9phBh60+1j8HMMuO/4JshSKskKIi7gauaN26itVCQplhuhTIf/+R1cJ4WZhMKa2njIL49mtQynGcvp@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyVs0OBgvu3avXMj9CjkeuKKGsOh8e8Q/nBHmFdmKyyIAbhVf
	wba0oTlAL5nGJtw5rpStddcQhkFAxIbXOsKxLVKqCPfDR9nqEf6+LIgL9rOnPAP7kncSaYw0LaN
	3xRqaxmqz2PJhEX/naCM42YJImUBU/QA=
X-Received: by 2002:a05:6512:39cd:b0:5a7:398b:d191 with SMTP id
 2adb3069b0e04-5a7398bd1cfmr577262e87.1.1777017182582; Fri, 24 Apr 2026
 00:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:52:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPA24oV-89hAhu4msQQTeoPAh09Xm_cR1PunGHW8EBtA@mail.gmail.com>
X-Gm-Features: AQROBzDMenmqczGXy6g1jiZ75__AxsDh7gV6rtaDXDspLtZnQ9GdaBkuXdCUDO8
Message-ID: <CAD++jLnPA24oV-89hAhu4msQQTeoPAh09Xm_cR1PunGHW8EBtA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: Add EIO GPIO support
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 12:44=E2=80=AFPM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> Add the EIO GPIO support.
> Add the dt description and the compatible to the driver.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
