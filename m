Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.68.154.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739031;
	b=FfoXIv1a8yFyBI3nxZClp581AtLdoywqQDDLGl4XrQeAE601NmNnenpaRTL72ysgOOBk
	 i3IACF4JnpmwK84YcDjxoWx+byBXS0cImVYaq7t4efbDJtfepTuA61TIIzSVTM/wIOr11
	 iPFpZzQQ8N8Y2j1LLsmby/5Up5ZKXvmKkNIgUFfWRqBKfX/qVg/6e1WSYr8VEuRkpVsfq
	 iusGwQn7TiCY/Tu50d5pvewbA0nF3nzZEqTz1QJzDybBw4fIu7gG6jtY1/dspkqYoSTlO
	 8zDSI9OGAcE7EfVkvmu9vspCI0nNtQLs4LyG2+3uDGJe2b/Jeg2gSsvuR3cR81nmwYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739031;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=y/6ETTKQWSdIBrWUEiwvoMMufChdxlb4i9BGax6LuFU=;
	b=VhCLiK9nvGvY8zFca0aHqHJGe9MbYE8ZJbYJCgXzw0FCd6g9WpQ0gA8h6NZxQu5T1cnX
	 BElMJEfGKcju4QR45WuVS0ZqTRe2vQQDrui+Ta4TbDDfVrB6Q93SoxXzrLYf1MYNStLhp
	 lPJdQH0e7gkIzHdMcWWDKbjtF065zHyf5ehIbS5a0YBTH5KyP+S/kjz7YXENi35538gWs
	 +aWl120UI3XaGBttDu6vprjBzisl/UIQkGnuHt0GRDeK6k/4/PMpjvCiDKYH5wl/oYVtz
	 8g39DUfaXX9bNvECqLBnCNaMAjbxQ+vM81Avp9xa9vSroZAmAI7oxSScYaTVnVj+rSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fromdisposition.org;
	spf=pass smtp.mailfrom=fromdisposition.org;
	dkim=pass header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=GJ6xOBiY;
	arc=none smtp.remote-ip=51.68.154.128
Received: from 4do.net (4do.net [51.68.154.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FFD606A31C;
	Fri, 27 Nov 2026 00:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=GJ6xOBiY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fromdisposition.org;
	s=mail; t=1795739021;
	bh=y/6ETTKQWSdIBrWUEiwvoMMufChdxlb4i9BGax6LuFU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GJ6xOBiYoBrEWnjMrWSkiXDKvAaWHx2DvTRrl5E/mL0yfgq9Jv2ArGR4bMk+cP0jB
	 2Va1SfUz69eKBK7UkB9IXw8zLipNSNxWeik4ouLvIO3O0hwYXOWLLzX01k43yh8qJP
	 QPXrAVsWv5KRbgPMKxo+cYrtikxoqQ2gdk8EXt0NM1z0ONU5vI8zeuDg0i+NorpzKj
	 tvftMw/iu/nzGwK+y46W4J7KYWaTJMG5M3iptLCFS8Bcto8xi26E692vZcBhTm1apt
	 BcVzAkcFHRCUsVOqQle9DYDEkLgKfQcJI6eZ6cnoBStqJzWiV+vg6iPtAf0SxXaAjN
	 /gotfd+jzbFsw==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 00:23:41 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/msm/adreno: Add speedbins for A660 GPU
In-Reply-To: <56ac1346-3164-4418-a00a-168323787535@oss.qualcomm.com>
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
 <56ac1346-3164-4418-a00a-168323787535@oss.qualcomm.com>
Message-ID: <9bb065d6e969a550eec543cc888d1bfb@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-26 14:29, Konrad Dybcio wrote:
> I only see at most 2 bins, what's your source?

The downstream devicetree. The one on my device (from
lahaina-v2-gpu.dtsi) has two as well, 900 and 840 MHz, and my unit
reads fuse 1.

The 738 MHz one I took from a newer copy of the same file, where there
is a third table for speed-bin 4, for example in what OnePlus publishes
for the OnePlus 9 on Android 14:

https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8350/blob/oneplus/sm8350_u_14.0.0_oneplus9/vendor/qcom/proprietary/devicetree/qcom/lahaina-v2-gpu.dtsi#L903
