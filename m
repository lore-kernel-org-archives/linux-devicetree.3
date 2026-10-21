Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575850;
	b=ZkQxYz1LNkqh4CQpFc4x3cA46c+TK5ZCrN9hQAuBEx0Gj8cEYvelXgt7B6+ViPIh2Tt+
	 uwHjylWvHABVjNrVuAhxQ1fFnDWQc17/Kdb3mK4U3cF1oTPH2bjfJdf4LbTcymI1WBjuk
	 0eRQt8qIlRFGluVb8SVWGg7ETL3tOBLc2rT9kNMukcJ27XcR324TMGQnM0sjGsUoab+QL
	 V+Wghp9N10x9orbcZXKbLbsgQ3eb11OV1okupWeZlXwaY3OlAbn3gVaeXi0iinfGe0bJ9
	 3M3bWvyZR9nShHw9nMkpq1ApeyFlpXBybAIOuM9zgfqPQfd+2ga0dGlbScw/DodC2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575850;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=5GqSQ0QCihZuBCVkqsf4LxXGXNiQ71AyM2cHDQFk7c8=;
	b=ToLs0ODkXVGmPv6z61BtxEB2NXLyg/F6uCWTiIdi5H1DjIQAgD+J+cg1+3fEXQf8L2w5
	 QBg4LgzeTpnQff6IxWhc7P9Ptm5YEtyomOXPUtFG2gg2EkPwrovIxRf5WYZbztATog6DM
	 iVKFglbyxNpRV6iSePyJEH/74nf0rYTnRGomS2GAAyA68t/uLd87sPyObwaFNEdJniG+1
	 /634s0VGxdhAXFC9QeIw45F4NB1M15Bjrt3/HhZ0IXw4Z6QNnZfBvWrYrIFYfW2cZxu2M
	 CCuu7mnvZGe2rGBQujvjsbxKIIkvwjJfq+Uxm1IvSnp9HaIf+LyNPsiLKbv3y9XUhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L8DXu5/2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8B4606A322
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8DXu5/2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2651F000D3
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575849;
	bh=5GqSQ0QCihZuBCVkqsf4LxXGXNiQ71AyM2cHDQFk7c8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=L8DXu5/2tjvqRFM1X2jp3UbAQmXndkgTfUcy5OrYVbK+ioE4XQSg1NT0g/WfBbM7+
	 q32o0AOy+PF+l1sJGfIMj35gyQ3DzBKXiPisbLIwwGkhbQzMFiAsx5XTWyMB5tj63g
	 TjVvt11qe6jUKUBBDZug33DtXj/Nd88D0Yne2cYYHFbkFTewcfrQvfNNjRHN2uJky4
	 2SN4o9dnqQFJMJqWJDUoRTw1ZyRTPSW7jX3546Pg2JWgq+4vVASmRO+FLy4JypE7dU
	 b19tQSXY5EKQwiMFZN6ObemrHA3hHVPdpr8QoWrnF4EUvmEPV1Lu2QYaiRIPIOtPpB
	 CJPIBaT9uE76A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso327734e87.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZvprRqiV/5WCx9OviKjO78+1r8ChXWNzO9uSiO4H2ByhxHuiQgm7vzM0E9BsG8Uc5DcxmjolCdiZm@vger.kernel.org
X-Gm-Message-State: AFq9FYKhcTGLlI+9/60yrfwFP8K/qQ2vadmxTCD0LQi9JGhAa+GRYkVU
	34JhwXIN0S511PCvJwcJAJrEacoGUXcy2UQfJQhdK5KBypIBshOfSIQP1y4OiFhREqKVPoztQBC
	ez4XtlIIsLPa+kktl21bq6lOEd2de5m+2JRxABTIXhg==
X-Received: by 2002:a05:6512:33c8:b0:5b6:1a7c:59dc with SMTP id
 2adb3069b0e04-5bfa1d08db4mr634089e87.54.1792575848401; Wed, 21 Oct 2026
 02:44:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:05 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:44:05 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com> <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 05:44:05 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me0T-5hNbT8ksqrjQpQ=21GAb_26Vqup87etSO=QtCovQ@mail.gmail.com>
X-Gm-Features: AclHuK_9YGg_X7146bJJdqhZHqrsMwLmX75q5uNTn98-K7ckzWhfGKrFDJ1LtLQ
Message-ID: <CAMRc=Me0T-5hNbT8ksqrjQpQ=21GAb_26Vqup87etSO=QtCovQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 09:36:30 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
