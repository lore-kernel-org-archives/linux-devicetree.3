Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917842D5432
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178344; cv=none; b=p7O8mkkWn3kNxN1LS8AFlrvEWXvmJDeWENBLT+iiTZ3gFbFYlIWMniwvZGbmZtOl2DEA8XKHpli8K9P0HLQy6QrpxlUpv2uFm8khYBq/POKqUUSLtKKTCOj3XhYHPTD9rDW6I+f9EI7qaSAsL5hZG8tqB+tryZx+jhQjZPQKVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178344; c=relaxed/simple;
	bh=qiA+hQSUNBI2C/a8HcNFqL911McXyQWMzr1Axpk+HTk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulE2DvcuCkM38sdZ2YkNGU6HOdR/jbzJzBJjsWOv68RQt5Ao94OyyYnzWnzhf85PtKrbjTyjh5gZN+STesxDoQnTkcNW9ShfEqFSmxHAcymc6WdWgmP3VtzwEVZLcRKJ1Mz0o7FhU3INYZxd1760N3rBmeWw+Dc2gWGeArBv36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iu6M9agX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iu6M9agX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB15C2BCB3;
	Tue, 19 May 2026 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178344;
	bh=qiA+hQSUNBI2C/a8HcNFqL911McXyQWMzr1Axpk+HTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iu6M9agXsbhJnHT3AXeXr2fpxTaX/uhoyetrLUeZXI4y70nl6Zd2AZ/w0IXAcR4nB
	 QZf3nrGGnQ+m6mUIQazrtLfLi04nFgDNFqaE49zq0i47UHnXa9KYMPafFWnlz4av1a
	 SlGEJYdz60TI/AksRUA9fdp5wEpzPBULIYUjZjHHu035r+y4NEwDlPbwnrgR/iH9lm
	 Afmc5FvlrmF3rz1pEfGn6uJGJqC0JS1I0GYr8GJ0r69LCtp3PwFXLhBl3Jdie96wOd
	 aHbI1R+O0skDAILWoOrS2ADXIpwDqEGQpzI+FtnDRR74SvBe3pw8sy4NW+fxWmE27n
	 Xnb1xMlJcmXRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before
 enabling pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:12:23 +0000
Message-Id: <20260519081224.4FB15C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free in system power-off path if probe fails
--

commit 7e913e496347a43b567ce3ce3e00954f1fc74caf
Author: Alexandre MINETTE <contact@alex-min.fr>

pinctrl: qcom: Register functions before enabling pinctrl

This commit changes the Qualcomm pinctrl initialization sequence to register
functions before enabling the controller. It replaces devm_pinctrl_register=
()
with devm_pinctrl_register_and_init() and an explicit pinctrl_enable() call.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 45b3a2763eb85..a2a1e0835735d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
[ ... ]
> @@ -1607,6 +1607,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  			return ret;
>  	}
> =20
> +	ret =3D pinctrl_enable(pctrl->pctrl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Couldn't enable pinctrl driver\n");

This isn't a regression strictly introduced by this patch, but it adds a
new failure path that could trigger an existing issue.

Earlier in msm_pinctrl_probe(), msm_pinctrl_setup_pm_reset() is called,
which assigns the devm-allocated pctrl to the global poweroff_pctrl pointer
and sets the global pm_power_off callback.

If pinctrl_enable() fails, the probe function aborts and the devm framework
will automatically free the pctrl memory. However, there is no corresponding
teardown to clear the global pm_power_off callback or poweroff_pctrl pointe=
r.

If the system is later powered off, could the kernel invoke the callback and
dereference the freed poweroff_pctrl pointer?

> +
>  	ret =3D msm_gpio_init(pctrl);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-mainline-s=
end-v1-sending-v3-0-3dd7aa125353@alex-min.fr?part=3D3
