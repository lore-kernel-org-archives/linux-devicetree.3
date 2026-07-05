Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3493B9D98;
	Sun,  5 Jul 2026 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285114; cv=none; b=SPTdSA1dsj00yNEPDT0UB5x++vLTMcDzyNSVj6QF7GwmtDdK87xd4U+JUhxrh/cwtn2W9pvZn4TpjSZB9H1Sybw30Sfyal4LAb5JTKSX+Euy646GjvAxnC/0aNA6/paF97iU6yw0trZ613Tp57s+kvNzd9bnphjHpDUavXIJiX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285114; c=relaxed/simple;
	bh=aM8ZxywwvfruV4ryRtRLQIgKsDkpqHVak/UvMNubB0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/hEOGREC1o7DMLCwpMma54277HMA1a62fyRuM0MgozuebpNDHXrja8fVObvJhFiy+o/Hoomsye3FBRKUg0Bo7KZ61GxcKFr3WWH245Oz6eaQrL/jhdXHNDjh2jmIajoevUSuVb/7XYvKhMoV/9UVbMrnfUval3uUwqNRPnYQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxtOuucq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxtOuucq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6C11F00ACA;
	Sun,  5 Jul 2026 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285113;
	bh=w+2OqMxstGJNcYgfW4oAkhrXcXYrGOCxcTLCEuwprR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FxtOuucqtmybDVla9sB9DFqWYRJZOAIKvUBn7YjEqgpYPXillQW647woLckQ9Qd7u
	 Qz26DwhUYmV+ZMJEybCgAMrxiVei6lGCB0loB7CqTsHtmGdKO2/hSniiV3xgi3zpED
	 M3iCq5tpBdhm/6u2/4MqjljjAJGr0OAKZUQAx1wuauVON3iKGzPgzhHZOYCPS3aojp
	 +fTxxx+K9vfs6HkLpy+ExBQCp/n3R1nOoG3Wg6zeCfYU+yiUutgml40RgJdYuzZwXW
	 CVDtPvx8XHRbDcJ8pFaBLos0zRpSZQ+FemD5V4E1/ICfS1vrsgnZU7CEXwC5QZ+xfr
	 gt9Y4zcJJQLxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
Date: Sun,  5 Jul 2026 15:58:06 -0500
Message-ID: <178328508289.1157743.16998094017049759939.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 May 2026 10:00:26 +0000, Srinivas Kandagatla wrote:
> Add support for Display port Audio on Arduino VENTUNO-Q board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add Display Port audio on Arduino Monza
      commit: f9665fc0681c1a0edc03be9900ba3f318fe3c5bd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
