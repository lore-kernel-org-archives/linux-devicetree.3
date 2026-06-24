Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD73A7F55;
	Wed, 24 Jun 2026 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293081; cv=none; b=OWbV9j+baA6OL2x7EpxD83eAdo+YVsqtDxT0GcQ5HrlV0avIUaemkxk8LREPB1vsCboEnEb91qDsEgXdUIw7oBXRA4kSFKML8SGKXNPxxiYbg0kH69wDcBmDcEutpvDNgq+Dy9Qi6X4z/DFj6yolJMRpeRnT+a+xiCXYAP7WbiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293081; c=relaxed/simple;
	bh=MFjA3WhzCrsuNv2nkLYU79xT7ULqQWyScaQQ04uE/IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn0ypKl+beJUPOqSiGCiyO5lMFSDE20rPgjjX7GCqWFRRDGRQgUsE2ymBIaysrhXuUxHBBpanj/rhqkwWd9yksO+CIeA93Ik8Kb3kLQ7IXAy5CVWc0aUe936uOHoJaUZ8DMxwzDk0hHkRF7KL0XE6HUGrNji91Zz4ptAQSYg9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zJqFV6vL; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zJqFV6vL"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ABE3220078;
	Wed, 24 Jun 2026 11:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782293066;
	bh=pmBkesNmuLNvUJn5rrwSRud7R4UXCLNjjmtNsb00ATk=; h=From:To:Subject;
	b=zJqFV6vLGI/4MsUw1JuuF4VfY0/aHTgm4za771PD3OyLAKzSgRzGvVU2RNdTj8sP+
	 8uaVnVdzFPvCezbAT5qoztkC+sL0fFwOtiAcNUgr52XroELvyObJd8dAIHpUVbRJVE
	 kowxnSJ2rZ3lawvQdt44T2ggJsI65W6QSSf92GTji6GK9bdLtnt9aYwzebIVu3XmZc
	 l0r9YpmxixJw38js4ET5+rRA4EvvonMPnlwBTdMXmf4L3JOkVDc+jFjukeV9PBQsHj
	 w+QevUTrn7Avtb5kV8OCem2WNOVbdGitwRlQYgKpaxTeRv8bqMB7No018XI3K+O0Pp
	 D1kV7z4BCdebg==
Date: Wed, 24 Jun 2026 11:24:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org,
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com,
	sam@ravnborg.org, leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
Message-ID: <20260624092420.GA10665@francesco-nb>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>

On Tue, Jun 23, 2026 at 04:57:36PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> This series adds device tree overlays for Toradex Capacitive 
> Touch Display 10.1" LVDS V2 on Verdin AM62.
> 
> The display addition covers two interface types:
> 
> - Native OLDI (LVDS)
> - DSI-to-LVDS adapter based on the SN65DSI84
> 
> The Opto Logic vendor prefix and panel binding for the SCX1001511GGC49 is
> also added.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

