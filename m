Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82B3AE6F4;
	Fri, 31 Jul 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486093; cv=none; b=gJD35gXA2JxVKoJ8MXk+LxMo1VfB3KZxPp5nyTsOl/qu4cNgaBXQMoOBfdK4qKavjzrhipcuoWj/rKDXAp3nRwIyte0NGtxUUaPPaHsn7BtSODS79vGD7HAc6QxFU/OZ8fvjxFR9q0kQ/CF+IXaJfLVHyH8FOiOMwkgRkvQhVqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486093; c=relaxed/simple;
	bh=bpY4HrtlYJVfd5gfQhDR47D5hSCsQCxCy96DYkl0gJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVXg4EjqE5Y7LZvqpnKu7PTJH6Z3UB1SXfU98yfb/lopfU6LjTBNDxdurDagChriAjOCPhDNNqr3dPvMYWRezjlB+BCudGzMatqAUY3pt/u35eMlfGL9IXW0o8Hqv9OHJHb/zal37/3zEPL2TIA9EYuZVN9Awihvln/gFYPLmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evKH04v0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evKH04v0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0BB1F000E9;
	Fri, 31 Jul 2026 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785486091;
	bh=6lrDWGK6vzFU1EsDsfi0BEKtXzYS5ktvF/nIoXutWM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=evKH04v0itTTHf6zLboapjddiSf3mEyjtIozC26ElxVlPWuNitK8WO1BglhzbmXoJ
	 W270Dz1y8NkLWSW5nfLayMAmFb89d+yhSXSx08PMk6XzW7VXkYDN17LX2qQKXrPYeZ
	 FRSK1AbN/3p5hICsvbbgGRG4gEhtDBbUHHLa7iH7yi/rhYgXkU9JPG3wAQHM95JCEm
	 TAD1mZdS7g32MMQcU35J3eQfm/RQ1vqIIYFakLuROW4yLiCfc1DYBggoadoonB6L3a
	 GG7i5fuJ4myoTupqsJo16e4M2mYABRm6R8quv0a3zFbuU5dDWX7yIMEQRCAvEbomMe
	 LKKoEPG6D0ZWg==
Message-ID: <a94d2102-9b24-41ea-a5cc-760b75f7251f@kernel.org>
Date: Fri, 31 Jul 2026 09:21:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for Qualcomm
 Maili
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/26 7:48 AM, Jingyi Wang wrote:
> Document compatible string for the QFPROM on Qualcomm Maili platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Applied thanks,


--srini
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 8134ddb54e13..72206c44feee 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,ipq8074-qfprom
>            - qcom,ipq9574-qfprom
>            - qcom,kaanapali-qfprom
> +          - qcom,maili-qfprom
>            - qcom,milos-qfprom
>            - qcom,msm8226-qfprom
>            - qcom,msm8916-qfprom
> 
> ---
> base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
> change-id: 20260603-maili-qfprom-bb7ff3daf8a7
> 
> Best regards,

