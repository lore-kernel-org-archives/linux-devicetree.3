Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FAE30C142;
	Thu, 16 Jul 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196879; cv=none; b=Cqp09Pz1ORglyWFRSGU4gphFW1OWmlozIoI73Q01r2UY6qEV6yF4df9hiWFJ7/poqj3KIea7wedCXoDv888IuM5bAzjpWG+zQJj9lxWoNWcGqB8CtckAzsMxsTdN+lw1LKwzUjqLsBAZeNV2zfmzBq+wgdQtjM93GWCI6b5hKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196879; c=relaxed/simple;
	bh=RPoVxE8f/qrpyR2PThyfhrgNIb/kUVLtq19UuP3q+60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F830rn+LNnxqUZlaazkiG5W3tGu8urSrV4ZxdCeYUW525cidlWEbokWrpm4eUeqnUAEMhzVYe6Mv/M+zZPGXSLFA2mIhej+l1knKFJegRzPQywWbSVhElgHMSIpcuJpzgRpmHJ9mOxWWK+WBZVlXYMwKvUwn8S7l8vivqLzACSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n00TWHLU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n00TWHLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220E51F000E9;
	Thu, 16 Jul 2026 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784196877;
	bh=Dn2wH53UzMSx+cHu5Pm40o2vAj6JT0IjU/hpIQ0m9RU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n00TWHLUrdSo2O4bDTIwy0/KwLhdDpzvAJL3ybEt2hn0+D6bZsp6ZMqb8po3ruvG5
	 2JX72kPWyjDPxpzLraNQ1tGCD5OYlZbSjyVVzu0NzwRqOs0YYgBxFr9mih1WZCyT8b
	 sgVmmy4+0W6txWkw4SDvhdc+eKtxmH3Zeq31SaSTpq3e1CJCVuH0ATJPrbDQqg6Km6
	 eaSePWHMHKYkKLmxTEW7ImTwYslPYou+/H6ZvtKQiiXbuKNT2yGS/FyUbpbQ8qQayG
	 +MEVflwxfYtPViSiwiZVhELpU3HlLDbZznnH3E8Quvm/75dWQaeAEcGilYE8g8BE3z
	 KJE3VRCjcPrcQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible
 for Shikra
Message-Id: <178419687581.1249703.9802819507267414858.b4-ty@b4>
Date: Thu, 16 Jul 2026 11:14:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 01 May 2026 23:31:17 +0530, Komal Bajaj wrote:
> Document the qcom,shikra-tcsr compatible.

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
      commit: 64f5cd3fd0b21a2ac44d671577d1402fdeb14841

--
Lee Jones [李琼斯]

