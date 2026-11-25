Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595363;
	b=QFkW8z4xUPyhP/osVbxb9/8vCKI1msS/0KTK7KItxMQyzyOqbgynqcdQet8IfOwbluae
	 xcY7V7AN3cG61p7nurqnxeG+xuEeIh4i2GthyvTNvhoLfiaiRBApFyFXViQ/oQgtDw4y8
	 9LOdpum8BdVvc89krv5ntLZUn4E0bmYKAwraYExfTdu0RCWfalTI9NRszwu0DgwHfukvX
	 YW8cw+sc6dkUFwPCHlMlrm5EqATV714TDhB/cIvMH9Eck5xRsp93VX1H9Ts9k/Mi+kc1N
	 FDF5iyWO/AnredzWH7+7XSLw/eSiFX4xSMaUKlMT0rF0R2lJFPIwdYJNSLQcdrEHrJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595363;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=FbYqJzFf/cdus41h7iS6CyGUUrAMUJ6zZQQ1fJxNpwE=;
	b=jSwuWXbE6015+aMj0Fvjp2J7SpPni6tP6jaVu6FbL6DeLnxcnHUalV6Fcrskwlq0Cy5C
	 8ilzxk3LzC6iglTyswcuP9r1Fl2L22Vfm1oKb2vBrR5F77jjhHHkDxMpNcIr2rZ1rjBKt
	 x1hrgVtfZ3bMAfOlY58zFRsirRVO/ZdYrieVFaXy66PwvWIg0troLP32oHmCBOD2KM4F6
	 TE5jis7MvwFlH9B4hq75TcU6v813mNFkhX41BNoALLcQCAstGkpC84UIXY+G8ccs6gMeq
	 PgmFH26zdqTmtQY9mSA/Jk72mxEp265btaHXz2d6LKol8VU/CqU9Wt9w81HKz0XCQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDYgS4xj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5DC606A31E;
	Wed, 25 Nov 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDYgS4xj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DD71F000D2;
	Wed, 25 Nov 2026 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595363;
	bh=FbYqJzFf/cdus41h7iS6CyGUUrAMUJ6zZQQ1fJxNpwE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IDYgS4xjPyQBHitiGNG1LRqPWUtMUz3gucAMgVKJiIBNqYLhlNMgO1AGxNtanie0H
	 seDi+za9AqCkV+WsjEqMv9mjzhy56Sftg2hF2viU7DetVK5p/PDpMnTVrjYt46gJOh
	 t4OVETCI11jifuZOJ7KWNaOZ5zv9fvVsqhimA3b/sjCWtIa1AmbS1Kq1UtUoi0/KYc
	 i2h1EkJwoijZ9nVpLfdQlzqkZDb0MGosa2wizPgJimGZz4RNnj9c9tdcPSjH52HldS
	 CPcqsobfdJoPDDELkJNRzmTLPeIEXwU9ax3QZlkrQISJcwoXah6dltjqPj5/Yjxfdt
	 gq85t0FJ4wv/w==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] dt-bindings: firmware: qcom: scm: fix
 CP_ADSP_SHARED VMID value
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Gianluca Boiano <morf3089@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-qcom-adsp-shared-vmid-fixes-v1-1-f1a808dc41a5@mainlining.org>
References: <20261124-qcom-adsp-shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org>
 <20261124-qcom-adsp-shared-vmid-fixes-v1-1-f1a808dc41a5@mainlining.org>
Date: Wed, 25 Nov 2026 09:29:19 +0100
Message-Id: <179559535967.14607.13377213266450757103.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 19:52 +0300, Nickolay Goppen wrote:
> From: Gianluca Boiano <morf3089@gmail.com>
> 
> CP_ADSP_SHARED was taken from downstream AC_VM_ADSP_HEAP_SHARED, which
> is defined there as decimal 33, i.e. 0x21, not 0x33.
> 
> TZ on SDM636 accepts assigning the ADSP heap to 0x21 and rejects 0x33
> with -EINVAL.

So not a binding? The value is abstract, just fix firmware... even the
drivers are not really treating this as DT ABI.

Anyway, any ABI break must be explicit in commit msg, better with
explanation what was actually not working.



Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
