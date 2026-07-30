Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602A243CEF9;
	Thu, 30 Jul 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421042; cv=none; b=opNGRRxtDWRbQupUS9s53AzhWqqyswKdx9+zM5VtaV/sdzBzWM2VYm5/jtLO0sQWH+D250oat7nq55Kwid6FiOYKdT+C5SoJWyg8K5jNLUx6GUas32cnDxJXPplT0gj4pm4SQjfZzYm7Yt91SuJPG6uMuZlUvOruJE3EkZ7T44E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421042; c=relaxed/simple;
	bh=78TrzJtheNyld2nu3pBPEV0rJY4tPoQUq5Cr7oXSYwc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JatFxHmq/ORDEvDu3LJpSVp/q4/mO3X6Bhg3LTq+UZYJ8WjMvEWsBQda975+j1If3VBil0V9HmSAOmL0BfjgzXlrbfYr3yxPdOQriKxPq79SAaHeP4/H8zpqIYlQwSbAZrBMzK2oyDgNhjNuZ5zJHs2Ryhfw7oHUMlbItDWQ9uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com; spf=pass smtp.mailfrom=dawidwrobel.com; dkim=pass (2048-bit key) header.d=dawidwrobel.com header.i=@dawidwrobel.com header.b=Z78l5wH6; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dawidwrobel.com header.i=@dawidwrobel.com header.b="Z78l5wH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dawidwrobel.com;
	s=protonmail2; t=1785421035; x=1785680235;
	bh=78TrzJtheNyld2nu3pBPEV0rJY4tPoQUq5Cr7oXSYwc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z78l5wH6sO4W5uGl/X0rcf9K3qzo0zFIGYgGDwxYlQMAtoHO15S0A0B+KXBYd78pX
	 Jj48qU/fLs/EV9FRG27ffQ2jhg12IfGzLDq/WEyz5+VY8U/eXjI7KocbgR15iDS8m2
	 9BBPqKJZWSzgR2xF9FJg9QQilgoTPZQfzafzHHRQQJdbt53yoOXmJuRKbGa0wwcJfw
	 3lmgavPsxdwDr1HmbNYYdhugiewxDjKxf2bzxho5J0LQ59PgQ27AtCLuhAxC5VFLlK
	 jOs99M+4SBdO9o3bpZXsHPezxksr6DKH2rgnVbusb17BTh6CvrDFSMOM6Sx4aQ9tgZ
	 8B+HjULBoz4Ig==
Date: Thu, 30 Jul 2026 14:17:11 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Dawid Wrobel <me@dawidwrobel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: correct the board ID
Message-ID: <47381b28-dc1e-4915-a9a7-102f773dbf08@dawidwrobel.com>
In-Reply-To: <xmt3a5242bmkrlwv5hjz5i5x5a7kpqtlyzdr6xzcsg5jw35ljt@sjngnczfzss3>
References: <20260730-elish-board-id-v1-1-92f99e9722ec@dawidwrobel.com> <xmt3a5242bmkrlwv5hjz5i5x5a7kpqtlyzdr6xzcsg5jw35ljt@sjngnczfzss3>
Feedback-ID: 173987960:user:proton
X-Pm-Message-ID: a1ce07ee5eb34a935da6588e2e1b2e71ba453860
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30.07.2026 15:57, Dmitry Baryshkov wrote:

> DTs are in a separate repo, I believe.

Indeed, thank you:
https://github.com/MiCode/kernel_devicetree/blob/elish-r-oss/qcom/elish-sm8=
250-overlay.dts#L14

I'll leave the original cover note as-is, don't think it's v2-worthy.

--=20
With Kind Regards,
Dawid Wrobel

