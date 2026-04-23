Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71573C9ED8;
	Thu, 23 Apr 2026 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935399; cv=none; b=hl9hIFo1WM8QdeGLdgc+o0NNqqya6/5yRgWdf1H3QUBj/UUgxPpykZh/k/9yNmdfPfyTW3EVI+oEw3zm8sNp1zVOfcXBGKDf8IKLnKKqUQBW9m2ZanYvc3LbiQdiUmLgHO7ry/TJ7VVQwyDBIaWIO7XS4SVKDmbE8QAh5cDJca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935399; c=relaxed/simple;
	bh=LmEOVucW+Da6ZRyIF5c12slqN1lpENa4Yxr82bUq+sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkPNh1Y69Emp//hoI5S8mkhDRmyz9FoqYryY4UqHuc4nNXgwV1+/Adu+WeDCa8+8PeOU8fhlaL5LF7zffZHz5b6KU4ziBeDyLkNxjfbdnmiUdEuZgk9H0WmKiidS9xp2OqOsK5bijZB0e72VRmZqvCS/2NFisPwZCiRkxwnLUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqTMHQd5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqTMHQd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9172C2BCAF;
	Thu, 23 Apr 2026 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935399;
	bh=LmEOVucW+Da6ZRyIF5c12slqN1lpENa4Yxr82bUq+sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqTMHQd5JAnCugsjSK82RslXfQzaU71nkjNL9oITexV5FZci65YjnPt0hcpDVPVHT
	 LlZwocrpev4joM4Z6gBcU/um31bHVP7TKS3LBGpEHaLyeGp2cCIBCI4RxlQ1JXlZwS
	 txzKbKJ9SJ4m15z8w64BwXbvN/kIZCuwwlWE43CTSbx10uwHqddX5SVpQW2CDG2Oea
	 QfWkEJ2H93hUV19C6PBmU+PJk5krFzAYuxcmuMJPqztJBge2sVdgFMaHn04Q1Am6h1
	 SgDyknjPbD/pU7mQeM4jqyaTnOqcUQ1Y6bA6UMxQ3fo2+41akPgbI58AiFm0L06Hna
	 tI7aKj9Z8glOQ==
Date: Thu, 23 Apr 2026 11:09:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: dri-devel@lists.freedesktop.org, Kael D'Alcamo <dev@kael-k.io>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Displaytech Ltd.
Message-ID: <20260423-cuddly-aardwolf-of-advertising-cc43ef@quoll>
References: <20260422210806.80948-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422210806.80948-1-marex@nabladev.com>

On Wed, Apr 22, 2026 at 11:07:23PM +0200, Marek Vasut wrote:
> Add "displaytech" vendor prefix for Displaytech Ltd. .
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

