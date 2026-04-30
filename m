Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3C3A254A;
	Thu, 30 Apr 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541686; cv=none; b=ebpHhHYjiUInRj46KAa6cZie1ZVOkQbJB1QjxZJN3QUJDtdflKJxVZhT3yLXxy6jAZuxju98vuQZmGytPjJm+uTIBXD/dIIe1PWd2CrkPN3YCjZkhMdCI3rkVjcROBzoGffeS1HuwpWnrz/MvlVc3J8WwCUb8QcuUITtxHBrUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541686; c=relaxed/simple;
	bh=5IOnM7q7Jm/DXFfFjyyeOcR9CRYv1oWiz+UcEgGVKlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj5X7sfHRBNZM+w5BCiwaxaXyDlGAWwTrXnBbyR2nYQRqqNIjULbDL12BAizKFUnQxKCmQ/ObmsW/H9PTrWXp9tYxqZhs+hVu4krDY5FqzKqmCY852yFW88kjBy4t18ITPPTyhI/Z3OSNXfgbkpG7mx/sX+xkKH/WJP6CzY6cxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIhKsY/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIhKsY/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEAFC2BCB3;
	Thu, 30 Apr 2026 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541683;
	bh=5IOnM7q7Jm/DXFfFjyyeOcR9CRYv1oWiz+UcEgGVKlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIhKsY/qVbL1QIUoaXwLT1kQYTjIwzlhtXR6M7pXw1YReXgKFoq9ndn4de2K6FBXv
	 +w7+4YHM5UF6NSHF+sQITJe6ow0FEEruO6tsWadfdOQ6iCAbDJSR4scan0x1STf+JK
	 0a11Ji0XfAZw8l9ly/2re2lRSwyNWhqoACSrMfw5dJy3FSyqbmRBR7uepzQIPcTWWB
	 6kK0HJRq2rzxuf2akW7ZG4AUscF7SvcgyYWlqL68QrlsXf3jmrl8G3HsPB1cWU9nRz
	 5xfucSUCYU81IQLUcm7CAcZFbJ8jHKc49j7xrKicD+zZKxeaYjBTPuEoLBo9wWLs/i
	 JXc9jdEzeuuXA==
Date: Thu, 30 Apr 2026 11:34:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi
 compatible
Message-ID: <20260430-serious-taipan-of-enterprise-ac2f7b@quoll>
References: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 11:54:12PM +0530, Mukesh Ojha wrote:
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

