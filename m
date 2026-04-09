Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C53D2DFF04
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719071; cv=none; b=U2vlwIl/UJu0wWeEdFWI5CVqBi7RLglNYEGRWr50ldrxtXATd28lmnoEFHQybpcwSeV5jUrdxI1izOUfyDNjtLxeRAaoSQ6+z9ldce+1VllCA5JXn23GqP2OgWWg3Pkw/gJ45DsDCnLSzGeYIWsPPKaDqh/J+dJXg3sDt6Q8gLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719071; c=relaxed/simple;
	bh=EFGUv70ITPjDkPlE6l39I6DKElpPeVcUYVP/gjkeVxY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WAB7T+kr0euTrHvKYpGklI9W948g/YmQbBsYIrIHSCUJaAVwJ5X8Cn6vHyC+sIDgjl9sQm/LJym9MLAg9UV0lKl1zjWh/2plmJpnyTKpDs2J3widhG4wFY5rbOjSkBNkunKKOuzUmuP/TXMsBUJ72givVb6Z8L1fkEoPiFpgfpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=none smtp.mailfrom=linux.spacemit.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
X-QQ-mid: zesmtpgz7t1775719054tbf8afb00
X-QQ-Originating-IP: 6bD4fn6zlzoRNsyvWerVgSjVIcx6UZ4MsVvp6bysC1Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Apr 2026 15:17:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6790880675297523126
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Sender: troy.mitchell@linux.spacemit.com
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 15:17:32 +0800
Message-Id: <DHOFVAYOFU7X.3J8VHC8FFYXD9@linux.dev>
Subject: Re: [PATCH v6 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Anand Moon"
 <linux.amoon@gmail.com>, "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
 <20260407-orangepi-sd-card-uhs-v6-5-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-5-b5b8a1b2bfc8@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ODcDgdcDagQKhHiQTjRmZC1pJm/uhRq/a4XWlmAMfld+WdE5doi7GRIK
	vYT/tWcSOc0BUsPQ06Ij39xz5tATA3AbcHk1LTWoqA68KT9NBt3usfMXE7HiEl2r+NszzFG
	964aUecVThGvT7ZxU5Xrl8CGazI58iNLF+YQK5K5jjXGTo0nrn68aO7pGIpvvWyqd+h55To
	c8/FYzt5S3FU5krrMcZCHNygR6zVc5/LZ/dG5KovQOSNAZPsAFHRgiLfiZy/qJLzHrCoaMX
	riWHesW6ziNsYsyNAV2+uA/ZIfztxkmjurzRgdOKaUIfMVggxfiDLaBB0gkIBZNyAL5VaNv
	AV/5LF6EQI7aMriHcsLTBFvQOHtOmjgVCgpayMnLVuIQQoZ04A5+IXjj/0+mczikufmjF12
	HeorGE7OY24OHdGU5nAl4SHZigdcbs146hzhUDREMj+bscKEFJG8KeOJ15Zv08/besOkuqZ
	+tF0MnSkbfnW5p7Nwrm0ggPcLVfIqN+J0yCf2j0l6FEfPQaut5FimLpiyV34iY3LKb+EgTf
	UaRzMUzzqqZ+6+0daB/yGL7+Y7KsyVibCIVIeNRRCFDSm9c9W+allZtjyNxMTpBra3pus2R
	6YXV7i9Vo+6w4LNRgWYI3dW/B55v5Lye94rhaTQEiR+tXohKHg43zOPtClrniNbxL1FAwOi
	Wcq4qag6V6JaiVQdQdXQ1XBlln2wY0RByeMv3rcTIQSHcekCFSoDkxIGQf44hdQc0bU4x0X
	PJVbrRxPOAa9968If3eWtPCT0d9uNCHhKNb+tH4FACTbRXN00pYnCdI4gFm+qru7mH4p70z
	M0C2fNWL1reQpQYZN7ImdgessaeseL7+xFzxE2QOBHPWb+MoWHqD4KJz2nkG6OZDSXhDk0I
	0nHu5A2m7eyfXLUVefI4bXcs1bdkpEMQRE1AEeRxqqVNAhuXac2bVy6UNzYaH9zPzZAdRCO
	WFflBplREH5U+Tk3+Xi95bebTujJ/bJ1YXYXGgDyvRRlj9NReXguLKSVBWgSEFQA/RSWiyW
	eDn8m2ighTd+1Xm0SKgQ1IfF5JGtij08Jc1QAxwQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Tue Apr 7, 2026 at 4:25 PM CST, Iker Pedrosa wrote:
> Add SD card controller infrastructure for SpacemiT K1 SoC with complete
> pinctrl support for both standard and UHS modes.
>
> - Add sdhci0 controller definition with clocks, resets and interrupts
> - Add mmc1_cfg pinctrl for 3.3V standard SD operation
> - Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
> - Configure appropriate drive strength and power-source properties
>
> This provides complete SD card infrastructure that K1-based boards can
> enable.
>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
