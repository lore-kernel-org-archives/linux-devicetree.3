Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAC47DF8A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844490; cv=none; b=HvieCTt1ifsQ6SpmyHujE11mKJjL3wSXeXhuz5yzy8V7uBKv8uqeRjkR3l42Ah7GlOXZ/Kox8W8jYk6b5Pt14G1d2Ro2+5qmFsUjo7beRxeS5jnE108z4cPt/xVyfiPA0uTpakP+pvD1UWQnK59dHZE1hYE1kaIr1DID/cew1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844490; c=relaxed/simple;
	bh=PFdzFQ8z12U6QPw7WHvmKcX4PQwoOiB5fLp7t21R8Oc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D2Mo0JoYviQPHLzjYGi1rleBdp+zfy0ompvHT/1ITeINq+LExn+RZ5mC6ukAoX21w2029ryYBafH3v0NcAoNdXHmSlk8PMKoc1zjBWwvg6wkDFJAWC+/jOY0pLVy+FhjvcAsdgnkDZXCXBpReYPFM0CyNA0XO1JqWrGD/0JCmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr6O/ILV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr6O/ILV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5B9C2BCB0;
	Fri, 15 May 2026 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844490;
	bh=PFdzFQ8z12U6QPw7WHvmKcX4PQwoOiB5fLp7t21R8Oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Zr6O/ILV7VkYwK9nnpIpUHLLpe1mLXoE09pG2UsQp1Fh884GLZ74kqg0cjqUBLTsB
	 cn5DLO52WcgGQViaTFqk9rBS1jAwK+JFhaPA9UwgSKatv1/B6H1kaFIdq3HI089vJf
	 0J8G92wlqkW7i7d0RtlGsYQdeh3SdJpCrt2ICThau18h2mqxVYqx1lu+FhGojr+pMx
	 OrqR6HY8/XXuTad2NaHCc6FQNZpwYAAi+k99N4H1+dgE4AHZJML8R5j3Cy00M/rlMK
	 JxLr9Et3euSBXe8agTehCq/uNcZfIU9mZ/edvFLY3ysqPK7KYrCmhCVFHocacQoF5a
	 ujW+wKsYXdRSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] phy: qcom-qusb2: add QUSB2 support for ipq5210
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-usb2phy-v1-5-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-5-5f8338d466bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:28:09 +0000
Message-Id: <20260515112809.EE5B9C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly describes the patch contents. It =
claims to add an init sequence for 'Super Speed ports', but the patch actua=
lly modifies the QUSB2 PHY driver, which is responsible for USB 2.0 (High S=
peed / Full Speed / Low Speed) ports. Furthermore, the patch does not intro=
duce a new initialization sequence; it simply maps the new `qcom,ipq5210-qu=
sb2-phy` compatible string to the existing `ipq6018_phy_cfg` data.
--

commit a327055af09a1520cf8f88735b110f1df7674e64
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

phy: qcom-qusb2: add QUSB2 support for ipq5210

This commit adds a new compatible string for the IPQ5210 SoC to the QUSB2
PHY driver. It maps the new compatible string to the existing
ipq6018_phy_cfg data structure.

> Add the phy init sequence for the Super Speed ports found
> on ipq5210.

Does this commit message accurately describe the patch contents?

The QUSB2 PHY driver is responsible for USB 2.0 ports, rather than Super
Speed ports. Additionally, the patch maps the compatible string to the
existing ipq6018_phy_cfg data instead of adding a new initialization
sequence.

Could the commit message be updated to reflect that it adds USB 2.0 PHY
support?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-usb2phy-v1=
-0-5f8338d466bf@oss.qualcomm.com?part=3D5
