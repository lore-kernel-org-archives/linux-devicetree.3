Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216667;
	b=LeAcVCZDoSJIeJhBfJ8k44CQS7xvtx7Z9L7c1+2tIj2yKrRQuF7YpT/ADDToOg3rMOVT
	 81LmS60HhAxiEfQ9XZWAGWM8SiwzaODNs/HAReo6w4fFUDtHc9Ot3Koyd/reYZiLblJOL
	 AhRUKP+bpSEal+t7jiE3NLl+v87phkM9INjE50LW6RHO5//HwdbHeXMRADksfxoQAq3Wm
	 djwWledwoGgqxkTGfVis1lseA9u3HFrs4NfG9pJtXp9VekEFtlYnQEhByiNbugkdpyNXe
	 amZu1ii26iXPYURzfAZg26UHdjigHy5xuJqXIh1/yyE72zHURO86v/DcVYyOYkIU75Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
	b=y2fuy/0JuPzlQC/Vz2W7OUvW3LNRTlJ/IQDMsX5IB/wzxT1mMWgPiPTN4WYfGWo4uDAr
	 N8mUot3ayKDU6j9FFS4pM+z862FRvShvhoYXZ5UvOMqw8To0FHEHSqHe8144i5MMU+n11
	 ZBhTBlRkbCA2i1+ayrpFibPg9a3dLd6jnzny3GfEQiaKaBoPq06yPUF+3M295QEShUSzE
	 70+EQZ67xokhasnJy9QfsXwVKRZp+vv61TdDVkJKsQ/2GKW1hCkW9wV3L01WAAnk9WjHZ
	 Uvlipm9IaGn+X74C8e0lvdfbFAyyFC8SJ6YNw5stIR8X6SayRugfsZGVKiLZ/CmDlAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btdyUVxq;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACC606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DACC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btdyUVxq
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afbd2c386so866732f8f.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216665; x=1793821465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=btdyUVxqGllsmx7PdfZtXJxg5O3lMYfsJNs0FsMva9iyMIKwhWLF/mve8ROoc9aubS
         HPSX7T8xYnXaoPofPwwNAW44/cunAet2aDwX7SM0VEGxXtrJN1x2+EgduSKtRnZwiTvm
         GbenWrTTk0hgZdetO8jMVCMjWQ3rmiIimiwl0DKuK1Nse7zgT/y+7K7trKPAUTvy5jzq
         EnnMmalaJ4vmJgLQipA+aPnCDaMDtVB8DtzZzzzdolDCnhebzhqgAxyfZqGs4PqMRhRj
         uYVZLCCVLDzK+Rt0U66Dfl55jjKJA3SVgR78XjFAxodwIn8eFeMUpjJNA+teyBJ450R7
         W6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216665; x=1793821465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=QGIqqfE7ElcVyliEdxh1IG7WPC0BQK85W2KQO1YHduN85+IV2l/jftv4i2kgiu+y+w
         XnnaPbkaV9pXAqD3H2I9+YAOPMJkW2Pujq6HDL/O+POX47yfoLW0bGUyVcrfUjPCbmy2
         FICikWgPovtTeukr0GEuITBdoLXcvHOO+LIhmi712AERTQTd1mrGrE+dJN/RGVBKW5sW
         R22W+cq5oZb0TQU9FVOmcCzjhuR+C0j+P1IOtzEG59yaC7pO589C5AsVSJAuaWsjXXo5
         tIx43ANC4H/vH6mbTSzfeRkiPTNBF3Dkm48hQiV4j6BtvTYttDR5Hf3hdH+kwwJz1u1W
         ToBQ==
X-Gm-Message-State: AFq9FYLIgvitxynrP60+OGwk8brIrTH2ewLDef1+otf6V01J9PjYJ5mO
	kkrdSICfuhwjN0e0aZEGh3eqyGJHeraWvcAt30VTghV+t8gl8gO3uP2Z
X-Gm-Gg: AYBFou17rpj27prNfE5uIanqAwzDkRVmzmxkTw06DpLk6HPN+D5yIhu7b2pNf12l4Sc
	99m5plIApmC176lgXrbHN/FwA6VHximw68ObWdp4vd5dYgY6tJJFL8cwh7ihPIsERdY5VG1J062
	EqE6TMeBDf7CQqGOaN+zfcYuYaNE9Da3sIBAooW6BQO8s3tbY/Xv4F/Q4auj3feA/+fCRmONSby
	F8MOS2WeIQ58m5Bst6oxavJNf95nQ/QySn24AVG8KR0kTLnvkkVSbrEbNXA8W4EYQORAj60zToc
	EimxQ4KTioFkVICE1C2TRcukQtDwkXGaW+Ecy86mFXiq+8A3ZCzmPIj0qZQHFEkuHVm3esCBFVr
	KPZPkcGKe/ZVU6WANXzDh3+OqYnPjCd/Sviw7r7VRnNzwSERGZdMmglMXoSpFq7wA5k3LXXRU/B
	k6r87Su3tX3ELqJ5mycpQ5FRvirtc19bUVuCkit4SKZ1FdHydzG9di2cad+wjPcV2AdmhL5KH9z
	D9dMA5m17/JoRKxxw6BhpSpaIyfxfn84D7E5RI4LZ5pVklvl6OP5U3yXRep4qj7e3/cxNa6TweD
	SorzithY5uQ2KMZlxe0URlOixbbmTbiOgImdh95vXuVzHcaq1asJGVgV0hX1jMbJNtaI+BdCS61
	2gU2gN+AWOrFptt9/dcgx5lLfDvYFZ10=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr6431684f8f.55.1793216665283;
        Wed, 28 Oct 2026 12:44:25 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm27766389f8f.3.2026.10.28.12.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:44:24 -0700 (PDT)
Message-ID: <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
Date: Wed, 28 Oct 2026 20:44:21 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add usbotg3 iommu information.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..1370a571153a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -32,3 +32,7 @@ &usdhc3 {
>  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
>  	iommus = <&smmu 0x11 0x7f80>;
>  };
> +
> +&usbotg3_cdns3 {
> +	iommus = <&smmu 0x4 0x7f80>;
> +};
> 

Hello Frank,

this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
(both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:

  xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
  xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
  ...
  xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
Reverting only this commit on top of current master fixes it. The other commit
seems fine.

Adding the same property to the parent as well, like the NXP downstream tree
does, also fixes it:

&usbotg3 {
	iommus = <&smmu 0x4 0x7f80>;
};

With that, SuperSpeed devices enumerate again.

Could you please take care of a fix? Otherwise I think we should revert this
patch.

#regzbot introduced: 73c3b40e536d

Thanks,
Emanuele
