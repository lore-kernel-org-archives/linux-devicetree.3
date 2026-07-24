Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1443E7166;
	Fri, 24 Jul 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883567; cv=none; b=nAVnval7RTdNgqvbp3P0U3JThjbTJPQXT35k61DARhL7ISQkijq+8+uY9y4PQx5JY1EzQpR2NZhgnvH9QapoCs2Hoo5vp07WuJM2s4O2wywafpQFPMVTECfoN+9ETlcYgvaYbfnNrdgYqYSuneyOaek2hY3wT92RiTJJRU0Bf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883567; c=relaxed/simple;
	bh=u8/L3Nb1ZqKv6IJ7Q3yqPQJBolCXf/suKtGk2Otllp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iarv74ntuF9gQaeCQc4UjLz3iW2XytRRGz/Y8j+aCokkrfdh+fgebuOvmM1PA50xQZgGUxW11y9GEIl20NUoZ6cJajxtqjyB+6OC8gqj8WXAr/yv2w++AACAFNee2XYOKErAnP1Yw6QG6yS16c93Lkkhg74zMAsBK6gKKj902Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBFNw8Uj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBFNw8Uj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F181F000E9;
	Fri, 24 Jul 2026 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883566;
	bh=TzCoFLDYKfBuglSaXI1zoyf1U3HVpuaWEr07IUAs0KY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LBFNw8UjO//W4K6jJNzxAcGStiMl+APiNWF30d8yQ9CDL/pJYgAQpYelAh6iB58KS
	 yTYB/LXOiOcDcogJfs4QZUVmRWFBCPi1ylI/9sFrZEw/0yiWeAUlncTPr9RCNfnK18
	 /pJGvRQLJyMwC4eHXyxgz9nXWyCM6EuY4pbgqNkKwT9qKyJeFENSnbov50Z64KGbzs
	 9qg6eRZwapTYS3fiVGkT/00gwY6wAcOJdjm9dq8DIj31PGGlh+mP9xemmNxcXcJuP/
	 XwqPa+e10BZcbEtAAxQmKgzul7PVDKiTHCqu+HKpAeo8O3B5CIc6mHEIX9iZDA+jY9
	 mrXm06TllyKag==
From: Srinivas Kandagatla <srini@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260724085650.224899-1-shengchao.guo@oss.qualcomm.com>
References: <20260724085650.224899-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Document Nord
 FastRPC
Message-Id: <178488356375.437795.2129751296429802854.b4-ty@kernel.org>
Date: Fri, 24 Jul 2026 09:59:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 24 Jul 2026 16:56:50 +0800, Shawn Guo wrote:
> Add compatible for Qualcomm Nord FastRPC which is compatible with
> Kaanapali FastRPC.
> 
> As there are 4 CDSPs on Nord, add label for cdsp2 and cdsp3 as well.
> 
> 

Applied, thanks!

[1/1] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
      commit: f52f4a167e0e24ed6769f6df9b8b00280d9adf85

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

