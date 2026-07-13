Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AA375ADE;
	Mon, 13 Jul 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955220; cv=none; b=rsqI4OlM6O3OCDgYPABxVlR++qDwkpeJuMCrdVs6Fr8Ifpv7IFFc9G1bHhD7FYiXDT5kttObYr/8gWV6vEXYGXPudcvMC9SPkkeylK0B5zPsdTJmQIfmUHOF+Pcz/pOg9eTw/YPjPn6ELZNgeSgmUdaWF6+9/weS6iUG3YEq+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955220; c=relaxed/simple;
	bh=TdudvA5Q+h7Noq3Lc5D0+IandJlVT1flU12QON23Bm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcNAJ3N/24SUJ8PpOXbFufZehbi4wHAJ9m5usgglNaRQoixBKsbkt3Np1W1zPqa8uFk4N0r+eBA6y2yaN8m0V1igF7ZaQNpl6XJtq3z/PON/tcFGqmqB9KBQhtV87lf7cG/Hql4HaMW8V8q6CwKzkOMQhx3/KDKjgxVZeTZU0yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhwZtfdG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhwZtfdG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE611F00ADE;
	Mon, 13 Jul 2026 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955219;
	bh=txoaIEfKGWc95K/XrhOPLeITofq9U+ORZqox2hXU9iY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KhwZtfdGtezmE6FE/SQKOdAe3qBlmWwN9uv3DkFBIHPl+pQ1uC+ea8mCubE9gZW1r
	 2T8Nti90ovSG4NHuxZWNJo+8Goah2v9Yk+qZSN7x2pazUorwdS1ldX69yaNxFwacym
	 SmB4PZ7s9uxfyJGH4E6IUiGnjF0yQy97+ufOwLNmrEhjVUZY24bQ1YH2vFomqu811U
	 wPjWj4HeSYc3Fevd350uLTUafVyZhIpAn8nIYArRyimS0ekrUPPic41ZZve9JX6/ma
	 C2mGt3Xc2EpuBBIUlD3yajg2dWIofiCrWGz48gIh1TAb0biSEKRqF4RyJIeqfRdX8W
	 qcIYjelmYDmyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable PMIC Glink nodes on Kaanapali
Date: Mon, 13 Jul 2026 10:06:52 -0500
Message-ID: <178395521266.422064.7409768624225091838.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jul 2026 10:37:16 +0530, Krishna Kurapati wrote:
> This series enables PMIC Glink nodes on Kaanapali MTP and QRD platforms
> for providing role-switch notifications to usb controller.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
      commit: d0ada7b78e74becf8e7fe6fae8392f1731b52896
[2/2] arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node
      commit: 987ba6986860a07a45e8d79436866b4aa92be8ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
