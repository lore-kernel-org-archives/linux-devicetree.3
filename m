Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169405;
	b=tSXLlGSVQ4jAZ4DiP1OEjS7RDaw3vep45SyTdK77VvEshaRbDPDglo2tnpArJ9QgtWan
	 TpJUclwVjY2G9mGqb9uW7L7Ka8dm6COiGRq3o2M5OERXa0t4AGR36DZOG8bonEmPmBJh+
	 F+K/HBvy7hAOMNS/36I4rrQW3D2wQOf9fQT8tK41cv70b4NbPyHFUO+cmqvXywLWWTOV/
	 C7riqTxFnW4+YNdzrqDqkgmdXLp26JBtGWHSrqrUYlq1rERqX8EMHQgVQpCS08qH48Uz0
	 MwfXY0GN8D3n7e9Agy/Ia/zElCZKJXFQVh7Cj46BlsSOLb0gHadGRycFFdoOfACrm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169405;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kU06O4DKa9Y8SwOkpvFM1DLhsryWtBjVd1EgIkUN+GY=;
	b=aAGsCUcDB537zsA2JZn3kG/repRMuDrwLGohOZnYEtTt4zi4pQ0GU+5EmgSKwN9x+Wf3
	 Ga3XXuB+I+htVvqE0TUi9qn+Qwv1v1r/ff0W+CI5uAad8fo9B8Not5eVZcjjUQaELx2BH
	 hPFoH44nkPgYGCs3+Xb4DRj2Uj5dqhcVWgH+er+t6Q7Xuwfg4haanOi0cn1+rHeHDW5po
	 cOC6V+eNwS0LyCOQSjkjHTnUqlaNFpL0MYXqg+/f2SFxxJULHNMgUyj0Qq1f+opTT9zBA
	 1VC85JNLyJ4GZoRK1HEZH5EHFc7j6/nzGgEh6OiDkGZi0fLW9/uPqnr8D8JicCeWvSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHceo0TB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78066070CDB;
	Sun,  8 Nov 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHceo0TB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E9B1F0089F;
	Sun,  8 Nov 2026 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169404;
	bh=kU06O4DKa9Y8SwOkpvFM1DLhsryWtBjVd1EgIkUN+GY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FHceo0TBWk2NueP+54BXVbc31M0sKpdDxeMZEF4Pa4pz7bWK16m2rchm5Z3jzbRHb
	 MeTdYKYWEVRcWfm0myNZUu5yJNnafo+FgTY59KaWYXWSJtU/OGVGM67acCqVqBjeqN
	 2L8D1Ft3h+povNOZ86TUrR7qOWTvHREQxP4evMlfbHn3oLbchGefCOESxpStRJwUYf
	 kyfMMYIWk0KrTA+tB3bNAjlPkJ9fwddaFsypDJ4DQbplpIrsTtLHN6bOi2PeNAPx2i
	 7ZYdvblVE8v7ILHEqTUGhZ+nTzD+ySI6y/dZtM4R1HffI3lyijpT8cds6b3RHcCuwc
	 gsI9vEemmDeGw==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org
Subject: Re: (subset) [PATCH v6 0/3] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Sun,  8 Nov 2026 14:20:10 -0600
Message-ID: <179416929522.628393.2913043282200216817.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030064149.14736-1-kaipeng94@gmail.com>
References: <20261030064149.14736-1-kaipeng94@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 30 Oct 2026 14:41:46 +0800, Kaipeng Zeng wrote:
> The work started with x1-crd.dtsi as initial template.
> HDMI refers to ThinkPad T14s.
> Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
> PWM brightness control refers to Ratizux's GitHub repository [2].
> 
> Tested on linux-next (next-20261027: 151a134a) / Ubuntu 26.04 LTS.
> 
> [...]

Applied, thanks!

[3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI
      commit: dd851d601d63bd157562e7fc054eafdcc2ffd936

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
