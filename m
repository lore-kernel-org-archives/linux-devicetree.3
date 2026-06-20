Received: from outbound.pv.icloud.com (pv-2003f-snip4-11.eps.apple.com [57.103.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6682C3757
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977126; cv=none; b=gxq3vBhbYWJZNaIqkVXqNNldeeD+GNc7hVg8K8yI2fxi2NJb+2C9uNeG/ISBx8mfW6GE5XWrvXoP8ICypdKqdLkHsfrlVAJTrdAfjSCnGJZJm6Fb+ztpx8rvwYx0Q6xJTKNigL9rAhbxUia4a24bJjEf/MXYuYvnj21nKZfzCus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977126; c=relaxed/simple;
	bh=ZxPCt/ZTVxIgIwrD2Rm5SERLkd0YwGXMlCCzI8LJ/LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoxsnBecqeKjcR/1HVIEyil734mZ7LItHw54oA6Cp0xPXcJaJZK6wSVI3dIh3c7HByOvA8JkT90ue2sTngbXNiKXFXjfnzDzgmku2RwKpjncuylU8KtdbEE3QrW7a4ci5ammlK6RakriPpV5LGFpFQr18U77ksbomAo75GbajFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=syF1GRKq; arc=none smtp.client-ip=57.103.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="syF1GRKq"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPS id 8648F1800117;
	Sat, 20 Jun 2026 17:38:42 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlUXA1ccVkVcGEMJXQVXHB0dQUVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVDAUsAQwZcBUIBVQJAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977124; x=1784569124; bh=ZxPCt/ZTVxIgIwrD2Rm5SERLkd0YwGXMlCCzI8LJ/LM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=syF1GRKqgxphthgSLelbLVQwFkQoygGxR6qDTcEHC+oR8CYKfFBFLz3qcvPYAq6hNrWYsmpQDLr95GLUieMpWhqDYfmpGXxZHTaLeCk5tudRl2JxSJGKoD3lTBvRCBXE+TrKOJxieG9AX/qVT4ZbNgZ0lAxGDhNpuxGtoh4BHrE1UBoxSxQCMnNNflNJhpi++5iohMwSG0kIt797xiQaisCppHkdBRxYFC3YIKKQp9YuG8YkwxWloVag+rkiZ9wV3RKhRAotDyBvlUTTeLSH+2Milr171+V/XlURGPMP8pkv4VhIldj51XPkKkDE0qX8X0iHxEYNi/mv6vEgRStohw==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPSA id 3E1AA180019E;
	Sat, 20 Jun 2026 17:38:41 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
Date: Sun, 21 Jun 2026 00:38:33 +0700
Message-ID: <20260620173833.17728-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
References: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7k1HEHTzXKcAzsqdpCMgRzW_wfjDJWG6
X-Proofpoint-ORIG-GUID: 7k1HEHTzXKcAzsqdpCMgRzW_wfjDJWG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE3OSBTYWx0ZWRfX3OavNogJFzjo
 Q/1UXYCszNlympM+qgL0hzz2SkOIbp4kwgL9MyNq6JVp13qxrJa/ffLLm9294sjv1f1tvqLTulA
 XTG9O4ubgWhXZsyqPoj+fYp/x/DOVhIc59VMre2pCdBW/wAcKP+AnBM273miYICODVubYJv+QJ8
 DUPhaLE6jeMoaJXfhSzsRq/mGQC/l8pMd54rpvqxJRBCwdMx7ZSTz1chVXBAwgFqKWlubOCajWK
 NX/PsSEP39mTpDfaxHL6pBM6UNlqoX1cyq+Mo+SL1jIVIQienjpjo6Y1VwnxwNQN9Avo2o3aZfm
 xD3aVJ8Z2UNXPlhwAgQ

On Tue, 16 Jun 2026 14:37:13 +0200 Konrad Dybcio wrote:
> > +/* MP0 goes to the USB-A port(USB3) and FPC */
>
> "MP0" refers to the first USB3+USB2 port on the multiport controller.
> Is there a hub inbetween? Should we describe it? Do we know if VBUS on
> the USB-A port is controllable?

Unfortunately, I couldn't find any documentation for this laptop, and
all I can tell is that the USB-A port seems to work and the FPC is
recognized:

Bus 005 Device 002: ID 10a5:9924 FPC FPC L:2407 FW:3334147
