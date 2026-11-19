Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085622;
	b=FPEvaj8QdEzYgrqSjW5nK/PKJJSv19eI30fMTbNC5kv3J1eZwIiRY7GnRRODw6me3e6D
	 Rd6NhBFrBU33oAs918uFTAwQIXSdhWV+m+EBh9OYlxhpSWUTdYsXnWGX/toXy29ARSN6O
	 0iyvQSt+aUSIKz/DQkJ2Omncs+vvaB35gmxDVYcwqQOaCv5C3/e+A0UEJJ3kpeQhDlL8p
	 fbkYR2dOp7zqClLKJXOj+uOF0Byos+GerRDluo7+Oj4WNlwBkpMl2cscywhU/AJEJJDfx
	 cz9frm3I1e/XNeChSLIjn/Bt0wK7WPw29XBUTS4LHrZ+gtVTjt+Sn1OKKc5+mst3AZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085622;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=f33Z8TXoFnsk2bbt98iFyYywFcMPKAXGUrS8qLhYS2c=;
	b=uaWEqKU92fTNWrpFDM24TeCcdEYCaPxt0GpnBUsHUDWf2Ac9ZrYqueYpNBNnuV6gbNty
	 Jya3MEyM4HkMQvelVkT4J5+u87UMoPQTw7NiyksCCEyQu2uPOyiV6su9fTYTZ+GdEIHI0
	 qSfoaYNYwzFEXxn/yXHDi0ZBEEQuX4fYIL+q3bUg4Sa/mFdREx6qsS/zWjEIZ+zkMN1Ta
	 guFlcIl8pWUyRKP+nFMVETnk6ao8GpJn5mj7uQlWoqmGAXWByWMA9heggpcT0P2PgzMDp
	 VzOOp/Qw6za23MfUZa9cV05JjRl+8HRg8C5phJEYlC3TFCRD5D96RyShCavHKM7Ty+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtvedPad;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65605606A324;
	Thu, 19 Nov 2026 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtvedPad
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E636B1F000C4;
	Thu, 19 Nov 2026 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795085622;
	bh=f33Z8TXoFnsk2bbt98iFyYywFcMPKAXGUrS8qLhYS2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UtvedPadHb4cKSxxgoSSU+OIEhw7T/wjQrmTAbYXZzMdMCIr4EOl/NOT7ePok+nFw
	 FwX/Xr6W36T89lAe0eR+i7ES/GEFxXaG+V4++Jh7U+r5EeKUyMTa3lYPe0mokSksf4
	 RHq90jM9bkzyXjEaAn+EOaikuEsbmEviksq+FieF1NQi3XySDjMR7truZAIF4kX6mZ
	 UzEBNzD/H0QnHubpohDHjzTG5kw3HQOENawy5SfhT8gigmSf6WCDkaFrdr5IEL2J6A
	 ED9iD5mlKbUU7+0GMqFWFlkcCi0ffoCVJ7Lm+tCdp/iC0jXWTFyIcX12HVpSSz1YWS
	 /0LUit2sKOIQQ==
Message-ID: <774d5d05-bf48-486c-bf3c-b8442fd624bf@kernel.org>
Date: Thu, 19 Nov 2026 11:53:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] dt-bindings: firmware: xilinx: Add Versal Gen 2
 compatible string
To: Gregory Williams <gregory.williams@amd.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 kishore Manne <nava.kishore.manne@amd.com>
Cc: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261118233211.4121361-1-gregory.williams@amd.com>
 <20261118233211.4121361-7-gregory.williams@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261118233211.4121361-7-gregory.williams@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 00:32, Gregory Williams wrote:
> From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
> 
> Add compatible string for Versal Gen 2 firmware driver.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

Incomplete DCO

> ---
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> index 72af37cdb103..60d1bd329d0e 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> @@ -32,6 +32,9 @@ properties:
>                - xlnx,versal-net-firmware
>            - const: xlnx,versal-firmware
>  
> +      - description: For implementations complying for Versal Gen 2.

Drop description, it duplicates the compatible. Or say something useful.
This should be rather enum with all such entries.

> +        const: xlnx,versal2-firmware
> +


Best regards,
Krzysztof
