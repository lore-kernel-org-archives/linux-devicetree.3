Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421590;
	b=DE3bfiKvOldx73CiodMxIHQQP0XjnnhdVOL0Fa0V/uFXgL8kN3ZpHFBooOgtLL9TTqm3
	 111jpA+G8muPLw9JdnLQ+gkgBSB4OmZ5BedDxTYBiyyEXiFQeEufGMTH3zb4Bqtmp4cv3
	 2i7dp94e2xDHDQZMx0XQvLxcTwd5qiNN6w0TKj2Wd0ItG1VhrsO/R+Ox9mMiqMWfQb9Iv
	 8ZRoLqe0jFd012eH3vVf/Vsm3CB9go6NvqscJ3sTvCId4KelWD1pL6aPOdWgA/WqUeewd
	 TFTB5RTm7vw344uCzeRc5/+EaNIEn4x7u2GsDLzWTBt4cbUZg60vho/IO2nJzp+HQ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421590;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dcJLIJFhaCRxzOyphj2FZicgjNkLAYFkmuaB9/+QDmI=;
	b=Za7b8L4MTyTkwBFgajioF9rs76qFVNoR1Tqw2EyClmqNJGrOIYOaSb9H3tDflV7PgTug
	 ehhhrB64Q6Zex1zixFBqO4YLxk+JvcczXxR9sg6EkPmdGeqCID8qTM3exXJNEduF7RPGc
	 uQccmigkpWVsR5Vs0xu+ejGhs7OhoOAZaGAVSMdwze0BmbgxR3osi8EiFW91PY3MNIE9e
	 TvTejiZIqt+V4e6JpCSJR98HG0IHHTmuJGQJyrlWNgLquzOMdRcWT95QeHn5RY0zZp0C0
	 twyk3o4dx4eHCyLVIeihxoCNOJdQg7Y8ozk1qGH3EgLNLADvHog6y2dbbXQiXjH0dOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0Grzwr1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D1606A31F;
	Mon, 23 Nov 2026 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0Grzwr1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D8B1F000CA;
	Mon, 23 Nov 2026 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421589;
	bh=dcJLIJFhaCRxzOyphj2FZicgjNkLAYFkmuaB9/+QDmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g0Grzwr15lHuTQzQeCA2q7yoGzGsMYuhUtPdApQK8P9BkKfvoHeEjoFcak9SB+5dN
	 eD3Y1Gxd9Ew5SamgNjRALPBQ3c/AUILEDzl4TKVx0giZeBNrIAuDx1hz519wI+4ahU
	 NgXLIw3nPnPL6dohHxKyytxe/sZ3dzONSDRXumFfAK7/iySdIgCwF7/eb6LJFda3wk
	 BCn733fDxjZP+DzPjRIfRkrJRq3HYfKNkHWXNrZNhufsmdcFW//mBLbWGEUx1Xd5bx
	 bk9bCuPZpC3N8o1MKmZlPZdcXLo8qz65JEO8qqEdkKhzRENv0oRrNfMR99D2XFmUIi
	 w32lXMrj+NOzQ==
Date: Mon, 23 Nov 2026 09:13:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qusb2: Add support for remote
 endpoints
Message-ID: <20261123-international-healthy-peccary-ddcded@quoll>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
 <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>

On Wed, Nov 11, 2026 at 11:01:26PM +0530, Krishna Kurapati wrote:
> QUSB2 Phy HW is capable of doing BC.1.2 charger detection. On most of the
> platforms, the charger detection is done by PMIC. But on Shikra CQM/CQS
> platforms, the PM4125 doesn't have ability to do charger detection and
> that responsibility is delegated to QUSB2 Phy which acts on the DP/DM
> lines in its control to get the job done.
> 
> During process of charger detection, if the controller is supposed to
> enter device mode, the charger is detected as SDP/CDP/DCP. The controller
> must enter device mode only if the detected charger is SDP/CDP. In case of
> DCP, the phy can be turned off after detection. If the controller must
> enter host mode, charger detection can be skipped and hence the phy must
> know the role before the controller so that appropriate decision can be
> taken whether the controller must enter device/host mode or not.
> 
> Intention of adding remote endpoints and usb-role-switch property binding
> support is as follows:
> 
> a) The DP/DM lines do go through the phy to the controller i.e., the phy
> exists between connector and controller. Hence adding remote endpoints
> depicting the same.
> 
> b) Although the usb2 phy is not the entity doing role switching, it still
> does need to decide which mode the controller must move into and hence
> adding usb-role-switch property to allow role notifications from charger
> to go to controller via phy.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Dropping from DT patchwork.

Best regards,
Krzysztof

