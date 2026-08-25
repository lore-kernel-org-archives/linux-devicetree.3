Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A353B4EA4
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686745; cv=pass; b=jIsEDCJdsGx/nR7jgmugx97ar2xYVz8I8e7kz9JjVD9q+/QaI8XrIlMxYlgdw+7w3Pvt9dwpvzCli7eDeRNrPiWyYRnvgrJaPhHyaFL6u6vOgCHkln2ERaKbs7piYXRGX5nUZZiqc4tPTGHh5vMRD4wPg2jTSgTz635ep99AlZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686745; c=relaxed/simple;
	bh=wgf3EEkFlzf+G6IdltrSynW+0EZc5Ur1qA++WoxIUPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbkYMsmC/sbnyvuDxRQspZfQuvLcUP4+a+Rk/20zvxbSjMZ3iR9CMntkJSuCEatNsIkOBVnqhcSWvZ/YxGy7Unim4FjvEfm/ylVBAPLRR0ulriBg0T5fzElPb0/KhNcu0IbKqzqktBN+rLGIGNWcTp/aUbN6FEOQXu4nDtRcmxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPQfQbNy; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPQfQbNy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b29599b81cso132525e87.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787686741; cv=none;
        d=google.com; s=arc-20260327;
        b=e5pZ/Uts5yly8i9BtLoIZSow6Cs+M0IcHmhfb8Z2PKJrGQyZb8sJRFbM6xenlO9QHS
         wXJC0wVXLXYNBHMmMlFVRwPWZT8MOwEkiGPPxL9MdepXvFwc7riRoh7cJ+j07IUaYelN
         aeTSaH4/tE+mAqi8aP7FrArKS2Oi6S78X2PUcyvpQVpmojEMZHshRi1lfB5L7dgkA7b0
         gZ420vVHFaK3MXO3GtCEPJG1jCnNoRt0/k5W+617X/oA/vee/IcirT7omWSS7Kd9v7eV
         C+pQ41a2tSVIxvpD/j1LSjAEcp8Rr85zgaLHHf36TKgAW7PlJ+ACpb1Z6tjjhzZsHnUo
         djlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8ogUiHTu0eFI0J8r+4KzxzBHNBTHluLzoqKdtSeUpls=;
        fh=w+vfL/oHpVYXY0uG9FQW8E1UiyNvia0LsPXezoV+s1U=;
        b=r81SPYdv4RiJyVxiD2Y/7pfaLF5RQB9ICEu7MA1PjMu9DX+Ybedysu9YVUFz1yBiyl
         Bef+4JOhI7vDRsKiPG2eF3ai3tprKh2o3kxDX0tCzj0imJLKrHMgaMPSaoQdEXdBrJtT
         t/rBApVHH7JmU8ANgGlmkVAP1dQSUmReSlZbPm/HTE1fKuzTSJYIX4Ipw6ZlsCA7pz6W
         +wgUCC5+gwu/fi8l4+ArGBVSfOhfy3lLLqwUOBNxTR6cnIEYI8CGtphfZOMO9oVxRRCc
         ptx3Z02x5+1mElxgbaUqjoVYNc2UD2KRoXoRCoRLqzg8yTjS2JMH3xjg3Vfsd39c7tdv
         v0HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787686741; x=1788291541; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ogUiHTu0eFI0J8r+4KzxzBHNBTHluLzoqKdtSeUpls=;
        b=EPQfQbNyOWwH0PJjTC2qhLGiI+FhXGrXFny+RgzOzmQ+Y3cyaHKE5JMlVrinYU1vC4
         KNOSgip9gOIdncTQRnU36C0Mqri1gpxEJJItVvQSRP07ty70en6UH9UreFbA7gkC8Pce
         Q+DCIXmxsJEaoLc4jKVngikCoeKabsLXvMqy9WOwO0OcR7nut//IaVq8tDCld92dv6Bi
         Vk+SNy6K2JFwTG5rI7Ez1nBJMt/8OhNiiWAg/HeoiEyYGswloq1SvkbtT6lCDIdK4ZGp
         WvR9rJisPQaD/YphEvXoc/iAu+qMXM3eGb3xMq0lI7wNt8Z+eJ8cxm5/YjIf3gC2b5zN
         tzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787686741; x=1788291541;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ogUiHTu0eFI0J8r+4KzxzBHNBTHluLzoqKdtSeUpls=;
        b=nMhWAVjaQx11LQid3jReafCL7vNca6Jm4k6h0fTJ5bsV3OjsEg0zo7GBdWMZzkzikH
         pYhEjA/9N/6HV8IOEwrufXvDt8uvU5mGKtMT/htKNgNN5+vXbrkzULG2yOVtSu6Y/rml
         Q30e2jR6uFnYiNCjuxue9vZR6GjIYSGbES5Vj37uIQHjkzGEFUd1lfhljERJiF6nuUW9
         3o5puPAwHRd935WZTb+ygY+83ZEfEoI9vCi8FdRhMemf10pBQg35mQA5/d7z5JwhaY0x
         GMm3JaOULECwD7Ik/oC6EJc/kmV+Pf8vppbQHyxABXJbj0dN05481U8bJ48lUvvydrlx
         virw==
X-Forwarded-Encrypted: i=1; AHgh+RqdqPNvEDaCZcy0aYgEyyXvcgCr6wGSWULo7x38cj8xBbsEYK6OOPYotU7RU0vpvA3FClanpQu64TT4@vger.kernel.org
X-Gm-Message-State: AFuF++kvz/Cgo3CyEAOtPnjMCtKKFK+AWBDmcJCoNrA4PdvJs9P+LQUn
	zLz67Q9FZX1rVgtqJA4H9dAr03vJxOC4M2b1uk1frQyzyMNPlpKqnEg7BihlFxkBxFBxeMLs1Z8
	xbtWS52FD7/gj9qqM/kYx3hE/xCADCzA=
X-Gm-Gg: AR+sD11aaFmIzaF9QOPaVa7cifHexEI+7pBmRKgSk+GCfoXug2OJmYxtfiHjJhyzcQG
	fhaoX+UPN1NOCHID3s3spb6frF5noXzM4Ihwz9UCfzbJnlhn9mVmD/KTMC2qsSFXtvvnHcceMxQ
	N5S+aiR5mB3bOWIQ1ddYol0F8Va31kap/1oPhB9y+WgArPfhOc78F/yKBkSuUAyKqVRXKK6SahN
	gqjA2CG2tVe1qcnEcyfIRJqRDqORwh0xuW/2c8cbw6LQMUkYLAf0vbNPIABIHTBPsDc2/6CQF6+
	OTKZ1Cuwlk3vzHaPyjQRlmfJ5asmKYgpuHh/WEViZIsQoJA9HLrAaz3O0PXu99sXrxcBxQuUrqi
	kqA==
X-Received: by 2002:a05:6512:800d:10b0:5b4:a2ec:c078 with SMTP id
 2adb3069b0e04-5b4a90634e2mr132019e87.21.1787686741212; Tue, 25 Aug 2026
 12:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
 <20260811121012.7046-1-hekatombe@gmail.com> <hb3jvyuf2j6sl7pjimnccoj4hsmqtxdq6s7w626sbmpbcqw7t3@wzyo563dmcle>
In-Reply-To: <hb3jvyuf2j6sl7pjimnccoj4hsmqtxdq6s7w626sbmpbcqw7t3@wzyo563dmcle>
From: Troels Vognbjerg <hekatombe@gmail.com>
Date: Tue, 25 Aug 2026 21:38:49 +0200
X-Gm-Features: AcwNN1VZcKL5ZYQ8eFKgbPi5mRCnrneKZXfFkqke67BVsou1ADgT2iiGjFFRt6Q
Message-ID: <CAPMyOuBXBS+zOEbNHk-TRTG43RPcXPpZLtmpHka-WDzATC8nzg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rtc: Add Qualcomm PMIC RTC-GLINK support for Glymur
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: alexandre.belloni@bootlin.com, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, raryan@qti.qualcomm.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 18:38, Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> On Tue, Aug 11, 2026 at 02:10:12PM +0200, Troels Vognbjerg wrote:
> > Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com> wrote on Fri, 07 Aug 2026 02:26:29 +0530:
> > > On some targets like Glymur, the permission for receving the RTC
> > > alarms is routed to charger firmware running on remote subsystem.
> > >
> > > This is because Glymur boards have to  support MSFT's `TAD feature`
> > > on the windows OS devices.
> > >
> > > So rtc-pm8xxx.c driver cannot recieve RTC alarm IRQs via SPMI on
> > > Glymur. So in order to make the IRQ available on the Linux kernel,
> > > the PMIC RTC Alarm IRQ must be routed to APPS via remote subsystem.
> > >
> > > To implement this, add support for a New Qualcomm PMIC GLINK RTC
> > > client, which will request for RTC set/get calls for time/alarm IRQ
> > >  via the existing pmic_glink interface to the charger firmware.
> > >
> > > Also, add a DT property to explicily support enabling the RTC
> > > writes, keep RTC writes disabled by default to align behaviour
> > > with the existing rtc-pm8xxx.c driver.
> >
> > You mentioned this patch series applies to targets like Glymur. Does that include
> > the ASUS Zenbook A16 UX3607OA, or did ASUS do something different on this
> > laptop?
> >
> > The reason I am asking is because when I build this as a kernel module,
> > I get the following error message:
> > [    2.241461] rtc-pm8xxx c426000.spmi:pmic@0:rtc@6100: probe with driver rtc-pm8xxx failed with error -2
>
> This is a different driver error, this is for the one which works on the SPMI bus.
> While the driver that i have posted in the current series is based on pmic_glink interface, which relays the
> RTC alarm requests to charger firmware running in remote processor (which implements the Windows TAD feature)
>
> do you have this `qcom,no-alarm` prop defined?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/glymur-crd.dtsi?h=v7.2#n565

Yes. I used the DTS for the Asus
A16.https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts#n863&pmk8850_rtc
{
qcom,uefi-rtc-info;
qcom,no-alarm;
};>
> > [    2.499556] Modules linked in: rtc_pm8xxx aes_ce_blk ghash_ce gf128mul sm4_ce_gcm sm4_ce_ccm sm4_ce sm4_ce_cipher sm4 qcom_battmgr rtc_qcom_glink(+) simple_bridge display_connector
> > [    3.277788] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [    4.318666] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [    4.319085] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: registered as rtc0
> > [    5.359404] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [    6.400331] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [    6.400496] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: hctosys: unable to read the hardware clock
> > [   25.447761] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [   26.488271] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [   27.517573] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [   28.560114] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [   29.609224] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [   30.638629] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [   31.677524] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [   32.720749] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [   33.757662] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> > [   34.808360] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
> > [   35.837651] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
> >
> > And the error message keeps repeating every second or so.
>
> Sorry for this, i think the firmware needs to be updated for this feature, I will fix this by existing cleanly
> if the firmware doesnt support it. To avoid repeated messages.
>
> Also will check internally how you can get new firmware (if you want to use it?)
Again, I am on the Asus A16. I think I better wait for Asus to the update.

> Again sorry for the trouble.
>
> >
> > --
> > Troels Vognbjerg
>
> Regards,
> Kamal

-- 
Troels Vognbjerg
