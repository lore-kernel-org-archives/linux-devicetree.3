Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794333;
	b=LTIIIo4mfebx7Y9K1KthEFBv7DhBUI0usofDZvaNOmB+NYHQSMFSebtHFQcvGBnhzOY0
	 y44+g/pshMfBafvYltH1vFJ8rcw3w+031LDDUssazI8jqudiuOZESCI/JIUuPD82x5VYf
	 QzcRoVGVvwlco6NYozw6LcWqS2rLJ03ZCjgfe12Fv2JW6jxMjHK1h74o1HmwNyCFsR4XD
	 8IISlHYhtCZokHtKoAXLKWOmQHqHvv4JQXh0wEy+QIkRmYZyvA7Hnw2BIYFBJ/qulqitW
	 Bx7zHA6WO9u+LtuIouRtXEEhJCLII+P43Y6tm6eUSVH7O6AXRv1pOcIayHQaw1zNbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794333;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AeC+f9+xtHroS5gZQKv6Mod1UF7caHj2d3eBTaqZD7o=;
	b=XxvbY8OI0YObSCIRS7oJU+wsz+O+5U67BCC6Lfr80s1mgkgQP+Zyh+xnyjW3QBaIHbBM
	 u9UbWr+HRtjDxnsgSs//lJc3OLRFMPPwWJVhINocKNAN+FRmA0x2GrPxYZEdJKPinSqz6
	 vGQMM6e7G5GdMGtdmb/apJ0K+k4GRbff7lnEQclkNWB7DcYQ8QFvifNyRAqiz9x5CRPPK
	 j9p+deSnvn0Py6WvwGyeOoLgehPAXyAFgMpVPUk/wAFTYAIlO2iX0apIq/+GerChzoH1A
	 W4HKKVK4rxH4r6dmACygKUoTjBMYdz4liDivmMlwsjbJiALKyMCkbuKgtEIEzMXn8zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejQAYoBL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835D1606A31C;
	Fri, 27 Nov 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejQAYoBL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012C91F0089B;
	Fri, 27 Nov 2026 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794332;
	bh=AeC+f9+xtHroS5gZQKv6Mod1UF7caHj2d3eBTaqZD7o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ejQAYoBL+8h+u/6VCHtSI+eihT0YN8WGP4heq0DVMytYdTlOkmupyUvOL3V8vXyTZ
	 LHCLcl4FnqW8OrZenqDsQa8B6QEtuS6oHGS6VZuj2TCcQ0aMxaygzhO8se0iCfe0aK
	 3Qaub50AnSQcnOE4lYuUUSdrn7xIzlGMhbPGmxN4lZfPjCDIlKLqo2iEBaxx3gvfS7
	 XHAdSIdpLXUNbofePRbDAkv8i0oIx9SuVXnQJc45hPucEcyk24tw0vHyfjsjkE48hN
	 FJdJRpl5tUecsNSJ+VJF5Uv+ut/80Sv0CB0/hxFIE/Fd3NlWEnjUU1lQwzE/bgOAzg
	 wjRWg4rJYPMfg==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] dt-bindings: phy: Delete old 'phy-bindings.txt'
 bindings file
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
 Alex Shi <alexs@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20261119092429.2414671-1-ioana.ciornei@nxp.com>
References: <20261119092429.2414671-1-ioana.ciornei@nxp.com>
Date: Fri, 27 Nov 2026 21:15:23 +0530
Message-Id: <179579432303.13164.13606957919284075924.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=mani@kernel.org;
 h=from:subject:message-id; bh=gWBvMZqEOIcJl/fTLY0ucaK+2ByPjJBWHHwmBGNtJJE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaWVgW/yoBztIlCon152Y4gUn3EHb4hWufHia
 Dckf2UYGh6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmllQAKCRBVnxHm/pHO
 9dp1B/96S68FCMR1va5ajFHrsMksIjMtB9rVBmlfT/Mqe/eSV1mcqnb6YAwV6lNbfVeypC6WXg/
 Ri/DZkj+3PUFWtrVuETzoG0Fs0RnH23ZrcnW688OQ8S+zW7VLsLeL62Xtr+5JujKbq9W1RR3M18
 9xG9KdWzCEzgumpKxbZP9Bgsh+DJAzRn/P5PNwWN7QlRZDhkqkMmLssU/MO+Mlgq00KfmdGCxJ8
 gSMiU4WZkJBOoRHUwp2wKxKchXHGQM3UByNoEoSaBDLGPr4egcGJ8e5N7lmRumDbzugQ/hxu+I+
 weYWXsbvs11qiDtOxFL7yvNQyWThV7gUXVKGm3qTsKN4VYB/
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-19 11:24 +0200, Ioana Ciornei wrote:
> The generic PHY provider and consumer properties ('#phy-cells',
> 'phy-supply', 'phys' and 'phy-names') are already described by the
> phy-provider.yaml and phy-consumer.yaml schemas in the dt-schema
> repository, which are applied to all nodes. The old free-form
> Documentation/devicetree/bindings/phy/phy-bindings.txt file therefore
> only duplicates them.
> 
> Delete the file and remove or update the dangling references to it in
> the remaining binding documents and in the PHY driver-api documentation.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


