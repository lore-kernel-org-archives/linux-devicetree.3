Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77833F8B7;
	Thu,  7 May 2026 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186111; cv=none; b=j7P3HOcmbI1xKArorV/m17DtD2hehDfBx3SuaoXEdwV+6EFCdmcLvSQTwLJA0ojI0hSnJuDMEsn0onSdAUJZCE+1jm9IrtpuiwP3yAJxcNZbBT8liSoljd2GHswcGXJd4xqFdNMJnEWZ1wl5XCfz1eRKb0BRheSmtx5CYAha0Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186111; c=relaxed/simple;
	bh=O7SjoYbuE+fUaAVS0x3DNy8FdfsP7AM82UpuimFtss4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/FpOx5GlhwzX+Ik0gQboRWLQ8nnmtnxLyxZjIWFDqd6aUjEmX2ZZBmfuHQaOAjNle2V/T2sN2J8UZFFSQfhlPcGNZvpfSf0MOgHgzF8JDK1OOg7Uod+yc5YZGX0YTizOL/34hOK78y+nU7COmL+QPV3IB37T3ZDoQ3TU93enPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGC4JFyC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGC4JFyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B774C2BCB2;
	Thu,  7 May 2026 20:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186111;
	bh=O7SjoYbuE+fUaAVS0x3DNy8FdfsP7AM82UpuimFtss4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGC4JFyC5je/XAzG/ze8DMwCeIPdcveweRg4CsPtN3rtsJUBTNY3GRQBuntG0/0/N
	 yDqzVvc+xl1XE/ppSluuooPrTHQKyiRD1644de2xIyba69RRd0wZUZzAbHFCbIp9wR
	 Osq0IcUtjRDhMcSoxwlGu9RLPIt2+vHOGKLyGc14dC2rTyIr/MKyX/iUF2uuRkhUpD
	 PLlmW+RlBUyCjcHMw+hqPxk+slesJ3azoUJFoQz9UshVKK7rthzOkNQxtOaDie5l+Q
	 a+FRmQO9UhvY1UKDkCwhK0UMqLLQjEDcDOsySMcxuU9pySlhqHRD+4Bj1gR5ABvaZM
	 CQp9cy/h1B0rA==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@oss.qualcomm.com,
	marijn.suijten@somainline.org,
	swboyd@chromium.org,
	mripard@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	sean@poorly.run,
	airlied@gmail.com,
	simona@ffwll.ch,
	alex.vinarskis@gmail.com,
	Abel Vesa <abelvesa@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	quic_rajeevny@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_riteshk@quicinc.com,
	quic_amitsi@quicinc.com
Subject: Re: (subset) [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu,  7 May 2026 15:34:28 -0500
Message-ID: <177818605989.73000.17904412003794862832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Nov 2025 16:26:19 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 

Applied, thanks!

[2/3] arm64: dts: qcom: lemans: add mdss1 display device nodes
      commit: 3e6cd0c43cdf678622c19210bd1a70b04c8a79af
[3/3] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
      commit: fcc1a19f5bd5623c448e54b2ea6d50249abea77a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
