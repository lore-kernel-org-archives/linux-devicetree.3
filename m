Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014480;
	b=ypJV6/woudtL6Jp88l5MWD0i8Y9v6S2j2+1zpVdIUfMlQbshdxQnkACmilKH+48EVzNG
	 xNeLAvPsQ3ElImE5Vm2QHG0UgtpRQj7SWZjGbmdG5frVTfumlDA2RA72LQAfVeunOuBcO
	 0prFNc8hcwNvs9JtxzVRiljQK/17ntfbNU/KhrlmhJ+HR+Ge8Gc5LSiOZp7DmFecgc5bM
	 7kp1LaXfUS/9RfIZcBJJ0q4T83/RATh5yPsuoWIZ+KlgqZGajpPvNS6WAdYGPZ7QiAMvO
	 HfjOISbwId7csobSjMla0he7ASUsQZmoIXOKAeA5cz5JEnsOZezFvMjMho8kftAsosQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014480;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dFsr7cvnHyOlBO2bXUhaxL00xCeRq+pcQSodn+CuTWI=;
	b=X+607mVxxFi1/CMQswTdwL93OPk267gYRPLUUx4TPXzgn+QWxy5i8CNwphID1AJcreSk
	 BZcL9uTKes1LZuOGMG8h+/TBxH4uEsua8fq3x2f/GbnLxXmxtDZEXishh2ff7OHhO3IS7
	 2VknfVkUaZS7cvjM4ixFE7c5+rRHHD+M19Yt7bCoItwQ/vz7hN33ym33QnsMuhHqiDgsG
	 tlYSQWdHwEbkt//WmiIdQcO+++b4ZFbKMs7Gv84Lq4c6Ak33DMT3doPej/d91J6Ri0oS4
	 9ySxe8KdMpvGC3PQUIWbo9nKCj4e48N5ocVdFF2KaS/K2MyTkNENe1Wj/5dk+9yvaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMSmKu7K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D02606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMSmKu7K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224031F000C4;
	Wed, 18 Nov 2026 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014479;
	bh=dFsr7cvnHyOlBO2bXUhaxL00xCeRq+pcQSodn+CuTWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMSmKu7KiqWjaS2XwhU82k4bqOAtl7sQzhq4BFitoWlyx/TJuE8wmh48AsTb41pqA
	 bseKv4zdhjMB+fOckOh05mZQRnWlG8Zrj3gsRgGXNT/7AMs8ZaRrllFfg5n+7KRxqZ
	 86qud6+8ZOtq4yYtOczfopbqtHHGR5WDRLDXragIHO4C+GIHVRRJFBDABSp4x1Kdwb
	 MdOtnYOb6fFGVcjdiB/BOlPZNRcMdCWXqKln0oCAKGulAc5vFNsSnHwSbHmSM2bjEh
	 BFlmgUAoGUz0ePicefcKcFQpgXMNLBj5ozYzbOU2FgEB0U+36vhA7NDsI92PzuI+Xt
	 d28xd57V+fmFw==
Message-ID: <sashiko-outbox-221294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware
 during remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Rapaille" <arapaille@atlr-engineering.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:07:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] wcn36xx: use-after-free in wcn36xx_smd_rsp_process() [1]
--

commit d25ff402f91edcb95672f79f032ef8c6744c841f
Author: Alexandre Rapaille <arapaille@atlr-engineering.com>

wifi: wcn36xx: Stop waiting on a dead firmware during remove

This commit marks the firmware as dead when a HAL command times out
during driver removal so subsequent teardown commands fail immediately
with -ETIME instead of each waiting for HAL_MSG_TIMEOUT.

> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index ad8a4bd910d2c..77a1029108554 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1651,6 +1651,7 @@ static void wcn36xx_remove(struct platform_device *=
pdev)
> =20
>  	release_firmware(wcn->nv);
> =20
> +	WRITE_ONCE(wcn->removing, true);
>  	ieee80211_unregister_hw(hw);
> =20
>  	qcom_smem_state_put(wcn->tx_enable_state);

[Severity: Critical]
This problem wasn't introduced by this patch, but can a late firmware
response or indication trigger a use-after-free in
wcn36xx_smd_rsp_process() [1]?

During ieee80211_unregister_hw() (or when the interface is brought down),
wcn36xx_stop() calls wcn36xx_smd_stop() and wcn36xx_smd_close(), freeing
wcn->hal_buf and destroying wcn->hal_ind_wq while wcn->smd_channel remains
open until rpmsg_destroy_ept() runs later in wcn36xx_remove():

CPU0                              CPU1
wcn36xx_stop()
  wcn36xx_smd_stop()
    ...                           wcn36xx_smd_rsp_process()
  wcn36xx_smd_close()
    destroy_workqueue(wcn->hal_ind_wq)
    kfree(wcn->hal_buf)
                                    memcpy(wcn->hal_buf, buf, len)
                                      <-- use-after-free

An incoming indication takes the default branch of
wcn36xx_smd_rsp_process() instead and passes the destroyed wcn->hal_ind_wq
to queue_work().

[1] https://sashiko.dev/#/bug/linux-198eb452-42f0-44e8-b29d-e7d05a4297df

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-wcnss-seri=
es-v1-v1-0-a64d82e151bf@atlr-engineering.com?part=3D3
