Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C517A300
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783925515; cv=none; b=NCDTi2GWsGxEWHJTvoH6XbMa1OBbaeYq2xS2zURluUDgHFVz6ASdu9o258XynLmXGvOWffiXk9HgTu5ArZuuEqJJCw/HByz1oCpbsaLwXCoQRxgtOmMak8v6l39+eQ0mmRPEGYvOnjrOIWQ3YdYKyOVfvwwW0LE++SGdm4+L/2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783925515; c=relaxed/simple;
	bh=3UZr+s7uzcW8h1DHN6h7imM0CeaJ4iWPF13rcXL8v6o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kCVR4EzBxH4PWgHodgOcQhCro2rZSa2suzRa7fhgHtgqhQvqbjNfxL8E7eibKs0QwWgg+ZKh5UUeeoD2txnDcAzFBaCPdljN9Yg9JDDDnnBt8jNn18rjdiBEHDCzTmInEHdSPHBOrgHPKOfwcKihBh9pDjgk4u/6AZhoTZGcu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fuhYrbj0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fuhYrbj0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ec1da77aso318071466b.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783925511; x=1784530311; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YzKzbPipk5HuR++dvISXo/Dbcil94rLYMkCRdCOQ1zY=;
        b=fuhYrbj0oakAvtO4aXV2tIokazuHogcH+ITiZ21to9rLb+7IUFQDRVVFjefh0+RKIl
         5ipMT82FDUneFmpyCaRK0+Mi6ZiynOJ8G01m3nphF1RMj1zUf4EJqc7BcRGPuMXB3nXA
         sHB9fXzbh8l09CueEimIyrnmrjIOb9+CkgQn4dMODaWbXWUaKlrNS70DXhWQfdv1a4fU
         ETk0s1noQuYcpPJFPNAJT8QI+78iRLi2r8+L9BFgOoN0VjenmsVEtgqT+5T48mTeFZWg
         q6jF8epVeWIeI/A4Yod33vAnGg2fDAQkoK63odf9KXlwNud9H5sWgdkauVEOkeqprA6a
         yibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925511; x=1784530311;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzKzbPipk5HuR++dvISXo/Dbcil94rLYMkCRdCOQ1zY=;
        b=Nti0Z5NAtkKXH/JsVJqtaHdwzOr5SXimGMb2GniffrNZ2KVcwH1/c/Gdmfo1RN4eLc
         8ADqddYKGIh6KWRtrIbvh6XX9FdJkgv31O0V5hFGH9Bk0t+VFcmHMIZYoDou7pDoEh+e
         OnWIwCZ95wQ0T0y3/lq+Qj2u8i/vH3UcjS1OfEDItlEYiHIgMiQiZmw7tiiSHKyqq2Df
         PNDruOfU8sdniUmRilP7OVIJqW10Z0tXBVHL4mZL/5dbPkTiUdl5inJfPxPp/ZRqVMG3
         IXx0a942Za18bOUemkvBv+waV/91WdyYDm/PXy1H0H0K2rGMr4FFax6sD6xQdgNBHkaw
         aVfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr32ck1DcnKERDc8SFco5nBzrvs0dEBFyOGZBll/7QzOf5DawOlE3SN/daMBQ92OVMrRzJZJGi1gtmU@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5IPZY7Fu6zgw+W694ViS1gVGe++LlJ0Bn+jNOG2EE4LIUwl9
	4UPlMpEuE4T9DqDTkCDQhfWIBOz9qmU+iboV5vRFIriD0xLeoL4sVvZDfRTammL66pQ=
X-Gm-Gg: AfdE7ckMJUolrMivVDqGTil76JBzAfNfmptVwInOXG4CwjCpu+xG6uQlqSIr9KjWYt3
	nF9YlmLxzfTUZF4smYeJJD3dngY0dQ/tF059S0nyBvDNtAPA5BAt5YpOpd1Qf/KwsjNlWSSeble
	rIJm6GW1U6Nv/3c24nCSaGkWWJfXggcrBg8mpXS3SZ0WuiyhKkcEPL3Me0ttxkTM03qHdKMpYp+
	wUi100jNjAZLoc2Hr58Yb6S+y71V/FY+YuCzGLh5wwXKNF9rDEPRb6TKEU0BuT0voV3j6ViPMVw
	p816oyTpaQrxmTeRNCeJDlpjctUqn+hqpVXV9iDMSwiIwIUYHfsOgmGfu9O0B0PWR0NwNR4N7ze
	TpVHOucTxIdChvvoq0MLegfm3zKuEXZoIOhrEAJ3oK7FIDDFocjUW2/2GAC5gAXeFQCttk47W4K
	tldNocl2ajxCJa0AB9b/6zOdPuwOdARFieIkDbMFBEnQPDbpKJlNbTbXiQNjwRwN8oMHZI
X-Received: by 2002:a17:907:9b8c:b0:c12:1dd4:13ea with SMTP id a640c23a62f3a-c161e9db95dmr250567966b.30.1783925510861;
        Sun, 12 Jul 2026 23:51:50 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bc428775sm870313466b.6.2026.07.12.23.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 08:51:49 +0200
Message-Id: <DJX8TDFWEWHA.390Z9IP2VQKN7@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
 <alOtC4bjK8IWzEj2@baldur>
In-Reply-To: <alOtC4bjK8IWzEj2@baldur>

On Sun Jul 12, 2026 at 5:05 PM CEST, Bjorn Andersson wrote:
> On Fri, Jul 10, 2026 at 11:53:57AM +0200, Luca Weiss wrote:
>> Add the missing reset (BCR) for sdhc_2.
>
> Don't be afraid of tell the world why a particular change is needed...

I didn't see any issue without this on my device, but usually the SDCC2
BCR is referenced in the devicetree so that the driver can reset the
controller.

No other special reasons I didn't mention :)

Thanks for applying!

Regards
Luca

>
> Regards,
> Bjorn
>
>>=20
>> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 8c9232988953..262fa8801256 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> =20
>>  			iommus =3D <&apps_smmu 0x540 0>;
>> =20
>> +			resets =3D <&gcc GCC_SDCC2_BCR>;
>> +
>>  			bus-width =3D <4>;
>> =20
>>  			qcom,dll-config =3D <0x0007442c>;
>>=20
>> ---
>> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
>> change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8
>>=20
>> Best regards,
>> -- =20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20

