Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F7BA34;
	Sat, 21 Mar 2026 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132430; cv=none; b=XgtfHOCkV5XGeUg1ctym19IdAmoadxcv4wRi4uEfcKfo4ko4DalMvP6IfG0v1RtG/cs/OmdCXt7Qqkt5qDsMrIPLkt5XdJKLuU8FeWOHsoi/Xb1K1tXewkdAyXGFgPH/d/pee5K1Vncmgcy03S3WCanoUpeOCk7g5SCdu2xxy4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132430; c=relaxed/simple;
	bh=9NVcgUJc1JFJM/MrjRk44wOsNNVyPjEd9WKN98yYxOE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=H+t0D4O3pEfMWtgQtKJ0qVG/YERq6nUr8xLgeC68/2weceZaItX1nxx90hCDhS8VaK2pgKNnvf1Z92TraFtJcs2hUqwxswWUVH3uoKyL+9mqJTfneEdzTud6YpNXqkq0fmkBBnWD+NzvEkYhMZzNIgZoDyf8HCI1FM5reyoBEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bETDeB7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bETDeB7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCD7C19421;
	Sat, 21 Mar 2026 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774132429;
	bh=9NVcgUJc1JFJM/MrjRk44wOsNNVyPjEd9WKN98yYxOE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bETDeB7eY6Mhy5fySkIu4sdloyM63ODwELakDC2B8KZoyl29U5ypMmWuMSji70vxn
	 m0/0/ImnYQK5nq+rZGmO9MpO+iDJsAy6vsfMFUgw4ZmqyCYIc5v3M4F7iMv8mVsn6B
	 fU3GTyfSpPuuQwgMaGfXSxIRBay6X2lZPwZ8RqhttbC+j8lk8E+LwUPUcd0ffjuNgz
	 OKLidwT0vYoda9uym+jxlrw5NB3oAHGutfUixd+DX3LppZwLQNxaWjmYDKo0hS7A1N
	 vVnl99J1xVBl5JRv6QL73Mc7MJR6+BGASN7XEfRuYD8imMZp+2/nTWJ9E7dnyUjt3K
	 0cf/D8UTMDn5Q==
Date: Sat, 21 Mar 2026 17:33:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>
To: Atharv Dubey <atharvd440@gmail.com>
In-Reply-To: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
References: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
Message-Id: <177413242885.520283.8406132558284719221.robh@kernel.org>
Subject: Re: [PATCH] mailbox: dt-bindings: mailbox: Convert to DT-SCHEMA


On Sun, 22 Mar 2026 02:50:01 +0530, Atharv Dubey wrote:
> Convert the Generic Mailbox Controller and Client
> binding from text format to DT schema format.
> 
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  .../devicetree/bindings/mailbox/mailbox.txt        | 60 -----------------
>  .../devicetree/bindings/mailbox/mailbox.yaml       | 78 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 60 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mailbox/altera-mailbox.txt references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mailbox.txt
Warning: Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mailbox.txt
Warning: Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mailbox.txt
Documentation/devicetree/bindings/mailbox/altera-mailbox.txt: Documentation/devicetree/bindings/mailbox/mailbox.txt
Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml: Documentation/devicetree/bindings/mailbox/mailbox.txt
Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml: Documentation/devicetree/bindings/mailbox/mailbox.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260322-mailbox-v1-1-c6251f18187c@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

