Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246532779D;
	Tue,  7 Apr 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587869; cv=none; b=SqhVSh5/wmDGUdfGlqT7AI9XESxQnu4m3zprk+814UKwXfsOMrxSWwyAfGkLOV6DSBeoVI7CYdFFbAZms/cwJDrZjfjz8aaVHSVVtq0NgPMQGL2nzb+6LLuelm2AUm6bVyHEyAQuY7xy7x2iaTSUiAt09ly02Mls0JbrrqRGlfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587869; c=relaxed/simple;
	bh=Sik0SoaK1EWuxMxd1gqVuvsRwwfkEq91FdOyxh4afXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok9cv+zj9JjbigYxYpxDqXM8I0/LGf55km2Tfm6WtEnYOnX0JQlRjmhMZzE0V0iwAxAbzURkXK/UGnAWHk4o3xbaugdLuJ5agHsRwGNlHNVpl3qOW0NYJGQA5mc32qa4ivOlnf9eedXyXuRZ2vuEYHpx3Px2XhG0JyTbdCrx6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxN5Ad0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxN5Ad0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C193C116C6;
	Tue,  7 Apr 2026 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587868;
	bh=Sik0SoaK1EWuxMxd1gqVuvsRwwfkEq91FdOyxh4afXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxN5Ad0KC8AhF3LBbTi/c/9i90P89XA1gl1n2g/ztJgaGfHSupvKrmVBkU9BFO7qS
	 j/Xr89ClhNcRzgPQovfmazx5du0Nlkfq7Y6wwut5mqiUGOuC0d84USk0DXyCUSLP+1
	 7/7PNyOvOeNzRlKKcYEIy5IVWAZcgBH8GoED/5O78sn0DWk1wJ6i9mmtx5BUcKS6QN
	 3swdiQgVQc4O0AkvPQ1oJulcrrIQe/VwjkXoJDi8gAcNnY26jAhTpmJFPZ5EbVde1b
	 c1I+442FdwvawV3BWmksvMOOrUFEPdYd7a79HJJWl/I31UZ+VRJ2mmXtH9GzCAXRYw
	 p24KCe78e1+Yw==
Date: Tue, 7 Apr 2026 13:51:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza
 Synopsys eUSB2 PHY
Message-ID: <177558786599.3383360.12409209336337472193.robh@kernel.org>
References: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>


On Fri, 27 Mar 2026 16:14:27 +0200, Abel Vesa wrote:
> The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
> one found the SM8550.
> 
> So document it by adding the compatible to the list that has the SM8550
> one as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

