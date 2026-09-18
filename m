Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB83AE1A6;
	Fri, 18 Sep 2026 01:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696202; cv=none; b=bxnHFW4LOT1KiuVOcW+LWcQ2aORsZ/CZGdzEB9fo2AFR5XXUdXeo9RUtOPQkM6b2EKBzbeR/DeANoHVSuUvLnhv1O6I6x3NtHB+nWb9OUoUpoNJOa7BojzJOQRoMs47k2JkF6CyZh1IZkq/ed4yP2YDTWtQUwUOw5i47Cil+T7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696202; c=relaxed/simple;
	bh=FIhPhvmkP1h771HTdmzupYjS91l0lkKGi1Wr5rhUMYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZkqte3qONgUwfKw+pJZMAH3j+GKrFR86zgN0gR/OXhba/pKBk9Dz414u/kCqRZVc1mr5bRvXlxj63ACoD6vqdsKkGN0GfAnoCRevM5G82GqGWG4m53xifzDo6ijEhHA4Y2tj6MxqASbvpLUHsgJo/XfUR3MORB5Go0AiT/kJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gwq82Q8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwq82Q8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D7C1F00893;
	Fri, 18 Sep 2026 01:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696196;
	bh=39lDcaIwTYhw514iuZ3xurK8sIwFK4DA4oBsd3GNhQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gwq82Q8Szhm2g72FsiXQigTCV7VSr+DFJRiirlaeReIftweDEWUA7orU6MllSdREe
	 EKVrL0qLOaeQPmfTp99P9CZ/WokyNTOUefTBOO8odRXbtEnzZY4se/PxQKShxkkjRL
	 o5ejA+UlWwWJVudR8Vk1tlVmPnuwhAjNk/aJc3XNd+dBteRE67Fi4uu64G9ohcdKH9
	 p9icW+8N+vjOvkJL4NeR86PBqZrhB2bxNUtUbidB9aZfvaxeIHWICr6FtDGdoX5iKH
	 4tRzC0P+BpWkGm2KagmQbBX78xQnEuiS597jLG0VgDvkFTniwVsvjUfUS6L4RyV49P
	 ujcxOEBsdSqKg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jan Paszkowski <jan.m.paszkowski@gmail.com>
Cc: marijn.suijten@somainline.org
Subject: Re: (subset) [PATCH 0/1] arm64: dts: qcom: sm8350-sagami: UFS
Date: Thu, 17 Sep 2026 20:49:45 -0500
Message-ID: <178969618822.1582337.520114827780306086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Sep 2026 19:13:11 +0200, Jan Paszkowski wrote:
> This patch is about turning on the UFS for the sony xperia sagami
> platform.
> 
> The patch is small, but due to the grave risk of the patch combined with
> my inexperience I wanted to write this cover letter.
> 
> While digging through the reasons for the UFS bug in sony devices, I
> stumbled upon a downstream workaround in the initial commit for
> sm8250-sony-xperia devices [1]. The workaround did not mention the
> sagami platform. Looking through android patches for UFS for the sony
> sagami copyleft kernel, they seemed to be minor compared to previous
> generations[2].
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS
      commit: 8271e751016e30751a753916167d02b3fc27e8b2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
