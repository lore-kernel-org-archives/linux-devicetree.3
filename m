Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3940B36D;
	Thu,  2 Jul 2026 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035669; cv=none; b=BWOEDlFNaPFlo00SVZS6OsVfuiLM942befU9GKJ4D0NdDvqSmEAredhFpEC5ixT+zCnleK42KB2J9HflO61pE3aJd0+8o2OcRfvPFGoRYyGXhxFmLOHAfp99NxwPjoy1QGEVhL6M1AnNEgYijISC7x/qTjuB62mhXuwRYbnOtVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035669; c=relaxed/simple;
	bh=O93p7dJkG+TJZHyjAmGra3uVL95lR+0Zrd9Fet5+brI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8H8IXCzwK47RQ0UTai7V8ZGJxqhA0vKfEYXpAgleRHCCvs48H0EmlcPryZIZy0hkYluhIwkvtlhFFBPNRcKdj0G5YA2KktDgDB2/lVgMXqsj5x2v9Dg3rNjSL0wR+xB1IzZQmAdINqFffNC1KuhHPuvjA1MG3+SMY2Qs0TF0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzxR+vRc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzxR+vRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA1D1F00A3A;
	Thu,  2 Jul 2026 23:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035668;
	bh=DD8gYBpUnNvqzw0MpLNyg/okBNMVbs4Lz/SJ1NV3aQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bzxR+vRcUWqwmC6LRTAxYX7pz8rv4665sIrptsGIh2ZgiyF4NzKE2l+Tv8qmbl9EZ
	 jt4e0n8de+JNRMHaCpfb4voDJ3aeJO8fVW4i7EgojalrFJurBB/Hyvb3EYfH1CZBHE
	 zVzD0A7BaocBmdo4XaLaoB1OgDyRg3LTYfhjHm1GYN9pbmZ9SczsZzF3N/WnLl0Z8+
	 TgPPDk3ncUp8MpgAULNfjY6ODv9BjEm3NnFDHCGEexDHpBydX3RmXPuJLrF5JMHWVs
	 ne1mwAShkLn/+ep8PvCrpkbaLYkobeCGNuFprod2YNIsAJ76zVJtT4UCZUeq+QoHas
	 gShggGJAUl+4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Enable secondary USB controller in host mode
Date: Thu,  2 Jul 2026 18:40:43 -0500
Message-ID: <178303563660.359079.10721371545120012417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Apr 2026 16:31:11 +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode.
> 
> Changes in v8:
> Removed unsed nodes.
> 
> Changes in v7:
> Split Driver and DT patch for USB1 controller and USB1 HUB support
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
      commit: 0215d65882b46a22780f6d27d21c94b2550527a0
[2/2] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
      commit: 224d718f2f6b084e9d362f98dcb3ba9feabe28fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
