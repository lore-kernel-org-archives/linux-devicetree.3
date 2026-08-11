Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3C1439345
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450218; cv=none; b=LdWw+WfGCRV9xtDUZq21i0nBkv5YaCFyYu0wCitistCFeGXeXibm/ZTurad86gSWf1A1C4uY61iDIFxxNCaI1dzcyqkPzDejn5QxrrEuDmeLW9Hz41nybvU/ESQMHOqdVNv0F7EsRLO7h2aCjIPKM6nFSMYkk3hkO42ICqYSXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450218; c=relaxed/simple;
	bh=M0klPbpMKSDb83aeDRUr2B8G3YjIwJhy28xYU7z8QLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEFGMHCs0lm9ms2/ITnxNudGpUqmrcWq23uV2UlaClc32PQA4caSQZA5tWbEeDN0AzqPbXxOP9+E5NQla+Nn558NnvmT03ujfvl1XuWA3RLHB81uu457pHupBYBnTJvMyy52bfnkCrRMfGylybOvZ+gB9hLA528U+XImDLOIyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3zRSSBr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3zRSSBr"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b015532f7bso2831797e87.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450214; x=1787055014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJUUpA+u/X+Mw8WGuh26FuT0SdK7L1t8Py4ith47VDM=;
        b=A3zRSSBriVNhHHC0kVcqmyAKY5sdk+rlxwdl6FoVzDAPXcv1S/a+Dss3LK3UsxT+pQ
         T0w7R5AncVRO/FaiyZ73sIrs4MqwjE41wc6k1tV5CdHjzmHH2MCvRfl73osAoeorSs04
         91iHNga5qv4xsU3hOP15zTI7piojNLwi9K0C4lK8m4Mx0VDmrWpmDHS9X5D3/Sszp2NK
         XDNIr3IdCMfaPpAAK7DKf4GubNZz+pRqksYeMF9gMiz2LiG+t9yW1nCftAH1Wph316Tp
         iT6l1X948JRzDe5H+ayWnZmrpSe/LqFQwOPwp7Sorq5tJgHDxfNm63egnIzVnSgYVmcV
         0QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450214; x=1787055014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJUUpA+u/X+Mw8WGuh26FuT0SdK7L1t8Py4ith47VDM=;
        b=Sd7UZYB643xpr9Ra+Gs36O55Oa+c43bLij54yfEs918sQj+pJ/q1ZuSlLYmZUv+Cwc
         htPakF+8nb/YO7urNjPtJiM91NVQ3qpFFacGte19YO+8MernqnT4HgAsOvsOEzaQQcoh
         i7ZVVq5EvukNpxOpoSrj8rGceFC/IVj1KYBD1LfPIo37yq9hdYbBLpJquEk1WoPPdL7K
         jd4xsYeyW/hyePMtG9l/qwsKJJUeNcFofnD6aFGiud60Qx9rA3E+MAuCVxws67PRCa48
         D9bpyOLorj4YTl751c7jSBiuSZXhh+EfkJVDBmDytpNqvQHbGQ3GWLpt8RJT7zZjKNHX
         bjYA==
X-Forwarded-Encrypted: i=1; AHgh+RpCE3U9kltdFAfBNDiQAzIh872k1qMPavSi3H9E9GYcd5TnqIkdCo/Y4l498Gaujd23COhdk0s48M44@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvf+ufsWh9RtE+Zpqt5NVmRDl35tnWkSVZLHEJvm/9JVV3xR6
	LsnTMkk36ShHMxgMcFxsUxzlNDT5hzBFVQ2izWbGm0Og72zJ0iQxHiQi
X-Gm-Gg: AR+sD10tCHLhoj1bAGytrFl2knMXkSCtll4w9HluAzCjcRvkwWUsK386/dypc9aHo13
	LCYk1h0A5og7LqqbdJq+6w48KxsX+QxTgyX9qPsO+fqjHYQQRhGpLRCT/nIj+mfwpR0/wzYW09S
	A9EO3LctXLBe7DNOOmcpfQcAlx6U6J8VAu/syab7KUQAbJuLxkbJIOTy6W9xDO8orC7YZ3Zyln7
	rd/QVJmxeEH5M8Wxl522q3x80poz7Z5wShGRbgsyaEGnz38ZYtRuIUtHQE8Rmoa15BK91e3760+
	dKeCEfSLGidQ11eOLajtu2kKJgZDWx23T100GYfGL3LjwmrRduew1noxp3oZ4/NBk2GwxXPLOU8
	ZchmdgmZNOY7113EehE/rE5l+WnjkHnuulxNQWRXwQd6pXlNErgs9nP1knilpba14Iqz4MHya0Y
	NNrlfe7Q30QO0SZ1xs7/67DVFdwgGc3C7PLxc085KcL3jkyr8x3w4WYki5jOzaVWQ1aNK1ATE=
X-Received: by 2002:a05:6512:12cc:b0:5b0:1b78:4962 with SMTP id 2adb3069b0e04-5b44866ef23mr489653e87.50.1786450213825;
        Tue, 11 Aug 2026 05:10:13 -0700 (PDT)
Received: from hekasnap ([2a00:fd01:82a4:d100:739c:a0f5:97b3:63a7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0a14sm238919e87.1.2026.08.11.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:10:13 -0700 (PDT)
From: Troels Vognbjerg <hekatombe@gmail.com>
To: kamal.wadhwa@oss.qualcomm.com
Cc: alexandre.belloni@bootlin.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	raryan@qti.qualcomm.com,
	robh@kernel.org
Subject: re: [PATCH 0/2] rtc: Add Qualcomm PMIC RTC-GLINK support for Glymur
Date: Tue, 11 Aug 2026 14:10:12 +0200
Message-ID: <20260811121012.7046-1-hekatombe@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com> wrote on Fri, 07 Aug 2026 02:26:29 +0530:
> On some targets like Glymur, the permission for receving the RTC
> alarms is routed to charger firmware running on remote subsystem.
> 
> This is because Glymur boards have to  support MSFT's `TAD feature`
> on the windows OS devices.
> 
> So rtc-pm8xxx.c driver cannot recieve RTC alarm IRQs via SPMI on
> Glymur. So in order to make the IRQ available on the Linux kernel,
> the PMIC RTC Alarm IRQ must be routed to APPS via remote subsystem.
> 
> To implement this, add support for a New Qualcomm PMIC GLINK RTC
> client, which will request for RTC set/get calls for time/alarm IRQ
>  via the existing pmic_glink interface to the charger firmware.
> 
> Also, add a DT property to explicily support enabling the RTC
> writes, keep RTC writes disabled by default to align behaviour
> with the existing rtc-pm8xxx.c driver.

You mentioned this patch series applies to targets like Glymur. Does that include
the ASUS Zenbook A16 UX3607OA, or did ASUS do something different on this
laptop?

The reason I am asking is because when I build this as a kernel module,
I get the following error message:
[    2.241461] rtc-pm8xxx c426000.spmi:pmic@0:rtc@6100: probe with driver rtc-pm8xxx failed with error -2
[    2.499556] Modules linked in: rtc_pm8xxx aes_ce_blk ghash_ce gf128mul sm4_ce_gcm sm4_ce_ccm sm4_ce sm4_ce_cipher sm4 qcom_battmgr rtc_qcom_glink(+) simple_bridge display_connector
[    3.277788] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[    4.318666] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[    4.319085] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: registered as rtc0
[    5.359404] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[    6.400331] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[    6.400496] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: hctosys: unable to read the hardware clock
[   25.447761] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   26.488271] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   27.517573] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   28.560114] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   29.609224] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   30.638629] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   31.677524] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   32.720749] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   33.757662] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   34.808360] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   35.837651] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back

And the error message keeps repeating every second or so.

--
Troels Vognbjerg
