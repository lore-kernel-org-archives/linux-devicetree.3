Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCAA37646A;
	Fri, 27 Mar 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611735; cv=none; b=FlQetu9CBY544XNR1iKuPOdbNn04KWCpNvbZO+F3QT4EcKqOlOnVHMii8GKKksIzHy/KDi+s4H2hPC6psRDPf9E74JVPyQY98PNdHglRnoYyW+Z5A4pvuhHWIbXdEiDkGiYiMrzhsJ/XkzPsz59qtVUC7YTZGE5q+AM3joOLzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611735; c=relaxed/simple;
	bh=QFl4kqD1CXMDcmig90mgvgQHa4TAFpGhjWa9ypPBZVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIfK0NssvhLLjMz5UduM/u5mFi/6qYYN5hXoueGo/t4tf9suZcpqngR++t9jpumvOFJ8GNda+T7Wk5B8uRvrY75yQqqm+fwbHDj1GCaa3amfhKCJz9wyxaqvL7ITc1ZS0sIN1i5y4Gctsx3wiFbpmslW/jpyVNzgaCmyN/QSJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1L6hU7T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1L6hU7T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEB4C19423;
	Fri, 27 Mar 2026 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611734;
	bh=QFl4kqD1CXMDcmig90mgvgQHa4TAFpGhjWa9ypPBZVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1L6hU7TSlEUEytoAbYnGtCrx/F00Ih8LsQL7hcSWLsnvSOsKYrt9CN9zt4QJ7OOb
	 DUN/8Syqyff8FBYTSOPJ07peDbQGs5zWxRtS6yXFvf2E575BgGFdgD000mBe8gd1OG
	 P4ob3xC3hjfE5tbWB0B4rrXgOiyx9ncNdu7f/Ez7RSkkQrmvtpEfnMKzlrW5nFvpPs
	 Ixu2hW0LzmflkhSQhjarSDkRZgZhKBAKCx4d02PWgdugvxbrPRZPQkRabjVTMB2Lvu
	 pl3N6T+KkhPdcKtBXp7fSX+X4zADpEd5XRRIBdnVUH6S3yIk/j7R0EOs8bbMlvE0un
	 LyfjiuGqBZq0A==
Date: Fri, 27 Mar 2026 12:42:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v7.1
Message-ID: <20260327-tricky-translucent-copperhead-bf3ac7@quoll>
References: <abcEKCNIA9wDgIcE@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abcEKCNIA9wDgIcE@x1>

On Sun, Mar 15, 2026 at 12:10:32PM -0700, Drew Fustini wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.1
> 
> for you to fetch changes up to 9c99a784d9117a192ebf779d4f72ebec435ada97:
> 
>   riscv: dts: thead: lichee-pi-4a: enable HDMI (2026-03-14 09:19:26 -0700)

Thanks, applied (dropping the SoB from tag - no code is in the tag).

Best regards,
Krzysztof

