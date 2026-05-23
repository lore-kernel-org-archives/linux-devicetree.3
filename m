Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6BB33A6F2;
	Sat, 23 May 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502817; cv=none; b=gvP6NThAii8pYRAeVfmODTwQEZpwwJjxYVQQnLTkZUzytYg+Kv0X3GJiuahjslkYg5N4j9+ieUZBi1vMUG2nhoLKeH1LonAo8xs39idXjHuH8DMDGb06cxhepuFIcvQzuJzuul80rEQO617spjQHEUYdefUBhwPkiaEqsDjTXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502817; c=relaxed/simple;
	bh=Ip8EOHnQlONx0640s7zd8vgzjGrFyWI468A5yp0ydEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCtMWYeHKqxDeSAVg3jyAmOCW/KYLxoyct6cQ53+MT2mYrxna4AGgdd8hb/X7ffIIJcCDYX80Fu6csDk5YfYMTH5VwPVU1AW7PIObwLKcjc3BhgGdgKvBMj13d+jJLTKtAhGJvQVTFaemXhz3Qw+bF3uOePqaHCoL7Oko2TvVcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q47L+A5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q47L+A5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204181F000E9;
	Sat, 23 May 2026 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502815;
	bh=qMvIxWJ3hZ/UTZCpmZB78sjqlWXf9zFQ8ZwmbvI9Eyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q47L+A5oNIvxsxPqluRriqGjCDtgR/J77Lef8XnvIjNMk2kx2WBovOoSmDYBy5NBb
	 brY0cJ5T/T9ENjuAb+Vmkud6suqPxoCg7gnbVctIKTcClTt3fYBjRgMTH2bTwfF7Ls
	 Kr55e2GHRZzgg/lc34Os0Eejoj1jXpuPf/emYqhSFYn7XNtyB2MKjvHgzo6Vkb+QTU
	 BVhJyTfbKnemvuumVvU23sLy6Qfy8oAQ3uOY0QbkciErX+qdSrVY8bG5glrKedTi7i
	 vfQNWrIdc/LYqu3RDxF+KXFhsk9LJrDiOZDKkL9gpH/Fnomq4QVln9vQi5iF2xxnVN
	 w7tlGEYAd9UiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com,
	viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C GPIO expander
Date: Fri, 22 May 2026 21:19:45 -0500
Message-ID: <177950280349.1097700.15643778177393650991.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
References: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 May 2026 12:19:54 +0530, Anup Kulkarni wrote:
> The LeMans EVK board routes the RX lines of CAN controllers 2, 4, and 6
> (part of the RTSS subsystem) through a signal multiplexer controlled by
> GPIO 4 of the I2C GPIO expander at address 0x3b. The remaining CAN
> controllers, out of 8 total on RTSS, are wired directly to their
> transceivers.
> 
> The multiplexer select pin defaults low on reset, disconnecting CAN 2,
> 4, and 6 RX lines from their respective transceivers, which results in
> no data being received on these interfaces.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C GPIO expander
      commit: 89e77275b55eac3d3b8027c9806eb32b24b05023

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
