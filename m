Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987BF3E5A26;
	Thu,  6 Aug 2026 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025902; cv=none; b=jhJ0g59iz7qI3YcNHpcluW9ZABvolUpgyaN+bu7J1N6AOFQVUH1NGBXr9gMSFoYU2PsBE9jcKomGVxIAJeUSVdULYEBq/Ipj2LOi7l0+nq4s1AQX3eVn2sCczxBi7KApSo0E3yQR+mo9ITWBU5Z3L6o5aTjHqg/p2DRrjdY3uqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025902; c=relaxed/simple;
	bh=UukR0uxqI1nzSHqAqRpb3MDQCAA0+e6VsFclX8mGtAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=If8yhbiYoZYkRuYlf2CwgMY3XMvsZeyXOae8lKb7TDsptt9obfQkE86PRbCZs0bt50561fQN4VUxMF9eFrVR7d6+nJ7cvMy8EqFvBbl9A0Bni1wYIHNCUOjCTL/CDSQqzlChQOxbCx5nL7aGZ4HKg9lAJWhAQiwfvPJR3LKTnxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzESQbaO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzESQbaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B55F1F000E9;
	Thu,  6 Aug 2026 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786025901;
	bh=27/UB30jx7EaCdZitYWrvFaOHMgxJ+HCSh69lI9d7l0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jzESQbaOMbEq2LKozduxiTf+C1JkpSNwwGp6VuDv+kNNK3Fp3HCXtBSPib3brZVDV
	 MeSzhbB+tc7yssuHmIhQWZkasqZ1Qb0iHxocY90OIwdyE9ErkL8ClvBBcxtgUNxetS
	 wi3X+UFZw0ZpsUXUgi6A0fSG4vhkO/J8H7GFJcbwZyKSov71rq4vDOpMJa3VMP6y1O
	 uA8fmDlj5DUM5UhKFXIBkTMsMopiKEya4/ecoNofWaS7yC43rPCZjzuXJBRvIRJ6Vx
	 WXqG3bvlSk3tF6fyzU7NE+9x+RfZjZUYOo5+TSKvuJssBihu3DHKkd4MTXa3xH1Aw0
	 nQMakvJ4t+VrA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260727-ipq9650_tcsr_binding-v1-1-931ac0e056d0@oss.qualcomm.com>
References: <20260727-ipq9650_tcsr_binding-v1-1-931ac0e056d0@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND] dt-bindings: mfd: qcom,tcsr: Document
 the IPQ9650 TCSR block
Message-Id: <178602589930.2948985.10481546853214153145.b4-ty@b4>
Date: Thu, 06 Aug 2026 15:18:19 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 27 Jul 2026 14:14:12 +0530, Kathiravan Thirumoorthy wrote:
> Document the TCSR block found on the Qualcomm's IPQ9650 SoC.

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR block
      commit: ffc63a677b60247738b02a2520c6bfa740523c2b

--
Lee Jones [李琼斯]

