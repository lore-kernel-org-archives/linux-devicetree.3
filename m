Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA23CCFA8;
	Tue,  5 May 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009452; cv=none; b=IPx6V+x3q15cXoG2Ivw1eXa8xtlXaUpokwrTcwX1HqmJNRg/eLN0qcemY+EBAeEX4cndoPgN5sflgkwfi18G+9K1yDPg4zfhlnj8RRqu8Nx0Wi0Yq7wHDNupcd37b2ERNtyKhFA8oV8sJXhO0VB+ttTs+46TvIAstapPxAZlLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009452; c=relaxed/simple;
	bh=BSXjw9y3KYoAOtp4MKHJYGZVUScd4L94J8qMpikSXXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyU62W2QNHWKD753DPjzXdTxTtWTS5Pywt3sdx5IlRvM9vpFsykAahxH1ywPImawQvbO+7mZ5fu53OhWmoimXAtWrhy1puX8dg0HzGXewi95bmx6hQ6atrRU5pxJ79Bm15lywJtlyUb02pP1V28HOgjTi+41xdR949Jw5y+KQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcS80M1X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcS80M1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E307C2BCB4;
	Tue,  5 May 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009452;
	bh=BSXjw9y3KYoAOtp4MKHJYGZVUScd4L94J8qMpikSXXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcS80M1XsfS2qDLN4lcCjVu+8ZIOi6RttY7/OiKj0iinJIwz6c1egpyZJMkc0ejQ8
	 AXMVO7dzRkBBFUGg357piGKkJGw3zVRPA3ey4w/zqop/nmC//IY/VnpMNbpl8A/iN6
	 35aCGKNViUVfgyiCVUil4skzo/qhsfg+ukEnmWd1mF57Mnmnm37stQt/f3O+8MI4GH
	 MZEQP5jLa5NA79rBik6NeX67i6m97WeFnBAIPKr2Hevf3/muI3k0xZUnCMaCOVwNah
	 3ekp9AOENsMy65i4fs+uFgV+qvYvWgQ4HjeQKgHstZPpgaztHpwsfO3ftE668YCrfi
	 HwfcSMd1Do2mg==
Date: Tue, 5 May 2026 14:30:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Lee Jones <lee@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Airlie <airlied@gmail.com>, Nishanth Menon <nm@ti.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 01/15] dt-bindings: display: ti: Move ti,am62l-dss
 binding to a new binding file
Message-ID: <177800944993.3784016.8382311748877095453.robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-1-f628543dfd14@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-1-f628543dfd14@ideasonboard.com>


On Mon, 20 Apr 2026 15:54:08 +0300, Tomi Valkeinen wrote:
> We currently have two binding files for different TI K3 DSS versions:
> ti,j721e-dss.yaml which contains bindings for the "full" DSS version,
> with four planes and outputs, and ti,am65x-dss.yaml which used to
> contain bindings for the "lite" DSS version, with two planes and
> outputs.
> 
> ti,am62l-dss binding was added recently to the ti,am65x-dss.yaml file,
> which only has a single plane and a single output. To keep with the
> above "binding file per DSS model" style, and to simplify the
> ti,am65x-dss.yaml file, let's move the ti,am62l-dss to a separate, new
> file.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/display/ti/ti,am62l-dss.yaml          | 136 +++++++++++++++++++++
>  .../bindings/display/ti/ti,am65x-dss.yaml          |  94 +++-----------
>  MAINTAINERS                                        |   1 +
>  3 files changed, 156 insertions(+), 75 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

