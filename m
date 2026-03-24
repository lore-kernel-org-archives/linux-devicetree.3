Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928243A3E6D;
	Tue, 24 Mar 2026 03:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323744; cv=none; b=TSRi7ids5ibGoNgqtpydTky3dwAItOF1c9tHT4PQdCLY7HNST31a/1sRJPI+cmS40wlJyCBAuDRKortYXMvlptIbf1KclTZWRL/cGhfIgb4eVzRwBm/5M5lZxzAweTn/8Lw6UN0VqN5Dq4465mnNAOEKxmncqVdwMJz9A2I6/pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323744; c=relaxed/simple;
	bh=ZySmnkDV4y/ZrQbXnlzl7oplsvhUC2hr7KbiE03y7Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uESi2uKKoJYeP90r2aRcnQKplrMKASPoG+DjZp4NXfgBA5Pyf0+9l5shWxA0M25ar5bwTrfbr/BbX4M/d6VhUxH5gwLpWLGwoST3oKq1sWIinaod1/NESnNDOJ51GltifUjXESidJEvpABcKtFZe7A7a38F5/1Lwg0UWPD2KqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Osv8kRwy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Osv8kRwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CCFC2BCB1;
	Tue, 24 Mar 2026 03:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323744;
	bh=ZySmnkDV4y/ZrQbXnlzl7oplsvhUC2hr7KbiE03y7Wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Osv8kRwyAMeFtc5/JcY7riu28zTLKAwoQ//cbuMAxrd4X9zSc5T3+l6bYFf8tSOhb
	 i/foLRUBicGVMUqSAyI75DVnLQYZmtMC7WhAkYSyTdss1bkSerzSjLiwNucnzY2lSJ
	 FXLDrkczve6ZnQrhQeEquPmzPQeEQHZw77VtNJHZRdcy3UqoHeeo0svGpcW2moG8R4
	 tRUur4Woo83w6RSEJY+0I89OuhxveHW68SNim8vAVIn96O4jry4ohvVWC2IMAC7ALR
	 XSkyczNx9APBNQGm7pHdmBIg6dVYT7bYBiSYntafUG4+sAtK5yrFGqTOu9NSLkzK65
	 +j0/f6j/IEHZA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mohd.anwar@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com,
	monish.chunara@oss.qualcomm.com
Subject: Re: (subset) [PATCH v4 0/1] Introduce Lemans EVK IFP Mezzanine
Date: Mon, 23 Mar 2026 22:42:09 -0500
Message-ID: <177432372689.35532.10098183927784583575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304165925.1535938-1-umang.chheda@oss.qualcomm.com>
References: <20260304165925.1535938-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Mar 2026 22:29:24 +0530, Umang Chheda wrote:
> Introduce device tree support for the Interface Plus [IFP] Mezzanine
> peripheral expansion card used with the Qualcomm Lemans Evaluation Kit
> (EVK).
> 
> The Lemans IFP Mezzanine is an additional add-on card which can be
> stacked on top of Lemans-evk board to extend peripheral capabilities of
> lemans-evk used for industrial applications.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Add IFP Mezzanine
      commit: 8c72e04ba40477bce51f03d730838baa2ad28d9c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
