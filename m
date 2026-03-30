Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF71339B1;
	Mon, 30 Mar 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864225; cv=none; b=pV/SK7wBK4HJ58uvZLLyn+Bmcbft9tcPyLVUosMukcHLl7WL/JowmTSlMCTd0mwZ0ocejX1PontKerSMWF8Q9mMCjge0PRvp25Jb0SGXgZ89PN+fnVMu0auVSKU+CURYvHiKIrqq07o1YlQe78jE+7wqehtapLPCE7FmHXa225s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864225; c=relaxed/simple;
	bh=LIqtJ48k5B5qj9wUOqYDtO+CqGQ6Z87zu591S8O/XKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV3ShDq3GXafjkGpkvrnBWxM7cRftEJ6SjjqMcbvBHGJQbB3fkalmJX1Z1w6Gni2MgR8l6ez07akkV3qsu6bbx4BK2yILVeNFxrLQwN2Hc7ViNz955cOBbdoAftJv4XiU77P7rB15F3BAas3snkWBLMpzLeKxheFlaYEEa4XVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=NSXpDRZo; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="NSXpDRZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774864213;
	bh=0cWBBv5rxgLi6P63en6zZ1oN58vmhNFhNRu5bv//9ds=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=NSXpDRZoGU1ffOA5gXg70nKoPwL5oFuKJ4VF6rNY3lB8rrtfzcNYT+m6Ux95K1cPE
	 IMzQniDWV63Tq+TTQJ10COV5TsxVj/zbLUQdoPidzQZmtUYb1XpkQ1580+C0TbAhaO
	 qSSMXGdMUZtCWtM9zC8/rHuPKShgUOvjQdaV3Y90=
X-QQ-mid: esmtpgz15t1774864212tc3579899
X-QQ-Originating-IP: kgQlQ1AFTdcKJCPfibdkLFsW4QhvOKwrkiwIr5b07Bk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 17:50:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10393731450073565107
EX-QQ-RecipientCnt: 13
Date: Mon, 30 Mar 2026 17:50:09 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>
References: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzrAUXRIQvKYrCHNJhwVHx8ubWpr67edBBlG3BUM5PzSLH+
	oc1hu5y+LCyPaO+iAQQ0+Q2NwWRAtvpMOnre0Wo6GSJV717gfyBZHPbxWy5Q4L+xwjv8JK7
	9QMChLA2qOCc4t+ZiSeU2CpI3eO+o0eDfzXl1YDaHOLc/vBODzVkQvr6AStaIi+i3sMf6PP
	15+mloG58hcJH+0ci2qwBhiJdiU9Ider3Vu9+wMJjXRiJRselw1vrs4ekqtrgkyhVx0JotR
	If60Mf4hdzWwtsGoMtM/PbrpiaTqkIUjikFcQaskNqnqBoMw/tAJAF7W8p+gnj/yQqK5GLB
	+WWnY43VcFIJJfU/lYYmGZdQQwlyB8nopaJLj5ckKguZlppbxCMF9q1Piwt1LSFBIUlV4fo
	7AKcQUq9ksZ0ijnJcnpgEeRntSTWoFlDbrdnIa2UPwZvYkKXzjK3EL/XZ9Sq0wtsnb93DvA
	CoXLcTkE7QyWpG2aWtC7GNQx+xr6k69CoxAk7liJRogGxOkRKldenTnqQ/+0F7NkIwNbgXB
	UMkF6jLgCpZEXENMKeK2PMo2IUcjeJ4l6K5N5P8JWC/wnWDTHteLaleu7AXya9z/2f11md8
	M+2ycVzPlHmQNRp/ea+w72s/iaT9R8wBAgQvS+efhcaOSjjR8d+j/HzNf+zU9v/jaQdktSP
	jkDxNxrLoenBZU5l7NIznZenugnN1iBjzLfPY6FlDEHo5gMkXR3XWm3gyskno2WuCexxo9s
	vGu8uugdqp3RFfhujdNQQBRx4cx9WbrrWjFV1w0zLHlCgoZ663GrOuvmWZmvPX1tGmCZP3H
	jbqiZU2DH4/CDTkCBpTLe15PoCcQ1T0y7ERG7DixuGWZEouE7Kgs+l6G5oumuCqP3uUr9Nj
	C1ijo43coUENFya3X0ntT+Lg0MntDwuoTFM5mf5vS6mR+HqsyE+lktMv1vCR++K1vYG4H+G
	ggZRRlCrlkSoHBd+1tjKpe2O+//oPMo07MiP0HkHySH2RIFGoxvNbkiEKJovHpa7MqANKsS
	3z8a+rYxThyWdHR+FjIkbwEBGbNLdgP7oIxxw8DqfQQOHfmtuo0T0oB+hqnVs=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi Yixun,

On Fri, Mar 27, 2026 at 19:40:40 CST, Yixun Lan wrote:
> Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
> i2c3 is reserved for secure domain, and not available from Linux. The
> controller of i2c7 simply doesn't exist from hardware perspective, as
> vendor directly name the i2c controller used for PMIC as i2c8.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
It looks like my Reviewed-by tag got dropped.
The changes look good to me anyway.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
