Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448153AB269;
	Sun,  5 Jul 2026 20:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285113; cv=none; b=Zc4AFJdBHKbOr2mubRFHsE5A1b4gpwKKikZkKuPt9vKqWPufUGP0bkMWMN2VBpVDZBsqwQr7W4NwH0ytXeWjsDXQE5ACMM25mV68WLj4xHw5wJGAnnv4z3BWkOIgxr1TJT6q+zDLQGLiEOOdaqGo6wLgT5gZXettIxqFnq6tB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285113; c=relaxed/simple;
	bh=qP6wziVvpbdHRcZjotF1igKo6jQ0hsRd0yQvLyp3sV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tshzj9Cm4o6dAhcxu7tRnNyjVK5Jn9DAcJx3jjETuz0k/6AYqdQTseOtBdujVkYEq07KyDcRPnsAzv/GDpvVDWI6tSt4GzG9KnCaAMpDY0S39/Gj9iiga5fYpx4nn2hhSyLyb1Gt5i6YNQ5hlWZxrW0mdeNH+WLqKu3WO22rS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfsJZd1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfsJZd1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E421F000E9;
	Sun,  5 Jul 2026 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285112;
	bh=4AywYFaNgDxk0qAufDWo9nA8jaQvZWN5eePZDotwA3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nfsJZd1HgjPXv2G9TicEFFT4lTx+Fp2YQpqqiXShWJBHR92Hs6faRFitMgAzdBY/Q
	 naE4Rd1mQN2sSwuiqHaqhL3fRuvbw1ejmLw8K5T+q5a1qZbc2/tFV9QTABqU0+ZAs+
	 vSj5qaE0yqjTGVI1EQC57rkEPijPTbJh+IuSBErbfuKfnSh32XsiXtvp+PVvMQt0+j
	 AonqwDeNKV+9jWpnN1Ld/q1E8VBVj2yBcjCJDEZTOWe6Pgqn7RjmME9tZlctioiIVw
	 wwrB/21e0gUFhFK67GDy1nwckt7y7A2eQJE5VQvUzQuwdL/MT/bLQSZ0UvICOjd/Qw
	 /wjTYwoSw699g==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Remove sa8775p-ride board
Date: Sun,  5 Jul 2026 15:58:05 -0500
Message-ID: <178328508283.1157743.3701813097867937226.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
References: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 May 2026 22:14:57 +0800, Shawn Guo wrote:
> The sa8775p-ride board development mostly happened back to year 2023,
> and it hadn't got any major update since then, except Wasim's refactor[1]
> last year which had no functional change for the board.
> 
> Propose to stop maintaining the board for reasons below.
> 
> - The Lemans development had moved to QCS9100/9075 EVK and Ride board
>   for a long time.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Remove sa8775p-ride board
      commit: 921f145639e4626ae232b1ef0e935081e6d44043

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
