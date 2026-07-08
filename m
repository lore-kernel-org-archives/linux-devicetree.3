Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C33B71AA;
	Wed,  8 Jul 2026 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522628; cv=none; b=qh1kFBFH5NS3ASJ+F9zj+kzAKK4GVR3NOwcJ7UwqE3Sw378JNfdJJGTyuGGMGzsGZ4QrH1pCugP2o4mTH4HX2IFYJp6sUuwyNCXSKLNDs1XtxP5k4sfdR2R+I5k8omZtX8obPdUfqzohzh9HaOWLdzF14RzS7TJPo3wjsjrp3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522628; c=relaxed/simple;
	bh=Zjykn/Lq9j6Jhi9upx0y2lrYQ/42AtzpTDftxaikiU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7EGpiCyK2RsPjZSwK2wO62SYtAt1J3IKVuNk4qS7Bt/6BNTVjYRuFKnO7NFF5DqGAkIjB4sQ4O+OyEAsJW6U6UFbY4XNSbf5zH24L5fZmI4vxUPy89BkOQWppz/Q6jPVDpmv71I1sJ6JVivQntJxkod/7u9elwaQo+WFyDFazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIxQDJSe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIxQDJSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788D91F00A3F;
	Wed,  8 Jul 2026 14:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522627;
	bh=c/UMnCBtD8ZSHAPGpTjFX+vKl7m9IxkDfCzHzKKegfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MIxQDJSeP1H9qty5PAzT0rBeeWaoBa9je3bsaJcF1N+bUTnCOdrcEf1ROsGG8g1kW
	 jXZ50O4iOmnu4ANp3cPjF70A8SWFUGcq0Hw9TTCAp+G+yPsTdGyMfLNoW9H7wx+6tP
	 NVH1gNG0SOL7tQxnPfS479jWL83zOxH7M2K4AUB8AwaJSgx5tJx3MRDyWhb9wVv6f8
	 Hzf9kc0t6x3a9u5Y6l/jXSMfWvFqATDmZGktXtbkJUAYwiWAVzFk4jNtwNyXVF3QHs
	 cfCyEv2SnsVNiG45WLdMj1tW2Gldldd5xj2UyTN85kXP+trFUaT4v7iMXPJtANdSJr
	 H4H80Nz0syraw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU
Date: Wed,  8 Jul 2026 09:56:08 -0500
Message-ID: <178352261630.2235436.11968411865343873953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
References: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Apr 2026 23:56:05 +0530, Akhil P Oommen wrote:
> Enable GPU for talos-evk-som platform and provide path for zap
> shader.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU
      commit: 650ca2ce6876e1d255a18f07a704ddcbbe50c0e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
